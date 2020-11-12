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
    public partial class VendorList : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        public Utility _objUtility = new Utility();
        private const string MENU_CODE = "1013";
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

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
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

        #endregion

        #region Private Function

        private void _Control_Clear()
        {

        }
        private void _Bind_Control()
        {
            _objMasterCollection.FillStatus(ddlStatus, EnumCollection.StatusType.Party_Status, true);
            _objMasterCollection.FillAnyListFromEnum(ddlType, EnumCollection.EnumType.Party_Type, 1, true);
            DummyData();
        }
        private DataTable DummyData()
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
            dtColumn.Columns.Add("Status_Name");
            dtColumn.Columns.Add("Remarks");

            dtColumn.Rows.Add("1", "Vendor-1", "Test", "Test-company", "Test-Type", "7492039465", "VendorTest@gmail.com", "MP", "Indore", "801113", "Approve");
            dtColumn.Rows.Add("2", "Vendor-2", "Test-one", "Test-company", "Test-Type", "7492039452", "VendorTest1@gmail.com", "MP", "Indore", "807113", "Approve");
            grdData.DataSource = dtColumn;
            grdData.DataBind();
            return dtColumn;
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
                    string hdfVendorId = (((HiddenField)grdData.Rows[rowid].FindControl("hdfVendorId")).Value);
                    Session["VENDOR_ID"] = hdfVendorId;
                    Response.Redirect("VendorMaster.aspx");
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