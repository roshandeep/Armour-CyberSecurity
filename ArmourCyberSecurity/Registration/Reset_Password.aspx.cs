using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity.Registration
{
    public partial class Reset_Password : System.Web.UI.Page
    {
        
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;

        /// <summary>
        /// This function checks the "valid" session variable and confirms it's validity,
        /// and then updates the users password.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ResetClick(object sender, EventArgs e)
        {
            if (bool.TryParse(Session["valid"].ToString(), out bool valid))
            {
                if (valid)
                {
                    //grab userID from session variable
                    string userID = Session["userID"].ToString();

                    //generate new hash and salt
                    HashSalt hashSalt = GenerateSaltedHash(16, txtPassword.Text.Trim().ToString());
                    using (SqlConnection con = new SqlConnection(connetionString))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            //store newly hashed password and salt in DB
                            using (SqlCommand update = new SqlCommand("UPDATE Users SET Password = @Password, Salt = @Salt WHERE userId = @userId"))
                            {
                                update.CommandType = CommandType.Text;
                                update.Parameters.AddWithValue("@userId", userID);
                                update.Parameters.AddWithValue("@Password", hashSalt.Hash);
                                update.Parameters.AddWithValue("@Salt", hashSalt.Salt);
                                update.Connection = con;
                                con.Open();
                                int result = update.ExecuteNonQuery();
                                con.Close();
                                if (result > 0)
                                {
                                    Response.Redirect("~/Level1/LandingPage.aspx", false);
                                    //FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
                                }
                                else
                                {
                                    FailureText.Text = "User not found.";
                                }

                            }

                        }
                    }
                }
            }



        }


        /// <summary>
        /// When this page loads, we capture the forgot password code passed via URL query string. We then compare it to the guid stored in the DB.
        /// After successfully finding it, we delete it from the DB.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //check URL query string for valid forgot password guid
                string forgot_password_code = !string.IsNullOrEmpty(Request.QueryString["ForgotPasswordCode"]) ? Request.QueryString["ForgotPasswordCode"] : Guid.Empty.ToString();
                //not sure if this session variable is currently used anywhere.
                Session["fpcode"] = forgot_password_code; 
                using (SqlConnection con = new SqlConnection(connetionString))
                {
                    using (SqlCommand command = new SqlCommand("SELECT userId FROM ForgotPassword WHERE ForgotPasswordCode = @fpcode"))
                    {
                        command.Parameters.AddWithValue("@fpcode", forgot_password_code);
                        command.Connection = con;
                        con.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            string userID = reader["userId"].ToString();
                            Session["userID"] = userID;
                        }
                        else
                        {
                            //FPCode is not found in database.
                            FailureText.Text = "Invalid email link.";
                        }
                        con.Close();
                    }
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM ForgotPassword WHERE ForgotPasswordCode = @ForgotPasswordCode"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("@ForgotPasswordCode", forgot_password_code);
                            cmd.Connection = con;
                            con.Open();

                            int rowsAffected = cmd.ExecuteNonQuery();
                            con.Close();

                            if (rowsAffected == 1)
                            {
                                //Response.Redirect("~/Login.aspx", false);
                                Session["valid"] = true; //this session is used in the ResetClick function
                            }
                            else
                            {
                                FailureText.Text = "Invalid ForgotPassword code.";
                            }
                        }
                    }
                }

            }
        }
        /// <summary>
        /// This function is deprecated and is currently unused.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="pass"></param>
        /// <returns></returns>
        bool ValidateUser(string user, string pass)
        {

            using (SqlConnection conn = new SqlConnection(connetionString))
            {
                conn.Open();
                //string sql = "select email from users where email = @email and password = @password";
                //SqlCommand cmd = new SqlCommand(sql, conn);
                string passwordSQL = "select password, salt from users where email = @email";
                SqlCommand cmd = new SqlCommand(passwordSQL, conn);
                cmd.Parameters.AddWithValue("@email", user);
                //cmd.Parameters.AddWithValue("@password", Sha1(Salt(pass)));
                //cmd.Parameters.AddWithValue("@password", pass);
                //return cmd.ExecuteScalar() is string;
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
        /// <summary>
        /// This function is used to verify the validity of the entered password
        /// </summary>
        /// <param name="enteredPassword"></param>
        /// <param name="storedHash"></param>
        /// <param name="storedSalt"></param>
        /// <returns></returns>
        public static bool VerifyPassword(string enteredPassword, string storedHash, string storedSalt)
        {
            var saltBytes = Convert.FromBase64String(storedSalt);
            var rfc2898DeriveBytes = new Rfc2898DeriveBytes(enteredPassword, saltBytes, 10000);
            return Convert.ToBase64String(rfc2898DeriveBytes.GetBytes(256)) == storedHash;
        }
        /// <summary>
        /// HashSalt class for hashing and salting
        /// </summary>
        public class HashSalt
        {
            public string Hash { get; set; }
            public string Salt { get; set; }
        }

        /// <summary>
        /// Method for generating salted hash.
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