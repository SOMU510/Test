using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using YCS;

namespace eAuction
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        #region Global Objects
        Utility _objUtility = new Utility();
        ManageUserSession _objManageUserSession = null;
        DBCommon _objDBCommon = new DBCommon();
        #endregion

        #region Page Events
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                _objUtility.Is_ValidBrowser();

                _objManageUserSession = new ManageUserSession();

                if (_objManageUserSession.GetCurrentUser_Menu_Right != null && _objManageUserSession.GetCurrentUser_Menu_Right.Rows.Count > 0)
                {

                    DataTable dtRoleMenu = _objManageUserSession.GetCurrentUser_Menu_Right;

                    string activemenu = "";
                    string parent_activemenu = "";
                    if (_objUtility.ValidateDBNullEmptyValue(Session["HOME_PAGE_ACTIVE_MENU_CODE"]) == false)
                    {
                        activemenu = Convert.ToString(Session["HOME_PAGE_ACTIVE_MENU_CODE"]);
                        DataRow[] drMenu = dtRoleMenu.Select("Menu_Internal_Code='" + activemenu + "'");
                        if (drMenu.Length > 0)
                        {
                            parent_activemenu = Convert.ToString(_objUtility.ValidateDBNullEmptyValue(drMenu[0]["Parent_Menu_Internal_Code"], ""));
                        }
                    }

                    List<Int64> lstParentMenu = new List<Int64>();

                    for (int i = 0; i < dtRoleMenu.Rows.Count; i++)
                    {
                        if (!lstParentMenu.Contains(Convert.ToInt64(dtRoleMenu.Rows[i]["Parent_Menu_Id1"])) && Convert.ToBoolean(dtRoleMenu.Rows[i]["Parent_Is_Viewable"]) == true)
                        {
                            lstParentMenu.Add(Convert.ToInt64(dtRoleMenu.Rows[i]["Parent_Menu_Id1"]));
                        }
                    }

                    for (int imenu = 0; imenu < lstParentMenu.Count; imenu++)
                    {
                        DataRow[] drData = dtRoleMenu.Select("Parent_Menu_Id1='" + lstParentMenu[imenu] + "'");

                        HtmlGenericControl liMenuName = new HtmlGenericControl("li");
                        if (Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue(drData[0]["Parent_Is_Clickable"], false)) == false)
                        {
                            liMenuName.Attributes["class"] = "treeview";
                            if (parent_activemenu == Convert.ToString(_objUtility.ValidateDBNullEmptyValue(drData[0]["Parent_Menu_Internal_Code"], "")))
                            {
                                liMenuName.Attributes["class"] = "treeview menu-open";
                            }
                        }

                        HtmlGenericControl anchorMenuName = new HtmlGenericControl("a");
                        if (parent_activemenu == Convert.ToString(_objUtility.ValidateDBNullEmptyValue(drData[0]["Parent_Menu_Internal_Code"], "")))
                        {
                            anchorMenuName.Style["background"] = "#054376c9";
                            anchorMenuName.Style["color"] = "white";
                            anchorMenuName.Style["border-left"] = "0px solid #ff4500";
                            anchorMenuName.Style["box-shadow"] = "3px 7px 20px #666";
                            anchorMenuName.Style["border-radius"] = "8px";
                        }

                        if (_objUtility.ValidateDBNullEmptyValue(drData[0]["Parent_Form_Relative_Path"]) == true)
                        {
                            anchorMenuName.Attributes["href"] = "#";
                        }
                        else
                        {
                            anchorMenuName.Attributes["href"] = _objUtility.ValidateDBNullEmptyValue(drData[0]["Parent_Form_Relative_Path"], "#").ToString();
                        }

                        HtmlGenericControl iMenuNameIcon = new HtmlGenericControl("i");
                        iMenuNameIcon.Attributes["class"] = _objUtility.ValidateDBNullEmptyValue(drData[0]["Parent_Menu_Icon"], "").ToString();

                        HtmlGenericControl spanMenuName = new HtmlGenericControl("span");
                        spanMenuName.InnerText = _objUtility.ValidateDBNullEmptyValue(drData[0]["Parent_Menu_Name"], "").ToString();

                        HtmlGenericControl iMenuNameCollapseIcon = new HtmlGenericControl("i");
                        iMenuNameCollapseIcon.Attributes["class"] = "glyphicon glyphicon-menu-left pull-right";

                        anchorMenuName.Controls.Add(iMenuNameIcon);
                        anchorMenuName.Controls.Add(spanMenuName);
                        if (Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue(drData[0]["Parent_Is_Clickable"], false)) == false)
                        {
                            anchorMenuName.Controls.Add(iMenuNameCollapseIcon);
                        }
                        liMenuName.Controls.Add(anchorMenuName);

                        bool existsubmenu = false;
                        HtmlGenericControl ulSubMenuName = new HtmlGenericControl("ul");

                        for (int i = 0; i < drData.Length; i++)
                        {
                            if (Convert.ToBoolean(_objUtility.ValidateDBNullEmptyValue(drData[i]["Parent_Menu_Id"])) == false && Convert.ToBoolean(drData[i]["Is_Viewable"]) == true)
                            {
                                if (existsubmenu == false)
                                {
                                    ulSubMenuName.Attributes["class"] = "treeview-menu";
                                }
                                existsubmenu = true;

                                HtmlGenericControl liSubMenuName = new HtmlGenericControl("li");
                                HtmlGenericControl anchorSubMenuName = new HtmlGenericControl("a");
                                if (_objUtility.ValidateDBNullEmptyValue(drData[i]["Form_Relative_Path"]) == true)
                                {
                                    anchorSubMenuName.Attributes["href"] = "#";
                                }
                                else
                                {
                                    anchorSubMenuName.Attributes["href"] = _objUtility.ValidateDBNullEmptyValue(drData[i]["Form_Relative_Path"], "#").ToString();
                                }

                                HtmlGenericControl iSubMenuName = new HtmlGenericControl("i");
                                iSubMenuName.Attributes["class"] = _objUtility.ValidateDBNullEmptyValue(drData[i]["Menu_Icon"], "").ToString();
                                HtmlGenericControl spanSubMenuName = new HtmlGenericControl("span");
                                spanSubMenuName.InnerText = _objUtility.ValidateDBNullEmptyValue(drData[i]["Menu_Name"], "").ToString();

                                if (activemenu == Convert.ToString(_objUtility.ValidateDBNullEmptyValue(drData[i]["Menu_Internal_Code"], "")))
                                {
                                    ulSubMenuName.Style["display"] = "block";
                                    anchorSubMenuName.Style["background-color"] = "DARKCYAN";
                                    anchorSubMenuName.Style["color"] = "white";
                                    anchorSubMenuName.Style["border-radius"] = "0px";
                                    iSubMenuName.Attributes["class"] = iSubMenuName.Attributes["class"].Replace(" text-aqua", "");
                                }

                                anchorSubMenuName.Controls.Add(iSubMenuName);
                                anchorSubMenuName.Controls.Add(spanSubMenuName);
                                liSubMenuName.Controls.Add(anchorSubMenuName);

                                ulSubMenuName.Controls.Add(liSubMenuName);
                            }
                        }
                        if (existsubmenu)
                        {
                            liMenuName.Controls.Add(ulSubMenuName);
                        }
                        divMenu.Controls.Add(liMenuName);
                    }
                }

                if (!IsPostBack && _objManageUserSession.GetCurrentUser_Firms_Right != null && _objManageUserSession.GetCurrentUser_Firms_Right.Rows.Count > 0)
                {
                    _objDBCommon.Bind_Control(ddl_Firmlist, _objManageUserSession.GetCurrentUser_Firms_Right, false, "Firm_Id", "Firm_Name");
                    if (ddl_Firmlist.Items.FindByValue(Convert.ToString(_objManageUserSession.GetCurrentUser_Firm_Id)) != null)
                    {
                        ddl_Firmlist.SelectedValue = Convert.ToString(_objManageUserSession.GetCurrentUser_Firm_Id);
                        // ddl_Firmlist.Visible = true;
                    }
                }

                lblUserName.Text = _objManageUserSession.GetCurrentUser_Name;
                lbl_Name.Text = _objManageUserSession.GetCurrentUser_RoleName + '|' + _objManageUserSession.GetCurrentUser_Name;


                if (_objManageUserSession.Get_Login_Device_Detail == 'M')
                {
                    mainHeader.Visible = false;
                    mainSidebar.Visible = false;
                    mainFooter.Visible = false;
                }
                else
                {
                    mainHeader.Visible = true;
                    mainSidebar.Visible = true;
                    mainFooter.Visible = true;
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

        protected void lnkBtnLogoBtn_Click(object sender, EventArgs e)
        {
            try
            {
                ApplicationConfig.RedirectToDefaultPage();
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }

        protected void ddl_Firmlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValueInList(ddl_Firmlist.SelectedValue, true) == false)
                {
                    _objDBCommon.Logout(_objManageUserSession);

                    string login_id = _objManageUserSession.GetCurrent_Login_Id;
                    Session.Clear();

                    LoginUserProfile objLoginUserProfile = new LoginUserProfile();
                    objLoginUserProfile.Login_Id = login_id;// _objManageUserSession.GetCurrent_Login_Id;
                    objLoginUserProfile.Login_Device = 'W';
                    objLoginUserProfile.Accessthrough = "Password";
                    objLoginUserProfile.Firm_Id = Convert.ToInt64(ddl_Firmlist.SelectedValue);
                    DataSet dsResult = _objDBCommon.Login_Authenticate(objLoginUserProfile);

                    if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count != 0 && dsResult.Tables[0].Rows[0]["OutputMessage"].ToString() == "SUCCESS")
                    {
                        ApplicationConfig.RedirectToDefaultPage();
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

        #endregion
    }
}