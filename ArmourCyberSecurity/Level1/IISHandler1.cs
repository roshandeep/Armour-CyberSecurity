using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using Stripe;


using System.Web.Script.Serialization;
using System.Web.Configuration;
using Stripe.Checkout;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace ArmourCyberSecurity
{

    [Serializable]
    public class StripeHookResponse
    {
        public long Created { get; set; }
        public string Type { get; set; }
        public bool LiveMode { get; set; }
        public string Id { get; set; }
        public StripeDataObj Data { get; set; }
    }

    [Serializable]
    public class StripeDataObj
    {
        public StripeData Object { get; set; }
    }

    [Serializable]
    public class StripeData
    {
        public double Amount { get; set; }
        public StripeCard Card { get; set; }
    }

    [Serializable]
    public class StripeCard
    {
        public string Country { get; set; }
        public int Exp_Month { get; set; }
        public int Exp_Year { get; set; }
        public string Id { get; set; }
        public int Last4 { get; set; }
        public string Object { get; set; }
        public string Type { get; set; }
    }

    /// <summary>
    /// Handler for Stripe Webhooks
    /// </summary>
    public class IISHandler : IHttpHandler
    {
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;

        public void ProcessRequest(HttpContext context)
        {
            //string connetionString = @"Server=localhost\SQLEXPRESS01;Database=CyberArmourRoshan;Trusted_Connection=True;";
            try
            {
                JavaScriptSerializer js = new JavaScriptSerializer();

                StringBuilder sb = new StringBuilder();
                int streamLength;
                int streamRead;
                Stream s = context.Request.InputStream;
                streamLength = Convert.ToInt32(s.Length);
                Byte[] streamArray = new Byte[streamLength];

                streamRead = s.Read(streamArray, 0, streamLength);

                for (int i = 0; i < streamLength; i++)
                {
                    sb.Append(Convert.ToChar(streamArray[i]));
                }

                string raw = sb.ToString();

                StripeHookResponse stripeResponse = (StripeHookResponse)js.Deserialize(raw, typeof(StripeHookResponse));

                //handle the data received from Stripe

                var stripeEvent = EventUtility.ConstructEvent(raw,
                    HttpContext.Current.Request.Headers["Stripe-Signature"], WebConfigurationManager.AppSettings["MS_WebHookReceiverSecret_Stripe"]);

                var session = stripeEvent.Data.Object as Session;
                
                //var session = stripeEvent.Data.Object as Stripe.Checkout.Session;

                if (stripeEvent.Type == Events.CheckoutSessionCompleted)
                {
                    if (!String.IsNullOrEmpty(session.ClientReferenceId))
                    {
                        
                        using (SqlConnection con = new SqlConnection(connetionString))
                        {
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                using (SqlCommand update = new SqlCommand("UPDATE Users SET PaymentValidated = 1 WHERE userId = @userId"))
                                {   
                                    update.CommandType = CommandType.Text;
                                    update.Parameters.AddWithValue("@userId", session.ClientReferenceId);
                                    update.Connection = con;
                                    con.Open();
                                    int result = update.ExecuteNonQuery();
                                    con.Close();
                                    if (result > 0)
                                    {
                                        //User was found and updated   
                                        context.Response.ContentType = "text/plain";
                                        context.Response.StatusCode = 200;
                                    }
                                    else
                                    {
                                        //User was not found and not updated. Somehow someone has paid but their userID was invalid or lost in the process. This may have to be resolved manually by administrator
                                        context.Response.ContentType = "text/plain";
                                        context.Response.StatusCode = 300;

                                    }

                                }

                            }
                        }
                    }
                    else
                    {
                        context.Response.ContentType = "text/plain";
                        context.Response.StatusCode = 200;
                    }
                    
                }
                else
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.StatusCode = 200;
                }


                //context.Response.ContentType = "text/plain";
                //context.Response.StatusCode = 200;



            }
            catch (Exception e)
            {
                //handle error and tell Stripe that a fault occurred
                context.Response.ContentType = "text/plain";
                context.Response.StatusCode = 305;  //Let Stripe know that this failed
                context.Response.StatusDescription = e.Message + " | " + e.Source;
                Console.WriteLine(e.Message);
                Console.WriteLine(e.StackTrace);
                Console.WriteLine(e.Source);
                MailMessage mm = new MailMessage("info@privacycompliance.solutions", "tjdaniels1212@gmail.com")
                {
                    Subject = "Cyber Armour Exception",
                    Body = "Exception: " + e.Message + "\n" + "Source: " + e.Source + "\n" + "Stack Trace: " + e.StackTrace + "\n"
                    + "Help Link: " + e.HelpLink + "\n" + "Target Site: " + e.TargetSite,
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
                smtp.Credentials = NetworkCred;
                smtp.Send(mm);




                MailMessage mm2 = new MailMessage("roshandeep1995@gmail.com", "tjdaniels1212@gmail.com")
                {
                    Subject = "Cyber Armour Exception",
                    Body = "Exception: " + e.Message + "\n" + "Source: " + e.Source + "\n" + "Stack Trace: " + e.StackTrace + "\n"
                    + "Help Link: " + e.HelpLink + "\n" + "Target Site: " + e.TargetSite,
                    IsBodyHtml = true
                };
                SmtpClient smtp2 = new SmtpClient();
                //smtp.Host = "relay-hosting.secureserver.net";
                //smtp.Port = 25;
                //smtp.EnableSsl = true;

                smtp2.Host = "smtp.gmail.com";
                smtp2.Port = 587;
                smtp2.EnableSsl = true;
                smtp2.DeliveryMethod = SmtpDeliveryMethod.Network;
                NetworkCredential NetworkCred2 = new NetworkCredential();
                //NetworkCred.UserName = "info@privacycompliance.solutions";
                //NetworkCred.Password = "Aihub@2020";
                NetworkCred2.UserName = "roshandeep1995@gmail.com";
                NetworkCred2.Password = "roshandeepsinghsaini";
                smtp2.Credentials = NetworkCred;
                smtp2.Send(mm);
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}