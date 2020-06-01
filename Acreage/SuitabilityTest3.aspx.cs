using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class SuitabilityTest3 : System.Web.UI.Page
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
            string timehorizon1 = string.Empty, risktolerance = string.Empty, timehorizon2 = string.Empty;

            timehorizon1 = rdb_timehorizon.SelectedItem.Text;
            questions.Add(lbl_timehorizon.Text);
            answers.Add(timehorizon1);

            risktolerance = rdb_risktolerance.SelectedItem.Text;
            questions.Add(lbl_risktolerance.Text);
            answers.Add(risktolerance);

            timehorizon2 = rdb_timehorizon2.SelectedItem.Text;
            questions.Add(lbl_timehorizon2.Text);
            answers.Add(timehorizon2);

            DAL dal = new DAL();
            //TESTING
            string investor_id = string.Empty;
            dal.SaveSuitabilityTestResults(investor_id, questions, answers);
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SuitabilityTest4.aspx", false);
        }
    }
}