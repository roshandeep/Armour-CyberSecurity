using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class SuitabilityTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddl_income_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Balance.Enabled = true;
            foreach(ListItem item in ddl_income.Items)
            {
                if(item != ddl_income.SelectedItem)
                {
                    ListItem li = new ListItem();
                    li.Text = item.Text.ToString();
                    li.Value = item.Value.ToString();
                    ddl_Balance.Items.Add(li);
                }
            }
        }

        protected void ddl_Balance_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Growth.Enabled = true;
            foreach (ListItem item in ddl_Balance.Items)
            {
                if (item != ddl_Balance.SelectedItem)
                {
                    ListItem li = new ListItem();
                    li.Text = item.Text.ToString();
                    li.Value = item.Value.ToString();
                    ddl_Growth.Items.Add(li);
                }
            }
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
            string inv_know = string.Empty, risk_tol = string.Empty, income = string.Empty, balance = string.Empty, growth = string.Empty;

            inv_know = ddl_investmentKnow.SelectedItem.Text;
            questions.Add(lbl_investmentKnow.Text);
            answers.Add(inv_know);

            risk_tol = ddl_riskTolerance.SelectedItem.Text;
            questions.Add(lbl_RiskTolerance.Text);
            answers.Add(risk_tol);

            income = ddl_income.SelectedItem.Text;
            questions.Add(lbl_Income.Text);
            answers.Add(income);

            balance = ddl_Balance.SelectedItem.Text;
            questions.Add(lbl_Balance.Text);
            answers.Add(balance);

            growth = ddl_Growth.SelectedItem.Text;
            questions.Add(lbl_Growth.Text);
            answers.Add(growth);

            DAL dal = new DAL();
            //TESTING
            string investor_id = string.Empty;
            dal.SaveSuitabilityTestResults(investor_id, questions, answers);
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SuitabilityTest2.aspx", false);
        }
    }
}