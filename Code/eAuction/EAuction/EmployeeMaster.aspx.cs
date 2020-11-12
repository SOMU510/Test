using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.IO;
using System.Web.UI.HtmlControls;
using YCS;

namespace eAuction
{
    public partial class EmployeeMaster : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        public Utility _objUtility = new Utility();
        private const string MENU_CODE = "1008";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        string pdfImagePath = "../Images/pdf.png";
        DBCommon _objDBCommon = new DBCommon();
        FileSystem _objFileSystem = new FileSystem();
        Notification _objNotification = new Notification();
        CustomAppSetting _objCustomAppSetting = new CustomAppSetting();
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

        private void _Control_Clear()
        {
            _objUtility.AssignButtonValidationGroup(btnSave, "Save");
            _objUtility.AssignButtonValidationGroup(btnClear, "Clear");
            txtEmployeeName.Text = "";
            txtEmployeeCode.Text = "";
            //txtLoginId.Text = "";
		    txtEmployeeWhatsAppNo.Text = "";
            txtEmployee_Email_Id.Text = "";
            txtEmployee_Mobile_No.Text = "";
            txtEmployee_Address.Text = "";
            txtEmployee_Pincode.Text = "";
            txtEditRemark.Text = "";
            txtRemarks.Text = "";
            divEmployeeDocument.Visible = false;
            divActionRemarks.Visible = false;
            hdfEmployee_Id.Value = "0";
            hdfEmployee_Login_User_Id.Value = "0";
            ddlStatus.Enabled = false;
            if (ddlRole.Items.Count > 0)
            {
                ddlRole.SelectedIndex = 0;
            }
            if (ddlStatus.Items.Count > 0)
            {
                ddlStatus.SelectedIndex = 0;
            }
            rfvEditRemark.ValidationGroup = Utility.GarbageValidationGroup;
            divEmployeeDocument.Visible = false;
            rptEmployeeDocumentLink.DataSource = new DataTable();
            rptEmployeeDocumentLink.DataBind();
        }

        private void _Bind_Control()
        {
            divEmployeeDocument.Visible = false;

            _objMasterCollection.FillStatus(ddlStatus, EnumCollection.StatusType.Row_Status, false);
            _objMasterCollection.BindFirmList(0, EnumCollection.SearchRecord.MAIN_DATA, 1, grdFirm, false);
            _objMasterCollection.BindFirmEmployee(0, 0, 0, EnumCollection.SearchRecord.MAIN_DATA, grdData, false);
            _objMasterCollection.BindRole(0, 1, ddlRole, true, 12);

            if (grdFirm.Rows.Count == 1)
            {
                foreach (GridViewRow row in grdFirm.Rows)
                {
                    ((CheckBox)row.FindControl("cbIndividual")).Checked = true;
                    ((CheckBox)row.FindControl("chkIsDefault")).Checked = true;
                    HiddenField hdfdocFirm_Id = ((HiddenField)row.FindControl("hdfFirm_Id"));

                    DataTable dtDoc = _objMasterCollection.FillFirmDocumentSettingDetails(rptEmployeeDocumentLink, Convert.ToInt64(hdfdocFirm_Id.Value), 1, "2,3", "0", "0", "0", false);

                    if (dtDoc.Rows.Count > 0 || dtDoc.Rows.Count != 0)
                    {
                        divEmployeeDocument.Visible = true;
                        break;
                    }
                }
            }
        }

        private Int64 GetNextRowNo(DataTable dt)
        {
            if (dt == null || dt.Rows.Count == 0)
            {
                return 1;
            }
            else
            {
                return Convert.ToInt64(dt.Compute("max([Row_No])", string.Empty)) + 1;
            }
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

        #region UT
        private DataTable UT_Entities_Documents_Link
        {
            get
            {
                DataTable dtColumn = new DataTable();
                dtColumn.Columns.Add("Entity_Document_Id", typeof(Int64));
                dtColumn.Columns.Add("Document_Id", typeof(Int64));
                dtColumn.Columns.Add("Unique_No");
                dtColumn.Columns.Add("Name_As_Per_Document");
                dtColumn.Columns.Add("Name_As_Per_Third_Party");
                dtColumn.Columns.Add("Document_Detail");
                dtColumn.Columns.Add("Valid_From_Date", typeof(DateTime));
                dtColumn.Columns.Add("Valid_Upto_Date", typeof(DateTime));
                dtColumn.Columns.Add("Document_Path");
                dtColumn.Columns.Add("Status_Id", typeof(Int64));
                dtColumn.Columns.Add("Remarks");
                dtColumn.Columns.Add("Row_No", typeof(Int64));
                return dtColumn;
            }
        }

        private DataTable UT_Entities_Firm_Link
        {
            get
            {
                DataTable dtColumn = new DataTable();
                dtColumn.Columns.Add("Entity_Firm_Link_Id", typeof(Int64));
                dtColumn.Columns.Add("Firm_Id", typeof(Int64));
                dtColumn.Columns.Add("Is_Default", typeof(bool));
                dtColumn.Columns.Add("Department_Id", typeof(Int64));
                dtColumn.Columns.Add("Role_Id", typeof(Int64));
                dtColumn.Columns.Add("Date_Of_Joining", typeof(DateTime));
                dtColumn.Columns.Add("Date_Of_Leaving", typeof(DateTime));
                dtColumn.Columns.Add("Status_Id", typeof(Int64));
                dtColumn.Columns.Add("Remarks");
                dtColumn.Columns.Add("Row_No", typeof(Int64));
                return dtColumn;
            }
        }
        #endregion

        #region Save And Clear Events

        /// <summary>
        /// Save Button Click Event : It is used to save data.
        /// </summary>
        /// <lstDBMapParam name="sender"></lstDBMapParam>
        /// <lstDBMapParam name="e"></lstDBMapParam>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValue(txtEmployeeName.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtEmployeeName, 6, "Employee Name");
                    txtEmployeeName.Focus();
                    return;
                }
                if (_objUtility.ValidateDBNullEmptyValue(txtEmployeeCode.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtEmployeeCode, 6, "Employee Code");
                    txtEmployeeCode.Focus();
                    return;
                }
                if (_objUtility.ValidateDBNullEmptyValueInList(ddlRole.SelectedValue, true))
                {
                    _objMessage.ShowMessage(sender, ddlRole, 8, "Employee Role");
                    ddlRole.Focus();
                    return;
                }

