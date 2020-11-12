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
    public partial class CategoryMaster : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        private const string MENU_CODE = "1016";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        TextBox txtCategoryCode = new TextBox() { Visible = false };
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
            ddlCategoryType.Enabled = true;
            txtCategoryName.Text = "";
            txtCategoryCode.Text = "";
            txtRemarks.Text = "";
            txtActionRemarks.Text = "";
            divActionRemark.Visible = false;
            hdfCategoryId.Value = "0";
            ddlStatus.Enabled = false;
            if (ddlStatus.Items.Count > 0)
            {
                ddlStatus.SelectedIndex = 0;
            }

            if (ddlCategoryType.Items.Count > 0)
            {
                ddlCategoryType.SelectedIndex = 0;
            }

            rfvActionRemarks.ValidationGroup = Utility.GarbageValidationGroup;

            ddlCategoryType.Focus();
        }

        private void _Bind_Control()
        {
            _objMasterCollection.FillStatus(ddlStatus, EnumCollection.StatusType.Row_Status, false);

            _objMasterCollection.FillAnyListFromEnum(ddlCategoryType, EnumCollection.EnumType.Category_Type, 1, true);
            _objMasterCollection.BindCategory(0, 0, 0, grdData, false);
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
                if (_objUtility.ValidateDBNullEmptyValueInList(ddlCategoryType.SelectedValue, true))
                {
                    _objMessage.ShowMessage(sender, txtCategoryName, 8, "Category Type");
                    ddlCategoryType.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtCategoryName.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtCategoryName, 6, "Category Name");
                    txtCategoryName.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtCategoryCode.Text.Trim()) && txtCategoryCode.Visible)
                {
                    _objMessage.ShowMessage(sender, txtCategoryCode, 6, "Category Code");
                    txtCategoryCode.Focus();
                    return;
                }

                if (hdfCategoryId.Value != "0" && _objUtility.ValidateDBNullEmptyValue(txtActionRemarks.Text.Trim()))
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
                lstDBMapParam.Add(new DBMapParam() { Name = "Category_Id", Value = hdfCategoryId.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Category_Type_Enum_Id", Value = ddlCategoryType.SelectedValue });
                lstDBMapParam.Add(new DBMapParam() { Name = "Category_Name", Value = txtCategoryName.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Category_Code", Value = txtCategoryCode.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = ddlStatus.SelectedValue.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = txtRemarks.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = txtActionRemarks.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
                lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
                lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });
                lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Category", lstDBMapParam);

                if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                {
                    if (hdfCategoryId.Value == "0")
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
                    if (Convert.ToString(dictResult["OutputMessage"]).Contains("Category Name"))
                    {
                        _objMessage.ShowMessage(btnSave, txtCategoryName, 7, dictResult["OutputMessage"]);
                        txtCategoryName.Focus();
                        return;
                    }
                    else if (Convert.ToString(dictResult["OutputMessage"]).Contains("Category Code"))
                    {
                        _objMessage.ShowMessage(btnSave, txtCategoryCode, 7, dictResult["OutputMessage"]);
                        txtCategoryCode.Focus();
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
                    hdfCategoryId.Value = ((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdCategory_Id")).Value;
                    txtCategoryName.Text = ((Label)grdData.Rows[rowid].FindControl("lblCategoryName")).Text;
                    txtCategoryCode.Text= ((Label)grdData.Rows[rowid].FindControl("lblCategoryCode")).Text;
                    if (ddlCategoryType.Items.FindByValue(((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdCategory_Type_Enum_Id")).Value) != null)
                    {
                        ddlCategoryType.SelectedValue = ((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdCategory_Type_Enum_Id")).Value;
                    }
                    if (ddlStatus.Items.FindByValue(((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdStatus_Id")).Value) != null)
                    {
                        ddlStatus.SelectedValue = Convert.ToString(((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdStatus_Id")).Value);
                    }
                    txtRemarks.Text = Convert.ToString(((HiddenField)grdData.Rows[rowid].FindControl("hdfgrdRemarks")).Value);
                    divActionRemark.Visible = true;
                    txtActionRemarks.Text = "";
                    rfvActionRemarks.ValidationGroup = "Save";
                    rfvActionRemarks.Visible = true;
                    ddlStatus.Enabled = true;
                    ddlCategoryType.Enabled = false;
                    _objUtility.AssignButtonValidationGroup(btnSave, "Update");

                    ddlCategoryType.Focus();
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