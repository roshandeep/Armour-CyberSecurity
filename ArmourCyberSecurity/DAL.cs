﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ArmourCyberSecurity
{
    public class DAL
    {
       string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;

        SqlCommand cmd;

        public DataTable LoadLevel1Questions()
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT question_id, question, question_type, ctrl_type, question_wt_yes, question_wt_no, question_wt_somewhat, question_wt_unsure FROM [ar_sec_Feedback_Questions_level1]";
            cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        //public int ChkLevel2User(string emailId)
        //{
        //    SqlConnection cnn = new SqlConnection(connetionString);
        //    cnn.Open();
        //    string sql = "SELECT COUNT(*) FROM ar_sec_users WHERE email_id = @email_Id AND premium_member = @premium_member AND subscriber = @subscriber";
        //    cmd = new SqlCommand(sql, cnn);
        //    cmd.Parameters.Add(new SqlParameter("@email_Id", emailId));
        //    cmd.Parameters.Add(new SqlParameter("@premium_member", "1"));
        //    cmd.Parameters.Add(new SqlParameter("@subscriber", "1"));
        //    int count = Convert.ToInt32(cmd.ExecuteScalar());
        //    cnn.Close();
        //    return count;
        //}

        public string GetL1UserId(string emailId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT userId FROM ar_sec_users WHERE email_id = @email_Id AND premium_member = @premium_member AND subscriber = @subscriber";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@email_Id", emailId));
            cmd.Parameters.Add(new SqlParameter("@premium_member", "0"));
            cmd.Parameters.Add(new SqlParameter("@subscriber", "0"));
            string userId = cmd.ExecuteScalar().ToString();
            cnn.Close();
            return userId;
        }

        //public int ChkLevel1User(string emailId)
        //{
        //    SqlConnection cnn = new SqlConnection(connetionString);
        //    cnn.Open();
        //    string sql = "SELECT COUNT(*) FROM ar_sec_users WHERE email_id = @email_Id AND premium_member = @premium_member AND subscriber = @subscriber";
        //    cmd = new SqlCommand(sql, cnn);
        //    cmd.Parameters.Add(new SqlParameter("@email_id", emailId));
        //    cmd.Parameters.Add(new SqlParameter("@premium_member", "0"));
        //    cmd.Parameters.Add(new SqlParameter("@subscriber", "0"));
        //    int count = Convert.ToInt32(cmd.ExecuteScalar());
        //    cnn.Close();
        //    return count;
        //}

        public void UpdateL2User(string l2userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "UPDATE ar_sec_users SET level1_complete = @level1_complete WHERE userId = @userId ;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", l2userId));
            cmd.Parameters.Add(new SqlParameter("@level1_complete", "1"));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public void UpdateL1User(string l1userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "UPDATE ar_sec_users SET level2_complete = @level2_complete, premium_member = @premium_member, subscriber = @subscriber WHERE userId = @userId ;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", l1userId));
            cmd.Parameters.Add(new SqlParameter("@level2_complete", "1"));
            cmd.Parameters.Add(new SqlParameter("@premium_member", "1"));
            cmd.Parameters.Add(new SqlParameter("@subscriber", "1"));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public void AddOtherInfo(string userId, string firstname, string lastname, string phoneNo, string industry, string country)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "UPDATE Users SET first_name = @first_name, last_name = @last_name, phoneNo = @phoneNo, industry = @industry, country = @country WHERE userId = @userId ;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@first_name", firstname));
            cmd.Parameters.Add(new SqlParameter("@last_name", lastname));
            cmd.Parameters.Add(new SqlParameter("@phoneNo", phoneNo));
            cmd.Parameters.Add(new SqlParameter("@industry", industry));
            cmd.Parameters.Add(new SqlParameter("@country", country));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public string GetL2UserId(string emailId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT userId FROM Users WHERE Email = @email_Id";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@email_Id", emailId));
            string userId = cmd.ExecuteScalar().ToString();
            cnn.Close();
            return userId;
        }

        public DataTable LoadSectionState(int section, string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT question_id, question_type, ans_Text, answer_wt, sec_ref_id, stagesCompleted FROM ar_sec_User_Feedback_Collection_Level2 WHERE stagesCompleted = @stagesCompleted AND userid = @userid";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@stagesCompleted", section));
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public string GetUserId(string emailId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT DISTINCT userId FROM Users WHERE Username = @email_id";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@email_id", emailId));
            string exsists = cmd.ExecuteScalar().ToString();
            cnn.Close();
            return exsists;
        }


        public DataTable LoadLevel2Questions()
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT question_id, question, question_type, ctrl_type, question_wt_yes, question_wt_no, question_wt_somewhat, question_wt_unsure, sec_ref_id, section FROM [ar_sec_Feedback_Questions_level2]";
            //string sql = "SELECT question_id, question, question_type, ctrl_type, question_wt_yes, question_wt_no, question_wt_somewhat, question_wt_unsure FROM [ar_sec_Feedback_Questions_level2]";
            cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public DataTable GetUserReport(string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT question_id, question_type, answer_wt, ans_Text FROM ar_sec_User_Feedback_Collection_Level1 WHERE userId = @userId";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public void SaveUserL1(string emailId, string userId, string firstName, string lastName)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "INSERT INTO ar_sec_users(userId, userName, email_id, level1_complete, level2_complete, subscriber, premium_member, first_name, last_name) VALUES (@userId, @userName, @email_id, @level1_complete, @level2_complete, @subscriber, @premium_member, @first_name, @last_name);";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@userName", emailId));
            cmd.Parameters.Add(new SqlParameter("@email_id", emailId));
            cmd.Parameters.Add(new SqlParameter("@level1_complete", "1"));
            cmd.Parameters.Add(new SqlParameter("@level2_complete", "0"));
            cmd.Parameters.Add(new SqlParameter("@subscriber", "0"));
            cmd.Parameters.Add(new SqlParameter("@premium_member", "0"));
            cmd.Parameters.Add(new SqlParameter("@first_name", firstName));
            cmd.Parameters.Add(new SqlParameter("@last_name", lastName));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        //public void SaveUserL2(string emailId, string userId)
        //{
        //    SqlConnection cnn = new SqlConnection(connetionString);
        //    cnn.Open();
        //    string sql = "INSERT INTO ar_sec_users(userId, userName, email_id, level1_complete, level2_complete, subscriber, premium_member) VALUES (@userId, @userName, @email_id, @level1_complete, @level2_complete, @subscriber, @premium_member);";
        //    cmd = new SqlCommand(sql, cnn);
        //    cmd.Parameters.Add(new SqlParameter("@userId", userId));
        //    cmd.Parameters.Add(new SqlParameter("@userName", emailId));
        //    cmd.Parameters.Add(new SqlParameter("@email_id", emailId));
        //    cmd.Parameters.Add(new SqlParameter("@level1_complete", "0"));
        //    cmd.Parameters.Add(new SqlParameter("@level2_complete", "1"));
        //    cmd.Parameters.Add(new SqlParameter("@subscriber", "1"));
        //    cmd.Parameters.Add(new SqlParameter("@premium_member", "1"));
        //    cmd.ExecuteNonQuery();
        //    cnn.Close();
        //}

        public int CheckIfUserExists(string email)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("CheckIfUserExists", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@IsExists", 0);
            int rowAffected = cmd.ExecuteNonQuery();
            cnn.Close();
            return rowAffected;
            // rowAffected contains your Result
        }

        public DataTable LoadRegion()
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT region_id, region_name FROM ar_sec_region";
            cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public DataTable LoadRegionL2()
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT region_id, region_name FROM ar_sec_region_l2";
            cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public void SaveAnswers(string userId, int quesId, string quesType, string ansWt, string ansText)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "INSERT INTO ar_sec_User_Feedback_Collection_Level1(userid, question_id, question_type, answer_wt, ans_Text) VALUES (@userId, @quesId, @quesType, @ansWt, @ansText);";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@quesId", quesId));
            cmd.Parameters.Add(new SqlParameter("@quesType", quesType));
            cmd.Parameters.Add(new SqlParameter("@ansWt", ansWt));
            cmd.Parameters.Add(new SqlParameter("@ansText", ansText));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public int CheckSubSectionExsists(string userId, string question_type, int stagesCompleted)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT COUNT(*) FROM ar_sec_User_Feedback_Collection_Level2 WHERE userid = @userid AND question_type = @question_type AND stagesCompleted = @stagesCompleted";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userid", userId));
            cmd.Parameters.Add(new SqlParameter("@question_type", question_type));
            cmd.Parameters.Add(new SqlParameter("@stagesCompleted", stagesCompleted));
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            cnn.Close();
            return count;
        }

        public int CheckAllSections(string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT COUNT(DISTINCT(stagesCompleted)) FROM ar_sec_User_Feedback_Collection_Level2 WHERE userid = @userid";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userid", userId));
            int noOfSec = Convert.ToInt32(cmd.ExecuteScalar());
            cnn.Close();
            return noOfSec;
        }

        public int CheckCurrentSections(string userId, int section)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT COUNT(DISTINCT(stagesCompleted)) FROM ar_sec_User_Feedback_Collection_Level2 WHERE userid = @userid AND stagesCompleted = @stagesCompleted";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userid", userId));
            cmd.Parameters.Add(new SqlParameter("@stagesCompleted", section));
            int complete = Convert.ToInt32(cmd.ExecuteScalar());
            cnn.Close();
            return complete;
        }

        public void SaveLevel2Answers(string userId, int quesId, string quesType, string ansWt, string ansText, int stagesCompleted, int secQuesId)
        {
            string sql = string.Empty;
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            sql = "SELECT DISTINCT COUNT(*) FROM ar_sec_User_Feedback_Collection_Level2 WHERE userid = @userId AND question_id = @quesId AND stagesCompleted = @stagesCompleted;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@quesId", quesId));
            cmd.Parameters.Add(new SqlParameter("@stagesCompleted", stagesCompleted));
            int AnsExists = Convert.ToInt32(cmd.ExecuteScalar());

            if (AnsExists > 0)
            {
                sql = "UPDATE ar_sec_User_Feedback_Collection_Level2 SET userid = @userId, question_id = @quesId, question_type = @quesType, answer_wt = @ansWt, ans_Text = @ansText, sec_ref_id = @sec_ref_id WHERE userid = @userId AND question_id = @quesId AND stagesCompleted = @stagesCompleted;";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                cmd.Parameters.Add(new SqlParameter("@quesId", quesId));
                cmd.Parameters.Add(new SqlParameter("@quesType", quesType));
                cmd.Parameters.Add(new SqlParameter("@ansWt", ansWt));
                cmd.Parameters.Add(new SqlParameter("@ansText", ansText));
                cmd.Parameters.Add(new SqlParameter("@stagesCompleted", stagesCompleted));
                cmd.Parameters.Add(new SqlParameter("@sec_ref_id", secQuesId));
            }
            else
            {
                sql = "INSERT INTO ar_sec_User_Feedback_Collection_Level2(userid, question_id, question_type, answer_wt, ans_Text, stagesCompleted, sec_ref_id) VALUES (@userId, @quesId, @quesType, @ansWt, @ansText, @stagesCompleted, @sec_ref_id);";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                cmd.Parameters.Add(new SqlParameter("@quesId", quesId));
                cmd.Parameters.Add(new SqlParameter("@quesType", quesType));
                cmd.Parameters.Add(new SqlParameter("@ansWt", ansWt));
                cmd.Parameters.Add(new SqlParameter("@ansText", ansText));
                cmd.Parameters.Add(new SqlParameter("@stagesCompleted", stagesCompleted));
                cmd.Parameters.Add(new SqlParameter("@sec_ref_id", secQuesId));
            }
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public void SaveDPA(string userId, string name, string email, string phone, string title, string contact)
        {
            string sql = string.Empty;
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            sql = "SELECT DISTINCT COUNT(*) FROM ar_sec_dpa WHERE userid = @userId ";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            int AnsExists = Convert.ToInt32(cmd.ExecuteScalar());
            if (AnsExists > 0)
            { 
                sql = "UPDATE ar_sec_dpa SET dpa_name = @dpa_name, dpa_email = @dpa_email, dpa_phoneNo = @dpa_phoneNo, dpa_title = @dpa_title, dpa_contact = @dpa_contact WHERE userId = @userId;";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                cmd.Parameters.Add(new SqlParameter("@dpa_name", name));
                cmd.Parameters.Add(new SqlParameter("@dpa_email", email));
                cmd.Parameters.Add(new SqlParameter("@dpa_phoneNo", phone));
                cmd.Parameters.Add(new SqlParameter("@dpa_title", title));
                cmd.Parameters.Add(new SqlParameter("@dpa_contact", contact));
                cmd.ExecuteNonQuery();
            }
            else
            {
                sql = "INSERT INTO ar_sec_dpa(userId, dpa_name, dpa_email, dpa_phoneNo, dpa_title, dpa_contact) VALUES (@userId, @dpa_name, @dpa_email, @dpa_phoneNo, @dpa_title, @dpa_contact);";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                cmd.Parameters.Add(new SqlParameter("@dpa_name", name));
                cmd.Parameters.Add(new SqlParameter("@dpa_email", email));
                cmd.Parameters.Add(new SqlParameter("@dpa_phoneNo", phone));
                cmd.Parameters.Add(new SqlParameter("@dpa_title", title));
                cmd.Parameters.Add(new SqlParameter("@dpa_contact", contact));
                cmd.ExecuteNonQuery();
            }
            cnn.Close();
        }

        public DataTable LoadDPADetails(string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT userId, dpa_name, dpa_email, dpa_phoneNo, dpa_title, dpa_contact FROM ar_sec_dpa WHERE userId = @userId;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public void SaveDPALinks(string userId, string links, string question_type, int sec_ref_id, int stageCompleted)
        {
            string sql = string.Empty;
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            sql = "SELECT DISTINCT COUNT(*) FROM ar_sec_dpaLinks WHERE userid = @userId AND sec_ref_id = @sec_ref_id AND stagesCompleted = @stagesCompleted AND question_type = @question_type ";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@dpo_links", links));
            cmd.Parameters.Add(new SqlParameter("@question_type", question_type));
            cmd.Parameters.Add(new SqlParameter("@sec_ref_id", sec_ref_id));
            cmd.Parameters.Add(new SqlParameter("@stagesCompleted", stageCompleted));
            int AnsExists = Convert.ToInt32(cmd.ExecuteScalar());
            if (AnsExists > 0)
            {
                sql = "UPDATE ar_sec_dpaLinks SET dpo_links = @dpo_links WHERE userId = @userId AND sec_ref_id = @sec_ref_id AND stagesCompleted = @stagesCompleted AND question_type = @question_type";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                cmd.Parameters.Add(new SqlParameter("@dpo_links", links));
                cmd.Parameters.Add(new SqlParameter("@question_type", question_type));
                cmd.Parameters.Add(new SqlParameter("@sec_ref_id", sec_ref_id));
                cmd.Parameters.Add(new SqlParameter("@stagesCompleted", stageCompleted));
                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            else
            {
                sql = "INSERT INTO ar_sec_dpaLinks(userId, dpo_links, question_type, sec_ref_id, stagesCompleted) VALUES (@userId, @dpo_links, @question_type, @sec_ref_id, @stagesCompleted);";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                cmd.Parameters.Add(new SqlParameter("@dpo_links", links));
                cmd.Parameters.Add(new SqlParameter("@question_type", question_type));
                cmd.Parameters.Add(new SqlParameter("@sec_ref_id", sec_ref_id));
                cmd.Parameters.Add(new SqlParameter("@stagesCompleted", stageCompleted));
                cmd.ExecuteNonQuery();
                cnn.Close();
            }
        }

        public DataTable LoadDPALinks(string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT userId, dpo_links, question_type, sec_ref_id, stagesCompleted FROM ar_sec_dpaLinks WHERE userId = @userId;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public DataTable GetReportComments()
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT criteria, low_cmt, med_cmt, high_cmt FROM [ar_sec_Level1_FeedbackReport]";
            cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public int GetQues23Wt()
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT question_wt_yes FROM ar_sec_Feedback_Questions_level1 WHERE question_id = 23";
            cmd = new SqlCommand(sql, cnn);
            int answt = Convert.ToInt32(cmd.ExecuteScalar());
            cnn.Close();
            return answt;
        }


        public DataTable GetLevel2Report(string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT feedback_id, userid, question_id, question_type, answer_wt, ans_Text, ans_Cmt, stagesCompleted, sec_ref_id FROM  ar_sec_User_Feedback_Collection_Level2 WHERE userId = @userId;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public DataTable FillDPADetails(string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT dpa_name, dpa_email, dpa_phoneNo, dpa_title, dpa_contact FROM ar_sec_dpa WHERE userId = @userId;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public DataTable FillDPALinks(string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT dpo_links FROM ar_sec_dpaLinks WHERE userId = @userId;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public DataTable GetLinks(string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT dpo_links, question_type, stagesCompleted, sec_ref_id FROM ar_sec_dpaLinks WHERE userId = @userId;";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnn.Close();
            return ds.Tables[0];
        }

        public int CalulateProgress(int section, string userId)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            int percentage_complete = 0;
            if (section > 1)
            {
                string sql = @"SELECT CAST(
		                            (CAST(
		                            (SELECT COUNT(*)
			                            FROM ar_sec_User_Feedback_Collection_Level2
			                            WHERE userid = @userId
			                            AND stagesCompleted = @section AND ans_Text <> '--SELECT--') AS FLOAT) / 
		                            CAST(
		                            (SELECT COUNT(*) 
			                            FROM ar_sec_Feedback_Questions_level2
			                            WHERE section = @section) AS FLOAT))*100.0 AS INT) 
	                        AS percentage_complete";

                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@section", section));
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                percentage_complete = Convert.ToInt32(cmd.ExecuteScalar());
            }
            else if(section==1)
            {
                string sql1 = @"SELECT DISTINCT selected_countries = STUFF(
                                                     (SELECT ' ' + COALESCE(ans_Text, ' ') FROM ar_sec_User_Feedback_Collection_Level2
					                                    WHERE userid = @userId
					                                    AND stagesCompleted = @section and sec_ref_id IN (1,2)
					                                    FOR XML PATH ('')), 1, 1, '') 
                                    FROM ar_sec_User_Feedback_Collection_Level2
                                    WHERE userid = @userId
                                    AND stagesCompleted = @section";

                cmd = new SqlCommand(sql1, cnn);
                cmd.Parameters.Add(new SqlParameter("@section", section));
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                object nullcheck = cmd.ExecuteScalar();
                string countryList = string.Empty;
                if(nullcheck != null)
                {
                    countryList = cmd.ExecuteScalar().ToString();
                }
                else
                {
                    countryList = "";
                }
                percentage_complete = CalulateProgressHelper(countryList, section, userId);
            }
            cnn.Close();
            return percentage_complete;
        }

        public int CalulateProgressHelper(string countryList, int section, string userId)
        {
            int counter = 0;
            if (!countryList.Contains("Canada"))
            {
                ++counter;
            }
            if (!countryList.Contains("Europe"))
            {
                ++counter;
            }
            if (!countryList.Contains("Brazil"))
            {
                ++counter;
            }
            if (!countryList.Contains("California"))
            {
                ++counter;
            }

            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql1 = @"SELECT COUNT(*) FROM ar_sec_Feedback_Questions_level2 WHERE section = @section";
            cmd = new SqlCommand(sql1, cnn);
            cmd.Parameters.Add(new SqlParameter("@section", section));
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            int quesCount = Convert.ToInt32(cmd.ExecuteScalar());

            string sql2 = @"SELECT COUNT(*)
			                FROM ar_sec_User_Feedback_Collection_Level2
			                WHERE userid = @userId
			                AND stagesCompleted = @section AND ans_Text <> '--SELECT--' ";
            cmd = new SqlCommand(sql2, cnn);
            cmd.Parameters.Add(new SqlParameter("@section", section));
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            int ansCount = Convert.ToInt32(cmd.ExecuteScalar());

            int percentage_complete = (int)(ansCount * 100 / (quesCount - (counter * 2)));

            cnn.Close();
            return percentage_complete;
        }
    }
}