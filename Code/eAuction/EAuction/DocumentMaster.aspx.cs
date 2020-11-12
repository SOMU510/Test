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
    public partial class DocumentMaster : System.Web.UI.Page
    {
        #region Global Objects
        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        private const string MENU_CODE = "1004";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        TextBox txtDocumentCode = new TextBox() { Visible = false };

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
            hdf_DocumentId.Value = hdf_Document_Internal_Code.Value = "0";
            _objUtility.ClearInputs(Page.Controls);

            divActionRemark.Visible = false;
            rfvActionRemarks.ValidationGroup = "none";
            rfvActionRemarks.Visible = false;
            ddlStatus.Enabled = false;
            txtDocumentName.Enabled = true;
            hdfIsEditable.Value = "True";
            hdfUniqueNo_Min_Length.Value = hdfUniqueNo_Max_Length.Value = "0";
            hdfUniqueNo_Character_Allowed.Value = hdfValidation_Regex.Value = "";
            hdfIs_Multiple_Allowed.Value = "False";
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

        private void _Bind_Control()
        {
            _objMasterCollection.FillStatus(ddlStatus, EnumCollection.StatusType.Row_Status, false);
            _objMasterCollection.FillDocument(rptData, 0, 0, false);
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
                if (_objUtility.ValidateDBNullEmptyValue(txtDocumentName.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtDocumentName, 6, "Document Name");
                    txtDocumentName.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtDocumentCode.Text.Trim()) && txtDocumentCode.Visible)
                {
                    _objMessage.ShowMessage(sender, txtDocumentCode, 6, "Document Code");
                    txtDocumentCode.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValueInList(ddlStatus.SelectedValue, true))
                {
                    _objMessage.ShowMessage(sender, ddlStatus, 8, "Status");
                    ddlStatus.Focus();
                    return;
                }

                if (hdf_DocumentId.Value != "0" && _objUtility.ValidateDBNullEmptyValue(txtActionRemarks.Text.Trim()))
                {
                    _objMessage.ShowMessage(btnSave, txtActionRemarks, 6, "Reason For Change");
                    txtActionRemarks.Focus();
                    return;
                }

                if (_objDBCommon.Is_Valid_Transaction_Password(txtUserTransactionPassword, _objManageUserSession) == false)
                {
                    return;
                }
                List<DBMapParam> param = new List<DBMapParam>();
                param.Add(new DBMapParam() { Name = "Document_Id", Value = hdf_DocumentId.Value });
                param.Add(new DBMapParam() { Name = "Document_Name", Value = txtDocumentName.Text.Trim() });
                param.Add(new DBMapParam() { Name = "Document_Code", Value = txtDocumentCode.Text.Trim() });
                param.Add(new DBMapParam() { Name = "Is_Required_Valid_Up_To", Value = ChkIsRequiredValidUpTo.Checked });
                if (hdfUniqueNo_Min_Length.Value == "0" || _objUtility.ValidateDBNullEmptyValue(hdfUniqueNo_Min_Length.Value))
                {
                    param.Add(new DBMapParam() { Name = "UniqueNo_Min_Length", Value = DBNull.Value });
                }
                else
                {
                    param.Add(new DBMapParam() { Name = "UniqueNo_Min_Length", Value = hdfUniqueNo_Min_Length.Value });
                }
                if (hdfUniqueNo_Max_Length.Value == "0" || _objUtility.ValidateDBNullEmptyValue(hdfUniqueNo_Max_Length.Value))
                {
                    param.Add(new DBMapParam() { Name = "UniqueNo_Max_Length", Value = DBNull.Value });
                }
                else
                {
                    param.Add(new DBMapParam() { Name = "UniqueNo_Max_Length", Value = hdfUniqueNo_Max_Length.Value });
                }
                if (_objUtility.ValidateDBNullEmptyValue(hdfIs_Multiple_Allowed.Value))
                {
                    param.Add(new DBMapParam() { Name = "Is_Multiple_Allowed", Value = DBNull.Value });
                }
                else
                {
                    param.Add(new DBMapParam() { Name = "Is_Multiple_Allowed", Value = hdfIs_Multiple_Allowed.Value });
                }
                if (_objUtility.ValidateDBNullEmptyValue(hdfUniqueNo_Character_Allowed.Value))
                {
                    param.Add(new DBMapParam() { Name = "UniqueNo_Character_Allowed", Value = DBNull.Value });
                }
                else
                {
                    param.Add(new DBMapParam() { Name = "UniqueNo_Character_Allowed", Value = hdfUniqueNo_Character_Allowed.Value });
                }
                if (_objUtility.ValidateDBNullEmptyValue(hdfValidation_Regex.Value))
                {
                    param.Add(new DBMapParam() { Name = "Validation_Regex", Value = DBNull.Value });
                }
                else
                {
                    param.Add(new DBMapParam() { Name = "Validation_Regex", Value = hdfValidation_Regex.Value });
                }
                param.Add(new DBMapParam() { Name = "Is_Editable", Value = hdfIsEditable.Value });

                param.Add(new DBMapParam() { Name = "Status_Id", Value = ddlStatus.SelectedValue });
                param.Add(new DBMapParam() { Name = "Remarks", Value = txtRemarks.Text.Trim() });
                param.Add(new DBMapParam() { Name = "Action_Remarks", Value = txtActionRemarks.Text.Trim() });
                param.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
                param.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
                param.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                param.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
                param.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });

                param.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Document", param);

                if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                {
                    if (hdf_DocumentId.Value == "0")
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
                    if (Convert.ToString(dictResult["OutputMessage"]).Contains("Document Name"))
                    {
                        _objMessage.ShowMessage(btnSave, txtDocumentName, 7, dictResult["OutputMessage"]);
                        txtDocumentName.Focus();
                        return;
                    }
                    else if (Convert.ToString(dictResult["OutputMessage"]).Contains("Document Code"))
                    {
                        _objMessage.ShowMessage(btnSave, txtDocumentCode, 7, dictResult["OutputMessage"]);
                        txtDocumentCode.Focus();
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

        #region Repeater Control
        protected void rptData_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edt")
                {
                    hdf_DocumentId.Value = (e.Item.FindControl("hdf_grd_DocumentId") as HiddenField).Value;
                    hdf_Document_Internal_Code.Value = (e.Item.FindControl("hdf_grd_Document_Internal_Code") as HiddenField).Value;
                    txtDocumentName.Text = (e.Item.FindControl("lbl_DocumentName") as Label).Text;
                    txtDocumentCode.Text = (e.Item.FindControl("lbl_DocumentCode") as Label).Text;
                    bool Is_Editable = Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue((e.Item.FindControl("hdf_grd_Is_Editable") as HiddenField).Value, false));
                    txtDocumentName.Enabled = Is_Editable;
                    hdfIsEditable.Value = Is_Editable.ToString();
                    if ((e.Item.FindControl("lbl_IsRequiredValidUpTo") as Label).Text.ToUpper() == "YES")
                    {
                        ChkIsRequiredValidUpTo.Checked = true;
                    }
                    else
                    {
                        ChkIsRequiredValidUpTo.Checked = false;
                    }
                    bool Is_Multiple_Allowed = Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue((e.Item.FindControl("hdf_grd_Is_Multiple_Allowed") as HiddenField).Value, false));
                    hdfIs_Multiple_Allowed.Value = Is_Multiple_Allowed.ToString();
                    hdfUniqueNo_Min_Length.Value = (e.Item.FindControl("hdf_grd_UniqueNo_Min_Length") as HiddenField).Value;
                    hdfUniqueNo_Max_Length.Value = (e.Item.FindControl("hdf_grd_UniqueNo_Max_Length") as HiddenField).Value;
                    hdfUniqueNo_Character_Allowed.Value = (e.Item.FindControl("hdf_grd_UniqueNo_Character_Allowed") as HiddenField).Value;
                    hdfValidation_Regex.Value = (e.Item.FindControl("hdf_grd_Validation_Regex") as HiddenField).Value;

                    txtRemarks.Text = (e.Item.FindControl("hdf_Remarks") as HiddenField).Value;
                    ddlStatus.SelectedValue = (e.Item.FindControl("hdf_Status_Id") as HiddenField).Value;

                    divActionRemark.Visible = true;
                    rfvActionRemarks.ValidationGroup = "Save";
                    rfvActionRemarks.Visible = true;
                    txtActionRemarks.Text = "";
                    ddlStatus.Enabled = Is_Editable;

                    _objUtility.AssignButtonValidationGroup(btnSave, "Update");
                    txtDocumentName.Focus();
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