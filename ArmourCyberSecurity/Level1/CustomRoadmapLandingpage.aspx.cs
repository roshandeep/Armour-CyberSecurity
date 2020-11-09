using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class CustomRoadmapLandingpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /**
             * Display the user credentials from the session
             */

            if (Session["userInitial"] != null)
            {
               // lbl_userinit.Text = "Logged in as : " + Session["userInitial"].ToString();
                //div_SignOut.Visible = true;
            }
        }

        protected void btn_questionnaire_Click(object sender, EventArgs e)
        {
            /**
             * Check if the User is a paid member then Redirect to the Custom Roadmap Dashboard page
             * Else Proceed to the payment page
             */

            if (Session["PremiumStatus"] != null)
            {
                if (Session["PremiumStatus"].ToString() == "True")
                {
                    Response.Redirect("~/CustomRoadmapDashboard", true);
                }
                else
                {
                    Session["RegisterRedirection"] = "Registration";
                    Response.Redirect("~/Payment/Checkout.aspx", false);
                }
            }
            else
            {
                Session["RegisterRedirection"] = "Registration";
                Response.Redirect("~/Payment/Checkout.aspx", false);
            }
            
        }

        protected void btn_sendmessage_Click(object sender, EventArgs e)
        {
            string email_body="";
            string name = "", email_id = "", message = "";
            if(txt_fname.Text != null && txt_lname.Text !=null)
            {
                name = txt_fname.Text + " " + txt_lname.Text;
            }
            if (txt_emailid.Text != null)
            {
                email_id = txt_emailid.Text;
            }
            if (txt_msg.Text != null)
            {
                message = txt_msg.Text;
            }
            email_body = "Hello,<br /><br />" + Environment.NewLine;
            email_body = email_body + "An inquiry has been mage by " + name + " ( " + email_id + " ) <br />" + Environment.NewLine;
            email_body = email_body + message + Environment.NewLine;

            //MailMessage mm = new MailMessage("roshandeep1995@gmail.com", "roshandeep1995@gmail.com");
            MailMessage mm = new MailMessage("info@privacycompliance.solutions", "info@privacycompliance.solutions");
            mm.Subject = "Custom Roadmap Inquiry";
            mm.Body = email_body;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            //smtp.Host = "smtp.gmail.com";
            //smtp.Port = 587;
            //smtp.EnableSsl = true;
            smtp.Host = "relay-hosting.secureserver.net";
            smtp.Port = 25;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            NetworkCredential NetworkCred = new NetworkCredential();
            //NetworkCred.UserName = "roshandeep1995@gmail.com";
            //NetworkCred.Password = "topjudkygkcytwni";
            NetworkCred.UserName = "info@privacycompliance.solutions";
            NetworkCred.Password = "Aihub@2020";
            smtp.Credentials = NetworkCred;
            smtp.Send(mm);
        }
    }
}