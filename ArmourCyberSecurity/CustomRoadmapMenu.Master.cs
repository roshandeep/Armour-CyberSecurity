using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class CustomRoadmapMenu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Sec1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Section1.aspx", false);
        }

        protected void btn_Sec2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Section2.aspx", false);
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            int noOfSec = dal.CheckAllSections(Session["questionnaire_userId"].ToString());
            if (noOfSec == 6)
            {
                lbl_warning.Text = "Good Job! All Sections Completed";
                //Response.Redirect("~/CustomRoadMapReport.aspx", false);
            }
            else
            {
                lbl_warning.Text = "Complete All Sections";
            }
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