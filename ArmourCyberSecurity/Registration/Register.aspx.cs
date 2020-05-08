using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Threading.Tasks;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;

namespace ArmourCyberSecurity
{
    public partial class Register : System.Web.UI.Page
    {
        //AWS RDS
        //string connetionString = @"Server=armourcyber.czcyf30ks9id.us-east-1.rds.amazonaws.com; Database=ArmourCyberSecurity;User Id=admin;Password=roshandeep;";
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;
        //string connetionString = @"Data Source=184.168.47.21;Integrated Security=False;User ID=aihub2020;Connect Timeout=15;Encrypt=False;Password=armourcyber@2020;";
        DAL dal = new DAL();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterUser(object sender, EventArgs e)
        {
            HashSalt hashSalt = GenerateSaltedHash(16, txtPassword.Text.Trim());
            int result = 0;
            Guid obj = Guid.NewGuid();
            //To check whether the user is a new user or has answered Level 1
            string userId;
            int exsists = dal.ChkLevel1User(txtEmail.Text.Trim());
            if (exsists > 0)
            {
                userId = dal.GetL1UserId(txtEmail.Text.Trim());
                Session["userId"] = userId;
            }
            else
            {
                userId = obj.ToString();
                Session["userId"] = userId;
            }

            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_User"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserID", userId);
                        cmd.Parameters.AddWithValue("@Username", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", hashSalt.Hash);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Salt", hashSalt.Salt);
                        cmd.Connection = con;
                        con.Open();
                        result = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                string message = string.Empty;
                bool registered = false;
                switch (result)
                {
                    case -1:
                        message = "Username already exists.\\nPlease choose a different username.";
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        break;
                    default:
                        message = "Registration successful.\\nAn activation email has been sent.";
                        SendActivationEmail(userId);
                        // Add user in RDSS user table
                        if (exsists > 0)
                        {
                            //Update status of Level1 user to Level 2 user, UNPAID USER
                            dal.UpdateL1User(Session["userId"].ToString()); 
                        }
                        else
                        {
                            //Adding user to the DB who has not completed level 1, NEW USER 
                            dal.SaveUserL2(txtEmail.Text.Trim(), Session["userId"].ToString());
                        }

                        if(txt_firstName.Text != "" && txt_lastName.Text != "" && txt_phoneNumber.Text != "" && txt_industry.Text != "" && txt_country.Text != "")
                        {
                            dal.AddOtherInfo(Session["userId"].ToString(), txt_firstName.Text.Trim(), txt_lastName.Text.Trim(), txt_phoneNumber.Text.Trim(), txt_industry.Text.Trim(), txt_country.Text.Trim());
                        }

                        registered = true;
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                if (registered == true)
                {
                    Response.Redirect("~/Login.aspx", false);
                }
            }
        }


        private void SendActivationEmail(string userId)
        {
            string activationCode = Guid.NewGuid().ToString();
            string emailAddress = txtEmail.Text.Trim();
            string username = txtEmail.Text.Trim().ToString();
            string email_body = "Hello, " + username + Environment.NewLine;
            email_body = email_body + "Please click the following link to confirm your email and unlock full access to PrivacyComplianceSolutions.com<br /><br />" + Environment.NewLine;
            email_body = email_body + "<a href = '" + Request.Url.AbsoluteUri.Replace("Registration/Register", "Level1/Account_Activation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>" + Environment.NewLine;
            email_body = email_body + "<br />Privacy Compliance Group<br />" + Environment.NewLine;
            email_body = email_body + "Powered by Armour Cybersecurity 2020<br />" + Environment.NewLine;

            MailMessage mm = new MailMessage("roshandeep1995@gmail.com", txtEmail.Text.Trim().ToString())
            {
                Subject = "Confirm Your Email",
                Body = email_body,
                IsBodyHtml = true
            };
            SmtpClient smtp = new SmtpClient();
            //smtp.Host = "relay-hosting.secureserver.net";
            //smtp.Port = 25;
            //smtp.EnableSsl = false;
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;

            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            NetworkCredential NetworkCred = new NetworkCredential();
            //NetworkCred.UserName = "david@privacycompliance.group";
            //NetworkCred.Password = "roshandeep@2895";
            NetworkCred.UserName = "roshandeep1995@gmail.com";
            NetworkCred.Password = "roshandeepsinghsaini";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Send(mm);
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO UserActivation VALUES(@UserId, @ActivationCode)"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }

        public class HashSalt
        {
            public string Hash { get; set; }
            public string Salt { get; set; }
        }

        public static HashSalt GenerateSaltedHash(int size, string password)
        {
            var saltBytes = new byte[size];
            var provider = new RNGCryptoServiceProvider();
            provider.GetNonZeroBytes(saltBytes);
            var salt = Convert.ToBase64String(saltBytes);

            var rfc2898DeriveBytes = new Rfc2898DeriveBytes(password, saltBytes, 10000);

            /*
             * Rfc2898DeriveBytes class is used to generate the hash using the RFC2898 specification, 
             * which uses a method known as PBKDF2 (Password Based Key Derivation Function #2) 
             * and is currently recommend by the IETF (Internet Engineering Task Force) for new applications.
             */

            var hashPassword = Convert.ToBase64String(rfc2898DeriveBytes.GetBytes(256));

            HashSalt hashSalt = new HashSalt { Hash = hashPassword, Salt = salt };
            return hashSalt;
        }
    }
}