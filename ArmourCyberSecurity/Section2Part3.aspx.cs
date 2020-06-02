using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class Section2Part3 : System.Web.UI.Page
    {
        string userId = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PremiumStatus"] == null)
            {
                Response.Redirect("~/Payment/Checkout", true);
            }
            else
            {
                if (Session["PremiumStatus"].ToString() != "True")
                {
                    Response.Redirect("~/Payment/Checkout", true);
                }
            }
            GetUserId();

            if (!Page.IsPostBack)
            {
                LoadQuestionnaire();
                LoadPreviousState();
            }
            else
            {

            }
        }

        private void GetUserId()
        {
            DAL dal = new DAL();
            //L2emailId comes from the registration page to login page to L2 Questionnaire
            string emailId = Session["L2emailId"].ToString();

            //For Testing
            //string emailId = "roshandeep810@gmail.com";

            userId = dal.GetUserId(emailId);
            Session["questionnaire_userId"] = userId;
        }

        private void LoadPreviousState()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadSectionState(2, userId);
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToInt32(row["stagesCompleted"]) == 2)
                    {
                        if (row["question_type"].ToString() == "Privacy by Design")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }
                        }
                        else
                        if (row["question_type"].ToString() == "Data Categorization")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }
                        }
                        else
                        if (row["question_type"].ToString() == "Vendor Management")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }
                        }
                        else
                        if (row["question_type"].ToString() == "Privacy Impact Assessment")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }
                        }
                    }
                    LoadLinks(userId);
                }
            }
        }

        private void LoadLinks(string userId)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadDPALinks(userId);
            if (ddlAns16.SelectedItem.Text == "YES")
            {
                txt_Links_16.Enabled = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "2" && row["sec_ref_id"].ToString() == "16")
                    {
                        txt_Links_16.Text = row["dpo_links"].ToString().Replace(",", Environment.NewLine);
                    }
                }
            }
            else
            {
                txt_Links_16.Enabled = false;
                txt_Links_16.Text = "";
            }
            

            if (ddlAns22.SelectedItem.Text == "YES")
            {
                txt_Links_22.Enabled = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "2" && row["sec_ref_id"].ToString() == "22")
                    {
                        txt_Links_22.Text = row["dpo_links"].ToString().Replace(",", Environment.NewLine);
                    }
                }
            }
            else
            {
                txt_Links_22.Enabled = false;
                txt_Links_22.Text = "";
            }
        }

        private void LoadQuestionnaire()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();
            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToInt32(row["section"]) == 2)
                {
                    var label = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl("lblQues" + row["sec_ref_id"].ToString());
                    if (label != null)
                    {
                        label.Text = row["question"].ToString();
                    }
                    if (row["question_type"].ToString() == "Privacy by Design")
                    {
                        if (row["ctrl_type"].ToString() == "dd4")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.Items.Add(new ListItem("YES", row["question_wt_yes"].ToString()));
                                ddl.Items.Add(new ListItem("NO", row["question_wt_no"].ToString()));
                                ddl.Items.Add(new ListItem("SOMEWHAT", row["question_wt_somewhat"].ToString()));
                                ddl.Items.Add(new ListItem("UNSURE", row["question_wt_unsure"].ToString()));
                            }
                        }
                    }
                    else
                    if (row["question_type"].ToString() == "Data Categorization")
                    {
                        if (row["ctrl_type"].ToString() == "dd4")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.Items.Add(new ListItem("YES", row["question_wt_yes"].ToString()));
                                ddl.Items.Add(new ListItem("NO", row["question_wt_no"].ToString()));
                                ddl.Items.Add(new ListItem("SOMEWHAT", row["question_wt_somewhat"].ToString()));
                                ddl.Items.Add(new ListItem("UNSURE", row["question_wt_unsure"].ToString()));
                            }
                        }
                    }
                    else
                    if (row["question_type"].ToString() == "Vendor Management")
                    {
                        if (row["ctrl_type"].ToString() == "dd4")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.Items.Add(new ListItem("YES", row["question_wt_yes"].ToString()));
                                ddl.Items.Add(new ListItem("NO", row["question_wt_no"].ToString()));
                                ddl.Items.Add(new ListItem("SOMEWHAT", row["question_wt_somewhat"].ToString()));
                                ddl.Items.Add(new ListItem("UNSURE", row["question_wt_unsure"].ToString()));
                            }
                        }
                    }
                    else
                    if (row["question_type"].ToString() == "Privacy Impact Assessment")
                    {
                        if (row["ctrl_type"].ToString() == "dd4")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.Items.Add(new ListItem("YES", row["question_wt_yes"].ToString()));
                                ddl.Items.Add(new ListItem("NO", row["question_wt_no"].ToString()));
                                ddl.Items.Add(new ListItem("SOMEWHAT", row["question_wt_somewhat"].ToString()));
                                ddl.Items.Add(new ListItem("UNSURE", row["question_wt_unsure"].ToString()));
                            }
                        }
                    }
                }
            }
        }

        protected void btn_Save2_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);
        }

        private void SaveAnswers(DataTable dt)
        {
            List<string> ansText = new List<string>();
            DAL dal = new DAL();

            foreach (DataRow row in dt.Rows)
            {
                string quesType = string.Empty, answerWt = string.Empty, answer = string.Empty;
                int quesId, secQuesId;

                if (row["question_type"].ToString() == "Vendor Management" && row["section"].ToString() == "2")
                {

                    if (row["ctrl_type"].ToString() == "dd4")
                    {
                        var ddl = ((DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString()));
                        if (ddl != null)
                        {
                            quesId = Convert.ToInt32(row["question_id"].ToString());
                            if (ddl.SelectedIndex == -1)
                            {
                                answer = ddl.SelectedIndex.ToString();
                                answerWt = ddl.SelectedIndex.ToString();
                                quesType = row["question_type"].ToString();
                                secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                                dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 2, secQuesId);
                            }
                            else
                            {
                                answer = ddl.SelectedItem.Text.ToString();
                                answerWt = ddl.SelectedItem.Value.ToString();
                                quesType = row["question_type"].ToString();
                                secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                                dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 2, secQuesId);

                                if (ddl == ddlAns22)
                                {
                                    if (ddl.SelectedItem.Text == "YES")
                                    {
                                        txt_Links_22.Enabled = true;
                                        SaveLinks(txt_Links_22.Text, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 2);
                                    }
                                    else
                                    {
                                        txt_Links_22.Enabled = false;
                                        SaveLinks(string.Empty, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 2);
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
        }

        private void SaveLinks(string links, string userId, string question_type, int sec_ref_id, int stagecompleted)
        {
            DAL dal = new DAL();
            if (links != string.Empty)
            {
                links = Regex.Replace(links.Replace("\r\n", ",").Trim(), @"\s+", ",");
            }
            else
            {
                links = "";
            }
            dal.SaveDPALinks(userId, links, question_type, sec_ref_id, stagecompleted);
        }
        protected void btn_Previous_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);
            Response.Redirect("~/Section2Part2.aspx", false);
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);
            Response.Redirect("~/Section2Part4.aspx", false);
        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomRoadmapDashboard.aspx", false);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);

            Response.Redirect("~/CustomRoadmapDashboard.aspx", false);
        }

        protected void btn_Report_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);
            Response.Redirect("~/CustomRoadMapReport.aspx", false);
        }

        protected void btn_rtn_dashbrd_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);

            Response.Redirect("~/CustomRoadmapDashboard.aspx", false);
        }
    }
}