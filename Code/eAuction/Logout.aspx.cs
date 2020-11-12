using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YCS;

namespace YCS
{
    public partial class Logout : System.Web.UI.Page
    {
        #region Global Objects
        Utility _objUtility = new Utility();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ManageUserSession objManageUserSession = new ManageUserSession();
                new DBCommon().Logout(objManageUserSession);
                Session.Abandon();
                ApplicationConfig.RedirectToLoginPage();

            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }


        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {
            ApplicationConfig.RedirectToLoginPage();
        }
    }
}