﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity.Level1
{
    public partial class Level1LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void selfAssessment_Click(object sender, EventArgs e)
        {  
            /**
             * The current page displays the instructions for the self assessment
             * Redirect to the Self Assessment Page
             */

            Response.Redirect("~/Level1/SelfEvaluation.aspx", false);
        }
    }
}