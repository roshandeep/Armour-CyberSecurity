﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class Section5 : System.Web.UI.Page
    {
        string userId = string.Empty;

        /**
         * Section 5 Incident Management
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

        private void LoadPreviousState()
        {
            /**
             * Load the answers if the the user has visited this section before.
             * Get the answers form DB and populate the fields.
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadSectionState(5, userId);
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToInt32(row["stagesCompleted"]) == 5)
                    {
                        if (row["question_type"].ToString() == "Incident Response Plan")
                        {
                            var ddl = (DropDownList)this.Master.FindControl("ContentPlaceHolder1").FindControl("ddlAns" + row["sec_ref_id"].ToString());
                            if (ddl != null)
                            {
                                ddl.SelectedValue = row["answer_wt"].ToString();
                            }
                        }
                        else
                        if (row["question_type"].ToString() == "Notifications")
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
            /**
             * Business logic to collect/ignore URL's.
             * As per Level 2 Scoring Sheet V6.
             * The function displays links to be edited if they were populated previously. 
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadDPALinks(userId);
            if (ddlAns1.SelectedItem.Text == "YES")
            {
                txt_Links_1.Enabled = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "5" && row["sec_ref_id"].ToString() == "1")
                    {
                        txt_Links_1.Text = row["dpo_links"].ToString().Replace(",", Environment.NewLine);
                    }
                }
            }
            else
            {
                txt_Links_1.Enabled = false;
                txt_Links_1.Text = "";
            }

            if (ddlAns3.SelectedItem.Text == "YES")
            {
                txt_Links_3.Enabled = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "5" && row["sec_ref_id"].ToString() == "3")
                    {
                        txt_Links_3.Text = row["dpo_links"].ToString().Replace(",", Environment.NewLine);
                    }
                }
            }
            else
            {
                txt_Links_3.Enabled = false;
                txt_Links_3.Text = "";
            }

            if (ddlAns19.SelectedItem.Text == "YES")
            {
                txt_Links_19.Enabled = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "5" && row["sec_ref_id"].ToString() == "19")
                    {
                        txt_Links_19.Text = row["dpo_links"].ToString().Replace(",", Environment.NewLine);
                    }
                }
            }
            else
            {
                txt_Links_19.Enabled = false;
                txt_Links_19.Text = "";
            }
           
        }

        private void LoadQuestionnaire()
        {
            /**
             * Load the Level2 questions for Section 5 Part 1 "Incident Response Plan"
             * Iterate over the controls and populate the questions.
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();
            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToInt32(row["section"]) == 5)
                {
                    var label = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl("lblQues" + row["sec_ref_id"].ToString());
                    if (label != null)
                    {
                        label.Text = row["question"].ToString();
                    }
                    if (row["question_type"].ToString() == "Incident Response Plan")
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
                    if (row["question_type"].ToString() == "Notifications")
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

        protected void btn_Save5_Click(object sender, EventArgs e)
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

                if (row["question_type"].ToString() == "Incident Response Plan" && row["section"].ToString() == "5")
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
                                dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 5, secQuesId);
                            }
                            else
                            {
                                answer = ddl.SelectedItem.Text.ToString();
                                answerWt = ddl.SelectedItem.Value.ToString();
                                quesType = row["question_type"].ToString();
                                secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                                dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 5, secQuesId);

                                if (ddl == ddlAns1)
                                {
                                    if (ddl.SelectedItem.Text == "YES")
                                    {
                                        txt_Links_1.Enabled = true;
                                        SaveLinks(txt_Links_1.Text, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 5);
                                    }
                                    else
                                    {
                                        txt_Links_1.Enabled = false;
                                        SaveLinks(string.Empty, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 5);
                                    }
                                }
                                if (ddl == ddlAns3)
                                {
                                    if (ddl.SelectedItem.Text == "YES")
                                    {
                                        txt_Links_3.Enabled = true;
                                        SaveLinks(txt_Links_3.Text, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 5);
                                    }
                                    else
                                    {
                                        txt_Links_3.Enabled = false;
                                        SaveLinks(string.Empty, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 5);
                                    }
                                }
                                if (ddl == ddlAns19)
                                {
                                    if (ddl.SelectedItem.Text == "YES")
                                    {
                                        txt_Links_19.Enabled = true;
                                        SaveLinks(txt_Links_19.Text, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 5);
                                    }
                                    else
                                    {
                                        txt_Links_19.Enabled = false;
                                        SaveLinks(string.Empty, userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 5);
                                    }
                                }
                            }
                        }
                    }
                }
                
            }

            SetDeafaults(dt, userId, "Notifications", 5);
        }

        public void SetDeafaults(DataTable dt, string userId, string question_type, int stagesCompleted)
        {
            /**
             * Sets defaults values for the unanswered questions of the section and all sub sections of the respective section.
             */

            string quesType = string.Empty, answerWt = string.Empty, answer = string.Empty;
            int quesId, secQuesId;

            DAL dal = new DAL();
            int count = dal.CheckSubSectionExsists(userId, question_type, stagesCompleted);
            if (count == 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["question_type"].ToString() == "Notifications" && row["section"].ToString() == "5")
                    {
                        quesId = Convert.ToInt32(row["question_id"].ToString());
                        answer = "--SELECT--";
                        answerWt = "-1";
                        quesType = row["question_type"].ToString();
                        secQuesId = Convert.ToInt32(row["sec_ref_id"]);
                        dal.SaveLevel2Answers(userId, quesId, quesType, answerWt, answer, 5, secQuesId);
                    }
                }
            }
        }

        private void SaveLinks(string links, string userId, string question_type, int sec_ref_id, int stagecompleted)
        {
            /**
             * Links are URL's collected from the textbox.
             * Extra spaces and line breaks are removed and stored as comma separated values
             */

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

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            /**
             * Redirects to the Next subsection of the respective section while saving the current changes.
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();

            SaveAnswers(dt);
            Response.Redirect("~/Section5Part2.aspx", false);
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