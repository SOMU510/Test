using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YCS;

namespace eAuction
{
    public partial class AuctionStatusPartyWise : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        protected ManageUserSession _objManageUserSession;
        protected Utility _objUtility = new Utility();
        private const string MENU_CODE = "1020";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        FileSystem _objFileSystem = new FileSystem();

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
                    // _TransactionPassword();
                    _Control_Clear();
                    _Bind_Control();
                }

                if (hdfIs_ShowBidHistoryPopUp.Value == "1")
                {
                    mpeForBidHistory.Show();
                }

                if (hdfIs_ShowBidEntryPopUp.Value == "1")
                {
                    mpeForBidEntry.Show();
                }

                if (hdfIs_ShowItemPopup.Value == "1")
                {
                    mpeItemDetails.Show();
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

        protected void ddlDashBoardAuction_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValueInList(ddlDashBoardAuction.SelectedValue, true) == false)
                {
                    Fill_Auction_Data(Convert.ToInt64(ddlDashBoardAuction.SelectedValue));
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

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            try
            {
                Fill_Update_Detail_Control(hdfAuctionId.Value, false);
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValue(txtRemarks.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtRemarks, 6, "Remarks");
                    txtRemarks.Focus();
                    return;
                }

                //All Auction -39
                DataSet ds = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfAuctionId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dtAuctionPartyLink = _objMasterCollection.UT_TBLFRMAUC_AUCTION_PARTY_LINK;

                    if (ds.Tables[2].Rows.Count > 0)
                    {
                        DataRow[] dr = ds.Tables[2].Select("Party_Id='" + _objManageUserSession.GetCurrentLogin_Primary_Id + "' AND Status_Id=" + true);
                        if (dr.Length > 0)
                        {
                            DataRow drData = dtAuctionPartyLink.NewRow();
                            drData["Auction_Party_Link_Id"] = dr[0]["Auction_Party_Link_Id"];
                            drData["Auction_Id"] = dr[0]["Auction_Id"];
                            drData["Party_Id"] = dr[0]["Party_Id"];
                            drData["Status_Id"] = dr[0]["Status_Id"];
                            drData["Remarks"] = dr[0]["Remarks"];
                            drData["Row_No"] = 1;
                            drData["Is_Accept_Auction"] = 1;
                            drData["Accept_Remarks"] = txtRemarks.Text.Trim();
                            dtAuctionPartyLink.Rows.Add(drData);
                        }
                    }

                    if (dtAuctionPartyLink.Rows.Count == 0)
                    {
                        _objMessage.ShowMessage(sender, txtRemarks, 19, "Party");
                        txtRemarks.Focus();
                        return;
                    }

                    List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
                    lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Id", Value = ds.Tables[0].Rows[0]["Auction_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = ds.Tables[0].Rows[0]["Firm_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Type_Enum_Id", Value = ds.Tables[0].Rows[0]["Auction_Type_Enum_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Name", Value = ds.Tables[0].Rows[0]["Auction_Name"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Code", Value = ds.Tables[0].Rows[0]["Auction_Code"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Currency_Id", Value = ds.Tables[0].Rows[0]["Currency_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Id", Value = ds.Tables[0].Rows[0]["Party_Id"] });

                    lstDBMapParam.Add(new DBMapParam() { Name = "Business_Unit_Id", Value = ds.Tables[0].Rows[0]["Business_Unit_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Business_Unit", Value = ds.Tables[0].Rows[0]["Business_Unit"] });

                    lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Description", Value = ds.Tables[0].Rows[0]["Auction_Description"] });

                    lstDBMapParam.Add(new DBMapParam() { Name = "Open_Date_Time", Value = ds.Tables[0].Rows[0]["Open_Date_Time"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Close_Date_Time", Value = ds.Tables[0].Rows[0]["Close_Date_Time"] });

                    lstDBMapParam.Add(new DBMapParam() { Name = "Extend_Auction_In_Minutes", Value = ds.Tables[0].Rows[0]["Extend_Auction_In_Minutes"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Extend_Auction_Enum_Type_Id", Value = ds.Tables[0].Rows[0]["Extend_Auction_Enum_Type_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Grace_Period_In_Minutes", Value = ds.Tables[0].Rows[0]["Grace_Period_In_Minutes"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Bid_Info_Shown_To_Participant_Enum_Id", Value = ds.Tables[0].Rows[0]["Bid_Info_Shown_To_Participant_Enum_Id"] });

                    lstDBMapParam.Add(new DBMapParam() { Name = "Upload_Catalogue_File_Path", Value = ds.Tables[0].Rows[0]["Upload_Catalogue_File_Path"] });

                    lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Item", Value = _objMasterCollection.UT_TBLFRMAUC_AUCTION_ITEM_LINK });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Party", Value = dtAuctionPartyLink });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_Status_Id", Value = 0 });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_User_Role_Id", Value = _objManageUserSession.GetCurrentUser_Role_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = txtRemarks.Text.Trim() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
                    lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                    lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });

                    lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = "AUCTION ACCEPTED" });

                    lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                    Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Auction", lstDBMapParam);

                    if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                    {
                        _objMessage.ShowMessage(sender, null, 64, "Auction Accepted");
                        Fill_Update_Detail_Control(hdfAuctionId.Value, false);
                        return;
                    }
                    else
                    {
                        _objMessage.ShowMessage(sender, txtRemarks, 7, dictResult["OutputMessage"]);
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            try
            {
                _Control_Clear();
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnAllBidHistory_Click(object sender, EventArgs e)
        {
            try
            {
                grdBidHistory.DataSource = _objMasterCollection.BindAuctionBid(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfAuctionId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, null, _objManageUserSession.GetCurrentLogin_Primary_Id, 0, null, false);
                grdBidHistory.DataBind();

                mpeForBidHistory.Show();
                hdfIs_ShowBidHistoryPopUp.Value = "1";
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnAutoUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                Fill_Update_Detail_Control(hdfAuctionId.Value, true);
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

        #region Private Methods
        private void FormEntryAndListDivHideShow(bool List, bool CreateParty, string HeaderSpan, string MenuHeaderIcon)
        {
            //divPartyist.Visible = List;
            //lnkbtnPartyList.Visible = !List;

            //divCreateParty.Visible = CreateParty;
            //lnkbtnCreateParty.Visible = !CreateParty;

            //HideButtons();

            //if (divCreateParty.Visible)
            //{
            //    lnkbtnSendToParty.Visible = divActionSendToParty.Visible = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Employee_Send_to_Party, Convert.ToString(_objManageUserSession.GetCurrentUser_RoleId));
            //    lnkbtnSendToApproval.Visible = divActionSendToApproval.Visible = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Employee_Submitted, Convert.ToString(_objManageUserSession.GetCurrentUser_RoleId)); ;
            //    lnkbtnSubmitApprove.Visible = divActionSubmitApprove.Visible = _objCustomAppSetting.Party_Flow(EnumCollection.PartyFlow.Approved, Convert.ToString(_objManageUserSession.GetCurrentUser_RoleId)); ;
            //}

            //spanHeader.InnerText = HeaderSpan;
            //liMenuHeaderIcon.Attributes["class"] = MenuHeaderIcon;
        }

        private void Clear_ItemDetail()
        {
            lnkBtnDownloadAttachment.CommandArgument = "";
            lblItemCategoryVal.Text = "";
            lblItemSubCategoryVal.Text = "";
            lblItemNameVal.Text = "";
            lblItemCodeVal.Text = "";
            lblQuantityVal.Text = "";
            lblUnitVal.Text = "";
            lblItemDescriptionVal.Text = "";
            lblCMDVal.Text = "";
            lblReservePriceVal.Text = "";
            lblApplicableTaxVal.Text = "";
            lblStartingPriceVal.Text = "";
            lblMinimumBidRangeVal.Text = "";
            lblBidCushionRangeVal.Text = "";
            lblRemarksVal.Text = "";
            //divAttachment1.Visible = false;
            //divAttachment2.Visible = false;
            //divAttachment3.Visible = false;
            divAttchmentDownload.Visible = false;
        }

        private void _Bind_Control()
        {
            Int64 dashBoard_Auction_Enum_Id = 0;

            DataTable dt = _objMasterCollection.BindRoleDashboardRight(0, _objManageUserSession.GetCurrentUser_Firm_Id, _objManageUserSession.GetCurrentUser_Role_Id, EnumCollection.DashBoard.Auction_Dashboard.ToString(), 0, 0, 1, ddlDashBoardAuction, false);

            if (_objUtility.ValidateDBNullEmptyValue(_objManageUserSession.User_Clicks_Dashboard_Id) == false)
            {
                dashBoard_Auction_Enum_Id = Convert.ToInt64(_objManageUserSession.User_Clicks_Dashboard_Id);
                _objManageUserSession.User_Clicks_Dashboard_Id = null;

                if (ddlDashBoardAuction.Items.FindByValue(Convert.ToString(dashBoard_Auction_Enum_Id)) != null)
                {
                    ddlDashBoardAuction.SelectedValue = Convert.ToString(dashBoard_Auction_Enum_Id);
                }
            }
            else if (_objUtility.ValidateDBNullEmptyValueInList(ddlDashBoardAuction.SelectedValue, true) == false)
            {
                dashBoard_Auction_Enum_Id = Convert.ToInt64(ddlDashBoardAuction.SelectedValue);
            }

            Fill_Auction_Data(dashBoard_Auction_Enum_Id);
        }

        private void Fill_Auction_Data(Int64 dashBoard_Auction_Enum_Id)
        {
            _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, 0, 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, grdData, dashBoard_Auction_Enum_Id);
        }

        private void _Control_Clear()
        {
            _objUtility.AssignButtonValidationGroup(btnAccept, "Accept");
            _objUtility.AssignButtonValidationGroup(btnBack, "Back");
            _objUtility.AssignButtonValidationGroup(btnConfirm, "Confirm");
            _objUtility.AssignButtonValidationGroup(btnCloseAuctionBid, "Close");

            hdfIs_ShowBidHistoryPopUp.Value = "0";
            hdfIs_ShowBidEntryPopUp.Value = "0";
            Clear_ItemDetail();

            _Detail_Control_Clear(false);

            divAuctionDetails.Visible = false;
            divAuctionList.Visible = true;
            divstatus.Visible = false;
            divActionClear.Visible = false;
        }

        private DataTable CreateBid_Table()
        {
            DataTable dtColumn = new DataTable();
            dtColumn.Columns.Add("ItemGrid_RowId", typeof(Int64));
            dtColumn.Columns.Add("CallFrom");
            dtColumn.Columns.Add("Item_Name");
            dtColumn.Columns.Add("Quantity", typeof(decimal));
            dtColumn.Columns.Add("Bid", typeof(decimal));
            dtColumn.Columns.Add("Total", typeof(decimal));
            dtColumn.Columns.Add("Tax_Amount", typeof(decimal));
            dtColumn.Columns.Add("Final_Amount", typeof(decimal));

            return dtColumn;
        }

        private void _Detail_Control_Clear(bool gridAutorefresh)
        {
            divAuctionDetails.Visible = true;
            divAuctionList.Visible = false;
            divstatus.Visible = true;
            divActionClear.Visible = true;

            lblAuctionCode.Text = "";
            lblAuctionName.Text = "";
            lblOpenTime.Text = "";
            lblCloseTime.Text = "";
            lblAvailableInVal.Text = "";

            lblAccept.Text = "Not Accepted";
            lblAccept.Visible = false;
            lblRemarks.Visible = true;
            btnAccept.Visible = false;
            txtRemarks.Enabled = false;

            hdfAuctionId.Value = "0";
            hdfAuctionTypeEnum_Id.Value = "0";
            hdfIsAutoUpdate.Value = "0";
            hdfAuctionPartyId.Value = "0";
            hdfIsAcceptAuction.Value = "0";
            hdfOpenTime.Value = "";
            hdfCloseTime.Value = "";

            hdfMin.Value = "0";
            hdfHour.Value = "0";
            hdfClosedTimeWithAddedMin.Value = "";

            lblAccept.Visible = false;
            txtRemarks.Enabled = true;
            txtRemarks.Text = "";

            if (gridAutorefresh == false)
            {
                grdAuctionItemList.DataSource = null;
                grdAuctionItemList.DataBind();
            }

            List<string> lstNotHideColumn = new List<string>();
            lstNotHideColumn.Add("SNO.");
            lstNotHideColumn.Add("VIEW");
            lstNotHideColumn.Add("ITEM NAME");
            lstNotHideColumn.Add("QUANTITY");
            lstNotHideColumn.Add("UNIT");
            lstNotHideColumn.Add("START PRICE");
            lstNotHideColumn.Add("MIN BID CHANGE");
            lstNotHideColumn.Add("CUSHION BID LIMIT");
            lstNotHideColumn.Add("TAX PERCENTAGE");

            for (int i = 0; i < grdAuctionItemList.Columns.Count; i++)
            {
                if (grdAuctionItemList.Columns[i].Visible)
                {
                    if (_objUtility.ValidateDBNullEmptyValue(grdAuctionItemList.Columns[i].HeaderText) == false && lstNotHideColumn.Contains(grdAuctionItemList.Columns[i].HeaderText.Trim().ToUpper()) == false)
                    {
                        grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, grdAuctionItemList.Columns[i].HeaderText)].Visible = false;
                    }
                }
            }
        }

        protected string WillOpenIn(DateTime openTime, DateTime closeTime, bool callList, Int64 auction_status_id)
        {
            TimeSpan span;
            string color = "black";
            if (auction_status_id == 32 || auction_status_id == 33 || auction_status_id == 34 || auction_status_id == 36 || auction_status_id == 41)
            {
                lblAvailableInDisp.Text = "";// "Auction Status";
                return "";// "Not Publish";
            }
            else if (_currentDateTime < openTime && (auction_status_id == 35 || auction_status_id == 42)) //35-Published/42-Published
            {
                span = openTime.Subtract(_currentDateTime);
                lblAvailableInDisp.Text = "Available In : ";
            }
            else if (auction_status_id == 35 || auction_status_id == 42) //35-Published/42-Published
            {
                lblAvailableInDisp.Text = "Auction Status : ";
                return "Published";
            }
            else if (_currentDateTime > openTime && _currentDateTime < closeTime && (auction_status_id == 37 || auction_status_id == 43)) // 37-Active/43- Live
            {
                lblAccept.Visible = false;
                lblRemarks.Visible = true;
                btnAccept.Visible = true;
                txtRemarks.Enabled = true;

                span = closeTime.Subtract(_currentDateTime);
                lblAvailableInDisp.Text = "Close In : ";
                color = "red";
            }
            else if (_currentDateTime > closeTime && (auction_status_id == 37 || auction_status_id == 43 || auction_status_id == 38 || auction_status_id == 39 || auction_status_id == 44))
            {
                btnAccept.Visible = false;
                lblRemarks.Visible = true;
                txtRemarks.Enabled = true;
                txtRemarks.Enabled = false;
                lblAccept.Visible = true;

                lblAvailableInDisp.Text = "";// "Closed";
                if (callList)
                {
                    return lblAvailableInDisp.Text;
                }
                else
                {
                    lblAvailableInDisp.Text = "";// "Auction Status";
                    return "";//"Closed";
                }
            }
            else if (auction_status_id == 40 || auction_status_id == 45)
            {
                lblAvailableInDisp.Text = "";// "Auction Status";
                return "";//"Discarded";
            }
            else
            {
                lblAvailableInDisp.Text = "";//"Auction Status";
                return "";//"Not Defined";
            }

            if (callList)
            {
                if (span.Days > 0)
                {
                    return "<span style='color:" + color + "';>" + lblAvailableInDisp.Text + "</span> (" + string.Format("{0} Days, {1} Hours, {2} Minutes", span.Days, span.Hours, span.Minutes) + ")";
                }
                else
                {
                    return "<span style='color:" + color + "';>" + lblAvailableInDisp.Text + "</span> (" + string.Format("{0} Hours, {1} Minutes", span.Hours, span.Minutes) + ")";
                }
            }
            else
            {
                if (span.Days > 0)
                {
                    hdfMin.Value = string.Format("{0}", span.Minutes);
                    hdfHour.Value = string.Format("{0}", span.Hours);
                    return string.Format("{0} Days, {1} Hrs, {2} Min, {3} Sec", span.Days, span.Hours, span.Minutes, span.Seconds);
                }
                else
                {
                    hdfMin.Value = string.Format("{0}", span.Minutes);
                    hdfHour.Value = string.Format("{0}", span.Hours);
                    return string.Format("{0} Hrs, {1} Min, {2} Sec", span.Hours, span.Minutes, span.Seconds);
                }
            }
        }

        private void FooterTotal()
        {
            decimal decBestBidTotal = 0;
            decimal decMyTotal = 0;
            decimal decMyTaxTotal = 0;
            decimal decMyFinalTotal = 0;
            for (int i = 0; i < grdAuctionItemList.Rows.Count; i++)
            {
                decBestBidTotal = decBestBidTotal + Convert.ToDecimal(_objUtility.ValidateDBNullEmptyValue(((Label)grdAuctionItemList.Rows[i].FindControl("lblBestBidTotal")).Text.Trim(), 0));
                decMyTotal = decMyTotal + Convert.ToDecimal(_objUtility.ValidateDBNullEmptyValue(((Label)grdAuctionItemList.Rows[i].FindControl("lblMyTotalValue")).Text.Trim(), 0));
                decMyTaxTotal = decMyTaxTotal + Convert.ToDecimal(_objUtility.ValidateDBNullEmptyValue(((Label)grdAuctionItemList.Rows[i].FindControl("lblMyTaxValue")).Text.Trim(), 0));
                decMyFinalTotal = decMyFinalTotal + Convert.ToDecimal(_objUtility.ValidateDBNullEmptyValue(((Label)grdAuctionItemList.Rows[i].FindControl("lblMyFinalTotalValue")).Text.Trim(), 0));
            }

            ((Label)grdAuctionItemList.FooterRow.FindControl("lblFooterBestBidTotal")).Text = string.Format("{0:N}", decBestBidTotal);
            ((Label)grdAuctionItemList.FooterRow.FindControl("lblFooterMyTotalValue")).Text = string.Format("{0:N}", decMyTotal);
            ((Label)grdAuctionItemList.FooterRow.FindControl("lblFooterMyTaxValue")).Text = string.Format("{0:N}", decMyTaxTotal);
            ((Label)grdAuctionItemList.FooterRow.FindControl("lblFooterMyFinalTotalValue")).Text = string.Format("{0:N}", decMyFinalTotal);

        }

        protected string NumberFormat(decimal value)
        {
            return string.Format("{0:N}", value);
        }

        private void Fill_Update_Detail_Control(string auctionId, bool gridAutorefresh)
        {
            _Detail_Control_Clear(gridAutorefresh);
            if (Convert.ToInt64(_objUtility.ValidateDBNullEmptyValue(auctionId, 0)) == 0)
            {
                return;
            }

            hdfAuctionId.Value = auctionId;
            //All Auction -39
            DataSet ds = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfAuctionId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                hdfAuctionTypeEnum_Id.Value = Convert.ToString(ds.Tables[0].Rows[0]["Auction_Type_Enum_Id"]);

                lblAuctionCode.Text = Convert.ToString(ds.Tables[0].Rows[0]["Auction_Code"]);
                lblAuctionName.Text = Convert.ToString(ds.Tables[0].Rows[0]["Auction_Name"]);
                lblOpenTime.Text = _objUtility.Convert_Date_Into_ddMMMyyyyhhmmsstt(Convert.ToDateTime(ds.Tables[0].Rows[0]["Open_Date_Time"]));

                DateTime openTime = Convert.ToDateTime(ds.Tables[0].Rows[0]["Open_Date_Time"]);
                DateTime closeTime = Convert.ToDateTime(ds.Tables[0].Rows[0]["Close_Date_Time"]);
                hdfOpenTime.Value = _objUtility.Convert_Date_Into_ddMMyyyyhhmmsstt(openTime);
                hdfCloseTime.Value = _objUtility.Convert_Date_Into_ddMMyyyyhhmmsstt(closeTime);

                string ExtendTime = ds.Tables[0].Rows[0]["Extend_Auction_In_Minutes"].ToString();
                string GracePeriod = ds.Tables[0].Rows[0]["Grace_Period_In_Minutes"].ToString();

                Int64 auction_status_id = (_objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == 14 || _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == 15) ? Convert.ToInt64(ds.Tables[0].Rows[0]["Status_Id_For_Party"]) : Convert.ToInt64(ds.Tables[0].Rows[0]["Action_Status_Id"]);
                lblAvailableInVal.Text = WillOpenIn(openTime, closeTime, false, auction_status_id);
                lblStatus.Text = (_objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == 14 || _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == 15) ? Convert.ToString(ds.Tables[0].Rows[0]["Status_Name_For_Party"]) : Convert.ToString(ds.Tables[0].Rows[0]["Status_Name"]);
                lblLiveTime.Text = _objUtility.Convert_Date_Into_ddMMyyyyhhmmsstt(_currentDateTime);

                DateTime CloseTimeNew = Convert.ToDateTime(closeTime);
                DateTime CloseTimeAddMin = CloseTimeNew.AddMinutes(Convert.ToInt64(3));

                if (hdfHour.Value == "0" && hdfMin.Value == ExtendTime)
                {
                    hdfUpdateCloseTime.Value = "1";
                }
                if (hdfUpdateCloseTime.Value == "1")
                {
                    DateTime CloseDateTime = Convert.ToDateTime(ds.Tables[0].Rows[0]["Close_Date_Time"]);
                    DateTime CloseTimeAddMinUpdate = CloseDateTime.AddMinutes(Convert.ToInt64(3));
                    lblCloseTime.Text = _objUtility.Convert_Date_Into_ddMMMyyyyhhmmsstt(CloseTimeAddMin);
                    hdfClosedTimeWithAddedMin.Value = Convert.ToString(CloseTimeAddMinUpdate);
                    ScriptManager.RegisterStartupScript(this, GetType(), "Current_Timer", "Current_Timer('" + hdfLastFocusControl.Value + "','" + _objUtility.Convert_Date_Into_ddMMyyyyhh24mmss(_currentDateTime) + "','" + _objUtility.Convert_Date_Into_ddMMyyyyhh24mmss(CloseTimeAddMin) + "');", true);
                }
                else
                {
                    hdfClosedTimeWithAddedMin.Value = Convert.ToString(ds.Tables[0].Rows[0]["Close_Date_Time"]);
                    lblCloseTime.Text = _objUtility.Convert_Date_Into_ddMMMyyyyhhmmsstt(Convert.ToDateTime(ds.Tables[0].Rows[0]["Close_Date_Time"]));
                    ScriptManager.RegisterStartupScript(this, GetType(), "Current_Timer", "Current_Timer('" + hdfLastFocusControl.Value + "','" + _objUtility.Convert_Date_Into_ddMMyyyyhh24mmss(_currentDateTime) + "','" + _objUtility.Convert_Date_Into_ddMMyyyyhh24mmss(closeTime) + "');", true);
                }

                if (ds.Tables[1].Rows.Count > 0)
                {
                    bool Is_NotAvailable = false;
                    if (gridAutorefresh == true && grdAuctionItemList.Rows.Count > 0 && grdAuctionItemList.Rows.Count == ds.Tables[1].Rows.Count)
                    {
                        for (int i = 0; i < grdAuctionItemList.Rows.Count; i++)
                        {
                            DataRow[] drData = ds.Tables[1].Select("Auction_Item_Link_Id='" + ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfAuctionItemLinkId")).Value + "'");
                            if (drData.Length == 0)
                            {
                                Is_NotAvailable = true;
                                break;
                            }

                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfRemark")).Value = Convert.ToString(drData[0]["Remarks"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfStatusId")).Value = Convert.ToString(drData[0]["Status_Id"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfItemName")).Value = Convert.ToString(drData[0]["Item_Name"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfItemCode")).Value = Convert.ToString(drData[0]["Item_Code"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfReservePrice")).Value = Convert.ToString(drData[0]["Reserve_Price"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfAttachmentFilePath1")).Value = Convert.ToString(drData[0]["Attachment_File_Path1"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfAttachmentFilePath2")).Value = Convert.ToString(drData[0]["Attachment_File_Path2"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfAttachmentFilePath3")).Value = Convert.ToString(drData[0]["Attachment_File_Path3"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfUnitName")).Value = Convert.ToString(drData[0]["Unit_Name"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfItemCategoryName")).Value = Convert.ToString(drData[0]["Item_Category_Name"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfItemSubCategoryName")).Value = Convert.ToString(drData[0]["Item_Sub_Category_Name"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfCMD")).Value = Convert.ToString(drData[0]["CMD"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfApplicableTaxInPercentage")).Value = Convert.ToString(drData[0]["Applicable_Tax_In_Percentage"]);

                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfQuantity")).Value = Convert.ToString(drData[0]["Quantity"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfBestBid")).Value = Convert.ToString(drData[0]["Best_Bid"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfStartPrice")).Value = Convert.ToString(drData[0]["Start_Price"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfMinimunChange")).Value = Convert.ToString(drData[0]["Minimum_Bid_Change"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfCushion")).Value = Convert.ToString(drData[0]["Bid_Cushion_Limit"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfMyUnitRate")).Value = Convert.ToString(drData[0]["My_Unit_Rate"]);
                            ((HiddenField)grdAuctionItemList.Rows[i].FindControl("hdfBestBidAuctionPartyLinkId")).Value = Convert.ToString(drData[0]["Best_Bid_Auction_Party_Link_Id"]);


                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblItemName")).Text = ((Label)grdAuctionItemList.Rows[i].FindControl("lblItemName")).ToolTip = Convert.ToString(drData[0]["Item_Name"]);
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblQuantity")).Text = NumberFormat(Convert.ToDecimal(drData[0]["Quantity"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblItemUnit")).Text = Convert.ToString(drData[0]["Unit_Name"]);
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblBestBid")).Text = NumberFormat(Convert.ToDecimal(drData[0]["Best_Bid"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblBestBidTotal")).Text = NumberFormat(Convert.ToDecimal(drData[0]["Best_Bid_Total"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblRank")).Text = Convert.ToString(drData[0]["Item_Bid_Rank"]);
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblMyUnitRate")).Text = NumberFormat(Convert.ToDecimal(drData[0]["My_Unit_Rate"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblMyTotalValue")).Text = NumberFormat(Convert.ToDecimal(drData[0]["My_Total_Value"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblMyTaxValue")).Text = NumberFormat(Convert.ToDecimal(drData[0]["My_Tax_Value"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblMyFinalTotalValue")).Text = NumberFormat(Convert.ToDecimal(drData[0]["My_Final_Total"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblStartPrice")).Text = NumberFormat(Convert.ToDecimal(drData[0]["Start_Price"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblMinimumBidChange")).Text = NumberFormat(Convert.ToDecimal(drData[0]["Minimum_Bid_Change"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblTaxPercentage")).Text = NumberFormat(Convert.ToDecimal(drData[0]["Applicable_Tax_In_Percentage"]));
                            ((Label)grdAuctionItemList.Rows[i].FindControl("lblBidCushionLimit")).Text = NumberFormat(Convert.ToDecimal(drData[0]["Bid_Cushion_Limit"]));

                            if (_objUtility.ValidateDBNullEmptyValue(hdfLastFocusControl.Value) == false)
                            {
                                if (hdfLastFocusControl.Value.ToUpper().Contains("_GRDAUCTIONITEMLIST_") && hdfLastFocusControl.Value.ToUpper().Contains("_TXTUNITRATE_"))
                                {
                                    string[] values = hdfLastFocusControl.Value.Split('_');

                                    if (values != null && values.Length > 0)
                                    {
                                        int rowid;
                                        if (int.TryParse(values[values.Length - 1], out rowid))
                                        {
                                            // ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                                            // return;
                                        }
                                    }
                                }
                            }

                        }
                    }
                    else
                    {
                        grdAuctionItemList.DataSource = ds.Tables[1];
                        grdAuctionItemList.DataBind();
                    }

                    if (Is_NotAvailable)
                    {
                        grdAuctionItemList.DataSource = ds.Tables[1];
                        grdAuctionItemList.DataBind();
                    }

                    FooterTotal();
                }

                if (ds.Tables[2].Rows.Count > 0)
                {
                    DataRow[] dr = ds.Tables[2].Select("Party_Id='" + _objManageUserSession.GetCurrentLogin_Primary_Id + "' AND Status_Id=" + true);
                    if (dr.Length > 0)
                    {
                        hdfAuctionPartyId.Value = Convert.ToString(dr[0]["Auction_Party_Link_Id"]);

                        if (Convert.ToBoolean(dr[0]["Is_Accept_Auction"]) == true)
                        {
                            hdfIsAcceptAuction.Value = "1";
                            btnAccept.Visible = false;
                            lblAccept.Visible = true;
                            lblAccept.Text = "Accepted";

                            lblRemarks.Visible = true;
                            txtRemarks.Visible = true;
                            txtRemarks.Enabled = false;
                            txtRemarks.Text = Convert.ToString(dr[0]["Accept_Remarks"]);

                            if (_objUtility.DateCompare(Convert.ToDateTime(ds.Tables[0].Rows[0]["Open_Date_Time"]), _currentDateTime) != 1 && _objUtility.DateCompare(Convert.ToDateTime(hdfClosedTimeWithAddedMin.Value), _currentDateTime) != -1 && Convert.ToInt64(ds.Tables[0].Rows[0]["Action_Status_Id"]) == 37)
                            {
                                hdfIsAutoUpdate.Value = "1";
                            }
                        }
                    }
                }

                if (hdfIsAutoUpdate.Value == "1" || auction_status_id == 38 || auction_status_id == 39 || auction_status_id == 40 || auction_status_id == 43 || auction_status_id == 44 || auction_status_id == 45)
                {
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "Best Bid")].Visible = true;
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "Best Bid Total")].Visible = true;
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "Rank")].Visible = true;
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "My Bid")].Visible = true;
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "My Total")].Visible = true;
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "My Tax")].Visible = true;
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "My Final Total")].Visible = true;
                }

                if (hdfIsAutoUpdate.Value == "1")
                {
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "Unit Rate")].Visible = true;
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "Bid")].Visible = true;
                    grdAuctionItemList.Columns[_objUtility.GetGridViewColumnIndexByHeaderText(grdAuctionItemList, "Lead")].Visible = true;
                }

                for (int i = 0; i < grdAuctionItemList.Rows.Count; i++)
                {
                    //if (hdfIsAutoUpdate.Value == "1" || auction_status_id == 38 || auction_status_id == 39 || auction_status_id == 40 || auction_status_id == 44 || auction_status_id == 45)
                    //{
                    //    grdAuctionItemList.Rows[i].FindControl("lnkBtnBidHistory").Visible = true;
                    //}
                    _objUtility.AssignButtonValidationGroup(grdAuctionItemList.Rows[i].FindControl("btnBid"), "Bid");
                    _objUtility.AssignButtonValidationGroup(grdAuctionItemList.Rows[i].FindControl("btnTakeLead"), "Take Lead");
                    ((LinkButton)grdAuctionItemList.Rows[i].FindControl("btnTakeLead")).Text = "";
                }
            }
        }

        private void BidEntry(object sender, Int32 rowid, string bidorTakeleadorAutobid)
        {
            // ((Label)grdAuctionItemList.Rows[rowid].FindControl("lblSrno")).BackColor = System.Drawing.Color.DarkCyan;
            // ((Label)grdAuctionItemList.Rows[rowid].FindControl("lblSrno")).ForeColor = System.Drawing.Color.White;

            if (_objUtility.ValidateDBNullEmptyValue(((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Text.Trim()))
            {
                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 6, "Unit Rate");
                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                return;
            }

            decimal decQty;
            if (decimal.TryParse(((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Text.Trim(), out decQty) == false)
            {
                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 31, "Unit Rate");
                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                return;
            }

            if (Convert.ToDecimal(((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Text.Trim()) == 0)
            {
                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 34, new string[] { "Unit Rate", "0" });
                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                return;
            }

            if (_objUtility.ValidateDBNullEmptyValue(hdfAuctionPartyId.Value))
            {
                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 19, "Party");
                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                return;
            }

            //All Auction -39
            DataSet ds = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfAuctionId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);

            decimal unitrate = Convert.ToDecimal(((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Text.Trim());
            decimal quantity = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfQuantity")).Value.Trim());
            decimal taxpercentage = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfApplicableTaxInPercentage")).Value.Trim());
            decimal total = Convert.ToDecimal(string.Format("{0:0.00}", unitrate * quantity));
            decimal taxamount = Convert.ToDecimal(string.Format("{0:0.00}", (total * taxpercentage) / 100));

            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Id", Value = hdfAuctionId.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Bid_Party_Id", Value = _objManageUserSession.GetCurrentLogin_Primary_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Source", Value = bidorTakeleadorAutobid.ToUpper() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Party_Item_Bid_Id", Value = 0 });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Party_Link_Id", Value = hdfAuctionPartyId.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Item_Link_Id", Value = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAuctionItemLinkId")).Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Quantity", Value = quantity });
            lstDBMapParam.Add(new DBMapParam() { Name = "Bid", Value = unitrate });

            lstDBMapParam.Add(new DBMapParam() { Name = "Total", Value = string.Format("{0:0.00}", total) });
            lstDBMapParam.Add(new DBMapParam() { Name = "Tax_Percentage", Value = taxpercentage });

            lstDBMapParam.Add(new DBMapParam() { Name = "Tax_Amount", Value = taxamount });

            lstDBMapParam.Add(new DBMapParam() { Name = "Final_Amount", Value = string.Format("{0:0.00}", total + taxamount) });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = 1 });

            lstDBMapParam.Add(new DBMapParam() { Name = "Action_User_Role_Id", Value = _objManageUserSession.GetCurrentUser_Role_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = DBNull.Value });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
            lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = MENU_CODE });

            lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = "BID ENTRY" });

            lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

            Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Auction_Bid", lstDBMapParam);

            if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
            {
                _objMessage.ShowMessage(sender, null, 64, "Item Bidded");
                Fill_Update_Detail_Control(hdfAuctionId.Value, false);
                return;
            }
            else
            {
                _objMessage.ShowMessage(sender, txtRemarks, 7, dictResult["OutputMessage"]);
                return;
            }
        }

        #endregion

        #region Grd Events
        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "View")
                {
                    int rowid = Convert.ToInt32(e.CommandArgument);
                    Fill_Update_Detail_Control(((HiddenField)grdData.Rows[rowid].FindControl("hdfAuctionId")).Value, false);
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

        #region Item Grid Events
        protected void grdAuctionItemList_PreRender(object sender, EventArgs e)
        {
            try
            {
                if (grdAuctionItemList.Rows.Count > 0)
                {
                    //Replace the <td> with <th> and adds the scope attribute
                    grdAuctionItemList.UseAccessibleHeader = true;

                    //Adds the <thead> and <tbody> elements required for DataTables to work
                    grdAuctionItemList.HeaderRow.TableSection = TableRowSection.TableHeader;

                    //Adds the <tfoot> element required for DataTables to work
                    grdAuctionItemList.FooterRow.TableSection = TableRowSection.TableFooter;
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

        protected void grdAuctionItemList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                //if (e.CommandName == "Bid")
                //{
                //    int rowid = Convert.ToInt32(e.CommandArgument);

                //    //BidEntry(sender, rowid, e.CommandName);
                //}
                //else
                if (e.CommandName == "Bid" || e.CommandName == "Take Lead")
                {
                    int rowid = Convert.ToInt32(e.CommandArgument);

                    decimal bid = 0;
                    decimal total = 0, taxamount = 0;

                    decimal quantity = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfQuantity")).Value.Trim());
                    decimal taxpercentage = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfApplicableTaxInPercentage")).Value.Trim());

                    decimal startprice = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfStartPrice")).Value);
                    decimal my_previous_bid = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfMyUnitRate")).Value);
                    decimal minimum_bid_changed = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfMinimunChange")).Value);
                    decimal bestbid = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfBestBid")).Value);
                    decimal cushion_limit = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfCushion")).Value);
                    decimal bestbid_auction_party_link_id = Convert.ToDecimal(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfBestBidAuctionPartyLinkId")).Value);

                    if (_objUtility.ValidateDBNullEmptyValueInList(hdfIsAcceptAuction.Value, true))
                    {
                        _objMessage.ShowMessage(sender, txtRemarks, 73);
                        txtRemarks.Focus();
                        return;
                    }

                    if (_currentDateTime < _objUtility.Convert_ddMMyyyyhhmmsstt_Into_DateTime(hdfOpenTime.Value))
                    {
                        _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 74);
                        ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                        return;
                    }

                    if (_currentDateTime > _objUtility.Convert_ddMMyyyyhhmmsstt_Into_DateTime(hdfCloseTime.Value))
                    {
                        _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 76);
                        ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                        return;
                    }

                    if (e.CommandName == "Bid")
                    {


                        if (_objUtility.ValidateDBNullEmptyValue(((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Text.Trim()))
                        {
                            _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 6, "Unit Rate");
                            ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                            return;
                        }

                        decimal decQty;
                        if (decimal.TryParse(((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Text.Trim(), out decQty) == false)
                        {
                            _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 31, "Unit Rate");
                            ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                            return;
                        }

                        decimal unitrate = Convert.ToDecimal(((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Text.Trim());

                        if (unitrate == 0)
                        {
                            _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 34, new string[] { "Unit Rate", "0" });
                            ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                            return;
                        }

                        //Current Bid Cannnot Less /Greater than Start Bid
                        if (hdfAuctionTypeEnum_Id.Value == "7")  // Forward
                        {
                            if (unitrate < startprice)
                            {
                                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 67);
                                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                                return;
                            }
                        }
                        else if (hdfAuctionTypeEnum_Id.Value == "8" || hdfAuctionTypeEnum_Id.Value == "9")  // 8-Reverse,9-Service
                        {
                            if (unitrate > startprice)
                            {
                                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 68);
                                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                                return;
                            }
                        }

                        //Current Bid Cannot Same as Previous Bid
                        if (unitrate == my_previous_bid)
                        {
                            _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 66);
                            ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                            return;
                        }

                        //Current Bid Cannnot Less /Greater than Previous Bid
                        if (hdfAuctionTypeEnum_Id.Value == "7")  // Forward
                        {
                            if (unitrate < my_previous_bid)
                            {
                                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 70);
                                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                                return;
                            }
                        }
                        else if (hdfAuctionTypeEnum_Id.Value == "8" || hdfAuctionTypeEnum_Id.Value == "9")  // 8-Reverse,9-Service
                        {
                            if (unitrate > my_previous_bid && my_previous_bid > 0)
                            {
                                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 69);
                                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                                return;
                            }
                        }


                        //Current Bid Cannnot Less /Greater than Previous Bid with minimum Changed Bid
                        if (hdfAuctionTypeEnum_Id.Value == "7")  // Forward
                        {
                            if (unitrate < (my_previous_bid + minimum_bid_changed) && my_previous_bid > 0)
                            {
                                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 71);
                                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                                return;
                            }
                        }
                        else if (hdfAuctionTypeEnum_Id.Value == "8" || hdfAuctionTypeEnum_Id.Value == "9")  // 8-Reverse,9-Service
                        {
                            if (unitrate > (my_previous_bid - minimum_bid_changed) && my_previous_bid > 0)
                            {
                                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 71);
                                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                                return;
                            }
                        }


                        //Current Bid Cannnot Less /Greater than Previous Bid with minimum Changed Bid
                        if (hdfAuctionTypeEnum_Id.Value == "7")  // Forward
                        {
                            if (unitrate > bestbid && unitrate < (bestbid + cushion_limit) && bestbid_auction_party_link_id != Convert.ToInt64(hdfAuctionPartyId.Value) && my_previous_bid > 0)
                            {
                                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 72);
                                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                                return;
                            }
                        }
                        else if (hdfAuctionTypeEnum_Id.Value == "8" || hdfAuctionTypeEnum_Id.Value == "9")  // 8-Reverse,9-Service
                        {
                            if (unitrate < bestbid && unitrate > (bestbid - cushion_limit) && bestbid_auction_party_link_id != Convert.ToInt64(hdfAuctionPartyId.Value) && my_previous_bid > 0)
                            {
                                _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 72);
                                ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                                return;
                            }
                        }


                        bid = Convert.ToDecimal(((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Text.Trim());
                    }
                    else if (e.CommandName == "Take Lead")
                    {
                        decimal my_previous_bid_with_minimum_bid_changed = 0;

                        if (my_previous_bid == 0)
                        {
                            my_previous_bid_with_minimum_bid_changed = startprice;
                        }
                        else if (my_previous_bid > 0)
                        {
                            if (hdfAuctionTypeEnum_Id.Value == "7")  // Forward
                            {
                                my_previous_bid_with_minimum_bid_changed = my_previous_bid + minimum_bid_changed;
                            }
                            else if (hdfAuctionTypeEnum_Id.Value == "8" || hdfAuctionTypeEnum_Id.Value == "9")  // 8-Reverse,9-Service
                            {
                                my_previous_bid_with_minimum_bid_changed = my_previous_bid - minimum_bid_changed;
                            }
                        }

                        if (bestbid == 0)
                        {
                            bid = startprice;
                        }
                        else
                        {
                            if (hdfAuctionTypeEnum_Id.Value == "7")  // Forward
                            {
                                if (bestbid > my_previous_bid_with_minimum_bid_changed)
                                {
                                    bid = bestbid + cushion_limit;
                                }
                                else
                                {
                                    if (bestbid_auction_party_link_id != Convert.ToInt64(hdfAuctionPartyId.Value))
                                    {
                                        bid = my_previous_bid_with_minimum_bid_changed + cushion_limit;
                                    }
                                    else
                                    {
                                        bid = my_previous_bid_with_minimum_bid_changed;
                                    }
                                }
                            }
                            else if (hdfAuctionTypeEnum_Id.Value == "8" || hdfAuctionTypeEnum_Id.Value == "9")  // 8-Reverse,9-Service
                            {
                                if (bestbid > my_previous_bid_with_minimum_bid_changed)
                                {
                                    if (bestbid_auction_party_link_id != Convert.ToInt64(hdfAuctionPartyId.Value))
                                    {
                                        bid = my_previous_bid_with_minimum_bid_changed - cushion_limit;
                                    }
                                    else
                                    {
                                        bid = my_previous_bid_with_minimum_bid_changed;
                                    }
                                }
                                else
                                {
                                    bid = bestbid - cushion_limit;
                                }
                            }
                        }
                    }

                    if (bid <= 0)
                    {
                        _objMessage.ShowMessage(sender, ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")), 65, "Current Bid");
                        ((TextBox)grdAuctionItemList.Rows[rowid].FindControl("txtUnitRate")).Focus();
                        return;
                    }

                    total = Convert.ToDecimal(string.Format("{0:0.00}", bid * quantity));
                    taxamount = Convert.ToDecimal(string.Format("{0:0.00}", (total * taxpercentage) / 100));

                    DataTable dtBid = CreateBid_Table();

                    DataRow drInfo = dtBid.NewRow();
                    drInfo["ItemGrid_RowId"] = rowid;
                    drInfo["CallFrom"] = e.CommandName;
                    drInfo["Item_Name"] = ((Label)grdAuctionItemList.Rows[rowid].FindControl("lblItemName")).Text;
                    drInfo["Quantity"] = quantity;
                    drInfo["Bid"] = bid;
                    drInfo["Total"] = total;
                    drInfo["Tax_Amount"] = taxamount;
                    drInfo["Final_Amount"] = string.Format("{0:0.00}", total + taxamount);

                    dtBid.Rows.Add(drInfo);

                    grdBidEntry.DataSource = dtBid;
                    grdBidEntry.DataBind();

                    mpeForBidEntry.Show();
                    hdfIs_ShowBidEntryPopUp.Value = "1";
                    if (e.CommandName == "Take Lead")
                    {
                        divTakeLead.Style["visibility"] = "visible";
                    }
                    else
                    {
                        divTakeLead.Style["visibility"] = "hidden";
                    }
                    // ((Label)grdAuctionItemList.Rows[rowid].FindControl("lblSrno")).BackColor = System.Drawing.Color.DarkCyan;
                    // ((Label)grdAuctionItemList.Rows[rowid].FindControl("lblSrno")).ForeColor = System.Drawing.Color.White;
                }
                else if (e.CommandName == "Bid History")
                {
                    int rowid = Convert.ToInt32(e.CommandArgument);

                    grdBidHistory.DataSource = _objMasterCollection.BindAuctionBid(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfAuctionId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, null, _objManageUserSession.GetCurrentLogin_Primary_Id, Convert.ToInt64(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAuctionItemLinkId")).Value), null, false);
                    grdBidHistory.DataBind();

                    mpeForBidHistory.Show();
                    hdfIs_ShowBidHistoryPopUp.Value = "1";
                }
                else if (e.CommandName == "View")
                {
                    int rowid = Convert.ToInt32(e.CommandArgument);

                    Clear_ItemDetail();

                    lblItemCategoryVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfItemCategoryName")).Value;
                    lblItemSubCategoryVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfItemSubCategoryName")).Value;
                    lblItemNameVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfItemName")).Value;
                    lblItemCodeVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfItemCode")).Value;

                    lblQuantityVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfQuantity")).Value;
                    lblUnitVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfUnitName")).Value;
                    lblItemDescriptionVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfItemDesc")).Value;
                    lblCMDVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfCMD")).Value;

                    lblReservePriceVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfReservePrice")).Value;
                    lblApplicableTaxVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfApplicableTaxInPercentage")).Value;
                    lblStartingPriceVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfStartPrice")).Value;
                    lblMinimumBidRangeVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfMinimunChange")).Value;

                    lblBidCushionRangeVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfCushion")).Value;
                    lblRemarksVal.Text = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfRemark")).Value;
                    //hdfAttachmentFilePath1

                    if (_objUtility.ValidateDBNullEmptyValue(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAttachmentFilePath1")).Value) == false
                        || _objUtility.ValidateDBNullEmptyValue(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAttachmentFilePath2")).Value) == false
                        || _objUtility.ValidateDBNullEmptyValue(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAttachmentFilePath3")).Value) == false)
                    {
                        divAttchmentDownload.Visible = true;
                        lnkBtnDownloadAttachment.CommandArgument = Convert.ToString(rowid);
                    }


                    mpeItemDetails.Show();
                    hdfIs_ShowItemPopup.Value = "1";
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

        protected void btnBid_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnTakeLead_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnItemDetailsClose_Click(object sender, EventArgs e)
        {
            try
            {
                mpeItemDetails.Hide();
                hdfIs_ShowItemPopup.Value = "0";
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void lnkBtnDownloadAttachment_Click(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValue(((LinkButton)sender).CommandArgument) == false)
                {
                    int rowid = Convert.ToInt32(((LinkButton)sender).CommandArgument);
                    List<DownloadFileSystem> lstFile = new List<DownloadFileSystem>();

                    if (_objUtility.ValidateDBNullEmptyValue(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAttachmentFilePath1")).Value) == false)
                    {
                        lstFile.Add(new DownloadFileSystem() { SavedFilePath = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAttachmentFilePath1")).Value });
                    }
                    if (_objUtility.ValidateDBNullEmptyValue(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAttachmentFilePath2")).Value) == false)
                    {
                        lstFile.Add(new DownloadFileSystem() { SavedFilePath = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAttachmentFilePath2")).Value });
                    }
                    if (_objUtility.ValidateDBNullEmptyValue(((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAttachmentFilePath3")).Value) == false)
                    {
                        lstFile.Add(new DownloadFileSystem() { SavedFilePath = ((HiddenField)grdAuctionItemList.Rows[rowid].FindControl("hdfAttachmentFilePath3")).Value });
                    }

                    if (lstFile.Count > 0)
                    {
                        _objFileSystem.DownloadFiles(lstFile, "ItemDetail_Attachment_" + _currentDateTime.Ticks);
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

        #endregion

        #region Bid Entry Grid Events
        protected void grdBidHistory_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grdBidHistory_PreRender(object sender, EventArgs e)
        {
            try
            {
                if (grdBidHistory.Rows.Count > 0)
                {
                    //Replace the <td> with <th> and adds the scope attribute
                    grdBidHistory.UseAccessibleHeader = true;

                    //Adds the <thead> and <tbody> elements required for DataTables to work
                    grdBidHistory.HeaderRow.TableSection = TableRowSection.TableHeader;

                    //Adds the <tfoot> element required for DataTables to work
                    grdBidHistory.FooterRow.TableSection = TableRowSection.TableFooter;
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

        protected void grdBidEntry_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grdBidEntry_PreRender(object sender, EventArgs e)
        {
            try
            {
                if (grdBidEntry.Rows.Count > 0)
                {
                    //Replace the <td> with <th> and adds the scope attribute
                    grdBidEntry.UseAccessibleHeader = true;

                    //Adds the <thead> and <tbody> elements required for DataTables to work
                    grdBidEntry.HeaderRow.TableSection = TableRowSection.TableHeader;

                    //Adds the <tfoot> element required for DataTables to work
                    grdBidEntry.FooterRow.TableSection = TableRowSection.TableFooter;
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

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                if (grdBidEntry.Rows.Count > 0)
                {
                    int itemgridrow_id = Convert.ToInt32(((HiddenField)grdBidEntry.Rows[0].FindControl("hdfItemGrid_RowId")).Value);

                    ((TextBox)grdAuctionItemList.Rows[itemgridrow_id].FindControl("txtUnitRate")).Text = ((Label)grdBidEntry.Rows[0].FindControl("lblBid")).Text;

                    BidEntry(sender, itemgridrow_id, ((HiddenField)grdBidEntry.Rows[0].FindControl("hdfCallFrom")).Value);

                    mpeForBidEntry.Hide();
                    hdfIs_ShowBidEntryPopUp.Value = "0";
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

        protected void btnCloseAuctionBid_Click(object sender, EventArgs e)
        {
            try
            {
                mpeForBidEntry.Hide();
                hdfIs_ShowBidEntryPopUp.Value = "0";
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void btnBidHistoryClose_Click(object sender, EventArgs e)
        {
            try
            {
                mpeForBidHistory.Hide();
                hdfIs_ShowBidHistoryPopUp.Value = "0";
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