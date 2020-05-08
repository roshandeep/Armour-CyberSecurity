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

        }

        protected void btn_questionnaire_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Payment/Checkout.aspx", false);
            //Response.Redirect("~/Section1.aspx", false);
        }
    }
}