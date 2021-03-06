﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using YCS;

namespace eAuction
{
    public partial class StateMaster : System.Web.UI.Page
    {
        #region Global Objects
        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        private const string MENU_CODE = "1006";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        TextBox txtStateCode = new TextBox() { Visible = false };
        #endregion

        #region Page Load Event

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["HOME_PAGE_ACTIVE_MENU_CODE"] = MENU_CODE;
                _objManageUserSession = new ManageUserSession(MENU_CODE, spanHeader, liMenuHeaderIcon);
                if (!IsPostBack)
                {
                    _TransactionPassword();
                    _Control_Clear();
                    _Bind_Control();
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
        private void _Control_Clear()
        {
            _objUtility.AssignButtonValidationGroup(btnSave, "Save");
            _objUtility.AssignButtonValidationGroup(btnClear, "Clear");
            _TransactionPassword();
            txtStateName.Text = "";
            txtStateCode.Text = "";
            txtRemarks.Text = "";
            txtActionRemarks.Text = "";
            divActionRemark.Visible = false;
            hdfStateId.Value = "0";
            ddlStatus.Enabled = false;
            if (ddlStatus.Items.Count > 0)
            {
                ddlStatus.SelectedIndex = 0;
            }

            rfvActionRemarks.ValidationGroup = Utility.GarbageValidationGroup;

            txtStateName.Focus();
        }

        private void _Bind_Control()
        {
            _objMasterCollection.FillStatus(ddlStatus, EnumCollection.StatusType.Row_Status, false);
            _objMasterCollection.BindState(0, 0, grdData, false);
        }

        private void _TransactionPassword()
        {
            if (!_objUtility.ValidateDBNullEmptyValue(_objManageUserSession.GetCurrent_Trans_Password))
            {
                divTransactionPass.Attributes["class"] = "ShowPass";
                rfvUserTransactionPassword.ValidationGroup = "Save";
                lblTransactionPassword.Visible = true;
                txtUserTransactionPassword.Visible = true;
            }
            else
            {
                divTransactionPass.Attributes["class"] = "HidePass";
                rfvUserTransactionPassword.ValidationGroup = "Savexyz";
                lblTransactionPassword.Visible = false;
                txtUserTransactionPassword.Visible = false;
            }
        }

        #endregion

        #region Save And Clear Events

        /// <summary>
        /// Save Button Click Event : It is used to save data.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

                if (_objUtility.ValidateDBNullEmptyValue(txtStateName.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtStateName, 6, "State Name");
                    txtStateName.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtStateCode.Text.Trim()) && txtStateCode.Visible)
                {
                    _objMessage.ShowMessage(sender, txtStateCode, 6, "State Code");
                    txtStateCode.Focus();
                    return;
                }

                if (hdfStateId.Value != "0" && _objUtility.ValidateDBNullEmptyValue(txtActionRemarks.Text.Trim()))
                {
                    _objMessage.ShowMessage(btnSave, txtActionRemarks, 6, "Reason For Change");
                    txtActionRemarks.Focus();
                    return;
                }

                if (_objDBCommon.Is_Valid_Transaction_Password(txtUserTransactionPassword, _objManageUserSession) == false)
                {
                    return;
                }

                List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
                lstDBMapParam.Add(new DBMapParam() { Name = "State_Id", Value = hdfStateId.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "State_Name", Value = txtStateName.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "State_Code", Value = txtStateCode.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = ddlStatus.SelectedValue });
                lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = txtRemarks.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = txtActionRemarks.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
                lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
                lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });
                lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_State", lstDBMapParam);

                if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                {
                    if (hdfStateId.Value == "0")
                    {
                        _objMessage.ShowMessageWithURL(5, _objUtility.GetCurrentURL, "Saved");
                    }
                    else
                    {
                        _objMessage.ShowMessageWithURL(5, _objUtility.GetCurrentURL, "Updated");
                    }
                }
                else
                {
                    if (Convert.ToString(dictResult["OutputMessage"]).Contains("State Name"))
                    {
                        _objMessage.ShowMessage(btnSave, txtStateName, 7, dictResult["OutputMessage"]);
                        txtStateName.Focus();
                        return;
                    }
                    else if (Convert.ToString(dictResult["OutputMessage"]).Contains("State Code"))
                    {
                        _objMessage.ShowMessage(btnSave, txtStateCode, 7, dictResult["OutputMessage"]);
                        txtStateCode.Focus();
                        return;
                    }
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

        /// <summary>
        /// Clear Button Click Event : It is used to refresh page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnClear_Click(object sender, EventArgs e)
        {
            try
            {
                _objUtility.Page_Redirect();
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

        #region Grid Events

        protected void grdData_PreRender(object sender, System.EventArgs e)
        {
            // gv1.UseAccessibleHeader = true;
            try
            {
                if (grdData.Rows.Count > 0)
                {
                    //Replace the <td> with <th> and adds the scope attribute
                    grdData.UseAccessibleHeader = true;

                    //Adds the <thead> and <tbody> elements required for DataTables to work
                    grdData.HeaderRow.TableSection = TableRowSection.TableHeader;

                    //Adds the <tfoot> element required for DataTables to work
                    grdData.FooterRow.TableSection = TableRowSection.TableFooter;
                }
                // gv1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edt")
                {
                    int rowid = Convert.ToInt32(e.CommandArgument);

                    hdfStateId.Value = ((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdState_Id")).Value;
                    txtStateName.Text = ((Label)grdData.Rows[rowid].FindControl("lblStateName")).Text;
                    txtStateCode.Text = ((Label)grdData.Rows[rowid].FindControl("lblStateCode")).Text;

                    if (ddlStatus.Items.FindByValue(((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdStatus_Id")).Value) != null)
                    {
                        ddlStatus.SelectedValue = ((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdStatus_Id")).Value;
                    }
                    txtRemarks.Text = ((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdRemarks")).Value;
                    divActionRemark.Visible = true;
                    txtActionRemarks.Text = "";
                    rfvActionRemarks.ValidationGroup = "Save";
                    rfvActionRemarks.Visible = true;
                    ddlStatus.Enabled = true;

                    _objUtility.AssignButtonValidationGroup(btnSave, "Update");
                    txtStateName.Focus();
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
    }
}