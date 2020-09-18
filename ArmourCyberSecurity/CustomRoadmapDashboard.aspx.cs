using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class CustomRoadmapDashboard : System.Web.UI.Page
    {
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;

        /**
         * The CustomRoadmapDashboard contains the six Section to which the user can navigate.
         * Before the dashboard is displayed it checks whether the user has paid and whether the payment is successfully received from Users table 'Paymentvalidated column'.
         * Displays the user initials if the Session["userInitial"] contains it after successful Login. 
         */

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["paid"] != null)
            {
                using (SqlConnection con = new SqlConnection(connetionString))
                {
                    using (SqlCommand command = new SqlCommand("SELECT PaymentValidated FROM Users WHERE userId = @userId"))
                    {
                        command.Parameters.AddWithValue("@userId", Session["userID"].ToString());
                        command.Connection = con;
                        con.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            Boolean.TryParse(reader["PaymentValidated"].ToString(), out bool premiumStatus);
                            Session["PremiumStatus"] = premiumStatus.ToString();
                        }
                        con.Close();
                    }
                }
            }
            if (Session["PremiumStatus"] == null)
            {
                Response.Redirect("~/Payment/Checkout", true);
            }
            else
            {
                if (Session["PremiumStatus"].ToString() != "True")
                {
                    Response.Redirect("~/Payment/Checkout", true);
                }
            }
            if (Session["userInitial"] != null)
            {
                lbl_userinit.Text = "Logged in as : " + Session["userInitial"].ToString();
            }

            string userId = Session["userID"].ToString();
            CalulateProgress(userId);
        }

        protected void CalulateProgress(string userId)
        {
            DAL dal = new DAL();
            int section1 = dal.CalulateProgress(1, userId);
            progress_barSection1.Attributes.Add("style", "width :" + section1 + "%");
            progress_barSection1.Attributes.Add("aria-valuenow", section1.ToString());
            sec1_score.InnerHtml = section1.ToString() + "%";

            int section2 = dal.CalulateProgress(2, userId);
            progress_barSection2.Attributes.Add("style", "width :" + section2 + "%");
            progress_barSection2.Attributes.Add("aria-valuenow", section2.ToString());
            sec2_score.InnerHtml = section2.ToString() + "%";

            int section3 = dal.CalulateProgress(3, userId);
            progress_barSection3.Attributes.Add("style", "width :" + section3 + "%");
            progress_barSection3.Attributes.Add("aria-valuenow", section3.ToString());
            sec3_score.InnerHtml = section3.ToString() + "%";

            int section4 = dal.CalulateProgress(4, userId);
            progress_barSection4.Attributes.Add("style", "width :" + section4 + "%");
            progress_barSection4.Attributes.Add("aria-valuenow", section4.ToString());
            sec4_score.InnerHtml = section4.ToString() + "%";

            int section5 = dal.CalulateProgress(5, userId);
            progress_barSection5.Attributes.Add("style", "width :" + section5 + "%");
            progress_barSection5.Attributes.Add("aria-valuenow", section5.ToString());
            sec5_score.InnerHtml = section5.ToString() + "%";

            int section6 = dal.CalulateProgress(6, userId);
            progress_barSection6.Attributes.Add("style", "width :" + section6 + "%");
            progress_barSection6.Attributes.Add("aria-valuenow", section6.ToString());
            sec6_score.InnerHtml = section6.ToString() + "%";
        }

    }
}