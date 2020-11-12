using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Configuration;
/// <summary>
/// Summary description for Logger
/// </summary>
/// 
namespace YCS
{
    public class Logger
    {
        public void Error(string screen_name, Exception exception, object addtional_message = null)
        {
            try
            {
                ManageUserSession objManageUserSession = new ManageUserSession(false);
                DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
                Utility objUtility = new Utility();
                MasterCollection _objMasterCollection = new MasterCollection();
                Int64 userId = 0;
                Int64 UserLoginSessionId = 0;
                string menuname = "";
                System.IO.StreamWriter sw = null;
                try
                {

                    Page page = HttpContext.Current.CurrentHandler as Page;
                    System.Web.UI.HtmlControls.HtmlGenericControl control = (System.Web.UI.HtmlControls.HtmlGenericControl)page?.FindControl("spanHeader");

                    if (control == null)
                    {
                        control = (System.Web.UI.HtmlControls.HtmlGenericControl)page?.Master?.FindControl("ContentPlaceHolder1")?.FindControl("spanHeader");
                    }
                    if (control != null)
                    {
                        menuname = control.InnerText;
                    }

                    if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("~/Logs")))
                    {
                        System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/Logs"));
                    }

                    string filepath = HttpContext.Current.Server.MapPath("~/Logs/Log_" + DateTime.Now.Day + "_" + DateTime.Now.Month + "_" + DateTime.Now.Year + ".txt");


                    if (!System.IO.File.Exists(filepath))
                    {
                        sw = System.IO.File.CreateText(filepath);
                    }
                    else
                    {
                        sw = System.IO.File.AppendText(filepath);
                    }

                    sw.WriteLine("Menu Name :-" + menuname + "   ,Screen Name :- " + screen_name + "  ,Date Time :- " + DateTime.Now);
                    if (objManageUserSession.Get_LoginTable != null)
                    {
                        sw.WriteLine("Employee Name :- " + objManageUserSession.GetCurrentUser_Name + "  ,Role :- " + objManageUserSession.GetCurrentUser_RoleName);
                        userId = objManageUserSession.GetCurrentLogin_User_Id;
                        UserLoginSessionId = objManageUserSession.GetCurrentUser_LoginSessionId;

                    }
                    else
                    {
                        sw.WriteLine("Before Login error.");
                    }

                    sw.WriteLine("=============");
                    sw.WriteLine(exception.ToString());
                    sw.WriteLine("==========================XXXXXXXXXXXXXXXXXXXXX==========================");
                    sw.WriteLine("  ");
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    if (sw != null)
                    {
                        sw.Flush();
                        sw.Close();
                    }
                }
                //try
                //{
                //    if (objUtility.ValidateDBNullEmptyValue(ConfigurationManager.AppSettings["InsertException"], "false").ToString().ToUpper() == "TRUE")
                //    {
                //        _objMasterCollection.InsertException(0, screen_name, exception.Message, exception.StackTrace, exception.ToString(), objUtility.GetCurrentURL, 29, null, null, EmployeeId, _currentDateTime, UserLoginSessionId, null, null, null, null, menuname, "", null);
                //    }

                //}
                //catch (Exception ex)
                //{

                //}
            }

            catch (Exception ex)
            {

            }
        }
    }
}