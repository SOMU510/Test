using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Runtime.Serialization;
using System.Collections;

namespace YCS
{
    #region Class Declaration
    public class LoginUserProfileExtends : LoginUserProfile
    {
        [DataMember]
        public Int64 Employee_Id { get; set; }
        [DataMember]
        public Int64 Login_SessionId { get; set; }

    }

    [DataContract]
    public class LoginUserProfile
    {
        [DataMember]
        public string Email_Id { get; set; }
        [DataMember]
        public string Accessthrough { get; set; }
        [DataMember]
        public string Login_Id { get; set; }
        [DataMember]
        public string Password { get; set; }
        [DataMember]
        public char Login_Device { get; set; }
        [DataMember]
        public string User_Name { get; set; }
        [DataMember]
        public Int64 Employee_Code { get; set; }
        [DataMember]
        public string Employee_Mobile_No { get; set; }
        [DataMember]
        public string Token { get; set; }
        [DataMember]
        public string Device_Id { get; set; }
        [DataMember]
        public string Mobile_Model { get; set; }
        [DataMember]
        public string App_Name { get; set; }
        [DataMember]
        public string App_Version { get; set; }
        [DataMember]
        public string Operating_System { get; set; }
        [DataMember]
        public string LoginTime { get; set; }
        [DataMember]
        public string LogoutTime { get; set; }
        [DataMember]
        public string OTP { get; set; }
        [DataMember]
        public string OTP_GeneratedOn_Date { get; set; }
        [DataMember]
        public bool Is_Password_Reset_Required { get; set; }
        [DataMember]
        public bool Is_Profile_Update_Required { get; set; }
        [DataMember]
        public Int64  Firm_Id { get; set; }
        [DataMember]
        public string  DefaultURL { get; set; }
        [DataMember]
        public List<Employee_Firm_List> Firm_List { get; set; }
        [DataMember]
        public List<Menu> Menu_List { get; set; }


    }
    [DataContract]
    public class Employee_Firm_List
    {
        [DataMember]
        public Int64 Firm_Id { get; set; }
        [DataMember]
        public string Firm_Name { get; set; }
        [DataMember]
        public string Role_Id { get; set; }
        [DataMember]
        public string Role_Name { get; set; }
        [DataMember]
        public string Department_Id { get; set; }
        [DataMember]
        public Int64 Department_Name { get; set; }
        [DataMember]
        public bool Is_Default { get; set; }

    }
    [DataContract]
    public class Menu
    {
        [DataMember]
        public Int64 Menu_Id { get; set; }
        [DataMember]
        public string Menu_Name { get; set; }
        [DataMember]
        public string Menu_Internal_Code { get; set; }
        [DataMember]
        public string Menu_Icon { get; set; }
        [DataMember]
        public string Form_Relative_Path { get; set; }
        [DataMember]
        public Int64 Sequence { get; set; }
        [DataMember]
        public bool Is_Default { get; set; }
        [DataMember]
        public bool Is_App_Menu { get; set; }
        [DataMember]
        public bool Is_Mobile_Web_View_Menu { get; set; }

    }
    #endregion

    public class LoginUser
    {
        #region Global Variable
        ManageUserSession userSession = new ManageUserSession(true);
        DateTime _CurrentDateTime = DateTimeHandler.Get_Currentdate;
        DataConnection _dataConnection = new DataConnection();
        Utility _objUtilily = new Utility();
        DBCommon _objDBCommon = new DBCommon();
        MasterCollection _objMaster = new MasterCollection();
        Notification _objNotification = new Notification();
        #endregion

    }

}