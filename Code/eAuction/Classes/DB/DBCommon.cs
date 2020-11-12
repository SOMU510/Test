using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using YCS;
namespace YCS
{
    #region DBCommon Class
    public class DBCommon
    {
        #region Global Variable
        //  ManageUserSession _objManageUserSession = new ManageUserSession(true);
        DateTime _CurrentDateTime = DateTimeHandler.Get_Currentdate;
        DataConnection _objDataConnection = new DataConnection();
        Utility _objUtility = new Utility();
        Message _objMessage = new Message();
        CustomAppSetting _objCustomAppSetting = new CustomAppSetting();
        Security _objSecurity = new Security();
        #endregion

        #region public Methods
        /// <summary>
        /// Fill Any control from Database (Dropdown / Listbox)
        /// </summary>
        /// <param name="spname"> Database storeprocedure name</param>
        /// <param name="param"> Parameter List in Executing storeprocedure</param>
        /// <param name="control"> any type of web control</param>
        /// <param name="insertdefault">insert default list item for first position or not</param>
        /// <returns></returns>
        public DataTable FillAnyList(string spname, List<DBMapParam> param, dynamic control, bool insertdefault = true)
        {
            if (control != null)
            {
                control.Items.Clear();
            }

            DataTable dt = new DataConnection().GetDatatableSP(spname, param);

            Bind_Control(control, dt, insertdefault);

            return dt;
        }

        /// <summary>
        /// Bind Any control from Datatable (Dropdown / Listbox)
        /// </summary>
        /// <param name="control"> any type of web control</param>
        /// <param name="dt"> Data Loaded Datatable</param>
        /// <param name="insertdefault"> insert default list item for first position or not</param>
        /// <param name="dataTextField"> display text for dropdwon/Listbox </param>
        /// <param name="dataValueField"> display value for dropdwon/Listbox</param>
        public void Bind_Control(dynamic control, DataTable dt, bool insertdefault = true, string dataValueField = "Id", string dataTextField = "Name")
        {
            if (control != null)
            {
                if (control.GetType() == typeof(DropDownList) || control.GetType() == typeof(ListBox) || control.GetType() == typeof(CheckBoxList) || control.GetType() == typeof(RadioButtonList) || control.GetType() == typeof(RadListBox) || control.GetType() == typeof(RadComboBox))
                {

                    if (control.GetType() == typeof(DropDownList))
                    {
                        // ((DropDownList)control).ClearSelection();
                        ((DropDownList)control).SelectedValue = null;
                    }

                    control.Items.Clear();

                    if (dt != null)
                    {
 if (control.GetType() == typeof(RadComboBox))
                    {
                        if (control.ItemTemplate != null && insertdefault)
                        {
                            DataRow dr = dt.NewRow();
                            dr[dataValueField] = "0";
                            dr[dataTextField] = "-- Select --";

                            dt.Rows.InsertAt(dr, 0);
                        }
                    }
                        control.DataSource = dt;
                        control.DataValueField = dataValueField;
                        control.DataTextField = dataTextField;
                        control.DataBind();
                    }

                    if (insertdefault)
                    {
if (control.GetType() == typeof(RadComboBox))
                    {
                        control.Items.Insert(0, new Telerik.Web.UI.RadComboBoxItem("-- Select --", "0"));
                    }
                    else
                    {
                        control.Items.Insert(0, new ListItem("-- Select --", "0"));
                        control.SelectedValue = "0";
                    }

                    }
                }
                else if (control.GetType() == typeof(GridView) || control.GetType() == typeof(DataList) || control.GetType() == typeof(Repeater))
                {
                    control.DataSource = dt;
                    control.DataBind();
                }
            }
        }

