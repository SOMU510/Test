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
    public partial class CompanyTypeMaster : System.Web.UI.Page
    {
        #region Global Objects
        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        private const string MENU_CODE = "1018";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        TextBox txtCompanyTypeCode = new TextBox() { Visible = false };
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
            hdfIsEditable.Value = "True";
            txtCompanyTypeName.Text = "";
            txtCompanyTypeCode.Text = "";
            txtActionRemarks.Text = "";
            txtRemarks.Text = "";
            divActionRemark.Visible = false;
            hdfId.Value = "0";
            ddlStatus.Enabled = false;
            if (ddlStatus.Items.Count > 0)
            {
                ddlStatus.SelectedIndex = 0;
            }
            rfvActionRemarks.ValidationGroup = Utility.GarbageValidationGroup;
            txtCompanyTypeName.Focus();
        }
        private void _Bind_Control()
        {
            _objMasterCollection.FillStatus(ddlStatus, EnumCollection.StatusType.Row_Status, false);

            _objMasterCollection.BindCompanyType(0, 0, grdData, false);
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
                if (_objUtility.ValidateDBNullEmptyValue(txtCompanyTypeName.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtCompanyTypeName, 6, "Company Type Name");
                    txtCompanyTypeName.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtCompanyTypeCode.Text.Trim()) && txtCompanyTypeCode.Visible)
                {
                    _objMessage.ShowMessage(sender, txtCompanyTypeCode, 6, "Company Type Code");
                    txtCompanyTypeCode.Focus();
                    return;
                }

                if (hdfId.Value != "0" && _objUtility.ValidateDBNullEmptyValue(txtActionRemarks.Text.Trim()))
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
                lstDBMapParam.Add(new DBMapParam() { Name = "Company_Type_Id", Value = hdfId.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Company_Type_Name", Value = txtCompanyTypeName.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Company_Type_Code", Value = txtCompanyTypeCode.Text.Trim() });
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

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Company_Type", lstDBMapParam);

                if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                {
                    if (hdfId.Value == "0")
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
                    if (Convert.ToString(dictResult["OutputMessage"]).Contains("Company Type Name"))
                    {
                        _objMessage.ShowMessage(btnSave, txtCompanyTypeName, 7, dictResult["OutputMessage"]);
                        txtCompanyTypeName.Focus();
                        return;
                    }
                    else if (Convert.ToString(dictResult["OutputMessage"]).Contains("Company Type Code"))
                    {
                        _objMessage.ShowMessage(btnSave, txtCompanyTypeCode, 7, dictResult["OutputMessage"]);
                        txtCompanyTypeCode.Focus();
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
                  
                    hdfId.Value = ((HiddenField)grdData.Rows[rowid].FindControl("hdfCompanyTypeId")).Value;
                    txtCompanyTypeName.Text = ((Label)grdData.Rows[rowid].FindControl("lblCompanyTypeName")).Text;
                    txtCompanyTypeCode.Text = ((Label)grdData.Rows[rowid].FindControl("lblCompanyTypeCode")).Text;
                    txtRemarks.Text = ((HiddenField)grdData.Rows[rowid].FindControl("hdfRemark")).Value;
                    bool Is_Editable = Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue(((HiddenField)grdData.Rows[rowid].FindControl("hdfIsEditable")).Value, false));
                    txtCompanyTypeName.Enabled = Is_Editable;
                    txtCompanyTypeCode.Enabled = Is_Editable;
                    hdfIsEditable.Value = Is_Editable.ToString();

                    if (ddlStatus.Items.FindByValue(((HiddenField)grdData.Rows[rowid].FindControl("hdfStatusId")).Value) != null)
                    {
                        ddlStatus.SelectedValue = ((HiddenField)grdData.Rows[rowid].FindControl("hdfStatusId")).Value;
                    }
                    divActionRemark.Visible = true;
                    rfvActionRemarks.ValidationGroup = "Save";
                    rfvActionRemarks.Visible = true;
                    ddlStatus.Enabled = true;
                    txtActionRemarks.Text = "";
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
    }
}