using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using YCS;

namespace eAuction.EAuction
{
    public partial class EditUser : System.Web.UI.Page
    {
        #region Global Objects

        DataConnection _objDataConnection = new DataConnection();
        DateTime _currentDateTime = DateTimeHandler.Get_Currentdate;
        ManageUserSession _objManageUserSession;
        Utility _objUtility = new Utility();
        MasterCollection _objMasterCollection = new MasterCollection();
        Message _objMessage = new Message();
        DBCommon _objDBCommon = new DBCommon();
        CustomAppSetting _objCustomAppSetting = new CustomAppSetting();

        //Role Type Enum Id
        Int64 Employee = 12;
        Int64 Client = 13;
        Int64 Customer = 14;
        Int64 Supplier = 15;
        //End
        #endregion

        #region Page Load Event
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                _objManageUserSession = new ManageUserSession();
                if (!IsPostBack)
                {
                    _TransactionPassword();
                    _Control_Clear();
                }
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }
        #endregion

        #region Private Function

        private void ControlDisabled()
        {
            //Employee
            txtEmployeeName.Enabled = false;
            txtEmployeeCode.Enabled = false;
            txtEmployee_Address.Enabled = false;
            txtEmployee_Email_Id.Enabled = false;
            txtEmployee_Pincode.Enabled = false;
            txtLoginId.Enabled = false;
            divEmployee.Visible = false;
            divParty.Visible = false;
            //End
            txtPartyDesignation.Enabled = false;
            txtPartyName.Enabled = false;
            txtParty_Address.Enabled = false;
            txtParty_Company_Code.Enabled = false;
            txtParty_Company_Name.Enabled = false;
            txtParty_Pincode.Enabled = false;
            txtParty_Email_Id.Enabled = false;

        }

        private void EmployeeDetails()
        {
            DataSet dsResult = _objMasterCollection.BindFirmEmployee(_objManageUserSession.GetCurrentLogin_User_Id, 0, 0, EnumCollection.SearchRecord.BOTH, null, false);
            if (dsResult != null && dsResult.Tables[0].Rows.Count > 0)
            {
                DataTable dt_Employee = dsResult.Tables[0];
                hdfEmployee_Id.Value = Convert.ToString(dt_Employee.Rows[0]["Employee_Id"]);
                txtEmployeeName.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Name"]);
                txtEmployeeCode.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Code"]);
                txtEmployee_Email_Id.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Email_Id"]);
                txtEmployee_Mobile_No.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Mobile_No"]);
                txtEmployee_Address.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Address"]);
                txtEmployee_Pincode.Text = Convert.ToString(dt_Employee.Rows[0]["Employee_Pincode"]);
                txtLoginId.Text = Convert.ToString(dt_Employee.Rows[0]["Login_Id"]);

            }
        }

        private void _Control_Clear()
        {
            _objUtility.AssignButtonValidationGroup(btnUpdateEmployee, "Update");
            _objUtility.AssignButtonValidationGroup(btnUpdateParty, "Update");
            _TransactionPassword();
            ControlDisabled();

            if (_objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == Employee)
            {
                divEmployee.Visible = true;
                divParty.Visible = false;
                btnUpdateEmployee.Visible = true;
                btnUpdateParty.Visible = false;
                EmployeeDetails();
            }
            else if (_objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == Client || _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == Customer || _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == Supplier)
            {
                divEmployee.Visible = false;
                divParty.Visible = true;
                btnUpdateEmployee.Visible = false;
                btnUpdateParty.Visible = true;
                Party();
            }
        }

        private void _TransactionPassword()
        {
            if (!_objUtility.ValidateDBNullEmptyValue(_objManageUserSession.GetCurrent_Trans_Password))
            {
                divTransactionPass.Attributes["class"] = "ShowPass";
                rfvUserTransactionPassword.ValidationGroup = "Save";
                lblTransactionPassword.Visible = true;
                txtUserTransactionPassword.Visible = true;
            }
            else
            {
                divTransactionPass.Attributes["class"] = "HidePass";
                rfvUserTransactionPassword.ValidationGroup = "Savexyz";
                lblTransactionPassword.Visible = false;
                txtUserTransactionPassword.Visible = false;
            }
        }

