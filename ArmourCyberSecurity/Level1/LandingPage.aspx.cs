using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /**
             * Landingpage of the Webite
             * Display User Credentials if the user is logged in.
             */

            //int a = 15;
            //int b = 0;
            //int c = a / b;

            if (!Page.IsPostBack)
            {
                if (Session["UserSession"] != null)
                {
                    if(Session["UserSession"].ToString() == "1")
                    {
                        div_SignIn.Visible = false;
                        div_user_initials.Visible = true;
                        lbl_userinit.Text = "Logged in as : " + Session["userInitial"].ToString();
                        div_SignOut.Visible = true;
                    }
                }
            }
        }


        protected void level1_Click(object sender, EventArgs e)
        {
            /**
             * Redirect to the Self Assessment landing page
             */

            Response.Redirect("~/Level1/Level1LandingPage.aspx", false);
        }

        protected void level2_Click(object sender, EventArgs e)
        {
            /**
             * Redirect to the CustomRoadmap landing page
             */

            Response.Redirect("~/Level1/CustomRoadmapLandingpage.aspx", false);
        }

        protected void btn_SignIn_Click1(object sender, EventArgs e)
        {  
            /**
             * Redirect to the Login page
             */

            Response.Redirect("~/Login.aspx", false);
        }
    }
}