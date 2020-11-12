using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Net.Mime;
using System.Data;
using System.IO;


/// <summary>
/// Summary description for Notification
/// </summary>
/// 
namespace YCS
{
    public class Notification
    {
        #region Global Variables

        Logger _objLogger = new Logger();
        DataConnection _objDataConnection = new DataConnection();
        Utility _objUtility = new Utility();
        ManageUserSession _objUserSession = new ManageUserSession(false);
        CustomAppSetting _objCustomAppSetting = new CustomAppSetting();
        DateTime _CurrentDateTime = DateTimeHandler.Get_Currentdate;

        #endregion

        #region Email Public Methods

        public void SendMail(string[] toEmailIds, string subject, string body, bool throwException = true, string[] ccEmailIds = null, string[] bccEmailIds = null, string fromEmailId = "", bool isBodyHtml = true, string[] attachmentPaths = null, string imagePathToEmbed = "")
        {
            if (_objCustomAppSetting.Is_Mail_Allowed)
            {

                MailMessage mObj = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                try
                {
                    mObj.From = new MailAddress(Convert.ToString(_objUtility.ValidateDBNullEmptyValue(fromEmailId, _objCustomAppSetting.FromMailAddress)));
                    if (toEmailIds != null && toEmailIds.Length > 0)
                    {
                        foreach (string toEmail in toEmailIds)
                        {
                            if (!string.IsNullOrEmpty(toEmail.Trim()) && (_objCustomAppSetting.AllowEmailIds.Contains(toEmail.Trim().ToLower()) || !_objCustomAppSetting.IgnoreDomainNames.Contains(new MailAddress(toEmail.Trim().ToLower()).Host)))
                            {
                                mObj.To.Add(toEmail.Trim());
                            }
                        }
                    }

                    if (ccEmailIds != null && ccEmailIds.Length > 0)
                    {
                        foreach (string ccEmail in ccEmailIds)
                        {
                            if (!string.IsNullOrEmpty(ccEmail.Trim()) && (_objCustomAppSetting.AllowEmailIds.Contains(ccEmail.Trim().ToLower()) || !_objCustomAppSetting.IgnoreDomainNames.Contains(new MailAddress(ccEmail.Trim().ToLower()).Host)))
                            {
                                mObj.CC.Add(ccEmail.Trim());
                            }
                        }
                    }

                    if (bccEmailIds != null && bccEmailIds.Length > 0)
                    {
                        foreach (string bccEmail in bccEmailIds)
                        {
                            if (!string.IsNullOrEmpty(bccEmail.Trim()) && (_objCustomAppSetting.AllowEmailIds.Contains(bccEmail.Trim().ToLower()) || !_objCustomAppSetting.IgnoreDomainNames.Contains(new MailAddress(bccEmail.Trim().ToLower()).Host)))
                            {
                                mObj.Bcc.Add(bccEmail.Trim());
                            }
                        }
                    }

                    if (!string.IsNullOrEmpty(imagePathToEmbed.Trim()))
                    {
                        mObj.AlternateViews.Add(getEmbeddedImage(imagePathToEmbed));
                    }

                    mObj.Subject = subject;
                    mObj.Body = body;
                    mObj.IsBodyHtml = isBodyHtml;
                    if (attachmentPaths != null && attachmentPaths.Length > 0)
                    {
                        foreach (string file in attachmentPaths)
                        {
                            if (!string.IsNullOrEmpty(file.Trim()))
                            {
                                mObj.Attachments.Add(new Attachment(Path.IsPathRooted(file.Trim()) ? file.Trim() : HttpContext.Current.Server.MapPath(file.Trim())));
                            }
                        }
                    }

                    smtp.Host = _objCustomAppSetting.SmtpHost;
                    smtp.Port = _objCustomAppSetting.SmtpPort;
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = new NetworkCredential(_objCustomAppSetting.NetworkCredentialUserName, _objCustomAppSetting.NetworkCredentialPassword);
                    //smtp.EnableSsl = true;           
                    smtp.Send(mObj);

                }
                catch (Exception ex)
                {
                    _objLogger.Error(this.ToString(), ex);
                    if (throwException)
                    {
                        throw ex;
                    }

                }
                finally
                {
                    mObj.Attachments.Dispose();
                    mObj.Dispose();
                    smtp.Dispose();
                }
            }
        }

