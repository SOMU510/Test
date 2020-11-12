using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace YCS
{
    public class ManageUserSession
    {
        #region Global Variable
        Utility _objUtility = new Utility();
        DBCommon _objDBCommon = new DBCommon();
        #endregion

        #region Constructor
        public ManageUserSession()
        {
            //AutoLoginFromQueryStringForMobile();
            User_Validation();
        }
        public ManageUserSession(string menucode, System.Web.UI.HtmlControls.HtmlGenericControl span, System.Web.UI.HtmlControls.HtmlGenericControl menuheadericon, bool urlvalidated = true)
        {
            try
            {
                //AutoLoginFromQueryStringForMobile();
                User_Validation();

                bool isvalid = false;

                DataRow[] drData = MenuFilterByMenuCode(menucode);

                if (drData != null && drData.Length > 0)
                {
                    string filename = System.IO.Path.GetFileNameWithoutExtension(new Uri(_objUtility.GetCurrentURL).AbsolutePath);// System.IO.Path.GetFileNameWithoutExtension(_objUtility.GetCurrentURL);
                    string formRelativePath = _objUtility.ValidateDBNullEmptyValue(drData[0]["Form_Relative_Path"], "").ToString();
                    if (System.IO.Path.GetFileNameWithoutExtension((formRelativePath.Contains("?") ? formRelativePath.Remove(formRelativePath.IndexOf('?')) : formRelativePath)) == filename)
                    {
                        if (span != null)
                        {
                            span.InnerText = _objUtility.ValidateDBNullEmptyValue(drData[0]["Menu_Name"], "").ToString();
                        }

                        isvalid = true;
                    }
                    else if (urlvalidated == false)
                    {
                        isvalid = true;
                    }

                    if (isvalid)
                    {
                        if (menuheadericon != null)
                        {
                            string iconcss = Get_MenuHeaderIcon(drData[0]);
                            if (_objUtility.ValidateDBNullEmptyValue(iconcss) == false)
                            {
                                menuheadericon.Attributes["class"] = iconcss;
                            }
                        }
                    }
                }

                if (isvalid == false)
                {
                    ApplicationConfig.RedirectToAccessDeniedPage();
                }
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                ApplicationConfig.RedirectToAccessDeniedPage();
                throw ex;
            }
        }
        public ManageUserSession(bool callLogin)
        {
            //  AutoLoginFromQueryStringForMobile();
        }

        #endregion

        #region Private Methods
        private DataRow[] MenuFilterByMenuCode(string menucode)
        {
            if (GetCurrentUser_Menu_Right != null)
            {
                DataTable dtRoleMenu = GetCurrentUser_Menu_Right;
                return dtRoleMenu.Select("Menu_Internal_Code='" + menucode + "' ");
            }
            return null;
        }

        private string Get_MenuHeaderIcon(DataRow dr)
        {
            if (dr != null)
            {
                string[] iconcss = _objUtility.ValidateDBNullEmptyValue(dr["Parent_Menu_Icon"], "").ToString().Split(' ');
                if (iconcss.Length > 1)
                {
                    return iconcss[0] + " " + iconcss[1];
                }
            }

            return "";
        }

        private void User_Validation()
        {
            if (HttpContext.Current.Session["LOGIN_DETAIL_USERDETAIL"] == null || ((DataSet)HttpContext.Current.Session["LOGIN_DETAIL_USERDETAIL"]).Tables[0].Rows.Count == 0)
            {
                ApplicationConfig.RedirectToLoginPage();
            }
            else
            {
                if (GetCurrentUser_Is_Password_Reset_Required)
                {
                    ApplicationConfig.RedirectToChangePasswordPage(true);
                }
                else if (GetCurrentUser_Is_Trans_Password_Reset_Required)
                {
                    ApplicationConfig.RedirectToChangePasswordPage(true, "Change Transaction Password");
                }
                else if (GetCurrentUser_Is_Profile_Update_Required)
                {
                    //ApplicationConfig.RedirectToUpdateProfilePage(GetUpdateProfileMenu, true);
                }
            }
        }
        #endregion

        #region Public Methods
        public void SetMenuHeaderIcon(string menucode, System.Web.UI.HtmlControls.HtmlGenericControl menuheadericon)
        {
            DataRow[] drData = MenuFilterByMenuCode(menucode);

            if (drData != null && drData.Length > 0)
            {
                string iconcss = Get_MenuHeaderIcon(drData[0]);
                if (_objUtility.ValidateDBNullEmptyValue(iconcss) == false)
                {
                    menuheadericon.Attributes["class"] = iconcss;
                }
            }
        }

        public Int64 Get_MenuId(string menucode)
        {
            DataRow[] drData = MenuFilterByMenuCode(menucode);

            if (drData != null && drData.Length > 0)
            {
                return Convert.ToInt32(_objUtility.ValidateDBNullEmptyValue(drData[0]["Menu_Id"], 0));
            }

            return 0;
        }

        public DataTable Get_LoginTable
        {
            get
            {
                DataSet ds = ((DataSet)HttpContext.Current?.Session?["LOGIN_DETAIL_USERDETAIL"]);
                if (ds == null)
                {
                    return null;
                }

                return ds.Tables[0];
            }
        }

        public DataTable GetCurrentUser_Menu_Right
        {
            get
            {
                DataSet ds = ((DataSet)HttpContext.Current.Session["LOGIN_DETAIL_USERDETAIL"]);
                if (ds == null)
                {
                    return null;
                }

                return ds.Tables[1];
            }
        }

        public DataTable GetCurrentUser_Firms_Right
        {
            get
            {
                DataSet ds = ((DataSet)HttpContext.Current.Session["LOGIN_DETAIL_USERDETAIL"]);
                if (ds == null)
                {
                    return null;
                }

                return ds.Tables[2];
            }
        }

        public Int64 GetCurrentUser_Internal_Code
        {
            get
            {
                return Convert.ToInt64(Get_LoginTable.Rows[0]["User_Internal_Code"]);
            }
            set
            {
                Get_LoginTable.Rows[0]["User_Internal_Code"] = value;
            }
        }

        public bool GetCurrentUser_Is_Password_Reset_Required
        {
            get
            {
                return Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue(Get_LoginTable.Rows[0]["Is_Password_Reset_Required"], false));
            }
            set
            {
                Get_LoginTable.Rows[0]["Is_Password_Reset_Required"] = value;
            }
        }

        public bool GetCurrentUser_Is_Trans_Password_Reset_Required
        {
            get
            {
                return Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue(Get_LoginTable.Rows[0]["Is_Trans_Password_Reset_Required"], false));
            }
            set
            {
                Get_LoginTable.Rows[0]["Is_Trans_Password_Reset_Required"] = value;
            }
        }

        public bool GetCurrentUser_Is_Profile_Update_Required
        {
            get
            {
                return Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue(Get_LoginTable.Rows[0]["Is_Profile_Update_Required"], false));
            }
            set
            {
                Get_LoginTable.Rows[0]["Is_Profile_Update_Required"] = value;
            }
        }

        public Int64 GetCurrentLogin_User_Id
        {
            get
            {
                return Convert.ToInt64(Get_LoginTable.Rows[0]["Login_User_Id"]);
            }
        }

        public Int64 GetCurrentLogin_Primary_Id
        {
            get
            {
                return Convert.ToInt64(Get_LoginTable.Rows[0]["Reference_Primary_Id"]);
            }
        }

        public string GetCurrentUser_Name
        {
            get
            {
                return Convert.ToString(Get_LoginTable.Rows[0]["User_Name"]);
            }
        }

        public Int64 GetCurrentUser_Role_Id
        {
            get
            {
                return Convert.ToInt64(Get_LoginTable.Rows[0]["Role_Id"]);
            }
        }

        public string GetCurrentUser_RoleName
        {
            get
            {
                return Convert.ToString(Get_LoginTable.Rows[0]["Role_Name"]);
            }
        }

        public Int64 GetCurrentUser_Role_Type_Enum_Id
        {
            get
            {
                return Convert.ToInt64(Get_LoginTable.Rows[0]["Role_Type_Enum_Id"]);
            }
            set
            {
                Get_LoginTable.Rows[0]["Role_Type_Enum_Id"] = value;
            }
        }

        public Int64 GetCurrentUser_Role_Type_Enum_Name
        {
            get
            {
                return Convert.ToInt64(Get_LoginTable.Rows[0]["Role_Type_Name"]);
            }
            set
            {
                Get_LoginTable.Rows[0]["Role_Type_Name"] = value;
            }
        }

        public Int64 GetCurrentUser_DepartmentId
        {
            get
            {
                return Convert.ToInt64(Get_LoginTable.Rows[0]["Department_Id"]);
            }
        }

        public string GetCurrentUser_DepartmentName
        {
            get
            {
                return Convert.ToString(Get_LoginTable.Rows[0]["Department_Name"]);
            }
        }

        public Int64 GetCurrentUser_Firm_Id
        {
            get
            {
                return Convert.ToInt64(Get_LoginTable.Rows[0]["Firm_Id"]);
            }
        }

        public string GetCurrentUser_Firm_Name
        {
            get
            {
                return Convert.ToString(Get_LoginTable.Rows[0]["Firm_Name"]);
            }
        }

        public char Get_Login_Device_Detail
        {
            get
            {
                return Convert.ToChar(HttpContext.Current.Session["LOGIN_DETAIL_DEVICE"]);
            }
        }

        public Int64 GetCurrentUser_LoginSessionId
        {
            get
            {
                return Convert.ToInt64(Get_LoginTable.Rows[0]["Login_Session_Id"]);
            }
        }

        public string GetCurrent_Login_Id
        {
            get
            {
                return Convert.ToString(Get_LoginTable.Rows[0]["Login_Id"]);
            }
        }

        public string GetCurrent_Trans_Password
        {
            get
            {
                return Convert.ToString(Get_LoginTable.Rows[0]["Trans_Password"]);
            }
        }

        public void Clear_Login_Page_Session()
        {
            HttpContext.Current.Session["HOME_PAGE_ACTIVE_USER_DETAILS"] = null;
            HttpContext.Current.Session["HOME_PAGE_ACTIVE_MENU_CODE"] = null;
            HttpContext.Current.Session["LOGIN_DETAIL_DEVICE"] = null;
        }

        public string GetDefaultMenu
        {
            get
            {
                string returnDefaultPage = "";

                if (GetCurrentUser_Menu_Right != null && GetCurrentUser_Menu_Right.Rows.Count > 0)
                {
                    DataRow[] defaultvalue = GetCurrentUser_Menu_Right.Select("Is_Default=1");

                    if (defaultvalue != null && defaultvalue.Length > 0)
                    {
                        returnDefaultPage = Convert.ToString(defaultvalue.FirstOrDefault()["Form_Relative_Path"]);

                    }
                    if (string.IsNullOrEmpty(returnDefaultPage))
                    {

                        var query = (from DataRow dr in GetCurrentUser_Menu_Right.Rows
                                     where !(dr["Form_Relative_Path"] is System.DBNull) || !(dr["Form_Relative_Path"].ToString().Equals(string.Empty))
                                     select dr);
                        if (query != null && query.Count() > 0)
                        {
                            returnDefaultPage = Convert.ToString(query.FirstOrDefault()["Form_Relative_Path"]);

                        }
                    }
                }


                return _objUtility.ValidateDBNullEmptyValue(returnDefaultPage) ? YCS.YCS_Configuration.HOME_PAGE_WHEN_NO_DEFAULT_PAGE_NOT_FOUND : returnDefaultPage;
            }
        }

        //public string GetUpdateProfileMenu
        //{
        //    get
        //    {
        //        string returnPage = "";

        //        if (GetCurrentUser_Menu_Right != null && GetCurrentUser_Menu_Right.Rows.Count > 0)
        //        {
        //            DataRow[] defaultvalue = GetCurrentUser_Menu_Right.Select("Menu_Internal_Code=1002");

        //            if (defaultvalue != null && defaultvalue.Length > 0)
        //            {
        //                returnPage = Convert.ToString(defaultvalue.FirstOrDefault()["Form_Relative_Path"]);

        //            }
        //        }

        //        return returnPage;
        //    }
        //}

        public string Source_URL
        {
            set
            {
                HttpContext.Current.Session["SOURCE_URL"] = value;
            }
            get
            {
                return Convert.ToString(HttpContext.Current.Session["SOURCE_URL"]);
            }
        }

        public Int64 Wrong_Password_Login_User_Id
        {
            set
            {
                HttpContext.Current.Session["SESSION_WRONG_PASSWORD_EMPLOYEE_ID"] = value;
            }
            get
            {

                return _objUtility.ValidateDBNullEmptyValue(HttpContext.Current.Session["SESSION_WRONG_PASSWORD_EMPLOYEE_ID"]) ? 0 : Convert.ToInt64(HttpContext.Current.Session["SESSION_WRONG_PASSWORD_EMPLOYEE_ID"]);
            }
        }

        public Dictionary<string, int> Wrong_Password_Attempt
        {
            set
            {
                HttpContext.Current.Session["SESSION_LOGIN_WRONG_PASSWORD_ATTEMPT"] = value;
            }
            get
            {
                return _objUtility.ValidateDBNullEmptyValue(HttpContext.Current.Session["SESSION_LOGIN_WRONG_PASSWORD_ATTEMPT"]) ? new Dictionary<string, int>() : (Dictionary<string, int>)HttpContext.Current.Session["SESSION_LOGIN_WRONG_PASSWORD_ATTEMPT"];
            }
        }

        public int Transaction_Password_Wrong_Attempt
        {
            set
            {
                HttpContext.Current.Session["SESSION_TRANSACTION_PASSWORD_WRONG_PASSWORD_ATTEMPT"] = value;
            }
            get
            {
                return _objUtility.ValidateDBNullEmptyValue(HttpContext.Current.Session["SESSION_TRANSACTION_PASSWORD_WRONG_PASSWORD_ATTEMPT"]) ? 0 : Convert.ToInt32(HttpContext.Current.Session["SESSION_TRANSACTION_PASSWORD_WRONG_PASSWORD_ATTEMPT"]);
            }
        }

        public string User_Clicks_Dashboard_Id
        {
            set
            {
                HttpContext.Current.Session["DASHBOARD_USER_SELECT_DASHBOARD_ID"] = value;
            }
            get
            {
                return Convert.ToString(_objUtility.ValidateDBNullEmptyValue(HttpContext.Current.Session["DASHBOARD_USER_SELECT_DASHBOARD_ID"], ""));
            }
        }
        #endregion
    }
}
