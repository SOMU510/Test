using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text.RegularExpressions;
using System.IO;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Reflection;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Globalization;
using Telerik.Web.UI;

namespace YCS
{
    public class Utility
    {
        public const int CUSTOMER_DEFAULT_AGE = 18;
        public const string DEFAULT_CUSTOMER_NAME = "<Customer Name>";
        public const long WRONG_PASSWORD_ATTEMPT = 3;
        public const long WRONG_PASSWORD_ACCOUNT_RECOVER_HOUR = 1;
        public const string WRONG_PASSWORD_ATTEMPT_COOKIES = "AZy252c1468tsA_cookies";
        DataConnection dc = new DataConnection();
        public const int ProfilePictureDirectoryId = 0;
        public const int AdharCardFileDirectoryId = 1;
        public const int PanCardFileDirectoryId = 2;
        string[] dateFormats = { "yyyy-MM-dd", "yyyy/MM/dd" };
        Message _objMessage = new Message();
        public void UserErrorMessage(string screenname, Exception ex)
        {
            //UserMessageWithScriptManager("Some Problem Occurred. Please Contact Administrator");

            Exception_Log(screenname, ex);

            Message _objMessage = new Message();
            if (_objMessage.ReadExceptionFromDB(ex, null, null) == false)
            {
                _objMessage.ShowMessage(3);
            }


        }

        public void Exception_Log(string screenname, Exception ex)
        {
            new Logger().Error(screenname, ex);
        }

