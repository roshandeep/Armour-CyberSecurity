using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class Section1Part2 : System.Web.UI.Page
    {
        string userId = string.Empty;
        
        /**
         * Section 1 Global Regulations
         */
         
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
            /**
             * Load the answers if the the user has visited this section before.
             * Get the answers form DB and populate the fields.
             */

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
                            var ddl = (DropDownList)this.Master.FindControl("Body").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }

                            var chk = (CheckBoxList)this.Master.FindControl("Body").FindControl("chkbxAns" + row["sec_ref_id"].ToString());
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
                                        LoadReflexiveQuestionState(region["region_name"].ToString());
                                    }
                                }
                            }
                        }
                        else
                        if (row["question_type"].ToString() == "Roles")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("Body").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }
                        }
                    }
                }
            }
        }

        private void LoadReflexiveQuestionState(string region)
        {
            /**
             * The Business logic for the Reflexive Questions As per Level 2 Scoring Sheet V6
             */

            if (region == "Canada")
            {
                lblQues3.Visible = true;
                ddlAns3.Visible = true;
                Ques3Div.Visible = true;

                lblQues7.Visible = true;
                ddlAns7.Visible = true;
                Ques7Div.Visible = true;
            }
            else
            if (region == "Europe")
            {
                lblQues4.Visible = true;
                ddlAns4.Visible = true;
                Ques4Div.Visible = true;

                lblQues8.Visible = true;
                ddlAns8.Visible = true;
                Ques8Div.Visible = true;
            }
            else
            if (region == "California")
            {
                lblQues5.Visible = true;
                ddlAns5.Visible = true;
                Ques5Div.Visible = true;

                lblQues9.Visible = true;
                ddlAns9.Visible = true;
                Ques9Div.Visible = true;
            }
            else
            if (region == "Brazil")
            {
                lblQues6.Visible = true;
                ddlAns6.Visible = true;
                Ques6Div.Visible = true;

                lblQues10.Visible = true;
                ddlAns10.Visible = true;
                Ques10Div.Visible = true;
            }

        }

        private void GetUserId()
        {
            /**
             * Get the User Id for the loggedIn user. Level 2 userId for the Premium user 
             */

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
            /**
             * Load the Level2 questions for Section 1 Part 2 "Regional Fines" 
             * Iterate over the controls and populate the questions.
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            LoadReflexiveQuestions();

            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToInt32(row["section"]) == 1)
                {
                    var label = (Label)this.Master.FindControl("Body").FindControl("lblQues" + row["sec_ref_id"].ToString());
                    if (label != null)
                    {
                        label.Text = row["question"].ToString();
                    }

                    if (row["question_type"].ToString() == "Regional Specific Questions")
                    {
                        if (row["ctrl_type"].ToString() == "dd4")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("Body").FindControl("ddlAns" + row["sec_ref_id"].ToString());
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
                            var chkbx = (CheckBoxList)this.Master.FindControl("Body").FindControl("chkbxAns" + row["sec_ref_id"].ToString());
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
                            var ddl = (DropDownList)this.Master.FindControl("Body").FindControl("ddlAns" + row["sec_ref_id"].ToString());
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

        private void LoadReflexiveQuestions()
        {
            /**
             * Section 1 Part 2 contains Reflexive Questions depending on the the Regions selected in the previous subsection.
             * The function load the questions depending on the state of Section 1 part 1's state
             */

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
                            DAL obj = new DAL();
                            DataTable dt_region = new DataTable();
                            dt_region = dal.LoadRegionL2();
                            foreach (DataRow region in dt_region.Rows)
                            {
                                if (row["ans_Text"].ToString().Contains(region["region_name"].ToString()))
                                {
                                    LoadReflexiveQuestionState(region["region_name"].ToString());
                                }
                            }
                        }
                    }
                }
            }
        }

        private void LoadRegions(CheckBoxList checkBoxList)
        {
            /**
             * Section 1 Part 1 Displays the list of countries which are are in scope for the assessment from the DB
             */

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
            /**
             * Saves the current state of the Questionnaire for the user.
             * The values of the answered questions are saved and and Emty string string/default value is store for the unasnwered questions in the Section
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);
        }

        private void SaveAnswers(DataTable dt)
        {
            /**
             * Saves the current state of the Questionnaire for the user.
             * Save responses individally in a loop
             */

            List<string> ansText = new List<string>();
            DAL dal = new DAL();

            foreach (DataRow row in dt.Rows)
            {
                string quesType = string.Empty, answerWt = string.Empty, answer = string.Empty;
                int quesId, secQuesId;

                if (row["question_type"].ToString() == "Regional Specific Questions")
                {

                    if (row["ctrl_type"].ToString() == "dd4")
                    {
                        var ddl = (DropDownList)this.Master.FindControl("Body").FindControl("ddlAns" + row["sec_ref_id"].ToString());
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
                        var chkbx = (CheckBoxList)this.Master.FindControl("Body").FindControl("chkbxAns" + row["sec_ref_id"].ToString());
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
        }

        protected void btn_Previous_Click(object sender, EventArgs e)
        {
            /**
             * Redirects to the Previous subsection of the respective section while saving the current changes.
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);

            Response.Redirect("~/Section1.aspx", false);
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            /**
             * Redirects to the next subsection of the respective section while saving the current changes.
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);

            Response.Redirect("~/Section1Part3.aspx", false);
        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            /**
             * Redirects to the Customroadmap Dashboard page from the Popup Menu without saving the current changes in the forms
             */

            Response.Redirect("~/CustomRoadmapDashboard.aspx", false);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            /**
             * Redirects to the Customroadmap Dashboard page From the Popup Menu
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);

            Response.Redirect("~/CustomRoadmapDashboard.aspx", false);
        }

        protected void btn_Report_Click(object sender, EventArgs e)
        {
            /**
             * Redirects to the Customroadmap Report page to display the partial/complete result of the Section's assessment.
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);
            Response.Redirect("~/CustomRoadMapReport.aspx", false);
        }

        protected void btn_rtn_dashbrd_Click(object sender, EventArgs e)
        {
            /**
             * Redirects to the Customroadmap Dashboard page from the master menu
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);

            Response.Redirect("~/CustomRoadmapDashboard.aspx", false);
        }
    }
}