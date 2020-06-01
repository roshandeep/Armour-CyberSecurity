using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class OpportunityList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOpportunities();
            }
        }

        private void LoadOpportunities()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadOpportunityList();
            rpt_Opportunity.DataSource = dt;
            rpt_Opportunity.DataBind();
        }
    }
}