        public void UserTransactionErrorMessage(string screenname, Exception ex)
        {
            //UserMessageWithScriptManager("Status has been changed for selected record at another location. Please search again.");

            Exception_Log(screenname, ex);

            Message _objMessage = new Message();
            _objMessage.ShowMessage(38);
        }
        public int CalculateYourAge(DateTime Dob)
        {
            DateTime Now = DateTimeHandler.Get_Currentdate;
            int Years = new DateTime(DateTime.Now.Subtract(Dob).Ticks).Year - 1;
            DateTime PastYearDate = Dob.AddYears(Years);
            int Months = 0;
            for (int i = 1; i <= 12; i++)
            {
                if (PastYearDate.AddMonths(i) == Now)
                {
                    Months = i;
                    break;
                }
                else if (PastYearDate.AddMonths(i) >= Now)
                {
                    Months = i - 1;
                    break;
                }
            }
            int Days = Now.Subtract(PastYearDate.AddMonths(Months)).Days;
            int Hours = Now.Subtract(PastYearDate).Hours;
            int Minutes = Now.Subtract(PastYearDate).Minutes;
            int Seconds = Now.Subtract(PastYearDate).Seconds;
            //return String.Format("Age: {0} Year(s) {1} Month(s) {2} Day(s) {3} Hour(s) {4} Second(s)",
            //Years, Months, Days, Hours, Seconds);
            return Years;
        }
        public void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                ClearInputs(ctrl.Controls);
                if (ctrl is DropDownList)
                    ((DropDownList)ctrl).SelectedIndex = 0;
                ClearInputs(ctrl.Controls);
                if (ctrl is CheckBox)
                    ((CheckBox)ctrl).Checked = false;
                ClearInputs(ctrl.Controls);
                if (ctrl is RadioButtonList)
                    ((RadioButtonList)ctrl).SelectedIndex = -1;
                ClearInputs(ctrl.Controls);
                if (ctrl is RadioButton)
                    ((RadioButton)ctrl).Checked = false;
                ClearInputs(ctrl.Controls);
            }
        }

        public void Set_Zero_Textbox(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = "0";
                Set_Zero_Textbox(ctrl.Controls);

            }
        }
        public static List<string> GetImageExtensionList()
        {
            List<string> extList = new List<string>();

            extList.Add(".bmp");
            extList.Add(".gif");
            extList.Add(".png");
            extList.Add(".jpg");
            extList.Add(".jpeg");
            extList.Add(".pdf");

            return extList;
        }

        public string Upload_Temp_Image(FileUpload fileupload)
        {
            if (fileupload.HasFile)
            {
                if (!Utility.GetImageExtensionList().Contains(System.IO.Path.GetExtension(fileupload.FileName).ToLower()))
                {
                    Page page = HttpContext.Current.CurrentHandler as Page;

                    // Checks if the handler is a Page and that the script isn't allready on the Page
                    if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
                    {
                        string message = "Only Image file is allowed. Please load an image with an extention of one of the following: " + string.Join(",", Utility.GetImageExtensionList());
                        //string cleanMessage = message.Message.Replace("'", "\'");

                        string script = "<script type=text/javascript>alert('" + message + "');</script>";

                        ScriptManager.RegisterStartupScript(page, page.GetType(), "alertMessage", "alert('Only Image file is allowed. Please load an image with an extention of one of the following: " + string.Join(",", Utility.GetImageExtensionList()) + "');", true);
                        //page.ClientScript.RegisterClientScriptBlock(typeof(Utilily), "alert", script);  
                    }
                    return "";
                }
                Random rand = new Random();
                string fileName = DateTime.Now.Ticks + "-" + Guid.NewGuid().ToString() + rand.Next(40000);

                fileName = "~/Temp/" + fileName + Path.GetExtension(fileupload.FileName);
                fileupload.SaveAs(HttpContext.Current.Server.MapPath(fileName));
                return fileName;
            }

            return "";
        }

        private string GetDocumentDirectoryPath(string path, int DirectoryStructure_Id)
        {
            List<DBMapParam> param = new List<DBMapParam>();
            param.Add(new DBMapParam { Name = "DirectoryStructure_Id", Value = DirectoryStructure_Id });
            param.Add(new DBMapParam { Name = "DirectoryStructure_Status_Id", Value = 1 });
            //Akshay_Credit.Bal.DataConnection con = new DataConnection();
            DataTable dt = dc.GetDatatableSP("SP_Get_DirectoryStructurePathByStructureId", param);
            string str_path = dt.Rows[0]["DirectoryStructure_Path"].ToString();
            Random rand = new Random();
            string File_Name = DateTime.Now.Ticks + "-" + Guid.NewGuid().ToString() + rand.Next(40000);
            File_Name = File_Name + Path.GetExtension(path);
            string file_Serverpath = str_path + File_Name;
            return file_Serverpath;
        }

        private string MoveToServer(string path, int DirectoryStructure_Id)
        {
            if (path == null || path == "")
            {
                return "";
            }

            if (path.Contains("UserDocuments/"))
            {
                return path;
            }
            string file_Serverpath = GetDocumentDirectoryPath(path, DirectoryStructure_Id);
            System.IO.File.Copy(System.Web.HttpContext.Current.Server.MapPath(path), System.Web.HttpContext.Current.Server.MapPath(file_Serverpath));

            return file_Serverpath;
        }

        public string UploadProfilePicture(string path)
        {
            return MoveToServer(path, ProfilePictureDirectoryId);
        }

        public string UploadAdharcardFile(string path)
        {
            return MoveToServer(path, AdharCardFileDirectoryId);
        }

        public string UploadPanCardFile(string path)
        {
            return MoveToServer(path, PanCardFileDirectoryId);
        }

        public static void UserMessage(string message)
        {
            // Cleans the message to allow single quotation marks
            string cleanMessage = message.Replace("'", "\'");
            //string script = "<script type=text/javascript>alert('" + cleanMessage + "');</script>";
            string script = "<script type=text/javascript>Action_Alert('" + cleanMessage + "');</script>";

            // Gets the executing web page
            Page page = HttpContext.Current.CurrentHandler as Page;

            // Checks if the handler is a Page and that the script isn't allready on the Page
            if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
            {
                page.ClientScript.RegisterClientScriptBlock(typeof(Utility), "alert", script);
            }
        }

        public void SetControlFocus(string controlclientid)
        {
            Page page = HttpContext.Current.CurrentHandler as Page;

            // Checks if the handler is a Page and that the script isn't allready on the Page
            if (page != null)
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "SetControlFocusOn" + new Random().Next(40000), "SetControlFocus('" + controlclientid + "');", true);
            }
        }

        public bool ValidateDateTimeInDatatable(DataTable dtExcelData, Dictionary<string, bool> column_Names_IsMandatory, string[] dateTimeFormat, string[] KeywordsToIgnore = null)
        {
            bool isValid = true;
            bool IsInvalid = true;
            List<string> rows = new List<string>();
            DateTime validDate = new DateTime();

            for (int i = 0; i < dtExcelData.Rows.Count; i++)
            {
                foreach (KeyValuePair<string, bool> column in column_Names_IsMandatory)
                {
                    if (dtExcelData.Columns.Contains(column.Key))
                    {
                        IsInvalid = string.IsNullOrWhiteSpace(Convert.ToString((dtExcelData.Rows[i][column.Key])));
                        if (column.Value && IsInvalid)
                        {
                            rows.Add((i + 2).ToString());
                            isValid = false;
                            break;
                        }

                        if ((KeywordsToIgnore == null || !KeywordsToIgnore.Contains(dtExcelData.Rows[i][column.Key].ToString().Trim())) && !IsInvalid && (dtExcelData.Rows[i][column.Key].GetType() != typeof(DateTime)) && (!DateTime.TryParse(dtExcelData.Rows[i][column.Key].ToString(), out validDate)) && (!DateTime.TryParseExact(dtExcelData.Rows[i][column.Key].ToString(), dateTimeFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out validDate)))
                        {
                            rows.Add((i + 2).ToString());
                            isValid = false;
                            break;
                        }
                    }
                }
            }

            if (!isValid)
            {
                _objMessage.ShowMessage(28, new string[] { dateTimeFormat[0], string.Join(",", rows) });
            }

            return isValid;
        }



        //public string Send_Mail(string toAddress, string subject, string body)
        //{
        //    string msg = string.Empty;
        //    try
        //    {
        //        string Subject = subject,
        //        Body = body,
        //        ToEmail = toAddress;

        //        //-----------------------------------------------------------

        //        ////Running Code

        //        //MailMessage mObj = new MailMessage();
        //        //mObj.To.Add(toAddress);
        //        //mObj.From = new MailAddress("info@kalansh.com");
        //        //mObj.Subject = subject;
        //        //mObj.Body = body;
        //        //mObj.IsBodyHtml = true;
        //        //SmtpClient smtp = new SmtpClient();
        //        //smtp.Host = "mail.kalansh.com";//
        //        //smtp.UseDefaultCredentials = true;
        //        //smtp.Credentials = new
        //        //NetworkCredential("info@kalansh.com", "Ydi!2d28");
        //        //smtp.Send(mObj);
        //        //return "Send Message on your mail id !";

        //        //Running Code

        //        MailMessage mObj = new MailMessage();
        //        mObj.To.Add(toAddress);
        //        mObj.From = new MailAddress("info@wise-pri.in");
        //        mObj.Subject = subject;
        //        mObj.Body = body;
        //        //mailMsg.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(body, null, System.Net.Mime.MediaTypeNames.Text.Plain));
        //        mObj.IsBodyHtml = true;
        //        SmtpClient smtp = new SmtpClient();
        //        smtp.Host = "smtp.sendgrid.net";//
        //        smtp.Port = 587;//25//465;
        //        smtp.UseDefaultCredentials = true;
        //        smtp.Credentials = new
        //        NetworkCredential("apikey", "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");
        //        smtp.Send(mObj);
        //        return "Send Message on your mail id !";

        //        //--------------------------------------------------------------------

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public string Send_Mail(string toAddress, string subject, string body, Stream stream, string mimetype, string filename)
        //{
        //    string msg = string.Empty;
        //    try
        //    {
        //        //string Subject = subject,
        //        //Body = body,
        //        //ToEmail = toAddress;

        //        //MailMessage mObj = new MailMessage();
        //        //mObj.To.Add(toAddress);
        //        //mObj.From = new MailAddress("info@wise-pri.in");
        //        //mObj.Subject = subject;
        //        //mObj.Body = body;
        //        //mObj.IsBodyHtml = true;

        //        //Attachment obj = new Attachment(stream, mimetype);
        //        //obj.ContentDisposition.FileName = filename;

        //        //mObj.Attachments.Add(obj);
        //        //SmtpClient smtp = new SmtpClient();
        //        //smtp.Host = "mail.kalansh.com";//
        //        //smtp.UseDefaultCredentials = true;
        //        //smtp.Credentials = new
        //        //NetworkCredential("info@wise-pri.in", "11d2#oeM");
        //        //smtp.Send(mObj);
        //        //return "Send Message on your mail id !";


        //        MailMessage mObj = new MailMessage();
        //        mObj.To.Add(toAddress);
        //        mObj.From = new MailAddress("info@kalansh.com");
        //        mObj.Subject = subject;
        //        mObj.Body = body;
        //        //mailMsg.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(body, null, System.Net.Mime.MediaTypeNames.Text.Plain));
        //        mObj.IsBodyHtml = true;

        //        Attachment obj = new Attachment(stream, mimetype);
        //        obj.ContentDisposition.FileName = filename;
        //        mObj.Attachments.Add(obj);

        //        SmtpClient smtp = new SmtpClient();
        //        smtp.Host = "smtp.sendgrid.net";//
        //        smtp.Port = 587;//25//465;
        //        smtp.UseDefaultCredentials = true;
        //        smtp.Credentials = new
        //        NetworkCredential("apikey", "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");
        //        smtp.Send(mObj);
        //        return "Send Message on your mail id !";

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        public DataTable GeneratePassword(string password)
        {
            Security objSecurity = new Security();
            DataTable dt = new DataTable();

            dt.Columns.Add("LoginPasswordEncrypt");
            dt.Columns.Add("SaltValue");
            dt.Columns.Add("Password");
            if (password == null || password == "")
            {
                password = new RandomNumberGenerator().CreateRandomPassword(8);
            }

            byte[] salt = objSecurity.GenerateSalt();
            byte[] computehash = objSecurity.ComputeHash(password, salt);
            DataRow drow = dt.NewRow();
            drow["SaltValue"] = Convert.ToBase64String(salt);
            drow["LoginPasswordEncrypt"] = Convert.ToBase64String(computehash);
            drow["Password"] = password;
            dt.Rows.Add(drow);
            return dt;
        }

        public int GetGridViewColumnIndexByHeaderText(GridView GridViewData, string HeaderText)
        {
            for (int index = 0; index < GridViewData.Columns.Count; index++)
            {
                if (GridViewData.Columns[index].ToString() == HeaderText)
                {
                    return index;
                }
            }
            return -1;
        }

        public DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }

        //public void ImagePopUp(Akshay_Credit.UserControl.ImagePopup imgpopup, System.Web.UI.HtmlControls.HtmlGenericControl div, object control)
        //{
        //    ImageButton btn = (ImageButton)control;
        //    imgpopup.ShowPopUp(btn.AlternateText, btn.ImageUrl);
        //}

        public bool Is_Grid_CheckAll_Event(GridView grid, string checkboxallname)
        {
            string evttarget = HttpContext.Current.Request["__EVENTTARGET"];
            if (ValidateDBNullEmptyValue(evttarget) == false)
            {
                if (evttarget.Contains(grid.ID) && evttarget.Contains(checkboxallname))
                {
                    if (grid.HeaderRow?.FindControl(checkboxallname) != null)
                    {
                        ((CheckBox)grid.HeaderRow.FindControl(checkboxallname)).Checked = Convert.ToBoolean(HttpContext.Current.Request["__EVENTARGUMENT"]);
                        return true;
                    }
                }
            }

            return false;
        }

        public Control FindControl(Control parentcontrol, string childcontrolname)
        {
            Control control = null;
            string evttarget = HttpContext.Current.Request["__EVENTTARGET"];
            if (ValidateDBNullEmptyValue(evttarget) == false)
            {
                if ((parentcontrol == null || evttarget.Contains(parentcontrol.ID)) && evttarget.Contains(childcontrolname))
                {
                    Page page = HttpContext.Current.CurrentHandler as Page;
                    control = page.FindControl(evttarget);
                    if (ValidateDBNullEmptyValue(control))
                    {
                        control = null;
                    }
                }
            }

            return control;
        }

        public void Is_ValidBrowser()
        {
            System.Web.HttpBrowserCapabilities browser = HttpContext.Current.Request.Browser;
            string name = browser.Browser;
            string version = browser.Version;

            double version_result = 0;
            bool result = double.TryParse(version, out version_result);

            //float version = (float)(browser.MajorVersion + browser.MinorVersion);

            if ((name.ToUpper() != "IE" && name.ToUpper() != "INTERNETEXPLORER") || (result == false && Convert.ToDouble(version) < 8))
            {
                if (System.Configuration.ConfigurationManager.AppSettings["CheckBrowser"] == "1")
                {
                    HttpContext.Current.Response.Redirect("BrowserCompatible.aspx");
                }
            }
        }

        public void Page_Redirect()
        {
            // HttpContext.Current.Response.Redirect(HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath);
            HttpContext.Current.Response.Redirect(HttpContext.Current.Request.RawUrl);
        }

        public string GetCurrentURL
        {
            get
            {
                return HttpContext.Current.Request.Url.AbsoluteUri;
            }
        }
        public string GetCurrentRelativeURL
        {
            get
            {
                return HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath;
            }
        }

        //public string GetDomainName
        //{
        //    get
        //    {
        //        return HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/";
        //    }
        //}

        public bool IsValid_MobileNo(TextBox txtmobile, string additionalinfo = "Mobile", bool ismandatory = true)
        {
            bool status = IsValid_MobileNo(txtmobile, txtmobile.Text.Trim(), txtmobile.MaxLength, additionalinfo, ismandatory);

            if (status == false)
            {
                txtmobile.Focus();
            }

            return status;
        }

        public bool IsValid_MobileNo(TextBox txtmobile, string mobileno, int maxlength, string additionalinfo = "Mobile", bool ismandatory = true)
        {
            bool status = true;

            if (ismandatory == false)
            {
                if (mobileno == null || mobileno.Trim() == "")
                {
                    return true;
                }
            }

            if (mobileno == null || mobileno.Trim() == "")
            {
                status = false;
            }
            else if (mobileno.Trim().Length != maxlength || !mobileno.Trim().All(char.IsDigit))
            {
                status = false;
            }
            else
            {
                Regex reg = new Regex(@"^[6-9]\d{9}$");
                status = reg.IsMatch(mobileno.Trim());
            }

            if (status == false)
            {
                _objMessage.ShowMessage(null, txtmobile == null ? null : txtmobile, 12, additionalinfo);
            }
            return status;
        }

        public bool IsValid_MobileNo(string mobileno, int maxlength = 10)
        {
            bool status = true;

            if (mobileno == null || mobileno.Trim() == "")
            {
                status = false;
            }
            else if (mobileno.Trim().Length != maxlength || !mobileno.Trim().All(char.IsDigit))
            {
                status = false;
            }
            else
            {
                Regex reg = new Regex(@"^[6-9]\d{9}$");
                status = reg.IsMatch(mobileno.Trim());
            }

            return status;
        }

        public string Generate_OTP()
        {
            // declare array string to generate random numbers
            char[] charArr = "0123456789".ToCharArray();
            string otp = string.Empty;
            Random objran = new Random();
            int noofcharacters = 4;
            for (int i = 0; i < noofcharacters; i++)
            {
                //It will not allow Repetation of Characters
                int pos = objran.Next(1, charArr.Length);
                if (!otp.Contains(charArr.GetValue(pos).ToString()))
                    otp += charArr.GetValue(pos);
                else
                    i--;
            }

            return otp;
        }

        public bool IsValid_Email(string emailid)
        {
            // Return true if strIn is in valid e-mail format.
            return Regex.IsMatch(emailid, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }

        public bool IsValid_Email(TextBox txtemail, string additionalinfo = "", bool ismandatory = true)
        {
            if (ismandatory == false)
            {
                if (txtemail.Text.Trim() == "")
                {
                    return true;
                }
            }
            if (txtemail.Text.Trim() == "")
            {
                _objMessage.ShowMessage(null, txtemail, 29);
                txtemail.Focus();
                return false;
            }
            if (IsValid_Email(txtemail.Text.Trim()) == false)
            {
                _objMessage.ShowMessage(null, txtemail, 30, additionalinfo);
                txtemail.Focus();
                return false;
            }
            return true;
        }
        #region Date Format Functions
        public DateTime ConvertIntoDateNew(string date)
        {
            date = date.Replace("-", "/").Replace(".", "/");

            return DateTime.ParseExact(date, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        }

        public DateTime? ConvertIntoDateTime(string dateTime, string[] dateTimeFormat = null)
        {
            DateTime validDate = new DateTime();

            if (!ValidateDBNullEmptyValue(dateTime))
            {
                if (dateTimeFormat != null && dateTimeFormat.Length > 0 && DateTime.TryParseExact(dateTime, dateTimeFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out validDate))
                {
                    return validDate;
                }
                else if (DateTime.TryParse(dateTime, out validDate))
                {
                    return validDate;
                }
            }

            if (!IsValidDate(validDate))
            {
                return null;
            }
            return validDate;
        }
        public bool IsValid_Date(string date)
        {
            return Regex.IsMatch(date, @"^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$");
        }

        public bool IsValid_InputData(string date, string Validation_Regex)
        {
            return Regex.IsMatch(date, Validation_Regex);
        }

        public bool IsValidDate(DateTime? value)
        {
            if (value == new DateTime() || value == null || value.ToString().Trim() == "")
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public string GetURLForMobileWebView(string url, string login_Id = "", string token = "", Dictionary<string, string> queryString = null)
        {
            if (!string.IsNullOrEmpty(login_Id) && !string.IsNullOrEmpty(token))
            {
                if (url.Contains("?"))
                {
                    url = url + "&Login_Id=" + login_Id + "&Token=" + token;
                }
                else
                {
                    url = url + "?Login_Id=" + login_Id + "&Token=" + token;
                }
            }

            if (queryString != null)
            {
                foreach (KeyValuePair<string, string> kv in queryString)
                {
                    if (url.Contains("?"))
                    {
                        url = url + "&" + kv.Key + "=" + kv.Value;
                    }
                    else
                    {
                        url = url + "?" + kv.Key + "=" + kv.Value;
                    }
                }
            }
            return url;
        }

        public DateTime Convert_ddMMyyyy_Into_Date(string date)
        {
            date = date.Replace("-", "/").Replace(".", "/");
            date = date.Substring(0, 10);
            return DateTime.ParseExact(date, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        }

        public DateTime Convert_ddMMyyyy_Into_DateWithFirstDayOfMonth(string date)
        {
            date = date.Replace("-", "/").Replace(".", "/");
            date = date.Substring(0, 10);
            DateTime dt = DateTime.ParseExact(date, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            return dt.AddDays(1 - dt.Day);
        }

        public DateTime Convert_ddMMyyyyhhmmsstt_Into_DateTime(string date)
        {
            date = date.Replace("-", "/").Replace(".", "/");
            return DateTime.ParseExact(date, "dd/MM/yyyy hh:mm:ss tt", System.Globalization.CultureInfo.InvariantCulture);
        }

        public DateTime Convert_hhmmsstt_Into_DateTime(string date)
        {
            date = date.Replace("-", "/").Replace(".", "/");
            return DateTime.ParseExact(date, "hh:mm:ss tt", System.Globalization.CultureInfo.CurrentCulture);
        }
        public DateTime Convert_HHmmss_Into_DateTime(string Time)
        {
            return DateTime.ParseExact(Time, "HH:mm:ss", System.Globalization.CultureInfo.CurrentCulture);
        }
        public string Convert_Date_Into_ddMMyyyy(DateTime date)
        {
            return date.Day.ToString().PadLeft(2, '0') + "/" + date.Month.ToString().PadLeft(2, '0') + "/" + date.Year.ToString();
        }

        public string Convert_Date_Into_ddMMMyyyy(DateTime date)
        {
            return date.Day.ToString().PadLeft(2, '0') + "/" + CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(date.Month) + "/" + date.Year.ToString();
        }

        public string Convert_Date_Into_hhmmsstt(DateTime date)
        {
            var hour = date.Hour;
            var minute = date.Minute;
            var second = date.Second;

            var ampm = hour >= 12 ? "PM" : "AM";
            hour = hour % 12;
            hour = hour != 0 ? hour : 12; // the hour '0' should be '12'

            return hour.ToString().PadLeft(2, '0') + ":" + date.Minute.ToString().PadLeft(2, '0') + ":"+date.Second.ToString().PadLeft(2, '0') +" "+ (date.Hour >= 12 ? "PM" : "AM");
        }

        public string Convert_Date_Into_hh24mmss(DateTime date)
        {
            return date.Hour.ToString().PadLeft(2, '0') + ":" + date.Minute.ToString().PadLeft(2, '0') + ":" + date.Second.ToString().PadLeft(2, '0');
        }

        public string Convert_Date_Into_hhmmtt(DateTime date)
        {
            int hour = date.Hour;
            hour = hour % 12;
            hour = hour != 0 ? hour : 12; // the hour '0' should be '12'

            return hour.ToString().PadLeft(2, '0') + ":" + date.Minute.ToString().PadLeft(2, '0') + " " + (date.Hour >= 12 ? "PM" : "AM");
        }

        public string Convert_Into_yyyyMMdd(object dateTime, string[] dateTimeFormat)
        {
            string returnValue = string.Empty;
            DateTime validDate = new DateTime();

            if (!ValidateDBNullEmptyValue(dateTime))
            {
                if (DateTime.TryParseExact(dateTime.ToString(), dateTimeFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out validDate))
                {
                    returnValue = validDate.Year.ToString() + "-" + validDate.Month.ToString().PadLeft(2, '0') + "-" + validDate.Day.ToString().PadLeft(2, '0');
                }
                else if (DateTime.TryParse(dateTime.ToString(), out validDate))
                {
                    returnValue = validDate.Year.ToString() + "-" + validDate.Month.ToString().PadLeft(2, '0') + "-" + validDate.Day.ToString().PadLeft(2, '0');
                }

            }

            return returnValue;
        }

        public string Convert_Into_yyyyMMdd(DateTime dateTime)
        {
            string returnValue = "";

            if (!ValidateDBNullEmptyValue(dateTime))
            {
                returnValue = dateTime.Year.ToString() + "-" + dateTime.Month.ToString().PadLeft(2, '0') + "-" + dateTime.Day.ToString().PadLeft(2, '0');

            }
            return returnValue;
        }

        public string Convert_Into_yyyyMM01(object dateTime, string[] dateTimeFormat)
        {
            string returnValue = string.Empty;
            DateTime validDate = new DateTime();

            if (!ValidateDBNullEmptyValue(dateTime))
            {
                if (DateTime.TryParseExact(dateTime.ToString(), dateTimeFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out validDate))
                {
                    returnValue = validDate.Year.ToString() + "-" + validDate.Month.ToString().PadLeft(2, '0') + "-01";
                }
                else if (DateTime.TryParse(dateTime.ToString(), out validDate))
                {
                    returnValue = validDate.Year.ToString() + "-" + validDate.Month.ToString().PadLeft(2, '0') + "-01";
                }

            }

            return returnValue;
        }

        public DateTime? Convert_Into_Date_With_Nullable(object dateTime, string[] dateTimeFormat)
        {
            DateTime validDate = new DateTime();

            if (!ValidateDBNullEmptyValue(dateTime))
            {
                if (DateTime.TryParseExact(dateTime.ToString(), dateTimeFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out validDate))
                {
                    return validDate;
                }
                else if (DateTime.TryParse(dateTime.ToString(), out validDate))
                {
                    return validDate;
                }
            }

            if (validDate == new DateTime())
            {
                return null;
            }
            else
            {
                return validDate;
            }
        }

        public DateTime Convert_Into_Date(object dateTime, string[] dateTimeFormat)
        {
            DateTime validDate = new DateTime();

            if (!ValidateDBNullEmptyValue(dateTime))
            {
                if (DateTime.TryParseExact(dateTime.ToString(), dateTimeFormat, CultureInfo.InvariantCulture, DateTimeStyles.None, out validDate))
                {
                    return validDate;
                }
                else if (DateTime.TryParse(dateTime.ToString(), out validDate))
                {
                    return validDate;
                }
            }

            return validDate;
        }

        public string Convert_Date_Into_ddMMMyyyyhhmmsstt(DateTime date)
        {
            return Convert_Date_Into_ddMMMyyyy(date) + " " + Convert_Date_Into_hhmmsstt(date);   //date.ToString("dd/MM/yyyy hh:mm:ss tt");
        }

        public string Convert_Date_Into_ddMMyyyyhhmmsstt(DateTime date)
        {
            return Convert_Date_Into_ddMMyyyy(date) + " " + Convert_Date_Into_hhmmsstt(date);   //date.ToString("dd/MM/yyyy hh:mm:ss tt");
        }

        public string Convert_Date_Into_ddMMyyyyhh24mmss(DateTime date)
        {
            return Convert_Date_Into_ddMMyyyy(date) + " " + Convert_Date_Into_hh24mmss(date);   //date.ToString("dd/MM/yyyy hh:mm:ss tt");
        }

        public int DateCompare(DateTime fromdate, DateTime todate)
        {
            //0 - both value same
            //1 - first/from date greater than second/to date
            //-1 - first/from date less than second/to date

            return fromdate.CompareTo(todate);
        }

        public int DateCompare(string fromdate, string todate)
        {
            //0 - both value same
            //1 - first/from date greater than second/to date
            //-1 - first/from date less than second/to date

            return DateCompare(Convert_ddMMyyyy_Into_Date(fromdate), Convert_ddMMyyyy_Into_Date(todate));
        }

        public bool DateValidate(TextBox txtdate, string datelabeltext)
        {
            DateTime dateValue;
            if (txtdate.Text.Trim() == "")
            {
                _objMessage.ShowMessage(null, txtdate, 20, datelabeltext);
                txtdate.Focus();
                return false;
            }
            if (!DateTime.TryParseExact(txtdate.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dateValue))
            {
                _objMessage.ShowMessage(null, txtdate, 21, datelabeltext);
                txtdate.Focus();
                return false;
            }

            return true;
        }
        //_objMessage.ShowMessage(sender, txtPAN, 6, "Correct Pan Number");
        //txtPAN.Focus();
        public bool DateCompare(TextBox txtfromdate, TextBox txttodate, string fromlabeltext, string tolabeltext, bool fromdateEqualTotodate = true)
        {
            DateTime dateValue;
            if (txtfromdate.Text.Trim() == "")
            {
                _objMessage.ShowMessage(null, txtfromdate, 20, fromlabeltext);
                txtfromdate.Focus();
                return false;
            }
            if (!DateTime.TryParseExact(txtfromdate.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dateValue))
            {
                _objMessage.ShowMessage(null, txtfromdate, 21, fromlabeltext);
                txtfromdate.Focus();
                return false;
            }
            if (txttodate.Text.Trim() == "")
            {
                _objMessage.ShowMessage(null, txttodate, 20, tolabeltext);
                txttodate.Focus();
                return false;
            }
            if (!DateTime.TryParseExact(txttodate.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dateValue))
            {
                _objMessage.ShowMessage(null, txttodate, 21, tolabeltext);
                txttodate.Focus();
                return false;
            }
            int condition = -1;
            if (fromdateEqualTotodate)
            {
                condition = 0;
            }
            if (DateCompare(DateTime.ParseExact(txtfromdate.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture), DateTime.ParseExact(txttodate.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture)) > condition)
            {
                _objMessage.ShowMessage(null, txttodate, 34, new string[] { fromlabeltext, tolabeltext });
                txttodate.Focus();
                return false;
            }

            return true;
        }

        public bool CompareDocumentandFile(TextBox Document_Name, string DocumentPath, Image Image, string Document_NameText, string DocumentPathText, bool IsMandatory = true)
        {
            if (ValidateDBNullEmptyValue(Document_Name.Text.Trim()) && IsMandatory == true)
            {
                _objMessage.ShowMessage(null, Document_Name, 6, Document_NameText);
                Document_Name.Focus();
                return false;
            }
            if (ValidateDBNullEmptyValue(DocumentPath) && IsMandatory == true)
            {
                _objMessage.ShowMessage(null, Image, 57, DocumentPathText);
                Image.Focus();
                return false;
            }
            if (ValidateDBNullEmptyValue(Document_Name.Text.Trim()) && !ValidateDBNullEmptyValue(DocumentPath))
            {
                _objMessage.ShowMessage(null, Document_Name, 6, Document_NameText);
                Document_Name.Focus();
                return false;
            }
            if (!ValidateDBNullEmptyValue(Document_Name.Text.Trim()) && ValidateDBNullEmptyValue(DocumentPath))
            {
                _objMessage.ShowMessage(null, Image, 57, DocumentPathText);
                Image.Focus();
                return false;
            }

            return true;
        }

        #endregion

        public bool IsValidBankAccountNo(TextBox txtaccountno, bool isprintmessage, string message = "Bank Account No")
        {
            if (txtaccountno.Text.Trim() == "")
            {
                if (isprintmessage == true)
                {
                    _objMessage.ShowMessage(null, txtaccountno, 6, message);
                    txtaccountno.Focus();
                    return false;
                }

                return true;
            }

            if (txtaccountno.Text.Trim().Length < 9 || txtaccountno.Text.Trim().Length > 18)
            {
                _objMessage.ShowMessage(null, txtaccountno, 32, new string[] { "9", "18" });
                txtaccountno.Focus();

                return false;
            }
            decimal result;
            if (decimal.TryParse(txtaccountno.Text.Trim(), out result) == false)
            {
                _objMessage.ShowMessage(null, txtaccountno, 31, message);
                txtaccountno.Focus();

                return false;
            }

            return true;
        }

        public bool IsValidPAN(TextBox txtpan, bool isprintmessage, string message = "PAN No")
        {
            if (txtpan.Text.Trim() == "")
            {
                if (isprintmessage == true)
                {
                    _objMessage.ShowMessage(null, txtpan, 6, message);
                    txtpan.Focus();
                    return false;
                }

                return true;
            }

            if (txtpan.Text.Trim().Length != txtpan.MaxLength || txtpan.Text.Trim().Length != 10)
            {
                _objMessage.ShowMessage(null, txtpan, 33, new string[] { message, "10" });
                txtpan.Focus();

                return false;
            }

            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex("^[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}$");
            System.Text.RegularExpressions.Match match = regex.Match(txtpan.Text.Trim());

            if (match.Success == false)
            {
                _objMessage.ShowMessage(null, txtpan, 31, message);
                txtpan.Focus();

                return false;
            }

            return true;
        }

        public bool IsValidIFSC(TextBox txtifsc, bool isprintmessage, string message = "IFSC Code")
        {
            if (txtifsc.Text.Trim() == "")
            {
                if (isprintmessage == true)
                {
                    _objMessage.ShowMessage(null, txtifsc, 24, message);
                    txtifsc.Focus();
                }

                return false;
            }

            if (txtifsc.Text.Trim().Length != txtifsc.MaxLength || txtifsc.Text.Trim().Length != 11)
            {
                if (isprintmessage == true)
                {
                    _objMessage.ShowMessage(null, txtifsc, 33, new string[] { message, "10" });
                    txtifsc.Focus();
                }
                return false;
            }

            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex("^[A-Za-z0-9]{11}$");
            System.Text.RegularExpressions.Match match = regex.Match(txtifsc.Text.Trim());

            if (match.Success == false)
            {
                if (isprintmessage == true)
                {
                    _objMessage.ShowMessage(null, txtifsc, 31, message);
                    txtifsc.Focus();
                }
                return false;
            }

            return true;
        }


        public DataTable GetSelectedListItems(dynamic control)
        {
            DataTable dt = Get_SPTableFormat();
            foreach (ListItem item in control.Items)
            {
                if (item.Selected)
                {
                    AddRowToSpTable(dt, Convert.ToInt32(item.Value));
                }
            }
            return dt;
        }

        public string GetSelectedListItemsToString(dynamic control)
        {
            List<string> lstobj = new List<string>();

            foreach (ListItem item in control.Items)
            {
                if (item.Selected)
                {
                    lstobj.Add(item.Value);
                }
            }

            return string.Join(",", lstobj.ToArray());
        }

        public DataTable AddRowToSpTable(DataTable spTable, int rowData)
        {
            DataRow dr = spTable.NewRow();
            dr["Int_Data"] = rowData;
            spTable.Rows.Add(dr);
            return spTable;
        }

        public DataTable Get_SPTableFormat()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Int_Data");
            return dt;
        }

        public void AssignButtonValidationGroup(object control, string action, object focuscontrol = null, string validationgroup = "", bool issetbtntext = true, string eventname = "OnClick", object additionalinfo = null, int code = 9, bool ControlIconRequired = true)
        {
            _objMessage.AssignButtonValidationGroup(control, focuscontrol == null ? control : focuscontrol, action, validationgroup, issetbtntext, eventname, additionalinfo, code, ControlIconRequired);
        }


        public string GetFormattedStringToCompare(string input)
        {
            // return new string(input.ToCharArray().Where(c => !Char.IsWhiteSpace(c)).ToArray()).ToUpper();
            return Regex.Replace((ValidateDBNullEmptyValue(input, "").ToString()), @"\s+", " ").Trim().ToUpper();
        }

        public bool CompareTwoString(string str1, string str2)
        {
            return (GetFormattedStringToCompare(str1) == GetFormattedStringToCompare(str2));
        }


        public static string GarbageValidationGroup
        {
            get
            {
                return "AbYOtXzQLkd";
            }
        }

        private static string GarbageValidationActionGroup
        {
            get
            {
                return "AbYOtXzQLkdAtZy";
            }
        }

        public static Int64 DefaultIntegerValue
        {
            get
            {
                return -99;
            }
        }

        public bool ValidateDBNullEmptyValueInList(object value, bool listcontrolfirstdefaultitem = false)
        {
            if (ValidateDBNullEmptyValue(value))
            {
                return true;
            }
            else
            {
                if (listcontrolfirstdefaultitem && value.ToString().Trim() == "0")
                {
                    return true;
                }
                return false;
            }
        }

        public object ValidateDBNullEmptyValueInList(object value, object defaultvalue, object anothervalue = null, bool listcontrolfirstdefaultitem = false)
        {
            if (ValidateDBNullEmptyValue(value))
            {
                return defaultvalue;
            }
            else
            {
                if (anothervalue == null)
                {
                    return value;
                }
                else
                {
                    return anothervalue;
                }

            }
        }

        public bool ValidateDBNullEmptyValue(object value)
        {
            if (value == DBNull.Value || value == null || value.ToString().Trim() == "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public object ValidateDBNullEmptyValue(object value, object defaultvalue, object anothervalue = null)
        {
            if (ValidateDBNullEmptyValue(value))
            {
                return defaultvalue;
            }
            else
            {
                if (anothervalue == null)
                {
                    return value;
                }
                else
                {
                    return anothervalue;
                }

            }
        }

        public object FileValidateDBNullEmptyValue(object value, object defaultvalue)
        {
            if (typeof(List<string>) == value.GetType())
            {
                if (value == DBNull.Value || value == null)
                {
                    defaultvalue = "";
                }
            }
            else if (typeof(string) == value.GetType())
            {
                ValidateDBNullEmptyValue(value, defaultvalue);
            }

            if (ValidateDBNullEmptyValue(value))
            {
                return defaultvalue;
            }
            else
            {
                return value;
            }
        }

        public string GetUserIPAddress()
        {
            string ip = String.Empty;
            try
            {
                var context = System.Web.HttpContext.Current;
                if (context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
                    ip = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
                else if (!String.IsNullOrWhiteSpace(context.Request.UserHostAddress))
                    ip = context.Request.UserHostAddress;
                if (ip == "::1")
                    ip = "127.0.0.1";
                return ip;
            }
            catch (Exception ex)
            {
            }
            return ip;
        }

        public string GetExcelHeaderByValue(int value)
        {
            // To store result (Excel column name) 
            StringBuilder columnName = new StringBuilder();

            while (value > 0)
            {
                // Find remainder 
                int rem = value % 26;

                // If remainder is 0, then a  
                // 'Z' must be there in output 
                if (rem == 0)
                {
                    columnName.Append("Z");
                    value = (value / 26) - 1;
                }
                else // If remainder is non-zero 
                {
                    columnName.Append((char)((rem - 1) + 'A'));
                    value = value / 26;
                }
            }

            // Reverse the string and print result 
            char[] array = columnName.ToString().ToCharArray();
            Array.Reverse(array);
            return new string(array);
        }


        public string GetUserOS
        {
            get
            {
                // get a parser with the embedded regex patterns
                var uaParser = UAParser.Parser.GetDefault();
                if (ValidateDBNullEmptyValue(System.Web.HttpContext.Current.Request.UserAgent) || ValidateDBNullEmptyValue(uaParser))
                {
                    return null;
                }

                UAParser.ClientInfo c = uaParser.Parse(System.Web.HttpContext.Current.Request.UserAgent);

                if (ValidateDBNullEmptyValue(c))
                {
                    return null;
                }

                if (ValidateDBNullEmptyValue(c.OS))
                {
                    return null;
                }

                return "Family:" + ValidateDBNullEmptyValue(c.OS.Family, "") + " ,Major:" + ValidateDBNullEmptyValue(c.OS.Major, "") + " ,Minor:" + ValidateDBNullEmptyValue(c.OS.Minor, "") + " ,Patch:" + ValidateDBNullEmptyValue(c.OS.Patch, "") + " ,PatchMinor:" + ValidateDBNullEmptyValue(c.OS.PatchMinor, "");
            }
        }

        public string GetUserBrowserName
        {
            get
            {
                // get a parser with the embedded regex patterns
                var uaParser = UAParser.Parser.GetDefault();
                if (ValidateDBNullEmptyValue(System.Web.HttpContext.Current.Request.UserAgent) || ValidateDBNullEmptyValue(uaParser))
                {
                    return null;
                }

                UAParser.ClientInfo c = uaParser.Parse(System.Web.HttpContext.Current.Request.UserAgent);

                if (ValidateDBNullEmptyValue(c))
                {
                    return null;
                }

                if (ValidateDBNullEmptyValue(c.UA))
                {
                    return null;
                }

                return "Family:" + ValidateDBNullEmptyValue(c.UA.Family, "");
            }
        }

        public string GetUserBrowserVersion
        {
            get
            {
                // get a parser with the embedded regex patterns
                var uaParser = UAParser.Parser.GetDefault();
                if (ValidateDBNullEmptyValue(System.Web.HttpContext.Current.Request.UserAgent) || ValidateDBNullEmptyValue(uaParser))
                {
                    return null;
                }

                UAParser.ClientInfo c = uaParser.Parse(System.Web.HttpContext.Current.Request.UserAgent);

                if (ValidateDBNullEmptyValue(c))
                {
                    return null;
                }

                if (ValidateDBNullEmptyValue(c.UA))
                {
                    return null;
                }

                return "Major:" + ValidateDBNullEmptyValue(c.UA.Major, "") + " ,Minor:" + ValidateDBNullEmptyValue(c.UA.Minor, "") + " ,Patch:" + ValidateDBNullEmptyValue(c.UA.Patch, "");
            }
        }

        public bool IsValidPAN(string PAN_No, bool isMandatory)
        {
            if (string.IsNullOrEmpty(PAN_No.Trim()) && !isMandatory)
            {
                return true;
            }

            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex("^[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}$");
            System.Text.RegularExpressions.Match match = regex.Match(PAN_No.Trim());

            if (PAN_No.Trim().Length != 10 || !match.Success)
            {
                return false;
            }

            return true;
        }

        public bool IsValidEmail(string EmailId, bool isMandatory)
        {
            if (string.IsNullOrEmpty(EmailId.Trim()) && !isMandatory)
            {
                return true;
            }

            return Regex.IsMatch(EmailId, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }



        public struct DateTimeSpan
        {
            public int Years { get; }
            public int Months { get; }
            public int Days { get; }
            public int Hours { get; }
            public int Minutes { get; }
            public int Seconds { get; }
            public int Milliseconds { get; }

            public DateTimeSpan(int years, int months, int days, int hours, int minutes, int seconds, int milliseconds)
            {
                Years = years;
                Months = months;
                Days = days;
                Hours = hours;
                Minutes = minutes;
                Seconds = seconds;
                Milliseconds = milliseconds;
            }

            enum Phase { Years, Months, Days, Done }

            public static DateTimeSpan CompareDates(DateTime date1, DateTime date2)
            {
                if (date2 < date1)
                {
                    var sub = date1;
                    date1 = date2;
                    date2 = sub;
                }

                DateTime current = date1;
                int years = 0;
                int months = 0;
                int days = 0;

                Phase phase = Phase.Years;
                DateTimeSpan span = new DateTimeSpan();
                int officialDay = current.Day;

                while (phase != Phase.Done)
                {
                    switch (phase)
                    {
                        case Phase.Years:
                            if (current.AddYears(years + 1) > date2)
                            {
                                phase = Phase.Months;
                                current = current.AddYears(years);
                            }
                            else
                            {
                                years++;
                            }
                            break;
                        case Phase.Months:
                            if (current.AddMonths(months + 1) > date2)
                            {
                                phase = Phase.Days;
                                current = current.AddMonths(months);
                                if (current.Day < officialDay && officialDay <= DateTime.DaysInMonth(current.Year, current.Month))
                                    current = current.AddDays(officialDay - current.Day);
                            }
                            else
                            {
                                months++;
                            }
                            break;
                        case Phase.Days:
                            if (current.AddDays(days + 1) > date2)
                            {
                                current = current.AddDays(days);
                                var timespan = date2 - current;
                                span = new DateTimeSpan(years, months, days, timespan.Hours, timespan.Minutes, timespan.Seconds, timespan.Milliseconds);
                                phase = Phase.Done;
                            }
                            else
                            {
                                days++;
                            }
                            break;
                    }
                }

                return span;
            }
        }

        public bool Is_MobileView()
        {
            bool mob_device = System.Web.HttpContext.Current.Request.Browser.IsMobileDevice;

            string userAgent = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"];
            System.Text.RegularExpressions.Regex OS = new System.Text.RegularExpressions.Regex(@"(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino", System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Multiline);
            System.Text.RegularExpressions.Regex device = new System.Text.RegularExpressions.Regex(@"1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-", System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Multiline);
            string device_info = string.Empty;

            if (OS.IsMatch(userAgent))
            {
                device_info = OS.Match(userAgent).Groups[0].Value;
            }
            if (device.IsMatch(userAgent.Substring(0, 4)))
            {
                device_info += device.Match(userAgent).Groups[0].Value;
            }
            if (string.IsNullOrEmpty(device_info) && mob_device == false)
            {
                return false;
            }
            return true;
        }
        public void SetAllControlsProperty(Control control, EnumCollection.ControlProperty property, bool isEnabled)
        {
            Type[] inculdeTypes = new Type[] { typeof(TextBox), typeof(DropDownList), typeof(LinkButton), typeof(Button), typeof(RadTimePicker),typeof(RadDateTimePicker),typeof(RadioButton), typeof(CheckBox) };
            foreach (Control c in control.Controls)
            {
                // Get the Enabled property by reflection.
                Type type = c.GetType();
                if (inculdeTypes.Contains(type))
                {
                    PropertyInfo prop = type.GetProperty(property.ToString());

                    // Set it to False to disable the control.
                    if (prop != null)
                    {
                        prop.SetValue(c, isEnabled, null);
                    }
                }


                // Recurse into child controls.
                if (c.Controls.Count > 0)
                {
                    SetAllControlsProperty(c, property, isEnabled);
                }
            }
        }
    }
}
