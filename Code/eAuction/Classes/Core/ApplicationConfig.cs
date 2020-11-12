using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YCS
{
    public static class ApplicationConfig
    {
        #region Global Variables

        static CustomAppSetting _objCustomAppSetting = new CustomAppSetting();
        static Utility _objUtility = new Utility();

        #endregion

        #region Properties
        public static string Get_Login_Page_URL
        {
            get
            {
                 return _objCustomAppSetting.URL_Root + "/"+ YCS_Configuration.CODE_LOGIN_PAGE_URL;
            }
        }

        public static string Get_Logout_Page_URL
        {
            get
            {
                // return _objCustomAppSetting.URL_Root + "/Logout.aspx";
                return _objCustomAppSetting.URL_Root + "/" + YCS_Configuration.CODE_LOGOUT_PAGE_URL;
            }
        }

        public static string Get_Session_Expired_Page_URL
        {
            get
            {
                return _objCustomAppSetting.URL_Root + "/" + YCS_Configuration.SESSION_EXPIRED_PGAE_URL;
            }
        }

        public static string Get_Default_Page_URL
        {
            get
            {
                return new ManageUserSession().GetDefaultMenu;
            }
        }

        public static string Get_AccessDenied_Page_URL
        {
            get
            {
                return _objCustomAppSetting.URL_Root + "/"  + YCS_Configuration.ACCESS_DENIED_URL;
            }
        }

        public static string Get_ChangePassword_Page_URL
        {
            get
            {
                return _objCustomAppSetting.URL_Root + "/"  + YCS_Configuration.CHNAGE_PASSWORD_URL;
            }
        }

        public static string Get_CustomError_Page_URL
        {
            get
            {
                return _objCustomAppSetting.URL_Root + "/"  + YCS_Configuration.CUSTOM_ERROR_PAGE_URL;
            }
        }

        #endregion

        #region Functions
        public static void RedirectToLoginPage()
        {
            string login_Id = "";
            string token = "";
            if (HttpContext.Current.Request.QueryString != null && HttpContext.Current.Request.QueryString.AllKeys.Contains("Login_Id") && HttpContext.Current.Request.QueryString.AllKeys.Contains("Token"))
            {
                login_Id = HttpContext.Current.Request.QueryString["Login_Id"];
                token = HttpContext.Current.Request.QueryString["Token"];
                HttpContext.Current.Response.Redirect(_objUtility.GetURLForMobileWebView(Get_Session_Expired_Page_URL, login_Id, token));
            }
            else
            {
                HttpContext.Current.Response.Redirect(_objUtility.GetURLForMobileWebView(Get_Login_Page_URL, login_Id, token));
            }
        }

        public static void RedirectToLogoutPage()
        {
            string login_Id = "";
            string token = "";
            if (HttpContext.Current.Request.QueryString != null && HttpContext.Current.Request.QueryString.AllKeys.Contains("Login_Id") && HttpContext.Current.Request.QueryString.AllKeys.Contains("Token"))
            {
                login_Id = HttpContext.Current.Request.QueryString["Login_Id"];
                token = HttpContext.Current.Request.QueryString["Token"];
            }
            HttpContext.Current.Response.Redirect(_objUtility.GetURLForMobileWebView(Get_Logout_Page_URL, login_Id, token));
        }

        public static void RedirectToDefaultPage()
        {
            string default_page_url = Get_Default_Page_URL;
            if (string.IsNullOrEmpty(default_page_url))
            {
                RedirectToAccessDeniedPage();
            }
            else
            {
                string login_Id = "";
                string token = "";
                if (HttpContext.Current.Request.QueryString != null && HttpContext.Current.Request.QueryString.AllKeys.Contains("Login_Id") && HttpContext.Current.Request.QueryString.AllKeys.Contains("Token"))
                {
                    login_Id = HttpContext.Current.Request.QueryString["Login_Id"];
                    token = HttpContext.Current.Request.QueryString["Token"];
                }

                HttpContext.Current.Response.Redirect(_objUtility.GetURLForMobileWebView(default_page_url, login_Id, token));
            }
        }

        public static void RedirectToAccessDeniedPage()
        {
            string login_Id = "";
            string token = "";
            if (HttpContext.Current.Request.QueryString != null && HttpContext.Current.Request.QueryString.AllKeys.Contains("Login_Id") && HttpContext.Current.Request.QueryString.AllKeys.Contains("Token"))
            {
                login_Id = HttpContext.Current.Request.QueryString["Login_Id"];
                token = HttpContext.Current.Request.QueryString["Token"];
            }
            HttpContext.Current.Response.Redirect(_objUtility.GetURLForMobileWebView(Get_AccessDenied_Page_URL, login_Id, token));
        }

        public static void RedirectToChangePasswordPage(bool showMessage = false, string additionalinfo = "Change Password")
        {
            string login_Id = "";
            string token = "";
            if (HttpContext.Current.Request.QueryString != null && HttpContext.Current.Request.QueryString.AllKeys.Contains("Login_Id") && HttpContext.Current.Request.QueryString.AllKeys.Contains("Token"))
            {
                login_Id = HttpContext.Current.Request.QueryString["Login_Id"];
                token = HttpContext.Current.Request.QueryString["Token"];
            }
            string CurrentUrl = _objUtility.ValidateDBNullEmptyValue(_objUtility.GetCurrentURL, "").ToString();
            if (!CurrentUrl.Contains("ChangePassword") && !CurrentUrl.Contains("Logout"))
            {
                if (showMessage)
                {
                    new Message().ShowMessageWithURL(75, _objUtility.GetURLForMobileWebView(Get_ChangePassword_Page_URL, login_Id, token), additionalinfo);
                }
                else
                {
                    HttpContext.Current.Response.Redirect(_objUtility.GetURLForMobileWebView(Get_ChangePassword_Page_URL, login_Id, token));
                }
            }
        }

        public static void RedirectToUpdateProfilePage(string UpdateProfileUrl, bool showMessage = false)
        {
            string login_Id = "";
            string token = "";
            if (HttpContext.Current.Request.QueryString != null && HttpContext.Current.Request.QueryString.AllKeys.Contains("Login_Id") && HttpContext.Current.Request.QueryString.AllKeys.Contains("Token"))
            {
                login_Id = HttpContext.Current.Request.QueryString["Login_Id"];
                token = HttpContext.Current.Request.QueryString["Token"];
            }
            string CurrentUrl = _objUtility.ValidateDBNullEmptyValue(_objUtility.GetCurrentURL, "").ToString();
            if (!string.IsNullOrEmpty(UpdateProfileUrl) && !CurrentUrl.Contains("Business_Owner_Profile") && !CurrentUrl.Contains("Logout"))
            {
                if (showMessage)
                {
                    new Message().ShowMessageWithURL(75, _objUtility.GetURLForMobileWebView(UpdateProfileUrl, login_Id, token), "Update Profile");
                }
                else
                {
                    HttpContext.Current.Response.Redirect(_objUtility.GetURLForMobileWebView(UpdateProfileUrl, login_Id, token));
                }
            }
        }

        #endregion
    }
}