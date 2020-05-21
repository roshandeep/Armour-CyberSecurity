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
            if (Session["userInitial"] != null)
            {
                lbl_userinit.Text = "Logged in as : " + Session["userInitial"].ToString();
            }
            //if (Request.Cookies["userInitial"].Value != null)
            //{
            //    lbl_userinit.Text = "Logged in as : " + Request.Cookies["userInitial"].Value.ToString();
            //}
        }

        protected void btn_questionnaire_Click(object sender, EventArgs e)
        {
            Session["RegisterRedirection"] = "Registration";
            Response.Redirect("~/Payment/Checkout.aspx", false);
        }
    }
}