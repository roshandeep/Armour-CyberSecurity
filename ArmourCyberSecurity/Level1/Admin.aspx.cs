using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity.Level1
{
    public partial class Admin : System.Web.UI.Page
    {
        readonly SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnetionString"].ConnectionString);
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
                dataTable.Columns.Add("PaymentValidated");


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
                    row["PaymentValidated"] = rdr["PaymentValidated"];
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
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
            string userid = userGrid.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = userGrid.Rows[e.RowIndex];
            _ = (Label)row.FindControl("lblID");
            //TextBox txtname=(TextBox)gr.cell[].control[];  
            //TextBox textemail = (TextBox)row.Cells[0].Controls[0];
            //TextBox textphone = (TextBox)row.Cells[1].Controls[0];
            TextBox textemail = (TextBox)row.FindControl("txtEmail");
            TextBox textFirstName = (TextBox)row.FindControl("txtFirstName");
            TextBox textLastName = (TextBox)row.FindControl("txtLastName");
            TextBox textIndustry = (TextBox)row.FindControl("txtIndustry");
            TextBox textCountry = (TextBox)row.FindControl("txtCountry");
            TextBox textphone = (TextBox)row.FindControl("txtPhone");
            TextBox textPayment = (TextBox)row.FindControl("txtPaymentValidated");
            //TextBox textc = (TextBox)row.Cells[2].Controls[0];
            //TextBox textadd = (TextBox)row.FindControl("txtadd");  
            //TextBox textc = (TextBox)row.FindControl("txtc");  

            userGrid.EditIndex = -1;
            conn.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
            SqlCommand cmd = new SqlCommand("UPDATE [dbo].[Users] SET Email='" + textemail.Text + "',phoneNo='" + textphone.Text + "'WHERE userId='" + userid + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Refresh_Data();
            //GridView1.DataBind();  
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