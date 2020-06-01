using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class SuitabilityTest4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            btn_Next.Enabled = true;
            SaveAnswers();
        }

        public void SaveAnswers()
        {
            List<String> questions = new List<String>();
            List<String> answers = new List<String>();
            string finIns = string.Empty, assetType = string.Empty, amount = string.Empty, officer = string.Empty, controlPos = string.Empty;

            finIns = ddl_finIns.SelectedItem.Text;
            questions.Add(lbl_finIns.Text);
            answers.Add(finIns);

            assetType = ddl_assetType.SelectedItem.Text;
            questions.Add(lbl_assetType.Text);
            answers.Add(assetType);

            amount = txt_Amount.Text;
            questions.Add(lbl_Amount.Text);
            answers.Add(amount);

            officer = rdb_officer.SelectedItem.Text;
            questions.Add(lbl_officer.Text);
            answers.Add(officer);

            controlPos = rdb_controlpos.SelectedItem.Text;
            questions.Add(lbl_controlpos.Text);
            answers.Add(controlPos);

            DAL dal = new DAL();
            //TESTING
            string investor_id = string.Empty;
            dal.SaveSuitabilityTestResults(investor_id, questions, answers);
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SuitabilityTest5.aspx", false);
        }
    }
}