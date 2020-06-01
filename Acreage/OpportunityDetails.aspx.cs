using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class OpportunityDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Name"] != null)
                {
                    string opp_id = Request.QueryString["Id"].ToString();
                    string name = Request.QueryString["Name"].ToString();
                    ShowopprtunityDetails(opp_id, name);
                }
            }
        }

        private void ShowopprtunityDetails(string opp_id, string name)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadOpportunityDetails(opp_id, name);
            if (dt != null)
            {
                foreach(DataRow row in dt.Rows)
                {
                    lbl_name.Text = row["oppotunity_name"].ToString();
                    lbl_details.Text = row["opportunty_details"].ToString();
                    img_Logo.ImageUrl = Page.ResolveUrl("~/" + row["opportunity_imgPath"].ToString());
                    lbl_created_by.Text = row["created_by"].ToString();
                    lbl_created_timestamp.Text = row["created_timestamp"].ToString();
                    lbl_total_amt.Text = row["total_amt"].ToString();
                    lbl_amt_left.Text = row["amt_left"].ToString();
                    int progress = (int) (Convert.ToDouble(row["amt_left"].ToString()) / Convert.ToDouble(row["total_amt"].ToString()) * 100);
                    progress_bar.Attributes.Add("style", "width:"+ progress + "%");
                    progress_bar.Attributes.Add("aria-valuemax", row["amt_left"].ToString());
                    progress_bar.Attributes.Add("aria-valuenow", row["amt_left"].ToString());
                }
            }
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OpportunityList.aspx", false);
        }
    }
}