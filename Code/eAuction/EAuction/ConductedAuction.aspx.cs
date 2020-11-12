using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YCS;

namespace eAuction.EAuction
{
    public partial class ConductedAuction : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        protected ManageUserSession _objManageUserSession;
        protected Utility _objUtility = new Utility();
        private const string MENU_CODE = "1026";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        FileSystem _objFileSystem = new FileSystem();
        int ConductedAuctionStatus = 38;
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

        protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                _objMasterCollection.BindAuctionHighestBidItem(0, 0, Convert.ToInt64(ddlItem.SelectedValue), Convert.ToInt64(hdfAuctionId.Value), 1, grdAuctionItemList, false);
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

        private void _Bind_Control()
        {
            DataSet ds = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, 0, ConductedAuctionStatus, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, grdData);
        }

        private void _Control_Clear()
        {
            HideShowdiv(true, false);
        }

        private void HideShowdiv(bool AuctionList, bool AuctionDetails)
        {
            divAuctionList.Visible = AuctionList;
            divAuctionDetails.Visible = AuctionDetails;
        }


        private void _Detail_Control_Clear(bool gridAutorefresh)
        {
            divAuctionDetails.Visible = true;
            divAuctionList.Visible = false;
            lblAuctionCode.Text = "";
            lblAuctionName.Text = "";
            lblOpenTime.Text = "";
            lblCloseTime.Text = "";

            lblRemarks.Visible = true;
            txtRemarks.Enabled = false;

            //hdfAuctionId.Value = "0";
            txtRemarks.Enabled = true;
            txtRemarks.Text = "";
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


        #endregion

        #region Grid Events
        protected string NumberFormat(decimal value)
        {
            return string.Format("{0:N}", value);
        }
        private void DispalyDB_Data(string AuctionId)
        {
            hdfAuctionId.Value = AuctionId;
            //All Auction -39
            DataSet ds = _objMasterCollection.BindAuction(_objManageUserSession.GetCurrentUser_Firm_Id, Convert.ToInt64(hdfAuctionId.Value), 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);
            DataTable dtItem = ds.Tables[1];
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {

                lblAuctionCode.Text = Convert.ToString(ds.Tables[0].Rows[0]["Auction_Code"]);
                lblAuctionName.Text = Convert.ToString(ds.Tables[0].Rows[0]["Auction_Name"]);
                lblOpenTime.Text = _objUtility.Convert_Date_Into_ddMMMyyyyhhmmsstt(Convert.ToDateTime(ds.Tables[0].Rows[0]["Open_Date_Time"]));
                lblCloseTime.Text = _objUtility.Convert_Date_Into_ddMMMyyyyhhmmsstt(Convert.ToDateTime(ds.Tables[0].Rows[0]["Close_Date_Time"]));
                _objDBCommon.Bind_Control(ddlItem, dtItem, false, "Auction_Item_Link_Id", "Item_Name");
                _objMasterCollection.InsertListItem(ddlItem, 0);
                _objMasterCollection.BindAuctionHighestBidItem(0, 0, Convert.ToInt64(ddlItem.SelectedValue), Convert.ToInt64(hdfAuctionId.Value), 1, grdAuctionItemList, false);
            }
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
                if (e.CommandName == "View")
                {
                    int rowid = Convert.ToInt32(e.CommandArgument);
                    GridView rd = grdData;
                    hdfAuctionId.Value = ((HiddenField)grdData.Rows[rowid].FindControl("hdfAuctionId")).Value;
                    HideShowdiv(false, true);
                    DispalyDB_Data(hdfAuctionId.Value);
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
                if (e.CommandName == "View")
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

        protected void btnItemDetailsClose_Click(object sender, EventArgs e)
        {
            try
            {
                mpeItemDetails.Hide();
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

    }
}