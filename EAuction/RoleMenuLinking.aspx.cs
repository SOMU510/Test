using System;
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
    public partial class RoleMenuLinking : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        private const string MENU_CODE = "1010";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        #endregion

        #region Page and Control Events

        /// <summary>
        /// Page Load Event : It Gets triggered on every page refresh or postback.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["HOME_PAGE_ACTIVE_MENU_CODE"] = MENU_CODE;
                _objManageUserSession = new ManageUserSession(MENU_CODE, spanHeader, liMenuHeaderIcon);

                if (!IsPostBack)
                {
                    _TransactionPassword();
                    Control_Clear();
                    _Bind_Control();
                }

                if (_objUtility.Is_Grid_CheckAll_Event(grdData, "chkAll"))
                {
                    chkAll_CheckedChanged(grdData.HeaderRow.FindControl("chkAll"), null);
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


        protected void ddlRoleType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SubControl_Clear();
                ddlRoleName.Items.Clear();
                if (_objUtility.ValidateDBNullEmptyValueInList(ddlRoleType.SelectedValue, true) == false)
                {
                    _objMasterCollection.BindRole(0, 1, ddlRoleName, true, Convert.ToInt64(ddlRoleType.SelectedValue));
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

        protected void ddlRoleName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                RoleMenuRightGrid_Bind();
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }


        protected void rbSelectDefault_CheckedChanged(object sender, System.EventArgs e)
        {
            try
            {
                RadioButton rbButton = (RadioButton)sender;
                GridViewRow row = (GridViewRow)rbButton.NamingContainer;
                hdfDefaultMenuId.Value = "0";
               
                if (!((CheckBox)row.FindControl("cbIndividual")).Checked)
                {
                    ((RadioButton)row.FindControl("rbSelectDefault")).Checked = false;
                    _objMessage.ShowMessage(sender, ((CheckBox)row.FindControl("cbIndividual")), 25, "Menu first");
                    return;
                }

                foreach (GridViewRow gvrow in grdData.Rows)
                {
                   ((RadioButton)gvrow.FindControl("rbSelectDefault")).Checked = false;
                }

                ((RadioButton)row.FindControl("rbSelectDefault")).Checked = true;
                hdfDefaultMenuId.Value = ((HiddenField)row.FindControl("hdfMenuId")).Value;
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        #endregion

        #region Private Functions

        private void Control_Clear()
        {
            _objUtility.AssignButtonValidationGroup(btnSave, "Save");
            _objUtility.AssignButtonValidationGroup(btnClear, "Clear");
            _TransactionPassword();
            SubControl_Clear();
            hdfId.Value = "0";
            hdfDefaultMenuId.Value = "0";
            txtActionRemarks.Text = "";
            txtRemark.Text = "";
            if (ddlFirm.Items.Count > 0)
            {
                ddlFirm.SelectedIndex = 0;
            }
            if (ddlRoleType.Items.Count > 0)
            {
                ddlRoleType.SelectedIndex = 0;
            }
            if (ddlRoleName.Items.Count > 0)
            {
                ddlRoleName.SelectedIndex = 0;
            }

            rfvActionRemarks.ValidationGroup = Utility.GarbageValidationGroup;
        }

        private void _Bind_Control()
        {
            _objMasterCollection.BindFirmList(0, EnumCollection.SearchRecord.MAIN_DATA, 1, ddlFirm, false);
            _objMasterCollection.FillAnyListFromEnum(ddlRoleType, EnumCollection.EnumType.Role_Type, 1, true);
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

        private void GridRow_Clear(CheckBox chk)
        {
            ((CheckBox)(chk.NamingContainer.FindControl("cbIndividual"))).Checked = false;
        }

        private DataTable CreateRoleMenuRightTable()
        {
            DataTable dtRoleMenuRight = new DataTable();
            dtRoleMenuRight.Columns.Add("Row_No");
            dtRoleMenuRight.Columns.Add("Role_Menu_Right_Id");
            dtRoleMenuRight.Columns.Add("Firm_Id");
            dtRoleMenuRight.Columns.Add("Role_Id");
            dtRoleMenuRight.Columns.Add("Menu_Id", typeof(Int64));
            dtRoleMenuRight.Columns.Add("Is_Default", typeof(bool));

            dtRoleMenuRight.Columns.Add("Status_Id");
            dtRoleMenuRight.Columns.Add("Remarks");

            dtRoleMenuRight.Columns.Add("Action_Remarks");
            dtRoleMenuRight.Columns.Add("Login_UserId");
            dtRoleMenuRight.Columns.Add("CurrentDateTime", typeof(DateTime));
            dtRoleMenuRight.Columns.Add("LoginSessionId");
            dtRoleMenuRight.Columns.Add("ActionFrom_Screen");
            dtRoleMenuRight.Columns.Add("Action_Menu_Code");

            dtRoleMenuRight.Columns.Add("Menu_Name");
            dtRoleMenuRight.Columns.Add("Parent_Menu_Name");
            dtRoleMenuRight.Columns.Add("Is_Available", typeof(bool));


            return dtRoleMenuRight;
        }

        private void SubControl_Clear()
        {
            hdfDefaultMenuId.Value = "0";
            grdData.DataSource = new DataTable();
            grdData.DataBind();
        }

        private void RoleMenuRightGrid_Bind()
        {
            SubControl_Clear();

            if (_objUtility.ValidateDBNullEmptyValueInList(ddlFirm.SelectedValue, true) == false && _objUtility.ValidateDBNullEmptyValueInList(ddlRoleType.SelectedValue, true) == false && _objUtility.ValidateDBNullEmptyValueInList(ddlRoleName.SelectedValue, true) == false)
            {
                DataTable dtRoleMenuRight = _objMasterCollection.BindMenu(1, null, true, true, true, 0, 0);

                DataTable dtDBRoleMenuRight = _objMasterCollection.BindRoleMenuRight(Convert.ToInt64(hdfId.Value), 1, null, false, Convert.ToInt64(ddlRoleName.SelectedValue), Convert.ToInt64(ddlFirm.SelectedValue), 0);

                DataTable dtCreateRoleMenuRight = CreateRoleMenuRightTable();

                DataRow[] drInfo = null;

                for (int idoc = 0; idoc < dtRoleMenuRight.Rows.Count; idoc++)
                {
                    DataRow drData = dtCreateRoleMenuRight.NewRow();

                    drData["Row_No"] = idoc;
                    drData["Menu_Id"] = dtRoleMenuRight.Rows[idoc]["Menu_Id"];
                    drData["Menu_Name"] = dtRoleMenuRight.Rows[idoc]["Menu_Unique_Name"];
                    drData["Parent_Menu_Name"] = dtRoleMenuRight.Rows[idoc]["Parent_Menu_Unique_Name"];

                    drInfo = dtDBRoleMenuRight.Select("Menu_Id='" + dtRoleMenuRight.Rows[idoc]["Menu_Id"] + "'");

                    if (drInfo.Length > 0)
                    {

                        drData["Is_Available"] = true;

                        drData["Role_Menu_Right_Id"] = (Int64)drInfo[0]["Role_Menu_Right_Id"];
                        drData["Is_Default"] = (bool)_objUtility.ValidateDBNullEmptyValue(drInfo[0]["Is_Default"], false);

                    }
                    else
                    {
                        drData["Is_Available"] = false;
                        drData["Is_Default"] = false;
                    }
                    dtCreateRoleMenuRight.Rows.Add(drData);
                }
                grdData.DataSource = dtCreateRoleMenuRight;
                grdData.DataBind();
                DataRow[] drDefault = dtDBRoleMenuRight.Select("Is_Default=1");
                if (drDefault != null && drDefault.Length > 0)
                {
                    hdfDefaultMenuId.Value = Convert.ToString(drDefault[0]["Menu_Id"]);
                }

                if (dtDBRoleMenuRight != null && dtDBRoleMenuRight.Rows.Count > 0)
                {
                    _objUtility.AssignButtonValidationGroup(btnSave, "Update");
                    divActionRemark.Visible = true;
                    rfvActionRemarks.ValidationGroup = "Save";
                }
                else
                {
                    divActionRemark.Visible = false;
                    rfvActionRemarks.ValidationGroup = "Save";
                }
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
                if (_objUtility.ValidateDBNullEmptyValueInList(ddlFirm.SelectedValue, true))
                {
                    _objMessage.ShowMessage(sender, ddlFirm, 8, "Firm");
                    ddlFirm.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValueInList(ddlRoleType.SelectedValue, true))
                {
                    _objMessage.ShowMessage(sender, ddlRoleType, 8, "Role Type");
                    ddlRoleType.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValueInList(ddlRoleName.SelectedValue, true))
                {
                    _objMessage.ShowMessage(sender, ddlRoleName, 8, "Role Name");
                    ddlRoleName.Focus();
                    return;
                }

                if (divActionRemark.Visible && _objUtility.ValidateDBNullEmptyValue(txtActionRemarks.Text.Trim()))
                {
                    _objMessage.ShowMessage(btnSave, txtActionRemarks, 6, "Reason For Change");
                    txtActionRemarks.Focus();
                    return;
                }

                if (_objDBCommon.Is_Valid_Transaction_Password(txtUserTransactionPassword, _objManageUserSession) == false)
                {
                    return;
                }

                DataTable dtRoleMenuRight = CreateRoleMenuRightTable();
                DataTable dtRoleMenuRightDelete = CreateRoleMenuRightTable();

                int counter = 0;
                int counterDelete = 0;
                bool flagdefault = false;

                for (int ichk = 0; ichk < grdData.Rows.Count; ichk++)
                {
                    RadioButton temprbdefault = (RadioButton)grdData.Rows[ichk].FindControl("rbSelectDefault");
                    GridViewRow grdRow = grdData.Rows[ichk];

                    if (((CheckBox)grdRow.FindControl("cbIndividual")).Checked == true)
                    {
                        if (temprbdefault.Checked == true)
                        {
                            flagdefault = true;
                        }
                        DataRow drData = dtRoleMenuRight.NewRow();
                        drData["Row_No"] = counter;
                        drData["Role_Menu_Right_Id"] = ((HiddenField)grdRow.FindControl("hdfFirmRoleMenuRightId")).Value;
                        drData["Firm_Id"] = ddlFirm.SelectedValue;
                        drData["Role_Id"] = ddlRoleName.SelectedValue;
                        drData["Menu_Id"] = ((HiddenField)grdRow.FindControl("hdfMenuId")).Value;
                        drData["Is_Default"] = ((RadioButton)grdRow.FindControl("rbSelectDefault")).Checked;
                        drData["Status_Id"] = 1;
                        drData["Remarks"] = txtRemark.Text.Trim();
                        drData["Action_Remarks"] = txtActionRemarks.Text.Trim();
                        drData["Login_UserId"] = _objManageUserSession.GetCurrentLogin_User_Id;
                        drData["CurrentDateTime"] = _currentDateTime;
                        drData["LoginSessionId"] = _objManageUserSession.GetCurrentUser_LoginSessionId;
                        drData["ActionFrom_Screen"] = this.Page.ToString();
                        drData["Action_Menu_Code"] = MENU_CODE;
                        dtRoleMenuRight.Rows.Add(drData);
                        counter++;
                    }

                    else if (((CheckBox)grdRow.FindControl("cbIndividual")).Checked == false && _objUtility.ValidateDBNullEmptyValue(((HiddenField)grdRow.FindControl("hdfFirmRoleMenuRightId")).Value) == false) // Unchecked old record
                    {
                        if (((HiddenField)grdRow.FindControl("hdfFirmRoleMenuRightId")).Value != "0")
                        {
                            DataRow drData = dtRoleMenuRightDelete.NewRow();

                            drData["Row_No"] = counterDelete;
                            drData["Role_Menu_Right_Id"] = ((HiddenField)grdRow.FindControl("hdfFirmRoleMenuRightId")).Value;
                            drData["Firm_Id"] = ddlFirm.SelectedValue;
                            drData["Role_Id"] = ddlRoleName.SelectedValue;
                            drData["Menu_Id"] = ((HiddenField)grdRow.FindControl("hdfMenuId")).Value;
                            drData["Is_Default"] = ((RadioButton)grdRow.FindControl("rbSelectDefault")).Checked;
                            drData["Status_Id"] = 2;
                            drData["Remarks"] = txtRemark.Text.Trim();
                            drData["Action_Remarks"] = txtActionRemarks.Text.Trim();
                            drData["Login_UserId"] = _objManageUserSession.GetCurrentLogin_User_Id;
                            drData["CurrentDateTime"] = _currentDateTime;
                            drData["ActionFrom_Screen"] = this.Page.ToString();
                            drData["Action_Menu_Code"] = MENU_CODE;
                            drData["LoginSessionId"] = _objManageUserSession.GetCurrentUser_LoginSessionId;
                            dtRoleMenuRightDelete.Rows.Add(drData);
                            counterDelete++;
                        }
                    }
                }


                dtRoleMenuRight.Columns.Remove("Menu_Name");
                dtRoleMenuRight.Columns.Remove("Parent_Menu_Name");
                dtRoleMenuRight.Columns.Remove("Is_Available");
                dtRoleMenuRightDelete.Columns.Remove("Menu_Name");
                dtRoleMenuRightDelete.Columns.Remove("Parent_Menu_Name");
                dtRoleMenuRightDelete.Columns.Remove("Is_Available");
                if (dtRoleMenuRight.Rows.Count == 0 && dtRoleMenuRightDelete.Rows.Count == 0)
                {
                    _objMessage.ShowMessage(11);
                    ddlFirm.Focus();
                    return;
                }
                if (flagdefault == false)
                {
                    _objMessage.ShowMessage(8, "One Default Menu");
                    return;
                }
                List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
                lstDBMapParam.Add(new DBMapParam() { Name = "Role_Menu_Right_Insert", Value = dtRoleMenuRight });
                lstDBMapParam.Add(new DBMapParam() { Name = "Role_Menu_Right_Delete", Value = dtRoleMenuRightDelete });
                lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Role_Right_Menu", lstDBMapParam);

                if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                {
                    if (btnSave.Text.Contains("Save"))
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
                    _objMessage.ShowMessage(28, dictResult["OutputMessage"]);
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

        protected void grdData_PreRender(object sender, EventArgs e)
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
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox chkAll = (CheckBox)sender;

                for (int ichk = 0; ichk < grdData.Rows.Count; ichk++)
                {
                    ((CheckBox)grdData.Rows[ichk].FindControl("cbIndividual")).Checked = chkAll.Checked;
                    //if (chkAll.Checked == false)
                    //{
                    //    GridRow_Clear((CheckBox)grdData.Rows[ichk].FindControl("cbIndividual"));
                    //}
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