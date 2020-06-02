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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userInitial"] != null)
            {
                lbl_userinit.Text = "Logged in as : " + Session["userInitial"].ToString();
            }

        }

        //protected void btn_Report_Click(object sender, EventArgs e)
        //{
        //    string url = HttpContext.Current.Request.Url.AbsoluteUri;
        //    DAL dal = new DAL();
        //    int complete;
        //    if (Request.UrlReferrer.AbsoluteUri != null)
        //    {
        //        string previousPage = Path.GetFileName(Request.Url.AbsolutePath);
        //        if (previousPage.Contains("Section1"))
        //        {
        //            complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 1);
        //            if(complete > 0)
        //            {
        //                Response.Redirect("~/CustomRoadMapReport.aspx", false);
        //            }
        //            else
        //            {
        //                lbl_warning.Text = "Assessment Incomplete. Save this Sections to view the report.";
        //            }
        //        }
        //        else
        //        if (previousPage.Contains("Section2"))
        //        {
        //            complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 2);
        //            if (complete > 0)
        //            {
        //                Response.Redirect("~/CustomRoadMapReport.aspx", false);
        //            }
        //            else
        //            {
        //                lbl_warning.Text = "Assessment Incomplete. Save this Sections to view the report.";
        //            }
        //        }
        //        else
        //        if (previousPage.Contains("Section3"))
        //        {
        //            complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 3);
        //            if (complete > 0)
        //            {
        //                Response.Redirect("~/CustomRoadMapReport.aspx", false);
        //            }
        //            else
        //            {
        //                lbl_warning.Text = "Assessment Incomplete. Save this Sections to view the report.";
        //            }
        //        }
        //        else
        //        if (previousPage.Contains("Section4"))
        //        {
        //            complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 4);
        //            if (complete > 0)
        //            {
        //                Response.Redirect("~/CustomRoadMapReport.aspx", false);
        //            }
        //            else
        //            {
        //                lbl_warning.Text = "Assessment Incomplete. Save this Sections to view the report.";
        //            }
        //        }
        //        else
        //        if (previousPage.Contains("Section5"))
        //        {
        //            complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 5);
        //            if (complete > 0)
        //            {
        //                Response.Redirect("~/CustomRoadMapReport.aspx", false);
        //            }
        //            else
        //            {
        //                lbl_warning.Text = "Assessment Incomplete. Save this Sections to view the report.";
        //            }
        //        }
        //        else
        //        if (previousPage.Contains("Section6"))
        //        {
        //            complete = dal.CheckCurrentSections(Session["questionnaire_userId"].ToString(), 6);
        //            if (complete > 0)
        //            {
        //                Response.Redirect("~/CustomRoadMapReport.aspx", false);
        //            }
        //            else
        //            {
        //                lbl_warning.Text = "Assessment Incomplete. Save this Sections to view the report.";
        //            }
        //        }
        //    }
        //}

        //protected void btn_rtn_dashbrd_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/CustomRoadmapDashboard.aspx", false);
        //}

        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/CustomRoadmapDashboard.aspx", false);
        //}

        //protected void btnDiscard_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/CustomRoadmapDashboard.aspx", false);
        //}
    }
}