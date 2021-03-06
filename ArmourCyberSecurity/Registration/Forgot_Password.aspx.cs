﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ArmourCyberSecurity
{
    public partial class Forgot_Password : System.Web.UI.Page
    {
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        /// <summary>
        /// This function queries the DB for the user's ID based on their given email,
        /// then sends that user ID to the PasswordResetEmail function
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Forgot_Password_Click(object sender, EventArgs e)
        {
            string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connetionString))
            {
                string userID = null;

                using (SqlCommand command = new SqlCommand("SELECT userId FROM Users WHERE Email = @Email"))
                {
                    command.Parameters.AddWithValue("@Email", txtEmail.Text.Trim().ToString());
                    command.Connection = con;
                    con.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        userID = reader["userId"].ToString();
                        con.Close();
                        PasswordResetEmail(userID);
                        ltMessage.Text = "Check your inbox for a new email titled 'Password Reset'";
                    }
                    else
                    {
                        //no userId found
                        con.Close();
                        ltMessage.Text = "Invalid Forgot Password code.";
                    }
                    
                }
            }



            
        }

        /// <summary>
        /// This function creates a new password reset guid and appends it to a url, and then sends that url to the user via email.
        /// The guid is then added to the database.
        /// </summary>
        /// <param name="userId"></param>
        protected void PasswordResetEmail(string userId)
        {
            //string constr = @"Server=localhost\SQLEXPRESS01;Database=CyberArmourRoshan;Trusted_Connection=True;";
            string forgot_password_code = Guid.NewGuid().ToString();
            string email_body = "Please click the following link to reset your password. <br /><br />" + Environment.NewLine;
            email_body += "<a href = '" + Request.Url.AbsoluteUri.Replace("Registration/Forgot_Password", "Registration/Reset_Password.aspx?ForgotPasswordCode=" + forgot_password_code) + "'>Click here to activate your account.</a>" + Environment.NewLine;
            email_body += "Privacy Compliance Group <br />" + Environment.NewLine;
            email_body += "Powered by Armour CyberSecurity 2020 <br />" + Environment.NewLine;


            //MailMessage mm = new MailMessage("roshandeep1995@gmail.com", txtEmail.Text.Trim().ToString())
            MailMessage mm = new MailMessage("info@privacycompliance.solutions", txtEmail.Text.Trim().ToString())
            {
                Subject = "Password Reset",
                Body = email_body,
                IsBodyHtml = true
            };
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "relay-hosting.secureserver.net";
            smtp.Port = 25;
            //smtp.Host = "smtp.gmail.com";
            //smtp.Port = 587;
            //smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "info@privacycompliance.solutions";
            NetworkCred.Password = "Aihub@2020";
            //NetworkCred.UserName = "roshandeep1995@gmail.com";
            //NetworkCred.Password = "topjudkygkcytwni";
            smtp.Credentials = NetworkCred;
            smtp.Send(mm);

            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO ForgotPassword VALUES(@UserId, @ForgotPasswordCode)"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@ForgotPasswordCode", forgot_password_code);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }

    }
}