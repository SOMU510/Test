using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YCS
{
    public class YCS_Configuration
    {
        public const string BROWSER_TITLE_BAR_PRODUCT_NAME = "e-Auction";
        public const string LOGIN_PAGE_PRODUCT_NAME = "e-Auction";
        public const string HOME_PAGE_PRODUCT_NAME = "e-Auction";
        public const string HOME_PAGE_COLLAPSE_PRODUCT_NAME = "e-Auction";//somu
        public const string HOME_PAGE_PRODUCT_ICON_FILE_PATH = "";
        public const string HOME_PAGE_COLLAPSE_PRODUCT_ICON_FILE_PATH = "";
        public const string HOME_PAGE_WHEN_NO_DEFAULT_PAGE_NOT_FOUND = "EAuction/DefaultPgae.aspx";
        public const string ACCESS_DENIED_URL =  "EAuction/AccessDenied.aspx";
        public const string CHNAGE_PASSWORD_URL = "EAuction/ChangePassword.aspx";
        public const string CODE_LOGIN_PAGE_URL = "Login.aspx";
        public const string CODE_LOGOUT_PAGE_URL = "Logout.aspx";
        public const string SESSION_EXPIRED_PGAE_URL = "SessionExpired.aspx";
        public const string HOME_PAGE_CHANGE_PASSWORD_LINK_URL = "ChangePassword.aspx";
        public const string HOME_PAGE_LOGOUT_URL = "../Logout.aspx";
        public const string LOGIN_PAGE_IMAGE_URL = "LoginCss/images/auction.jpg";
        public const string RESET_PASSWORD_PAGE_IMAGE_URL = "LoginCss/images/auction.jpg";
        public const string CUSTOM_ERROR_PAGE_IMAGE_URL = "LoginCss/images/auction.jpg";
        public const string CUSTOM_ERROR_PAGE_URL = "CustomError.aspx";

        public const string PRODUCT_NAME_IN_EMAIL_SMS = "e-Auction";
        //public const string PRODUCT_URL_IN_EMAIL_SMS = "";
        public const string HOME_PAGE_COPY_RIGHTS = "CopyRight &copy; 2020 <span class='text-blue'><b>e-Auction</b></span> All rights reserved.";
    }
}