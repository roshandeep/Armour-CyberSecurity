using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class SuitabilityTest2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            btn_Next.Enabled = true;
            SaveAnswers();
        }

        private void SaveAnswers()
        {
            List<String> questions = new List<String>();
            List<String> answers = new List<String>();
            string annual = string.Empty, household = string.Empty, finassets = string.Empty, netassets = string.Empty;

            annual = ddl_annualincome.SelectedItem.Text;
            questions.Add(lbl_annualincome.Text);
            answers.Add(annual);

            household = ddl_household.SelectedItem.Text;
            questions.Add(lbl_household.Text);
            answers.Add(household);

            finassets = ddl_finAssets.SelectedItem.Text;
            questions.Add(lbl_finAssets.Text);
            answers.Add(finassets);

            netassets = ddl_netAssets.SelectedItem.Text;
            questions.Add(lbl_netAssets.Text);
            answers.Add(netassets);

            DAL dal = new DAL();
            //TESTING
            string investor_id = string.Empty;
            dal.SaveSuitabilityTestResults(investor_id, questions, answers);
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SuitabilityTest3.aspx", false);
        }
    }
}