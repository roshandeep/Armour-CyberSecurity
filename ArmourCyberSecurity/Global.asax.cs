using Stripe;
using System;
using System.Web;
using System.Web.Configuration;
using System.Web.Optimization;
using System.Web.Routing;

namespace ArmourCyberSecurity
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            var secretKey = WebConfigurationManager.AppSettings["StripeSecretKey"];
            StripeConfiguration.ApiKey = secretKey;
            
        }

        void Application_BeginRequest(object sender, EventArgs e)
        {
            if (Request.AppRelativeCurrentExecutionFilePath == "~/")
            {
                Response.Redirect("~/Login.aspx");
            }
        }

    }
}