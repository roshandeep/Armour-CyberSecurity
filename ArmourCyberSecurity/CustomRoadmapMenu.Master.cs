using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using AjaxControlToolkit;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class CustomRoadmapMenu : System.Web.UI.MasterPage
    {
        /**
         * Displays the user initial from Session after successful login. 
         * This master page is the common header for all the CustomRoadMap assessment pages.
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userInitial"] != null)
            {
                lbl_userinit.Text = "Logged in as : " + Session["userInitial"].ToString();
            }

        }
    }
}