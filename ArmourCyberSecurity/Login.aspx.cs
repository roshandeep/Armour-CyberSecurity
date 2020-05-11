﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Threading.Tasks;
using System.Configuration;
using System.IO;

namespace ArmourCyberSecurity
{
    public partial class Login : System.Web.UI.Page
    {
        //AWS RDS
        //string connetionString = @"Server=armourcyber.czcyf30ks9id.us-east-1.rds.amazonaws.com; Database=ArmourCyberSecurity;User Id=admin;Password=roshandeep;";
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;
        //string connetionString = @"Data Source=184.168.47.21;Integrated Security=False;User ID=aihub2020;Connect Timeout=15;Encrypt=False;Password=armourcyber@2020;";
        protected void Page_Load(object sender, EventArgs e)
        {
            string previousPage = Path.GetFileName(Request.UrlReferrer.AbsolutePath);
            if (previousPage == "Register")
            {
                lbl_notification.Text = "Check your Email to activate your account.";
            }
            else
            {
                lbl_notification.Text = "";
            }

            Login1.Focus();
            if (!String.IsNullOrEmpty(Request.Params["logout"]))
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Level1/LandingPage.aspx");
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (ValidateUser(Login1.UserName.Trim().ToString(), Login1.Password.Trim().ToString()))
            {
                using (SqlConnection con = new SqlConnection(connetionString))
                {
                    Session["L2emailId"] = Login1.UserName;
                    using (SqlCommand command = new SqlCommand("SELECT ConfirmedEmail FROM Users WHERE Email = @Email"))
                    {
                        command.Parameters.AddWithValue("@Email", Login1.UserName.Trim().ToString());
                        command.Connection = con;
                        con.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            bool verifiedEmail = Convert.ToBoolean(reader["ConfirmedEmail"]);
                            if (verifiedEmail == true)
                            {
                                con.Close();
                                FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
                                //Response.Redirect("~/Section1.aspx", true);
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