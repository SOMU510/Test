using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace YCS
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        #region Global Objects
        Utility _objUtility = new Utility();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        Notification _objNotification = new Notification();
        #endregion

        #region Load
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                btnResetTransactionPassword.Visible = false;
                if (!IsPostBack)
                {

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
        #endregion

        #region Reset Password
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValue(txt_Login_Id.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txt_Login_Id, 6, "Login Id");
                    txt_Login_Id.Focus();
                    return;
                }

                LoginUserProfile _Obj_User = new LoginUserProfile();
                _Obj_User.Login_Id = txt_Login_Id.Text.Trim();
                DataTable dtResetPassword = _objDBCommon.ResetPassword(_Obj_User, 'W', "RESET PASSWORD");

                if (Convert.ToString(dtResetPassword.Rows[0]["OutputResult"]) == "SUCCESS")
                {
                    if (dtResetPassword.Rows.Count > 0)
                    {
                        if (_objUtility.ValidateDBNullEmptyValue(dtResetPassword.Rows[0]["Email_Id"]) == false)
                        {
                            _objNotification.SendMail(_objNotification.GetArray(dtResetPassword.Rows[0]["Email_Id"]), "Your " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " Password Reset", "Dear " + dtResetPassword.Rows[0]["User_Name"] + ",<br/>Your Password for " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " has been reset successfully.<br/> Your New Password is " + dtResetPassword.Rows[0]["Password"].ToString().Trim() + "");
                        }

                        if (_objUtility.ValidateDBNullEmptyValue(dtResetPassword.Rows[0]["Mobile_No"]) == false)
                        {
                            _objNotification.SendSMS(dtResetPassword.Rows[0]["Mobile_No"].ToString(), "Hello, Your Password for " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " has been reset successfully. Your New Password is " + dtResetPassword.Rows[0]["Password"].ToString().Trim() + "");
                        }
                        _objMessage.ShowMessageWithURL(52, ApplicationConfig.Get_Login_Page_URL);
                    }

                }
                else
                {
                    _objMessage.ShowMessageWithURL(27, "Invalid Login Id");
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
        #endregion

        protected void btnResetTransactionPassword_Click(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValue(txt_Login_Id.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txt_Login_Id, 6, "Login Id");
                    txt_Login_Id.Focus();
                    return;
                }

                LoginUserProfile _Obj_User = new LoginUserProfile();
                _Obj_User.Login_Id = txt_Login_Id.Text.Trim();
                DataTable dtResetPassword = _objDBCommon.ResetPassword(_Obj_User, 'W', "RESET TRANSACTION PASSWORD");

                if (Convert.ToString(dtResetPassword.Rows[0]["OutputResult"]) == "SUCCESS")
                {
                    if (dtResetPassword.Rows.Count > 0)
                    {
                        if (_objUtility.ValidateDBNullEmptyValue(dtResetPassword.Rows[0]["Email_Id"]) == false)
                        {
                            _objNotification.SendMail(_objNotification.GetArray(dtResetPassword.Rows[0]["Email_Id"]), "Your " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " Transaction Password Reset", "Dear " + dtResetPassword.Rows[0]["User_Name"] + ",<br/>Your Transaction Password for " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " has been reset successfully.<br/> Your New Transaction Password is " + dtResetPassword.Rows[0]["Password"].ToString().Trim() + "");
                        }

                        if (_objUtility.ValidateDBNullEmptyValue(dtResetPassword.Rows[0]["Mobile_No"]) == false)
                        {
                            _objNotification.SendSMS(dtResetPassword.Rows[0]["Mobile_No"].ToString(), "Hello, Your Transaction Password for " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " has been reset successfully. Your New Transaction Password is " + dtResetPassword.Rows[0]["Password"].ToString().Trim() + "");
                        }
                        _objMessage.ShowMessageWithURL(52, ApplicationConfig.Get_Login_Page_URL);
                    }

                }
                else
                {
                    _objMessage.ShowMessageWithURL(27, "Invalid Login Id");
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
    }
}