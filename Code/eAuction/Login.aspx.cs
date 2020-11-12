using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using YCS;

namespace YCS
{
    public partial class Login : System.Web.UI.Page
    {
        #region Globlal Declaration
        ManageUserSession _objManageUserSession;
        Message _objMessage = new Message();
        Utility _objUtility = new Utility();
        DBCommon _objDBCommon = new DBCommon();
        CustomAppSetting _objCustomAppSetting = new CustomAppSetting();
        #endregion

        #region Page and Control Events
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                double value1 = 125.36952;
                double value2 = 1254545.36952;
                double value3 = 5.2;
                double value4 = 5.25;
                double value5 = 5.259;
                double value6 = 5;
                double value7 = 50;
                double value8 = 500.26;
                double value9 = 500.12;
                double value10 = 1500.12;
                double value11 = 1900.56;
                double value12 = 11900.56;
                double value13 = 119006.56;
                double value14 = 1149006.56;
                double value15= 11749006.56;
                double value16 = 11555749006.56;

                string val1 = string.Format("{0:N}", value1);
                string val2 = string.Format("{0:N}", value2);
                string val3 = string.Format("{0:N}", value3);
                string val4 = string.Format("{0:N}", value4);
                string val5 = string.Format("{0:N}", value5);
                string val6 = string.Format("{0:N}", value6);
                string val7 = string.Format("{0:N}", value7);
                string val8 = string.Format("{0:N}", value8);
                string val0 = string.Format("{0:N}", value9);
                string val10 = string.Format("{0:N}", value10);
                string val11 = string.Format("{0:N}", value11);
                string val12 = string.Format("{0:N}", value12);
                string val13 = string.Format("{0:N}", value13);
                string val14 = string.Format("{0:N}", value14);
                string val15 = string.Format("{0:N}", value15);
                string val16 = string.Format("{0:N}", value16);


                if (_objUtility.ValidateDBNullEmptyValue(hdfClinetURLOrigin.Value) == false)
                {
                    Session["DOMAIN_NAME"] = hdfClinetURLOrigin.Value;
                }

                if (Read_Cookies() == false)
                {
                    return;
                }

                _objUtility.Is_ValidBrowser();
                _objManageUserSession = new ManageUserSession(false);
                _objManageUserSession.Clear_Login_Page_Session();

                if (_objManageUserSession.Get_LoginTable != null)
                {
                    ApplicationConfig.RedirectToDefaultPage();
                }

                if (!IsPostBack)
                {
                    Session["HOME_PAGE_SAME_EMAIL_ID_USER_DETAILS"] = null;
                    Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                    txtLoginId.Focus();
                }
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (Read_Cookies() == false)
                {
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtLoginId.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtLoginId, 6, "Login Id");
                    txtLoginId.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtPassword.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtPassword, 6, "Password");
                    txtPassword.Focus();
                    return;
                }

                LoginUserProfile objLoginUserProfile = new LoginUserProfile();
                objLoginUserProfile.Login_Id = txtLoginId.Text.Trim();
                objLoginUserProfile.Password = txtPassword.Text.Trim();
                objLoginUserProfile.Login_Device = 'W';
                objLoginUserProfile.Accessthrough = "Password";
                DataSet dsResult = _objDBCommon.Login_Authenticate(objLoginUserProfile);

                if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count != 0 && dsResult.Tables[0].Rows[0]["OutputMessage"].ToString() == "SUCCESS")
                {
                    ApplicationConfig.RedirectToDefaultPage();
                    return;
                }
                else
                {
                    _objMessage.ShowMessage(sender, txtPassword, Convert.ToInt32(_objUtility.ValidateDBNullEmptyValue(dsResult.Tables[0].Rows[0]["OutputMessageCode"], 0)), Convert.ToString(_objUtility.ValidateDBNullEmptyValue(dsResult.Tables[0].Rows[0]["OutputMessageAdditionalInfo"], "")));
                    return;
                }
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
            finally
            {
                try
                {
                    if (_objCustomAppSetting.Is_Apply_Password_Policy && _objUtility.ValidateDBNullEmptyValue(_objManageUserSession.Wrong_Password_Attempt) == false)
                    {
                        Dictionary<string, int> dicpwd = _objManageUserSession.Wrong_Password_Attempt;
                        Int64 value = 0;
                        if (_objUtility.ValidateDBNullEmptyValue(dicpwd) == false)
                        {
                            if (dicpwd.ContainsKey(txtLoginId.Text.Trim()))
                            {
                                value = Convert.ToInt32(dicpwd[txtLoginId.Text.Trim()]);
                            }
                        }
                        if (value >= _objCustomAppSetting.Account_Lockout_Threshold)
                        {
                            _objManageUserSession.Wrong_Password_Attempt = null;
                            HttpCookie myCookie = new HttpCookie(_objCustomAppSetting.Wrong_Password_Attemp_Cookies);
                            myCookie.Values.Add("wattempt", Convert.ToString(DateTimeHandler.Get_Currentdate.AddMinutes(Convert.ToDouble(_objCustomAppSetting.Account_Lockout_Duration_In_Min)).Ticks));
                            myCookie.Expires = DateTimeHandler.Get_Currentdate.AddMinutes(Convert.ToDouble(_objCustomAppSetting.Account_Lockout_Duration_In_Min));
                            Response.Cookies.Add(myCookie);
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        #endregion

        #region Private Function

        private bool Read_Cookies()
        {
            if (!_objCustomAppSetting.Is_Apply_Password_Policy)
            {
                return true;
            }

            HttpCookie myCookie = Request.Cookies[_objCustomAppSetting.Wrong_Password_Attemp_Cookies];
            if (_objUtility.ValidateDBNullEmptyValue(myCookie) == false && _objUtility.ValidateDBNullEmptyValue(myCookie.Values["wattempt"]) == false)
            {
                long result = 0;
                if (Int64.TryParse(myCookie.Values["wattempt"], out result))
                {
                    if (DateTimeHandler.Get_Currentdate.Ticks < Convert.ToInt64(myCookie.Values["wattempt"]))
                    {
                        _objMessage.ShowMessage(111, _objCustomAppSetting.Account_Lockout_Duration_In_Min);
                        return false;
                    }
                }
            }
            return true;
        }

        #endregion

    }
}