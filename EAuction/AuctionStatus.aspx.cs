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
    public partial class AuctionView : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        public Utility _objUtility = new Utility();
        private const string MENU_CODE = "1015";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        FileSystem _objFileSystem = new FileSystem();
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
            ClientParticipate("Participate");
            ClientBack("Back");
            divAuctionStatusList.Visible = true;
            divAuctionStatusView.Visible = false;
            divOtherDetails.Visible = true;
            lnkbtnOtherDetails.Visible = false;
            divVendorListForAdmin.Visible = false;
            divVendorListForClient.Visible = false;
        }

        private void _Bind_Control()
        {

            DummyData();
            DummyDataVendor();
            DummyDataVendorForClient();
        }

        private DataTable DummyData()
        {

            DataTable dtColumn = new DataTable();
            dtColumn.Columns.Add("Auction_Id");
            dtColumn.Columns.Add("Auction_Type");
            dtColumn.Columns.Add("Auction_Category");
            dtColumn.Columns.Add("Source");
            dtColumn.Columns.Add("Auction_Name");
            dtColumn.Columns.Add("Auction_StartDate");
            dtColumn.Columns.Add("Auction_EndDate");
            dtColumn.Columns.Add("Status_Name");
            dtColumn.Columns.Add("Remarks");

            dtColumn.Rows.Add("1", "Service", "Test-1", "Client-Name", "Auction_Test", "21/01/2020 5:06:49 PM", "22/01/2020 5:06:49 PM", "Active");
            grdData.DataSource = dtColumn;
            grdData.DataBind();
            return dtColumn;
        }

        private DataTable DummyDataVendor()
        {

            DataTable dtColumn = new DataTable();
            dtColumn.Columns.Add("Vendor_Id");
            dtColumn.Columns.Add("Name");
            dtColumn.Columns.Add("Designation_Name");
            dtColumn.Columns.Add("Company_Name");
            dtColumn.Columns.Add("Company_Type");
            dtColumn.Columns.Add("Mobile_No");
            dtColumn.Columns.Add("Email_Id");
            dtColumn.Columns.Add("State_Name");
            dtColumn.Columns.Add("City_Name");
            dtColumn.Columns.Add("Pincode");
            dtColumn.Columns.Add("Bidding_Price");
            dtColumn.Columns.Add("Status_Name");
            dtColumn.Columns.Add("Remarks");

            dtColumn.Rows.Add("1", "Vendor-1", "Test", "Test-company", "Test-Type", "7492039465", "VendorTest@gmail.com", "MP", "Indore", "801113", "100","Approve");
            dtColumn.Rows.Add("2", "Vendor-2", "Test-one", "Test-company2", "Test-Type2", "7492036452", "VendorTest2@gmail.com", "MP", "Indore", "807113", "200", "Approve");
            dtColumn.Rows.Add("2", "Vendor-3", "Test-one", "Test-company3", "Test-Type3", "9492039452", "VendorTest3@gmail.com", "MP", "Indore", "807113", "300", "Approve");
            dtColumn.Rows.Add("2", "Vendor-4", "Test-one", "Test-company4", "Test-Type4", "8492039452", "VendorTest4@gmail.com", "MP", "Indore", "807113", "500", "Approve");
            dtColumn.Rows.Add("2", "Vendor-5", "Test-one", "Test-company", "Test-Type5", "6492039452", "VendorTest5@gmail.com", "MP", "Indore", "807113", "800", "Approve");
            dtColumn.Rows.Add("2", "Vendor-6", "Test-one", "Test-company", "Test-Type6", "9492039452", "VendorTest6@gmail.com", "MP", "Indore", "807113", "1000", "Approve");
            dtColumn.Rows.Add("2", "Vendor-7", "Test-one", "Test-company", "Test-Type7", "7492039452", "VendorTest7@gmail.com", "MP", "Indore", "807113", "1500", "Approve");
            dtColumn.Rows.Add("2", "Vendor-8", "Test-one", "Test-company", "Test-Type8", "9492039452", "VendorTest8@gmail.com", "MP", "Indore", "807113", "1800", "Approve");
            dtColumn.Rows.Add("2", "Vendor-9", "Test-one", "Test-company", "Test-Type9", "8492000452", "VendorTest9@gmail.com", "MP", "Indore", "807113", "2000", "Approve");

            grdVendor.DataSource = dtColumn;
            grdVendor.DataBind();
            return dtColumn;
        }

        private DataTable DummyDataVendorForClient()
        {

            DataTable dtColumn = new DataTable();
            dtColumn.Columns.Add("Vendor_Id");
            dtColumn.Columns.Add("Name");
            dtColumn.Columns.Add("Designation_Name");
            dtColumn.Columns.Add("Company_Name");
            dtColumn.Columns.Add("Company_Type");
            dtColumn.Columns.Add("Mobile_No");
            dtColumn.Columns.Add("Email_Id");
            dtColumn.Columns.Add("State_Name");
            dtColumn.Columns.Add("City_Name");
            dtColumn.Columns.Add("Pincode");
            dtColumn.Columns.Add("Bidding_Price");
            dtColumn.Columns.Add("Status_Name");
            dtColumn.Columns.Add("Remarks");

            dtColumn.Rows.Add("1", "Vendor-1", "Test", "Test-company", "Test-Type", "7492039465", "VendorTest@gmail.com", "MP", "Indore", "801113", "500","Approve");
            dtColumn.Rows.Add("2", "Vendor-2", "Test-one", "Test-company2", "Test-Type2", "7492036452", "VendorTest2@gmail.com", "MP", "Indore", "807113", "800", "Approve");
            dtColumn.Rows.Add("3", "Vendor-3", "Test-one", "Test-company3", "Test-Type3", "9492039452", "VendorTest3@gmail.com", "MP", "Indore", "807113", "1000", "Approve");
            grdVendorListForClient.DataSource = dtColumn;
            grdVendorListForClient.DataBind();
            return dtColumn;
        }


        private void ClientParticipate(string action)
        {
            _objUtility.AssignButtonValidationGroup(btnParticipate, action);
        }

        private void ClientBack(string action)
        {
            _objUtility.AssignButtonValidationGroup(lnkbtnBack, action);
        }
        #endregion

        #region Show Hide Details

        protected void lnkbtnOtherDetails_Click(object sender, EventArgs e)
        {
            try
            {
                divOtherDetails.Visible = true;
                lnkbtnOtherDetails.Visible = false;
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }

        }

        protected void lnkbtnShowLessDetails_Click(object sender, EventArgs e)
        {
            try
            {
                divOtherDetails.Visible = false;
                lnkbtnOtherDetails.Visible = true;
            }

            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }

        }

        protected void lnkbtnShowVendorListForAdmin_Click(object sender, EventArgs e)
        {
            try
            {
                divVendorListForAdmin.Visible = true;
                lnkbtnShowVendorListForAdmin.Visible = false;
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }

        }

        protected void lnkbtnShowVendorListForClient_Click(object sender, EventArgs e)
        {
            try
            {
                divVendorListForClient.Visible = true;
                lnkbtnShowVendorListForClient.Visible = false;
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }

        }

        protected void lnkbtnHideVendorListForAdmin_Click(object sender, EventArgs e)
        {
            try
            {
                divVendorListForAdmin.Visible = false;
                lnkbtnShowVendorListForAdmin.Visible = true;
            }

            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }

        }

        protected void lnkbtnHideVendorListForClient_Click(object sender, EventArgs e)
        {
            try
            {
                divVendorListForClient.Visible = false;
                lnkbtnShowVendorListForClient.Visible = true;
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

        #region Participate And Clear Events

        /// <summary>
        /// Participate Button Click Event : It is used to save data.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnParticipate_Click(object sender, EventArgs e)
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

        #region Back Button Event
        protected void lnkbtnBack_Click(object sender, EventArgs e)
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
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int rowid = Convert.ToInt32(e.CommandArgument);
                if (e.CommandName == "View")
                {
                    divAuctionStatusList.Visible = false;
                    divAuctionStatusView.Visible = true;
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