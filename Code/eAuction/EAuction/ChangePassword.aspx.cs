using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using YCS;

namespace eAuction
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        #region Global Objects
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        Message _objMessage = new Message();
        MasterCollection _objMasterCollection = new MasterCollection();
        DBCommon _objDBCommon = new DBCommon();
        #endregion

        #region Load
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                _objManageUserSession = new ManageUserSession();

                if (!IsPostBack)
                {
                    _Clear_Control();
                }
                else
                {
                    chkbIsChangeTransactionPasssword_CheckedChanged(null, null);
                    chkIsChangePassword_CheckedChanged(null, null);
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

        #region Private Function
        private void _Clear_Control()
        {
            divChangeTransactionPassword.Visible = false;
            spanHeader.InnerText = "Change Password";

            ChangePasswordEnabledDisable(false);
            ChangeTranPasswordEnabledDisable(false);
            LoginValidationGroup(false);
            TranValidationGroup(false);

            if (!_objUtility.ValidateDBNullEmptyValue(_objManageUserSession.GetCurrent_Trans_Password))
            {
                divChangeTransactionPassword.Visible = true;
                spanHeader.InnerText = "Change Login/Transaction Password";
                chkIsChangePassword.Checked = false;
                chkIsChangePassword.Visible = true;
            }
            else
            {
                ChangePasswordEnabledDisable(true);
                LoginValidationGroup(true);
                chkIsChangePassword.Checked = true;
                chkIsChangePassword.Visible = false;
            }

         
            ClientSave("Change Password");
        }
        private void ChangePasswordEnabledDisable(bool enable)
        {
            txtNewPassword.Enabled = enable;
            txtOldPassword.Enabled = enable;
            txtreEnter.Enabled = enable;
        }
        private void ChangeTranPasswordEnabledDisable(bool enable)
        {
            txtTransactionOldPassword.Enabled = enable;
            txtNewTranactionPassword.Enabled = enable;
            txtReEnterNewTranactionPassword.Enabled = enable;
        }
        private void TranValidationGroup(bool enable)
        {
            rfvTransactionOldPassword.Enabled = enable;
            rfvNewTranactionPassword.Enabled = enable;
            rfvReEnterNewTranactionPassword.Enabled = enable;
        }
        private void LoginValidationGroup(bool enable)
        {
            rfvOldPassword.Enabled = enable;
            rfvNewPassword.Enabled = enable;
            rfvreEnter.Enabled = enable;
        }
        private void ClientSave(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnChangePassword, action);
        }
        #endregion

        #region Change Password

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            try
            {

                if (chkIsChangePassword.Checked == false && chkbIsChangeTransactionPasssword.Checked == false)
                {
                    _objMessage.ShowMessage(27, "Please Checked On Checkbox for Change Login/Transaction Change Password");
                    chkIsChangePassword.Focus();
                    return;
                }
                if (chkIsChangePassword.Checked == true)
                {

                    if (_objUtility.ValidateDBNullEmptyValue(txtOldPassword.Text.Trim()))
                    {
                        _objMessage.ShowMessage(6, "Old Password");
                        txtOldPassword.Focus();
                        return;
                    }
                    if (_objUtility.ValidateDBNullEmptyValue(txtNewPassword.Text.Trim()))
                    {
                        _objMessage.ShowMessage(6, "New Password");
                        txtNewPassword.Focus();
                        return;
                    }
                    if (_objUtility.ValidateDBNullEmptyValue(txtreEnter.Text.Trim()))
                    {
                        _objMessage.ShowMessage(6, "Re-Enter Password");
                        txtreEnter.Focus();
                        return;
                    }
                    if (txtNewPassword.Text.Trim() != txtreEnter.Text.Trim())
                    {
                        _objMessage.ShowMessage(6, "Re-Enter Password Same as New Password");
                        txtNewPassword.Focus();
                        return;
                    }
                    if (txtNewPassword.Text.Trim() == txtOldPassword.Text.Trim())
                    {
                        _objMessage.ShowMessage(32);
                        txtNewPassword.Focus();
                        return;
                    }
                }
                if (chkbIsChangeTransactionPasssword.Checked == true)
                {
                    //Transaction Change Password
                    if (_objUtility.ValidateDBNullEmptyValue(txtTransactionOldPassword.Text.Trim()))
                    {
                        _objMessage.ShowMessage(6, "Transaction Old Password");
                        txtTransactionOldPassword.Focus();
                        return;
                    }
                    if (_objUtility.ValidateDBNullEmptyValue(txtNewTranactionPassword.Text.Trim()))
                    {
                        _objMessage.ShowMessage(6, "Transaction New Password");
                        txtNewTranactionPassword.Focus();
                        return;
                    }
                    if (_objUtility.ValidateDBNullEmptyValue(txtReEnterNewTranactionPassword.Text.Trim()))
                    {
                        _objMessage.ShowMessage(6, "Transaction Re-Enter Password");
                        txtReEnterNewTranactionPassword.Focus();
                        return;
                    }
                    if (txtNewTranactionPassword.Text.Trim() != txtReEnterNewTranactionPassword.Text.Trim())
                    {
                        _objMessage.ShowMessage(6, "Transaction Re-Enter Password Same as New Transaction Password");
                        txtNewPassword.Focus();
                        return;
                    }
                    if (txtNewTranactionPassword.Text.Trim() == txtTransactionOldPassword.Text.Trim())
                    {
                        _objMessage.ShowMessage(32);
                        txtNewTranactionPassword.Focus();
                        return;
                    }
                }


                LoginUserProfile _Obj_User = new LoginUserProfile();
                _Obj_User.Login_Id = _objManageUserSession.GetCurrent_Login_Id;
                string ResultOutput = _objDBCommon.ChangePassword(_Obj_User, txtNewPassword.Text.Trim(), txtOldPassword.Text.Trim(), txtNewTranactionPassword.Text.Trim(), txtTransactionOldPassword.Text.Trim(), chkIsChangePassword.Checked, chkbIsChangeTransactionPasssword.Checked);
                if (ResultOutput == "INVALID LOGIN PASSWORD")
                {
                    _objMessage.ShowMessage(sender, txtOldPassword, 27, "Invalid Login Old Password");
                    return;
                }
                if (ResultOutput == "INVALID TRANSACTION PASSWORD")
                {
                    _objMessage.ShowMessage(sender, txtTransactionOldPassword, 27, "Invalid Transaction Old Password");
                    return;
                }
                if (ResultOutput == "SUCCESS")
                {
                    _objManageUserSession.GetCurrentUser_Is_Password_Reset_Required = false;
                    _objMessage.ShowMessageWithURL(17, ApplicationConfig.Get_Logout_Page_URL.Replace("~", ".."));
                }
                else
                {
                    _objMessage.ShowMessageWithURL(16, _objUtility.GetCurrentURL);
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

        #region Checkbox Event
        protected void chkbIsChangeTransactionPasssword_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (chkbIsChangeTransactionPasssword.Checked == true)
                {
                    ChangeTranPasswordEnabledDisable(true);
                    TranValidationGroup(true);
                }
                else
                {
                    txtNewTranactionPassword.Text = "";
                    txtTransactionOldPassword.Text = "";
                    txtReEnterNewTranactionPassword.Text = "";
                    ChangeTranPasswordEnabledDisable(false);
                    TranValidationGroup(false);
                }
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void chkIsChangePassword_CheckedChanged(object sender, EventArgs e)
        {
            try
            {

                if (chkIsChangePassword.Checked == true)
                {
                    ChangePasswordEnabledDisable(true);
                    LoginValidationGroup(true);
                }
                else
                {
                    txtNewPassword.Text = "";
                    txtOldPassword.Text = "";
                    txtreEnter.Text = "";
                    ChangePasswordEnabledDisable(false);
                    LoginValidationGroup(false);

                }
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }


        #endregion
    }
}