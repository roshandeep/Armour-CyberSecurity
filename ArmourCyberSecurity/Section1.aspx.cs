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
    public partial class Section1 : System.Web.UI.Page
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

        private void LoadPreviousState()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadSectionState(1, userId);
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToInt32(row["stagesCompleted"]) == 1)
                    {
                        if (row["question_type"].ToString() == "Regional Specific Questions")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }

                            var chk = (CheckBoxList)this.Master.FindControl("ContentPlaceHolder1").FindControl("chkbxAns" + row["sec_ref_id"].ToString());
                            if (chk != null)
                            {
                                DAL obj = new DAL();
                                DataTable dt_region = new DataTable();
                                dt_region = dal.LoadRegionL2();
                                foreach (DataRow region in dt_region.Rows)
                                {
                                    if (row["ans_Text"].ToString().Contains(region["region_name"].ToString()))
                                    {
                                        chk.Items.FindByText(region["region_name"].ToString()).Selected = true;
                                    }
                                }
                            }
                        }
                        else
                        if (row["question_type"].ToString() == "Roles")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }
                        }
                    }
                }
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


        private void LoadQuestionnaire()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();
            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToInt32(row["section"]) == 1)
                {
                    var label = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl("lblQues" + row["sec_ref_id"].ToString());
                    if (label != null)
                    {
                        label.Text = row["question"].ToString();
                    }

                    if (row["question_type"].ToString() == "Regional Specific Questions")
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
                        if (row["ctrl_type"].ToString() == "chk")
                        {
                            var chkbx = (CheckBoxList)this.Master.FindControl("ContentPlaceHolder1").FindControl("chkbxAns" + row["sec_ref_id"].ToString());
                            if (chkbx != null)
                            {
                                LoadRegions(chkbx);
                            }
                        }
                    }
                    else
                    if (row["question_type"].ToString() == "Roles")
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

        private void LoadRegions(CheckBoxList checkBoxList)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadRegionL2();

            checkBoxList.DataSource = dt;
            checkBoxList.DataTextField = "region_name";
            checkBoxList.DataValueField = "region_id";
            checkBoxList.DataBind();
        }

        protected void btn_Save1_Click(object sender, EventArgs e)
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

                if (row["question_type"].ToString() == "Regional Specific Questions" && row["section"].ToString() == "1")
                {

                    if (row["ctrl_type"].ToString() == "dd4")
                    {
                        var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                        if (ddl != null)
                        {
                            quesId = Convert.ToInt32(row["question_id"].ToString());
                            if (ddl.SelectedIndex == -1)
                            {

                                answer = ddl.SelectedIndex.ToString();
                                answerWt = ddl.SelectedIndex.ToString();
                                quesType = row["question_type"].ToString();
                                secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                                dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 1, secQuesId);
                            }
                            else
                            {
                                answer = ddl.SelectedItem.Text.ToString();
                                answerWt = ddl.SelectedItem.Value.ToString();
                                quesType = row["question_type"].ToString();
                                secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                                dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 1, secQuesId);
                            }
                        }
                    }
                    else
                    if (row["ctrl_type"].ToString() == "chk")
                    {
                        var chkbx = (CheckBoxList)this.Master.FindControl("ContentPlaceHolder1").FindControl("chkbxAns" + row["sec_ref_id"].ToString());
                        if (chkbx != null)
                        {
                            quesId = Convert.ToInt32(row["question_id"].ToString());
                            if (chkbx.SelectedIndex != -1)
                            {
                                for (int i = 0; i < chkbx.Items.Count; i++)
                                {
                                    if (chkbx.Items[i].Selected == true)
                                    {
                                        answer = answer + chkbx.Items[i].Text + " ,";
                                    }
                                }
                                answerWt = chkbx.Items.Count.ToString();
                                quesType = row["question_type"].ToString();
                                secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                                dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 1, secQuesId);
                            }

                        }
                    }
                }
            }

            SetDeafaults(dt, userId, "Roles", 1);
        }

        public void SetDeafaults(DataTable dt, string userId, string question_type, int stagesCompleted)
        {
            string quesType = string.Empty, answerWt = string.Empty, answer = string.Empty;
            int quesId, secQuesId;

            DAL dal = new DAL();
            int count = dal.CheckSubSectionExsists(userId, question_type, stagesCompleted);
            if (count == 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["question_type"].ToString() == "Roles" && row["section"].ToString() == "1")
                    {
                        quesId = Convert.ToInt32(row["question_id"].ToString());
                        answer = "--SELECT--";
                        answerWt = "-1";
                        quesType = row["question_type"].ToString();
                        secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                        dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 1, secQuesId);
                    }
                }
            }
        }


        protected void btn_Next_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);

            Response.Redirect("~/Section1Part2.aspx", false);
        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);

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