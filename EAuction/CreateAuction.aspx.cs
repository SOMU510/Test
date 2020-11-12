using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.IO;
using System.Drawing;
using YCS;

namespace eAuction
{
    public partial class CreateAuction : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        public Utility _objUtility = new Utility();
        private const string MENU_CODE = "1014";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();

        DBCommon _objDBCommon = new DBCommon();
        FileSystem _objFileSystem = new FileSystem();
        string pdfImagePath = "../Images/pdf.png";
        CustomAppSetting _objCustomAppSetting = new CustomAppSetting();

        Int64 SavedAsDraftByAdmin = 32;
        Int64 SavedAsDraftByClient = 41;
        Int64 Auction_Ready_For_Review = 33;
        Int64 Auction_Ready_For_Publishing = 34;
        Int64 Auction_Publish = 35;
        Int64 Auction_Return_For_Review = 36;
        Int64 Auction_Active = 37;
        Int64 Auction_Conducted = 38;
        Int64 Auction_Settled = 39;
        Int64 Auction_Discarded = 40;

        //Color
        Color SavedAsDraftByAdmin_Color = System.Drawing.Color.CornflowerBlue;
        Color SavedAsDraftByClient_Color = System.Drawing.Color.Chocolate;
        Color Auction_Ready_For_Review_Color = System.Drawing.Color.OrangeRed;
        Color Auction_Ready_For_Publishing_Color = System.Drawing.Color.Coral;
        Color Auction_PublishColor_Color = System.Drawing.Color.DarkMagenta;
        Color Auction_Return_For_Review_Color = System.Drawing.Color.Red;
        Color Auction_Active_Color = System.Drawing.Color.Green;
        Color Auction_Conducted_Color = System.Drawing.Color.DeepSkyBlue;
        Color Auction_Settled_Color = System.Drawing.Color.LightSeaGreen;
        Color Auction_Discarded_Color = System.Drawing.Color.Red;
        //End

        //Auction Type
        string Forward = "7";
        string Reverse = "8";
        string Service = "9";
        //End

