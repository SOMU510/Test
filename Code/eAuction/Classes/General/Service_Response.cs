using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;
using System.Data;

/// <summary>
/// Summary description for Service_Response
/// </summary>
/// 
namespace YCS
{
    [DataContract]
public class Service_Response
{
    [DataMember]
    public string Service_Message
    {
        get;
        set;
    }
    [DataMember]
    public string Service_Result
    {
        get;
        set;
    }
}

[DataContract]
public class Service_Message
{
    [DataMember]
    public string Message
    {
        get;
        set;
    }
    [DataMember]
    public int Code
    {
        get;
        set;
    }
    [DataMember]
    public string Response_Status
    {
        get;
        set;
    }
    [DataMember]
    public string Message_Show
    {
        get;
        set;
    }
    [DataMember]
    public string Token
    {
        get;
        set;
    }
    [DataMember]
    public string Date
    {
        get;
        set;
    }
    [DataMember]
    public string Time
    {
        get;
        set;
    }
}

public enum ScreenName
{
    Login,
    Logout,
    Main_Screen
    
}

//public enum WS_Response
//{
//    Successful,
//    Error,
//    Warning
//}

//public enum WS_MessageShow
//{
//    Yes,
//    No,
//}


    public class WS_Request_Response
    {
        Utility objUtilily = new Utility();

        public void CreateResponse(Service_Response objService_Response, int code, object message = null)
        {
            objService_Response.Service_Message = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(new Message().GetMessageDetail(code, message));
        }

        public void CreateResponse(Service_Response objService_Response, int code, string token, DateTime? date = null, object message = null)
        {
            objService_Response.Service_Message = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(new Message().GetMessageDetailWithToken(code, token, date, message));
        }

        public void CreateExceptionResponse(Service_Response objService_Response, Exception ex, string classname)
        {
            try
            {
                //"Something Wrong Happened!!"
                objUtilily.Exception_Log(classname, ex);
                objService_Response.Service_Message = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(new Message().GetMessageDetail(3, null));
            }
            catch (Exception ex1)
            {
                objUtilily.Exception_Log(this.ToString() + " _ " + classname, ex1);
            }
        }

    }
}

    