using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YCS
{
    public partial class CustomError : System.Web.UI.Page
    {
        #region Global Variables
        Utility _objUtility = new Utility();

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               //Session.Abandon();
            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }
    }
}