using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;


namespace YCS
{
    public class MasterCollection
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="control"></param>
        /// <param name="statustype"></param>
        /// <param name="insertdefault"></param>
        /// <param name="statusid"></param>
        /// <returns></returns>
        /// 
        Utility _objUtilily = new Utility();
        public DataTable FillAnyListFromEnum(dynamic control, EnumCollection.EnumType EnumType, Int64 Status_Id, bool? IsVisible, Int64 Enum_Id = 0, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "EnumType", Value = EnumType.ToString() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Enum_Id", Value = Enum_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            if (IsVisible == null)
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Visible", Value = DBNull.Value });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Visible", Value = IsVisible });
            }

            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_CommanAll_Enum_Id", lstDBMapParam);
            new DBCommon().Bind_Control(control, dt, insertdefault);

            return dt;
        }

        public string GenerateNumber()
        {
            List<DBMapParam> param = new List<DBMapParam>();
            param.Add(new DBMapParam() { Name = "Table_Name", Value = "TBLTRN_MEMBER_LOAN_REGISTRATION" });
            param.Add(new DBMapParam() { Name = "Column_Name", Value = "MID" });
            param.Add(new DBMapParam() { Name = "Internal_Code", Value = "", ParameterDirection = ParameterDirection.Output, SqlDbType = SqlDbType.VarChar, Size = 1024 });
            Dictionary<string, object> dictResult = new DataConnection().ExecuteNonQuery("SP_Get_Next_Internal_Code", param);
            string NewGenerateNumber = Convert.ToString(dictResult["Internal_Code"]);
            return NewGenerateNumber;
        }

        /// <summary>
        /// Fill Status data to Any type of control from Database (Dropdown / Listbox)
        /// </summary>
        /// <param name="control">any type of web control</param>
        /// <param name="statustype"> Status type wise data filter</param>
        /// <param name="insertdefault"> insert default list item for first position or not</param>
        /// <returns></returns>
        public DataTable FillStatus(dynamic control, EnumCollection.StatusType Status_Type, bool insertdefault = true)
        {
            ClearControl(control);

            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Type", Value = Status_Type.ToString() });

            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Status_List", lstDBMapParam);
            new DBCommon().Bind_Control(control, dt, insertdefault);

            return dt;
        }

        /// <summary>
        /// Bind Role Master Data to any control (Dropdown/Listbox/Gridview)
        /// </summary>
        /// <param name="RoleId">Pass 0 for all Role and non zero for single Role </param>
        /// <param name="statusId">Pass 1 for Active Zones and 0 for all status Zones</param>
        /// <param name="control">any type of web control</param>
        /// <param name="insertdefault">insert default list item for first position or not</param>
        /// <returns>Datatable with Role Master Data</returns>

        public DataTable BindMenu(Int64 statusId, dynamic control, bool insertdefault = true, bool? clickable = true, bool? viewable = true, Int64 MenuId = 0, Int64? parentmenuid = 0)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Menu_Id", Value = MenuId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = statusId });
            if (clickable == null)
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Clickable", Value = DBNull.Value });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Clickable", Value = clickable });
            }

            if (viewable == null)
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Viewable", Value = DBNull.Value });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_Viewable", Value = viewable });
            }

            if (parentmenuid == null)
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Parent_Menu_Id", Value = DBNull.Value });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Parent_Menu_Id", Value = parentmenuid });
            }
            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Menu", lstDBMapParam);

            new DBCommon().Bind_Control(control, dt, insertdefault, "Menu_Id", "Menu_Name");

            return dt;
        }

        /// <summary>
        /// Bind Menu Master Data to any control (Dropdown/Listbox/Gridview)
        /// </summary>
        /// /// <param name="MenuId">Pass 1 for Active Menu and 0 for all Menu</param>
        /// <param name="statusId">Pass 1 for Active Party Types and 0 for all status State</param>
        /// <param name="control">any type of web control</param>
        /// <param name="insertdefault">insert default list item for first position or not</param>
        /// <returns>Datatable with Menu Master Data</returns>
        public DataTable BindRoleMenuRight(Int64 RoleMenuRightId, Int64 statusId, dynamic control, bool insertdefault = true, Int64 RoleId = 0, Int64 FirmId = 0, Int64 MenuId = 0)
        {
            ClearControl(control);

            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Menu_Right_Id", Value = RoleMenuRightId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = FirmId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = RoleId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Menu_Id", Value = MenuId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = statusId });
            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Role_Menu_Right", lstDBMapParam);

            new DBCommon().Bind_Control(control, dt, insertdefault, "Menu_Id", "Menu_Name");

            return dt;
        }

        /// <summary>
        /// Bind Menu Master Data to any control (Dropdown/Listbox/Gridview)
        /// </summary>
        /// /// <param name="MenuId">Pass 1 for Active Menu and 0 for all Menu</param>
        /// <param name="statusId">Pass 1 for Active Party Types and 0 for all status State</param>
        /// <param name="control">any type of web control</param>
        /// <param name="insertdefault">insert default list item for first position or not</param>
        /// <returns>Datatable with Menu Master Data</returns>
        public DataTable BindRoleDashboardRight(Int64 Role_Menu_Right_Id, Int64 FirmId, Int64 RoleId, string Dashboard_Type_Code, Int64 Dashboard_Id, Int64 Menu_Id, Int64 statusId, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);

            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Menu_Right_Id", Value = Role_Menu_Right_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = FirmId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = RoleId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Dashboard_Id", Value = Dashboard_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Menu_Id", Value = Menu_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Dashboard_Type_Code", Value = Dashboard_Type_Code });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = statusId });
            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Role_Dashboard_Right", lstDBMapParam);

            new DBCommon().Bind_Control(control, dt, insertdefault, "Dashboard_Id", "Dashboard_Name");

            return dt;
        }

        public void InsertListItem(dynamic control, Int64 index = 0, string text = "-- All --", string value = "0")
        {
            if (control != null)
            {
                if (control.GetType() == typeof(DropDownList) || control.GetType() == typeof(ListBox) || control.GetType() == typeof(CheckBoxList))
                {
                    if (control.Items.FindByValue(value) == null)
                    {
                        control.Items.Insert(0, new ListItem(text, value));
                    }
                    else
                    {
                        throw new Exception("Item With Value '" + value + "' Already Exists");
                    }
                }
            }
        }

        /// <summary>
        /// Insert or Update file import track data
        /// </summary>
        /// <param name="fileImportTrackId"></param>
        /// <param name="importedFileName"></param>
        /// <param name="importStartDate"></param>
        /// <param name="importEndDate"></param>
        /// <param name="rowCount"></param>
        /// <param name="exceptionOccurred"></param>
        /// <param name="statusId"></param>
        /// <param name="remarks"></param>
        /// <returns></returns>
        public Int64 SaveFileImportTrack(Int64 fileImportTrackId, string importedFileName, DateTime? importStartDate, DateTime? importEndDate, Int64 rowCount, string exceptionOccurred, Int64 statusId, string remarks)
        {
            ManageUserSession _objManageUserSession = new ManageUserSession();
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "File_Import_Track_Id", Value = fileImportTrackId, ParameterDirection = ParameterDirection.InputOutput, SqlDbType = SqlDbType.BigInt, Size = 1024 });
            lstDBMapParam.Add(new DBMapParam() { Name = "Imported_File_Name", Value = importedFileName });
            if (importStartDate == null)
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "ImportStart_Date", Value = DBNull.Value });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "ImportStart_Date", Value = importStartDate });
            }

            if (importEndDate == null)
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "ImportEnd_Date", Value = DBNull.Value });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "ImportEnd_Date", Value = importEndDate });
            }

            lstDBMapParam.Add(new DBMapParam() { Name = "Row_Count", Value = rowCount });
            lstDBMapParam.Add(new DBMapParam() { Name = "Exception_Occurred", Value = exceptionOccurred });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = statusId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Remarks", Value = remarks });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = _objManageUserSession.GetCurrentLogin_User_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "CurrentDateTime", Value = DateTimeHandler.Get_Currentdate });
            lstDBMapParam.Add(new DBMapParam() { Name = "LoginSessionId", Value = _objManageUserSession.GetCurrentUser_LoginSessionId });
            Dictionary<string, object> dictResult = new DataConnection().ExecuteNonQuery("SP_IU_File_Import_Track", lstDBMapParam);
            return Convert.ToInt64(dictResult["File_Import_Track_Id"]);

        }

        private void ClearControl(dynamic control)
        {
            if (control != null)
            {
                if (control.GetType() == typeof(DropDownList) || control.GetType() == typeof(ListBox))
                {
                    control.Items.Clear();
                }
            }
        }

        public DataTable BindReport(Int64 roleId, Int64 reportId, string reportCode, Int64 statusId, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);

            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Report_Id", Value = reportId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = statusId });
            lstDBMapParam.Add(new DBMapParam() { Name = "Report_Code", Value = reportCode });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = roleId });


            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Report", lstDBMapParam);

            new DBCommon().Bind_Control(control, dt, insertdefault, "Report_Id", "Report_Name");

            return dt;
        }

        public DataTable BindCurrency(Int64 Currency_Id, Int64 Status_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Currency_Id", Value = Currency_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });

            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Currency", lstDBMapParam);

            new DBCommon().Bind_Control(control, dt, insertdefault, "Currency_Id", "Currency_Name");

            return dt;
        }

        #region Master Screens Bind
        public DataSet BindFirmList(Int64 Firm_Id, EnumCollection.SearchRecord SearchRecord, Int64 Status_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = Firm_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = SearchRecord.ToString() });
            DataSet ds = new DataConnection().GetDatasetSP("SP_Get_Firm", lstDBMapParam);
            if (ds != null && ds.Tables.Count > 0)
            {
                new DBCommon().Bind_Control(control, ds.Tables[0], insertdefault, "Firm_Id", "Firm_Name");
            }

            return ds;
        }
        public DataTable FillDocument(dynamic control, Int64 Document_Id, Int64 Status_Id, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Document_Id", Value = Document_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Document", lstDBMapParam);
            new DBCommon().Bind_Control(control, dt, insertdefault);
            return dt;
        }
        public DataTable BindRole(Int64 Role_Id, Int64 Status_Id, dynamic control, bool insertdefault = true, Int64 Role_Type_Enum_Id = 0, bool? Is_Visible = null)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = Role_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Type_Enum_Id", Value = Role_Type_Enum_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Is_Visible", Value = _objUtilily.ValidateDBNullEmptyValue(Is_Visible, DBNull.Value) });

            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Role", lstDBMapParam);

            new DBCommon().Bind_Control(control, dt, insertdefault, "Role_Id", "Role_Name");

            return dt;
        }
        public DataSet BindFirmEmployee(Int64 Employee_Id, Int64 Status_Id, dynamic control, bool insertdefault = true, Int64 FirmId = 0, bool? IsUserHasAccessControl = null)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Id", Value = Employee_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = FirmId });
            if (IsUserHasAccessControl == null)
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_User_Has_Access_Control", Value = DBNull.Value });
            }
            else
            {
                lstDBMapParam.Add(new DBMapParam() { Name = "Is_User_Has_Access_Control", Value = IsUserHasAccessControl });
            }
            DataSet ds = new DataConnection().GetDatasetSP("SP_Get_Firm_Employee", lstDBMapParam);
            if (ds != null || ds.Tables[0] != null)
            {
                new DBCommon().Bind_Control(control, ds.Tables[0], insertdefault, "Employee_Id", "Employee_Name");
            }

            return ds;
        }
        public DataTable FillFirmDocumentSettingDetails(dynamic control, Int64 Firm_Id, Int64 Status_Id, string Employee_Control_Status_Enum_Ids, string Supplier_Control_Status_Enum_Ids, string Customer_Control_Status_Enum_Ids, string Client_Control_Status_Enum_Ids, bool insertdefault = true)
        {

            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = Firm_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Supplier_Control_Status_Enum_Ids", Value = Supplier_Control_Status_Enum_Ids });
            lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Control_Status_Enum_Ids", Value = Employee_Control_Status_Enum_Ids });
            lstDBMapParam.Add(new DBMapParam() { Name = "Customer_Control_Status_Enum_Ids", Value = Customer_Control_Status_Enum_Ids });
            lstDBMapParam.Add(new DBMapParam() { Name = "Client_Control_Status_Enum_Ids", Value = Client_Control_Status_Enum_Ids });

            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Document_Setting", lstDBMapParam);
            new DBCommon().Bind_Control(control, dt, insertdefault);

            return dt;
        }
        public DataTable BindUnit(Int64 Unit_Id, Int64 Status_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Unit_Id", Value = Unit_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });

            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Unit", lstDBMapParam);

            new DBCommon().Bind_Control(control, dt, insertdefault, "Unit_Id", "Unit_Name");

            return dt;
        }
        public DataTable BindCompanyType(Int64 Company_Type_Id, Int64 Status_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Company_Type_Id", Value = Company_Type_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });

            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Company_Type", lstDBMapParam);

            new DBCommon().Bind_Control(control, dt, insertdefault, "Company_Type_Id", "Company_Type_Name");

            return dt;
        }
        public DataSet BindCategory(Int64 Category_Id, Int64 Category_Type_Enum_Id, Int64 Status_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Category_Id", Value = Category_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Category_Type_Enum_Id", Value = Category_Type_Enum_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            DataSet ds = new DataConnection().GetDatasetSP("SP_Get_Category", lstDBMapParam);
            if (ds != null && ds.Tables.Count > 0)
            {
                new DBCommon().Bind_Control(control, ds.Tables[0], insertdefault, "Category_Id", "Category_Name");
            }

            return ds;
        }
        public DataSet BindState(Int64 State_Id, Int64 Status_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "State_Id", Value = State_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            DataSet ds = new DataConnection().GetDatasetSP("SP_Get_State", lstDBMapParam);
            if (ds != null && ds.Tables.Count > 0)
            {
                new DBCommon().Bind_Control(control, ds.Tables[0], insertdefault, "State_Id", "State_Name");
            }

            return ds;
        }
        public DataSet BindCity(Int64 City_Id, Int64 State_Id, Int64 Status_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "City_Id", Value = City_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "State_Id", Value = State_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            DataSet ds = new DataConnection().GetDatasetSP("SP_Get_City", lstDBMapParam);
            if (ds != null && ds.Tables.Count > 0)
            {
                new DBCommon().Bind_Control(control, ds.Tables[0], insertdefault, "City_Id", "City_Name");
            }

            return ds;
        }


        public DataSet BindFirmEmployee(Int64 Employee_Id, Int64 Status_Id, Int64 Firm_Id, EnumCollection.SearchRecord SearchRecord, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Employee_Id", Value = Employee_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = Firm_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = SearchRecord.ToString() });
            DataSet ds = new DataConnection().GetDatasetSP("SP_Get_Employee", lstDBMapParam);
            if (ds != null && ds.Tables.Count > 0)
            {
                new DBCommon().Bind_Control(control, ds.Tables[0], insertdefault, "Employee_Id", "Employee_Name");
            }

            return ds;
        }


        public DataSet BindParty(Int64 Firm_Id, Int64 Party_Id, string Party_Type_Enum_Ids, Int64 Company_Type_Id, Int64 Party_Status_Id, Int64 Status_Id, string CompanyNameAndCode, EnumCollection.SearchRecord SearchRecord, dynamic control, bool insertdefault = true, Int64 Dealing_In_Enum_Type_Id = 0)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = Firm_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Id", Value = Party_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Type_Enum_Ids", Value = Party_Type_Enum_Ids });
            lstDBMapParam.Add(new DBMapParam() { Name = "Company_Type_Id", Value = Company_Type_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Status_Id", Value = Party_Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Company_Name_Code", Value = _objUtilily.ValidateDBNullEmptyValue(CompanyNameAndCode, "") });
            lstDBMapParam.Add(new DBMapParam() { Name = "Action", Value = SearchRecord.ToString() });
            lstDBMapParam.Add(new DBMapParam() { Name = "Dealing_In_Enum_Type_Id", Value = Dealing_In_Enum_Type_Id });

            DataSet ds = new DataConnection().GetDatasetSP("SP_Get_Party", lstDBMapParam);
            if (ds != null && ds.Tables.Count > 0)
            {
                new DBCommon().Bind_Control(control, ds.Tables[0], insertdefault, "Party_Id", "Party_Company_Name");
            }

            return ds;
        }

        public DataSet BindAuction(Int64 Firm_Id, Int64 Auction_Id, Int64 Status_Id, Int64 Role_Enum_Type_Id, Int64 Role_Id, Int64 Login_User_Id, DateTime CurrentDateTime, Int64 Party_Id, dynamic control, Int64 DashBoard_Id = 5, bool insertdefault = true) //5-All Auction
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "DashBoard_Id", Value = DashBoard_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = Firm_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Id", Value = Auction_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = Role_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Type_Enum_Id", Value = Role_Enum_Type_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = Login_User_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Current_Date", Value = _objUtilily.ValidateDBNullEmptyValue(CurrentDateTime, DBNull.Value) });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Id", Value = Party_Id });
            DataSet ds = new DataConnection().GetDatasetSP("SP_Get_Auction", lstDBMapParam);

            if (ds != null && ds.Tables.Count > 0)
            {
                new DBCommon().Bind_Control(control, ds.Tables[0], insertdefault, "Auction_Id", "Auction_Name");
            }

            return ds;
        }

        public DataTable BindAuctionDashboard(Int64 Firm_Id, Int64 Status_Id, Int64 Role_Enum_Type_Id, Int64 Role_Id, Int64 Login_User_Id, DateTime CurrentDateTime, Int64 Party_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = Firm_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = Role_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Type_Enum_Id", Value = Role_Enum_Type_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = Login_User_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Current_Date", Value = _objUtilily.ValidateDBNullEmptyValue(CurrentDateTime, DBNull.Value) });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Id", Value = Party_Id });
            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Dashboard_Auction", lstDBMapParam);

            if (dt.Rows.Count > 0)
            {
                new DBCommon().Bind_Control(control, dt, insertdefault, "Auction_Type", "No_Of_Auction");
            }

            return dt;
        }

        public DataTable BindAuctionBid(Int64 Firm_Id, Int64 Auction_Id, Int64 Status_Id, Int64 Role_Enum_Type_Id, Int64 Role_Id, Int64 Login_User_Id, DateTime? CurrentDateTime, Int64 Party_Id, Int64 Auction_Item_Link_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Firm_Id", Value = Firm_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Id", Value = Auction_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Id", Value = Role_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Role_Type_Enum_Id", Value = Role_Enum_Type_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Login_UserId", Value = Login_User_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Current_Date", Value = _objUtilily.ValidateDBNullEmptyValue(CurrentDateTime, DBNull.Value) });
            lstDBMapParam.Add(new DBMapParam() { Name = "Party_Id", Value = Party_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Item_Link_Id", Value = Auction_Item_Link_Id });
            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Auction_Bid", lstDBMapParam);

            if (dt != null && dt.Rows.Count > 0)
            {
                new DBCommon().Bind_Control(control, dt, insertdefault, "Auction_Party_Item_Bid_Id", "Bid");
            }

            return dt;
        }

        public DataTable BindAuctionHighestBidItem(Int64 Auction_Party_Item_Bid_Id,Int64 Auction_Party_Link_Id,Int64 Auction_Item_Link_Id, Int64 Auction_Id, Int64 Status_Id, dynamic control, bool insertdefault = true)
        {
            ClearControl(control);
            List<DBMapParam> lstDBMapParam = new List<DBMapParam>();
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Party_Item_Bid_Id", Value = Auction_Party_Item_Bid_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Party_Link_Id", Value = Auction_Party_Link_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Item_Link_Id", Value = Auction_Item_Link_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Auction_Id", Value = Auction_Id });
            lstDBMapParam.Add(new DBMapParam() { Name = "Status_Id", Value = Status_Id });
         
            DataTable dt = new DataConnection().GetDatatableSP("SP_Get_Highest_Bid_Item", lstDBMapParam);

            if (dt != null && dt.Rows.Count > 0)
            {
                new DBCommon().Bind_Control(control, dt, insertdefault, "Auction_Party_Item_Bid_Id", "Bid");
            }

            return dt;
        }

        #endregion

        #region UT Declaration

        public DataTable UT_TBLFRMAUC_AUCTION_ITEM_LINK
        {
            get
            {
                DataTable dtColumn = new DataTable();
                dtColumn.Columns.Add("Auction_Item_Link_Id", typeof(Int64));
                dtColumn.Columns.Add("Auction_Id", typeof(Int64));
                dtColumn.Columns.Add("Item_Category_Id", typeof(Int64));
                dtColumn.Columns.Add("Item_Category_Name");
                dtColumn.Columns.Add("Item_Sub_Category_Id", typeof(Int64));
                dtColumn.Columns.Add("Item_Sub_Category_Name");

                dtColumn.Columns.Add("Item_Code");
                dtColumn.Columns.Add("Item_Name");
                dtColumn.Columns.Add("Item_Desc");
                dtColumn.Columns.Add("Quantity", typeof(decimal));
                dtColumn.Columns.Add("Unit_Id", typeof(Int64));
                dtColumn.Columns.Add("Unit_Name");

                dtColumn.Columns.Add("Reserve_Price", typeof(decimal));
                dtColumn.Columns.Add("Applicable_Tax_In_Percentage", typeof(decimal));
                dtColumn.Columns.Add("Start_Price", typeof(decimal));
                dtColumn.Columns.Add("Minimum_Bid_Change", typeof(decimal));
                dtColumn.Columns.Add("Bid_Cushion_Limit", typeof(decimal));
                dtColumn.Columns.Add("CMD", typeof(decimal));
                dtColumn.Columns.Add("Attachment_File_Path1");
                dtColumn.Columns.Add("Attachment_File_Path2");
                dtColumn.Columns.Add("Attachment_File_Path3");

                dtColumn.Columns.Add("Status_Id", typeof(Int64));
                dtColumn.Columns.Add("Remarks");
                dtColumn.Columns.Add("Row_No", typeof(Int64));
                return dtColumn;
            }
        }

        public DataTable UT_TBLFRMAUC_AUCTION_PARTY_LINK
        {
            get
            {
                DataTable dtColumn = new DataTable();
                dtColumn.Columns.Add("Auction_Party_Link_Id", typeof(Int64));
                dtColumn.Columns.Add("Auction_Id", typeof(Int64));
                dtColumn.Columns.Add("Party_Id", typeof(Int64));
                dtColumn.Columns.Add("Status_Id", typeof(Int64));
                dtColumn.Columns.Add("Remarks");
                dtColumn.Columns.Add("Row_No", typeof(Int64));
                dtColumn.Columns.Add("Is_Accept_Auction", typeof(bool));
                dtColumn.Columns.Add("Accept_Remarks");

                return dtColumn;
            }
        }

        public DataTable UT_Entities_Firm_Link
        {
            get
            {
                DataTable dtColumn = new DataTable();
                dtColumn.Columns.Add("Entity_Firm_Link_Id", typeof(Int64));
                dtColumn.Columns.Add("Firm_Id", typeof(Int64));
                dtColumn.Columns.Add("Is_Default", typeof(bool));
                dtColumn.Columns.Add("Department_Id", typeof(Int64));
                dtColumn.Columns.Add("Role_Id", typeof(Int64));
                dtColumn.Columns.Add("Date_Of_Joining", typeof(DateTime));
                dtColumn.Columns.Add("Date_Of_Leaving", typeof(DateTime));
                dtColumn.Columns.Add("Status_Id", typeof(Int64));
                dtColumn.Columns.Add("Remarks");
                dtColumn.Columns.Add("Row_No", typeof(Int64));
                return dtColumn;
            }
        }

        public DataTable UT_Entities_Documents_Link
        {
            get
            {
                DataTable dtColumn = new DataTable();
                dtColumn.Columns.Add("Entity_Document_Id", typeof(Int64));
                dtColumn.Columns.Add("Document_Id", typeof(Int64));
                dtColumn.Columns.Add("Unique_No");
                dtColumn.Columns.Add("Name_As_Per_Document");
                dtColumn.Columns.Add("Name_As_Per_Third_Party");
                dtColumn.Columns.Add("Document_Detail");
                dtColumn.Columns.Add("Valid_From_Date", typeof(DateTime));
                dtColumn.Columns.Add("Valid_Upto_Date", typeof(DateTime));
                dtColumn.Columns.Add("Document_Path");
                dtColumn.Columns.Add("Status_Id", typeof(Int64));
                dtColumn.Columns.Add("Remarks");
                dtColumn.Columns.Add("Row_No", typeof(Int64));
                return dtColumn;
            }
        }

        public DataTable UT_Party_Deal_Category_Link
        {
            get
            {
                DataTable dtColumn = new DataTable();
                dtColumn.Columns.Add("Party_Deal_Category_Link_Id", typeof(Int64));
                dtColumn.Columns.Add("Dealing_In_Enum_Type_Id", typeof(Int64));
                dtColumn.Columns.Add("Category_Id", typeof(Int64));
                dtColumn.Columns.Add("Status_Id", typeof(Int64));
                dtColumn.Columns.Add("Remarks");
                dtColumn.Columns.Add("Row_No", typeof(Int64));
                return dtColumn;
            }
        }

        public DataTable UT_Party_Contact_Person
        {
            get
            {
                DataTable dtColumn = new DataTable();
                dtColumn.Columns.Add("Party_Contact_Person_Id", typeof(Int64));
                dtColumn.Columns.Add("Party_Contact_Person_Name");
                dtColumn.Columns.Add("Party_Contact_Person_Department");
                dtColumn.Columns.Add("Party_Contact_Person_Designation");
                dtColumn.Columns.Add("Party_Contact_Person_Telephone_No");
                dtColumn.Columns.Add("Party_Contact_Person_Email_Id");
                dtColumn.Columns.Add("Party_Contact_Person_Mobile_No");
                dtColumn.Columns.Add("Is_Party_Contact_Person_Has_On_Whatsapp", typeof(bool));
                dtColumn.Columns.Add("Party_Contact_Person_Alternate_Mobile_No");
                dtColumn.Columns.Add("Is_Party_Contact_Person_Alternate_Has_On_Whatsapp", typeof(bool));
                dtColumn.Columns.Add("Party_Contact_Person_Date_Of_Birth", typeof(DateTime));
                dtColumn.Columns.Add("Party_Contact_Person_Anniversary_Date", typeof(DateTime));
                dtColumn.Columns.Add("Party_Contact_Person_WhatsApp_No");
                dtColumn.Columns.Add("Is_Notify", typeof(bool));
                dtColumn.Columns.Add("Status_Id", typeof(Int64));
                dtColumn.Columns.Add("Remarks");
                dtColumn.Columns.Add("Row_No", typeof(Int64));
                return dtColumn;
            }
        }

        public DataTable UT_Party_Business_Unit
        {
            get
            {
                DataTable dtColumn = new DataTable();
                dtColumn.Columns.Add("Party_Business_Unit_Id", typeof(Int64));
                dtColumn.Columns.Add("Business_Unit_Name");
                dtColumn.Columns.Add("Business_Unit_Address");
                dtColumn.Columns.Add("Status_Id", typeof(Int64));
                dtColumn.Columns.Add("Remarks");
                dtColumn.Columns.Add("Action_Remarks");
                dtColumn.Columns.Add("Row_No", typeof(Int64));
                return dtColumn;
            }
        }

        #endregion
    }
}