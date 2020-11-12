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
    public partial class DocumentSetting : System.Web.UI.Page
    {
        #region Global Objects
        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        private const string MENU_CODE = "1005";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
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
                    Page.Form.Attributes.Add("enctype", "multipart/form-data");
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

        private void Fill_Document_Settings_Data()
        {
            DataTable dtResult = _objMasterCollection.FillFirmDocumentSettingDetails(null, Convert.ToInt64(ddlFirm.SelectedValue), 1, "0", "0", "0", "0", false);

            if (dtResult != null)
            {
                if (dtResult.Rows.Count > 0)
                {

                    ddlStatus.SelectedValue = Convert.ToString(dtResult.Rows[0]["Status_Id"]);
                    txtRemarks.Text = Convert.ToString(dtResult.Rows[0]["Remarks"]);

                    divActionRemark.Visible = true;
                    rfvActionRemarks.ValidationGroup = "Save";
                    rfvActionRemarks.Visible = true;
                    txtActionRemarks.Text = "";
                    ddlStatus.Enabled = true;

                    hdf_Action.Value = "UPDATE";
                    _objUtility.AssignButtonValidationGroup(btnSave, "Update");

                    for (int i = 0; i < dtResult.Rows.Count; i++)
                    {
                        foreach (RepeaterItem row1 in rptData.Items)
                        {
                            if (((HiddenField)row1.FindControl("hdf_Document_Id")).Value == dtResult.Rows[i]["Document_Id"].ToString())
                            {
                                if (((DropDownList)row1.FindControl("ddl_Employee")).Items.FindByValue(Convert.ToString(dtResult.Rows[i]["Employee_Control_Status_Enum_Id"])) != null)
                                {
                                    ((DropDownList)row1.FindControl("ddl_Employee")).SelectedValue = Convert.ToString(dtResult.Rows[i]["Employee_Control_Status_Enum_Id"]);
                                }

                                if (((DropDownList)row1.FindControl("ddl_Supplier")).Items.FindByValue(Convert.ToString(dtResult.Rows[i]["Supplier_Control_Status_Enum_Id"])) != null)
                                {
                                    ((DropDownList)row1.FindControl("ddl_Supplier")).SelectedValue = Convert.ToString(dtResult.Rows[i]["Supplier_Control_Status_Enum_Id"]);
                                }

                                if (((DropDownList)row1.FindControl("ddl_Customer")).Items.FindByValue(Convert.ToString(dtResult.Rows[i]["Customer_Control_Status_Enum_Id"])) != null)
                                {
                                    ((DropDownList)row1.FindControl("ddl_Customer")).SelectedValue = Convert.ToString(dtResult.Rows[i]["Customer_Control_Status_Enum_Id"]);
                                }

                                if (((DropDownList)row1.FindControl("ddl_Client")).Items.FindByValue(Convert.ToString(dtResult.Rows[i]["Client_Control_Status_Enum_Id"])) != null)
                                {
                                    ((DropDownList)row1.FindControl("ddl_Client")).SelectedValue = Convert.ToString(dtResult.Rows[i]["Client_Control_Status_Enum_Id"]);
                                }
                            }
                        }
                    }

                }
                //else
                //{
                //    FillDocumentgrd();

                //}
            }
        }

        private bool ValidateControl()
        {
            bool Is_Valid = true;
            int EmpCnt_Check = 0, SupplierCnt_Check = 0, CustomerCnt_Check = 0, ClientCnt_Check = 0;
            if (hdf_Document_Setting_Id.Value == "0")
            {
                for (int ichk = 0; ichk < rptData.Items.Count; ichk++)
                {
                    RepeaterItem rptRow = rptData.Items[ichk];

                    if (((DropDownList)rptRow.FindControl("ddl_Employee")).SelectedValue == "3" || ((DropDownList)rptRow.FindControl("ddl_Employee")).SelectedValue == "2")
                    {
                        EmpCnt_Check = +1;
                    }
                    if (((DropDownList)rptRow.FindControl("ddl_Supplier")).SelectedValue == "3" || ((DropDownList)rptRow.FindControl("ddl_Supplier")).SelectedValue == "2")
                    {
                        SupplierCnt_Check = +1;
                    }
                    if (((DropDownList)rptRow.FindControl("ddl_Customer")).SelectedValue == "3" || ((DropDownList)rptRow.FindControl("ddl_Customer")).SelectedValue == "2")
                    {
                        CustomerCnt_Check = +1;
                    }
                    if (((DropDownList)rptRow.FindControl("ddl_Client")).SelectedValue == "3" || ((DropDownList)rptRow.FindControl("ddl_Client")).SelectedValue == "2")
                    {
                        ClientCnt_Check = +1;
                    }
                }
                if ((EmpCnt_Check + SupplierCnt_Check + CustomerCnt_Check + ClientCnt_Check) == 0)
                {
                    _objMessage.ShowMessage(27, "Please Select Atleast One Option  Mandatory or Optional for Employee/Supplier/Customer/Client");
                    Is_Valid = false;
                }
            }
            return Is_Valid;
        }

        private void Fill_Document_Grid()
        {
            DataTable dt = _objMasterCollection.FillDocument(rptData, 0, 1, false);
            if (dt.Rows.Count != 0)
            {
                divNoData.Visible = false;
                Div_rptdata.Visible = true;
            }
            else
            {
                divNoData.Visible = true;
                Div_rptdata.Visible = false;
            }
            foreach (RepeaterItem rowbind in rptData.Items)
            {
                DataTable dtControlStatus = _objMasterCollection.FillAnyListFromEnum(null, EnumCollection.EnumType.Control_Status, 1, true, 0, false);
                DropDownList ddl_Employee = (DropDownList)rowbind.FindControl("ddl_Employee");
                _objDBCommon.Bind_Control(ddl_Employee, dtControlStatus, false);

                DropDownList ddl_Supplier = (DropDownList)rowbind.FindControl("ddl_Supplier");
                _objDBCommon.Bind_Control(ddl_Supplier, dtControlStatus, false);

                DropDownList ddl_Customer = (DropDownList)rowbind.FindControl("ddl_Customer");
                _objDBCommon.Bind_Control(ddl_Customer, dtControlStatus, false);

                DropDownList ddl_Client = (DropDownList)rowbind.FindControl("ddl_Client");
                _objDBCommon.Bind_Control(ddl_Client, dtControlStatus, false);

            }

        }

        private void _Control_Clear()
        {
            _objUtility.AssignButtonValidationGroup(btnSave, "Save");
            _objUtility.AssignButtonValidationGroup(btnClear, "Clear");

            _TransactionPassword();
            hdf_Document_Setting_Id.Value = "0";
            hdf_Action.Value = "INSERT";
            _objUtility.ClearInputs(Page.Controls);
            _objMasterCollection.FillStatus(ddlStatus, EnumCollection.StatusType.Row_Status, false);
            _objMasterCollection.BindFirmList(0, EnumCollection.SearchRecord.MAIN_DATA, 1, ddlFirm, false);//Hide from User
            divActionRemark.Visible = false;
            rfvActionRemarks.ValidationGroup = "none";
            rfvActionRemarks.Visible = false;
            ddlStatus.Enabled = false;
            divNoData.Visible = true;
            Div_rptdata.Visible = false;
            txtRemarks.Text = "";
        }
        private void _Bind_Control()
        {
            Fill_Document_Grid();
            Fill_Document_Settings_Data();
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

                bool Is_Valid = ValidateControl();

                if (hdf_Action.Value == "UPDATE" && _objUtility.ValidateDBNullEmptyValue(txtActionRemarks.Text.Trim()))
                {
                    _objMessage.ShowMessage(btnSave, txtActionRemarks, 6, "Reason For Change");
                    txtActionRemarks.Focus();
                    return;
                }

                if (_objDBCommon.Is_Valid_Transaction_Password(txtUserTransactionPassword, _objManageUserSession) == false)
                {
                    return;
                }

                DataTable dtDocumentSettingDetail = new DataTable();
                dtDocumentSettingDetail.Columns.Add("Document_Id");
                dtDocumentSettingDetail.Columns.Add("Employee_Control_Status_Enum_Id");
                dtDocumentSettingDetail.Columns.Add("Supplier_Control_Status_Enum_Id");
                dtDocumentSettingDetail.Columns.Add("Customer_Control_Status_Enum_Id");
                dtDocumentSettingDetail.Columns.Add("Client_Control_Status_Enum_Id");
                dtDocumentSettingDetail.Columns.Add("Row_No");

                int Row = 0;
                for (int ichk = 0; ichk < rptData.Items.Count; ichk++)
                {
                    RepeaterItem rptRow = rptData.Items[ichk];
                    DataRow drData = dtDocumentSettingDetail.NewRow();
                    drData["Document_Id"] = ((HiddenField)rptRow.FindControl("hdf_Document_Id")).Value;
                    drData["Employee_Control_Status_Enum_Id"] = ((DropDownList)rptRow.FindControl("ddl_Employee")).SelectedValue;
                    drData["Supplier_Control_Status_Enum_Id"] = ((DropDownList)rptRow.FindControl("ddl_Supplier")).SelectedValue;
                    drData["Customer_Control_Status_Enum_Id"] = ((DropDownList)rptRow.FindControl("ddl_Customer")).SelectedValue;
                    drData["Client_Control_Status_Enum_Id"] = ((DropDownList)rptRow.FindControl("ddl_Client")).SelectedValue;
                    drData["Row_no"] = Row + 1;
                    dtDocumentSettingDetail.Rows.Add(drData);
                }


                List<DBMapParam> param = new List<DBMapParam>();
                param.Add(new DBMapParam() { Name = "Document_Setting_Id", Value = hdf_Document_Setting_Id.Value });
                param.Add(new DBMapParam() { Name = "Firm_Id", Value = ddlFirm.SelectedValue });
                param.Add(new DBMapParam() { Name = "Document_Setting", Value = dtDocumentSettingDetail });
                param.Add(new DBMapParam() { Name = "Status_Id", Value = ddlStatus.SelectedValue });
                param.Add(new DBMapParam() { Name = "Remarks", Value = txtRemarks.Text.Trim() });
                param.Add(new DBMapParam() { Name = "Action_Remarks", Value = txtActionRemarks.Text.Trim() });
                param.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
                param.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
                param.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                param.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
                param.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });
                param.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Firm_Document_Setting", param);

                if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                {
                    if (hdf_Document_Setting_Id.Value == "0")
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
                    _objMessage.ShowMessage(27, Convert.ToString(dictResult["OutputMessage"]));
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

        #region Events
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        #endregion
    }
}