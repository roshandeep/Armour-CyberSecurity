using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity.Payment
{
    public partial class Checkout : System.Web.UI.Page
    {
        public string UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInitial"] != null)
            {
                lbl_userinit.Text = "Logged in as : " + Session["userInitial"].ToString();
            }
            if (!String.IsNullOrEmpty(Session["userID"].ToString()))
            {
                this.UserID = Session["userID"].ToString();
            }
            else
            {
                //THIS WILL NEVER HAPPEN IN REAL TIME
                Response.Redirect("~/Level1/LandingPage");
                //This means that there was no userID stored in the session. This will cause payment issues, so this should redirect to Level2 Landing Page
            }
        }
    }
}