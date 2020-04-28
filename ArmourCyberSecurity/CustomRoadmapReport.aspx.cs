using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class CustomRoadmapReport : System.Web.UI.Page
    {
        string userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetUserId();

            if (!this.IsPostBack)
            {
                DisplayReport();
            }
        }

        private void GetUserId()
        {
            DAL dal = new DAL();
            //L2emailId comes from the registration page to login page to L2 Questionnaire
            string emailId = Session["L2emailId"].ToString();

            //For Testing
            //string emailId = "roshandeep810@gmail.com";

            userId = dal.GetUserId(emailId);
        }

        private void DisplayReport()
        {
            GlobalRegulationsReport();
            PrivacyEngineeringReport();
            DataControlReport();
            ConsentReport();
            IncidentManagementReport();
            EmployeeTrainingReport();
        }

        private void EmployeeTrainingReport()
        {
            throw new NotImplementedException();
        }

        private void IncidentManagementReport()
        {
            throw new NotImplementedException();
        }

        private void ConsentReport()
        {
            throw new NotImplementedException();
        }

        private void DataControlReport()
        {
            throw new NotImplementedException();
        }

        private void PrivacyEngineeringReport()
        {
            throw new NotImplementedException();
        }

        private void GlobalRegulationsReport()
        {
            
        }
    }
}