        public DataSet Validate_User(string TransactionPassword, ManageUserSession _objManageUserSession)
        {
            DataConnection objDataConnection = new DataConnection();
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = _objManageUserSession.GetCurrent_Login_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDate", Value = _CurrentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Device", Value = "W" });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = 0 });
            DataSet dsResult = objDataConnection.GetDatasetSP("SP_Login", lstDBMapParam);
            if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count != 0)
            {
                bool IsValidUser = true;
                IsValidUser = new Security().VerifyPassword(TransactionPassword, Convert.FromBase64String(dsResult.Tables[0].Rows[0]["Trans_SaltValue"].ToString()), Convert.FromBase64String(dsResult.Tables[0].Rows[0]["Trans_HashPassword"].ToString()));
                if (IsValidUser)
                {
                    if (Convert.ToInt64(dsResult.Tables[0].Rows[0]["Login_User_Id"]) == _objManageUserSession.GetCurrentLogin_User_Id)
                    {
                        dsResult.Tables[0].Rows[0]["Login_Session_Id"] = _objManageUserSession.GetCurrentUser_LoginSessionId;
                        dsResult.Tables[0].Rows[0]["OutputMessage"] = "SUCCESS";
                        dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 0;
                        dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = "";
                    }
                    else
                    {
                        dsResult.Tables[0].Rows[0]["OutputMessage"] = "INVALID";
                        dsResult.Tables[0].Rows[0]["DefaultURL"] = "";
                        dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 31;
                        dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = " User. Please Logout and Login again";
                    }
                }
                else
                {
                    dsResult.Tables[0].Rows[0]["OutputMessage"] = "INVALID";
                    dsResult.Tables[0].Rows[0]["DefaultURL"] = "";
                    dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 31;
                    dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = "Transaction Password";
                }

            }
            else
            {
                DataRow drNew = dsResult.Tables[0].NewRow();
                drNew["OutputMessage"] = "INVALID";
                drNew["OutputMessageCode"] = 4;
                drNew["OutputMessageAdditionalInfo"] = "";
                dsResult.Tables[0].Rows.Add(drNew);
            }

            return dsResult;
        }

        public DataSet Login_Authenticate(LoginUserProfile objLoginUserProfile)
        {

            ManageUserSession _objManageUserSession = new ManageUserSession(true);
            _objManageUserSession.Clear_Login_Page_Session();

            DataConnection objDataConnection = new DataConnection();
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = objLoginUserProfile.Login_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDate", Value = _CurrentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Device", Value = objLoginUserProfile.Login_Device });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = objLoginUserProfile.Firm_Id });
            DataSet dsResult = objDataConnection.GetDatasetSP("SP_Login", lstDBMapParam);
            if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count != 0)
            {
                bool IsValidUser = true;
                HttpContext.Current.Session["LOGIN_DETAIL_DEVICE"] = objLoginUserProfile.Login_Device;

                if (Convert.ToInt64(_objUtility.ValidateDBNullEmptyValue(dsResult.Tables[0].Rows[0]["Wrong_Password_Attempt"], 0)) >= _objCustomAppSetting.Account_Lockout_Threshold && Convert.ToDateTime(dsResult.Tables[0].Rows[0]["Account_Lock_Date"]).AddMinutes(_objCustomAppSetting.Account_Lockout_Duration_In_Min).CompareTo(DateTimeHandler.Get_Currentdate) == 1)
                {
                    dsResult.Tables[0].Rows[0]["OutputMessage"] = "INVALID";
                    dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 55;
                    dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = _objCustomAppSetting.Account_Lockout_Duration_In_Min;
                    return dsResult;
                }

                if (objLoginUserProfile.Accessthrough == "Password")
                {
                    if (objLoginUserProfile.Firm_Id == 0)
                    {
                        IsValidUser = new Security().VerifyPassword(objLoginUserProfile.Password, Convert.FromBase64String(dsResult.Tables[0].Rows[0]["SaltValue"].ToString()), Convert.FromBase64String(dsResult.Tables[0].Rows[0]["HashPassword"].ToString()));
                    }
                    if (IsValidUser)
                    {
                        lstDBMapParam = new List<DBMapParam>();
                        lstDBMapParam.Add(new DBMapParam() { Name = "Login_User_Id", Value = dsResult.Tables[0].Rows[0]["Login_User_Id"] });
                        lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = dsResult.Tables[0].Rows[0]["Firm_Id"] });
                        lstDBMapParam.Add(new DBMapParam() { Name = "Login_Time", Value = _CurrentDateTime });
                        lstDBMapParam.Add(new DBMapParam() { Name = "Logout_Time", Value = DBNull.Value });
                        lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = 3 }); // Log In
                        lstDBMapParam.Add(new DBMapParam() { Name = "Login_Device", Value = _objManageUserSession.Get_Login_Device_Detail });
                        lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = objLoginUserProfile.Login_Id });
                        if (_objManageUserSession.Get_Login_Device_Detail == 'W')
                        {
                            lstDBMapParam.Add(new DBMapParam() { Name = "Device_Id", Value = _objUtility.ValidateDBNullEmptyValue(_objUtility.GetUserIPAddress(), DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Browser_Name", Value = _objUtility.ValidateDBNullEmptyValue(_objUtility.GetUserBrowserName, DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Browser_Version", Value = _objUtility.ValidateDBNullEmptyValue(_objUtility.GetUserBrowserVersion, DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Mobile_Model", Value = DBNull.Value });
                            lstDBMapParam.Add(new DBMapParam() { Name = "App_Name", Value = DBNull.Value });
                            lstDBMapParam.Add(new DBMapParam() { Name = "App_Version", Value = DBNull.Value });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Operating_System", Value = _objUtility.ValidateDBNullEmptyValue(_objUtility.GetUserOS, DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Token_Value", Value = DBNull.Value });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Active_Token", Value = DBNull.Value });
                        }
                        else if (_objManageUserSession.Get_Login_Device_Detail == 'M')
                        {
                            objLoginUserProfile.Token = System.Guid.NewGuid() + "" + DateTime.Now.Ticks + "" + dsResult.Tables[0].Rows[0]["Login_User_Id"];

                            lstDBMapParam.Add(new DBMapParam() { Name = "Device_Id", Value = _objUtility.ValidateDBNullEmptyValue(objLoginUserProfile.Device_Id, DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Browser_Name", Value = DBNull.Value });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Browser_Version", Value = DBNull.Value });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Mobile_Model", Value = _objUtility.ValidateDBNullEmptyValue(objLoginUserProfile.Mobile_Model, DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "App_Name", Value = _objUtility.ValidateDBNullEmptyValue(objLoginUserProfile.App_Name, DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "App_Version", Value = _objUtility.ValidateDBNullEmptyValue(objLoginUserProfile.App_Version, DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Operating_System", Value = _objUtility.ValidateDBNullEmptyValue(objLoginUserProfile.Operating_System, DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Token_Value", Value = _objUtility.ValidateDBNullEmptyValue(objLoginUserProfile.Token, DBNull.Value) });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Active_Token", Value = 1 });


                        }

                        if (_objUtility.ValidateDBNullEmptyValue(objLoginUserProfile.OTP))
                        {
                            lstDBMapParam.Add(new DBMapParam() { Name = "OTP", Value = DBNull.Value });
                        }
                        else
                        {
                            lstDBMapParam.Add(new DBMapParam() { Name = "OTP", Value = objLoginUserProfile.OTP });
                        }
                        if (_objUtility.ValidateDBNullEmptyValue(objLoginUserProfile.OTP))
                        {
                            lstDBMapParam.Add(new DBMapParam() { Name = "OTP_GeneratedOn_Date", Value = DBNull.Value });
                        }
                        else
                        {
                            lstDBMapParam.Add(new DBMapParam() { Name = "OTP_GeneratedOn_Date", Value = objLoginUserProfile.OTP_GeneratedOn_Date });
                        }
                        lstDBMapParam.Add(new DBMapParam() { Name = "Login_Session_Id", Value = 0, ParameterDirection = ParameterDirection.InputOutput, Size = 30 });
                        Dictionary<string, object> result = new DataConnection().ExecuteNonQuery("SP_IU_Login_Status", lstDBMapParam);
                        _objManageUserSession.Wrong_Password_Attempt = null;
                        dsResult.Tables[0].Rows[0]["Login_Session_Id"] = Convert.ToInt64(result["Login_Session_Id"]);
                        dsResult.Tables[0].Rows[0]["OutputMessage"] = "SUCCESS";
                        dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 0;
                        dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = "";
                        UpdateURLInMenu(dsResult.Tables[1], objLoginUserProfile.Login_Id, objLoginUserProfile.Token);
                        System.Web.HttpContext.Current.Session["LOGIN_DETAIL_USERDETAIL"] = dsResult;
                        dsResult.Tables[0].Rows[0]["DefaultURL"] = ApplicationConfig.Get_Default_Page_URL;
                    }
                    else
                    {
                        dsResult.Tables[0].Rows[0]["OutputMessage"] = "INVALID";
                        dsResult.Tables[0].Rows[0]["DefaultURL"] = "";

                        if (_objCustomAppSetting.Is_Apply_Password_Policy)
                        {
                            CreateLogWrongPwdAttempt(_objManageUserSession, objLoginUserProfile.Login_Id);
                            Int32 increase_wrong_Password_Attempt = Convert.ToInt32(_objUtility.ValidateDBNullEmptyValue(dsResult.Tables[0].Rows[0]["Wrong_Password_Attempt"], 0)) >= _objCustomAppSetting.Account_Lockout_Threshold ? 1 : Convert.ToInt32(_objUtility.ValidateDBNullEmptyValue(dsResult.Tables[0].Rows[0]["Wrong_Password_Attempt"], 0)) + 1;
                            lstDBMapParam = new List<DBMapParam>();
                            lstDBMapParam.Add(new DBMapParam() { Name = "Login_User_Id", Value = dsResult.Tables[0].Rows[0]["Login_User_Id"] });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Wrong_Password_Attempt", Value = increase_wrong_Password_Attempt });
                            lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = DateTimeHandler.Get_Currentdate });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Reset_Account_Lockout_Counter_After_In_Min", Value = _objCustomAppSetting.Reset_Account_Lockout_Counter_After_In_Min });
                            new DataConnection().ExecuteNonQuery("SP_Update_Wrong_Password_Attempt", lstDBMapParam);
                            if (increase_wrong_Password_Attempt >= _objCustomAppSetting.Account_Lockout_Threshold)
                            {
                                dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 55;
                                dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = _objCustomAppSetting.Account_Lockout_Duration_In_Min;
                            }
                            else
                            {
                                dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 56;
                                dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = (_objCustomAppSetting.Account_Lockout_Threshold - increase_wrong_Password_Attempt);
                            }
                        }
                        else
                        {
                            dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 4;
                            dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = "";
                        }
                    }
                }
                //else if (objLoginUserProfile.Accessthrough == "Token")
                //{
                //    DataTable dtToken = new DataTable();
                //    List<DBMapParam> paramToken = new List<DBMapParam>();
                //    paramToken.Add(new DBMapParam { Name = "Login_User_Id", Value = dsResult.Tables[0].Rows[0]["Login_User_Id"] });
                //    paramToken.Add(new DBMapParam { Name = "Token_Value", Value = objLoginUserProfile.Token.Trim(), ParameterDirection = System.Data.ParameterDirection.Input });
                //    dtToken = objDataConnection.GetDatatableSP("SP_TokenValuecheck", paramToken);
                //    if (dtToken.Rows.Count == 0)
                //    {
                //        dsResult.Tables[0].Rows[0]["OutputMessage"] = "INVALID TOKEN";
                //        dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 54;
                //        dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = "";
                //        dsResult.Tables[0].Rows[0]["DefaultURL"] = "";

                //    }
                //    else
                //    {
                //        dsResult.Tables[0].Rows[0]["Login_Session_Id"] = dtToken.Rows[0]["Login_Session_Id"].ToString();
                //        dsResult.Tables[0].Rows[0]["OutputMessage"] = "SUCCESS";
                //        dsResult.Tables[0].Rows[0]["OutputMessageCode"] = 0;
                //        dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"] = "";
                //        UpdateURLInMenu(dsResult.Tables[1], objLoginUserProfile.Login_Id, objLoginUserProfile.Token);
                //        System.Web.HttpContext.Current.Session["LOGIN_DETAIL_USERDETAIL"] = dsResult;
                //        dsResult.Tables[0].Rows[0]["DefaultURL"] = ApplicationConfig.Get_Default_Page_URL;
                //    }
                //}

            }
            else
            {
                DataRow drNew = dsResult.Tables[0].NewRow();
                drNew["OutputMessage"] = "INVALID";
                drNew["OutputMessageCode"] = 4;
                drNew["OutputMessageAdditionalInfo"] = "";
                dsResult.Tables[0].Rows.Add(drNew);
            }

            return dsResult;
        }

        private void UpdateURLInMenu(DataTable dataTable, string login_Id, string token)
        {
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                foreach (DataRow dr in dataTable.Rows)
                {
                    dr["Form_Relative_Path"] = _objCustomAppSetting.URL_Root + "/" + _objUtility.GetURLForMobileWebView(dr["Form_Relative_Path"].ToString(), login_Id, token, null);
                    dr["Parent_Form_Relative_Path"] = _objCustomAppSetting.URL_Root + "/" + _objUtility.GetURLForMobileWebView(dr["Parent_Form_Relative_Path"].ToString(), login_Id, token, null);
                }
            }
        }

        public string Logout(ManageUserSession objManageUserSession)
        {
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_User_Id", Value = objManageUserSession.GetCurrentLogin_User_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = objManageUserSession.GetCurrentUser_Firm_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Time", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Logout_Time", Value = _CurrentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = 4 }); // Log out
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Device", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Device_Id", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Browser_Name", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Browser_Version", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Mobile_Model", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "App_Name", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "App_Version", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Operating_System", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Token_Value", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Active_Token", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "OTP", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "OTP_GeneratedOn_Date", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Session_Id", Value = objManageUserSession.GetCurrentUser_LoginSessionId, ParameterDirection = ParameterDirection.InputOutput, Size = 30 });
            Dictionary<string, object> result = new DataConnection().ExecuteNonQuery("SP_IU_Login_Status", lstDBMapParam);
            return "SUCCESS";
        }

        public DataTable ResetPassword(LoginUserProfile obj, char LoginDevice, string passwordtype)
        {
            HttpContext.Current.Session["LOGIN_DETAIL_DEVICE"] = LoginDevice;
            DataTable dtPassword = _objUtility.GeneratePassword(null);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = obj.Login_Id.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Password", Value = dtPassword.Rows[0]["Password"] });
            lstDBMapParam.Add(new DBMapParam() { Name = "SaltValue", Value = dtPassword.Rows[0]["SaltValue"] });
            lstDBMapParam.Add(new DBMapParam() { Name = "HashPassword", Value = dtPassword.Rows[0]["LoginPasswordEncrypt"] });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = passwordtype });
            lstDBMapParam.Add(new DBMapParam() { Name = "Modify_Date", Value = _CurrentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Device", Value = LoginDevice });
            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Password_Reset_Required", Value = true });
            lstDBMapParam.Add(new DBMapParam() { Name = "Current_Date", Value = _CurrentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "Type", Value = passwordtype });
            DataTable dtResult = new DataConnection().GetDatatableSP("SP_Reset_Password", lstDBMapParam);
            if (dtResult != null && dtResult.Rows.Count > 0)
            {
                dtResult.Columns.Add("Password");
                dtResult.Rows[0]["Password"] = dtPassword.Rows[0]["Password"];
            }
            return dtResult;
        }

        public string ChangePassword(LoginUserProfile objLoginUser, string NewPassword, string OldPassword, string NewTranPassword, string OldTranPassword, bool IsLoginChangePassword, bool IsTransChangePassword)
        {
            ManageUserSession _objManageUserSession = new ManageUserSession(true);
            DataTable dtPassword = _objUtility.GeneratePassword(NewPassword);
            DataTable dtTranPassword = _objUtility.GeneratePassword(NewTranPassword);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();

            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = objLoginUser.Login_Id.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDate", Value = _CurrentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Device", Value = _objManageUserSession.Get_Login_Device_Detail });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = _objManageUserSession.GetCurrentUser_Firm_Id });
            DataSet dsResult = _objDataConnection.GetDatasetSP("SP_Login", lstDBMapParam);

            string ResultOutput = "";

            if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count > 0)
            {
                lstDBMapParam = new List<DBMapParam>();
                lstDBMapParam.Add(new DBMapParam() { Name = "Login_Session_Id", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = _objManageUserSession.GetCurrentUser_Firm_Id });
                lstDBMapParam.Add(new DBMapParam() { Name = "Login_User_Id", Value = _objManageUserSession.GetCurrentLogin_User_Id });

                if (IsLoginChangePassword == true)
                {
                    if (OldPassword == dsResult.Tables[0].Rows[0]["Password"].ToString())
                    {
                        Dictionary<string, object> result = new Dictionary<string, object>();
                        bool IsValidUser = new Security().VerifyPassword(OldPassword, Convert.FromBase64String(dsResult.Tables[0].Rows[0]["SaltValue"].ToString()), Convert.FromBase64String(dsResult.Tables[0].Rows[0]["HashPassword"].ToString()));
                        if (IsValidUser)
                        {

                            lstDBMapParam.Add(new DBMapParam() { Name = "Password", Value = dtPassword.Rows[0]["Password"] });
                            lstDBMapParam.Add(new DBMapParam() { Name = "SaltValue", Value = dtPassword.Rows[0]["SaltValue"] });
                            lstDBMapParam.Add(new DBMapParam() { Name = "HashPassword", Value = dtPassword.Rows[0]["LoginPasswordEncrypt"] });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Password_Reset_Required", Value = false });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Password_ChangedOn_Date", Value = _CurrentDateTime });
                        }
                    }
                    else
                    {
                        ResultOutput = "INVALID LOGIN PASSWORD";
                        return ResultOutput;
                    }
                }

                else if (IsLoginChangePassword == false)
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Password", Value = dsResult.Tables[0].Rows[0]["Password"].ToString() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "SaltValue", Value = dsResult.Tables[0].Rows[0]["SaltValue"].ToString() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "HashPassword", Value = dsResult.Tables[0].Rows[0]["HashPassword"].ToString() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Is_Password_Reset_Required", Value = dsResult.Tables[0].Rows[0]["Is_Password_Reset_Required"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Password_ChangedOn_Date", Value = dsResult.Tables[0].Rows[0]["Password_ChangedOn_Date"] });
                }

                if (IsTransChangePassword == true)
                {
                    if (OldTranPassword == dsResult.Tables[0].Rows[0]["Trans_Password"].ToString())
                    {
                        Dictionary<string, object> result = new Dictionary<string, object>();
                        bool IsValidUser = new Security().VerifyPassword(OldTranPassword, Convert.FromBase64String(dsResult.Tables[0].Rows[0]["Trans_SaltValue"].ToString()), Convert.FromBase64String(dsResult.Tables[0].Rows[0]["Trans_HashPassword"].ToString()));
                        if (IsValidUser)
                        {

                            lstDBMapParam.Add(new DBMapParam() { Name = "Trans_Password", Value = dtTranPassword.Rows[0]["Password"] });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Trans_SaltValue", Value = dtTranPassword.Rows[0]["SaltValue"] });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Trans_HashPassword", Value = dtTranPassword.Rows[0]["LoginPasswordEncrypt"] });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Trans_Password_Reset_Required", Value = false });
                            lstDBMapParam.Add(new DBMapParam() { Name = "Tran_Password_ChangedOn_Date", Value = _CurrentDateTime });
                        }
                    }
                    else
                    {
                        ResultOutput = "INVALID TRANSACTION PASSWORD";
                        return ResultOutput;
                    }
                }

                else if (IsTransChangePassword == false)
                {

                    lstDBMapParam.Add(new DBMapParam() { Name = "Trans_Password", Value = dsResult.Tables[0].Rows[0]["Trans_Password"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Trans_SaltValue", Value = dsResult.Tables[0].Rows[0]["Trans_SaltValue"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Trans_HashPassword", Value = dsResult.Tables[0].Rows[0]["Trans_HashPassword"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Is_Trans_Password_Reset_Required", Value = dsResult.Tables[0].Rows[0]["Is_Trans_Password_Reset_Required"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Tran_Password_ChangedOn_Date", Value = dsResult.Tables[0].Rows[0]["Tran_Password_ChangedOn_Date"] });
                }

                lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = "Password Change" });
                lstDBMapParam.Add(new DBMapParam() { Name = "Login_Device", Value = _objManageUserSession.Get_Login_Device_Detail });//though mobile
                lstDBMapParam.Add(new DBMapParam() { Name = "Modify_Date", Value = _CurrentDateTime });
                lstDBMapParam.Add(new DBMapParam() { Name = "Modify_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });

                lstDBMapParam.Add(new DBMapParam() { Name = "Modify_LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("sp_Change_Password", lstDBMapParam);
                ResultOutput = Convert.ToString(dictResult["OutputMessage"]);
            }
            else
            {
                ResultOutput = "NOT_MATCH";
            }

            return ResultOutput;
        }

        public bool Is_Valid_Transaction_Password(TextBox txttranpassword, ManageUserSession objManageUserSession)
        {
            if (!_objUtility.ValidateDBNullEmptyValue(objManageUserSession.GetCurrent_Trans_Password) && txttranpassword.Visible)
            {
                if (_objUtility.ValidateDBNullEmptyValue(txttranpassword.Text.Trim()))
                {
                    _objMessage.ShowMessage(null, txttranpassword, 6, "Transaction Password");
                    txttranpassword.Focus();
                    return false;
                }
                DataSet dtValidate_User = Validate_User(txttranpassword.Text.Trim(), objManageUserSession);
                if (dtValidate_User != null && dtValidate_User.Tables.Count > 0 && dtValidate_User.Tables[0].Rows.Count != 0 && dtValidate_User.Tables[0].Rows[0]["OutputMessage"].ToString() != "SUCCESS")
                {
                    if (_objCustomAppSetting.Is_Apply_Transaction_Password_Policy)
                    {
                        objManageUserSession.Transaction_Password_Wrong_Attempt = objManageUserSession.Transaction_Password_Wrong_Attempt + 1;
                        if (objManageUserSession.Transaction_Password_Wrong_Attempt >= _objCustomAppSetting.Account_Logout_Threshold)
                        {
                            HttpContext.Current.Response.Redirect(YCS_Configuration.CODE_LOGOUT_PAGE_URL);
                        }
                    }
                    _objMessage.ShowMessage(null, txttranpassword, Convert.ToInt32(_objUtility.ValidateDBNullEmptyValue(dtValidate_User.Tables[0].Rows[0]["OutputMessageCode"], 0)), Convert.ToString(_objUtility.ValidateDBNullEmptyValue(dtValidate_User.Tables[0].Rows[0]["OutputMessageAdditionalInfo"], "")));
                    txttranpassword.Focus();
                    return false;
                }
                objManageUserSession.Transaction_Password_Wrong_Attempt = 0;
                return true;
            }
            else
            {
                objManageUserSession.Transaction_Password_Wrong_Attempt = 0;
                return true;
            }
        }


        #endregion

        #region Private Methods
        private void CreateLogWrongPwdAttempt(ManageUserSession objManageUserSession, string username)
        {
            Dictionary<string, int> dicpwd = null;

            if (_objUtility.ValidateDBNullEmptyValue(objManageUserSession.Wrong_Password_Attempt))
            {
                dicpwd = new Dictionary<string, int>();
                dicpwd.Add(username, 1);
                objManageUserSession.Wrong_Password_Attempt = dicpwd;
            }
            else
            {
                dicpwd = (Dictionary<string, int>)objManageUserSession.Wrong_Password_Attempt;
                if (_objUtility.ValidateDBNullEmptyValue(dicpwd))
                {
                    dicpwd = new Dictionary<string, int>();
                    dicpwd.Add(username, 1);
                }
                else
                {
                    if (dicpwd.ContainsKey(username))
                    {
                        dicpwd[username] = Convert.ToInt32(dicpwd[username]) + 1;
                    }
                    else
                    {
                        dicpwd.Add(username, 1);
                    }
                }
                objManageUserSession.Wrong_Password_Attempt = dicpwd;
            }
        }
        #endregion
    }
    #endregion
}