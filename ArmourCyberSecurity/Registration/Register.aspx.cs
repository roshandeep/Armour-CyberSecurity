﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;

namespace ArmourCyberSecurity
{
    public partial class Register : System.Web.UI.Page
    {
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;
        //string connetionString = @"Data Source=184.168.47.21;Integrated Security=False;User ID=aihub2020;Connect Timeout=15;Encrypt=False;Password=armourcyber@2020;";
        DAL dal = new DAL();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Function for registering user. We hash and salt the user's password,
        /// generate a new GUID for user ID, and store all values in the database.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RegisterUser(object sender, EventArgs e)
        {
            HashSalt hashSalt = GenerateSaltedHash(16, txtPassword.Text.Trim());
            int result = 0;
            Guid obj = Guid.NewGuid();
            //To check whether the user is a new user or has answered Level 1
            string userId;
            userId = obj.ToString();
            Session["userId"] = userId;

            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_User"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        //We're using our "Insert_User" stored procedure from the database, which includes some detection for already used usernames and emails.
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
                
                //result contains the output of our Insert_User stored procedure.
                //if result is -1, username already exists.
                //if result is -2, email already exists.
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
                        Session["L2emailId"] = txtEmail.Text.Trim();
                        Session["userInitial"] = txtEmail.Text.Substring(0, 2).ToUpper();
                        SendActivationEmail(userId);
                        if(txt_firstName.Text != "" && txt_lastName.Text != "")
                        {
                            string phoneNo, industry, country;
                            if (txt_phoneNumber.Text != "")
                            {
                                phoneNo = txt_phoneNumber.Text.Trim();
                            }
                            else
                            {
                                phoneNo = string.Empty;
                            }
                            if (txt_industry.Text != "")
                            {
                                industry = txt_industry.Text.Trim();
                            }
                            else
                            {
                                industry = string.Empty;
                            }
                            if (txt_country.Text != "")
                            {
                                country = txt_country.Text.Trim();
                            }
                            else
                            {
                                country = string.Empty;
                            }

                            dal.AddOtherInfo(Session["userId"].ToString(), txt_firstName.Text.Trim(), txt_lastName.Text.Trim(), phoneNo, industry, country);
                        }

                        registered = true;
                        break;
                }
                //crude pop up for registration confirmation
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                if (registered == true)
                {
                    Session["RegisterRedirection"] = "Registration";
                    Response.Redirect("~/Login.aspx", false);
                }
            }
        }

        /// <summary>
        /// Function for sending activation email. This is nearly identical to the PasswordResetEmail function in Reset_Password.aspx.
        /// </summary>
        /// <param name="userId"></param>
        private void SendActivationEmail(string userId)
        {
            //create activation code as new Guid
            string activationCode = Guid.NewGuid().ToString();

            //build email which will contain activation code in supplied URL

            string emailAddress = txtEmail.Text.Trim();
            string username = txtEmail.Text.Trim().ToString();
            string email_body = "Hello, " + username + Environment.NewLine;
            email_body = email_body + "Please click the following link to confirm your email and unlock full access to privacycompliance.solutions<br /><br />" + Environment.NewLine;
            email_body = email_body + "<a href = '" + Request.Url.AbsoluteUri.Replace("Registration/Register", "Level1/Account_Activation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>" + Environment.NewLine;
            email_body = email_body + "<br />Privacy Compliance Solutions<br />" + Environment.NewLine;
            email_body = email_body + "Powered by Armour Cybersecurity 2020<br />" + Environment.NewLine;

            MailMessage mm = new MailMessage("info@privacycompliance.solutions", txtEmail.Text.Trim().ToString())
            //MailMessage mm = new MailMessage("roshandeep1995@gmail.com", txtEmail.Text.Trim().ToString())
            {
                Subject = "Confirm Your Email",
                Body = email_body,
                IsBodyHtml = true
            };
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "relay-hosting.secureserver.net";
            smtp.Port = 25;
            //smtp.EnableSsl = true;

            //smtp.Host = "smtp.gmail.com";
            //smtp.Port = 587;
            //smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "info@privacycompliance.solutions";
            NetworkCred.Password = "Aihub@2020";
            //NetworkCred.UserName = "roshandeep1995@gmail.com";
            //NetworkCred.Password = "topjudkygkcytwni";
            smtp.Credentials = NetworkCred;
            smtp.Send(mm);

            //insert activation code into DB

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
        /// <summary>
        /// Class for hashing and salting passwords.
        /// </summary>
        public class HashSalt
        {
            public string Hash { get; set; }
            public string Salt { get; set; }
        }
        /// <summary>
        /// Method for generating hash and salt
        /// </summary>
        /// <param name="size"></param>
        /// <param name="password"></param>
        /// <returns></returns>
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