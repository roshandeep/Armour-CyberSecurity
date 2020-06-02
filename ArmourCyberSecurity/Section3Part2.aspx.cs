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
    public partial class Section3Part2 : System.Web.UI.Page
    {
        string userId = string.Empty;
        public bool ques7Flag = false;

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

        private void Ques7State()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadSectionState(3, userId);
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToInt32(row["stagesCompleted"]) == 3)
                    {
                        if (row["question_type"].ToString() == "Data Subject Access Requests" && row["sec_ref_id"].ToString() == "7" && row["ans_Text"].ToString() == "YES")
                        {
                            ques7Flag = true;
                        }
                        else
                        if (row["question_type"].ToString() == "Data Subject Access Requests" && row["sec_ref_id"].ToString() == "7" && row["ans_Text"].ToString() != "YES")
                        {
                            ques7Flag = false;
                        }
                    }
                }
            }
        }

        private void LoadPreviousState()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadSectionState(3, userId);
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToInt32(row["stagesCompleted"]) == 3)
                    {
                        if (row["question_type"].ToString() == "Data Subject Access Requests")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }
                        }
                        else
                        if (row["question_type"].ToString() == "Data Retention and Removal")
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
            Ques7State();

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadDPALinks(userId);

            if (ddlAns15.SelectedItem.Text == "YES" && ques7Flag)
            {
                txt_Links_15.Enabled = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "3" && row["sec_ref_id"].ToString() == "15")
                    {
                        txt_Links_15.Text = row["dpo_links"].ToString().Replace(",", Environment.NewLine);
                    }
                }
            }
            else
            {
                txt_Links_15.Enabled = false;
                txt_Links_15.Text = "";
            }

            if (ddlAns8.SelectedItem.Text == "YES")
            {
                txt_Links_8.Enabled = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "3" && row["sec_ref_id"].ToString() == "8")
                    {
                        txt_Links_8.Text = row["dpo_links"].ToString().Replace(",", Environment.NewLine);
                    }
                }
            }
            else
            {
                txt_Links_8.Enabled = false;
                txt_Links_8.Text = "";
            }
        }

        private void LoadQuestionnaire()
        {
            Ques7State();

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();
            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToInt32(row["section"]) == 3)
                {
                    var label = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl("lblQues" + row["sec_ref_id"].ToString());
                    if (label != null)
                    {
                        label.Text = row["question"].ToString();
                    }
                    if (row["question_type"].ToString() == "Data Subject Access Requests")
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
                    if (row["question_type"].ToString() == "Data Retention and Removal")
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

                            if (ddl == ddlAns15)
                            {
                                if (ques7Flag)
                                {
                                    txt_Links_15.Enabled = true;
                                }
                                else
                                {
                                    txt_Links_15.Enabled = false;
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void btn_Save3_Click(object sender, EventArgs e)
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

                if (row["question_type"].ToString() == "Data Retention and Removal" && row["section"].ToString() == "3")
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
                                dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 3, secQuesId);
                            }
                            else
                            {
                                answer = ddl.SelectedItem.Text.ToString();
                                answerWt = ddl.SelectedItem.Value.ToString();
                                quesType = row["question_type"].ToString();
                                secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                                dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 3, secQuesId);
                            }

                            if (ddl == ddlAns8)
                            {
                                if (ddl.SelectedItem.Text == "YES")
                                {
                                    txt_Links_8.Enabled = true;
                                    SaveLinks(txt_Links_8.Text, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 3);
                                }
                                else
                                {
                                    txt_Links_8.Enabled = false;
                                    SaveLinks(string.Empty, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 3);
                                }
                            }
                            if (ddl == ddlAns15)
                            {
                                if (ddl.SelectedItem.Text == "YES")
                                {
                                    txt_Links_15.Enabled = true;
                                    SaveLinks(txt_Links_15.Text, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 3);
                                }
                                else
                                {
                                    txt_Links_15.Enabled = false;
                                    SaveLinks(string.Empty, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 3);
                                }
                            }
                        }
                    }
                }
            }

            SetDeafaults(dt, userId, "Data Subject Access Requests", 3);
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
                    if (row["question_type"].ToString() == "Data Subject Access Requests" && row["section"].ToString() == "3")
                    {
                        quesId = Convert.ToInt32(row["question_id"].ToString());
                        answer = "--SELECT--";
                        answerWt = "-1";
                        quesType = row["question_type"].ToString();
                        secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                        dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 3, secQuesId);
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

            Response.Redirect("~/Section3.aspx", false);
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