using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YCS;

namespace eAuction
{
    public partial class WelcomeScreen : System.Web.UI.Page
    {
        #region Global Objects
        ManageUserSession _objManageUserSession;
        Utility _objUtilily = new Utility();
        private const string MENU_CODE = "1001";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["HOME_PAGE_ACTIVE_MENU_CODE"] = MENU_CODE;
                _objManageUserSession = new ManageUserSession(MENU_CODE, spanHeader, liMenuHeaderIcon);
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtilily.UserErrorMessage(this.ToString(), ex);
            }
        }

    }
}