using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity.Level1
{
    public partial class Admin : System.Web.UI.Page
    {
        string connetionString = ConfigurationManager.ConnectionStrings["connetionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
            if (!Page.IsPostBack)
            {
                Refresh_Data();
            }
        }

        private void Refresh_Data()
        {
            SqlConnection conn = new SqlConnection(connetionString);
            try
            {
                DataTable dataTable = new DataTable();
                conn.Open();
                SqlCommand cmd = new SqlCommand
                    ("SELECT userId, first_name, last_name, Email, industry, country, phoneNo, PaymentValidated from [dbo].[Users]");
                cmd.Connection = conn;

                SqlDataReader rdr = cmd.ExecuteReader();
                dataTable.Columns.Add("ID");
                dataTable.Columns.Add("first_name");
                dataTable.Columns.Add("last_name");
                dataTable.Columns.Add("Email");
                dataTable.Columns.Add("industry");
                dataTable.Columns.Add("country");
                dataTable.Columns.Add("phoneNo");
                dataTable.Columns.Add("selfAssessmentComplete");
                dataTable.Columns.Add("selfAssessmentDate");
                dataTable.Columns.Add("PaymentValidated");
                dataTable.Columns.Add("PercentageCompleted");

                while (rdr.Read())
                {
                    DataRow row = dataTable.NewRow();
                    row["ID"] = rdr["userId"];
                    row["first_name"] = rdr["first_name"];
                    row["last_name"] = rdr["last_name"];
                    row["Email"] = rdr["Email"];
                    row["industry"] = rdr["industry"];
                    row["country"] = rdr["country"];
                    row["phoneNo"] = rdr["phoneNo"];
                    row["selfAssessmentComplete"] = SelfAssessmentCheck(rdr["Email"].ToString());
                    row["selfAssessmentDate"] = GetSelfAssessmentDate(rdr["Email"].ToString());
                    row["PaymentValidated"] = rdr["PaymentValidated"];
                    row["PercentageCompleted"] = CalculateTotalPercent(rdr["userId"].ToString());
                    dataTable.Rows.Add(row);
                }

                if (dataTable.Rows.Count > 0)
                {
                    userGrid.DataSource = dataTable;
                    userGrid.DataBind();
                }
                else
                {
                    DataRow newrow = dataTable.NewRow();
                    dataTable.Rows.Add(newrow);
                    userGrid.DataSource = dataTable;
                    userGrid.DataBind();
                    int columncount = userGrid.Columns.Count;
                    if (columncount == 0)
                    {
                        BoundField newColumnName = new BoundField();

                        newColumnName.DataField = "New DATAfield Name";
                        newColumnName.HeaderText = "Users";
                        userGrid.Columns.Add(newColumnName);
                        columncount += 1;
                    }
                    userGrid.Rows[0].Cells.Clear();
                    userGrid.Rows[0].Cells.Add(new TableCell());
                    userGrid.Rows[0].Cells[0].ColumnSpan = columncount + 2;
                    userGrid.Rows[0].Cells[0].Text = "No Records Found";
                }

                conn.Close();
                ViewState["dirState"] = dataTable;
                ViewState["sortdr"] = "Asc";
                userGrid.PageIndex = 0;
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
                Console.WriteLine(ex.Source);

                lblError.Text = "An error occurred when calling database. Please alert site admin to this issue.";
                lblError.Visible = true;
            }
        }

        private string GetSelfAssessmentDate(string emailId)
        {
            string selfAssessment_Date = "";
            SqlConnection conn = new SqlConnection(connetionString);
            conn.Open();
            SqlCommand cmd;
            string sql = @"SELECT TOP 1 ISNULL(CONVERT(VARCHAR, date_created, 101), 'NOT FOUND')  
                            FROM ar_sec_users WHERE email_id = @email_Id ORDER BY date_created DESC";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@email_Id", emailId));
            if (cmd.ExecuteScalar() == null)
            {
                selfAssessment_Date = "NOT FOUND";
            }
            else
            {
                selfAssessment_Date = cmd.ExecuteScalar().ToString();
            }
            conn.Close();
            return selfAssessment_Date;
        }

        private bool SelfAssessmentCheck(string emailId)
        {
            SqlConnection conn = new SqlConnection(connetionString);
            conn.Open();
            SqlCommand cmd;
            string sql = "SELECT COUNT(*) FROM ar_sec_users WHERE email_id = @email_Id";
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@email_Id", emailId));
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            if (count > 0)
            {
                return true;
            }
            return false;
        }

        private object CalculateTotalPercent(string userId)
        {
            int sum = 0;
            for(int section = 1; section <= 6; section++)
            {
                sum = CalculatePercent(userId, section) + sum;
            }
            return sum / 6;
        }

        protected int CalculatePercent(string userId, int section)
        {
            SqlConnection conn = new SqlConnection(connetionString);
            conn.Open();
            SqlCommand cmd;
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

                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add(new SqlParameter("@section", section));
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                percentage_complete = Convert.ToInt32(cmd.ExecuteScalar());
            }
            else if (section == 1)
            {
                string sql1 = @"SELECT DISTINCT selected_countries = STUFF(
                                                    (SELECT ' ' + COALESCE(ans_Text, ' ') FROM ar_sec_User_Feedback_Collection_Level2
					                                WHERE userid = @userId
					                                AND stagesCompleted = @section and sec_ref_id IN (1,2)
					                                FOR XML PATH ('')), 1, 1, '') 
                                FROM ar_sec_User_Feedback_Collection_Level2
                                WHERE userid = @userId
                                AND stagesCompleted = @section";

                cmd = new SqlCommand(sql1, conn);
                cmd.Parameters.Add(new SqlParameter("@section", section));
                cmd.Parameters.Add(new SqlParameter("@userId", userId));
                object nullcheck = cmd.ExecuteScalar();
                string countryList = string.Empty;
                if (nullcheck != null)
                {
                    countryList = cmd.ExecuteScalar().ToString();
                }
                else
                {
                    countryList = "";
                }
                percentage_complete = CalulateProgressHelper(countryList, section, userId);
            }
            conn.Close();
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
            SqlConnection conn = new SqlConnection(connetionString);
            conn.Open();
            SqlCommand cmd;
            string sql1 = @"SELECT COUNT(*) FROM ar_sec_Feedback_Questions_level2 WHERE section = @section";
            cmd = new SqlCommand(sql1, conn);
            cmd.Parameters.Add(new SqlParameter("@section", section));
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            int quesCount = Convert.ToInt32(cmd.ExecuteScalar());

            string sql2 = @"SELECT COUNT(*)
			                FROM ar_sec_User_Feedback_Collection_Level2
			                WHERE userid = @userId
			                AND stagesCompleted = @section AND ans_Text <> '--SELECT--' ";
            cmd = new SqlCommand(sql2, conn);
            cmd.Parameters.Add(new SqlParameter("@section", section));
            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            int ansCount = Convert.ToInt32(cmd.ExecuteScalar());

            int percentage_complete = (int)(ansCount * 100 / (quesCount - (counter * 2)));
            conn.Close();
            return percentage_complete;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(connetionString);
            GridViewRow row = userGrid.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[Users] WHERE userId = @Id", conn);
            cmd.Parameters.AddWithValue("@Id", userGrid.DataKeys[e.RowIndex].Value.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            Refresh_Data();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            userGrid.EditIndex = e.NewEditIndex;
            Refresh_Data();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection(connetionString);
            string userid = userGrid.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = userGrid.Rows[e.RowIndex];
            _ = (Label)row.FindControl("lblID");
            TextBox textemail = (TextBox)row.FindControl("txtEmail");
            TextBox textFirstName = (TextBox)row.FindControl("txtFirstName");
            TextBox textLastName = (TextBox)row.FindControl("txtLastName");
            TextBox textIndustry = (TextBox)row.FindControl("txtIndustry");
            TextBox textCountry = (TextBox)row.FindControl("txtCountry");
            TextBox textphone = (TextBox)row.FindControl("txtPhone");
            TextBox textPayment = (TextBox)row.FindControl("txtPaymentValidated");

            userGrid.EditIndex = -1;
            conn.Open();  
            SqlCommand cmd = new SqlCommand("UPDATE [dbo].[Users] SET Email='" + textemail.Text + "',phoneNo='" + textphone.Text + "'WHERE userId='" + userid + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Refresh_Data();  
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            userGrid.PageIndex = e.NewPageIndex;
            Refresh_Data();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            userGrid.EditIndex = -1;
            Refresh_Data();
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                userGrid.DataSource = dtrslt;
                userGrid.DataBind();
            }

        }


    }
}