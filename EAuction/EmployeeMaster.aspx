<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeMaster.aspx.cs" Inherits="eAuction.EmployeeMaster" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function UploadFile(fileUpload) {
            Page_BlockSubmit = false;
            var id = fileUpload.id;
            id = id.replace("ContentPlaceHolder1_fuUploadImage", "ContentPlaceHolder1_btnImage")
            if (fileUpload.value != '') {
                document.getElementById(id).click();
                document.getElementById('divModelProgress').style.display = 'block';
            }
        }
    </script>

    <script type="text/javascript">
        function triggerFileUpload() {
            if (document.getElementById('divModelProgress').style.display == 'block') {
                return;
            }

            document.getElementById("ContentPlaceHolder1_fuUploadImage").click();
            UploadFile(document.getElementById("ContentPlaceHolder1_fuUploadImage"));
        }

    </script>

    <script type="text/javascript">
        function UploadFileDoc(fileUpload) {
            Page_BlockSubmit = false;
            var id = fileUpload.id;
            id = id.replace("fuDocumentUploadImage", "btnDocumentImage")
            if (fileUpload.value != '') {
                document.getElementById(id).click();
                document.getElementById('divModelProgress').style.display = 'block';
            }
        }
    </script>

    <script type="text/javascript">
        function triggerFileUploadDoc(fileUpload) {
            if (document.getElementById('divModelProgress').style.display == 'block') {
                return;
            }
            var id = fileUpload.id
            id = id.replace("ImageDocument", "fuDocumentUploadImage")

            document.getElementById(id).click();
            UploadFileDoc(document.getElementById(id));
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-ak100">
                    <div class="card">
                        <div class="card-block">
                            <div class="row">
                                <li id="liMenuHeaderIcon" runat="server"></li>
                                <span id="spanHeader" runat="server" class="sub-title">Employee Master</span>
                                <hr />
                            </div>

                            <div class="row form-group">
                                <div class="col-ak20">
                                    <label class="col-form-label">Employee Name<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmployeeName" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtEmployeeName" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    <asp:HiddenField Visible="false" ID="hdfEmployee_Id" runat="server" Value="0" />
                                    <asp:HiddenField Visible="false" ID="hdfEmployee_Login_User_Id" runat="server" Value="0" />
                                </div>
                                <div class="col-ak20">
                                    <label class="col-form-label">Employee Code<span class="text-red">*</span></label>
                                    <asp:TextBox ID="txtEmployeeCode" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmployeeCode" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtEmployeeCode" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                </div>


                                <div class="col-ak20">
                                    <label class="col-form-label">Role<span class="text-red"> *</span></label>
                                    <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control" AutoComplete="off">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvRole" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlRole" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                </div>
								<%--<div class="col-ak20">
                                    <label class="col-form-label">Login Id<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtLoginId" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLoginId" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtLoginId" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

                                </div>--%>
                                <div class="col-ak20">
                                    <label class="col-form-label">Email Id<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtEmployee_Email_Id" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmailId" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtEmployee_Email_Id" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmployee_Email_Id" ValidationGroup="Save" ForeColor="Red" ErrorMessage="Invalid Email" ValidationExpression="^\w*(?=\w*[a-zA-z])\w+([-.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-ak20">
                                    <label class="col-form-label">Mobile No.<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtEmployee_Mobile_No" runat="server" CssClass="form-control" AutoComplete="off" MaxLength="10" onkeydown="return AllowNumericOnly(event);"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_MobileNo" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtEmployee_Mobile_No" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rev_MobileNo" runat="server" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Invalid Mobile No." ToolTip="Invalid Mobile No." ControlToValidate="txtEmployee_Mobile_No" ValidationGroup="Save" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-ak20">
                                    <label class="col-form-label">WhatsApp No.<span class="text-red"> </span></label>
                                    <asp:TextBox ID="txtEmployeeWhatsAppNo" runat="server" CssClass="form-control" AutoComplete="off" MaxLength="10" onkeydown="return AllowNumericOnly(event);"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="regEmployeeWhatsAppNo" runat="server" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Invalid WhatsApp No." ToolTip="Invalid WhatsApp No." ControlToValidate="txtEmployeeWhatsAppNo" ValidationGroup="Save" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-ak60">
                                    <label class="col-form-label">Address<span class="text-red"> </span></label>
                                    <asp:TextBox ID="txtEmployee_Address" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                </div>
                                <div class="col-ak20">
                                    <label class="col-form-label">Pincode<span class="text-red"> </span></label>
                                    <asp:TextBox ID="txtEmployee_Pincode" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowNumericOnly(event);" MaxLength="6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-ak25">
                                    <label id="lblPhoto" runat="server" class="col-form-label">Upload Profile Picture  </label>
                                    <asp:Image ID="PreviewProfilePicture" src="../Images/camera.jpg" title="Upload Photo" onclick="triggerFileUpload()" runat="server" Height="60" Width="50" />
                                    <asp:FileUpload ID="fuUploadImage" runat="server" onchange="UploadFile(this)" Style="visibility: hidden; display: none" accept="image/*;capture=camera"></asp:FileUpload>
                                    <asp:HiddenField ID="hdfProfilePicture" runat="server" />

                                    <asp:Button runat="server" ID="btnImage" Style="display: none" UseSubmitBehavior="false" Text="upload temp" CssClass="Control_Display_None" OnClick="btnImage_Click" />
                                    <div runat="server" id="divImage" visible="false">
                                        <asp:HiddenField ID="hdfImagePath" runat="server" Visible="false" />
                                        <asp:Image ID="PreviewImage" runat="server" CssClass="imgshow" Visible="false" Height="50" Width="50" />
                                        <asp:HiddenField ID="hdfImage" runat="server" Visible="false" />

                                        <asp:LinkButton ID="lnkbtnImageDownload" runat="server" ToolTip="Download Image" CssClass="btn btn-info" UseSubmitBehavior="false" Visible="false">
                                                              <i class="glyphicon glyphicon-download-alt"></i>
                                                               <span></span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkbtnRemoveImage" runat="server" ToolTip="Remove Image" CssClass="btn btn-danger" OnClick="lnkbtnRemoveImage_Click">
                                                             <i class="glyphicon glyphicon-remove"></i>
                                                               <span></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>

                                <div class="col-ak40 margin-right-30">

                                    <label class="col-form-label">Choose </label>
                                    <br />
                                    <asp:ImageButton ID="imgProfilePic1" runat="server" ImageUrl="~/dist/img/avatar.png" Height="59px" CssClass="imgshow" OnClick="imgProfilePic1_Click" />
                                    <asp:ImageButton ID="imgProfilePic2" runat="server" ImageUrl="~/dist/img/avatar2.png" Height="59px" CssClass="imgshow imgposition" OnClick="imgProfilePic2_Click" />
                                    <asp:ImageButton ID="imgProfilePic3" runat="server" ImageUrl="~/dist/img/avatar3.png" Height="59px" CssClass="imgshow imgposition" OnClick="imgProfilePic3_Click" />
                                    <asp:ImageButton ID="imgProfilePic5" runat="server" ImageUrl="~/dist/img/avatar5.png" Height="59px" CssClass="imgshow" OnClick="imgProfilePic5_Click" />
                                </div>
                            </div>
                            <div class="row form-group" id="DivFirm" runat="server" visible="false">

                                <div class="col-ak100">
                                    <h4><b>Employee Firm Link</b></h4>
                                    <hr />
                                    <asp:GridView ID="grdFirm" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SNo.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="grid-column-no-sort">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkAll" Text="Select" CssClass="checkbox checkbox-info" runat="server" Checked="false" AutoPostBack="true"></asp:CheckBox>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbIndividual" Text=" " CssClass="checkbox checkbox-info" runat="server" Checked='<%#Convert.ToBoolean(Eval("Is_Available")) ? true : false %>' AutoPostBack="true"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Firm Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFirm_Name" runat="server" Text='<%# Eval("Firm_Name") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdfFirm_Id" runat="server" Value='<%# Eval("Firm_Id") %>' Visible="false" />
                                                    <asp:HiddenField ID="hdfEmployee_Firm_Link_Id" runat="server" Value="0" Visible="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date Of Joining">
                                                <ItemTemplate>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="txt_DOJ" runat="server" CssClass="form-control" AutoComplete="off" placeholder="DD/MM/YYYY" MaxLength="10"></asp:TextBox>
                                                        <asp:CalendarExtender ID="ce_DOJ" runat="server" TargetControlID="txt_DOJ" Format="dd/MM/yyyy" PopupButtonID="lnkbtnDOJ" />
                                                        <div class="input-group-addon">
                                                            <asp:LinkButton runat="server" ID="lnkbtnDOJ" class="glyphicon glyphicon-calendar"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date Of Leaving">
                                                <ItemTemplate>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="txt_DOL" runat="server" CssClass="form-control" AutoComplete="off" placeholder="DD/MM/YYYY" MaxLength="10"></asp:TextBox>
                                                        <asp:CalendarExtender ID="ceDOL" runat="server" TargetControlID="txt_DOL" Format="dd/MM/yyyy" PopupButtonID="lnkbtnDOL" />
                                                        <div class="input-group-addon">
                                                            <asp:LinkButton runat="server" ID="lnkbtnDOL" class="glyphicon glyphicon-calendar"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Is Default">
                                                <ItemTemplate>
                                                    <label class="switch">
                                                        <asp:CheckBox ID="chkIsDefault" runat="server" AutoPostBack="true" />
                                                        <span class="slider round"></span>
                                                    </label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>

                            <div id="divEmployeeDocument" runat="server">
                                <div class="row form-group">
                                    <div class="col-ak100">
                                        <h4><b>Document</b></h4>
                                        <hr />
                                    </div>
                                </div>

                                <div class="row form-group">

                                    <div class="rptdata">
                                        <asp:Repeater ID="rptEmployeeDocumentLink" runat="server">
                                            <ItemTemplate>

                                                <div class="col-ak20">
                                                    <div class="dataPanel">
                                                        <div class="srnumber">
                                                            <span class="number">
                                                                <asp:Label ID="lblSrno" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label>
                                                            </span>
                                                        </div>
                                                        <label class="col-form-label">Document Name </label>
                                                        <asp:Label ID="lblmandtory" runat="server" Text="*" ForeColor="Red" Visible='<%#Eval("Control_Status_Enum_Id").ToString()=="2" ? true  :false   %>'> </asp:Label>
                                                        <br />
                                                        <asp:Label ID="lbl_DocumentName" runat="server" Text='<%#Eval("Document_Name") %>'>
                                                        </asp:Label>
                                                        <asp:HiddenField ID="hdf_Document_Id" runat="server" Value='<%#Eval("Document_Id") %>' Visible="false" />
                                                        <asp:HiddenField ID="hdf_grd_Control_Status_Enum_Id" runat="server" Value='<%#Eval("Control_Status_Enum_Id") %>' Visible="false" />
                                                        <asp:HiddenField ID="hdf_grd_Employee_Document_Id" runat="server" Value="0" Visible="false" />
                                                        <asp:HiddenField ID="hdf_Validation_Regex" runat="server" Value='<%#Eval("Validation_Regex") %>' Visible="false" />
                                                        <br />
                                                        <label class="col-form-label">Document Number</label>
                                                        <asp:TextBox ID="txt_Unique_No" CssClass="form-control inputText" runat="server" AutoComplete="off"></asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ID="rfv_Unique_No" ControlToValidate="txt_Unique_No" SetFocusOnError="True" ForeColor="Red" ErrorMessage="*" ValidationGroup='<%#Eval("Control_Status_Enum_Id").ToString()=="2" ? "Save" :"None"  %>' Display="Dynamic" />
                                                        <asp:RegularExpressionValidator ID="rev_Unique_No" runat="server" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Invalid Unique No." ControlToValidate="txt_Unique_No" ValidationGroup='<%#Eval("Control_Status_Enum_Id").ToString()=="2" ? "Save" :"None"  %>' Visible='<%#Convert.ToBoolean (Eval("Control_Status_Enum_Id").ToString()=="2")  & Convert.ToBoolean (Eval("Validation_Regex").ToString()!="") ? true  :false%>' ForeColor="Red" ValidationExpression='<%#Eval("Validation_Regex") %>'></asp:RegularExpressionValidator>
                                                        <br />
                                                        <div id="divValidDate" runat="server" style='<%# Eval("Is_Required_Valid_Up_To").ToString() == "Yes" ? "visibility:visible;": "visibility:hidden;" %>'>
                                                            <label class="col-form-label">Valid Upto</label><br />
                                                            <div id="Div1" class="input-group date" runat="server">
                                                                <asp:TextBox ID="txt_Valid_Upto_Date" runat="server" CssClass="form-control inputText" AutoComplete="off" placeholder="DD/MM/YYYY" MaxLength="10"></asp:TextBox>
                                                                <asp:HiddenField ID="hdf_Is_Required_Valid_Up_To" runat="server" Value='<%#Eval("Is_Required_Valid_Up_To")%>' Visible="false" />
                                                                <asp:CalendarExtender ID="Ce_ValidUpTo_Date" runat="server" TargetControlID="txt_Valid_Upto_Date" Format="dd/MM/yyyy" PopupButtonID="lnk_Valid_Upto_Date" />
                                                                <div class="input-group-addon">
                                                                    <asp:LinkButton runat="server" ID="lnk_Valid_Upto_Date" class="glyphicon glyphicon-calendar"></asp:LinkButton>
                                                                </div>
                                                            </div>
                                                            <asp:RegularExpressionValidator ID="reg_ValidUpTo_Date" runat="server" ControlToValidate="txt_Valid_Upto_Date" ValidationGroup='<%#Eval("Is_Required_Valid_Up_To").ToString()=="Yes"  ? "Save" :"None"  %>' ForeColor="Red" ErrorMessage="Invalid Date" ValidationExpression="^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                                        </div>
                                                        <asp:UpdatePanel ID="updatepanelImage" runat="server" UpdateMode="conditional" ChildrenAsTriggers="false" OnUnload="UpdatePanel_Unload">
                                                            <ContentTemplate>
                                                                <asp:Image src="../Images/camera.jpg" title="Upload Photo" onclick="triggerFileUploadDoc(this)" ID="ImageDocument" runat="server" />

                                                                <asp:FileUpload ID="fuDocumentUploadImage" runat="server" onchange="UploadFileDoc(this)" Style="visibility: visible; display: none" accept="image/*;capture=camera"></asp:FileUpload>

                                                                <asp:Button runat="server" ID="btnDocumentImage" Style="display: none" UseSubmitBehavior="false" Text="upload temp" CssClass="Control_Display_None" OnClick="btnDocumentImage_Click" />

                                                                <div runat="server" id="divDocumentImage" visible="false">
                                                                    <asp:HiddenField ID="hdfDocumentImagePath" runat="server" Visible="false" />
                                                                    <asp:ImageButton ID="DocumentPreviewImage" runat="server" CssClass="imgshow" Visible="false" Height="50" Width="50" OnClick="DocumentPreviewImage_Click" />
                                                                    <asp:HiddenField ID="hdfDocumentImage" runat="server" Visible="false" />
                                                                    <asp:LinkButton ID="lnkbtnDocumentImageDownload" runat="server" ToolTip="Download Image" CssClass="btn btn-info" UseSubmitBehavior="false" Visible="false">
                                                              <i class="glyphicon glyphicon-download-alt"></i>
                                                               <span></span>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkbtnDocumentRemoveImage" runat="server" ToolTip="Remove Image" CssClass="btn btn-danger margin-top-66" OnClick="lnkbtnDocumentRemoveImage_Click">
                                                             <i class="glyphicon glyphicon-remove"></i>
                                                               <span></span>
                                                                    </asp:LinkButton>
                                                                </div>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="btnDocumentImage" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-ak20">
                                        <label class="col-form-label">Status<span class="text-red"> *</span></label>
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" AutoComplete="off" Enabled="false">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvStatus" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlStatus" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-ak80">
                                        <label class="col-form-label">Remarks<span class="text-red"> </span></label>
                                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div id="divActionRemarks" runat="server" visible="false">
                                <div class="row form-group">
                                    <div class="col-ak100">
                                        <label class="col-form-label">Action Remarks<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtEditRemark" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEditRemark" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtEditRemark" ForeColor="Red" ValidationGroup="SaveXYZ"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row form-group">
                            </div>
                            <div class="row form-group">
                            </div>
                            <div class="row form-group">
                                <div id="divTransactionPass" runat="server">
                                    <div class="col-ak20">
                                        <label class="col-form-label" id="lblTransactionPassword" runat="server" visible="false">Transaction Password <span class="text-red">*</span></label>
                                    </div>
                                    <div class="col-ak20">
                                        <asp:TextBox ID="txtUserTransactionPassword" Visible="false" TextMode="Password" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvUserTransactionPassword" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtUserTransactionPassword" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-ak10">
                                    <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary btn-block" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />
                                </div>
                                <div class="col-ak10">
                                    <asp:LinkButton ID="btnClear" runat="server" CssClass="btn btn-warning btn-block" Text="Clear" OnClick="btnClear_Click" />

                                </div>
                            </div>
                            <div class="row form-group">
                            </div>
                            <hr />
                            <div class="row form-group">

                                <div class="col-ak100">
                                    <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnRowCommand="grdData_RowCommand" OnPreRender="grdData_PreRender">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SNo.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                    <asp:HiddenField Visible="false" ID="hdfEmployeeId" runat="server" Value='<%# Eval("Employee_Id") %>' /> 
                                                    <asp:HiddenField Visible="false" ID="hdfEmployee_Login_User_Id" runat="server" Value='<%# Eval("Login_User_Id") %>' />
                                                    <asp:HiddenField Visible="false" ID="hdfRemarks" runat="server" Value='<%# Eval("Remarks") %>' />
                                                    <asp:HiddenField Visible="false" ID="hdfProfilePicture" runat="server" Value='<%# Eval("Profile_Pic_Path") %>' />
                                                    <asp:HiddenField Visible="false" ID="hdfStatusId" runat="server" Value='<%#Eval("Status_Id") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeName" Text='<%#Eval("Employee_Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeCode" Text='<%#Eval("Employee_Code") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Login Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLoginUserId" Text='<%#Eval("Login_Id") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmailId" Text='<%#Eval("Employee_Email_Id") %>' runat="server"></asp:Label><br />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMobileNo" Text='<%#Eval("Employee_Mobile_No") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="WhatsApp No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblWhatsAppNo" Text='<%#Eval("Employee_WhatsApp_No") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Employee_Address" Text='<%#Eval("Employee_Address") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pincode">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Employee_Pincode" Text='<%#Eval("Employee_Pincode") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="Edit">
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBtnEdit" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Edt" ToolTip="Edit" CssClass="glyphicon glyphicon-edit" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnImage" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>

            <asp:Button ID="btnDummy" runat="server" Style="display: none" />
            <asp:ModalPopupExtender ID="mpeForGDocuments" runat="server" BackgroundCssClass="modalPopBackground"
                TargetControlID="btnDummy" PopupControlID="pnlForMPE" OkControlID="btnPopUpClose">
            </asp:ModalPopupExtender>
            <asp:Panel ID="pnlForMPE" runat="server" Style="display: none" CssClass="modalPopUpPanelWithoutText">
                <div class="modalPopUpHeader">
                    <%--Uploaded Documents--%>
                    <asp:Button ID="btnPopUpClose" CssClass="btn btn-danger pull-right" Text="X" runat="server" />
                    <asp:Label ID="lblGDocumentName" runat="server">Item Image</asp:Label>
                </div>
                <div class="modalPopUpBody">
                    <div id="divIamgePreview" runat="server">
                        <asp:Image ID="itemImgFullView" runat="server" CssClass="modalPopUpImageSizeWithoutText" />
                    </div>
                    <div id="divpdfPreview" runat="server">
                        <iframe id="IframePDF" runat="server" height="800" width="100%"></iframe>
                    </div>
                </div>
                <div align="right" class="modalPopFooter">
                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
    <asp:HiddenField ID="ValidImageExtension" runat="server" />
    <asp:ModalUpdateProgress ID="ModalUpdateProgress1" runat="server" DisplayAfter="0"
        BackgroundCssClass="modalBackground">
        <ProgressTemplate>
            <div>
                <img src="../dist/img/lg.palette-rotating-ring-loader.gif" align="middle" />
            </div>
        </ProgressTemplate>
    </asp:ModalUpdateProgress>
    <div id="divModelProgress" style="display: none">
        <div id="dfrrr" class="ModelProgress" role="status">
            <div>
                <img src="../dist/img/lg.palette-rotating-ring-loader.gif" align="middle">
            </div>
        </div>
        <div class="modalBackground ModelProgressBackground"></div>
    </div>
</asp:Content>
