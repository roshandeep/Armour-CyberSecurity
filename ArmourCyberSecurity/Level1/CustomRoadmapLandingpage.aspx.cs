using System;
using System.Collections.Generic;
using System.Linq;
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
                lbl_userinit.Text = "Logged in as : " + Session["userInitial"].ToString();
                div_SignOut.Visible = true;
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

    }
}