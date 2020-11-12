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
    public partial class PartyMaster : System.Web.UI.Page
    {
        #region Global Objects
        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        public Utility _objUtility = new Utility();
        private const string MENU_CODE = "1011";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        FileSystem _objFileSystem = new FileSystem();
        string pdfImagePath = "../Images/pdf.png";
        Security _objSecurity = new Security();
        CustomAppSetting _objCustomAppSetting = new CustomAppSetting();
        Notification _objNotification = new Notification();
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
                    lnkbtnPartyList_Click(null, null);
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
            hdfPartyId.Value = "0";
            hdfParty_Login_User_Id.Value = "0";
            hdfParty_Contact_Person_Id.Value = "0";
            hdfParty_Status_Id.Value = "0";
            hdfParty_URL_QS_Code.Value = "";
            hdfParty_Business_Unit_Id.Value = "0";

            HideButtons();
            Session_Business_Unit = null;
            grdBusinessUnit.DataSource = Session_Business_Unit;
            grdBusinessUnit.DataBind();

            _objUtility.AssignButtonValidationGroup(lnkbtnSendToParty, "Send To Party");
            _objUtility.AssignButtonValidationGroup(lnkbtnSendToApproval, "Send To Approval");
            _objUtility.AssignButtonValidationGroup(lnkbtnSubmitApprove, "Submit & Approve");
            _objUtility.AssignButtonValidationGroup(lnkbtnApprove, "Approve");
            _objUtility.AssignButtonValidationGroup(lnkbtnReject, "Reject");
            _objUtility.AssignButtonValidationGroup(lnkbtnDeactivated, "Deactivate");
            _objUtility.AssignButtonValidationGroup(lnkbtnActivate, "Activate");
            _objUtility.AssignButtonValidationGroup(lnkbtnEditAfterApproved, "Edit");
            _objUtility.AssignButtonValidationGroup(btnClear, "Back");

            if (ddlType.Items.Count > 0)
            {
                ddlType.SelectedValue = "0";
            }

            if (ddlCompanyType.Items.Count > 0)
            {
                ddlCompanyType.SelectedValue = "0";
            }

            if (ddlState.Items.Count > 0)
            {
                ddlState.SelectedValue = "0";
            }

            txtPartyDesignation.Text = "";
            txtParty_Company_Code.Text = "";
            txtParty_Company_Code.Enabled = false;
            txtPartyName.Text = "";
            txtParty_Company_Name.Text = "";
            txtParty_Email_Id.Text = "";
            txtParty_Mobile_No.Text = "";
            txtParty_Address.Text = "";
            txtParty_Pincode.Text = "";
            txtActionRemarks.Text = "";
            txtRemarks.Text = "";
            // txtLoginId.Text = "";

            divActionRemarks.Visible = false;


            divDealingIn.Visible = false;
            divBusinessUnit.Visible = false;
            divEmployeeDocument.Visible = false;

            DataTable dt = new DataTable();

            grdFirm.DataSource = dt;
            grdDealingIn.DataBind();

            rptPartyDocumentLink.DataSource = dt;
            grdDealingIn.DataBind();

            grdDealingIn.DataSource = dt;
            grdDealingIn.DataBind();
            
            // rfvLoginId.ValidationGroup = Utility.GarbageValidationGroup;
            rfvActionRemarks.ValidationGroup = Utility.GarbageValidationGroup;

            ddlCity.Items.Clear();

            //_objDBCommon.Bind_Control(ddlCity, dt, true, "City_Id", "City_Name");

            FormEntryAndListDivHideShow(false, true, "Create Party", "glyphicon glyphicon-user text-black");
        }

        private void _Bind_Control()
        {
            DataTable dt = new DataTable();
            grdData.DataSource = dt;
            grdData.DataBind();

            _objMasterCollection.FillAnyListFromEnum(ddlType, EnumCollection.EnumType.Party_Type, 1, true, 0, true);
            _objMasterCollection.BindCompanyType(0, 1, ddlCompanyType, true);
            _objMasterCollection.BindFirmList(0, EnumCollection.SearchRecord.MAIN_DATA, 1, grdFirm, false);
            _objMasterCollection.BindState(0, 1, ddlState, true);
            _objMasterCollection.FillAnyListFromEnum(grdDealingIn, EnumCollection.EnumType.Dealing_In_Type, 1, true, 0, false);

            //Search Parameter
            _objMasterCollection.FillAnyListFromEnum(ddlSearchType, EnumCollection.EnumType.Party_Type, 1, true, 0, true);
            //_objMasterCollection.BindCompanyType(0, 1, ddlSearchCompanyType, true);
            _objMasterCollection.FillStatus(ddlSearchStatus, EnumCollection.StatusType.Party_Status, true);

            foreach (GridViewRow row in grdDealingIn.Rows)
            {
                HiddenField hdf_grd_Dealing_In_Enum_Type_Id = ((HiddenField)row.FindControl("hdf_grd_Dealing_In_Enum_Type_Id"));
                HiddenField hdf_Category_Type_Enum_Id = ((HiddenField)row.FindControl("hdf_Category_Type_Enum_Id"));
                ListBox ddlCategory = ((ListBox)row.FindControl("ddlCategory"));

                if (hdf_grd_Dealing_In_Enum_Type_Id.Value == "27" || hdf_grd_Dealing_In_Enum_Type_Id.Value == "28") //Product Purchase or Product Sale
                {
                    hdf_Category_Type_Enum_Id.Value = "10";//productk
                    _objMasterCollection.BindCategory(0, Convert.ToInt64(hdf_Category_Type_Enum_Id.Value), 1, ddlCategory, false);//Product
                }
                else if (hdf_grd_Dealing_In_Enum_Type_Id.Value == "29")//Service
                {
                    hdf_Category_Type_Enum_Id.Value = "11";//Service
                    _objMasterCollection.BindCategory(0, Convert.ToInt64(hdf_Category_Type_Enum_Id.Value), 1, ddlCategory, false);//Service
                }
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

        private void FormEntryAndListDivHideShow(bool List, bool CreateParty, string HeaderSpan, string MenuHeaderIcon)
        {
            divPartyist.Visible = List;
            lnkbtnPartyList.Visible = !List;

            divCreateParty.Visible = CreateParty;
            lnkbtnCreateParty.Visible = !CreateParty;

            HideButtons();

            if (divCreateParty.Visible)
            {
                lnkbtnSendToParty.Visible = divActionSendToParty.Visible = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Employee_Send_to_Party, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                lnkbtnSendToApproval.Visible = divActionSendToApproval.Visible = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Employee_Submitted, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id)); ;
                lnkbtnSubmitApprove.Visible = divActionSubmitApprove.Visible = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Approved, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id)); ;
            }
            spanHeader.InnerText = HeaderSpan;
            liMenuHeaderIcon.Attributes["class"] = MenuHeaderIcon;
        }

        private void HideButtons()
        {
            lnkbtnSendToParty.Visible = false;
            lnkbtnSendToApproval.Visible = false;
            lnkbtnSubmitApprove.Visible = false;
            lnkbtnApprove.Visible = false;
            lnkbtnReject.Visible = false;
            lnkbtnDeactivated.Visible = false;
            lnkbtnActivate.Visible = false;
            lnkbtnEditAfterApproved.Visible = false;

            divActionSendToParty.Visible = false;
            divActionSendToApproval.Visible = false;
            divActionSubmitApprove.Visible = false;
            divActionApprove.Visible = false;
            divActionReject.Visible = false;
            divActionDeactivated.Visible = false;
            divActionActivate.Visible = false;
            divActionEditAfterApproved.Visible = false;

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

        private void Action(object sender, string action, Int64 Action_Status_Id)
        {
            if (_objUtility.ValidateDBNullEmptyValueInList(ddlType.SelectedValue, true))
            {
                _objMessage.ShowMessage(sender, ddlType, 8, "Party Type");
                ddlType.Focus();
                return;
            }

            if (_objUtility.ValidateDBNullEmptyValueInList(ddlCompanyType.SelectedValue, true))
            {
                _objMessage.ShowMessage(sender, ddlCompanyType, 8, "Party Company Type");
                ddlCompanyType.Focus();
                return;
            }

            if (_objUtility.ValidateDBNullEmptyValue(txtParty_Company_Name.Text.Trim()))
            {
                _objMessage.ShowMessage(sender, txtParty_Company_Name, 6, "Party Company Name");
                txtParty_Company_Name.Focus();
                return;
            }

            if (_objUtility.ValidateDBNullEmptyValue(txtParty_Company_Code.Text.Trim()))
            {
                _objMessage.ShowMessage(sender, txtParty_Company_Code, 6, "Party Company Code");
                txtParty_Company_Code.Focus();
                return;
            }

            if (_objUtility.ValidateDBNullEmptyValue(txtPartyName.Text.Trim()))
            {
                _objMessage.ShowMessage(sender, txtPartyName, 6, "Party Name");
                txtPartyName.Focus();
                return;
            }

            if (_objUtility.ValidateDBNullEmptyValue(txtParty_Email_Id.Text.Trim()))
            {
                _objMessage.ShowMessage(sender, txtParty_Email_Id, 6, "Email Id");
                txtParty_Email_Id.Focus();
                return;
            }

            if (!_objUtility.IsValid_Email(txtParty_Email_Id.Text.Trim()))
            {
                _objMessage.ShowMessage(sender, txtParty_Email_Id, 6, "Valid Email Id");
                txtParty_Email_Id.Focus();
                return;
            }

            if (_objUtility.ValidateDBNullEmptyValue(txtParty_Mobile_No.Text.Trim()))
            {
                _objMessage.ShowMessage(sender, txtParty_Mobile_No, 6, "Mobile No.");
                txtParty_Mobile_No.Focus();
                return;
            }

            if (!_objUtility.IsValid_MobileNo(txtParty_Mobile_No.Text.Trim()))
            {
                _objMessage.ShowMessage(sender, txtParty_Mobile_No, 6, "Valid  Mobile Number");
                txtParty_Mobile_No.Focus();
                return;
            }

            if (Action_Status_Id != 13)
            {
                if (_objUtility.ValidateDBNullEmptyValueInList(ddlState.SelectedValue, true))
                {
                    _objMessage.ShowMessage(sender, ddlState, 8, "State");
                    ddlState.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValueInList(ddlCity.SelectedValue, true))
                {
                    _objMessage.ShowMessage(sender, ddlCity, 8, "City");
                    ddlCity.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtParty_Address.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtParty_Address, 6, "Address");
                    txtParty_Address.Focus();
                    return;
                }

                if (_objUtility.ValidateDBNullEmptyValue(txtParty_Pincode.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtParty_Pincode, 6, "Pincode");
                    txtParty_Pincode.Focus();
                    return;
                }
            }

            if (hdfPartyId.Value != "0" && _objUtility.ValidateDBNullEmptyValue(txtActionRemarks.Text.Trim()) && (Action_Status_Id == 17 || Action_Status_Id == 18 || Action_Status_Id == 30 || Action_Status_Id == 31)) // Reject , Deactivate , Activate , Edit
            {
                _objMessage.ShowMessage(sender, txtActionRemarks, 6, "Reason For Change");
                txtActionRemarks.Focus();
                return;
            }

            //if ((Action_Status_Id != 13) && (_objUtility.ValidateDBNullEmptyValue(txtLoginId.Text.Trim())))//Employee Send to Party
            //{
            //    _objMessage.ShowMessage(sender, txtLoginId, 6, "Login Id");
            //    txtLoginId.Focus();
            //    return;
            //}

            if (_objDBCommon.Is_Valid_Transaction_Password(txtUserTransactionPassword, _objManageUserSession) == false)
            {
                return;
            }

            DataTable dtDealCategoryLink = _objMasterCollection.UT_Party_Deal_Category_Link;
            DataRow drData = null;

            if (ddlType.SelectedValue == "5" || ddlType.SelectedValue == "6") //Customer and Supplier
            {
                for (int ichk = 0; ichk < grdDealingIn.Rows.Count; ichk++)
                {
                    GridViewRow gdRow = grdDealingIn.Rows[ichk];

                    HiddenField hdf_grd_Party_Deal_Category_Link_Id = ((HiddenField)gdRow.FindControl("hdf_grd_Party_Deal_Category_Link_Id"));
                    HiddenField hdf_grd_Dealing_In_Enum_Type_Id = ((HiddenField)gdRow.FindControl("hdf_grd_Dealing_In_Enum_Type_Id"));
                    ListBox ddlCategory = ((ListBox)gdRow.FindControl("ddlCategory"));

                    for (int icat = 0; icat < ddlCategory.Items.Count; icat++)
                    {
                        if (ddlCategory.Items[icat].Selected == true)
                        {
                            if (ddlCategory.Items[icat].Value != "0")
                            {
                                if (_objUtility.ValidateDBNullEmptyValue(hdf_grd_Party_Deal_Category_Link_Id.Value))
                                {
                                    hdf_grd_Party_Deal_Category_Link_Id.Value = "0";
                                }
                                drData = dtDealCategoryLink.NewRow();
                                drData["Party_Deal_Category_Link_Id"] = hdf_grd_Party_Deal_Category_Link_Id.Value;
                                drData["Dealing_In_Enum_Type_Id"] = hdf_grd_Dealing_In_Enum_Type_Id.Value;
                                drData["Category_Id"] = ddlCategory.Items[icat].Value;
                                drData["Status_Id"] = 1;
                                drData["Remarks"] = DBNull.Value;
                                drData["Row_No"] = GetNextRowNo(dtDealCategoryLink);
                                dtDealCategoryLink.Rows.Add(drData);
                            }
                        }
                    }
                }
            }

            DataTable dtContactPerson = _objMasterCollection.UT_Party_Contact_Person;
            drData = dtContactPerson.NewRow();
            drData["Party_Contact_Person_Id"] = hdfParty_Contact_Person_Id.Value;
            drData["Party_Contact_Person_Name"] = txtPartyName.Text.Trim();
            drData["Party_Contact_Person_Department"] = DBNull.Value;
            drData["Party_Contact_Person_Designation"] = txtPartyDesignation.Text.Trim();
            drData["Party_Contact_Person_Telephone_No"] = DBNull.Value;
            drData["Party_Contact_Person_Email_Id"] = txtParty_Email_Id.Text.Trim();
            drData["Party_Contact_Person_Mobile_No"] = txtParty_Mobile_No.Text.Trim();
            drData["Is_Party_Contact_Person_Has_On_Whatsapp"] = DBNull.Value;
            drData["Party_Contact_Person_Alternate_Mobile_No"] = DBNull.Value;
            drData["Is_Party_Contact_Person_Alternate_Has_On_Whatsapp"] = DBNull.Value;
            drData["Party_Contact_Person_Date_Of_Birth"] = DBNull.Value;
            drData["Party_Contact_Person_Anniversary_Date"] = DBNull.Value;
            drData["Party_Contact_Person_WhatsApp_No"] = txtParty_WhatsApp_No.Text.Trim();
            drData["Is_Notify"] = true;
            drData["Status_Id"] = 1;
            drData["Remarks"] = DBNull.Value;
            drData["Row_No"] = GetNextRowNo(dtContactPerson);
            dtContactPerson.Rows.Add(drData);

            bool CheckDefaultPartyFirm = false;
            DataTable dtFirmLink = _objMasterCollection.UT_Entities_Firm_Link;

            for (int ichk = 0; ichk < grdFirm.Rows.Count; ichk++)
            {
                GridViewRow rptRow = grdFirm.Rows[ichk];

                HiddenField hdfFirm_Id = ((HiddenField)rptRow.FindControl("hdfFirm_Id"));
                CheckBox cbIndividual = ((CheckBox)rptRow.FindControl("cbIndividual"));
                CheckBox chkIsDefault = ((CheckBox)rptRow.FindControl("chkIsDefault"));
                HiddenField hdf_grd_Party_Firm_Link_Id = ((HiddenField)rptRow.FindControl("hdf_grd_Party_Firm_Link_Id"));

                if (cbIndividual.Checked == true)
                {
                    if (_objUtility.ValidateDBNullEmptyValue(hdf_grd_Party_Firm_Link_Id.Value))
                    {
                        hdf_grd_Party_Firm_Link_Id.Value = "0";
                    }

                    drData = dtFirmLink.NewRow();
                    drData["Entity_Firm_Link_Id"] = hdf_grd_Party_Firm_Link_Id.Value;
                    drData["Firm_Id"] = hdfFirm_Id.Value;
                    drData["Is_Default"] = chkIsDefault.Checked;
                    drData["Department_Id"] = DBNull.Value;
                    drData["Role_Id"] = DBNull.Value;
                    drData["Status_Id"] = 1;
                    drData["Remarks"] = DBNull.Value;
                    drData["Row_No"] = GetNextRowNo(dtFirmLink);
                    dtFirmLink.Rows.Add(drData);

                    if (chkIsDefault.Checked)
                    {
                        CheckDefaultPartyFirm = true;
                    }
                }
            }

            if (dtFirmLink.Rows.Count == 0)
            {
                _objMessage.ShowMessage(sender, grdFirm, 6, "Firm");
                grdFirm.Focus();
                return;
            }

            if (CheckDefaultPartyFirm == false)
            {
                _objMessage.ShowMessage(sender, grdFirm, 6, "Default Firm");
                grdFirm.Focus();
                return;
            }

            DataTable dtDocumentLink = _objMasterCollection.UT_Entities_Documents_Link;

            for (int ichk = 0; ichk < rptPartyDocumentLink.Items.Count; ichk++)
            {
                RepeaterItem rptRow = rptPartyDocumentLink.Items[ichk];

                HiddenField hdf_grd_Party_Document_Id = ((HiddenField)rptRow.FindControl("hdf_grd_Party_Document_Id"));
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
                    if (hdf_grd_Control_Status_Enum_Id.Value == "2" && Action_Status_Id != 13)//mandatory
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
                    if (_objUtility.ValidateDBNullEmptyValue(hdf_grd_Party_Document_Id.Value))
                    {
                        hdf_grd_Party_Document_Id.Value = "0";
                    }
                    drData = dtDocumentLink.NewRow();
                    drData["Entity_Document_Id"] = Convert.ToInt64(hdf_grd_Party_Document_Id.Value);
                    drData["Document_Id"] = Convert.ToInt64(hdf_Document_Id.Value);
                    drData["Unique_No"] = txt_Unique_No.Text.Trim();
                    drData["Name_As_Per_Document"] = DBNull.Value;
                    drData["Document_Detail"] = DBNull.Value;
                    drData["Valid_From_Date"] = DBNull.Value;

                    if (!_objUtility.ValidateDBNullEmptyValue(Convert.ToString(txt_Valid_Upto_Date.Text.Trim())))
                    {
                        drData["Valid_Upto_Date"] = _objUtility.Convert_ddMMyyyy_Into_Date(txt_Valid_Upto_Date.Text.Trim());
                    }
                    else
                    {
                        drData["Valid_Upto_Date"] = DBNull.Value;
                    }

                    if (hdf_Document_Image_Path.Value != "~/Images/camera.jpg" && hdf_Document_Image_Path.Value.Contains("/dist"))
                    {
                        drData["Document_Path"] = hdf_Document_Image_Path.Value;
                    }
                    else
                    {
                        drData["Document_Path"] = _objFileSystem.MoveToServer(hdf_Document_Image_Path.Value, Convert.ToInt64(((HiddenField)rptRow.FindControl("hdf_Document_Id")).Value));
                    }
                    drData["Status_Id"] = 1;
                    drData["Remarks"] = DBNull.Value;
                    drData["Row_No"] = GetNextRowNo(dtDocumentLink);
                    dtDocumentLink.Rows.Add(drData);
                }
            }


            DataTable dtBusinessUnit = _objMasterCollection.UT_Party_Business_Unit;

            if (ddlType.SelectedValue == "4") //Client
            {
                for (int i = 0; i < grdBusinessUnit.Rows.Count; i++)
                {
                    drData = dtBusinessUnit.NewRow();

                    drData["Party_Business_Unit_Id"] = ((HiddenField)grdBusinessUnit.Rows[i].FindControl("hdfgrdParty_Business_Unit_Id")).Value;
                    drData["Business_Unit_Name"] = ((Label)grdBusinessUnit.Rows[i].FindControl("lblBusinessUnitName")).Text;
                    drData["Business_Unit_Address"] = ((Label)grdBusinessUnit.Rows[i].FindControl("lblBusinessUnitAddress")).Text;
                    drData["Status_Id"] = ((HiddenField)grdBusinessUnit.Rows[i].FindControl("hdfgrdStatus_Id")).Value;
                    drData["Remarks"] = ((HiddenField)grdBusinessUnit.Rows[i].FindControl("hdfgrdRemarks")).Value;
                    drData["Action_Remarks"] = txtActionRemarks.Text.Trim();
                    drData["Row_No"] = GetNextRowNo(dtBusinessUnit);

                    dtBusinessUnit.Rows.Add(drData);
                }
            }

            if (Action_Status_Id != 13) //13 -Employee Send to Party
            {
                //if (dtDocumentLink == null)
                //{
                //    _objMessage.ShowMessage(null, null, 25, " At Least One Document");
                //    return;
                //}
                if (ddlType.SelectedValue == "5" || ddlType.SelectedValue == "6") //Customer and Supplier
                {
                    if (dtDealCategoryLink == null || dtDealCategoryLink.Rows.Count == 0)
                    {
                        _objMessage.ShowMessage(null, null, 25, " At Least One Category");
                        return;
                    }
                }
            }

            string userid = "", password = "";
            DataTable dtPassword = _objUtility.GeneratePassword(null);
            password = Convert.ToString(dtPassword.Rows[0]["Password"]);

            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Id", Value = hdfPartyId.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = txtParty_Email_Id.Text.Trim() });//txtLoginId.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Password", Value = password });
            lstDBMapParam.Add(new DBMapParam() { Name = "SaltValue", Value = dtPassword.Rows[0]["SaltValue"] });
            lstDBMapParam.Add(new DBMapParam() { Name = "HashPassword", Value = dtPassword.Rows[0]["LoginPasswordEncrypt"] });
            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Password_Reset_Required", Value = true });
            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Trans_Password_Reset_Required", Value = false });
            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Profile_Update_Required", Value = false });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Type_Enum_Id", Value = ddlType.SelectedValue });
            lstDBMapParam.Add(new DBMapParam() { Name = "Company_Type_Id", Value = ddlCompanyType.SelectedValue });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Company_Name", Value = txtParty_Company_Name.Text });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Company_Code", Value = txtParty_Company_Code.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Contact_No", Value = txtParty_Mobile_No.Text });//Temp Set
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Fax_No", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Email_Id", Value = txtParty_Email_Id.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Website", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Address", Value = txtParty_Address.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Pincode", Value = txtParty_Pincode.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Country_Id", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_State_Id", Value = ddlState.SelectedValue });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_City_Id", Value = _objUtility.ValidateDBNullEmptyValue(ddlCity.SelectedValue, 0) });

            if (ddlType.SelectedValue == "4") //Client
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = 2 });
            }
            else if (ddlType.SelectedValue == "5") //Customer
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = 3 });
            }
            else if (ddlType.SelectedValue == "6") //Supplier
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = 4 });
            }
            lstDBMapParam.Add(new DBMapParam() { Name = "Profile_Pic_Path", Value = "~/dist/img/avatar6.png" });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_WhatsApp_No", Value = txtParty_WhatsApp_No.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Tran_Password", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Tran_SaltValue", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Tran_HashPassword", Value = DBNull.Value });

            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = (Action_Status_Id == 16 || Action_Status_Id == 30 || Action_Status_Id == 31) ? 1 : 0 });  //16- Approved, 30-Activate ,31-Edit After Approved
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Business_Unit", Value = dtBusinessUnit });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Login_User_Id", Value = hdfParty_Login_User_Id.Value });

            string randomcode = hdfParty_URL_QS_Code.Value;
            if (Action_Status_Id == 13)
            {
                randomcode = _objFileSystem.GetRandomCode;
                lstDBMapParam.Add(new DBMapParam() { Name = "Party_URL_QS_Code", Value = randomcode });//Code
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Party_URL_QS_Code", Value = randomcode });//aLREADY Code
            }
            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Notify", Value = true });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Contact_Persons", Value = dtContactPerson });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Deal_Category_Link", Value = dtDealCategoryLink });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Documents", Value = dtDocumentLink });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Firm_Links", Value = dtFirmLink });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_Status_Id", Value = Action_Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = txtRemarks.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = txtActionRemarks.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_User_Role_Id", Value = _objManageUserSession.GetCurrentUser_Role_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
            lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = action });
            lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

            Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Party", lstDBMapParam);

            if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
            {

                string appendaction = "";
                if (Action_Status_Id == 13)
                {
                    appendaction = "Send to Party";
                }
                else if (Action_Status_Id == 14)
                {
                    appendaction = "Submitted";
                }
                else if (Action_Status_Id == 15)
                {
                    appendaction = "Submitted";
                }
                else if (Action_Status_Id == 16)
                {
                    appendaction = "Approved";
                }
                else if (Action_Status_Id == 17)
                {
                    appendaction = "Rejected";
                }
                else if (Action_Status_Id == 18)
                {
                    appendaction = "Deactivated";
                }
                else if (Action_Status_Id == 30)
                {
                    appendaction = "Activate";
                }
                else if (Action_Status_Id == 31)
                {
                    appendaction = "Edited";
                }

                _objMessage.ShowMessageWithURL(5, _objUtility.GetCurrentURL, appendaction);

                if (Action_Status_Id == 16)
                {
                    string emailSubject = YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " - Login Details";
                    string emailbody = "Dear User,</br> you are registered on " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " as User.Your login details, URL: " + _objCustomAppSetting.URL_Root + "<br/><br/> User Name: " + txtParty_Email_Id.Text.Trim() + "<br/> Password: <b>" + password + "</b> Have a nice day.";
                    string mobileMessage = "You are successfully registered on " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + ", Your login details, URL: " + _objCustomAppSetting.URL_Root + ", User Name: " + txtParty_Email_Id.Text.Trim() + ", Password: " + password + ".";

                    if (!_objUtility.ValidateDBNullEmptyValue(txtParty_Email_Id.Text.Trim()) && _objUtility.IsValid_Email(txtParty_Email_Id.Text.Trim()))
                    {
                        _objNotification.SendMail(_objNotification.GetArray(txtParty_Email_Id.Text), emailSubject, emailbody, false);
                    }

                    if (!_objUtility.ValidateDBNullEmptyValue(txtParty_Mobile_No.Text.Trim()) && _objUtility.IsValid_MobileNo(txtParty_Mobile_No.Text.Trim()))
                    {
                        _objNotification.SendSMS(txtParty_Mobile_No.Text.Trim(), mobileMessage, false);
                    }
                }
                else if (Action_Status_Id == 13) //Employee Send to Party
                {
                    string emailSubject = "Complete Your Registration on " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " portal";
                    string emailbody = "Dear User,</br> Complete Your Registration on " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " Portal, link " + _objCustomAppSetting.URL_Root + "/PartyRegistration.aspx?code=" + HttpUtility.UrlEncode(_objSecurity.Encrypted(randomcode)) + " </b> Have a nice day.";
                    string mobileMessage = "Complete Your Registration on " + YCS.YCS_Configuration.PRODUCT_NAME_IN_EMAIL_SMS + " Portal, link " + _objCustomAppSetting.URL_Root + "/PartyRegistration.aspx?code=" + HttpUtility.UrlEncode(_objSecurity.Encrypted(randomcode));

                    if (!_objUtility.ValidateDBNullEmptyValue(txtParty_Email_Id.Text.Trim()) && _objUtility.IsValid_Email(txtParty_Email_Id.Text.Trim()))
                    {
                        _objNotification.SendMail(_objNotification.GetArray(txtParty_Email_Id.Text), emailSubject, emailbody, false);
                    }

                    if (!_objUtility.ValidateDBNullEmptyValue(txtParty_Mobile_No.Text.Trim()) && _objUtility.IsValid_MobileNo(txtParty_Mobile_No.Text.Trim()))
                    {
                        _objNotification.SendSMS(txtParty_Mobile_No.Text.Trim(), mobileMessage, false);
                    }
                }
            }
            else
            {
                if (Convert.ToString(dictResult["OutputMessage"]).Contains("Company Code"))
                {
                    _objMessage.ShowMessage(sender, txtParty_Company_Code, 7, dictResult["OutputMessage"]);
                    txtParty_Company_Code.Focus();
                    return;
                }
                else if (Convert.ToString(dictResult["OutputMessage"]).Contains("Email Id"))
                {
                    _objMessage.ShowMessage(sender, txtParty_Email_Id, 7, dictResult["OutputMessage"]);
                    txtParty_Email_Id.Focus();
                    return;
                }
                else if (Convert.ToString(dictResult["OutputMessage"]).Contains("Login Id"))
                {
                    _objMessage.ShowMessage(sender, txtParty_Email_Id, 7, dictResult["OutputMessage"]);
                    txtParty_Email_Id.Focus();
                    //_objMessage.ShowMessage(sender, txtLoginId, 7, dictResult["OutputMessage"]);
                    // txtLoginId.Focus();
                    return;
                }
            }
        }

        #endregion

        #region Actions And Clear Events

        protected void lnkbtnSendToParty_Click(object sender, EventArgs e)
        {
            try
            {
                string action = "INSERT";
                if ((Convert.ToInt64(((LinkButton)sender).CommandArgument) == 14 && hdfPartyId.Value != "0") || (((LinkButton)sender).ID == "lnkbtnApprove") || (Convert.ToInt64(((LinkButton)sender).CommandArgument) == 17) || (Convert.ToInt64(((LinkButton)sender).CommandArgument) == 18) || (Convert.ToInt64(((LinkButton)sender).CommandArgument) == 30) || (Convert.ToInt64(((LinkButton)sender).CommandArgument) == 31)) //14-Send to Approval,17-Reject,18-Deactivate,30-Activate,31-Edit
                {
                    action = "UPDATE";
                }

                Action(sender, action, Convert.ToInt64(((LinkButton)sender).CommandArgument));
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
                // _objUtility.Page_Redirect();
                lnkbtnPartyList_Click(null, null);
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

        #region DropDown Events

        private void CompanyCode(string PartyTypeId)
        {
            if (hdfPartyId.Value == "0")
            {
                txtParty_Company_Code.Text = "";
                DataSet dsResult = _objMasterCollection.BindParty(0, 0, (ddlType.SelectedValue), 0, 0, 0, "", EnumCollection.SearchRecord.BOTH, null, false);
                if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count > 0)
                {
                    DataTable dtParty = dsResult.Tables[0];

                    Int64 PartyRow = dtParty.Rows.Count + 1;

                    if (ddlType.SelectedValue == "4") //Client
                    {
                        txtParty_Company_Code.Text = "CL000" + PartyRow;
                    }
                    else if (ddlType.SelectedValue == "5") //Customer
                    {
                        txtParty_Company_Code.Text = "CU000" + PartyRow;
                    }
                    else if (ddlType.SelectedValue == "6") //Supplier
                    {
                        txtParty_Company_Code.Text = "SU000" + PartyRow;
                    }
                }
                else
                {
                    if (ddlType.SelectedValue == "4") //Client
                    {
                        txtParty_Company_Code.Text = "CL0001";
                    }
                    else if (ddlType.SelectedValue == "5") //Customer
                    {
                        txtParty_Company_Code.Text = "CU0001";
                    }
                    else if (ddlType.SelectedValue == "6") //Supplier
                    {
                        txtParty_Company_Code.Text = "SU0001";
                    }
                }
            }
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                divDealingIn.Visible = false;
                divBusinessUnit.Visible = false;
                CompanyCode(ddlType.SelectedValue);
                DataTable dtDoc = new DataTable();

                foreach (GridViewRow row in grdFirm.Rows)
                {
                    ((CheckBox)row.FindControl("cbIndividual")).Checked = true;
                    ((CheckBox)row.FindControl("chkIsDefault")).Checked = true;
                    HiddenField hdfdocFirm_Id = ((HiddenField)row.FindControl("hdfFirm_Id"));

                    if (ddlType.SelectedValue == "4") //Client
                    {
                        dtDoc = _objMasterCollection.FillFirmDocumentSettingDetails(rptPartyDocumentLink, Convert.ToInt64(hdfdocFirm_Id.Value), 1, "0", "0", "0", "2,3", false);
                        divBusinessUnit.Visible = true;

                    }
                    else if (ddlType.SelectedValue == "5") //Customer
                    {
                        divDealingIn.Visible = true;
                        dtDoc = _objMasterCollection.FillFirmDocumentSettingDetails(rptPartyDocumentLink, Convert.ToInt64(hdfdocFirm_Id.Value), 1, "0", "0", "2,3", "0", false);
                    }
                    else if (ddlType.SelectedValue == "6") //Supplier
                    {
                        divDealingIn.Visible = true;
                        dtDoc = _objMasterCollection.FillFirmDocumentSettingDetails(rptPartyDocumentLink, Convert.ToInt64(hdfdocFirm_Id.Value), 1, "0", "2,3", "0", "0", false);
                    }

                    if (dtDoc != null && dtDoc.Rows.Count > 0)
                    {
                        divEmployeeDocument.Visible = true;
                    }
                    else
                    {
                        divEmployeeDocument.Visible = false;
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

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlCity.Items.Clear();

                if (_objUtility.ValidateDBNullEmptyValueInList(ddlState.SelectedValue, true) == false)
                {
                    _objMasterCollection.BindCity(0, Convert.ToInt64(ddlState.SelectedValue), 1, ddlCity, true);
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

        #region Create & List Button Events
        protected void lnkbtnCreateParty_Click(object sender, EventArgs e)
        {
            try
            {
                // _objUtility.Page_Redirect();
                _Control_Clear();
                _Bind_Control();
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void lnkbtnPartyList_Click(object sender, EventArgs e)
        {
            try
            {
                FormEntryAndListDivHideShow(true, false, "Party List", "glyphicon glyphicon-list text-black");
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

        #region Search & Clear
        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            try
            {
                _objMasterCollection.BindParty(0, 0, ddlSearchType.SelectedValue, Convert.ToInt64(ddlCompanyType.SelectedValue), 0, 0, txtSearchCompanyNameCode.Text.Trim(), EnumCollection.SearchRecord.MAIN_DATA, grdData, false);
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void lnlSearchClear_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlSearchStatus.Items.Count > 0)
                {
                    ddlSearchStatus.SelectedIndex = 0;
                }

                if (ddlSearchStatus.Items.Count > 0)
                {
                    ddlSearchStatus.SelectedIndex = 0;
                }

                txtSearchCompanyNameCode.Text = "";
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

        #region Grd Events
        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Vview")
                {
                    Session_Business_Unit = null;

                    _Control_Clear();

                    HideButtons();

                    int rowid = Convert.ToInt32(e.CommandArgument);

                    hdfPartyId.Value = ((HiddenField)grdData.Rows[rowid].FindControl("hdfPartyId")).Value;
                    hdfParty_Login_User_Id.Value = ((HiddenField)grdData.Rows[rowid].FindControl("hdfPartyLoginUser_Id")).Value;

                    DataSet dsResult = _objMasterCollection.BindParty(0, Convert.ToInt64(hdfPartyId.Value), "0", 0, 0, 0, "", EnumCollection.SearchRecord.BOTH, null, false);

                    if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count > 0)
                    {
                        _Bind_Control();

                        DataTable dtParty = dsResult.Tables[0];

                        if (ddlType.Items.FindByValue(Convert.ToString(dtParty.Rows[0]["Party_Type_Enum_Id"])) != null)
                        {
                            ddlType.SelectedValue = Convert.ToString(dtParty.Rows[0]["Party_Type_Enum_Id"]);
                        }
                        if (ddlCompanyType.Items.FindByValue(Convert.ToString(dtParty.Rows[0]["Company_Type_Id"])) != null)
                        {
                            ddlCompanyType.SelectedValue = Convert.ToString(dtParty.Rows[0]["Company_Type_Id"]);
                        }

                        txtParty_Company_Name.Text = Convert.ToString(dtParty.Rows[0]["Party_Company_Name"]);
                        txtParty_Company_Code.Text = Convert.ToString(dtParty.Rows[0]["Party_Company_Code"]);
                        txtParty_Mobile_No.Text = Convert.ToString(dtParty.Rows[0]["Party_Contact_No"]);
                        txtParty_Email_Id.Text = Convert.ToString(dtParty.Rows[0]["Party_Email_Id"]);
                        txtParty_WhatsApp_No.Text = Convert.ToString(dtParty.Rows[0]["Party_WhatsApp_No"]);

                        //txtLoginId.Text = Convert.ToString(dtParty.Rows[0]["Login_Id"]);

                        hdfParty_Status_Id.Value = Convert.ToString(dtParty.Rows[0]["Party_Status_Id"]);
                        hdfParty_URL_QS_Code.Value = Convert.ToString(dtParty.Rows[0]["Party_URL_QS_Code"]);

                        if (ddlState.Items.FindByValue(Convert.ToString(dtParty.Rows[0]["Party_State_Id"])) != null)
                        {
                            ddlState.SelectedValue = Convert.ToString(dtParty.Rows[0]["Party_State_Id"]);
                        }

                        ddlState_SelectedIndexChanged(null, null);

                        if (ddlCity.Items.FindByValue(Convert.ToString(dtParty.Rows[0]["Party_City_Id"])) != null)
                        {
                            ddlCity.SelectedValue = Convert.ToString(dtParty.Rows[0]["Party_City_Id"]);
                        }

                        txtParty_Address.Text = Convert.ToString(dtParty.Rows[0]["Party_Address"]);
                        txtParty_Pincode.Text = Convert.ToString(dtParty.Rows[0]["Party_Pincode"]);
                        txtRemarks.Text = Convert.ToString(dtParty.Rows[0]["Remarks"]);

                        if (dsResult.Tables[1].Rows.Count > 0)
                        {
                            DataTable dtPartyPerson = dsResult.Tables[1];

                            for (int i = 0; i < dtPartyPerson.Rows.Count; i++)
                            {
                                hdfParty_Contact_Person_Id.Value = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Id"]);
                                txtPartyName.Text = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Name"]);
                                txtPartyDesignation.Text = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Designation"]);
                                //Temp Already Set from Master Table
                                txtParty_Mobile_No.Text = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Mobile_No"]);
                                txtParty_Email_Id.Text = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Email_Id"]);
                                txtParty_WhatsApp_No.Text = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_WhatsApp_No"]);
                                //end
                            }
                        }


                        if (dsResult.Tables[2].Rows.Count > 0)
                        {
                            DataTable dtPartyFirm = dsResult.Tables[2];

                            for (int i = 0; i < dtPartyFirm.Rows.Count; i++)
                            {
                                foreach (GridViewRow row1 in grdFirm.Rows)
                                {
                                    HiddenField hdfFirm_Id = ((HiddenField)row1.FindControl("hdfFirm_Id"));
                                    CheckBox cbIndividual = ((CheckBox)row1.FindControl("cbIndividual"));
                                    CheckBox chkIsDefault = ((CheckBox)row1.FindControl("chkIsDefault"));
                                    HiddenField hdf_grd_Party_Firm_Link_Id = ((HiddenField)row1.FindControl("hdf_grd_Party_Firm_Link_Id"));

                                    if (hdfFirm_Id.Value == Convert.ToString(dtPartyFirm.Rows[i]["Firm_Id"]))
                                    {
                                        cbIndividual.Checked = true;
                                        hdf_grd_Party_Firm_Link_Id.Value = Convert.ToString(dtPartyFirm.Rows[i]["Party_Firm_Link_Id"]);

                                        if (Convert.ToBoolean(dtPartyFirm.Rows[i]["Is_Default"]) == true)
                                        {
                                            chkIsDefault.Checked = true;
                                            ddlType_SelectedIndexChanged(sender, e);
                                        }
                                    }
                                }
                            }
                        }


                        if (dsResult.Tables[3].Rows.Count > 0)// Party documents
                        {
                            DataTable dt_PartyDoc = dsResult.Tables[3];
                            for (int i = 0; i < dt_PartyDoc.Rows.Count; i++)
                            {
                                foreach (RepeaterItem rptRow in rptPartyDocumentLink.Items)
                                {
                                    HiddenField hdf_grd_Party_Document_Id = ((HiddenField)rptRow.FindControl("hdf_grd_Party_Document_Id"));
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

                                    if (hdf_Document_Id.Value == Convert.ToString(dt_PartyDoc.Rows[i]["Document_Id"]))
                                    {
                                        hdf_grd_Party_Document_Id.Value = Convert.ToString(dt_PartyDoc.Rows[i]["Party_Document_Id"]);
                                        txt_Unique_No.Text = Convert.ToString(dt_PartyDoc.Rows[i]["Unique_No"]);
                                        txt_Valid_Upto_Date.Text = Convert.ToString(dt_PartyDoc.Rows[i]["Valid_Upto_Date"]);

                                        DocumentPreviewImage.Visible = false;
                                        lnkbtnDocumentRemoveImage.Visible = false;
                                        divDocumentImage.Visible = false;
                                        ImageDocument.Visible = true;
                                        hdfDocumentImagePath.Value = "";

                                        if (!_objUtility.ValidateDBNullEmptyValue(Convert.ToString(dt_PartyDoc.Rows[i]["Document_Path"])))
                                        {
                                            string path = Server.MapPath(Convert.ToString(dt_PartyDoc.Rows[i]["Document_Path"]));
                                            FileInfo file = new FileInfo(path);
                                            if (file.Exists)
                                            {
                                                DocumentPreviewImage.Visible = true;
                                                lnkbtnDocumentRemoveImage.Visible = true;
                                                divDocumentImage.Visible = true;
                                                ImageDocument.Visible = false;
                                                hdfDocumentImagePath.Value = dt_PartyDoc.Rows[i]["Document_Path"].ToString();
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

                        if (dsResult.Tables[4].Rows.Count > 0)
                        {
                            DataTable dtPartyCategory = dsResult.Tables[4];

                            foreach (GridViewRow row1 in grdDealingIn.Rows)
                            {
                                HiddenField hdf_grd_Party_Deal_Category_Link_Id = ((HiddenField)row1.FindControl("hdf_grd_Party_Deal_Category_Link_Id"));
                                HiddenField hdf_grd_Dealing_In_Enum_Type_Id = ((HiddenField)row1.FindControl("hdf_grd_Dealing_In_Enum_Type_Id"));
                                HiddenField hdf_Category_Type_Enum_Id = ((HiddenField)row1.FindControl("hdf_Category_Type_Enum_Id"));
                                ListBox ddlCategory = ((ListBox)row1.FindControl("ddlCategory"));

                                if (dtPartyCategory.Select("Dealing_In_Enum_Type_Id=" + hdf_grd_Dealing_In_Enum_Type_Id.Value + " AND Category_Type_Enum_Id=" + hdf_Category_Type_Enum_Id.Value + "").Count() > 0)
                                {
                                    DataTable dtfilter = dtPartyCategory.Select("Dealing_In_Enum_Type_Id=" + hdf_grd_Dealing_In_Enum_Type_Id.Value + " AND Category_Type_Enum_Id=" + hdf_Category_Type_Enum_Id.Value + "").CopyToDataTable();

                                    for (int dtf = 0; dtf < dtfilter.Rows.Count; dtf++)
                                    {
                                        for (int icat = 0; icat < ddlCategory.Items.Count; icat++)
                                        {
                                            if (ddlCategory.Items[icat].Value != "0")
                                            {
                                                if (ddlCategory.Items[icat].Value == Convert.ToString(dtfilter.Rows[dtf]["Category_Id"]))
                                                {
                                                    if (ddlCategory.Items.FindByValue(Convert.ToString(dtfilter.Rows[dtf]["Category_Id"])) != null)
                                                    {
                                                        ddlCategory.Items[icat].Selected = true;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }


                        if (dsResult.Tables[5].Rows.Count > 0)
                        {
                            Session_Business_Unit = dsResult.Tables[5].Copy();
                        }

                        grdBusinessUnit.DataSource = Session_Business_Unit;
                        grdBusinessUnit.DataBind();

                        for (int i = 0; i < grdBusinessUnit.Rows.Count; i++)
                        {
                            _objUtility.AssignButtonValidationGroup(grdBusinessUnit.Rows[i].FindControl("lnkBtnRemove"), "Remove");
                            ((LinkButton)grdBusinessUnit.Rows[i].FindControl("lnkBtnRemove")).Text = "";
                        }

                        bool actionbuttonstatus = false;
                        if (Convert.ToInt64(dtParty.Rows[0]["Party_Status_Id"]) == 7)   //Pending for Approval
                        {
                            actionbuttonstatus = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Approved, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));

                            lnkbtnApprove.Visible = divActionApprove.Visible = actionbuttonstatus;
                            lnkbtnReject.Visible = divActionReject.Visible = actionbuttonstatus;
                        }
                        else if (Convert.ToInt64(dtParty.Rows[0]["Party_Status_Id"]) == 8)   //Approved
                        {
                            lnkbtnDeactivated.Visible = divActionDeactivated.Visible = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Deactivated, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                            lnkbtnEditAfterApproved.Visible = divActionEditAfterApproved.Visible = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Edit_After_Approved, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                        }
                        else if (Convert.ToInt64(dtParty.Rows[0]["Party_Status_Id"]) == 10)   //Deactivated
                        {
                            lnkbtnActivate.Visible = divActionActivate.Visible = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Activate, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id)); ;
                        }

                        divActionRemarks.Visible = true;
                        txtActionRemarks.Text = "";
                        // rfvActionRemarks.ValidationGroup = "Save";
                        // rfvActionRemarks.Visible = true;
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

        protected void grdBusinessUnit_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edt")
                {
                    int rowid = Convert.ToInt32(e.CommandArgument);

                    txtBusinessUnit.Text = ((Label)grdBusinessUnit.Rows[rowid].FindControl("lblBusinessUnitName")).Text;
                    txtBusinessUnitAddress.Text = ((Label)grdBusinessUnit.Rows[rowid].FindControl("lblBusinessUnitAddress")).Text;
                    hdfParty_Business_Unit_Id.Value = ((HiddenField)grdBusinessUnit.Rows[rowid].FindControl("hdfgrdParty_Business_Unit_Id")).Value;
                    txtBusinessUnit.Focus();
                }
                else if (e.CommandName == "Remove")
                {
                    int rowid = Convert.ToInt32(e.CommandArgument);

                    if (Session_Business_Unit != null)
                    {
                        Session_Business_Unit.Rows.Remove(Session_Business_Unit.Rows[rowid]);

                        Session_Business_Unit.AcceptChanges();
                        grdBusinessUnit.DataSource = Session_Business_Unit;
                        grdBusinessUnit.DataBind();
                    }

                    txtBusinessUnit.Text = "";
                    hdfParty_Business_Unit_Id.Value = "0";
                    txtBusinessUnit.Focus();
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

        protected void grdBusinessUnit_PreRender(object sender, EventArgs e)
        {
            try
            {
                if (grdBusinessUnit.Rows.Count > 0)
                {
                    //Replace the <td> with <th> and adds the scope attribute
                    grdBusinessUnit.UseAccessibleHeader = true;

                    //Adds the <thead> and <tbody> elements required for DataTables to work
                    grdBusinessUnit.HeaderRow.TableSection = TableRowSection.TableHeader;

                    //Adds the <tfoot> element required for DataTables to work
                    grdBusinessUnit.FooterRow.TableSection = TableRowSection.TableFooter;
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

        #region Session
        private DataTable Session_Business_Unit
        {
            get
            {
                if (Session[this.Page.ToString() + "PARTY_BUSINESS_UNIT"] == null)
                {
                    DataTable dtColumn = new DataTable();

                    dtColumn.Columns.Add("Party_Business_Unit_Id", typeof(Int64));
                    dtColumn.Columns.Add("Party_Id", typeof(Int64));
                    dtColumn.Columns.Add("Business_Unit_Name");
                    dtColumn.Columns.Add("Business_Unit_Address");
                    dtColumn.Columns.Add("Status_Id", typeof(Int64));
                    dtColumn.Columns.Add("Remarks");

                    Session[this.Page.ToString() + "PARTY_BUSINESS_UNIT"] = dtColumn;
                    return dtColumn;
                }
                else
                {
                    return (DataTable)Session[this.Page.ToString() + "PARTY_BUSINESS_UNIT"];
                }
            }
            set
            {
                Session[this.Page.ToString() + "PARTY_BUSINESS_UNIT"] = value;
            }

        }
        #endregion

        #region Add Business Unit
        protected void lnkbtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtBusiness = Session_Business_Unit;
                if (dtBusiness == null)
                {
                    return;
                }

                if (txtBusinessUnit.Text.Trim() == "")
                {
                    _objMessage.ShowMessage(sender, txtBusinessUnit, 6, "Business Unit Name");
                    txtBusinessUnit.Focus();
                    return;
                }
                if (txtBusinessUnitAddress.Text.Trim() == "")
                {
                    _objMessage.ShowMessage(sender, txtBusinessUnit, 6, "Business Unit Address");
                    txtBusinessUnitAddress.Focus();
                    return;
                }
                string editcondition = Convert.ToInt64(_objUtility.ValidateDBNullEmptyValue(hdfParty_Business_Unit_Id.Value, 0)) == 0 ? "" : " AND Party_Business_Unit_Id <> '" + _objUtility.ValidateDBNullEmptyValue(hdfParty_Business_Unit_Id.Value, 0) + "'";

                if (dtBusiness.Select("Business_Unit_Name='" + txtBusinessUnit.Text.Trim() + "'" + editcondition).Length > 0)
                {
                    _objMessage.ShowMessage(sender, txtBusinessUnit, 7, "Business Unit Name");
                    txtBusinessUnit.Focus();
                    return;
                }

                if (Convert.ToInt64(_objUtility.ValidateDBNullEmptyValue(hdfParty_Business_Unit_Id.Value, "0")) == 0)
                {
                    DataRow drData = dtBusiness.NewRow();
                    drData["Party_Business_Unit_Id"] = 0;
                    drData["Business_Unit_Name"] = txtBusinessUnit.Text.Trim();
                    drData["Business_Unit_Address"] = txtBusinessUnitAddress.Text.Trim();
                    drData["Status_Id"] = 1;
                    drData["Remarks"] = DBNull.Value;

                    dtBusiness.Rows.Add(drData);
                }
                else
                {
                    DataRow[] dr = dtBusiness.Select("Party_Business_Unit_Id='" + hdfParty_Business_Unit_Id.Value + "'");
                    dr[0]["Business_Unit_Name"] = txtBusinessUnit.Text.Trim();
                    dr[0]["Business_Unit_Address"] = txtBusinessUnitAddress.Text.Trim();
                }

                dtBusiness.AcceptChanges();

                Session_Business_Unit = dtBusiness;

                grdBusinessUnit.DataSource = Session_Business_Unit;
                grdBusinessUnit.DataBind();

                for (int i = 0; i < grdBusinessUnit.Rows.Count; i++)
                {
                    _objUtility.AssignButtonValidationGroup(grdBusinessUnit.Rows[i].FindControl("lnkBtnRemove"), "Remove");
                    ((LinkButton)grdBusinessUnit.Rows[i].FindControl("lnkBtnRemove")).Text = "";
                }

                txtBusinessUnit.Text = "";
                txtBusinessUnitAddress.Text = "";
                hdfParty_Business_Unit_Id.Value = "0";
                txtBusinessUnit.Focus();
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