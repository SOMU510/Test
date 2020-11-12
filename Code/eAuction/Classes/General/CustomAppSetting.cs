using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

namespace YCS
{
    public class CustomAppSetting
    {
        private XmlDocument _customXml;
        Security _objSecurity = new Security();

        public CustomAppSetting()
        {
            _customXml = LoadCustomSettingXml();
        }

        #region General Settings
        public string URL_Root
        {
            get
            {
                string url = "";
                if (HttpContext.Current != null && HttpContext.Current.Session != null)
                {
                    url = Convert.ToString(HttpContext.Current.Session["DOMAIN_NAME"]);
                }

                if (url == null || url.Trim() == "")
                {
                    url = ParseSetting(SettingGroup.General, "URL_Root");
                }
                return url;
            }
        }

        public string Calculate_Interest_From
        {
            get
            {
                return ParseSetting(SettingGroup.General, "Calculate_Interest_From");
            }
        }

        #endregion

        #region Email Settings

        public Boolean Is_Mail_Allowed
        {
            get
            {
                return Convert.ToBoolean(ParseSetting(SettingGroup.Email, "Is_Mail_Allowed"));
            }
        }

        public Boolean Is_Enqueue_Mail_In_DB
        {
            get
            {
                return Convert.ToBoolean(ParseSetting(SettingGroup.Email, "Is_Enqueue_Mail_In_DB"));
            }
        }

        public string FromMailAddress
        {
            get
            {
                return ParseSetting(SettingGroup.Email, "FromMailAddress");
            }
        }

        public string SmtpHost
        {
            get
            {
                return ParseSetting(SettingGroup.Email, "SmtpHost");
            }
        }

        public Int32 SmtpPort
        {
            get
            {
                return Convert.ToInt32(ParseSetting(SettingGroup.Email, "SmtpPort"));
            }
        }

        public string NetworkCredentialUserName
        {
            get
            {
                return _objSecurity.Decrypted(ParseSetting(SettingGroup.Email, "NetworkCredentialUserName"));
            }
        }

        public string NetworkCredentialPassword
        {
            get
            {
                return _objSecurity.Decrypted(ParseSetting(SettingGroup.Email, "NetworkCredentialPassword"));
            }
        }

        public string[] IgnoreDomainNames
        {
            get
            {
                string IgnoreDomainNames = ParseSetting(SettingGroup.Email, "IgnoreDomainNames", false);
                return string.IsNullOrEmpty(IgnoreDomainNames) ? new string[] { } : IgnoreDomainNames.ToLower().Split('|');
            }
        }

        public string[] AllowEmailIds
        {
            get
            {
                string AllowEmailIds = ParseSetting(SettingGroup.Email, "AllowEmailIds", false);
                return string.IsNullOrEmpty(AllowEmailIds) ? new string[] { } : AllowEmailIds.ToLower().Split('|');
            }
        }

        #endregion

        #region Message Settings

        public Boolean Is_Message_Allowed
        {
            get
            {
                return Convert.ToBoolean(ParseSetting(SettingGroup.Message, "Is_Message_Allowed"));
            }
        }

        public Boolean Is_Enqueue_Message_In_DB
        {
            get
            {
                return Convert.ToBoolean(ParseSetting(SettingGroup.Message, "Is_Enqueue_Message_In_DB"));
            }
        }

        public string RequestUriString
        {
            get
            {
                return _objSecurity.Decrypted(ParseSetting(SettingGroup.Message, "RequestUriString"));
            }
        }

        #endregion

        #region PasswordPolicy Settings

        public Boolean Is_Apply_Password_Policy
        {
            get
            {
                return Convert.ToBoolean(ParseSetting(SettingGroup.PasswordPolicy, "Is_Apply_Password_Policy"));
            }
        }

        public Boolean Is_OTP_Verification_Required
        {
            get
            {
                return Convert.ToBoolean(ParseSetting(SettingGroup.PasswordPolicy, "Is_OTP_Verification_Required"));
            }
        }

        public Int32 OTP_Expiry_Duration_In_Mins
        {
            get
            {
                return Convert.ToInt32(ParseSetting(SettingGroup.PasswordPolicy, "OTP_Expiry_Duration_In_Mins"));
            }
        }

        public Int32 Maximum_Password_Age
        {
            get
            {
                return Convert.ToInt32(ParseSetting(SettingGroup.PasswordPolicy, "Maximum_Password_Age"));
            }
        }

