using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Configuration;
using System.IO;

namespace ArmourCyberSecurity
{
    public partial class Login : System.Web.UI.Page
    {
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string previousPage;
            if (Request.UrlReferrer != null)
            {
                previousPage = Path.GetFileName(Request.UrlReferrer.AbsolutePath);
                if (previousPage == "Register")
                {
                    lbl_notification.Text = "Check your Email to activate your account.";
                }
                else
                {
                    lbl_notification.Text = "";
                }
            }

            Login1.Focus();

            if(Session["UserSession"] != null)
            {
                if(Session["UserSession"].ToString() == "1")
                {
                    Response.Redirect("~/Payment/Checkout.aspx", true);
                }
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateUser(Login1.UserName.Trim().ToString(), Login1.Password.Trim().ToString()))
                {
                    using (SqlConnection con = new SqlConnection(connetionString))
                    {
                        Session["L2emailId"] = Login1.UserName;
                        using (SqlCommand command = new SqlCommand("SELECT ConfirmedEmail, userId, PaymentValidated FROM Users WHERE Email = @Email"))
                        {
                            command.Parameters.AddWithValue("@Email", Login1.UserName.Trim().ToString());
                            command.Connection = con;
                            con.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.Read())
                            {
                                bool verifiedEmail = Convert.ToBoolean(reader["ConfirmedEmail"]);
                                Session["UserID"] = reader["userId"].ToString();
                                if (verifiedEmail == true)
                                {
                                    Session["UserSession"] = "1";
                                    Session["userInitial"] = Login1.UserName.Substring(0, 2).ToUpper();
                                    Boolean.TryParse(reader["PaymentValidated"].ToString(), out bool premiumStatus);
                                    Session["PremiumStatus"] = premiumStatus.ToString();
                                    con.Close();
                                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);

                                    if (Session["PremiumStatus"].ToString() == "True")
                                    {
                                        Response.Redirect("~/CustomRoadmapDashboard", true);
                                    }


                                    if (Session["RegisterRedirection"] != null)
                                    {
                                        if (Session["RegisterRedirection"].ToString() == "Registration")
                                        {
                                            Session["RegisterRedirection"] = null;
                                            Response.Redirect("~/Payment/Checkout.aspx", true);
                                        }
                                    }
                                    else
                                    {
                                        if (Session["PremiumStatus"].ToString() == "True")
                                        {
                                            Response.Redirect("~/CustomRoadmapDashboard", true);
                                        }
                                        else
                                        {
                                            Response.Redirect("~/Payment/Checkout.aspx", true);
                                        }
                                    }

                                }
                                else
                                {
                                    Login1.FailureText = "This email is not verified. Please check your inbox for a confirmation email.";
                                }
                            }
                            else
                            {
                                //username not found, which is impossible here
                                Login1.FailureText += "This should never happen";
                            }
                        }
                        con.Close();
                    }
                }
                else
                {
                    Login1.FailureText = "Credentials do not match our records.";
                }
            }
            catch(Exception ex)
            {
                Login1.FailureText = "Credentials do not match our records.";
                Response.Write("Credentials do not match our records." + ex.Message);
            }
        }




        bool ValidateUser(string user, string pass)
        {
            using (SqlConnection conn = new SqlConnection(connetionString))
            {
                conn.Open();
                string passwordSQL = "select password, salt from users where email = @email";
                SqlCommand cmd = new SqlCommand(passwordSQL, conn);
                cmd.Parameters.AddWithValue("@email", user);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string salt = reader["salt"].ToString();
                    string hash = reader["password"].ToString();
                    conn.Close();
                    return VerifyPassword(pass, hash, salt);

                }
                else
                {
                    conn.Close();
                    return false;
                }
            }
        }

      
        public static bool VerifyPassword(string enteredPassword, string storedHash, string storedSalt)
        {
            var saltBytes = Convert.FromBase64String(storedSalt);
            var rfc2898DeriveBytes = new Rfc2898DeriveBytes(enteredPassword, saltBytes, 10000);
            return Convert.ToBase64String(rfc2898DeriveBytes.GetBytes(256)) == storedHash;
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

            var hashPassword = Convert.ToBase64String(rfc2898DeriveBytes.GetBytes(256));

            HashSalt hashSalt = new HashSalt { Hash = hashPassword, Salt = salt };
            return hashSalt;
        }

    }
}