        public Int64 EnqueueMail(string[] toEmailIds, string[] ccEmailIds, string[] bccEmailIds, string subject, string body, string From_Screen, string From_Menu_Code, string fromEmailId = "", bool isBodyHtml = true, DateTime? scheduledStartOn = null, DateTime? scheduledEndOn = null, string remarks = "", string[] attachmentPaths = null, string imagePathToEmbed = "")
        {
            if (_objCustomAppSetting.Is_Enqueue_Mail_In_DB)
            {
                List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
                lstDBMapParam.Add(new DBMapParam() { Name = "Notification_Id", Value = 0, ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.BigInt, Size = 1024 });
                lstDBMapParam.Add(new DBMapParam() { Name = "Notification_Type", Value = Notification_Type.EMAIL.ToString() });
                lstDBMapParam.Add(new DBMapParam() { Name = "From_Email_Id", Value = _objUtility.ValidateDBNullEmptyValue(fromEmailId, _objCustomAppSetting.FromMailAddress) });
                lstDBMapParam.Add(new DBMapParam() { Name = "To_Email_Ids", Value = toEmailIds != null && toEmailIds.Length > 0 ? string.Join("|", toEmailIds) : "" });
                lstDBMapParam.Add(new DBMapParam() { Name = "Cc_Email_Ids", Value = ccEmailIds != null && ccEmailIds.Length > 0 ? string.Join("|", ccEmailIds) : "" });
                lstDBMapParam.Add(new DBMapParam() { Name = "Bcc_Email_Ids", Value = bccEmailIds != null && bccEmailIds.Length > 0 ? string.Join("|", bccEmailIds) : "" });
                lstDBMapParam.Add(new DBMapParam() { Name = "Email_Subject", Value = subject });
                lstDBMapParam.Add(new DBMapParam() { Name = "Email_Body", Value = body });
                lstDBMapParam.Add(new DBMapParam() { Name = "IsBodyHtml", Value = isBodyHtml });
                lstDBMapParam.Add(new DBMapParam() { Name = "Attachment_Paths", Value = attachmentPaths != null && attachmentPaths.Length > 0 ? string.Join("|", attachmentPaths) : "" });
                lstDBMapParam.Add(new DBMapParam() { Name = "Image_Path_To_Embed", Value = imagePathToEmbed });
                lstDBMapParam.Add(new DBMapParam() { Name = "Mobile_No", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Mobile_Message", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Notification_ScheduledOn_Start_Date", Value = _objUtility.ValidateDBNullEmptyValue(scheduledStartOn, _CurrentDateTime) });
                lstDBMapParam.Add(new DBMapParam() { Name = "Notification_ScheduledOn_End_Date", Value = _objUtility.ValidateDBNullEmptyValue(scheduledEndOn, DBNull.Value) });
                lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = remarks });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedOn_Date", Value = _CurrentDateTime });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedFrom_Screen", Value = From_Screen });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedFrom_Menu_Code", Value = From_Menu_Code });
                if (_objUserSession != null && _objUserSession.Get_LoginTable != null && _objUserSession.Get_LoginTable.Rows.Count > 0)
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginUserId", Value = _objUserSession.GetCurrentLogin_User_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginSessionId", Value = _objUserSession.GetCurrentUser_LoginSessionId });
                }
                else
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginUserId", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginSessionId", Value = DBNull.Value });
                }

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_Insert_Notification", lstDBMapParam);
                return Convert.ToInt64(_objUtility.ValidateDBNullEmptyValue(dictResult["Notification_Id"], 0));
            }

            return 0;
        }

        public void EnqueueMail(List<MailRequest> _objMailRequestCollection, string From_Screen, string From_Menu_Code)
        {
            if (_objCustomAppSetting.Is_Enqueue_Mail_In_DB)
            {
                List<DBMapParam> lstDBMapParam = new List<DBMapParam>();

                lstDBMapParam.Add(new DBMapParam() { Name = "Notification", Value = GetDataTableFromMailRequestObject(_objMailRequestCollection) });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedOn_Date", Value = _CurrentDateTime });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedFrom_Screen", Value = From_Screen });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedFrom_Menu_Code", Value = From_Menu_Code });
                if (_objUserSession != null && _objUserSession.Get_LoginTable != null && _objUserSession.Get_LoginTable.Rows.Count > 0)
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginUserId", Value = _objUserSession.GetCurrentLogin_User_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginSessionId", Value = _objUserSession.GetCurrentUser_LoginSessionId });
                }
                else
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginUserId", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginSessionId", Value = DBNull.Value });
                }

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_Insert_Notification_Bulk", lstDBMapParam);
            }
        }

        #endregion

        #region Message Public Methods

        public string SendSMS(string mobileNo, string message, bool throwException = true)
        {
            if (_objCustomAppSetting.Is_Message_Allowed)
            {
                try
                {
                    if (!_objUtility.IsValid_MobileNo(mobileNo))
                    {
                        throw new Exception("Mobile No is not valid");
                    }

                    if (message.Trim() == "")
                    {
                        throw new Exception("Message is mandatory");
                    }

                    string msgsend = _objCustomAppSetting.RequestUriString.Replace("@MobilesPlaceHolder", HttpUtility.UrlEncode(mobileNo)).Replace("@MessagePlaceHolder", HttpUtility.UrlEncode(message));
                    HttpWebRequest _objHttpWebRequest = (HttpWebRequest)WebRequest.Create(msgsend);
                    HttpWebResponse _objHttpWebResponse = (HttpWebResponse)_objHttpWebRequest.GetResponse();
                    StreamReader _objStreamReader = new StreamReader(_objHttpWebResponse.GetResponseStream());
                    string responseString = _objStreamReader.ReadToEnd();
                    _objStreamReader.Close();
                    _objHttpWebResponse.Close();
                    return responseString;
                }
                catch (Exception ex)
                {
                    _objLogger.Error(this.ToString(), ex);
                    if (throwException)
                    {
                        throw ex;
                    }
                }
            }

            return "";
        }

        public Int64 EnqueueSMS(string mobileNo, string mobileMessage, string From_Screen, string From_Menu_Code, DateTime? scheduledStartOn = null, DateTime? scheduledEndOn = null, string remarks = "")
        {
            if (_objCustomAppSetting.Is_Enqueue_Message_In_DB)
            {
                List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
                lstDBMapParam.Add(new DBMapParam() { Name = "Notification_Type", Value = Notification_Type.MESSAGE.ToString() });
                lstDBMapParam.Add(new DBMapParam() { Name = "From_Email_Id", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "To_Email_Ids", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Cc_Email_Ids", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Bcc_Email_Ids", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Email_Subject", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Email_Body", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "IsBodyHtml", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Attachment_Paths", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Image_Path_To_Embed", Value = DBNull.Value });
                lstDBMapParam.Add(new DBMapParam() { Name = "Mobile_No", Value = mobileNo });
                lstDBMapParam.Add(new DBMapParam() { Name = "Mobile_Message", Value = mobileMessage });
                lstDBMapParam.Add(new DBMapParam() { Name = "Notification_ScheduledOn_Start_Date", Value = _objUtility.ValidateDBNullEmptyValue(scheduledStartOn, _CurrentDateTime) });
                lstDBMapParam.Add(new DBMapParam() { Name = "Notification_ScheduledOn_End_Date", Value = _objUtility.ValidateDBNullEmptyValue(scheduledEndOn, DBNull.Value) });
                lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = remarks });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedOn_Date", Value = _CurrentDateTime });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedFrom_Screen", Value = From_Screen });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedFrom_Menu_Code", Value = From_Menu_Code });
                if (_objUserSession != null && _objUserSession.Get_LoginTable != null && _objUserSession.Get_LoginTable.Rows.Count > 0)
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginUserId", Value = _objUserSession.GetCurrentLogin_User_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginSessionId", Value = _objUserSession.GetCurrentUser_LoginSessionId });
                }
                else
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginUserId", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginSessionId", Value = DBNull.Value });
                }
                lstDBMapParam.Add(new DBMapParam() { Name = "Notification_Id", Value = 0, ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.BigInt, Size = 1024 });

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_Insert_Notification", lstDBMapParam);
                return Convert.ToInt64(_objUtility.ValidateDBNullEmptyValue(dictResult["Notification_Id"], 0));
            }

            return 0;
        }

        public void EnqueueSMS(List<MessageRequest> _objMessageRequestCollection, string From_Screen, string From_Menu_Code)
        {
            if (_objCustomAppSetting.Is_Enqueue_Message_In_DB)
            {
                List<DBMapParam> lstDBMapParam = new List<DBMapParam>();

                lstDBMapParam.Add(new DBMapParam() { Name = "Notification", Value = GetDataTableFromMessageRequestObject(_objMessageRequestCollection) });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedOn_Date", Value = _CurrentDateTime });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedFrom_Screen", Value = From_Screen });
                lstDBMapParam.Add(new DBMapParam() { Name = "CreatedFrom_Menu_Code", Value = From_Menu_Code });
                if (_objUserSession != null && _objUserSession.Get_LoginTable != null && _objUserSession.Get_LoginTable.Rows.Count > 0)
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginUserId", Value = _objUserSession.GetCurrentLogin_User_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginSessionId", Value = _objUserSession.GetCurrentUser_LoginSessionId });
                }
                else
                {
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginUserId", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CreatedBy_LoginSessionId", Value = DBNull.Value });
                }

                Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_Insert_Notification_Bulk", lstDBMapParam);
            }
        }

        #endregion

        #region Common Public Methods
        public List<NotificationResponse> SendEnqueuedNotification(Int64 Notification_Id, Int64 LoginUserId, Int64 LoginSessionId, string From_Screen, string From_Menu_Code)
        {
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Notification_Id", Value = Notification_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime ", Value = _CurrentDateTime });
            DataTable dtNotificationData = _objDataConnection.GetDatatableSP("SP_Get_Notification", lstDBMapParam);
            return SendNotification(dtNotificationData, LoginUserId, LoginSessionId, From_Screen, From_Menu_Code);
        }

        #endregion

        #region Private Methods

        private object GetDataTableFromMailRequestObject(List<MailRequest> _objMailRequestCollection)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Notification_Type");
            dt.Columns.Add("From_Email_Id");
            dt.Columns.Add("To_Email_Ids");
            dt.Columns.Add("Cc_Email_Ids");
            dt.Columns.Add("Bcc_Email_Ids");
            dt.Columns.Add("Email_Subject");
            dt.Columns.Add("Email_Body");
            dt.Columns.Add("IsBodyHtml");
            dt.Columns.Add("Attachment_Paths");
            dt.Columns.Add("Image_Path_To_Embed");
            dt.Columns.Add("Mobile_No");
            dt.Columns.Add("Mobile_Message");
            dt.Columns.Add("Notification_ScheduledOn_Start_Date", typeof(DateTime));
            dt.Columns.Add("Notification_ScheduledOn_End_Date", typeof(DateTime));
            dt.Columns.Add("Remarks");
            dt.Columns.Add("SourceCaller");
            dt.Columns.Add("Row_No");

            if (_objMailRequestCollection != null && _objMailRequestCollection.Count > 0)
            {
                foreach (MailRequest _objMailRequest in _objMailRequestCollection)
                {
                    DataRow dr = dt.NewRow();
                    dr["Notification_Type"] = Notification_Type.EMAIL.ToString();
                    dr["From_Email_Id"] = _objUtility.ValidateDBNullEmptyValue(_objMailRequest.FromEmailId, _objCustomAppSetting.FromMailAddress);
                    dr["To_Email_Ids"] = _objMailRequest.ToEmailIds != null && _objMailRequest.ToEmailIds.Length > 0 ? string.Join("|", _objMailRequest.ToEmailIds) : "";
                    dr["Cc_Email_Ids"] = _objMailRequest.CcEmailIds != null && _objMailRequest.CcEmailIds.Length > 0 ? string.Join("|", _objMailRequest.CcEmailIds) : "";
                    dr["Bcc_Email_Ids"] = _objMailRequest.BccEmailIds != null && _objMailRequest.BccEmailIds.Length > 0 ? string.Join("|", _objMailRequest.BccEmailIds) : "";
                    dr["Email_Subject"] = _objMailRequest.EmailSubject;
                    dr["Email_Body"] = _objMailRequest.EmailBody;
                    dr["IsBodyHtml"] = _objUtility.ValidateDBNullEmptyValue(_objMailRequest.IsBodyHtml, true);
                    dr["Attachment_Paths"] = _objMailRequest.AttachmentPaths != null && _objMailRequest.AttachmentPaths.Length > 0 ? string.Join("|", _objMailRequest.AttachmentPaths) : "";
                    dr["Image_Path_To_Embed"] = _objMailRequest.ImagePathToEmbed;
                    dr["Mobile_No"] = DBNull.Value;
                    dr["Mobile_Message"] = DBNull.Value;
                    dr["Notification_ScheduledOn_Start_Date"] = _objUtility.ValidateDBNullEmptyValue(_objMailRequest.ScheduledStartOn, _CurrentDateTime);
                    dr["Notification_ScheduledOn_Start_Date"] = _objUtility.ValidateDBNullEmptyValue(_objMailRequest.ScheduledEndOn, DBNull.Value);
                    dr["Remarks"] = _objMailRequest.Remarks;
                    dr["SourceCaller"] = _objMailRequest.SourceCaller;
                    dr["Row_No"] = dt.Rows.Count + 1;
                    dt.Rows.Add(dr);
                }
            }

            return dt;
        }

        private object GetDataTableFromMessageRequestObject(List<MessageRequest> _objMessageRequestCollection)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Notification_Type");
            dt.Columns.Add("From_Email_Id");
            dt.Columns.Add("To_Email_Ids");
            dt.Columns.Add("Cc_Email_Ids");
            dt.Columns.Add("Bcc_Email_Ids");
            dt.Columns.Add("Email_Subject");
            dt.Columns.Add("Email_Body");
            dt.Columns.Add("IsBodyHtml");
            dt.Columns.Add("Attachment_Paths");
            dt.Columns.Add("Image_Path_To_Embed");
            dt.Columns.Add("Mobile_No");
            dt.Columns.Add("Mobile_Message");
            dt.Columns.Add("Notification_ScheduledOn_Start_Date", typeof(DateTime));
            dt.Columns.Add("Notification_ScheduledOn_End_Date", typeof(DateTime));
            dt.Columns.Add("Remarks");
            dt.Columns.Add("SourceCaller");
            dt.Columns.Add("Row_No");

            if (_objMessageRequestCollection != null && _objMessageRequestCollection.Count > 0)
            {
                foreach (MessageRequest _objMessageRequest in _objMessageRequestCollection)
                {
                    DataRow dr = dt.NewRow();
                    dr["Notification_Type"] = Notification_Type.MESSAGE.ToString();
                    dr["From_Email_Id"] = DBNull.Value;
                    dr["To_Email_Ids"] = DBNull.Value;
                    dr["Cc_Email_Ids"] = DBNull.Value;
                    dr["Bcc_Email_Ids"] = DBNull.Value;
                    dr["Email_Subject"] = DBNull.Value;
                    dr["Email_Body"] = DBNull.Value;
                    dr["IsBodyHtml"] = DBNull.Value;
                    dr["Attachment_Paths"] = DBNull.Value;
                    dr["Image_Path_To_Embed"] = DBNull.Value;
                    dr["Mobile_No"] = _objMessageRequest.MobileNo;
                    dr["Mobile_Message"] = _objMessageRequest.MobileMessage;
                    dr["Notification_ScheduledOn_Start_Date"] = _objUtility.ValidateDBNullEmptyValue(_objMessageRequest.ScheduledStartOn, _CurrentDateTime);
                    dr["Notification_ScheduledOn_Start_Date"] = _objUtility.ValidateDBNullEmptyValue(_objMessageRequest.ScheduledEndOn, DBNull.Value);
                    dr["Remarks"] = _objMessageRequest.Remarks;
                    dr["SourceCaller"] = _objMessageRequest.SourceCaller;
                    dr["Row_No"] = dt.Rows.Count + 1;
                    dt.Rows.Add(dr);
                }
            }

            return dt;
        }

        private AlternateView getEmbeddedImage(String filePath)
        {
            LinkedResource res = new LinkedResource(Path.IsPathRooted(filePath.Trim()) ? filePath.Trim() : HttpContext.Current.Server.MapPath(filePath.Trim()));
            res.ContentId = Guid.NewGuid().ToString();
            //   string htmlBody = @"<img style='background-color:#a2d9f7bf;margin-left:auto;margin-right:auto;display:block;' src='cid:" + res.ContentId + @"'/>";
            string htmlBody = @"<html><body bgcolor='#a2d9f7bf' style='background-color:#a2d9f7bf;'><center><img style='margin-left:auto;margin-right:auto;display:block;' src='cid:" + res.ContentId + @"'/></center></body></html>";
            AlternateView alternateView = AlternateView.CreateAlternateViewFromString(htmlBody, null, MediaTypeNames.Text.Html);
            alternateView.LinkedResources.Add(res);
            return alternateView;
        }

        private List<NotificationResponse> SendNotification(DataTable dtNotificationData, Int64 LoginUserId, Int64 LoginSessionId, string From_Screen, string From_Menu_Code)
        {
            List<NotificationResponse> _objNotificationResponseCollection = new List<NotificationResponse>();

            if (dtNotificationData != null && dtNotificationData.Rows.Count > 0)
            {
                foreach (DataRow dr in dtNotificationData.Rows)
                {
                    NotificationResponse _objNotificationResponse = new NotificationResponse();

                    try
                    {
                        _objNotificationResponse.Notification_Id = Convert.ToInt64(dr["Notification_Id"]);
                        _objNotificationResponse.Notification_Start_Date = DateTimeHandler.Get_Currentdate;

                        if (Convert.ToString(dr["Notification_Type"]) == Notification_Type.EMAIL.ToString())
                        {
                            SendMail(GetArray(dr["To_Email_Ids"]), Convert.ToString(dr["Email_Subject"]), Convert.ToString(dr["Email_Body"]), true, GetArray(dr["Cc_Email_Ids"]), GetArray(dr["Bcc_Email_Ids"]), Convert.ToString(dr["From_Email_Id"]), true, GetArray(dr["Attachment_Paths"]), Convert.ToString(dr["Image_Path_To_Embed"]));
                            _objNotificationResponse.Is_Successed = true;
                        }
                        else if (Convert.ToString(dr["Notification_Type"]) == Notification_Type.MESSAGE.ToString())
                        {
                            _objNotificationResponse.Response_Message = SendSMS(Convert.ToString(dr["Mobile_No"]), Convert.ToString(dr["Mobile_Message"]));
                            _objNotificationResponse.Is_Successed = true;
                        }
                        else
                        {
                            _objNotificationResponse.Is_Successed = false;
                            _objNotificationResponse.Exception_Occurred = "Notification_Type Not Found";
                        }

                        _objNotificationResponse.Notification_End_Date = DateTimeHandler.Get_Currentdate;
                    }
                    catch (System.Threading.ThreadAbortException ex)
                    {
                        _objNotificationResponse.Is_Successed = true;
                        _objNotificationResponse.Notification_End_Date = DateTimeHandler.Get_Currentdate;
                    }
                    catch (Exception ex)
                    {
                        _objNotificationResponse.Is_Successed = false;
                        _objNotificationResponse.Notification_End_Date = DateTimeHandler.Get_Currentdate;
                        _objNotificationResponse.Exception_Occurred = ex.ToString();

                        _objLogger.Error(this.ToString(), ex);
                    }

                    _objNotificationResponseCollection.Add(_objNotificationResponse);
                }
            }

            UpdateNotificationStatus(_objNotificationResponseCollection, LoginUserId, LoginSessionId, From_Screen, From_Menu_Code);
            return _objNotificationResponseCollection;
        }

        private void UpdateNotificationStatus(List<NotificationResponse> _objNotificationResponseCollection, Int64 LoginUserId, Int64 LoginSessionId, string From_Screen, string From_Menu_Code)
        {
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();

            lstDBMapParam.Add(new DBMapParam() { Name = "Notification", Value = GetDataTableFromNotificationResposeObject(_objNotificationResponseCollection) });
            lstDBMapParam.Add(new DBMapParam() { Name = "UpdatedBy_LoginUserId", Value = LoginUserId });
            lstDBMapParam.Add(new DBMapParam() { Name = "UpdatedOn_Date", Value = _CurrentDateTime });
            lstDBMapParam.Add(new DBMapParam() { Name = "UpdatedBy_LoginSessionId", Value = LoginSessionId });
            lstDBMapParam.Add(new DBMapParam() { Name = "UpdatedFrom_Screen", Value = From_Screen });
            lstDBMapParam.Add(new DBMapParam() { Name = "UpdatedFrom_Menu_Code", Value = From_Menu_Code });
            Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_Update_Notification_Status", lstDBMapParam);

        }

        private DataTable GetDataTableFromNotificationResposeObject(List<NotificationResponse> _objNotificationResponseCollection)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Notification_Id", typeof(Int64));
            dt.Columns.Add("Is_Successed", typeof(bool));
            dt.Columns.Add("Notification_Start_Date", typeof(DateTime));
            dt.Columns.Add("Notification_End_Date", typeof(DateTime));
            dt.Columns.Add("Action_Remarks", typeof(string));
            dt.Columns.Add("Response_Message", typeof(string));
            dt.Columns.Add("Exception_Occurred", typeof(string));
            dt.Columns.Add("Row_No", typeof(Int64));

            if (_objNotificationResponseCollection != null && _objNotificationResponseCollection.Count > 0)
            {
                foreach (NotificationResponse _objNotificationResponse in _objNotificationResponseCollection)
                {
                    DataRow dr = dt.NewRow();
                    dr["Notification_Id"] = _objNotificationResponse.Notification_Id;
                    dr["Is_Successed"] = _objNotificationResponse.Is_Successed;
                    dr["Notification_Start_Date"] = _objUtility.ValidateDBNullEmptyValue(_objNotificationResponse.Notification_Start_Date, DBNull.Value);
                    dr["Notification_End_Date"] = _objUtility.ValidateDBNullEmptyValue(_objNotificationResponse.Notification_End_Date, DBNull.Value);
                    dr["Action_Remarks"] = _objNotificationResponse.Action_Remarks;
                    dr["Response_Message"] = _objNotificationResponse.Response_Message;
                    dr["Exception_Occurred"] = _objNotificationResponse.Exception_Occurred;
                    dr["Row_No"] = dt.Rows.Count + 1;
                    dt.Rows.Add(dr);
                }
            }

            return dt;
        }

        public string[] GetArray(object v)
        {
            string[] arr = null;
            if (!_objUtility.ValidateDBNullEmptyValue(v))
            {
                arr = v.ToString().Trim().Split('|');
            }
            return arr;
        }

        #endregion
    }

    public class MailRequest
    {
        public string FromEmailId { get; set; }
        public string[] ToEmailIds { get; set; }
        public string[] CcEmailIds { get; set; }
        public string[] BccEmailIds { get; set; }
        public string EmailSubject { get; set; }
        public string EmailBody { get; set; }
        public bool? IsBodyHtml { get; set; }
        public string[] AttachmentPaths { get; set; }
        public string ImagePathToEmbed { get; set; }
        public DateTime? ScheduledStartOn { get; set; }
        public DateTime? ScheduledEndOn { get; set; }
        public string Remarks { get; set; }
        public string SourceCaller { get; set; }
    }

    public class MessageRequest
    {
        public string MobileNo { get; set; }
        public string MobileMessage { get; set; }
        public DateTime? ScheduledStartOn { get; set; }
        public DateTime? ScheduledEndOn { get; set; }
        public string Remarks { get; set; }
        public string SourceCaller { get; set; }
    }

    public class NotificationResponse
    {
        public Int64 Notification_Id { get; set; }
        public bool Is_Successed { get; set; }
        public DateTime? Notification_Start_Date { get; set; }
        public DateTime? Notification_End_Date { get; set; }
        public string Action_Remarks { get; set; }
        public string Response_Message { get; set; }
        public string Exception_Occurred { get; set; }
        public string From_Screen { get; set; }
        public string From_Menu_Code { get; set; }
    }

    public enum Notification_Type
    {
        EMAIL,
        MESSAGE
    }
}