using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using YCS;

namespace eAuction
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
		
		void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            new Logger().Error(this.ToString(), ex);
            Server.ClearError();
            if (!Response.IsRequestBeingRedirected)
            {
                Response.Redirect(ApplicationConfig.Get_CustomError_Page_URL, true);
            }
        }
		
        protected void Application_PreSendRequestHeaders()
        {
            Response.AppendHeader("X-XSS-Protection", "1; mode=block");
            Response.Headers.Remove("Server");
            Response.Headers.Remove("X-AspNet-Version");
            Response.Headers.Remove("X-AspNetMvc-Version");
            Response.Headers.Add("X-Frame-Options", "SAMEORIGIN");
            Response.Headers.Add("Strict-Transport-Security", "max-age=31536000");
            Response.Headers.Add("Public-Key-Pins", "pin-sha256=&quot;base64+primary==&quot;; pin-sha256=&quot;base64+backup==&quot;; max-age=5184000; includeSubDomains");
            Response.Headers.Add("Pragma", "no-cache");
            Response.Headers.Add("Cache-Control", "no-cache, no-store, must-revalidate, pre-check=0, post-check=0, max-age=0, s-maxage=0");

            if (HttpContext.Current.Request.IsSecureConnection)
            {
                if (Response != null && Response.Cookies.Count > 0)
                {
                    foreach (string key in Response.Cookies.AllKeys)
                    {
                        Response.Cookies[key].Secure = true;
                    }
                }
            }
            //else
            //{
            //    if (Response != null && Response.Cookies.Count > 0)
            //    {
            //        foreach (string key in Response.Cookies.AllKeys)
            //        {
            //            Response.Cookies[key].Secure = false;
            //        }
            //    }
            //}
        }
    }
}