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
    public partial class Section1Part3 : System.Web.UI.Page
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
                                if (ddl == ddlAns13)
                                {
                                    LoadDPAvalues(userId);
                                }
                                if (ddl == ddlAns14)
                                {
                                    LoadDPALinks(userId);
                                }
                            }
                        }
                    }
                }
            }
        }

        private void LoadDPAvalues(string userId)
        {
            /**
             * Business logic to collect/ignore Data protection Officer details. Person information collected as data
             * As per Level 2 Scoring Sheet V6
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadDPADetails(userId);
            if (ddlAns13.SelectedItem.Text == "YES")
            {
                txt_Name.Enabled = true;
                txt_Name.Enabled = true;
                txt_contact.Enabled = true;
                txt_phone.Enabled = true;
                txt_title.Enabled = true;
                foreach (DataRow row in dt.Rows)
                {
                    txt_Name.Text = row["dpa_name"].ToString();
                    txt_Email.Text = row["dpa_email"].ToString();
                    txt_phone.Text = row["dpa_phoneNo"].ToString();
                    txt_title.Text = row["dpa_title"].ToString();
                    txt_contact.Text = row["dpa_contact"].ToString();
                }
            }
            else
            {
                txt_Name.Enabled = false;
                txt_Name.Enabled = false;
                txt_contact.Enabled = false;
                txt_phone.Enabled = false;
                txt_title.Enabled = false;
            }
        }

        private void LoadDPALinks(string userId)
        {
            /**
             * Business logic to collect/ignore Data protection Authorities details. URLS's collected as data
             * As per Level 2 Scoring Sheet V6
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadDPALinks(userId);
            if (ddlAns14.SelectedItem.Text == "YES")
            {
                txt_dpaLinks.Enabled = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "1")
                    {
                        txt_dpaLinks.Text = row["dpo_links"].ToString().Replace(",", Environment.NewLine);
                    }
                }
            }
            else
            {
                txt_dpaLinks.Enabled = false;
                txt_dpaLinks.Text = "";
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
             * Load the Level2 questions for Section 1 Part 3 "Roles"
             * Iterate over the controls and populate the questions.
             */

            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadLevel2Questions();
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
                
                if (row["question_type"].ToString() == "Roles" && row["section"].ToString() == "1")
                {
                    if (row["ctrl_type"].ToString() == "dd4")
                    {
                        var ddl = ((DropDownList)this.Master.FindControl("Body").FindControl("ddlAns" + row["sec_ref_id"].ToString()));
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

                                if (ddl == ddlAns13)
                                {
                                    if (ddl.SelectedItem.Text == "YES")
                                    {
                                        txt_Name.Enabled = true;
                                        txt_Email.Enabled = true;
                                        txt_phone.Enabled = true;
                                        txt_title.Enabled = true;
                                        txt_contact.Enabled = true;
                                        SaveDPAInfo(userId);
                                    }
                                    else
                                    {
                                        txt_Name.Enabled = false;
                                        txt_Email.Enabled = false;
                                        txt_phone.Enabled = false;
                                        txt_title.Enabled = false;
                                        txt_contact.Enabled = false;
                                        SaveDPAInfo(userId);
                                    }
                                }
                                if (ddl == ddlAns14 && ddl.SelectedItem.Text == "YES")
                                {
                                    if (ddl.SelectedItem.Text == "YES")
                                    {
                                        txt_dpaLinks.Enabled = true;
                                        SaveDPALinks(userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 1);
                                    }
                                    else
                                    {
                                        txt_dpaLinks.Enabled = false;
                                        SaveDPALinks(userId, row["question_type"].ToString(), Convert.ToInt32(row["sec_ref_id"]), 1);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        private void SaveDPALinks(string userId, string question_type, int sec_ref_id, int stagecompleted)
        {
            /**
             * DPA Links are URL's collected from the textbox.
             * Extra spaces and line breaks are removed and stored as comma separated values
             */

            DAL dal = new DAL();
            string links;
            if (txt_dpaLinks.Text != null)
            {
                links = Regex.Replace(txt_dpaLinks.Text.Replace("\r\n", ",").Trim(), @"\s+", ",");
            }
            else
            {
                links = "";
            }
            dal.SaveDPALinks(userId, links, question_type, sec_ref_id, stagecompleted);
        }

        private void SaveDPAInfo(string userId)
        {
            /**
             * DPO informations saved to DB. 
             * If no information is provided an empty value is stored.
             */

            DAL dal = new DAL();
            string name, email, phone, title, contact;
            if (txt_Name.Text != null)
            {
                name = txt_Name.Text.Trim();
            }
            else
            {
                name = "";
            }
            if (txt_Email.Text != null)
            {
                email = txt_Email.Text.Trim();
            }
            else
            {
                email = "";
            }
            if (txt_title.Text != null)
            {
                title = txt_title.Text.Trim();
            }
            else
            {
                title = "";
            }
            if (txt_phone.Text != null)
            {
                phone = txt_phone.Text.Trim();
            }
            else
            {
                phone = "";
            }
            if (txt_contact != null)
            {
                contact = txt_contact.Text.Trim();
            }
            else
            {
                contact = "";
            }
            dal.SaveDPA(userId, name, email, phone, title, contact);
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

            Response.Redirect("~/Section1Part2.aspx", false);
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