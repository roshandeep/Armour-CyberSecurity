using System;
using System.Collections.Generic;
using System.IO;
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

        //protected void btn_Submit_Click(object sender, EventArgs e)
        //{
        //    DAL dal = new DAL();
        //    int noOfSec = dal.CheckAllSections(Session["questionnaire_userId"].ToString());
        //    if (noOfSec == 6)
        //    {
        //        lbl_warning.Text = "Good Job! All Sections Completed";
        //        btn_Report.Enabled = true;
        //    }
        //    else
        //    {
        //        lbl_warning.Text = "Complete All Sections, Assessment Incomplete.";
        //    }
        //}

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

        protected void btn_Report_Click(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            DAL dal = new DAL();
            int complete;
            if (Request.UrlReferrer.AbsoluteUri != null)
            {
                string previousPage = Path.GetFileName(Request.Url.AbsolutePath);
                if (previousPage == "Section1")
                {
                    complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 1);
                    if(complete > 0)
                    {
                        Response.Redirect("~/CustomRoadMapReport.aspx", false);
                    }
                    else
                    {
                        lbl_warning.Text = "Assessment Incomplete. Complete this Sections to view the report.";
                    }
                }
                else
                if (previousPage == "Section2")
                {
                    complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 2);
                    if (complete > 0)
                    {
                        Response.Redirect("~/CustomRoadMapReport.aspx", false);
                    }
                    else
                    {
                        lbl_warning.Text = "Assessment Incomplete. Complete this Sections to view the report.";
                    }
                }
                else
                if (previousPage == "Section3")
                {
                    complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 3);
                    if (complete > 0)
                    {
                        Response.Redirect("~/CustomRoadMapReport.aspx", false);
                    }
                    else
                    {
                        lbl_warning.Text = "Assessment Incomplete. Complete this Sections to view the report.";
                    }
                }
                else
                if (previousPage == "Section4")
                {
                    complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 4);
                    if (complete > 0)
                    {
                        Response.Redirect("~/CustomRoadMapReport.aspx", false);
                    }
                    else
                    {
                        lbl_warning.Text = "Assessment Incomplete. Complete this Sections to view the report.";
                    }
                }
                else
                if (previousPage == "Section5")
                {
                    complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 5);
                    if (complete > 0)
                    {
                        Response.Redirect("~/CustomRoadMapReport.aspx", false);
                    }
                    else
                    {
                        lbl_warning.Text = "Assessment Incomplete. Complete this Sections to view the report.";
                    }
                }
                else
                if (previousPage == "Section6")
                {
                    complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 6);
                    if (complete > 0)
                    {
                        Response.Redirect("~/CustomRoadMapReport.aspx", false);
                    }
                    else
                    {
                        lbl_warning.Text = "Assessment Incomplete. Complete this Sections to view the report.";
                    }
                }
            }
        }
    }
}