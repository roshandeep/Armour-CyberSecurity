using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmourCyberSecurity
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisableMenu();
            AdminCheck();
        }

        private void AdminCheck()
        {
            try
            {
                if(Session["UserSession"] != null)
                {
                    if(Session["AdminUser"] != null && Convert.ToBoolean(Session["AdminUser"]) == true)
                    {
                        hlAdmin.Visible = true;
                    }
                }
            }
            catch(Exception ex)
            {

            }
        }

        private void DisableMenu()
        {
            try
            {
                if(Session["UserSession"] == null)
                {
                    hlDashboard.Enabled = false;

                    hlGlobalRegulations.Visible = false;
                    hlPrivacyEngineering.Visible = false;
                    hlDataControl.Visible = false;
                    hlConsent.Visible = false;
                    hlIncidentManagement.Visible = false;
                    hlIncidentManagement.Visible = false;
                    hlEmployeeTraining.Visible = false;

                    hlRegister.Visible = true;

                    hlAdmin.Visible = false;
                }
                else
                {
                    hlDashboard.Enabled = true;

                    hlGlobalRegulations.Enabled = true;
                    hlPrivacyEngineering.Enabled = true;
                    hlDataControl.Enabled = true;
                    hlConsent.Enabled = true;
                    hlIncidentManagement.Enabled = true;
                    hlIncidentManagement.Enabled = true;
                    hlEmployeeTraining.Enabled = true;

                    hlRegister.Visible = false;
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}