        public Int32 Account_Lockout_Threshold
        {
            get
            {
                return Convert.ToInt32(ParseSetting(SettingGroup.PasswordPolicy, "Account_Lockout_Threshold"));
            }
        }

        public Int32 Account_Lockout_Duration_In_Min
        {
            get
            {
                return Convert.ToInt32(ParseSetting(SettingGroup.PasswordPolicy, "Account_Lockout_Duration_In_Min"));
            }
        }

        public Int32 Reset_Account_Lockout_Counter_After_In_Min
        {
            get
            {
                return Convert.ToInt32(ParseSetting(SettingGroup.PasswordPolicy, "Reset_Account_Lockout_Counter_After_In_Min"));
            }
        }

        public string Wrong_Password_Attemp_Cookies
        {
            get
            {
                return ParseSetting(SettingGroup.PasswordPolicy, "Wrong_Password_Attemp_Cookies");
            }
        }

        #endregion

        #region Transaction Password Policy Settings

        public Boolean Is_Apply_Transaction_Password_Policy
        {
            get
            {
                return Convert.ToBoolean(ParseSetting(SettingGroup.TransactionPasswordPolicy, "Is_Apply_Transaction_Password_Policy"));
            }
        }

        public Int32 Account_Logout_Threshold
        {
            get
            {
                return Convert.ToInt32(ParseSetting(SettingGroup.TransactionPasswordPolicy, "Account_Logout_Threshold"));
            }
        }

        #endregion

        #region Party Flow Applicable Role Ids Settings

        public bool Party_Flow(YCS.EnumCollection.PartyFlow partyflow, string roleid)
        {
            string value = ParseSetting(SettingGroup.PartyFlowApplicableRoleIds, partyflow.ToString());
            if (value == null)
            {
                return false;
            }

            return value.Split(',').ToList<string>().Contains(roleid);
        }
        
        #endregion

        #region Auction Flow Applicable Role Ids Settings
        public bool Auction_Flow(YCS.EnumCollection.AuctionFlow Auctionflow, string roleid)
        {
            string value = ParseSetting(SettingGroup.AuctionFlowApplicableRoleIds, Auctionflow.ToString());
            if (value == null)
            {
                return false;
            }

            return value.Split(',').ToList<string>().Contains(roleid);
        }


        #endregion

        #region Role Setting

        public Int64 Admin
        {
            get
            {
                return Convert.ToInt64(ParseSetting(SettingGroup.Role, "Admin"));
            }
        }
        public Int64 Client
        {
            get
            {
                return Convert.ToInt64(ParseSetting(SettingGroup.Role, "Client"));
            }
        }
        public Int64 Customer
        {
            get
            {
                return Convert.ToInt64(ParseSetting(SettingGroup.Role, "Customer"));
            }
        }
        public Int64 Supplier
        {
            get
            {
                return Convert.ToInt64(ParseSetting(SettingGroup.Role, "Supplier"));
            }
        }
        public Int64 Publisher
        {
            get
            {
                return Convert.ToInt64(ParseSetting(SettingGroup.Role, "Publisher"));
            }
        }

        #endregion

        #region Private Functions

        private XmlDocument LoadCustomSettingXml()
        {
            XmlDocument xml = new XmlDocument();
            xml.Load(HttpContext.Current.Server.MapPath(@"~/CustomSetting.xml"));
            if (xml == null || string.IsNullOrEmpty(xml.InnerXml))
            {
                throw new Exception("Error While Loading CustomSetting.xml");
            }
            return xml;
        }

        private string ParseSetting(SettingGroup settingGroup, string settingKey, bool isSettingValueMandatory = true)
        {
            string xPath = "/Setting/" + settingGroup.ToString() + "/" + settingKey;
            string xNodeInnerText;
            XmlNode xNode = _customXml.DocumentElement.SelectSingleNode(xPath);
            if (xNode != null)
            {
                xNodeInnerText = xNode.InnerText.Trim();
            }
            else
            {
                throw new Exception(xPath + " Not Found in CustomSetting.xml");
            }

            if (isSettingValueMandatory && string.IsNullOrEmpty(xNodeInnerText))
            {
                throw new Exception(xPath + " Value Not Found in CustomSetting.xml");
            }

            return xNodeInnerText;
        }

        private enum SettingGroup
        {
            General,
            Email,
            Message,
            PasswordPolicy,
            TransactionPasswordPolicy,
            PartyFlowApplicableRoleIds,
            AuctionFlowApplicableRoleIds,
            Role
        }

        #endregion
    }
}