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
        }

        protected void btn_Sec1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Section1.aspx", false);
        }

        protected void btn_Sec2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Section2.aspx", false);
        }

        protected void btn_Sec3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Section3.aspx", false);
        }

        protected void btn_Sec4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Section4.aspx", false);
        }

        protected void btn_Sec5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Section5.aspx", false);
        }

        protected void btn_Sec6_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Section6.aspx", false);
        }
    }
}