using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Acreage.Models;

namespace Acreage
{
    public class DAL
    {
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;

        SqlCommand cmd;

        public DataTable LoadOpportunityList()
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT opportunity_id, oppotunity_name, opportunty_details, created_by, created_timestamp, expiry_timestamp, opportunity_status, total_amt, amt_left FROM opportunity WHERE is_active = '1' AND opportunity_status = 'Accepted'; ";
            cmd = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }

        public DataTable getUploadedDocs(string investor_id)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT investor_id, uploaded_fileName, file_extension, file_contentType, file_data, filecategory FROM suitability_test_uploadedDoc WHERE investor_id = @investor_id";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }

        public DataTable getFileForDownload(string investor_id, string uploaded_fileName)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT investor_id, uploaded_fileName, file_extension, file_contentType, file_data FROM suitability_test_uploadedDoc WHERE investor_id = @investor_id AND uploaded_fileName = @uploaded_fileName";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
            cmd.Parameters.Add(new SqlParameter("@uploaded_fileName", uploaded_fileName));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }

        public void SaveFile(string filename, string fileExtension, string contentType, byte[] bytes, string filecategory)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "INSERT INTO suitability_test_uploadedDoc(investor_id, uploaded_fileName, file_extension, file_contentType, file_data, filecategory) VALUES(@investor_id, @uploaded_fileName, @file_extension, @file_contentType, @file_data, @filecategory)";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@investor_id", "1"));
            cmd.Parameters.Add(new SqlParameter("@uploaded_fileName", filename));
            cmd.Parameters.Add(new SqlParameter("@file_extension", fileExtension));
            cmd.Parameters.Add(new SqlParameter("@file_contentType", contentType));
            cmd.Parameters.Add(new SqlParameter("@file_data", bytes));
            cmd.Parameters.Add(new SqlParameter("@filecategory", filecategory));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public int checkAllDocuments(string investor_id)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            int count = 0;
            string sql = "SELECT COUNT(filecategory) FROM suitability_test_uploadedDoc WHERE filecategory IN ('Broker Statement', 'Financial Assets', 'T4', 'NOA', 'BankSavings');";
            cmd = new SqlCommand(sql, cnn);
            count = Convert.ToInt32(cmd.ExecuteScalar());
            cnn.Close();
            return count;
        }

        public DataTable LoadOpportunityDetails(string opp_id, string name)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "SELECT opportunity_id, oppotunity_name, opportunity_imgPath, opportunty_details, created_by, created_timestamp, expiry_timestamp, opportunity_status, total_amt, amt_left FROM opportunity WHERE is_active = '1' AND opportunity_status = 'Accepted' AND opportunity_id = @opportunity_id AND oppotunity_name = @oppotunity_name; ";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@opportunity_id", opp_id));
            cmd.Parameters.Add(new SqlParameter("@oppotunity_name", name));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }

        public void SaveKYCAnswers(Models.KYC kyc_obj)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            string sql = "INSERT INTO user_KYC(userid, user_type, salutation, full_name, marital_status, email_address, date_of_birth, phone_no, address_similarity_flag, mailing_address, city, province, postal_code, country, residential_address, residential_city, residential_province, residential_postal_code, residential_country, kyc_timestamp) VALUES(@userid, @user_type, @salutation, @full_name, @marital_status, @email_address, @date_of_birth, @phone_no, @address_similarity_flag, @mailing_address, @city, @province, @postal_code, @country, @residential_address, @residential_city, @residential_province, @residential_postal_code, @residential_country, @kyc_timestamp)";
            cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.Add(new SqlParameter("@userid", kyc_obj.userid));
            cmd.Parameters.Add(new SqlParameter("@user_type", kyc_obj.user_type));
            cmd.Parameters.Add(new SqlParameter("@salutation", kyc_obj.salutation));
            cmd.Parameters.Add(new SqlParameter("@full_name", kyc_obj.full_name));
            cmd.Parameters.Add(new SqlParameter("@marital_status", kyc_obj.marital_status));
            cmd.Parameters.Add(new SqlParameter("@email_address", kyc_obj.email_address));
            cmd.Parameters.Add(new SqlParameter("@date_of_birth", kyc_obj.date_of_birth));
            cmd.Parameters.Add(new SqlParameter("@phone_no", kyc_obj.phone_no));
            cmd.Parameters.Add(new SqlParameter("@address_similarity_flag", kyc_obj.address_similarity_flag));
            cmd.Parameters.Add(new SqlParameter("@mailing_address", kyc_obj.mailing_address));
            cmd.Parameters.Add(new SqlParameter("@city", kyc_obj.mailing_city));
            cmd.Parameters.Add(new SqlParameter("@province", kyc_obj.mailing_province));
            cmd.Parameters.Add(new SqlParameter("@postal_code", kyc_obj.mailing_postal_code));
            cmd.Parameters.Add(new SqlParameter("@country", kyc_obj.mailing_country));
            cmd.Parameters.Add(new SqlParameter("@residential_address", kyc_obj.residential_address));
            cmd.Parameters.Add(new SqlParameter("@residential_city", kyc_obj.residential_city));
            cmd.Parameters.Add(new SqlParameter("@residential_province", kyc_obj.residential_province));
            cmd.Parameters.Add(new SqlParameter("@residential_postal_code", kyc_obj.residential_postal_code));
            cmd.Parameters.Add(new SqlParameter("@residential_country", kyc_obj.residential_country));
            cmd.Parameters.Add(new SqlParameter("@kyc_timestamp", DateTime.Now));
            cmd.ExecuteNonQuery();
            cnn.Close();
        }


        public void SaveSuitabilityTestResults(string investor_id, List<string> questions, List<string> answers)
        {
            SqlConnection cnn = new SqlConnection(connetionString);
            cnn.Open();
            for (int i = 0; i < answers.Count; i++)
            {
                string sql = "INSERT INTO suitability_test_res(investor_id, ques, ans_text) VALUES(@investor_id, @ques, @ans_text);";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add(new SqlParameter("@investor_id", investor_id));
                cmd.Parameters.Add(new SqlParameter("@ques", questions[i]));
                cmd.Parameters.Add(new SqlParameter("@ans_text", answers[i]));
                cmd.ExecuteNonQuery();
            }
            cnn.Close();
        }
    }
}