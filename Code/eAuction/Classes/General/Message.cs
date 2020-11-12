using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YCS
{

    public enum WS_Response
    {
        Successful,
        Error,
        Warning,
        Confirm
    }

    public enum WS_MessageShow
    {
        Yes,
        No,
    }

    public class Message
    {
        public void ShowMessageWithURL(int code, string redirectpageurl, object additionalinfo = null)
        {
            ShowMessage(null, null, code, additionalinfo, redirectpageurl);
        }

        public void ShowMessage(int code, object additionalinfo = null)
        {
            ShowMessage(null, null, code, additionalinfo);
        }

        public void ShowMessage(object actioncontrol, object focuscontrol, int code, object additionalinfo = null, string url = "", bool ispostback = false)
        {
            Service_Message clsService_Message = SendResponse(code, additionalinfo);

            if (clsService_Message != null && clsService_Message.Message != null && clsService_Message.Message.Trim() != "")
            {
                dynamic acontrol = actioncontrol;
                dynamic controlfocus = focuscontrol;
                string jsfunction = "";

                string focuscontrolclientid = "";
                string focuscontroluniqueclientid = "";

                string actioncontrolclientid = "";
                string actioncontroluniqueclientid = "";

                if (ValidateDBNullEmptyValue(acontrol) == false)
                {
                    actioncontrolclientid = acontrol.ClientID;
                    actioncontroluniqueclientid = acontrol.UniqueID;
                }

                if (ValidateDBNullEmptyValue(focuscontrol) == false)
                {
                    focuscontrolclientid = controlfocus.ClientID;
                    focuscontroluniqueclientid = controlfocus.UniqueID;
                }

                if (ValidateDBNullEmptyValue(url))
                {
                    url = "";
                }

                //controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, ispostback, message, url,iconcss, fn
                jsfunction = "Action_Alert('" + actioncontrolclientid + "','" + actioncontroluniqueclientid + "','" + focuscontrolclientid + "','" + focuscontroluniqueclientid + "','" + Convert.ToString(ispostback).ToLower() + "','" + clsService_Message.Message + "','" + url + "','');";

                Page page = HttpContext.Current.CurrentHandler as Page;

                // Checks if the handler is a Page and that the script isn't allready on the Page
                if (page != null)
                {
                    ScriptManager.RegisterStartupScript(page, page.GetType(), "AlertMessage", jsfunction, true);
                }
            }
        }

        public void ShowConfirmMessage(object actioncontrol, object focuscontrol, object additionalinfo = null, int code = 59, string validationgroup = "", string eventname = "OnClick")
        {
            Service_Message clsService_Message = SendResponse(code, additionalinfo);

            if (clsService_Message != null && clsService_Message.Message != null && clsService_Message.Message.Trim() != "")
            {
                string jsfunction = GetConfirmJSFunction(actioncontrol, focuscontrol, additionalinfo, code, validationgroup, eventname);

                Page page = HttpContext.Current.CurrentHandler as Page;

                // Checks if the handler is a Page and that the script isn't allready on the Page
                if (page != null)
                {
                    ScriptManager.RegisterStartupScript(page, page.GetType(), "ConfirmMessage", jsfunction, true);
                }
            }
        }

        public void AssignButtonValidationGroup(object actioncontrol, object focuscontrol, string action, string validationgroup = "", bool issetbtntext = true, string eventname = "OnClick", object additionalinfo = null, int code = 59, bool ControlIconRequired = true)
        {
            object messageadditionalvalue = action;
            if (ValidateDBNullEmptyValue(additionalinfo) == false)
            {
                messageadditionalvalue = additionalinfo;
            }
            string jsfunction = "return " + GetConfirmJSFunction(actioncontrol, focuscontrol, messageadditionalvalue, code, validationgroup, eventname);

            if (actioncontrol.GetType() == typeof(Button) || actioncontrol.GetType() == typeof(LinkButton))
            {
                dynamic btnAction = actioncontrol;

                btnAction.OnClientClick = jsfunction;

                //if (issetbtntext)
                //{
                //	btnAction.Text = action;
                //}

                AssignButtonText(actioncontrol, action, issetbtntext, ControlIconRequired);
            }
            else if (actioncontrol.GetType() == typeof(CheckBox))
            {
                CheckBox btnAction = (CheckBox)actioncontrol;

                btnAction.Attributes["onclick"] = jsfunction;
            }
            else if (actioncontrol.GetType() == typeof(DropDownList))
            {
                DropDownList btnAction = (DropDownList)actioncontrol;

                btnAction.Attributes["onchange"] = jsfunction;
            }
        }

        public void AssignButtonText(object ControlId, string ControlText, bool OverwriteControlText = true, bool ControlIconRequired = true)
        {

            if (ControlId.GetType() == typeof(Button) || ControlId.GetType() == typeof(LinkButton))
            {
                dynamic btnAction = ControlId;

                if (OverwriteControlText)
                {
                    btnAction.Text = ControlText;
                }
                else
                {
                    ControlText = btnAction.Text;
                }

                if (ControlIconRequired && ControlId.GetType() == typeof(LinkButton))
                {
                    switch (ControlText.ToUpper())
                    {
                        case "SAVE":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-save\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "UPDATE":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-repeat\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "CLEAR":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-refresh\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "BACK":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-arrow-left\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "PRINT":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-print\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "CANCEL":
                        case "CLOSE":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-remove\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "PARTICIPATE":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-ok\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "SAVE AS DRAFT":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-file\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "READY FOR REVIEW":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-pencil\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "READY FOR PUBLISHING":
                            btnAction.Text = "<i class=\"glyphicon-glyphicon-pencil\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "PUBLISHED":
                            btnAction.Text = "<i class=\"glyphicon-glyphicon-ok\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "ACTIVE":
                            btnAction.Text = "<i class=\"glyphicon-glyphicon-hand-right\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "CONDUCTED":
                            btnAction.Text = "<i class=\"glyphicon-glyphicon-hand-right\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "SETTLED":
                            btnAction.Text = "<i class=\"glyphicon-glyphicon-ok\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "DISCARDED":
                            btnAction.Text = "<i class=\"glyphicon-glyphicon-remove\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "SEND TO PARTY":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-arrow-right\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "SEND TO APPROVAL":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-saved\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "SUBMIT & APPROVE":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-ok\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "APPROVE":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-ok\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "REJECT":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-remove\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "DEACTIVATE":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-remove\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "ACTIVATE":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-ok\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "EDIT":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-repeat\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "CONFIRM":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-thumbs-up\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
						case "AUCTION CLONE":
                            btnAction.Text = "<i class=\"fa fa-clone\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        case "ACCEPT":
                            btnAction.Text = "<i class=\"glyphicon glyphicon-ok\"></i>" + " " + ControlText;
                            btnAction.ToolTip = ControlText;
                            break;
                        default:
                            break;
                    }

                }
            }
        }

        public string GetMessage(int code, object additionalinfo = null)
        {
            Service_Message clsService_Message = SendResponse(code, additionalinfo);

            string message = null;
            if (clsService_Message != null && clsService_Message.Message != null && clsService_Message.Message.Trim() != "")
            {
                message = clsService_Message.Message;
            }
            return message;
        }

        public Service_Message GetMessageDetail(int code, object additionalinfo = null)
        {
            return SendResponse(code, additionalinfo);
        }

        public Service_Message GetMessageDetailWithToken(int code, string token, DateTime? date, object additionalinfo = null)
        {
            return SendResponse(code, token, null, additionalinfo);
        }

        private string GetConfirmJSFunction(object actioncontrol, object focuscontrol, object additionalinfo = null, int code = 59, string validationgroup = "", string eventname = "OnClick")
        {
            dynamic acontrol = actioncontrol;
            dynamic fcontrol = focuscontrol;
            string jsfunction = "";

            string focuscontrolclientid = "";
            string focuscontroluniqueclientid = "";

            if (ValidateDBNullEmptyValue(focuscontrol) == false)
            {
                focuscontrolclientid = fcontrol.ClientID;
                focuscontroluniqueclientid = fcontrol.UniqueID;
            }

            if (Convert.ToString(ValidateDBNullEmptyValue(validationgroup, "")) == "")
            {
                if (ValidateDBNullEmptyValue(acontrol.ValidationGroup))
                {
                    jsfunction = "Action_Confirm('" + acontrol.ClientID + "','" + acontrol.UniqueID + "','" + focuscontrolclientid + "','" + focuscontroluniqueclientid + "','" + GarbageValidationActionGroup + "','" + GetMessage(code, additionalinfo) + "','" + eventname + "');";
                }
                else
                {
                    jsfunction = "Action_Confirm('" + acontrol.ClientID + "','" + acontrol.UniqueID + "','" + focuscontrolclientid + "','" + focuscontroluniqueclientid + "','" + acontrol.ValidationGroup + "','" + GetMessage(code, additionalinfo) + "','" + eventname + "');";
                }
            }
            else
            {
                jsfunction = "Action_Confirm('" + acontrol.ClientID + "','" + acontrol.UniqueID + "','" + focuscontrolclientid + "','" + focuscontroluniqueclientid + "','" + validationgroup + "','" + GetMessage(code, additionalinfo) + "','" + eventname + "');";
            }

            return jsfunction;
        }

        private bool ValidateDBNullEmptyValue(object value)
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

        private object ValidateDBNullEmptyValue(object value, object defaultvalue, object anothervalue = null)
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

        private string GarbageValidationActionGroup
        {
            get
            {
                return "AbYOtXzRCxuLkdAtZy";
            }
        }
        //it will call only when  need a date & time pass through it
        private Service_Message SendResponse(int code, string token, DateTime? date, object message = null)
        {
            Service_Message clsService_Message = new Service_Message();
            Utility _objutility = new Utility();
            clsService_Message.Code = code;
            clsService_Message.Date = _objutility.Convert_Date_Into_ddMMyyyy(date == null ? DateTimeHandler.Get_Currentdate : Convert.ToDateTime(date));
            clsService_Message.Time = date == null ? DateTimeHandler.Get_Currentdate.ToLongTimeString() : Convert.ToDateTime(date).ToLongTimeString();
            clsService_Message.Token = token;

            CreateMessage(clsService_Message, code, message);

            return clsService_Message;
        }
        private Service_Message SendResponse(int code, object additionalinfo = null)
        {
            Service_Message clsService_Message = new Service_Message();
            Utility _objutility = new Utility();
            clsService_Message.Code = code;
            clsService_Message.Date = _objutility.Convert_Date_Into_ddMMyyyy(DateTimeHandler.Get_Currentdate);
            clsService_Message.Time = DateTimeHandler.Get_Currentdate.ToLongTimeString();

            CreateMessage(clsService_Message, code, additionalinfo);
            return clsService_Message;
        }
        public bool ReadExceptionFromDB(Exception ex, object actioncontrol, object focuscontrol, object additionalinfo = null)
        {
            int result = 0;
            if (ex != null)
            {
                if (ex.Message == "PERMISSION_DENIED")
                {
                    ShowMessage(actioncontrol, focuscontrol, 38, additionalinfo);
                    return true;
                }
                else if (ex.Message != null && ex.Message.Split(new string[] { "||" }, StringSplitOptions.None).Length - 1 == 2 && int.TryParse(ex.Message.Split(new string[] { "||" }, StringSplitOptions.None)[1], out result))// One Additional Value
                {
                    ShowMessage(actioncontrol, focuscontrol, result, ex.Message.Replace("||" + result + "||", ""));
                    return true;
                }
                else if (ex.Message != null && ex.Message.Split(new string[] { "||" }, StringSplitOptions.None).Length - 1 > 2 && int.TryParse(ex.Message.Split(new string[] { "||" }, StringSplitOptions.None)[1], out result))//More than one Additional Value
                {
                    ShowMessage(actioncontrol, focuscontrol, result, ex.Message.Replace("||" + result + "||", "").Split(new string[] { "||" }, StringSplitOptions.None));
                    return true;
                }
                //else if (ex.Message.Split('|').Length > 1 && ex.Message.Split('|')[0] == "INVALID_ACCOUNT_FOR_TRANSACTION")
                //{
                //    ShowMessage(actioncontrol, focuscontrol, 64, ex.Message.Split('|')[1]);
                //    return true;
                //}
                //else if (ex.Message.Split('|').Length > 1 && ex.Message.Split('|')[0] == "INVALID_TRANSACTION_AMOUNT")
                //{
                //    ShowMessage(actioncontrol, focuscontrol, 57, "Transaction Amount");
                //    return true;
                //}
                //else if (ex.Message.Split('|').Length > 1 && ex.Message.Split('|')[0] == "INVALID_TRANSACTION_TYPE")
                //{
                //    ShowMessage(actioncontrol, focuscontrol, 59, "Transaction Type");
                //    return true;
                //}
                //else if (ex.Message.Split('|').Length > 1 && ex.Message.Split('|')[0] == "INVALID_INSTALLMENT_AMOUNT")
                //{
                //    ShowMessage(actioncontrol, focuscontrol, 65, new string[] { "Installment Amount", "Outstanding Balance" });
                //    return true;
                //}
                //else if (ex.Message.Split('|').Length > 1 && ex.Message.Split('|')[0] == "INVALID_SETTLEMENT_AMOUNT")
                //{
                //    ShowMessage(actioncontrol, focuscontrol, 66, new string[] { "Settlement Amount", "Outstanding Balance" });
                //    return true;
                //}
                //else if (ex.Message.Split('|').Length > 1 && ex.Message.Split('|')[0] == "INVALID_REVERSE_TRANSACTION")
                //{
                //    ShowMessage(actioncontrol, focuscontrol, 67, ex.Message.Split('|')[1]);
                //    return true;
                //}
                //else if (ex.Message.Split('|').Length > 1 && ex.Message.Split('|')[0] == "TRANSACTION_AMOUNT_MORE_THAN_DUE")
                //{
                //    ShowMessage(actioncontrol, focuscontrol, 65, new string[] { "Transaction Amount", "Outstanding Balance" });
                //    return true;
                //}
                //else if (ex.Message.Split('|').Length > 1 && ex.Message.Split('|')[0] == "PENALTY_AMOUNT_MORE_THAN_DUE")
                //{
                //    ShowMessage(actioncontrol, focuscontrol, 65, new string[] { "Transaction Amount", "Due Penalty Amount" });
                //    return true;
                //}
                //else if (ex.Message.Split('|').Length > 1 && ex.Message.Split('|')[0] == "CHARGE_AMOUNT_MORE_THAN_DUE")
                //{
                //    ShowMessage(actioncontrol, focuscontrol, 65, new string[] { "Transaction Amount", "Due Charge Amount" });
                //    return true;
                //}
            }
            return false;
        }
        private void CreateMessage(Service_Message clsService_Message, int code, object additionalinfo = null)
        {
            switch (code)
            {
                case 1001:
                    clsService_Message.Message = additionalinfo + " is mandatory before proceeding further!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 1002:
                    clsService_Message.Message = "uploaded file size must not exceed " + additionalinfo + "!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 1003:
                    clsService_Message.Message = "Upload file Name /Content is not found!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 1004:
                    clsService_Message.Message = "Please upload file with an extention of one of the following: " + additionalinfo + "!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break; 
                case 1005:
                    clsService_Message.Message = "No record found!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 1:
                    clsService_Message.Message = "Successful.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.No.ToString();
                    break;
                case 2:
                    clsService_Message.Message = "Session is expired. Please Login again !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 3:
                    clsService_Message.Message = "Some system error occurred. Please contact your administrator !";//message.ToString();
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 4:
                    clsService_Message.Message = "Invalid User Name or Password !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 5:
                    clsService_Message.Message = "Data " + additionalinfo + " Successfully !";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 6:
                    clsService_Message.Message = "Please Enter " + additionalinfo + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 7:
                    clsService_Message.Message = additionalinfo + " is already exists. Please make an another entry !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 8:
                    clsService_Message.Message = "Please Select " + additionalinfo + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 9:
                    clsService_Message.Message = "Do you want to " + additionalinfo + " ?";
                    clsService_Message.Response_Status = WS_Response.Confirm.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 10:
                    clsService_Message.Message = "Please Enter Valid OTP !";
                    clsService_Message.Response_Status = WS_Response.Confirm.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 11:
                    clsService_Message.Message = "Please check atleast one Item !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 12:
                    clsService_Message.Message = "Please enter correct " + additionalinfo + " number !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 13:
                    clsService_Message.Message = "Please Check atleast one " + additionalinfo + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 14:
                    clsService_Message.Message = "Age should be greater than or equal to " + additionalinfo + " years !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 15:
                    clsService_Message.Message = additionalinfo + " can not be greater than current date !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 16:
                    clsService_Message.Message = "Please enter correct old Password !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 17:
                    clsService_Message.Message = "Password Changed Successfully !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 18:
                    clsService_Message.Message = additionalinfo + " can not be Smaller than current date !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 19:
                    clsService_Message.Message = additionalinfo + " is not found / active !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 20:
                    clsService_Message.Message = "Please select " + additionalinfo + " date!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 21:
                    clsService_Message.Message = additionalinfo + " is not a correct dd/MM/yyyy format!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 22:
                    clsService_Message.Message = "Please Select At Least One " + additionalinfo + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 23:
                    clsService_Message.Message = "Please click on " + additionalinfo + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 24:
                    clsService_Message.Message = additionalinfo + " is already Exist!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 25:
                    clsService_Message.Message = "Please Add " + additionalinfo + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 26:
                    clsService_Message.Message = "You have no rights to access !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 27:
                    clsService_Message.Message = additionalinfo + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 28:
                    clsService_Message.Message = "Excel does not have Date in format " + ((string[])additionalinfo)[0] + " in the row number : " + ((string[])additionalinfo)[1] + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 29:
                    clsService_Message.Message = "Entry in a compulsory field is missing. Please enter a valid entry!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 30:
                    clsService_Message.Message = "Please enter a valid " + additionalinfo + " email address!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 31:
                    clsService_Message.Message = "Invalid " + additionalinfo + "!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 32:
                    clsService_Message.Message = "Old and New Password can not be same!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 33:
                    clsService_Message.Message = "New Password Should be requires at least one digit, at least one alphabetic character, no special characters, and from 6-15 characters in length.!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 34:
                    clsService_Message.Message = ((string[])additionalinfo)[1] + "  should be greater than " + ((string[])additionalinfo)[0] + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 35:
                    clsService_Message.Message = "Please upload file with an extention of one of the following: " + additionalinfo + "!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 36:
                    clsService_Message.Message = "uploaded file size must not exceed " + additionalinfo + "!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 37:
                    clsService_Message.Message = "You are Successfully Registered and Approved !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 38:
                    clsService_Message.Message = "Action not allowed!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 39:
                    clsService_Message.Message = "Mail Send Successfully!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 40:
                    clsService_Message.Message = "No record found!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 41:
                    clsService_Message.Message = "This Document is Mandatory !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 42:
                    clsService_Message.Message = "Playlist Start and End Date overlapped with already added playlist Start and End Date!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 43:
                    clsService_Message.Message = "Unauthorized Access.";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 44:
                    clsService_Message.Message = additionalinfo + " parameter does not available.";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 45:
                    clsService_Message.Message = "You are pressed browser back/forward button or open wrong template. Please reopen template again.";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 46:
                    clsService_Message.Message = "Till date time must be grater than added playlist datetime.";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 47:
                    clsService_Message.Message = "Same Employee Code found in emp code column.";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 48:
                    clsService_Message.Message = "Form has been submitted successfully!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 49:
                    clsService_Message.Message = "Form has been Saved successfully!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 50:
                    clsService_Message.Message = "You have been locked for " + Utility.WRONG_PASSWORD_ACCOUNT_RECOVER_HOUR + " hour because of wrong password attempts.";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 51:
                    clsService_Message.Message = "Invalid Username or Password.You are left with (" + additionalinfo + " more attempts).";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 52:
                    clsService_Message.Message = "Password Reset Successfully & Your New Password Sent on E-Mail and Mobile.";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 53:
                    clsService_Message.Message = "Service parameter value is null.";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 54:
                    clsService_Message.Message = "Invalid Token Please Try Access through Password";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 55:
                    clsService_Message.Message = "You have been locked for " + additionalinfo + " minute because of wrong password attempts.";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 56:
                    clsService_Message.Message = "Invalid Username or Password.You are left with (" + additionalinfo + " more attempts).";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 57:
                    clsService_Message.Message = "Please Upload " + additionalinfo + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 58:
                    clsService_Message.Message = ((string[])additionalinfo)[0] + ", " + ((string[])additionalinfo)[1] + " Should  be same !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 59:
                    clsService_Message.Message = additionalinfo + " is mandatory before proceeding further!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 60:
                    clsService_Message.Message = ((string[])additionalinfo)[0] + "  should not be same with " + ((string[])additionalinfo)[1] + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 61:
                    clsService_Message.Message = ((string[])additionalinfo)[0] + "  should not be more than " + ((string[])additionalinfo)[1] + " !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 62:
                    clsService_Message.Message = "Percentage Value must be between 1 to 100 !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 63:
                    clsService_Message.Message = additionalinfo + " must be greater than 0 !";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 64:
                    clsService_Message.Message = additionalinfo + " Successfully.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 65:
                    clsService_Message.Message = additionalinfo + " cannot be 0 / less than zero.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 66:
                    clsService_Message.Message = "Current Bid and Previous Bid cannot be same.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 67:
                    clsService_Message.Message = "Current Bid cannot be less than Start Price.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 68:
                    clsService_Message.Message = "Current Bid cannot be greater than Start Price.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 69:
                    clsService_Message.Message = "Current Bid cannot be greater than Previous Bid.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 70:
                    clsService_Message.Message = "Current Bid cannot be less than Previous Bid.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 71:
                    clsService_Message.Message = "You must be enter Bid with Minimum Bid Change value.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 72:
                    clsService_Message.Message = "Add Cushion Limit in Current Bid Value.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 73:
                    clsService_Message.Message = "First auction Accept then bid.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 74:
                    clsService_Message.Message = "You cannot Bid because Auction is not Live.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 75:
                    clsService_Message.Message = additionalinfo + " is mandatory before proceeding further!";
                    clsService_Message.Response_Status = WS_Response.Error.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                case 76:
                    clsService_Message.Message = "You cannot Bid because Auction is Closed.";
                    clsService_Message.Response_Status = WS_Response.Successful.ToString();
                    clsService_Message.Message_Show = WS_MessageShow.Yes.ToString();
                    break;
                default:
                    break;
            }
        }
    }
}