                //if (_objUtility.ValidateDBNullEmptyValue(txtLoginId.Text.Trim()))
               // {
               //     _objMessage.ShowMessage(sender, txtLoginId, 6, "Login Id");
               //     txtLoginId.Focus();
               //     return;
               // }
                if (_objUtility.ValidateDBNullEmptyValue(txtEmployee_Email_Id.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtEmployee_Email_Id, 6, "Email Id");
                    txtEmployee_Email_Id.Focus();
                    return;
                }

                if (!_objUtility.IsValid_Email(txtEmployee_Email_Id.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtEmployee_Email_Id, 6, "Valid Email Id");
                    txtEmployee_Email_Id.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtEmployee_Mobile_No.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtEmployee_Mobile_No, 6, "Mobile No.");
                    txtEmployee_Mobile_No.Focus();
                    return;
                }

                if (!_objUtility.IsValid_MobileNo(txtEmployee_Mobile_No.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtEmployee_Mobile_No, 6, "Valid  Mobile Number");
                    return;
                }

                if (hdfEmployee_Id.Value != "0" && _objUtility.ValidateDBNullEmptyValue(txtEditRemark.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtEditRemark, 6, "Reason For Change");
                    txtEditRemark.Focus();
                    return;
                }

                if (_objDBCommon.Is_Valid_Transaction_Password(txtUserTransactionPassword, _objManageUserSession) == false)
                {
                    return;
                }

                bool CheckDefaultEmployeeFirm = false;

                DataTable dtFirmLink = UT_Entities_Firm_Link;

                for (int ichk = 0; ichk < grdFirm.Rows.Count; ichk++)
                {
                    GridViewRow rptRow = grdFirm.Rows[ichk];

                    CheckBox cbIndividual = ((CheckBox)rptRow.FindControl("cbIndividual"));
                    CheckBox chkIsDefault = ((CheckBox)rptRow.FindControl("chkIsDefault"));
                    HiddenField hdfEmployee_Firm_Link_Id = ((HiddenField)rptRow.FindControl("hdfEmployee_Firm_Link_Id"));

                    if (cbIndividual.Checked == true)
                    {
                        if (_objUtility.ValidateDBNullEmptyValue(hdfEmployee_Firm_Link_Id.Value))
                        {
                            hdfEmployee_Firm_Link_Id.Value = "0";
                        }
                        DataRow dr = dtFirmLink.NewRow();
                        dr["Entity_Firm_Link_Id"] = hdfEmployee_Firm_Link_Id.Value;
                        dr["Firm_Id"] = ((HiddenField)rptRow.FindControl("hdfFirm_Id")).Value;
                        dr["Is_Default"] = chkIsDefault.Checked;
                        dr["Department_Id"] = DBNull.Value;
                        dr["Role_Id"] = ddlRole.SelectedValue;
                        dr["Status_Id"] = 1;
                        dr["Remarks"] = DBNull.Value;
                        dr["Row_No"] = GetNextRowNo(dtFirmLink);
                        dtFirmLink.Rows.Add(dr);

                        if (chkIsDefault.Checked)
                        {
                            CheckDefaultEmployeeFirm = true;
                        }
                    }
                }

                if (dtFirmLink.Rows.Count == 0)
                {
                    _objMessage.ShowMessage(sender, grdFirm, 6, "Firm");
                    grdFirm.Focus();
                    return;
                }

                if (CheckDefaultEmployeeFirm == false)
                {
                    _objMessage.ShowMessage(sender, grdFirm, 6, "Default Firm");
                    grdFirm.Focus();
                    return;
                }


                DataTable dtDocumentLink = UT_Entities_Documents_Link;

                for (int ichk = 0; ichk < rptEmployeeDocumentLink.Items.Count; ichk++)
                {
                    RepeaterItem rptRow = rptEmployeeDocumentLink.Items[ichk];

                    HiddenField hdf_grd_Employee_Document_Id = ((HiddenField)rptRow.FindControl("hdf_grd_Employee_Document_Id"));
                    HiddenField hdf_Document_Id = ((HiddenField)rptRow.FindControl("hdf_Document_Id"));
                    TextBox txt_Unique_No = ((TextBox)rptRow.FindControl("txt_Unique_No"));
                    Label lbl_DocumentName = ((Label)rptRow.FindControl("lbl_DocumentName"));
                    Image img_Document = ((Image)rptRow.FindControl("ImageDocument"));
                    HiddenField hdf_Document_Image_Path = (HiddenField)rptRow.FindControl("hdfDocumentImagePath");
                    HiddenField hdf_grd_Control_Status_Enum_Id = (HiddenField)rptRow.FindControl("hdf_grd_Control_Status_Enum_Id");
                    TextBox txt_Valid_Upto_Date = ((TextBox)rptRow.FindControl("txt_Valid_Upto_Date"));
                    HiddenField hdf_Validation_Regex = ((HiddenField)rptRow.FindControl("hdf_Validation_Regex"));
                    HiddenField hdf_Is_Required_Valid_Up_To = ((HiddenField)rptRow.FindControl("hdf_Is_Required_Valid_Up_To"));

                    if ((hdf_grd_Control_Status_Enum_Id.Value == "3") || hdf_grd_Control_Status_Enum_Id.Value == "2")
                    {
                        if (hdf_grd_Control_Status_Enum_Id.Value == "3" && ((!_objUtility.ValidateDBNullEmptyValue(txt_Unique_No.Text.Trim()) || !_objUtility.ValidateDBNullEmptyValue(txt_Valid_Upto_Date.Text.Trim()) || !_objUtility.ValidateDBNullEmptyValue(hdf_Document_Image_Path.Value))))//optional
                        {
                            if (!_objUtility.CompareDocumentandFile(txt_Unique_No, hdf_Document_Image_Path.Value, img_Document, lbl_DocumentName.Text + " Number", lbl_DocumentName.Text + " Document File", false))
                            {
                                return;
                            }
                        }
                        if (hdf_grd_Control_Status_Enum_Id.Value == "2")//mandatory
                        {
                            if (!_objUtility.CompareDocumentandFile(txt_Unique_No, hdf_Document_Image_Path.Value, img_Document, lbl_DocumentName.Text + " Number", lbl_DocumentName.Text + " Document File", true))
                            {
                                return;
                            }
                        }

                        if (((!_objUtility.ValidateDBNullEmptyValue(txt_Unique_No.Text.Trim()) || !_objUtility.ValidateDBNullEmptyValue(hdf_Document_Image_Path.Value))) && hdf_Is_Required_Valid_Up_To.Value.ToUpper() == "YES" && _objUtility.ValidateDBNullEmptyValue(txt_Valid_Upto_Date.Text))
                        {
                            _objMessage.ShowMessage(null, txt_Valid_Upto_Date, 6, lbl_DocumentName.Text + " Valid upto Date");
                            txt_Valid_Upto_Date.Focus();
                            return;
                        }
                        if (!_objUtility.ValidateDBNullEmptyValue(hdf_Validation_Regex.Value) && !_objUtility.ValidateDBNullEmptyValue(txt_Unique_No.Text.Trim()))
                        {
                            if (!_objUtility.IsValid_InputData(txt_Unique_No.Text.Trim(), hdf_Validation_Regex.Value))
                            {
                                _objMessage.ShowMessage(null, txt_Unique_No, 6, " A Valid Unique Number For " + lbl_DocumentName.Text);
                                txt_Unique_No.Focus();
                                return;
                            }
                        }
                    }

                    if (_objUtility.ValidateDBNullEmptyValue(txt_Valid_Upto_Date.Text.Trim()) == false)
                    {
                        TextBox temptxtCurrentDate = new TextBox() { Text = _objUtility.Convert_Date_Into_ddMMyyyy(_currentDateTime) };
                        if (_objUtility.DateCompare(temptxtCurrentDate, txt_Valid_Upto_Date, "Current Date", "Valid upto Date") == false)
                        {
                            return;
                        }
                    }

                    if (!_objUtility.ValidateDBNullEmptyValue(txt_Unique_No.Text.Trim()))
                    {
                        if (_objUtility.ValidateDBNullEmptyValue(hdf_grd_Employee_Document_Id.Value))
                        {
                            hdf_grd_Employee_Document_Id.Value = "0";
                        }
                        DataRow drdoc = dtDocumentLink.NewRow();
                        drdoc["Entity_Document_Id"] = Convert.ToInt64(hdf_grd_Employee_Document_Id.Value);
                        drdoc["Document_Id"] = Convert.ToInt64(hdf_Document_Id.Value);
                        drdoc["Unique_No"] = txt_Unique_No.Text.Trim();
                        drdoc["Name_As_Per_Document"] = DBNull.Value;
                        drdoc["Document_Detail"] = DBNull.Value;
                        drdoc["Valid_From_Date"] = DBNull.Value;

                        if (!_objUtility.ValidateDBNullEmptyValue(Convert.ToString(txt_Valid_Upto_Date.Text.Trim())))
                        {
                            drdoc["Valid_Upto_Date"] = _objUtility.Convert_ddMMyyyy_Into_Date(txt_Valid_Upto_Date.Text.Trim());
                        }
                        else
                        {
                            drdoc["Valid_Upto_Date"] = DBNull.Value;
                        }

                        if (hdf_Document_Image_Path.Value != "~/Images/camera.jpg" && hdf_Document_Image_Path.Value.Contains("/dist"))
                        {
                            drdoc["Document_Path"] = hdf_Document_Image_Path.Value;
                        }
                        else
                        {
                            drdoc["Document_Path"] = _objFileSystem.MoveToServer(hdf_Document_Image_Path.Value, Convert.ToInt64(((HiddenField)rptRow.FindControl("hdf_Document_Id")).Value));
                        }
                        drdoc["Status_Id"] = 1;
                        drdoc["Remarks"] = DBNull.Value;
                        drdoc["Row_No"] = GetNextRowNo(dtDocumentLink);
                        dtDocumentLink.Rows.Add(drdoc);
                    }
                }


                string password = "";
                DataTable dtPassword = _objUtility.GeneratePassword(null);
                List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Id", Value = hdfEmployee_Id.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Login_User_Id", Value = hdfEmployee_Login_User_Id.Value });
                //lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = txtLoginId.Text.Trim() });
				lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = txtEmployee_Email_Id.Text.Trim() });
                password = Convert.ToString(dtPassword.Rows[0]["Password"]);
                lstDBMapParam.Add(new DBMapParam() { Name = "Password", Value = password });
                lstDBMapParam.Add(new DBMapParam() { Name = "SaltValue", Value = dtPassword.Rows[0]["SaltValue"] });
                lstDBMapParam.Add(new DBMapParam() { Name = "HashPassword", Value = dtPassword.Rows[0]["LoginPasswordEncrypt"] });
                lstDBMapParam.Add(new DBMapParam() { Name = "Tran_Password", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Tran_SaltValue", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Tran_HashPassword", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Password_Reset_Required", Value = true });
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Trans_Password_Reset_Required", Value = false });
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Profile_Update_Required", Value = false });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Name", Value = txtEmployeeName.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Code", Value = txtEmployeeCode.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Email_Id", Value = txtEmployee_Email_Id.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Mobile_No", Value = txtEmployee_Mobile_No.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Telephone_No", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Address", Value = txtEmployee_Address.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Pincode", Value = txtEmployee_Pincode.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_State_Id", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_City_Id", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Date_Of_Birth", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Gender_Type_Enum_Id", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Blood_Group_Enum_Id", Value = DBNull.Value });
                if (_objUtility.ValidateDBNullEmptyValue(hdfImagePath.Value))
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Profile_Pic_Path", Value = DBNull.Value });
                }
                else if (hdfImagePath.Value != "~/Images/camera.jpg" && hdfImagePath.Value.Contains("/dist"))
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Profile_Pic_Path", Value = hdfImagePath.Value });
                }
                else
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Profile_Pic_Path", Value = _objFileSystem.MoveToServer(hdfImagePath.Value, 0) });
                }

                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Documents", Value = dtDocumentLink });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Firm_Rights", Value = dtFirmLink });
                lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = ddlStatus.SelectedValue });
                lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = txtRemarks.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = txtEditRemark.Text.Trim() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Action_User_Role_Id", Value = _objManageUserSession.GetCurrentUser_Role_Id });
                lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
                lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
                lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
                lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });
                lstDBMapParam.Add(new DBMapParam() { Name = "Employee_WhatsApp_No", Value = txtEmployeeWhatsAppNo.Text.Trim() });
                if (hdfEmployee_Id.Value == "0")
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = "INSERT" });
                }
                else
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = "UPDATE" });
                }

                lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Employee", lstDBMapParam);

                if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                {
                    if (hdfEmployee_Id.Value == "0")
                    {
                        _objMessage.ShowMessageWithURL(5, _objUtility.GetCurrentURL, "Saved");

                        string emailSubject = YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " - Login Details";
                        string emailbody = "Dear User,</br> you are registered on " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " as User.Your login details, URL: " + _objCustomAppSetting.URL_Root + "<br/><br/> User Name: " + txtEmployee_Email_Id.Text.Trim() + "<br/> Password: <b>" + password + "</b> Have a nice day.";
                        string mobileMessage = "You are successfully registered on " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + ", Your login details, URL: " + _objCustomAppSetting.URL_Root + ", User Name: " + txtEmployee_Email_Id.Text.Trim() + ", Password: " + password + ".";

                        if (!_objUtility.ValidateDBNullEmptyValue(txtEmployee_Email_Id.Text.Trim()) && _objUtility.IsValid_Email(txtEmployee_Email_Id.Text.Trim()))
                        {
                            _objNotification.SendMail(_objNotification.GetArray(txtEmployee_Email_Id.Text), emailSubject, emailbody, false);
                        }

                        if (!_objUtility.ValidateDBNullEmptyValue(txtEmployee_Mobile_No.Text.Trim()) && _objUtility.IsValid_MobileNo(txtEmployee_Mobile_No.Text.Trim()))
                        {
                            _objNotification.SendSMS(txtEmployee_Mobile_No.Text.Trim(), mobileMessage, false);
                        }
                    }
                    else
                    {
                        _objMessage.ShowMessageWithURL(5, _objUtility.GetCurrentURL, "Updated");
                    }
                }
                else
                {
                    if (Convert.ToString(dictResult["OutputMessage"]).Contains("Employee Code"))
                    {
                        _objMessage.ShowMessage(btnSave, txtEmployeeCode, 7, dictResult["OutputMessage"]);
                        txtEmployeeCode.Focus();
                        return;

                    }
                    else if (Convert.ToString(dictResult["OutputMessage"]).Contains("Login Id"))
                    {
                        _objMessage.ShowMessage(btnSave, txtEmployee_Email_Id, 7, dictResult["OutputMessage"]);
                        txtEmployee_Email_Id.Focus();
                        return;

                    }
                    else if (Convert.ToString(dictResult["OutputMessage"]).Contains("Email Id"))
                    {
                        _objMessage.ShowMessage(btnSave, txtEmployee_Email_Id, 7, dictResult["OutputMessage"]);
                        txtEmployee_Email_Id.Focus();
                        return;
                    }
                    else if (Convert.ToString(dictResult["OutputMessage"]).Contains("Mobile No."))
                    {
                        _objMessage.ShowMessage(btnSave, txtEmployee_Mobile_No, 7, dictResult["OutputMessage"]);
                        txtEmployee_Mobile_No.Focus();
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
        /// <lstDBMapParam name="sender"></lstDBMapParam>
        /// <lstDBMapParam name="e"></lstDBMapParam>
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

        #region Image

        protected void lnkbtnRemoveImage_Click(object sender, EventArgs e)
        {
            try
            {
                fuUploadImage.Visible = true;
                PreviewProfilePicture.Visible = true;
                lnkbtnRemoveImage.Visible = false;
                hdfImagePath.Value = "";
                PreviewImage.Visible = false;
                PreviewImage.ImageUrl = "";
                fuUploadImage.Focus();
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnImage_Click(object sender, EventArgs e)
        {
            try
            {
                if (fuUploadImage.HasFile)
                {
                    PreviewImage.Visible = true;
                    List<string> filepath = _objFileSystem.Upload_Temp_File(fuUploadImage, DocumentExtension.Image);
                    if (filepath == null)
                    {
                        fuUploadImage.Focus();
                        return;
                    }
                    hdfImagePath.Value = filepath[0];
                    fuUploadImage.SaveAs(Server.MapPath(hdfImagePath.Value));
                    PreviewImage.ImageUrl = hdfImagePath.Value;
                    lnkbtnRemoveImage.Visible = true;
                    divImage.Visible = true;
                    PreviewProfilePicture.Visible = false;
                    lnkbtnRemoveImage.Focus();

                }
                else
                {
                    fuUploadImage.Visible = true;
                    PreviewProfilePicture.Visible = true;
                    lnkbtnRemoveImage.Visible = false;
                    hdfImagePath.Value = "";
                    PreviewImage.Visible = false;
                    PreviewImage.ImageUrl = "";
                    fuUploadImage.Focus();

                }
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void imgProfilePic1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Employee_Profile_Default_Picuture("../dist/img/avatar.png");
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void imgProfilePic2_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Employee_Profile_Default_Picuture("../dist/img/avatar2.png");
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void imgProfilePic3_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Employee_Profile_Default_Picuture("../dist/img/avatar3.png");
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void imgProfilePic5_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Employee_Profile_Default_Picuture("../dist/img/avatar5.png");
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        private void Employee_Profile_Default_Picuture(string path)
        {
            PreviewImage.Visible = true;
            PreviewImage.ImageUrl = path;
            hdfImagePath.Value = path.Replace("../", "~/");
            lnkbtnRemoveImage.Visible = true;
            divImage.Visible = true;
            PreviewProfilePicture.Visible = false;
        }

        /// <summary>
        /// Register Update panel for tab layout.
        /// </summary>
        /// <param name="panel"></param>
        protected void RegisterUpdatePanel(UpdatePanel panel)
        {
            var sType = typeof(ScriptManager);
            var mInfo = sType.GetMethod("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
            if (mInfo != null)
                mInfo.Invoke(ScriptManager.GetCurrent(Page), new object[] { panel });
        }


        protected void UpdatePanel_Unload(object sender, EventArgs e)
        {
            RegisterUpdatePanel((UpdatePanel)sender);
        }

        #endregion

        #region Repeater Document Image
        protected void btnDocumentImage_Click(object sender, EventArgs e)
        {
            try
            {
                Button btnDocumentImage = (Button)sender;
                FileUpload fuDocumentUploadImage = (FileUpload)btnDocumentImage.FindControl("fuDocumentUploadImage");
                Image DocumentPreviewImage = (Image)btnDocumentImage.FindControl("DocumentPreviewImage");
                Image ImageDocument = (Image)btnDocumentImage.FindControl("ImageDocument");
                HiddenField hdfDocumentImage = (HiddenField)btnDocumentImage.FindControl("hdfDocumentImage");
                HiddenField hdfDocumentImagePath = (HiddenField)btnDocumentImage.FindControl("hdfDocumentImagePath");
                LinkButton lnkbtnDocumentRemoveImage = (LinkButton)btnDocumentImage.FindControl("lnkbtnDocumentRemoveImage");
                Control divDocumentImage = btnDocumentImage.FindControl("divDocumentImage");

                if (fuDocumentUploadImage.HasFile)
                {
                    DocumentPreviewImage.Visible = true;
                    List<string> filepath = _objFileSystem.Upload_Temp_File(fuDocumentUploadImage, DocumentExtension.ImagePdf);
                    if (filepath == null)
                    {
                        fuDocumentUploadImage.Focus();
                        return;
                    }

                    hdfDocumentImagePath.Value = filepath[0];
                    fuDocumentUploadImage.SaveAs(Server.MapPath(hdfDocumentImagePath.Value));

                    if (Path.GetExtension(hdfDocumentImagePath.Value) == ".pdf")
                    {
                        DocumentPreviewImage.ImageUrl = pdfImagePath;
                    }
                    else
                    {
                        DocumentPreviewImage.ImageUrl = hdfDocumentImagePath.Value;
                    }

                    lnkbtnDocumentRemoveImage.Visible = true;
                    divDocumentImage.Visible = true;
                    ImageDocument.Visible = false;
                    lnkbtnDocumentRemoveImage.Focus();

                }
                else
                {
                    fuDocumentUploadImage.Visible = true;
                    ImageDocument.Visible = true;
                    lnkbtnDocumentRemoveImage.Visible = false;
                    hdfDocumentImagePath.Value = "";
                    DocumentPreviewImage.Visible = false;
                    DocumentPreviewImage.ImageUrl = "";
                    fuDocumentUploadImage.Focus();
                }
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }
        protected void lnkbtnDocumentRemoveImage_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnkbtnDocumentRemoveImage = (LinkButton)sender;
                FileUpload fuDocumentUploadImage = (FileUpload)lnkbtnDocumentRemoveImage.FindControl("fuDocumentUploadImage");
                Image DocumentPreviewImage = (Image)lnkbtnDocumentRemoveImage.FindControl("DocumentPreviewImage");
                Image ImageDocument = (Image)lnkbtnDocumentRemoveImage.FindControl("ImageDocument");
                HiddenField hdfDocumentImage = (HiddenField)lnkbtnDocumentRemoveImage.FindControl("hdfDocumentImage");
                HiddenField hdfDocumentImagePath = (HiddenField)lnkbtnDocumentRemoveImage.FindControl("hdfDocumentImagePath");
                Button btnDocumentImage = (Button)lnkbtnDocumentRemoveImage.FindControl("btnDocumentImage");
                Control divDocumentImage = lnkbtnDocumentRemoveImage.FindControl("divDocumentImage");
                HiddenField hdf_Document_Id = ((HiddenField)lnkbtnDocumentRemoveImage.FindControl("hdf_Document_Id"));
              
                fuDocumentUploadImage.Visible = true;
                ImageDocument.Visible = true;
                lnkbtnDocumentRemoveImage.Visible = false;
                hdfDocumentImagePath.Value = "";
                DocumentPreviewImage.Visible = false;
                DocumentPreviewImage.ImageUrl = "";
                fuDocumentUploadImage.Focus();
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }
        protected void DocumentPreviewImage_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                IframePDF.Src = "";
                ImageButton btn = (ImageButton)sender;
                HiddenField hdfDocumentImagePath = (HiddenField)btn.FindControl("hdfDocumentImagePath");
                Label DocumentLabel = (Label)btn.FindControl("lbl_DocumentName");
                lblGDocumentName.Text = DocumentLabel.Text;
                string FileExtension = Path.GetExtension(hdfDocumentImagePath.Value);

                if (FileExtension == ".pdf")
                {
                    divpdfPreview.Visible = true;
                    divIamgePreview.Visible = false;
                    IframePDF.Src = hdfDocumentImagePath.Value;
                }
                else
                {
                    divpdfPreview.Visible = false;
                    divIamgePreview.Visible = true;
                    itemImgFullView.ImageUrl = hdfDocumentImagePath.Value;
                }

                mpeForGDocuments.Show();
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }
        #endregion

        #region Grd Data
        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edt")
                {
                    int rowid = Convert.ToInt32(e.CommandArgument);

                    divEmployeeDocument.Visible = false;

                    PreviewImage.Visible = false;
                    lnkbtnRemoveImage.Visible = false;
                    divImage.Visible = false;
                    PreviewProfilePicture.Visible = true;
                    hdfImagePath.Value = "";

                    hdfEmployee_Id.Value = ((HiddenField)grdData.Rows[rowid].FindControl("hdfEmployeeId")).Value;
                    hdfEmployee_Login_User_Id.Value = ((HiddenField)grdData.Rows[rowid].FindControl("hdfEmployee_Login_User_Id")).Value;

                    DataSet dsResult = _objMasterCollection.BindFirmEmployee(Convert.ToInt64(hdfEmployee_Id.Value), 0, 0, EnumCollection.SearchRecord.BOTH, null, false);
                    if (dsResult != null && dsResult.Tables[0].Rows.Count > 0)
                    {
                        DataTable dt_Employee = dsResult.Tables[0];
                        txtEmployeeName.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Name"]);
                        txtEmployeeCode.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Code"]);
                        txtEmployee_Email_Id.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Email_Id"]);
                        txtEmployee_Mobile_No.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Mobile_No"]);
                        txtEmployee_Address.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Address"]);
                        txtEmployee_Pincode.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Pincode"]);
                        //txtLoginId.Text = Convert.ToString(dt_Employee.Rows[0]["Login_Id"]);
						txtEmployeeWhatsAppNo.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_WhatsApp_No"]);
                        if (ddlStatus.Items.FindByValue(Convert.ToString(dt_Employee.Rows[0]["Status_Id"])) != null)
                        {
                            ddlStatus.SelectedValue = Convert.ToString(dt_Employee.Rows[0]["Status_Id"]);
                        }
                        txtRemarks.Text = Convert.ToString(dt_Employee.Rows[0]["Remarks"]);
                        if (!_objUtility.ValidateDBNullEmptyValue(Convert.ToString(dt_Employee.Rows[0]["Profile_Pic_Path"])))
                        {
                            string Profile_Pic_Path = Convert.ToString(dt_Employee.Rows[0]["Profile_Pic_Path"]);
                            string path = Server.MapPath(Convert.ToString(dt_Employee.Rows[0]["Profile_Pic_Path"]));
                            FileInfo file = new FileInfo(path);
                            if (file.Exists)
                            {
                                PreviewImage.Visible = true;
                                lnkbtnRemoveImage.Visible = true;
                                divImage.Visible = true;
                                PreviewProfilePicture.Visible = false;
                                hdfImagePath.Value = PreviewImage.ImageUrl = Profile_Pic_Path;
                            }
                        }
                        else
                        {
                            PreviewProfilePicture.ImageUrl = "~/Images/camera.jpg";
                        }


                        if (dsResult.Tables[1].Rows.Count > 0)//emplyee_Firm_rights
                        {
                            DataTable dt_EmployeeFirm = dsResult.Tables[1];
                            for (int i = 0; i < dt_EmployeeFirm.Rows.Count; i++)
                            {
                                foreach (GridViewRow row in grdFirm.Rows)
                                {

                                    HiddenField hdfFirm_Id = ((HiddenField)row.FindControl("hdfFirm_Id"));
                                    CheckBox cbIndividual = ((CheckBox)row.FindControl("cbIndividual"));
                                    CheckBox chkIsDefault = ((CheckBox)row.FindControl("chkIsDefault"));
                                    HiddenField hdfEmployee_Firm_Link_Id = ((HiddenField)row.FindControl("hdfEmployee_Firm_Link_Id"));

                                    if (hdfFirm_Id.Value == Convert.ToString(dt_EmployeeFirm.Rows[i]["Firm_Id"]))
                                    {
                                        cbIndividual.Checked = true;
                                        hdfEmployee_Firm_Link_Id.Value = Convert.ToString(dt_EmployeeFirm.Rows[i]["Employee_Firm_Link_Id"]);
                                        if (ddlRole.Items.FindByValue(Convert.ToString(dt_EmployeeFirm.Rows[0]["Role_Id"])) != null)
                                        {
                                            ddlRole.SelectedValue = Convert.ToString(dt_EmployeeFirm.Rows[0]["Role_Id"]);
                                        }
                                        if (Convert.ToBoolean(dt_EmployeeFirm.Rows[i]["Is_Default"]) == true)
                                        {
                                            chkIsDefault.Checked = true;
                                            //Default Firm Document List

                                            if (_objMasterCollection.FillFirmDocumentSettingDetails(rptEmployeeDocumentLink, Convert.ToInt64(hdfFirm_Id.Value), 1, "2,3", "0", "0", "0", false).Rows.Count > 0)
                                            {
                                                divEmployeeDocument.Visible = true;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (dsResult.Tables[2].Rows.Count > 0)//documents
                        {
                            DataTable dt_EmployeeDoc = dsResult.Tables[2];
                            for (int i = 0; i < dt_EmployeeDoc.Rows.Count; i++)
                            {
                                foreach (RepeaterItem rptRow in rptEmployeeDocumentLink.Items)
                                {

                                    HiddenField hdf_grd_Employee_Document_Id = ((HiddenField)rptRow.FindControl("hdf_grd_Employee_Document_Id"));
                                    HiddenField hdf_Document_Id = ((HiddenField)rptRow.FindControl("hdf_Document_Id"));
                                    TextBox txt_Unique_No = ((TextBox)rptRow.FindControl("txt_Unique_No"));
                                    Label lbl_DocumentName = ((Label)rptRow.FindControl("lbl_DocumentName"));
                                    HiddenField hdf_grd_Control_Status_Enum_Id = (HiddenField)rptRow.FindControl("hdf_grd_Control_Status_Enum_Id");
                                    TextBox txt_Valid_Upto_Date = ((TextBox)rptRow.FindControl("txt_Valid_Upto_Date"));
                                    HiddenField hdf_Validation_Regex = ((HiddenField)rptRow.FindControl("hdf_Validation_Regex"));
                                    HiddenField hdf_Is_Required_Valid_Up_To = ((HiddenField)rptRow.FindControl("hdf_Is_Required_Valid_Up_To"));
                                    FileUpload fuDocumentUploadImage = (FileUpload)rptRow.FindControl("fuDocumentUploadImage");
                                    Image DocumentPreviewImage = (Image)rptRow.FindControl("DocumentPreviewImage");
                                    Image ImageDocument = (Image)rptRow.FindControl("ImageDocument");
                                    HiddenField hdfDocumentImage = (HiddenField)rptRow.FindControl("hdfDocumentImage");
                                    HiddenField hdfDocumentImagePath = (HiddenField)rptRow.FindControl("hdfDocumentImagePath");
                                    LinkButton lnkbtnDocumentRemoveImage = (LinkButton)rptRow.FindControl("lnkbtnDocumentRemoveImage");
                                    Control divDocumentImage = rptRow.FindControl("divDocumentImage");

                                    if (hdf_Document_Id.Value == Convert.ToString(dt_EmployeeDoc.Rows[i]["Document_Id"]))
                                    {
                                        hdf_grd_Employee_Document_Id.Value = Convert.ToString(dt_EmployeeDoc.Rows[i]["Employee_Document_Id"]);
                                        txt_Unique_No.Text = Convert.ToString(dt_EmployeeDoc.Rows[i]["Unique_No"]);
                                        txt_Valid_Upto_Date.Text = Convert.ToString(dt_EmployeeDoc.Rows[i]["Valid_Upto_Date"]);

                                        DocumentPreviewImage.Visible = false;
                                        lnkbtnDocumentRemoveImage.Visible = false;
                                        divDocumentImage.Visible = false;
                                        ImageDocument.Visible = true;
                                        hdfDocumentImagePath.Value = "";

                                        if (!_objUtility.ValidateDBNullEmptyValue(Convert.ToString(dt_EmployeeDoc.Rows[i]["Document_Path"])))
                                        {
                                            string path = Server.MapPath(Convert.ToString(dt_EmployeeDoc.Rows[i]["Document_Path"]));
                                            FileInfo file = new FileInfo(path);
                                            if (file.Exists)
                                            {
                                                DocumentPreviewImage.Visible = true;
                                                lnkbtnDocumentRemoveImage.Visible = true;
                                                divDocumentImage.Visible = true;
                                                ImageDocument.Visible = false;
                                                hdfDocumentImagePath.Value = dt_EmployeeDoc.Rows[i]["Document_Path"].ToString();
                                                string FileExtension = Path.GetExtension(hdfDocumentImagePath.Value);
                                                if (FileExtension == ".pdf")
                                                {
                                                    DocumentPreviewImage.ImageUrl = pdfImagePath;
                                                }
                                                else
                                                {
                                                    DocumentPreviewImage.ImageUrl = hdfDocumentImagePath.Value;
                                                }
                                            }
                                            else
                                            {
                                                ImageDocument.ImageUrl = "~/Images/camera.jpg";
                                            }
                                        }
                                        else
                                        {
                                            ImageDocument.ImageUrl = "~/Images/camera.jpg";
                                        }
                                    }
                                }
                            }
                        }
                    }

                    divActionRemarks.Visible = true;
                    txtEditRemark.Text = "";
                    rfvEditRemark.ValidationGroup = "Save";
                    rfvEditRemark.Visible = true;
                    ddlStatus.Enabled = true;
                    _objUtility.AssignButtonValidationGroup(btnSave, "Update");
                    txtEmployeeName.Focus();
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