        private void Party()
        {
            DataSet dsResult = _objMasterCollection.BindParty(0, _objManageUserSession.GetCurrentLogin_Primary_Id, "0", 0, 0, 0, "", EnumCollection.SearchRecord.BOTH, null, false);

            if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count > 0)
            {
                DataTable dtParty = dsResult.Tables[0];

                hdfPartyId.Value = Convert.ToString(dtParty.Rows[0]["Party_Id"]);
                txtParty_Company_Name.Text = Convert.ToString(dtParty.Rows[0]["Party_Company_Name"]);
                txtParty_Company_Code.Text = Convert.ToString(dtParty.Rows[0]["Party_Company_Code"]);
                txtParty_Mobile_No.Text = Convert.ToString(dtParty.Rows[0]["Party_Contact_No"]);
                txtParty_Email_Id.Text = Convert.ToString(dtParty.Rows[0]["Party_Email_Id"]);

                hdfParty_Status_Id.Value = Convert.ToString(dtParty.Rows[0]["Party_Status_Id"]);
                hdfParty_URL_QS_Code.Value = Convert.ToString(dtParty.Rows[0]["Party_URL_QS_Code"]);

                txtParty_Address.Text = Convert.ToString(dtParty.Rows[0]["Party_Address"]);
                txtParty_Pincode.Text = Convert.ToString(dtParty.Rows[0]["Party_Pincode"]);

                if (dsResult.Tables[1].Rows.Count > 0)
                {
                    DataTable dtPartyPerson = dsResult.Tables[1];

                    for (int i = 0; i < dtPartyPerson.Rows.Count; i++)
                    {
                        hdfParty_Contact_Person_Id.Value = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Id"]);
                        txtPartyName.Text = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Name"]);
                        txtPartyDesignation.Text = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Designation"]);
                        //Temp Already Set from Master Table
                        txtParty_Mobile_No.Text = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Mobile_No"]);
                        txtParty_Email_Id.Text = Convert.ToString(dtPartyPerson.Rows[i]["Party_Contact_Person_Email_Id"]);
                        //end
                    }
                }
            }
        }

        #endregion

        #region Update Employee
        protected void btnUpdateEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValue(txtEmployee_Mobile_No.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtEmployee_Mobile_No, 6, "Mobile No.");
                    txtEmployee_Mobile_No.Focus();
                    return;
                }
                if (!_objUtility.IsValid_MobileNo(txtEmployee_Mobile_No.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtEmployee_Mobile_No, 6, "Valid  Mobile Number");
                    return;
                }

                DataSet dsResult = _objMasterCollection.BindFirmEmployee(Convert.ToInt64(hdfEmployee_Id.Value), 0, 0, EnumCollection.SearchRecord.BOTH, null, false);
                if (dsResult != null && dsResult.Tables[0].Rows.Count > 0)
                {
                    DataTable dt_Employee = dsResult.Tables[0];

                    DataTable dtFirmLink = _objMasterCollection.UT_Entities_Firm_Link;
                    DataTable dtDocumentLink = _objMasterCollection.UT_Entities_Documents_Link;

                    List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Id", Value = hdfEmployee_Id.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Login_User_Id", Value = 0 });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = dt_Employee.Rows[0]["Login_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Password", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "SaltValue", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "HashPassword", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Tran_Password", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Tran_SaltValue", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Tran_HashPassword", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Is_Password_Reset_Required", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Is_Trans_Password_Reset_Required", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Is_Profile_Update_Required", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Name", Value = dt_Employee.Rows[0]["Employee_Name"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Code", Value = dt_Employee.Rows[0]["Employee_Code"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Email_Id", Value = dt_Employee.Rows[0]["Employee_Email_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Mobile_No", Value = txtEmployee_Mobile_No.Text.Trim() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Telephone_No", Value = dt_Employee.Rows[0]["Employee_Telephone_No"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Address", Value = dt_Employee.Rows[0]["Employee_Address"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Pincode", Value = dt_Employee.Rows[0]["Employee_Pincode"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_State_Id", Value = dt_Employee.Rows[0]["Employee_State_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_City_Id", Value = dt_Employee.Rows[0]["Employee_City_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Date_Of_Birth", Value = dt_Employee.Rows[0]["Date_Of_Birth"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Gender_Type_Enum_Id", Value = dt_Employee.Rows[0]["Gender_Type_Enum_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Blood_Group_Enum_Id", Value = dt_Employee.Rows[0]["Blood_Group_Enum_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Profile_Pic_Path", Value = dt_Employee.Rows[0]["Profile_Pic_Path"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Documents", Value = dtDocumentLink });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Firm_Rights", Value = dtFirmLink });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = dt_Employee.Rows[0]["Status_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = "Edit Profile" });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = txtEditRemark.Text.Trim() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_User_Role_Id", Value = _objManageUserSession.GetCurrentUser_Role_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
                    lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                    lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Employee_WhatsApp_No", Value = dt_Employee.Rows[0]["Employee_WhatsApp_No"] });

                    lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = "UPDATE_PROFILE" });

                    lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                    Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Employee", lstDBMapParam);

                    if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                    {
                        _objMessage.ShowMessageWithURL(5, _objUtility.GetCurrentURL, "Updated");
                    }
                }
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }
        #endregion

        #region Update Party
        protected void btnUpdateParty_Click(object sender, EventArgs e)
        {
            try
            {
                if (_objUtility.ValidateDBNullEmptyValue(txtParty_Mobile_No.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtParty_Mobile_No, 6, "Mobile No.");
                    txtParty_Mobile_No.Focus();
                    return;
                }
                if (!_objUtility.IsValid_MobileNo(txtParty_Mobile_No.Text.Trim()))
                {
                    _objMessage.ShowMessage(sender, txtParty_Mobile_No, 6, "Valid  Mobile Number");
                    return;
                }

                DataSet dsResult = _objMasterCollection.BindParty(0, Convert.ToInt64(hdfPartyId.Value), "0", 0, 0, 0, "", EnumCollection.SearchRecord.BOTH, null, false);

                if (dsResult != null && dsResult.Tables.Count > 0 && dsResult.Tables[0].Rows.Count > 0)
                {
                    DataTable dtParty = dsResult.Tables[0];

                    DataTable dtFirmLink = _objMasterCollection.UT_Entities_Firm_Link;
                    DataTable dtDocumentLink = _objMasterCollection.UT_Entities_Documents_Link;
                    DataTable dtDealCategoryLink = _objMasterCollection.UT_Party_Deal_Category_Link;
                    DataTable dtContactPerson = _objMasterCollection.UT_Party_Contact_Person;
                    DataTable dtBusinessUnit = _objMasterCollection.UT_Party_Business_Unit;

                    List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Id", Value = hdfPartyId.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Login_Id", Value = dtParty.Rows[0]["Login_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Password", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "SaltValue", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "HashPassword", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Is_Password_Reset_Required", Value = false });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Is_Trans_Password_Reset_Required", Value = false });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Is_Profile_Update_Required", Value = false });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Type_Enum_Id", Value = dtParty.Rows[0]["Party_Type_Enum_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Company_Type_Id", Value = dtParty.Rows[0]["Company_Type_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Company_Name", Value = dtParty.Rows[0]["Party_Company_Name"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Company_Code", Value = dtParty.Rows[0]["Party_Company_Code"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Contact_No", Value = txtParty_Mobile_No.Text });//Temp Set
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Fax_No", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Email_Id", Value = dtParty.Rows[0]["Party_Email_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Website", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Address", Value = dtParty.Rows[0]["Party_Address"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Pincode", Value = dtParty.Rows[0]["Party_Pincode"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Country_Id", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_State_Id", Value = dtParty.Rows[0]["Party_State_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_City_Id", Value = dtParty.Rows[0]["Party_City_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = dtParty.Rows[0]["Role_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Profile_Pic_Path", Value = dtParty.Rows[0]["Profile_Pic_Path"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_WhatsApp_No", Value = dtParty.Rows[0]["Party_WhatsApp_No"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Tran_Password", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Tran_SaltValue", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Tran_HashPassword", Value = DBNull.Value });

                    lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = dtParty.Rows[0]["Status_Id"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Business_Unit", Value = dtBusinessUnit });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Login_User_Id", Value = hdfParty_Login_User_Id.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_URL_QS_Code", Value = dtParty.Rows[0]["Party_URL_QS_Code"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Is_Notify", Value = dtParty.Rows[0]["Is_Notify"] });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Contact_Persons", Value = dtContactPerson });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Deal_Category_Link", Value = dtDealCategoryLink });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Documents", Value = dtDocumentLink });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Party_Firm_Links", Value = dtFirmLink });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_Status_Id", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = "Edit Profile" });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_Remarks", Value = txtEditRemark.Text.Trim() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_User_Role_Id", Value = _objManageUserSession.GetCurrentUser_Role_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
                    lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = _currentDateTime });
                    lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
                    lstDBMapParam.Add(new DBMapParam() { Name = "ActionFrom_Screen", Value = this.Page.ToString() });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action_Menu_Code", Value = DBNull.Value });
                    lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = "UPDATE_PROFILE" });
                    lstDBMapParam.Add(new DBMapParam() { Name = "OutputMessage", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });

                    Dictionary<string, object> dictResult = _objDataConnection.ExecuteNonQuery("SP_IU_Party", lstDBMapParam);

                    if (Convert.ToString(dictResult["OutputMessage"]) == "SUCCESS")
                    {
                        _objMessage.ShowMessageWithURL(5, _objUtility.GetCurrentURL, "Updated");
                    }
                }
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                _objUtility.UserErrorMessage(this.ToString(), ex);
            }
        }
        #endregion
    }
}