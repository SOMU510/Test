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
    public partial class Dashboard : System.Web.UI.Page
    {
        #region Global Objects
        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        private const string MENU_CODE = "1012";
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        #endregion

        #region Page and Control Events
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["HOME_PAGE_ACTIVE_MENU_CODE"] = MENU_CODE;
                _objManageUserSession = new ManageUserSession(MENU_CODE, spanHeader, liMenuHeaderIcon);

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
        #endregion

        #region Private Methods
        private void _Bind_Control()
        {
            DataTable dt = _objMasterCollection.BindAuctionDashboard(_objManageUserSession.GetCurrentUser_Firm_Id, 0, _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id, _objManageUserSession.GetCurrentUser_Role_Id, _objManageUserSession.GetCurrentLogin_User_Id, _currentDateTime, _objManageUserSession.GetCurrentLogin_Primary_Id, null);


            dlDashBoard.DataSource = dt;
            dlDashBoard.DataBind();

            for (int i = 0; i < dlDashBoard.Items.Count; i++)
            {
                ((System.Web.UI.HtmlControls.HtmlGenericControl)dlDashBoard.Items[i].FindControl("divTodayAuction")).Attributes["onclick"] = "return Dashboard('" + ((HiddenField)dlDashBoard.Items[i].FindControl("hdfDashboardId")).Value + "');";
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "DataList_Width", "DataList_Width();", true);


            //hTodayAuction.InnerHtml = "0";
            //hPublishedAuction.InnerHtml = "0";
            //hLiveAuction.InnerHtml = "0";
            //hClosedAuction.InnerHtml = "0";
            //hAllAuction.InnerHtml = "0";

            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    if (Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) == 35)//TODAY_AUCTION
            //    {
            //        hTodayAuction.InnerHtml = Convert.ToString(dt.Rows[i]["No_Of_Auction"]);
            //        spanTodayAuction.InnerHtml = Convert.ToString(dt.Rows[i]["DashBoard_Name"]);
            //        if (Convert.ToInt64(dt.Rows[i]["No_Of_Auction"]) > 0)
            //        {
            //            divTodayAuction.Attributes["onclick"] = "return Dashboard('" + Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) + "');";
            //        }
            //    }
            //    else if (Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) == 36)//PUBLISHED
            //    {
            //        hPublishedAuction.InnerHtml = Convert.ToString(dt.Rows[i]["No_Of_Auction"]);
            //        spanPublishedAuction.InnerHtml = Convert.ToString(dt.Rows[i]["DashBoard_Name"]);
            //        if (Convert.ToInt64(dt.Rows[i]["No_Of_Auction"]) > 0)
            //        {
            //            divPublishedAuction.Attributes["onclick"] = "return Dashboard('" + Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) + "');";
            //        }
            //    }
            //    else if (Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) == 37)//LIVE
            //    {
            //        hLiveAuction.InnerHtml = Convert.ToString(dt.Rows[i]["No_Of_Auction"]);
            //        spanLiveAuction.InnerHtml = Convert.ToString(dt.Rows[i]["DashBoard_Name"]);
            //        if (Convert.ToInt64(dt.Rows[i]["No_Of_Auction"]) > 0)
            //        {
            //            divLiveAuction.Attributes["onclick"] = "return Dashboard('" + Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) + "');";
            //        }
            //    }
            //    else if (Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) == 38)//CLOSED
            //    {
            //        hClosedAuction.InnerHtml = Convert.ToString(dt.Rows[i]["No_Of_Auction"]);
            //        spanClosedAuction.InnerHtml = Convert.ToString(dt.Rows[i]["DashBoard_Name"]);
            //        if (Convert.ToInt64(dt.Rows[i]["No_Of_Auction"]) > 0)
            //        {
            //            divClosedAuction.Attributes["onclick"] = "return Dashboard('" + Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) + "');";
            //        }
            //    }
            //    else if (Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) == 39) //ALL_AUCTION
            //    {
            //        hAllAuction.InnerHtml = Convert.ToString(dt.Rows[i]["No_Of_Auction"]);
            //        spanAllAuction.InnerHtml = Convert.ToString(dt.Rows[i]["DashBoard_Name"]);
            //        if (Convert.ToInt64(dt.Rows[i]["No_Of_Auction"]) > 0)
            //        {
            //            divAllAuction.Attributes["onclick"] = "return Dashboard('" + Convert.ToInt64(dt.Rows[i]["DashBoard_Id"]) + "');";
            //        }
            //    }
            //}

        }
        #endregion

        protected void btnShowDashboardList_Click(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValue(hdfDashboardName.Value) == false)
                {
                    DataTable dt = _objMasterCollection.BindRoleDashboardRight(0, _objManageUserSession.GetCurrentUser_Firm_Id, _objManageUserSession.GetCurrentUser_Role_Id, EnumCollection.DashBoard.Auction_Dashboard.ToString(), Convert.ToInt64(hdfDashboardName.Value), 0, 1, null);

                    if (dt.Rows.Count > 0 && Convert.ToString(dt.Rows[0]["Dashboard_Type_Code"]) == EnumCollection.DashBoard.Auction_Dashboard.ToString())
                    {
                        _objManageUserSession.User_Clicks_Dashboard_Id = hdfDashboardName.Value;
                        Response.Redirect("AuctionStatusPartyWise.aspx");
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
    }
}