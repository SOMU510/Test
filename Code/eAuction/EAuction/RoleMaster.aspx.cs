using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Collections;
using YCS;

namespace eAuction
{
    public partial class RoleMaster : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        private const string MENU_CODE = "1003";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        TextBox txtRoleCode = new TextBox() { Visible = false };
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
            txtRoleName.Text = "";
            txtRoleCode.Text = "";
            txtActionRemarks.Text = "";
            txtRemarks.Text = "";
            divActionRemark.Visible = false;
            hdfRoleId.Value = "0";
            ddlStatus.Enabled = false;
            hdfIsEditable.Value = "True";
            if (ddlStatus.Items.Count > 0)
            {
                ddlStatus.SelectedIndex = 0;
            }
            if (ddlRoleType.Items.Count > 0)
            {
                ddlRoleType.SelectedIndex = 0;
            }
            rfvActionRemarks.ValidationGroup = Utility.GarbageValidationGroup;
            txtRoleName.Focus();
        }

        private void _Bind_Control()
        {
            _objMasterCollection.FillStatus(ddlStatus, EnumCollection.StatusType.Row_Status, false);

            _objMasterCollection.FillAnyListFromEnum(ddlRoleType, EnumCollection.EnumType.Role_Type, 1, true, 12, false); // Employee Role Type - 12
            _objMasterCollection.BindRole(0, 0, grdData, false, 12);
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
                if (_objUtility.ValidateDBNullEmptyValueInList(ddlRoleType.SelectedValue, true))
                {
                    _objMessage.ShowMessage(sender, ddlRoleType, 8, "Role Type");
                    ddlRoleType.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtRoleName.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtRoleName, 6, "Role Name");
                    txtRoleName.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtRoleCode.Text.Trim()) && txtRoleCode.Visible)
                {
                    _objMessage.ShowMessage(sender, txtRoleCode, 6, "Role Code");
                    txtRoleCode.Focus();
                    return;
                }

                if (hdfRoleId.Value != "0" && _objUtility.ValidateDBNullEmptyValue(txtActionRemarks.Text.Trim()))
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
                lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = hdfRoleId.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Role_Type_Enum_Id", Value = ddlRoleType.SelectedValue });
                lstDBMapParam.Add(new DBMapParam() { Name = "Role_Name", Value = txtRoleName.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Role_Code", Value = txtRoleCode.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Visible", Value = 1 });
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Editable", Value = hdfIsEditable.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = ddlStatus.SelectedValue });
                lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = txtRemarks.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = txtActionRemarks.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
                lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
                lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });
                lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Role", lstDBMapParam);

                if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                {
                    if (hdfRoleId.Value == "0")
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
                    if (Convert.ToString(dictResult["OutputMessage"]).Contains("Role Name"))
                    {
                        _objMessage.ShowMessage(btnSave, txtRoleName, 7, dictResult["OutputMessage"]);
                        txtRoleName.Focus();
                        return;
                    }
                    else if (Convert.ToString(dictResult["OutputMessage"]).Contains("Role Code"))
                    {
                        _objMessage.ShowMessage(btnSave, txtRoleCode, 7, dictResult["OutputMessage"]);
                        txtRoleCode.Focus();
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
                    GridView rd = grdData;

                    hdfRoleId.Value = ((HiddenField)grdData.Rows[rowid].FindControl("hdfRoleId")).Value;
                    txtRoleName.Text = ((Label)grdData.Rows[rowid].FindControl("lblRoleName")).Text;
                    txtRoleCode.Text = ((Label)grdData.Rows[rowid].FindControl("lblRoleCode")).Text;
                    txtRemarks.Text = ((HiddenField)grdData.Rows[rowid].FindControl("hdfRemark")).Value;
                    bool Is_Editable = Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue(((HiddenField)grdData.Rows[rowid].FindControl("hdfIsEditable")).Value, false));
                    txtRoleName.Enabled = Is_Editable;
                    txtRoleCode.Enabled = Is_Editable;
                    hdfIsEditable.Value = Is_Editable.ToString();

                    if (ddlRoleType.Items.FindByValue(((HiddenField)grdData.Rows[rowid].FindControl("hdfRoleTypeId")).Value) != null)
                    {
                        ddlRoleType.SelectedValue = ((HiddenField)grdData.Rows[rowid].FindControl("hdfRoleTypeId")).Value;
                    }
                    if (ddlStatus.Items.FindByValue(((HiddenField)grdData.Rows[rowid].FindControl("hdfStatusId")).Value) != null)
                    {
                        ddlStatus.SelectedValue = ((HiddenField)grdData.Rows[rowid].FindControl("hdfStatusId")).Value;
                    }
                    divActionRemark.Visible = true;
                    txtActionRemarks.Text = "";
                    rfvActionRemarks.ValidationGroup = "Save";
                    rfvActionRemarks.Visible = true;

                    ddlStatus.Enabled = Is_Editable;

                    _objUtility.AssignButtonValidationGroup(btnSave, "Update");
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

        public class a1
        {
            public void m1()
            {

            }
            
        }
        public class a2
        {
            a1 obj11 = new a1();
      
        }
    }
}