        bool SendMail = false;
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
                    ClearSelection();
                    _Bind_Control();
                }
                if (_objUtility.Is_Grid_CheckAll_Event(grdPartyList, "chkAll"))
                {
                    chkAll_CheckedChanged(grdPartyList.HeaderRow.FindControl("chkAll"), null);
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

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox chkAll = (CheckBox)sender;

                for (int ichk = 0; ichk < grdPartyList.Rows.Count; ichk++)
                {
                    ((CheckBox)grdPartyList.Rows[ichk].FindControl("cbIndividual")).Checked = chkAll.Checked;
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

        protected void lnkbtnAuctionList_Click(object sender, EventArgs e)
        {
            try
            {
                //All Auction -39
                _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, 0, 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, grdData);
                HideShowDiv_Btn(true, false, true, false, "Auction List", false);
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnViewPartyList_Click(object sender, EventArgs e)
        {
            try
            {
                divViewPartyList.Visible = true;
                btnViewPartyList.Visible = false;
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnHidePartyList_Click(object sender, EventArgs e)
        {
            try
            {
                divViewPartyList.Visible = false;
                btnViewPartyList.Visible = true;
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

        private void ClearSelection()
        {
            _TransactionPassword();
            ButtonsEventFunction();
            ButtonVisiblility(true, false);
            AccessForUpdateAndSave();
            AcessOfParty("PageLoad");
            txtAuctionName.Text = "";
            txtAuctionName.Focus();
            if (ddlAuctionType.Items.Count > 0)
            {
                ddlAuctionType.SelectedIndex = 0;
            }
            if (ddlBusinessUnit.Items.Count > 0)
            {
                ddlBusinessUnit.SelectedIndex = 0;
            }
            if (ddlPrimaryCurrency.Items.Count > 0)
            {
                ddlPrimaryCurrency.SelectedIndex = 0;
            }
            if (ddlParty.Items.Count > 0)
            {
                ddlParty.SelectedIndex = 0;
            }
            txtCompanyName.Text = "";
            txtCompanyCode.Text = "";
            txtCompanyName.Enabled = false;
            txtCompanyCode.Enabled = false;

            rbSelectBusinessUnitDropdown.Checked = true;
            ddlBusinessUnit.Enabled = true;
            txtBusinessUnit.Text = "";
            rfvtxtBusinessUnit.ValidationGroup = "savexyz";
            txtBusinessUnit.Enabled = false;
            txtDescription.Text = "";
            RadAuctionStartDateTime.SelectedDate = null;
            RadAuctionCloseDateTime.SelectedDate = null;
            txtExtendAuctionTime.Text = "";
            if (ddlExtendAuctionTimeIfNew.Items.Count > 0)
            {
                ddlExtendAuctionTimeIfNew.SelectedIndex = 0;
            }
            if (ddlBidInformationShownToParticipate.Items.Count > 0)
            {
                ddlBidInformationShownToParticipate.SelectedIndex = 0;
            }
            if (ddlAddNewParty.Items.Count > 0)
            {
                ddlAddNewParty.SelectedIndex = 0;
            }
            txtGracePeriodMin.Text = "";
            txtCMD.Text = "0";
            txtCMD.Enabled = false;
            ClearItemDetailsControl();
            DivActionRemark.Visible = false;
            rfv_Action_Remarks.ValidationGroup = "none";
            rfv_Action_Remarks.Visible = false;

            DataTable dt = new DataTable();
            grdItemData.DataSource = dt;
            grdItemData.DataBind();
            grdPartyOnlyDisp.DataSource = dt;
            grdPartyOnlyDisp.DataBind();
            divAddNewParty.Visible = false;
            divRemoveParty.Visible = false;
            divViewPartyList.Visible = false;
            HideShowDiv_Btn(false, true, false, true, "Create Auction", true);
            SESSION_TBLFRMAUC_AUCTION_ITEM_LINK = null;
            SESSION_TBLFRMAUC_AUCTION_PARTY_LINK = null;
            hdfAuctionStatusId.Value = "0";
            hdfId.Value = "0";
            spanAddViewItem.InnerText = "Add Item";
            divAddNewParty.Visible = false;
            divRemoveParty.Visible = false;
            AuctionType(false, false, false, false);
        }

        private void AuctionType(bool CustomerCheckbox, bool SupplierCheckbox, bool ServicesCheckbox, bool ViewPartyList)
        {
            cbSendInvitiationToAllCustomer.Enabled = CustomerCheckbox;
            cbSendInvitiationToAllSupplier.Enabled = SupplierCheckbox;
            cbSendInvitiationToAllServicesCustomer.Enabled = ServicesCheckbox;
            btnViewPartyList.Enabled = ViewPartyList;
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

        private void HideShowDiv_Btn(bool List, bool CreateAuction, bool btnAuctionCreate, bool btnList, string HeaderSpan, bool buttonRemark)
        {
            divAuctionList.Visible = List;
            divCreateAuction.Visible = CreateAuction;
            lnkbtnCreateAuction.Visible = btnAuctionCreate;
            lnkbtnAuctionList.Visible = btnList;
            spanHeader.InnerText = HeaderSpan;
            if (spanHeader.InnerText == "Create Auction")
            {
                hrefCreateAuction.HRef = "CreateAuction.aspx";
            }
            else
            {
                hrefCreateAuction.HRef = "#";
            }
            divbuttonRemark.Visible = buttonRemark;
        }

        private void _Bind_Control()
        {
            _objMasterCollection.FillAnyListFromEnum(ddlAuctionType, EnumCollection.EnumType.Auction_Type, 1, true, 0, true);
            _objMasterCollection.FillAnyListFromEnum(ddlExtendAuctionTimeIfNew, EnumCollection.EnumType.Extend_Auction, 1, true, 0, true);
            _objMasterCollection.FillAnyListFromEnum(ddlBidInformationShownToParticipate, EnumCollection.EnumType.Bid_Info_Shown_To_Participant, 1, true, 0, true);
            _objMasterCollection.BindCurrency(0, 1, ddlPrimaryCurrency, false);
            _objMasterCollection.BindUnit(0, 1, ddlUnit, true);
            _objMasterCollection.BindFirmList(0, EnumCollection.SearchRecord.MAIN_DATA, 1, ddlFirm, false); //Hide from User

            if (_objCustomAppSetting.Client == (_objManageUserSession.GetCurrentUser_Role_Id))
            {
                _objMasterCollection.BindParty(_objManageUserSession.GetCurrentUser_Firm_Id, _objManageUserSession.GetCurrentLogin_Primary_Id, "4", 0, 0, 1, "", EnumCollection.SearchRecord.MAIN_DATA, ddlParty, false);
                ddlParty_SelectedIndexChanged(null, null);
            }
            else
            {
                _objMasterCollection.BindParty(_objManageUserSession.GetCurrentUser_Firm_Id, 0, "4", 0, 0, 1, "", EnumCollection.SearchRecord.MAIN_DATA, ddlParty, true);
            }
        }

        private void PartyList(string CallFrom)
        {
            DataSet dsParty = _objMasterCollection.BindParty(_objManageUserSession.GetCurrentUser_Firm_Id, 0, "5,6", 0, 0, 1, "", EnumCollection.SearchRecord.MAIN_DATA, false, false);

            DataTable dtParty = dsParty.Tables[0];

            //All Auction -39
            DataSet dsAuctionLinkParty = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);

            DataTable dtDBAuctionLinkParty = dsAuctionLinkParty.Tables[2];

            DataTable dtDBAuction = dsAuctionLinkParty.Tables[0];

            DataTable dtCreateParty = SESSION_TBLFRMAUC_AUCTION_PARTY_LINK;

            DataRow[] drInfo = null;

            Int64 Action_Status_Id = Convert.ToInt64(dtDBAuction.Rows[0]["Action_Status_Id"]);

            if (hdfId.Value == "0" || Action_Status_Id == Auction_Ready_For_Review || Action_Status_Id == SavedAsDraftByAdmin)
            {
                divRemoveParty.Visible = false;
                divAddNewParty.Visible = false;
                for (int idoc = 0; idoc < dtParty.Rows.Count; idoc++)
                {
                    DataRow drData = dtCreateParty.NewRow();

                    drData["Row_No"] = idoc;
                    drData["Party_Id"] = dtParty.Rows[idoc]["Party_Id"];
                    drData["Company_Type"] = dtParty.Rows[idoc]["Company_Type"];
                    drData["Party_Company_Name"] = dtParty.Rows[idoc]["Party_Company_Name"];
                    drData["Party_Company_Code"] = dtParty.Rows[idoc]["Party_Company_Code"];

                    drData["Party_Contact_No"] = dtParty.Rows[idoc]["Party_Contact_No"];
                    drData["Party_Contact_Person_Name"] = dtParty.Rows[idoc]["Party_Contact_Person_Name"];

                    drData["Party_Contact_Person_Email_Id"] = dtParty.Rows[idoc]["Party_Contact_Person_Email_Id"];
                    drData["Party_Contact_Person_Mobile_No"] = dtParty.Rows[idoc]["Party_Contact_Person_Mobile_No"];
                    drData["Row_No"] = dtParty.Rows.Count + 1;
                    drData["Status_Id"] = 1;
                    drInfo = dtDBAuctionLinkParty.Select("Party_Id='" + dtParty.Rows[idoc]["Party_Id"] + "'");

                    if (drInfo.Length > 0)
                    {
                        drData["Is_Available"] = true;
                        drData["Auction_Party_Link_Id"] = (Int64)drInfo[0]["Auction_Party_Link_Id"];
                    }
                    else
                    {
                        drData["Is_Available"] = false;
                        drData["Auction_Party_Link_Id"] = 0;
                    }
                    dtCreateParty.Rows.Add(drData);
                }
                grdPartyList.DataSource = dtCreateParty;
                grdPartyList.DataBind();

            }
            else
            {
                #region Party Details 
                divRemoveParty.Visible = true;
                divAddNewParty.Visible = true;
                if (dsAuctionLinkParty.Tables[2] != null && dsAuctionLinkParty.Tables[2].Rows.Count > 0)
                {
                    SESSION_TBLFRMAUC_AUCTION_PARTY_LINK = null;
                    DataTable dtItemsDetails = SESSION_TBLFRMAUC_AUCTION_PARTY_LINK;

                    foreach (DataRow drFrom in dsAuctionLinkParty.Tables[2].Rows)
                    {
                        DataRow drTo = dtItemsDetails.NewRow();

                        if (CallFrom == "Clone")
                        {
                            drTo["Auction_Party_Link_Id"] = 0;
                            drTo["Auction_Id"] = 0;
                        }
                        else
                        {
                            drTo["Auction_Party_Link_Id"] = drFrom["Auction_Party_Link_Id"];
                            drTo["Auction_Id"] = drFrom["Auction_Id"];
                        }

                        drTo["Party_Id"] = drFrom["Party_Id"];
                        drTo["Is_Available"] = drFrom["Is_Available"];
                        drTo["Party_Company_Name"] = drFrom["Party_Company_Name"];
                        drTo["Party_Company_Code"] = drFrom["Party_Company_Code"];

                        drTo["Party_Contact_No"] = drFrom["Party_Contact_No"];
                        drTo["Party_Contact_Person_Name"] = drFrom["Party_Contact_Person_Name"];
                        drTo["Party_Contact_Person_Email_Id"] = drFrom["Party_Contact_Person_Email_Id"];
                        drTo["Party_Contact_Person_Mobile_No"] = drFrom["Party_Contact_Person_Mobile_No"];
                        drTo["Status_Id"] = drFrom["Status_Id"];

                        drTo["Row_No"] = dtItemsDetails.Rows.Count + 1;
                        dtItemsDetails.Rows.Add(drTo);
                    }
                    dtItemsDetails.AcceptChanges();
                    grdPartyList.DataSource = SESSION_TBLFRMAUC_AUCTION_PARTY_LINK;
                    grdPartyList.DataBind();
                }
                #endregion
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

        private void HideButton(bool SaveAsDraft, bool Save, bool ReadyForPublishing, bool Published, bool Reject, bool Active, bool Conducted, bool Settled, bool Discarded)
        {
            btnSaveAsDraft.Visible = SaveAsDraft;
            btnSave.Visible = Save;
            btnReadyforPublishing.Visible = ReadyForPublishing;
            btnPublished.Visible = Published;
            btnReject.Visible = Reject;
            btnActive.Visible = Active;
            btnConducted.Visible = Conducted;
            btnSettled.Visible = Settled;
            btnDiscarded.Visible = Discarded;
        }

        #endregion

        #region Buttons Function
        private void ClientSave(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnSave, action);
        }

        private void ClientSaveAsDraft(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnSaveAsDraft, action);
        }

        private void ClientReadyForPublishing(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnReadyforPublishing, action);
        }
        private void ClientPublished(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnPublished, action);
        }
        private void ClientReject(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnReject, action);
        }
        private void ClientActive(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnActive, action);
        }
        private void ClientConducted(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnConducted, action);
        }
        private void ClientSettled(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnSettled, action);
        }
        private void ClientDiscarded(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnDiscarded, action);
        }
        private void ClientClear(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnClear, action);
        }

        private void ButtonsEventFunction()
        {
            ClientSave("Save");
            ClientClear("Clear");
            ClientSaveAsDraft("Save As Draft");
            ClientReadyForPublishing("Ready For Publishing");
            ClientPublished("Publish");
            ClientReject("Reject");
            ClientActive("Active");
            ClientConducted("Conducted");
            ClientSettled("Settled");
            ClientDiscarded("Discarded");
        }
        #endregion

        #region Auction Button Div Hide & Show

        private void ButtonVisibility()
        {

            HideButton(false, false, false, false, false, false, false, false, false);

            //All Auction -39
            DataSet ds = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0 && dt.Rows.Count != 0)
                {
                    Int64 Action_Status_Id = Convert.ToInt64(dt.Rows[0]["Action_Status_Id"]);

                    if (Action_Status_Id == SavedAsDraftByAdmin || Action_Status_Id == SavedAsDraftByClient) //Save As Draft
                    {
                        btnSaveAsDraft.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Saved, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                        btnSave.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Saved, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                    }
                    else if (Action_Status_Id == Auction_Ready_For_Review) //Ready For Review
                    {
                        btnReadyforPublishing.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Ready_For_Review, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                    }
                    else if (Action_Status_Id == Auction_Ready_For_Publishing)//Ready For Publishing
                    {
                        btnPublished.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Published, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                        btnReject.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Reject, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                    }
                    else if (Action_Status_Id == Auction_Publish)// Publish
                    {
                        btnActive.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Active, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                        btnDiscarded.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Discarded, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                    }
                    else if (Action_Status_Id == Auction_Active)// Active
                    {
                        btnConducted.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Conducted, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                        btnSettled.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Settled, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                        btnDiscarded.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Discarded, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                    }
                    else if (Action_Status_Id == Auction_Return_For_Review)//Return For Review
                    {
                        btnReadyforPublishing.Visible = _objCustomAppSetting.Auction_Flow(EnumCollection.AuctionFlow.Ready_For_Review, Convert.ToString(_objManageUserSession.GetCurrentUser_Role_Id));
                    }
                }
            }
        }

        private void AccessForUpdateAndSave()
        {

            if (_objCustomAppSetting.Admin == (_objManageUserSession.GetCurrentUser_Role_Id))
            {
                grdData.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdData, "View")].Visible = true;
                grdData.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdData, "Edit")].Visible = true;
                grdData.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdData, "Clone")].Visible = true;
                btnSave.Visible = true;
                btnSaveAsDraft.Visible = true;
                btnClear.Visible = true;
            }
            else if (_objCustomAppSetting.Publisher == (_objManageUserSession.GetCurrentUser_Role_Id))
            {
                grdData.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdData, "View")].Visible = true;
                grdData.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdData, "Edit")].Visible = true;
                grdData.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdData, "Clone")].Visible = false;
                btnSave.Visible = false;
                btnSaveAsDraft.Visible = false;
                btnClear.Visible = false;
            }
        }

        private void AcessOfParty(string CallFrom)
        {
            if (CallFrom == "PageLoad")
            {
                if (_objCustomAppSetting.Client == (_objManageUserSession.GetCurrentUser_Role_Id))
                {
                    DivPartyList.Visible = false;
                    divSendInvitation.Visible = false;
                }
                else
                {
                    DivPartyList.Visible = true;
                    divSendInvitation.Visible = true;
                }
            }
            else if (CallFrom == "View")
            {
                DivPartyList.Visible = true;
                divAddNewParty.Visible = false;
                divRemoveParty.Visible = false;
            }
        }

        #endregion

        #region Session

        private DataTable SESSION_TBLFRMAUC_AUCTION_ITEM_LINK
        {
            get
            {
                if (Session[this.Page.ToString() + "AUCTION_ITEM_LINK"] == null)
                {
                    DataTable dtColumn = new DataTable();
                    dtColumn.Columns.Add("Auction_Item_Link_Id", typeof(Int64));
                    dtColumn.Columns.Add("Auction_Id", typeof(Int64));
                    dtColumn.Columns.Add("Item_Category_Id", typeof(Int64));
                    dtColumn.Columns.Add("Item_Category_Name");
                    dtColumn.Columns.Add("Item_Sub_Category_Id", typeof(Int64));
                    dtColumn.Columns.Add("Item_Sub_Category_Name");

                    dtColumn.Columns.Add("Item_Code");
                    dtColumn.Columns.Add("Item_Name");
                    dtColumn.Columns.Add("Item_Desc");
                    dtColumn.Columns.Add("Quantity", typeof(decimal));
                    dtColumn.Columns.Add("Unit_Id", typeof(Int64));
                    dtColumn.Columns.Add("Unit_Name");

                    dtColumn.Columns.Add("Reserve_Price", typeof(decimal));
                    dtColumn.Columns.Add("Applicable_Tax_In_Percentage", typeof(decimal));
                    dtColumn.Columns.Add("Start_Price", typeof(decimal));
                    dtColumn.Columns.Add("Minimum_Bid_Change", typeof(decimal));
                    dtColumn.Columns.Add("Bid_Cushion_Limit", typeof(decimal));
                    dtColumn.Columns.Add("CMD", typeof(decimal));
                    dtColumn.Columns.Add("Attachment_File_Path1");
                    dtColumn.Columns.Add("Attachment_File_Path2");
                    dtColumn.Columns.Add("Attachment_File_Path3");

                    dtColumn.Columns.Add("Status_Id", typeof(Int64));
                    dtColumn.Columns.Add("Remarks");
                    dtColumn.Columns.Add("Row_No", typeof(Int64));
                    Session[this.Page.ToString() + "AUCTION_ITEM_LINK"] = dtColumn;
                    return dtColumn;
                }
                else
                {
                    return (DataTable)Session[this.Page.ToString() + "AUCTION_ITEM_LINK"];
                }
            }
            set
            {
                Session[this.Page.ToString() + "AUCTION_ITEM_LINK"] = value;
            }

        }

        private DataTable SESSION_TBLFRMAUC_AUCTION_PARTY_LINK
        {
            get
            {
                if (Session[this.Page.ToString() + "AUCTION_PARTY_LINK"] == null)
                {
                    DataTable dtColumn = new DataTable();
                    dtColumn.Columns.Add("Auction_Party_Link_Id", typeof(Int64));
                    dtColumn.Columns.Add("Auction_Id", typeof(Int64));
                    dtColumn.Columns.Add("Party_Id", typeof(Int64));
                    dtColumn.Columns.Add("Status_Id", typeof(Int64));
                    dtColumn.Columns.Add("Remarks");
                    dtColumn.Columns.Add("Row_No", typeof(Int64));
                    dtColumn.Columns.Add("Is_Accept_Auction", typeof(bool));
                    dtColumn.Columns.Add("Accept_Remarks");

                    dtColumn.Columns.Add("Is_Available", typeof(bool));
                    dtColumn.Columns.Add("Company_Type");
                    dtColumn.Columns.Add("Party_Company_Name");
                    dtColumn.Columns.Add("Party_Company_Code");
                    dtColumn.Columns.Add("Party_Contact_No");
                    dtColumn.Columns.Add("Party_Contact_Person_Name");
                    dtColumn.Columns.Add("Party_Contact_Person_Email_Id");
                    dtColumn.Columns.Add("Party_Contact_Person_Mobile_No");
                    Session[this.Page.ToString() + "AUCTION_PARTY_LINK"] = dtColumn;
                    return dtColumn;
                }
                else
                {
                    return (DataTable)Session[this.Page.ToString() + "AUCTION_PARTY_LINK"];
                }
            }
            set
            {
                Session[this.Page.ToString() + "AUCTION_PARTY_LINK"] = value;
            }

        }

        #endregion

        #region Button Operation Save ,Ready For Review Etc.. Events And Function

        private void SaveData(object sender, Int64 AuctionStatusId, string CallFrom)
        {
            if (CallFrom != "SaveAsDraft")
            {
                Validation();
                if (Validation() == false)
                {
                    return;
                }
            }

            #region UT_TBLMST_EMPLOYEE_FIRM_LINK

            DataTable DT_TBLFRMAUC_AUCTION_ITEM_LINK = _objMasterCollection.UT_TBLFRMAUC_AUCTION_ITEM_LINK;

            for (int ichk = 0; ichk < grdItemData.Rows.Count; ichk++)
            {
                GridViewRow grdRow = grdItemData.Rows[ichk];
                DataRow dr = DT_TBLFRMAUC_AUCTION_ITEM_LINK.NewRow();
                dr["Auction_Item_Link_Id"] = ((HiddenField)grdRow.FindControl("hdfAuctionItemLinkId")).Value;
                dr["Auction_Id"] = ((HiddenField)grdRow.FindControl("hdfAuctionId")).Value;
                dr["Item_Category_Id"] = ((HiddenField)grdRow.FindControl("hdfItemCategoryId")).Value;
                dr["Item_Sub_Category_Id"] = ((HiddenField)grdRow.FindControl("hdfItemSubCategoryId")).Value;
                dr["Item_Code"] = ((Label)grdRow.FindControl("lblItemCode")).Text;
                dr["Item_Name"] = ((Label)grdRow.FindControl("lblItemName")).Text;
                dr["Item_Desc"] = ((Label)grdRow.FindControl("lblItemDescription")).Text;
                dr["Quantity"] = ((Label)grdRow.FindControl("lblQuantity")).Text;
                dr["Unit_Id"] = ((HiddenField)grdRow.FindControl("hdfItemUnitId")).Value;
                dr["Reserve_Price"] = ((Label)grdRow.FindControl("lblReservePrice")).Text;
                dr["Applicable_Tax_In_Percentage"] = ((Label)grdRow.FindControl("lblApplicableTaxInPercentage")).Text;
                dr["Start_Price"] = ((Label)grdRow.FindControl("lblStartPrice")).Text;
                dr["Minimum_Bid_Change"] = ((Label)grdRow.FindControl("lblMinimumBidChange")).Text;
                dr["Bid_Cushion_Limit"] = ((Label)grdRow.FindControl("lblBidCushionLimit")).Text;
                dr["CMD"] = ((Label)grdRow.FindControl("lblCMD")).Text;
                dr["Attachment_File_Path1"] = ((HiddenField)grdRow.FindControl("hdfAttachmentFilePath1")).Value;
                dr["Attachment_File_Path2"] = ((HiddenField)grdRow.FindControl("hdfAttachmentFilePath2")).Value;
                dr["Attachment_File_Path3"] = ((HiddenField)grdRow.FindControl("hdfAttachmentFilePath3")).Value;
                dr["Status_Id"] = 1;
                dr["Remarks"] = DBNull.Value;
                dr["Row_No"] = GetNextRowNo(DT_TBLFRMAUC_AUCTION_ITEM_LINK);
                DT_TBLFRMAUC_AUCTION_ITEM_LINK.Rows.Add(dr);
            }
            #endregion

            #region UT_TBLFRMAUC_AUCTION_PARTY_LINK
            DataTable dtAuctionPartyLink = _objMasterCollection.UT_TBLFRMAUC_AUCTION_PARTY_LINK;

            for (int ichk = 0; ichk < grdPartyList.Rows.Count; ichk++)
            {
                GridViewRow grdRow = grdPartyList.Rows[ichk];

                DataRow drData = dtAuctionPartyLink.NewRow();
                drData["Auction_Party_Link_Id"] = ((HiddenField)grdRow.FindControl("hdfAuctionPartyLinkId")).Value;
                drData["Auction_Id"] = hdfId.Value;
                drData["Party_Id"] = ((HiddenField)grdRow.FindControl("hdfPartyId")).Value;
                drData["Status_Id"] = 1;
                drData["Remarks"] = DBNull.Value;
                drData["Row_No"] = dtAuctionPartyLink.Rows.Count + 1;
                drData["Is_Accept_Auction"] = false;
                drData["Accept_Remarks"] = DBNull.Value;
                dtAuctionPartyLink.Rows.Add(drData);

            }

            #endregion

            if (CallFrom != "SaveAsDraft")
            {
                if (DT_TBLFRMAUC_AUCTION_ITEM_LINK == null || DT_TBLFRMAUC_AUCTION_ITEM_LINK.Rows.Count == 0)
                {
                    _objMessage.ShowMessage(null, null, 25, " At Least One Item");
                    btnAddItemPopup_Click(null, null);
                    return;
                }
                if (_objCustomAppSetting.Client != (_objManageUserSession.GetCurrentUser_Role_Id))
                {
                    if (dtAuctionPartyLink == null || dtAuctionPartyLink.Rows.Count == 0)
                    {
                        _objMessage.ShowMessage(null, null, 13, " Party");
                        return;
                    }
                }
            }

            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Id", Value = hdfId.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = ddlFirm.SelectedValue.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Type_Enum_Id", Value = ddlAuctionType.SelectedValue.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Name", Value = txtAuctionName.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Code", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Currency_Id", Value = ddlPrimaryCurrency.SelectedValue.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Id", Value = ddlParty.SelectedValue.Trim() });

            if (rbSelectBusinessUnitDropdown.Checked == true)
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Business_Unit_Id", Value = ddlBusinessUnit.SelectedValue.Trim() });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Business_Unit_Id", Value = DBNull.Value });
            }

            if (rbSelectBusinessUnitTextbox.Checked == true)
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Business_Unit", Value = txtBusinessUnit.Text.Trim() });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Business_Unit", Value = DBNull.Value });
            }
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Description", Value = txtDescription.Text.Trim() });

            if (CallFrom == "SaveAsDraft")
            {
                if (_objUtility.ValidateDBNullEmptyValue(RadAuctionStartDateTime.SelectedDate))
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Open_Date_Time", Value = DBNull.Value });
                }
                else
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Open_Date_Time", Value = RadAuctionStartDateTime.SelectedDate });

                }
                if (_objUtility.ValidateDBNullEmptyValue(RadAuctionCloseDateTime.SelectedDate))
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Close_Date_Time", Value = DBNull.Value });
                }
                else
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "Close_Date_Time", Value = RadAuctionCloseDateTime.SelectedDate.Value });
                }
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Open_Date_Time", Value = RadAuctionStartDateTime.SelectedDate.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Close_Date_Time", Value = RadAuctionCloseDateTime.SelectedDate.Value });
            }
            lstDBMapParam.Add(new DBMapParam() { Name = "Extend_Auction_In_Minutes", Value = txtExtendAuctionTime.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Extend_Auction_Enum_Type_Id", Value = ddlExtendAuctionTimeIfNew.SelectedValue.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Grace_Period_In_Minutes", Value = txtGracePeriodMin.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Bid_Info_Shown_To_Participant_Enum_Id", Value = ddlBidInformationShownToParticipate.SelectedValue });

            if (hdfCatalogImagePath.Value != "~/Images/camera.jpg" && hdfCatalogImagePath.Value.Contains("/dist"))
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Upload_Catalogue_File_Path", Value = hdfAttachmentImagePath.Value });
            }
            else if (_objUtility.ValidateDBNullEmptyValue(hdfCatalogImagePath.Value) || hdfCatalogImagePath.Value == "0")
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Upload_Catalogue_File_Path", Value = DBNull.Value });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Upload_Catalogue_File_Path", Value = _objFileSystem.MoveToServer(hdfCatalogImagePath.Value, 0) });
            }

            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Item", Value = DT_TBLFRMAUC_AUCTION_ITEM_LINK });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Party", Value = dtAuctionPartyLink });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_Status_Id", Value = AuctionStatusId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_User_Role_Id", Value = _objManageUserSession.GetCurrentUser_Role_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = txt_Remarks.Text });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = txt_Action_Remarks.Text.Trim() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
            lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });
            if (hdfId.Value == "0")
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = "INSERT" });

            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = "UPDATE" });
            }

            lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });
            Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Auction", lstDBMapParam);
            if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
            {
                if (hdfId.Value == "0")
                {
                    _objMessage.ShowMessageWithURL(5, _objUtility.GetCurrentURL, "Saved");
                }
                else
                {
                    if (SendMail == true)
                    {
                        #region Send Email To Supplier/Customers

                        DataSet ds = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);
                        if (ds != null && ds.Tables[2].Rows.Count > 0 && ds.Tables[0].Rows.Count > 0)
                        {
                            string[] attachment = null;
                            List<string> emailIds = new List<string>();
                            List<string> lstattachment = new List<string>();

                            DataTable dtParty = ds.Tables[2];
                            DataTable dtAuc = ds.Tables[0];
                            DataTable dtItem = ds.Tables[1];
                            if (dtParty.Rows.Count > 0 && dtParty.Rows.Count != 0)
                            {
                                for (int i = 0; i < dtItem.Rows.Count; i++)
                                {
                                    if (_objUtility.ValidateDBNullEmptyValue(dtItem.Rows[i]["Attachment_File_Path1"]) == false)
                                    {
                                        lstattachment.Add(Convert.ToString(dtItem.Rows[i]["Attachment_File_Path1"]));
                                    }
                                    if (_objUtility.ValidateDBNullEmptyValue(dtItem.Rows[i]["Attachment_File_Path2"]) == false)
                                    {
                                        lstattachment.Add(Convert.ToString(dtItem.Rows[i]["Attachment_File_Path2"]));
                                    }
                                    if (_objUtility.ValidateDBNullEmptyValue(dtItem.Rows[i]["Attachment_File_Path3"]) == false)
                                    {
                                        lstattachment.Add(Convert.ToString(dtItem.Rows[i]["Attachment_File_Path3"]));
                                    }
                                }
                                if (lstattachment.Count() > 0)
                                {
                                    attachment = lstattachment.ToArray();
                                }
                                for (int i = 0; i < dtParty.Rows.Count; i++)
                                {
                                    emailIds.Clear();
                                    if (_objUtility.IsValidEmail(Convert.ToString(dtParty.Rows[i]["Party_Contact_Person_Email_Id"]), true))
                                    {
                                        emailIds.Add(Convert.ToString(dtParty.Rows[i]["Party_Contact_Person_Email_Id"]));
                                    }

                                    #region Emails 
                                    if (emailIds.Count() > 0)
                                    {
                                        string ulOpen = "<ul>";
                                        string ulClose = "</ul>";
                                        string liOpen = "<li>";
                                        string liClose = "</li>";

                                        string Mess = "<p>Dear Sir/Madam, </p> You have been invited to participate in the Auction event for Reliance Industries Limited as per following details, <br/>";
                                        string AuctionName = liOpen + "Auction Name : " + dtAuc.Rows[0]["Auction_Name"].ToString() + liClose;
                                        string AuctionType = liOpen + "Auction Type : " + dtAuc.Rows[0]["Auction_Type"].ToString() + liClose;
                                        string ClientName = liOpen + "Client Name : " + ddlParty.SelectedItem.Text + liClose;

                                        string AuctionDescription = liOpen + "Auction Description : " + dtAuc.Rows[0]["Auction_Description"].ToString() + liClose;

                                        string Business_Unit;

                                        string BUTxt = liOpen + "Business Unit : " + dtAuc.Rows[0]["Business_Unit"].ToString() + liClose;
                                        string BUddl = liOpen + "Business Unit : " + dtAuc.Rows[0]["Business_Unit_Name"].ToString() + liClose;

                                        if (_objUtility.ValidateDBNullEmptyValue(dtAuc.Rows[0]["Business_Unit"]) == false)
                                        {
                                            Business_Unit = BUTxt;
                                        }
                                        else
                                        {
                                            Business_Unit = BUddl;
                                        }
                                        string Open_Date_Time = liOpen + "Auction Start Date & Time : " + dtAuc.Rows[0]["Open_Date_Time"].ToString() + liClose;
                                        string Close_Date_Time = liOpen + "Auction End Date & Time : " + dtAuc.Rows[0]["Close_Date_Time"].ToString() + liClose;

                                        string LoginLink = "Login Link:- " + "http://crystalstaging.kalansh.com/" + "<br/><br/>";
                                        string LoginDesc = "Kindly login using this e-mail ID on the above link, preferably using Google Chrome.If your using E-Auction for the first time, kindly generate your password using ‘Forgot Password’ on the login screen." + "<br/><br/>";

                                        string Query = "For any queries related to Auction, feel free to contact Auction Author " + ulOpen + liOpen + "P&C Buyer :- HARSHAVARDHAN VYAS" + liClose + liOpen + "Buyer Email Id:- harshavardhan.vyas@ril.com" + liClose + liOpen + "Buyer contact no :-+91-9867614724" + liClose + ulClose;
                                        string Note = "<b>Note :</b>" + ulOpen + liOpen + "All rights ( Pre & Post E-bid) reserved with Reliance, Reliance is not bound for placement of order on Bid Winner at the Bid Winners E-bid price ( further negotiation may be done if the Reliance budgeted target price shall be not achieved)." + liClose + liOpen + "If the auction invitation is already accepted from your side , kindly reaccept it." + liClose + liOpen + "If the auction invitation is not yet accepted or declined from your side, kindly accept or decline it." + liClose + ulClose;

                                        string doNotReply = "This is system generated e-mail. Please do not reply." + "<br/><br/>";
                                        string ConfidentialityWarning = "<b><u>Confidentiality Warning : <u></b>This message and any attachments are intended only for the use of the intended recipient(s), are confidential and may be privileged. If you are not the intended recipient, you are hereby notified that any review, re-transmission, conversion to hard copy, copying, circulation or other use of this message and any attachments is strictly prohibited. If you are not the intended recipient, please notify the sender immediately by return email and delete this message and any attachments from your system." + "<br/><br/>";
                                        string VirusWarning = "<b><u>Virus Warning</u></b> : Although the company has taken reasonable precautions to ensure no viruses are present in this email. The company cannot accept responsibility for any loss or damage arising from the use of this email or attachment.";

                                        string mailBody = Mess + AuctionName + AuctionType+ ClientName + AuctionDescription + Business_Unit + Open_Date_Time + Close_Date_Time + LoginLink + LoginDesc + Query + Note + doNotReply + ConfidentialityWarning + VirusWarning;
                                        string mailSubject = "Invitation for auction";

                                        new Notification().SendMail(emailIds.ToArray(), mailSubject, mailBody, false, null, null, "", true, attachment);

                                    }
                                    #endregion

                                }
                            }
                        }
                        #endregion
                    }
                    _objMessage.ShowMessageWithURL(27, _objUtility.GetCurrentURL, "Action Done");
                }
            }
            else
            {
                if (Convert.ToString(dictResult["OutputMessage"]).Contains("Auction Name"))
                {
                    _objMessage.ShowMessage(btnSave, txtAuctionName, 7, dictResult["OutputMessage"]);
                    return;
                }
            }
        }

        protected void btnSaveAsDraft_Click(object sender, EventArgs e)
        {
            try
            {
                if (_objCustomAppSetting.Admin == (_objManageUserSession.GetCurrentUser_Role_Id))
                {
                    SaveData(sender, SavedAsDraftByAdmin, "SaveAsDraft");
                }
                else if (_objCustomAppSetting.Client == (_objManageUserSession.GetCurrentUser_Role_Id))
                {
                    SaveData(sender, SavedAsDraftByClient, "SaveAsDraft");
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (hdfId.Value == "0")
                {
                    if (_objCustomAppSetting.Admin == (_objManageUserSession.GetCurrentUser_Role_Id))
                    {
                        SaveData(sender, Auction_Ready_For_Publishing, "Save");
                    }
                    else if (_objCustomAppSetting.Client == (_objManageUserSession.GetCurrentUser_Role_Id))
                    {
                        SaveData(sender, Auction_Ready_For_Review, "Save");
                    }
                }
                else
                {
                    if (Convert.ToInt64(hdfAuctionStatusId.Value) == SavedAsDraftByAdmin || Convert.ToInt64(hdfAuctionStatusId.Value) == SavedAsDraftByClient && btnSave.Text.Contains("Save"))
                    {
                        if (_objCustomAppSetting.Admin == (_objManageUserSession.GetCurrentUser_Role_Id))
                        {
                            SaveData(sender, Auction_Ready_For_Publishing, "Save");
                        }
                        else if (_objCustomAppSetting.Client == (_objManageUserSession.GetCurrentUser_Role_Id))
                        {
                            SaveData(sender, Auction_Ready_For_Review, "Save");
                        }
                    }
                    else
                    {
                        SaveData(sender, Convert.ToInt64(hdfAuctionStatusId.Value), "Update");
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

        protected void btnReadyforPublishing_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData(sender, Auction_Ready_For_Publishing, "ReadyforPublishing");
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnPublished_Click(object sender, EventArgs e)
        {
            try
            {
                SendMail = true;
                SaveData(sender, Auction_Publish, "Published");

            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData(sender, Auction_Return_For_Review, "Reject");

            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnActive_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData(sender, Auction_Active, "Active");
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnConducted_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData(sender, Auction_Conducted, "Conducted");
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnSettled_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData(sender, Auction_Settled, "Settled");
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnDiscarded_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData(sender, Auction_Discarded, "Discarded");
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

        protected void btnRemoveParty_Click(object sender, EventArgs e)
        {
            try
            {

                DataTable dtAuctionPartyLink = SESSION_TBLFRMAUC_AUCTION_PARTY_LINK;

                for (int i = grdPartyList.Rows.Count - 1; i >= 0; i--)
                {
                    DataRow dr = dtAuctionPartyLink.Rows[i];
                    GridViewRow grdRow = grdPartyList.Rows[i];

                    if (((CheckBox)grdRow.FindControl("cbIndividual")).Checked == true)
                    {
                        dr.Delete();
                    }
                }
                dtAuctionPartyLink.AcceptChanges();
                grdPartyList.DataSource = dtAuctionPartyLink;
                grdPartyList.DataBind();

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

        #region Attachment Catalog

        private void CatalogImageHide()
        {
            fuCatalogUploadImage.Visible = true;
            PreviewImageCatalog.Visible = true;
            lnkbtnCatalogRemoveImage.Visible = false;
            hdfCatalogImagePath.Value = "";
            divCatalog.Visible = false;
            ImgbtnCatalogPreview.Visible = false;
            ImgbtnCatalogPreview.ImageUrl = "";
        }

        private void CatalogImageShow(string path)
        {
            ImgbtnCatalogPreview.Visible = true;
            hdfCatalogImagePath.Value = path;
            // fuAttachmentUploadImage.SaveAs(Server.MapPath(hdfAttachmentImagePath.Value));
            string FileExtension = Path.GetExtension(hdfCatalogImagePath.Value);
            if (FileExtension == ".pdf")
            {
                ImgbtnCatalogPreview.ImageUrl = pdfImagePath;
            }
            else
            {
                ImgbtnCatalogPreview.ImageUrl = hdfCatalogImagePath.Value;
            }
            lnkbtnCatalogRemoveImage.Visible = true;
            divCatalog.Visible = true;
            PreviewImageCatalog.Visible = false;
        }

        protected void ImgbtnCatalogPreview_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                IframePDF.Src = "";
                lblGDocumentName.Text = "Catalog";
                string FileExtension = Path.GetExtension(hdfCatalogImagePath.Value);

                if (FileExtension == ".pdf")
                {
                    divpdfPreview.Visible = true;
                    divIamgePreview.Visible = false;
                    IframePDF.Src = hdfCatalogImagePath.Value;
                }
                else
                {
                    divpdfPreview.Visible = false;
                    divIamgePreview.Visible = true;
                    itemImgFullView.ImageUrl = hdfCatalogImagePath.Value;
                }
                PopupVisiblity(true, false);
                mpeForGDocuments.Show();
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void lnkbtnCatalogRemoveImage_Click(object sender, EventArgs e)
        {
            try
            {
                CatalogImageHide();
                fuCatalogUploadImage.Focus();
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnCatalogImage_Click(object sender, EventArgs e)
        {
            try
            {
                if (fuCatalogUploadImage.HasFile)
                {
                    List<string> filepath = _objFileSystem.Upload_Temp_File(fuCatalogUploadImage, DocumentExtension.ImageDocument);
                    if (filepath == null)
                    {
                        fuCatalogUploadImage.Focus();
                        return;
                    }

                    CatalogImageShow(filepath[0]);
                    lnkbtnCatalogRemoveImage.Focus();
                }
                else
                {
                    CatalogImageHide();
                    fuCatalogUploadImage.Focus();
                }
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }


        #endregion

        #region Items Attahment

        protected void lnkbtnAttachmentRemoveImage_Click(object sender, EventArgs e)
        {
            try
            {
                AttachmentImageHide();
                fuAttachmentUploadImage.Focus();
                btnAddItemPopup_Click(null, null);
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnAttachmentImage_Click(object sender, EventArgs e)
        {
            try
            {
                if (fuAttachmentUploadImage.HasFile)
                {
                    List<string> filepath = _objFileSystem.Upload_Temp_File(fuAttachmentUploadImage, DocumentExtension.ImageDocument);
                    if (filepath == null)
                    {
                        fuAttachmentUploadImage.Focus();
                        return;
                    }

                    AttachmentImageShow(filepath[0]);
                    lnkbtnAttachmentRemoveImage.Focus();
                }
                else
                {
                    AttachmentImageHide();
                    fuAttachmentUploadImage.Focus();
                }
                btnAddItemPopup_Click(null, null);
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void lnkbtnAttachment2RemoveImage_Click(object sender, EventArgs e)
        {
            try
            {
                Attachment2ImageHide();
                fuAttachment2UploadImage.Focus();
                btnAddItemPopup_Click(null, null);
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnAttachment2Image_Click(object sender, EventArgs e)
        {
            try
            {
                if (fuAttachment2UploadImage.HasFile)
                {
                    List<string> filepath = _objFileSystem.Upload_Temp_File(fuAttachment2UploadImage, DocumentExtension.ImageDocument);
                    if (filepath == null)
                    {
                        fuAttachment2UploadImage.Focus();
                        return;
                    }
                    Attachment2ImageShow(filepath[0]);
                    lnkbtnAttachment2RemoveImage.Focus();
                }
                else
                {
                    Attachment2ImageHide();
                    fuAttachment2UploadImage.Focus();
                }
                btnAddItemPopup_Click(null, null);
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void lnkbtnAttachment3RemoveImage_Click(object sender, EventArgs e)
        {
            try
            {
                Attachment3ImageHide();
                fuAttachment3UploadImage.Focus();
                btnAddItemPopup_Click(null, null);
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnAttachment3Image_Click(object sender, EventArgs e)
        {
            try
            {
                if (fuAttachment3UploadImage.HasFile)
                {
                    List<string> filepath = _objFileSystem.Upload_Temp_File(fuAttachment3UploadImage, DocumentExtension.ImageDocument);
                    if (filepath == null)
                    {
                        fuAttachment3UploadImage.Focus();
                        return;
                    }
                    Attachment3ImageShow(filepath[0]);
                    lnkbtnAttachment3RemoveImage.Focus();
                }
                else
                {
                    Attachment3ImageHide();
                    fuAttachment3UploadImage.Focus();
                }
                btnAddItemPopup_Click(null, null);
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void ImgbtnAttachmentPreview_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                IframePDF.Src = "";
                lblGDocumentName.Text = "Catalog";
                string FileExtension = Path.GetExtension(hdfAttachmentImagePath.Value);

                if (FileExtension == ".pdf")
                {
                    divpdfPreview.Visible = true;
                    divIamgePreview.Visible = false;
                    IframePDF.Src = hdfAttachmentImagePath.Value;
                }
                else
                {
                    divpdfPreview.Visible = false;
                    divIamgePreview.Visible = true;
                    itemImgFullView.ImageUrl = hdfAttachmentImagePath.Value;
                }
                PopupVisiblity(true, false);
                mpeForGDocuments.Show();
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void ImgbtnAttachment2Preview_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                IframePDF.Src = "";
                lblGDocumentName.Text = "Catalog";
                string FileExtension = Path.GetExtension(hdfAttachment2ImagePath.Value);

                if (FileExtension == ".pdf")
                {
                    divpdfPreview.Visible = true;
                    divIamgePreview.Visible = false;
                    IframePDF.Src = hdfAttachment2ImagePath.Value;
                }
                else
                {
                    divpdfPreview.Visible = false;
                    divIamgePreview.Visible = true;
                    itemImgFullView.ImageUrl = hdfAttachment2ImagePath.Value;
                }
                PopupVisiblity(true, false);
                mpeForGDocuments.Show();
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void ImgbtnAttachment3Preview_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                IframePDF.Src = "";
                lblGDocumentName.Text = "Catalog";
                string FileExtension = Path.GetExtension(hdfAttachment3ImagePath.Value);

                if (FileExtension == ".pdf")
                {
                    divpdfPreview.Visible = true;
                    divIamgePreview.Visible = false;
                    IframePDF.Src = hdfAttachment3ImagePath.Value;
                }
                else
                {
                    divpdfPreview.Visible = false;
                    divIamgePreview.Visible = true;
                    itemImgFullView.ImageUrl = hdfAttachment3ImagePath.Value;
                }
                PopupVisiblity(true, false);
                mpeForGDocuments.Show();
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        private void AttachmentImageHide()
        {
            fuAttachmentUploadImage.Visible = true;
            PreviewImageAttachment.Visible = true;
            lnkbtnAttachmentRemoveImage.Visible = false;
            hdfAttachmentImagePath.Value = "";
            divAttachment.Visible = false;
            ImgbtnAttachmentPreview.Visible = false;
            ImgbtnAttachmentPreview.ImageUrl = "";
        }

        private void Attachment2ImageHide()
        {
            fuAttachment2UploadImage.Visible = true;
            PreviewImageAttachment2.Visible = true;
            lnkbtnAttachment2RemoveImage.Visible = false;
            hdfAttachment2ImagePath.Value = "";
            divAttachment2.Visible = false;
            ImgbtnAttachment2Preview.Visible = false;
            ImgbtnAttachment2Preview.ImageUrl = "";
        }

        private void Attachment3ImageHide()
        {
            fuAttachment3UploadImage.Visible = true;
            PreviewImageAttachment3.Visible = true;
            lnkbtnAttachment3RemoveImage.Visible = false;
            hdfAttachment3ImagePath.Value = "";
            divAttachment3.Visible = false;
            ImgbtnAttachment3Preview.Visible = false;
            ImgbtnAttachment3Preview.ImageUrl = "";
        }

        private void AttachmentImageShow(string path)
        {
            ImgbtnAttachmentPreview.Visible = true;
            hdfAttachmentImagePath.Value = path;
            // fuAttachmentUploadImage.SaveAs(Server.MapPath(hdfAttachmentImagePath.Value));
            string FileExtension = Path.GetExtension(hdfAttachmentImagePath.Value);
            if (FileExtension == ".pdf")
            {
                ImgbtnAttachmentPreview.ImageUrl = pdfImagePath;
            }
            else
            {
                ImgbtnAttachmentPreview.ImageUrl = hdfAttachmentImagePath.Value;
            }
            lnkbtnAttachmentRemoveImage.Visible = true;
            divAttachment.Visible = true;
            PreviewImageAttachment.Visible = false;
        }

        private void Attachment2ImageShow(string path)
        {
            ImgbtnAttachment2Preview.Visible = true;
            hdfAttachment2ImagePath.Value = path;
            // fuAttachment2UploadImage.SaveAs(Server.MapPath(hdfAttachment2ImagePath.Value));
            string FileExtension = Path.GetExtension(hdfAttachment2ImagePath.Value);
            if (FileExtension == ".pdf")
            {
                ImgbtnAttachment2Preview.ImageUrl = pdfImagePath;
            }
            else
            {
                ImgbtnAttachment2Preview.ImageUrl = hdfAttachment2ImagePath.Value;
            }
            lnkbtnAttachment2RemoveImage.Visible = true;
            divAttachment2.Visible = true;
            PreviewImageAttachment2.Visible = false;
        }

        private void Attachment3ImageShow(string path)
        {
            ImgbtnAttachment3Preview.Visible = true;
            hdfAttachment3ImagePath.Value = path;
            //fuAttachment3UploadImage.SaveAs(Server.MapPath(hdfAttachment3ImagePath.Value));
            string FileExtension = Path.GetExtension(hdfAttachment3ImagePath.Value);
            if (FileExtension == ".pdf")
            {
                ImgbtnAttachment3Preview.ImageUrl = pdfImagePath;
            }
            else
            {
                ImgbtnAttachment3Preview.ImageUrl = hdfAttachment3ImagePath.Value;
            }
            lnkbtnAttachment3RemoveImage.Visible = true;
            divAttachment3.Visible = true;
            PreviewImageAttachment3.Visible = false;
        }

        #endregion

        #region Grid Events
        private void DispalyDB_Data(Int64 AuctionId, string CallFrom, int rowid)
        {
            //All Auction -39
            DataSet ds = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(AuctionId), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                #region Auction Main Table
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0 && dt.Rows.Count != 0)
                {
                    txtAuctionName.Text = Convert.ToString(dt.Rows[0]["Auction_Name"]);
                    if (ddlAuctionType.Items.FindByValue(Convert.ToString(dt.Rows[0]["Auction_Type_Enum_Id"])) != null)
                    {
                        ddlAuctionType.SelectedValue = Convert.ToString(dt.Rows[0]["Auction_Type_Enum_Id"]);
                    }
                    if (ddlPrimaryCurrency.Items.FindByValue(Convert.ToString(dt.Rows[0]["Currency_Id"])) != null)
                    {
                        ddlPrimaryCurrency.SelectedValue = Convert.ToString(dt.Rows[0]["Currency_Id"]);
                    }
                    if (ddlParty.Items.FindByValue(Convert.ToString(dt.Rows[0]["Party_Id"])) != null)
                    {
                        ddlParty.SelectedValue = Convert.ToString(dt.Rows[0]["Party_Id"]);
                    }
                    ddlParty_SelectedIndexChanged(null, null);
                    if (ddlBusinessUnit.Items.FindByValue(Convert.ToString(dt.Rows[0]["Business_Unit_Id"])) != null)
                    {
                        rbSelectBusinessUnitDropdown_CheckedChanged(null, null);
                        ddlBusinessUnit.SelectedValue = Convert.ToString(dt.Rows[0]["Business_Unit_Id"]);
                    }
                    else
                    {
                        rbSelectBusinessUnitTextbox_CheckedChanged(null, null);
                        txtBusinessUnit.Text = Convert.ToString(dt.Rows[0]["Business_Unit"]);
                    }
                    txtDescription.Text = Convert.ToString(dt.Rows[0]["Auction_Description"]);
                    txtExtendAuctionTime.Text = Convert.ToString(dt.Rows[0]["Extend_Auction_In_Minutes"]);
                    txtGracePeriodMin.Text = Convert.ToString(dt.Rows[0]["Grace_Period_In_Minutes"]);

                    //DateTime
                    string OpenDateTime = Convert.ToString(((Label)grdData.Rows[rowid].FindControl("lblOpenDateTime")).Text);
                    if (!_objUtility.ValidateDBNullEmptyValue(OpenDateTime))
                    {
                        RadAuctionStartDateTime.SelectedDate = _objUtility.Convert_ddMMyyyyhhmmsstt_Into_DateTime(OpenDateTime);
                    }
                    string CloseDateTime = Convert.ToString(((Label)grdData.Rows[rowid].FindControl("lblCloseDateTime")).Text);
                    if (!_objUtility.ValidateDBNullEmptyValue(CloseDateTime))
                    {
                        RadAuctionCloseDateTime.SelectedDate = _objUtility.Convert_ddMMyyyyhhmmsstt_Into_DateTime(CloseDateTime);
                    }
                    //End
                    if (ddlExtendAuctionTimeIfNew.Items.FindByValue(Convert.ToString(dt.Rows[0]["Extend_Auction_Enum_Type_Id"])) != null)
                    {
                        ddlExtendAuctionTimeIfNew.SelectedValue = Convert.ToString(dt.Rows[0]["Extend_Auction_Enum_Type_Id"]);
                    }
                    if (ddlBidInformationShownToParticipate.Items.FindByValue(Convert.ToString(dt.Rows[0]["Bid_Info_Shown_To_Participant_Enum_Id"])) != null)
                    {
                        ddlBidInformationShownToParticipate.SelectedValue = Convert.ToString(dt.Rows[0]["Bid_Info_Shown_To_Participant_Enum_Id"]);
                    }
                }
                //Image
                if (_objUtility.ValidateDBNullEmptyValue(Convert.ToString(dt.Rows[0]["Upload_Catalogue_File_Path"])) == false)
                {
                    CatalogImageShow(Convert.ToString(dt.Rows[0]["Upload_Catalogue_File_Path"]));
                }
                if (Convert.ToInt64(dt.Rows[0]["Action_Status_Id"]) == Auction_Publish)
                {
                    SendMail = true;
                }
                else
                {
                    SendMail = false;
                }

                if (CallFrom == "Edit")
                {
                    if (Convert.ToInt64(hdfAuctionStatusId.Value) == SavedAsDraftByAdmin || Convert.ToInt64(hdfAuctionStatusId.Value) == SavedAsDraftByClient)
                    {
                        ClientSave("Save");
                    }
                    else
                    {
                        btnSave.Visible = true;
                        ClientSave("Update");
                    }
                }
                else if (CallFrom == "Clone")
                {
                    btnSave.Visible = true;
                    btnSaveAsDraft.Visible = true;
                    ClientSave("Auction Clone");
                }
                #endregion

                #region Auction Item Details 
                if (ds.Tables[1] != null && ds.Tables[1].Rows.Count > 0)
                {
                    SESSION_TBLFRMAUC_AUCTION_ITEM_LINK = null;
                    DataTable dtItemsDetails = SESSION_TBLFRMAUC_AUCTION_ITEM_LINK;

                    foreach (DataRow drFrom in ds.Tables[1].Rows)
                    {
                        DataRow drTo = dtItemsDetails.NewRow();

                        if (CallFrom == "Clone")
                        {
                            drTo["Auction_Item_Link_Id"] = 0;
                            drTo["Auction_Id"] = 0;
                        }
                        else
                        {
                            drTo["Auction_Item_Link_Id"] = drFrom["Auction_Item_Link_Id"];
                            drTo["Auction_Id"] = drFrom["Auction_Id"];
                        }
                        drTo["Item_Category_Id"] = drFrom["Item_Category_Id"];
                        drTo["Item_Category_Name"] = drFrom["Item_Category_Name"];
                        drTo["Item_Sub_Category_Id"] = drFrom["Item_Sub_Category_Id"];
                        drTo["Item_Sub_Category_Name"] = drFrom["Item_Sub_Category_Name"];

                        drTo["Item_Code"] = drFrom["Item_Code"];
                        drTo["Item_Name"] = drFrom["Item_Name"];
                        drTo["Item_Desc"] = drFrom["Item_Desc"];
                        drTo["Quantity"] = drFrom["Quantity"];
                        drTo["Unit_Id"] = drFrom["Unit_Id"];
                        drTo["Unit_Name"] = drFrom["Unit_Name"];

                        drTo["Reserve_Price"] = drFrom["Reserve_Price"];
                        drTo["Applicable_Tax_In_Percentage"] = drFrom["Applicable_Tax_In_Percentage"];
                        drTo["Start_Price"] = drFrom["Start_Price"];
                        drTo["Minimum_Bid_Change"] = drFrom["Minimum_Bid_Change"];
                        drTo["Bid_Cushion_Limit"] = drFrom["Bid_Cushion_Limit"];
                        drTo["CMD"] = drFrom["CMD"];
                        drTo["Attachment_File_Path1"] = drFrom["Attachment_File_Path1"];
                        drTo["Attachment_File_Path2"] = drFrom["Attachment_File_Path2"];
                        drTo["Attachment_File_Path3"] = drFrom["Attachment_File_Path3"];

                        drTo["Status_Id"] = drFrom["Status_Id"];
                        drTo["Remarks"] = drFrom["Remarks"];
                        drTo["Row_No"] = dtItemsDetails.Rows.Count + 1;
                        dtItemsDetails.Rows.Add(drTo);
                    }
                    dtItemsDetails.AcceptChanges();
                    grdItemData.DataSource = SESSION_TBLFRMAUC_AUCTION_ITEM_LINK;
                    grdItemData.DataBind();
                    grdPartyOnlyDisp.DataSource = SESSION_TBLFRMAUC_AUCTION_ITEM_LINK;
                    grdPartyOnlyDisp.DataBind();
                    decimal totalQty = SESSION_TBLFRMAUC_AUCTION_ITEM_LINK.AsEnumerable().Sum(row => row.Field<decimal>("Start_Price"));
                    txtCMD.Text = totalQty.ToString();
                }
                if (CallFrom == "View")
                {
                    spanAddViewItem.InnerText = "View Items Details";
                    _objUtility.SetAllControlsProperty(DivItemDisabledEnable, EnumCollection.ControlProperty.Enabled, false);
                }
                else
                {
                    spanAddViewItem.InnerText = "Add Items ";
                    _objUtility.SetAllControlsProperty(DivItemDisabledEnable, EnumCollection.ControlProperty.Enabled, true);
                }
                #endregion

                #region Party Details
                PartyDetailsAll();
                #endregion

            }
        }

        private void CbCheckOrNot(bool Customer, bool Supplier, bool ServicesCustomer)
        {
            cbSendInvitiationToAllCustomer.Checked = Customer;
            cbSendInvitiationToAllSupplier.Checked = Supplier;
            cbSendInvitiationToAllServicesCustomer.Checked = ServicesCustomer;
        }

        private void PartyDetailsAll()
        {
            DataSet dsAuction = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);
            DataTable dtDBAuctionParty = dsAuction.Tables[2];

            if (dtDBAuctionParty.Rows.Count > 0)
            {
                btnViewPartyList.Visible = true;
                if (ddlAuctionType.SelectedValue == Forward)
                {
                    CbCheckOrNot(true, false, false);
                    AuctionType(true, false, false, true);
                }
                else if (ddlAuctionType.SelectedValue == Reverse)
                {
                    CbCheckOrNot(false, true, false);
                    AuctionType(false, true, false, true);
                }
                else if (ddlAuctionType.SelectedValue == Service)
                {
                    CbCheckOrNot(false, false, true);
                    AuctionType(false, false, true, true);
                }
                grdPartyList.DataSource = dtDBAuctionParty;
                grdPartyList.DataBind();
            }
            else
            {
                ddlAuctionType_SelectedIndexChanged(null, null);
            }
        }

        private void ButtonVisiblility(bool ONR, bool ProcessBTn)
        {
            OldAndNewRecord.Visible = ONR;
            divProcessButton.Visible = ProcessBTn;
        }

        private void HideAndShow(bool divItemDetails, bool Remove, bool Edit, bool Select)
        {
            ItemDetails.Visible = divItemDetails;
            grdItemData.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdItemData, "Remove")].Visible = Remove;
            grdItemData.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdItemData, "Edit")].Visible = Edit;
        }

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
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                ClearSelection();
                int rowid = Convert.ToInt32(e.CommandArgument);
                hdfId.Value = Convert.ToString(((HiddenField)grdData.Rows[rowid].FindControl("hdfAuctionId")).Value);
                hdfAuctionStatusId.Value = Convert.ToString(((HiddenField)grdData.Rows[rowid].FindControl("hdfAuctionStatusIddb")).Value);

                btnSaveAsDraft.Visible = false;
                if (e.CommandName == "View")
                {
                    HideShowDiv_Btn(false, true, false, true, "Create Auction", true);
                    DispalyDB_Data(Convert.ToInt64(hdfId.Value), "View", rowid);
                    //PartyList("View");
                    HideAndShow(false, false, true, false);
                    _objUtility.SetAllControlsProperty(divAuctionMainData, EnumCollection.ControlProperty.Enabled, false);
                    ButtonVisiblility(false, true);
                    ButtonVisibility();
                    AcessOfParty("View");
                }
                else if (e.CommandName == "Edt")
                {
                    HideShowDiv_Btn(false, true, false, true, "Create Auction", true);
                    HideAndShow(true, true, true, true);
                    HideButton(false, true, false, false, false, false, false, false, false);
                    ButtonVisiblility(true, false);
                    // PartyList("Edit");
                    ButtonVisibility();
                    _objUtility.SetAllControlsProperty(divCreateAuction, EnumCollection.ControlProperty.Enabled, true);
                    DispalyDB_Data(Convert.ToInt64(hdfId.Value), "Edit", rowid);

                }
                else if (e.CommandName == "Clone")
                {
                    HideShowDiv_Btn(false, true, false, true, "Create Auction", true);
                    HideAndShow(true, true, true, true);
                    HideButton(true, true, false, false, false, false, false, false, false);
                    ButtonVisiblility(true, false);
                    //PartyList("Clone");
                    ButtonVisibility();
                    _objUtility.SetAllControlsProperty(divCreateAuction, EnumCollection.ControlProperty.Enabled, true);
                    DispalyDB_Data(Convert.ToInt64(hdfId.Value), "Clone", rowid);
                    hdfId.Value = "0";
                }
                DivActionRemark.Visible = true;
                rfv_Action_Remarks.ValidationGroup = "Save";
                rfv_Action_Remarks.Visible = true;
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    HiddenField hdfAuctionStatusIddb = (HiddenField)e.Row.FindControl("hdfAuctionStatusIddb");
                    LinkButton btnEdit = (LinkButton)e.Row.FindControl("lnkBtnEdt");
                    LinkButton btnClone = (LinkButton)e.Row.FindControl("lnkBtnClone");

                    //Clone Button Visibility
                    if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == SavedAsDraftByAdmin || Convert.ToInt64(hdfAuctionStatusIddb.Value) == SavedAsDraftByClient)
                    {
                        btnClone.Visible = false;
                    }
                    else
                    {
                        btnClone.Visible = true;
                    }
                    //End
                    //Edit Button Visibility
                    if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Active || Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Conducted || Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Settled || Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Discarded)
                    {
                        btnEdit.Visible = false;
                    }
                    else
                    {
                        btnEdit.Visible = false;
                    }
                    //Admin Acess
                    if (_objCustomAppSetting.Admin == (_objManageUserSession.GetCurrentUser_Role_Id))
                    {
                        if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == SavedAsDraftByAdmin || Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Ready_For_Review || Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Ready_For_Publishing || Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Return_For_Review)
                        {
                            btnEdit.Visible = true;
                        }
                        else
                        {
                            btnEdit.Visible = false;
                        }
                    }
                    //End
                    //Client
                    if (_objCustomAppSetting.Client == (_objManageUserSession.GetCurrentUser_Role_Id))
                    {
                        if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == SavedAsDraftByClient)
                        {
                            btnEdit.Visible = true;
                        }
                        else
                        {
                            btnEdit.Visible = false;
                        }
                    }
                    //End
                    //Publisher
                    if (_objCustomAppSetting.Publisher == (_objManageUserSession.GetCurrentUser_Role_Id))
                    {
                        if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Ready_For_Publishing || Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Publish)
                        {
                            btnEdit.Visible = true;
                        }
                        else
                        {
                            btnEdit.Visible = false;
                        }
                    }
                    //End
                    //End
                    //Color Of Status
                    TableCell cell = e.Row.Cells[7];
                    if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == SavedAsDraftByAdmin)
                    {
                        cell.ForeColor = SavedAsDraftByAdmin_Color;
                    }
                    else if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == SavedAsDraftByClient)
                    {
                        cell.ForeColor = SavedAsDraftByClient_Color;
                    }
                    else if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Ready_For_Review)
                    {
                        cell.ForeColor = Auction_Ready_For_Review_Color;
                    }
                    else if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Ready_For_Publishing)
                    {
                        cell.ForeColor = Auction_Ready_For_Publishing_Color;
                    }
                    else if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Publish)
                    {
                        cell.ForeColor = Auction_PublishColor_Color;
                    }
                    else if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Return_For_Review)
                    {
                        cell.ForeColor = Auction_Return_For_Review_Color;
                    }
                    else if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Active)
                    {
                        cell.ForeColor = Auction_Active_Color;
                    }
                    else if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Conducted)
                    {
                        cell.ForeColor = Auction_Conducted_Color;
                    }
                    else if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Settled)
                    {
                        cell.ForeColor = Auction_Settled_Color;
                    }
                    else if (Convert.ToInt64(hdfAuctionStatusIddb.Value) == Auction_Discarded)
                    {
                        cell.ForeColor = Auction_Discarded_Color;
                    }
                    //End
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

        protected void grdItemData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int rowid = Convert.ToInt32(e.CommandArgument);
                DataTable dt = SESSION_TBLFRMAUC_AUCTION_ITEM_LINK;
                dt.Rows.Remove(dt.Rows[rowid]);
                dt.AcceptChanges();
                grdItemData.DataSource = dt;
                grdItemData.DataBind();
                grdPartyOnlyDisp.DataSource = dt;
                grdPartyOnlyDisp.DataBind();
                decimal totalQty = SESSION_TBLFRMAUC_AUCTION_ITEM_LINK.AsEnumerable().Sum(row => row.Field<decimal>("CMD"));
                txtCMD.Text = totalQty.ToString();
                ClearItemDetailsControl();
                btnAddItemPopup_Click(null, null);

            }
            else if (e.CommandName == "Edt")
            {
                ClearItemDetailsControl();
                int rowid = Convert.ToInt32(e.CommandArgument);
                hdfItemEditIndex.Value = Convert.ToString(rowid);
                hdfAuctionItemLinkId.Value = Convert.ToString(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfAuctionItemLinkId")).Value);
                if (ddlItemCategory.Items.FindByValue(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfItemCategoryId")).Value) != null)
                {
                    ddlItemCategory.SelectedValue = Convert.ToString(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfItemCategoryId")).Value);
                }
                if (ddlItemSubCategory.Items.FindByValue(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfItemSubCategoryId")).Value) != null)
                {
                    ddlItemSubCategory.SelectedValue = Convert.ToString(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfItemSubCategoryId")).Value);
                }
                txtItemName.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblItemName")).Text);
                txtItemCode.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblItemCode")).Text);
                txtQTY.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblQuantity")).Text);
                if (ddlUnit.Items.FindByValue(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfItemUnitId")).Value) != null)
                {
                    ddlUnit.SelectedValue = Convert.ToString(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfItemUnitId")).Value);
                }
                txtItemDescription.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblItemDescription")).Text);
                txtReservePrice.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblReservePrice")).Text);
                txtApplicableTax.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblApplicableTaxInPercentage")).Text);
                txtStartingPrice.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblStartPrice")).Text);
                txtMinimumBidRange.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblMinimumBidChange")).Text);
                txtBidCushionRange.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblBidCushionLimit")).Text);
                txtItemCMD.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblCMD")).Text);
                txtItemRemark.Text = Convert.ToString(((Label)grdItemData.Rows[rowid].FindControl("lblItemRemarks")).Text);

                if (_objUtility.ValidateDBNullEmptyValue(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfAttachmentFilePath1")).Value) == false)
                {
                    AttachmentImageShow(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfAttachmentFilePath1")).Value);
                }

                if (_objUtility.ValidateDBNullEmptyValue(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfAttachmentFilePath2")).Value) == false)
                {
                    Attachment2ImageShow(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfAttachmentFilePath2")).Value);
                }

                if (_objUtility.ValidateDBNullEmptyValue(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfAttachmentFilePath3")).Value) == false)
                {
                    Attachment3ImageShow(((HiddenField)grdItemData.Rows[rowid].FindControl("hdfAttachmentFilePath3")).Value);
                }
                HideAndShow(true, false, true, false);
                btnAddItemPopup_Click(null, null);
            }
        }

        protected void grdItemData_PreRender(object sender, EventArgs e)
        {
            // gv1.UseAccessibleHeader = true;
            try
            {
                if (grdItemData.Rows.Count > 0)
                {
                    //Replace the <td> with <th> and adds the scope attribute
                    grdItemData.UseAccessibleHeader = true;

                    //Adds the <thead> and <tbody> elements required for DataTables to work
                    grdItemData.HeaderRow.TableSection = TableRowSection.TableHeader;

                    //Adds the <tfoot> element required for DataTables to work
                    grdItemData.FooterRow.TableSection = TableRowSection.TableFooter;
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

        #region Validation
        private bool Validation()
        {
            if (_objUtility.ValidateDBNullEmptyValue(txtAuctionName.Text.Trim()))
            {
                _objMessage.ShowMessage(null, txtAuctionName, 6, "Auction Name");
                return false;
            }
            if (ddlAuctionType.SelectedValue == "0")
            {
                _objMessage.ShowMessage(null, ddlAuctionType, 8, "Auction Type");
                return false;
            }
            if (ddlPrimaryCurrency.SelectedValue == "0")
            {
                _objMessage.ShowMessage(null, ddlPrimaryCurrency, 8, "Primary Currency");
                return false;
            }
            if (ddlParty.SelectedValue == "0")
            {
                _objMessage.ShowMessage(null, ddlParty, 8, "Party");
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtCompanyName.Text.Trim()))
            {
                _objMessage.ShowMessage(null, txtCompanyName, 6, "Company Name");
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtCompanyCode.Text.Trim()))
            {
                _objMessage.ShowMessage(null, txtCompanyCode, 6, "Company Code");
                return false;
            }
            if (rbSelectBusinessUnitDropdown.Checked == true)
            {
                if (ddlBusinessUnit.SelectedValue == "0")
                {
                    _objMessage.ShowMessage(null, ddlBusinessUnit, 8, "Business Unit");
                    return false;
                }
            }
            else
            {
                if (_objUtility.ValidateDBNullEmptyValue(txtBusinessUnit.Text.Trim()))
                {
                    _objMessage.ShowMessage(null, txtBusinessUnit, 6, "Business Unit");
                    return false;
                }
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtDescription.Text.Trim()))
            {
                _objMessage.ShowMessage(null, txtDescription, 6, "Description");
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtGracePeriodMin.Text.Trim()))
            {
                _objMessage.ShowMessage(null, txtGracePeriodMin, 6, "Grace Period(Min)");
                return false;
            }
            if (ddlExtendAuctionTimeIfNew.SelectedValue == "0")
            {
                _objMessage.ShowMessage(null, ddlExtendAuctionTimeIfNew, 8, "Extend Auction Time If New");
                return false;
            }
            if (ddlBidInformationShownToParticipate.SelectedValue == "0")
            {
                _objMessage.ShowMessage(null, ddlBidInformationShownToParticipate, 8, "Bid Information Shown To Participate");
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(RadAuctionStartDateTime.SelectedDate))
            {
                _objMessage.ShowMessage(null, RadAuctionStartDateTime, 6, "Open DateTime");
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(RadAuctionCloseDateTime.SelectedDate))
            {
                _objMessage.ShowMessage(null, RadAuctionCloseDateTime, 6, "Close DateTime");
                return false;
            }
            if (RadAuctionStartDateTime.SelectedDate.Value > RadAuctionCloseDateTime.SelectedDate.Value)
            {
                _objMessage.ShowMessage(null, RadAuctionCloseDateTime, 34, new string[] { "Open DateTime", "Close DateTime" });
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtExtendAuctionTime.Text.Trim()))
            {
                _objMessage.ShowMessage(null, txtExtendAuctionTime, 6, "Extend Auction Time");
                return false;
            }
            if (_objCustomAppSetting.Admin == (_objManageUserSession.GetCurrentUser_Role_Id) || _objCustomAppSetting.Publisher == (_objManageUserSession.GetCurrentUser_Role_Id))
            {
                if (ddlAuctionType.SelectedValue == Forward)
                {
                    if (cbSendInvitiationToAllCustomer.Checked == false)
                    {
                        _objMessage.ShowMessage(null, cbSendInvitiationToAllCustomer, 27, "Plese Checked " + cbSendInvitiationToAllCustomer.Text);
                        return false;
                    }
                }
                if (ddlAuctionType.SelectedValue == Reverse)
                {
                    if (cbSendInvitiationToAllSupplier.Checked == false)
                    {
                        _objMessage.ShowMessage(null, cbSendInvitiationToAllSupplier, 27, "Plese Checked " + cbSendInvitiationToAllSupplier.Text);
                        return false;
                    }
                }
                if (ddlAuctionType.SelectedValue == Service)
                {
                    if (cbSendInvitiationToAllServicesCustomer.Checked == false)
                    {
                        if (cbSendInvitiationToAllSupplier.Checked == false)
                        {
                            _objMessage.ShowMessage(null, cbSendInvitiationToAllServicesCustomer, 27, "Plese Checked" + cbSendInvitiationToAllServicesCustomer.Text);
                            return false;
                        }
                    }
                }
            }
            if (hdfId.Value != "0" && string.IsNullOrEmpty(txt_Action_Remarks.Text.Trim()))
            {
                _objMessage.ShowMessage(null, txt_Action_Remarks, 6, "Reason For Change");
                txt_Action_Remarks.Focus();
                return false;
            }
            if (_objDBCommon.Is_Valid_Transaction_Password(txtUserTransactionPassword, _objManageUserSession) == false)
            {
                return false;
            }
            return true;
        }

        private bool ItemsDetails_Validation()
        {
            string txtMessageBlank = "Please Enter " + " !";
            string ddlMessageBlank = "Please Select " + " !";
            string ZeroVG = " must be greater than 0 !";
            string Percentage = "Percentage Value must be between 1 to 100 !";
            if (ddlItemCategory.SelectedValue == "0")
            {
                lblMessage.Text = ddlMessageBlank + "Item Category";
                ddlItemCategory.Focus();
                return false;
            }
            if (ddlItemSubCategory.SelectedValue == "0")
            {
                lblMessage.Text = ddlMessageBlank + "Item Sub Category";
                ddlItemSubCategory.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtItemName.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "Item Name";
                txtItemName.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtItemCode.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "Item Code";
                txtItemCode.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtQTY.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "QTY";
                txtQTY.Focus();
                return false;
            }
            if (Convert.ToDouble(txtQTY.Text.Trim()) <= 0)
            {
                lblMessage.Text = "Item Quantity" + ZeroVG;
                txtQTY.Focus();
                return false;
            }
            if (ddlUnit.SelectedValue == "0")
            {
                lblMessage.Text = ddlMessageBlank + "Unit";
                ddlUnit.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtItemDescription.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "Item Description";
                txtItemDescription.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtReservePrice.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "Reserve Price";
                txtReservePrice.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtApplicableTax.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "Applicable Tax";
                txtApplicableTax.Focus();
                return false;
            }
            if (Convert.ToDouble(txtApplicableTax.Text.Trim()) > 100)
            {
                lblMessage.Text = Percentage;
                txtApplicableTax.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtStartingPrice.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "Starting Price";
                txtStartingPrice.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtMinimumBidRange.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "Minimum Bid Range";
                txtMinimumBidRange.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtBidCushionRange.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "Bid Cushion Range";
                txtBidCushionRange.Focus();
                return false;
            }
            if (_objUtility.ValidateDBNullEmptyValue(txtItemCMD.Text.Trim()))
            {
                lblMessage.Text = txtMessageBlank + "CMD";
                txtItemCMD.Focus();
                return false;
            }
            if (Convert.ToDouble(txtItemCMD.Text.Trim()) <= 0)
            {
                lblMessage.Text = "CMD" + ZeroVG;
                txtItemCMD.Focus();
                return false;
            }
            return true;
        }
        #endregion

        #region Add Item Details Button Click & Function

        private void ClearItemDetailsControl()
        {
            hdfAuctionItemLinkId.Value = "0";
            hdfItemEditIndex.Value = "-1";
            ddlItemCategory.SelectedValue = "0";
            ddlItemSubCategory.SelectedValue = "0";
            txtItemName.Text = "";
            txtItemCode.Text = "";
            txtQTY.Text = "";
            //ddlUnit.SelectedValue = "0";
            txtItemDescription.Text = "";
            txtReservePrice.Text = "";
            txtApplicableTax.Text = "";
            txtStartingPrice.Text = "";
            txtMinimumBidRange.Text = "";
            txtBidCushionRange.Text = "";
            txtItemRemark.Text = "";
            txtItemCMD.Text = "";
            AttachmentImageHide();
            Attachment2ImageHide();
            Attachment3ImageHide();
        }

        protected void lnkbtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                ItemsDetails_Validation();
                if (ItemsDetails_Validation() == false)
                {
                    btnAddItemPopup_Click(null, null);
                    return;
                }
                else
                {
                    lblMessage.Text = "";
                }

                DataTable DT_AUCTION_ITEM_LINK = new DataTable();
                DT_AUCTION_ITEM_LINK = SESSION_TBLFRMAUC_AUCTION_ITEM_LINK;
                DataRow rdu;
                if (_objUtility.ValidateDBNullEmptyValue(hdfItemEditIndex.Value, "-1").ToString() == "-1")
                {
                    rdu = DT_AUCTION_ITEM_LINK.NewRow();
                }
                else
                {
                    rdu = DT_AUCTION_ITEM_LINK.Rows[Convert.ToInt32(hdfItemEditIndex.Value)];
                }
                rdu["Auction_Item_Link_Id"] = 0;
                rdu["Auction_Id"] = hdfId.Value;
                rdu["Item_Category_Name"] = ddlItemCategory.SelectedItem.ToString();
                rdu["Item_Category_Id"] = ddlItemCategory.SelectedValue;
                rdu["Item_Sub_Category_Name"] = ddlItemSubCategory.SelectedItem.ToString();
                rdu["Item_Sub_Category_Id"] = ddlItemSubCategory.SelectedValue;

                rdu["Item_Code"] = txtItemCode.Text.Trim();
                rdu["Item_Name"] = txtItemName.Text.Trim();
                rdu["Item_Desc"] = txtItemDescription.Text.Trim();
                rdu["Quantity"] = txtQTY.Text.Trim();
                rdu["Unit_Name"] = ddlUnit.SelectedItem.ToString();
                rdu["Unit_Id"] = ddlUnit.SelectedValue;

                rdu["Reserve_Price"] = txtReservePrice.Text.Trim();
                rdu["Applicable_Tax_In_Percentage"] = txtApplicableTax.Text.Trim();
                rdu["Start_Price"] = txtStartingPrice.Text.Trim();
                rdu["Minimum_Bid_Change"] = txtMinimumBidRange.Text.Trim();
                rdu["Bid_Cushion_Limit"] = txtBidCushionRange.Text.Trim();
                rdu["CMD"] = txtItemCMD.Text.Trim();

                if (hdfAttachmentImagePath.Value != "~/Images/camera.jpg" && hdfAttachmentImagePath.Value.Contains("/dist"))
                {
                    rdu["Attachment_File_Path1"] = hdfAttachmentImagePath.Value;

                }
                else if (_objUtility.ValidateDBNullEmptyValue(hdfAttachmentImagePath.Value) || hdfAttachmentImagePath.Value == "0")
                {
                    rdu["Attachment_File_Path1"] = DBNull.Value;
                }
                else
                {
                    rdu["Attachment_File_Path1"] = _objFileSystem.MoveToServer(hdfAttachmentImagePath.Value, 0);
                }

                if (hdfAttachment2ImagePath.Value != "~/Images/camera.jpg" && hdfAttachment2ImagePath.Value.Contains("/dist"))
                {
                    rdu["Attachment_File_Path2"] = hdfAttachment2ImagePath.Value;
                }
                else if (_objUtility.ValidateDBNullEmptyValue(hdfAttachment2ImagePath.Value) || hdfAttachment2ImagePath.Value == "0")
                {
                    rdu["Attachment_File_Path2"] = DBNull.Value;
                }
                else
                {
                    rdu["Attachment_File_Path2"] = _objFileSystem.MoveToServer(hdfAttachment2ImagePath.Value, 0);
                }

                if (hdfAttachment3ImagePath.Value != "~/Images/camera.jpg" && hdfAttachment3ImagePath.Value.Contains("/dist"))
                {
                    rdu["Attachment_File_Path3"] = hdfAttachment3ImagePath.Value;
                }
                else if (_objUtility.ValidateDBNullEmptyValue(hdfAttachment3ImagePath.Value) || hdfAttachment3ImagePath.Value == "0")
                {
                    rdu["Attachment_File_Path3"] = DBNull.Value;
                }
                else
                {
                    rdu["Attachment_File_Path3"] = _objFileSystem.MoveToServer(hdfAttachment3ImagePath.Value, 0);
                }

                rdu["Status_Id"] = 1;
                rdu["Remarks"] = txtItemRemark.Text.Trim();
                rdu["Row_No"] = DT_AUCTION_ITEM_LINK.Rows.Count + 1;

                if (_objUtility.ValidateDBNullEmptyValue(hdfItemEditIndex.Value, "-1").ToString() == "-1")
                {
                    DT_AUCTION_ITEM_LINK.Rows.Add(rdu);
                }
                DT_AUCTION_ITEM_LINK.AcceptChanges();
                grdItemData.DataSource = DT_AUCTION_ITEM_LINK;
                grdItemData.DataBind();
                grdPartyOnlyDisp.DataSource = DT_AUCTION_ITEM_LINK;
                grdPartyOnlyDisp.DataBind();

                decimal totalQty = SESSION_TBLFRMAUC_AUCTION_ITEM_LINK.AsEnumerable().Sum(row => row.Field<decimal>("CMD"));
                txtCMD.Text = totalQty.ToString();
                ClearItemDetailsControl();
                btnAddItemPopup_Click(null, null);
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

        #region Add Party Details Button Click & Function

        private void ClearPartyDetails()
        {
            ddlAddNewParty.SelectedValue = "0";
        }

        protected void btnAddParty_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet dsParty = _objMasterCollection.BindParty(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(ddlAddNewParty.SelectedValue), "5,6", 0, 0, 1, "", EnumCollection.SearchRecord.MAIN_DATA, false, false);
                DataTable dtParty = dsParty.Tables[0];

                DataTable DT_AUCTION_ITEM_LINK = new DataTable();
                DT_AUCTION_ITEM_LINK = SESSION_TBLFRMAUC_AUCTION_PARTY_LINK;

                DataRow[] drData = DT_AUCTION_ITEM_LINK.Select("Party_Id='" + ddlAddNewParty.SelectedValue + "'");
                if (drData.Length > 0)
                {
                    _objMessage.ShowMessage(sender, ddlAddNewParty, 24, "Party");
                    ddlAddNewParty.Focus();
                    return;
                }

                DataRow rdu;
                rdu = DT_AUCTION_ITEM_LINK.NewRow();

                rdu["Auction_Party_Link_Id"] = 0;
                rdu["Auction_Id"] = hdfId.Value;
                rdu["Party_Id"] = ddlAddNewParty.SelectedValue;
                rdu["Is_Available"] = 1;
                rdu["Company_Type"] = dtParty.Rows[0]["Company_Type"].ToString();
                rdu["Party_Company_Name"] = dtParty.Rows[0]["Party_Company_Name"].ToString();
                rdu["Party_Company_Code"] = dtParty.Rows[0]["Party_Company_Code"].ToString();
                rdu["Party_Contact_No"] = dtParty.Rows[0]["Party_Contact_No"].ToString();
                rdu["Party_Contact_Person_Name"] = dtParty.Rows[0]["Party_Contact_Person_Name"].ToString();
                rdu["Party_Contact_Person_Email_Id"] = dtParty.Rows[0]["Party_Contact_Person_Email_Id"].ToString();
                rdu["Party_Contact_Person_Mobile_No"] = dtParty.Rows[0]["Party_Contact_Person_Mobile_No"].ToString();
                rdu["Status_Id"] = 1;
                rdu["Remarks"] = DBNull.Value;
                rdu["Row_No"] = DT_AUCTION_ITEM_LINK.Rows.Count + 1;
                DT_AUCTION_ITEM_LINK.Rows.Add(rdu);
                DT_AUCTION_ITEM_LINK.AcceptChanges();
                grdPartyList.DataSource = DT_AUCTION_ITEM_LINK;
                grdPartyList.DataBind();
                ClearPartyDetails();
                btnAddItemPopup_Click(null, null);
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

        #region Radio Button Event

        private void BusinessUnit(bool ddlBU, bool txtBU, string ddlBUVG, string txtBUVG)
        {
            ddlBusinessUnit.Enabled = ddlBU;
            txtBusinessUnit.Enabled = txtBU;
            rfvBusinessUnit.ValidationGroup = ddlBUVG;
            rfvtxtBusinessUnit.ValidationGroup = txtBUVG;

        }

        protected void rbSelectBusinessUnitDropdown_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                rbSelectBusinessUnitDropdown.Checked = true;
                rbSelectBusinessUnitTextbox.Checked = false;
                ddlBusinessUnit.SelectedValue = "0";
                txtBusinessUnit.Text = "";
                BusinessUnit(true, false, "Save", "Savexyz");
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void rbSelectBusinessUnitTextbox_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                rbSelectBusinessUnitDropdown.Checked = false;
                rbSelectBusinessUnitTextbox.Checked = true;
                ddlBusinessUnit.SelectedValue = "0";
                txtBusinessUnit.Text = "";
                BusinessUnit(false, true, "Savexyz", "Save");

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

        #region DropdownList And CheckBox Event

        private void CheckAllGridData(GridView grd, object sender)
        {
            CheckBox chkAll = (CheckBox)sender;

            for (int ichk = 0; ichk < grd.Rows.Count; ichk++)
            {
                ((CheckBox)grd.Rows[ichk].FindControl("cbIndividual")).Checked = chkAll.Checked;
            }
        }

        protected void ddlParty_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlParty.SelectedValue != "0")
                {
                    txtCompanyName.Text = "";
                    txtCompanyCode.Text = "";
                    DataSet dsParty = _objMasterCollection.BindParty(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(ddlParty.SelectedValue), "4", 0, 0, 1, "", EnumCollection.SearchRecord.BOTH, false, false);
                    DataTable dtParty = dsParty.Tables[0];
                    txtCompanyName.Text = dtParty.Rows[0]["Party_Company_Name"].ToString();
                    txtCompanyCode.Text = dtParty.Rows[0]["Party_Company_Code"].ToString();

                    DataTable dtPartyBU = dsParty.Tables[5];
                    ddlBusinessUnit.DataSource = dtPartyBU;
                    ddlBusinessUnit.DataValueField = "Party_Business_Unit_Id";
                    ddlBusinessUnit.DataTextField = "Business_Unit_Name";
                    ddlBusinessUnit.DataBind();
                    ddlBusinessUnit.Items.Insert(0, new ListItem("-- Select --", "0"));
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

        protected void ddlAuctionType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                AuctionType(false, false, false, false);
                CbCheckOrNot(false, false, false);
                DataTable dtParty = new DataTable();
                if (ddlAuctionType.SelectedValue == Forward)
                {
                    AuctionType(true, false, false, true);
                    DataSet dsParty = _objMasterCollection.BindParty(_objManageUserSession.GetCurrentUser_Firm_Id, 0, "5,6", 0, 0, 1, "", EnumCollection.SearchRecord.DETAIL_DATA, false, false, 27);
                    dtParty = dsParty.Tables[5];
                }
                else if (ddlAuctionType.SelectedValue == Reverse)
                {
                    AuctionType(false, true, false, true);
                    DataSet dsParty = _objMasterCollection.BindParty(_objManageUserSession.GetCurrentUser_Firm_Id, 0, "5,6", 0, 0, 1, "", EnumCollection.SearchRecord.DETAIL_DATA, false, false, 28);
                    dtParty = dsParty.Tables[5];
                }
                else if (ddlAuctionType.SelectedValue == Service)
                {
                    AuctionType(false, false, true, true);
                    DataSet dsParty = _objMasterCollection.BindParty(_objManageUserSession.GetCurrentUser_Firm_Id, 0, "5,6", 0, 0, 1, "", EnumCollection.SearchRecord.DETAIL_DATA, false, false, 29);
                    dtParty = dsParty.Tables[5];
                }
                grdPartyList.DataSource = dtParty;
                grdPartyList.DataBind();
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void cbSendInvitiationToAllCustomer_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckAllGridData(grdPartyList, sender);
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void cbSendInvitiationToAllSupplier_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckAllGridData(grdPartyList, sender);

            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void cbSendInvitiationToAllServicesCustomer_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckAllGridData(grdPartyList, sender);

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

        #region PopUp Visibility/Item Details
        private void PopupVisiblity(bool Imgpdf, bool Item)
        {
            divImgpdf.Visible = Imgpdf;
            divItemDetailsAdd.Visible = Item;
            lblGDocumentName.Text = "Add Item Details";
        }

        protected void btnAddItemPopup_Click(object sender, EventArgs e)
        {
            try
            {
                PopupVisiblity(false, true);
                mpeForGDocuments.Show();
                txtItemName.Focus();
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