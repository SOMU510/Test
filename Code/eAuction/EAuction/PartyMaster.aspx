<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PartyMaster.aspx.cs" Inherits="eAuction.PartyMaster" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        $(function () {
            SetMultiSelect();
            SetMultiSelect2();
            SetMultiSelect3();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandle);
            function endRequestHandle(sender, Args) {
                SetMultiSelect();
                SetMultiSelect2();
                SetMultiSelect3();
            };
        });

        function SetMultiSelect() {
            $('[id$=ContentPlaceHolder1_grdDealingIn_ddlCategory_0]').multiselect
                          ({
                              includeSelectAllOption: true
                          });
        }
        function SetMultiSelect2() {
            $('[id$=ContentPlaceHolder1_grdDealingIn_ddlCategory_1]').multiselect
                          ({
                              includeSelectAllOption: true
                          });
        }
        function SetMultiSelect3() {
            $('[id$=ContentPlaceHolder1_grdDealingIn_ddlCategory_2]').multiselect
                          ({
                              includeSelectAllOption: true
                          });
        }
    </script>
    <script type="text/javascript">
        function UploadFileDoc(fileUpload) {
            var id = fileUpload.id;
            id = id.replace("fuDocumentUploadImage", "btnDocumentImage")
            if (fileUpload.value != '') {
                document.getElementById(id).click();
            }
        }
    </script>

    <script type="text/javascript">
        function triggerFileUploadDoc(fileUpload) {
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
                                <div class="col-ak85">
                                    <li id="liMenuHeaderIcon" runat="server"></li>
                                    <span id="spanHeader" runat="server" class="sub-title">Party Master</span>
                                </div>
                                <div class="col-ak15">
                                    <asp:LinkButton ID="lnkbtnCreateParty" CssClass="btn btn-success btn-block" ToolTip="Create Party" runat="server" OnClick="lnkbtnCreateParty_Click" CausesValidation="false" UseSubmitBehavior="false">
                                    <i class="glyphicon glyphicon-plus"></i>
                                    <span>Create Party</span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnPartyList" CssClass="btn btn-info btn-block" ToolTip="Party List" runat="server" OnClick="lnkbtnPartyList_Click" CausesValidation="false" UseSubmitBehavior="false">
                                    <i class="glyphicon glyphicon-list"></i>
                                    <span>Party List</span>
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-ak100">
                                    <hr />
                                </div>
                            </div>
                            <div id="divCreateParty" runat="server">
                                <div class="row form-group">
                                    <div class="col-ak25">
                                        <label class="col-form-label">Type<span class="text-red"> *</span></label>
                                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" AutoComplete="off" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvType" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlType" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Company Type<span class="text-red"> *</span></label>
                                        <asp:DropDownList ID="ddlCompanyType" runat="server" CssClass="form-control" AutoComplete="off">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvCompanyType" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlCompanyType" InitialValue="0" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Company Name<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtParty_Company_Name" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPartyCompanyName" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtParty_Company_Name" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Company Code<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtParty_Company_Code" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPartyCompanyCode" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtParty_Company_Code" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-ak25">
                                        <label class="col-form-label">Name<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtPartyName" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPartyName" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtPartyName" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        <asp:HiddenField ID="hdfPartyId" runat="server" Value="0" Visible="false" />
                                        <asp:HiddenField ID="hdfParty_Login_User_Id" runat="server" Value="0" Visible="false" />

                                        <asp:HiddenField ID="hdfParty_Contact_Person_Id" runat="server" Value="0" Visible="false" />
                                        <asp:HiddenField ID="hdfParty_Status_Id" runat="server" Value="0" Visible="false" />
                                        <asp:HiddenField ID="hdfParty_URL_QS_Code" runat="server" Value="0" Visible="false" />

                                        <asp:HiddenField Visible="false" ID="hdfParty_Business_Unit_Id" runat="server" Value="0" />
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Designation<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtPartyDesignation" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvDesignation" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtPartyDesignation" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-ak12">
                                        <label class="col-form-label">Mobile No.<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtParty_Mobile_No" runat="server" CssClass="form-control" AutoComplete="off" MaxLength="10" onkeydown="return AllowNumericOnly(event);"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv_MobileNo" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtParty_Mobile_No" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rev_MobileNo" runat="server" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Invalid Mobile No." ToolTip="Invalid Mobile No." ControlToValidate="txtParty_Mobile_No" ValidationGroup="Save" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-ak13">
                                        <label class="col-form-label">WhatsApp No.<span class="text-red"> </span></label>
                                        <asp:TextBox ID="txtParty_WhatsApp_No" runat="server" CssClass="form-control" AutoComplete="off" MaxLength="10" onkeydown="return AllowNumericOnly(event);"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revWhatsAppNo" runat="server" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Invalid WhatsApp No." ToolTip="Invalid WhatsApp No." ControlToValidate="txtParty_WhatsApp_No" ValidationGroup="Save" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Email Id<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtParty_Email_Id" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPartyEmailId" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtParty_Email_Id" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtParty_Email_Id" ValidationGroup="Save" ForeColor="Red" ErrorMessage="Invalid Email" ValidationExpression="^\w*(?=\w*[a-zA-z])\w+([-.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div>

                                </div>
                                <div class="row form-group">
                                    <div class="col-ak25">
                                        <label class="col-form-label">State<span class="text-red">*</span></label>
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoComplete="off" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-ak25">
                                        <label class="col-form-label">City<span class="text-red">*</span></label>
                                        <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" AutoComplete="off">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-ak40">
                                        <label class="col-form-label">Address<span class="text-red">*</span></label>
                                        <asp:TextBox ID="txtParty_Address" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-ak10">
                                        <label class="col-form-label">Pincode<span class="text-red">*</span></label>
                                        <asp:TextBox ID="txtParty_Pincode" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowNumericOnly(event);" MaxLength="6"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    
                                    <%-- <div class="col-ak25">
                                        <label class="col-form-label">Login Id<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtLoginId" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvLoginId" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtLoginId" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </div>--%>
                                </div>
                                <div class="row form-group" id="DivFirm" runat="server" visible="false">

                                    <div class="col-ak100">
                                        <h4><b>Party Firm Link</b></h4>
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
                                                        <asp:HiddenField ID="hdf_grd_Party_Firm_Link_Id" runat="server" Value="0" Visible="false" />
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
                                            <asp:Repeater ID="rptPartyDocumentLink" runat="server">
                                                <ItemTemplate>

                                                    <div class="col-ak20">
                                                        <div class="dataPanel">
                                                            <div class="srnumber">
                                                                <span class="number">
                                                                    <asp:Label ID="lblSrno" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label>
                                                                </span>
                                                            </div>
                                                            <label class="col-form-label">Document Name </label>
                                                            <asp:Label ID="lblmandtory" runat="server" Text="*" ForeColor="Red" Visible='<%#Eval("Control_Status_Enum_Id").ToString()=="2" ? true  :false    %>'> </asp:Label>
                                                            <br />
                                                            <asp:Label ID="lbl_DocumentName" runat="server" Text='<%#Eval("Document_Name") %>'>
                                                            </asp:Label>
                                                            <asp:HiddenField ID="hdf_Document_Id" runat="server" Value='<%#Eval("Document_Id") %>' Visible="false" />
                                                            <asp:HiddenField ID="hdf_grd_Control_Status_Enum_Id" runat="server" Value='<%#Eval("Control_Status_Enum_Id") %>' Visible="false" />
                                                            <asp:HiddenField ID="hdf_grd_Party_Document_Id" runat="server" Value="0" Visible="false" />
                                                            <asp:HiddenField ID="hdf_Validation_Regex" runat="server" Value='<%#Eval("Validation_Regex") %>' Visible="false" />
                                                            <br />
                                                            <label class="col-form-label">Document Number</label>
                                                            <asp:TextBox ID="txt_Unique_No" CssClass="form-control inputText" runat="server" AutoComplete="off"></asp:TextBox>
                                                            <%-- <asp:RequiredFieldValidator runat="server" ID="rfv_Unique_No" ControlToValidate="txt_Unique_No" SetFocusOnError="True" ForeColor="Red" ErrorMessage="*" ValidationGroup='<%#Eval("Control_Status_Enum_Id").ToString()=="2" ? "Save" :"None"  %>' Display="Dynamic" />--%>
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
                                </div>

                                <div class="row form-group" id="divDealingIn" runat="server">
                                    <div class="col-ak100">
                                        <asp:GridView ID="grdDealingIn" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found">
                                            <Columns>
                                                <asp:TemplateField HeaderText="SNo.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Dealing in">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_Dealing_In" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                                        <asp:HiddenField ID="hdf_grd_Dealing_In_Enum_Type_Id" Value='<%#Eval("Id") %>' Visible="false" runat="server"></asp:HiddenField>
                                                        <asp:HiddenField ID="hdf_grd_Party_Deal_Category_Link_Id" Value="0" Visible="false" runat="server"></asp:HiddenField>
                                                        <asp:HiddenField ID="hdf_Category_Type_Enum_Id" Value="0" Visible="false" runat="server"></asp:HiddenField>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Category">
                                                    <ItemTemplate>
                                                        <asp:ListBox ID="ddlCategory" SelectionMode="Multiple" runat="server" CssClass="form-control"></asp:ListBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>

                                <div class="row form-group" id="divBusinessUnit" runat="server">
                                    <div class="col-ak100">
                                        <h4><b>Business Unit</b></h4>
                                        <hr />
                                    </div>
                                    <div class="col-ak20">
                                        <asp:TextBox ID="txtBusinessUnit" runat="server" CssClass="form-control" AutoComplete="off" placeholder="Enter Business Unit Name">
                                        </asp:TextBox>
                                             <asp:RequiredFieldValidator ID="rfvBusinessUnit" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtBusinessUnit" ForeColor="Red" ValidationGroup="AddBusinessUnit"></asp:RequiredFieldValidator>
                                    </div>
                                     <div class="col-ak60">
                                        <asp:TextBox ID="txtBusinessUnitAddress" runat="server" CssClass="form-control" AutoComplete="off" placeholder="Enter Business Unit Address">
                                        </asp:TextBox>
                                           <asp:RequiredFieldValidator ID="rfvBusinessUnitAddress" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtBusinessUnitAddress" ForeColor="Red" ValidationGroup="AddBusinessUnit"></asp:RequiredFieldValidator>
                                                         </div>
                                    <div class="col-ak10">
                                        <asp:LinkButton ID="lnkbtnAdd" runat="server" CssClass="btn btn-success btn-block" ValidationGroup="AddBusinessUnit" OnClick="lnkbtnAdd_Click">
                                           <i class="glyphicon glyphicon-plus"></i>
                                           <span>Add</span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row form-group">
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-ak100">
                                            <asp:GridView ID="grdBusinessUnit" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found"
                                                OnPreRender="grdBusinessUnit_PreRender" OnRowCommand="grdBusinessUnit_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SNo.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                            <asp:HiddenField Visible="false" ID="hdfgrdParty_Business_Unit_Id" runat="server" Value='<%# Eval("Party_Business_Unit_Id") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfgrdStatus_Id" runat="server" Value='<%# Eval("Status_Id") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfgrdRemarks" runat="server" Value='<%# Eval("Remarks") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Business Unit Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBusinessUnitName" runat="server" Text='<%# Eval("Business_Unit_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Business Unit Address">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBusinessUnitAddress" runat="server" Text='<%# Eval("Business_Unit_Address") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="Edit">
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkBtnEdit" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Edt" ToolTip="Edit" CssClass="glyphicon glyphicon-edit" runat="server"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="Remove">
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkBtnRemove" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Remove" ToolTip="Remove" CssClass="glyphicon glyphicon-trash text-red" runat="server"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>

                                <div class="row form-group">

                                    <div class="col-ak100">
                                        <label class="col-form-label">Remarks<span class="text-red"> </span></label>
                                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <div id="divActionRemarks" runat="server" visible="false">
                                    <div class="row form-group">
                                        <div class="col-ak100">
                                            <label class="col-form-label">Action Remarks<span class="text-red"> *</span></label>
                                            <asp:TextBox ID="txtActionRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvActionRemarks" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtActionRemarks" ForeColor="Red" ValidationGroup="SaveXYZ"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="row form-group">
                                </div>
                                <div class="row form-group">
                                </div>
                                <div class="row form-group">
                                    <div class="col-ak10" id="divActionClear" runat="server">
                                        <asp:LinkButton ID="btnClear" runat="server" CssClass="btn btn-primary btn-block pull-left" Text="Back" OnClick="btnClear_Click" />
                                    </div>
                                    <div id="divTransactionPass" runat="server">
                                        <div class="col-ak20">
                                            <label class="col-form-label" id="lblTransactionPassword" runat="server" visible="false">Transaction Password <span class="text-red">*</span></label>
                                        </div>
                                        <div class="col-ak20">
                                            <asp:TextBox ID="txtUserTransactionPassword" Visible="false" TextMode="Password" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvUserTransactionPassword" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtUserTransactionPassword" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-ak15" id="divActionSendToParty" runat="server">
                                        <asp:LinkButton ID="lnkbtnSendToParty" runat="server" CssClass="btn btn-primary btn-block pull-left" Text="Submit To Party" CommandArgument="13" OnClick="lnkbtnSendToParty_Click" ValidationGroup="Save" />
                                    </div>
                                    <div class="col-ak15" id="divActionSendToApproval" runat="server">
                                        <asp:LinkButton ID="lnkbtnSendToApproval" runat="server" CssClass="btn btn-primary btn-block pull-left" Text="Send to Approval" CommandArgument="14" ValidationGroup="Save" OnClick="lnkbtnSendToParty_Click" />
                                    </div>
                                    <div class="col-ak15" id="divActionSubmitApprove" runat="server">
                                        <asp:LinkButton ID="lnkbtnSubmitApprove" runat="server" CssClass="btn btn-primary btn-block pull-left" Text="Submit & Approve" CommandArgument="16" ValidationGroup="Save" OnClick="lnkbtnSendToParty_Click" />
                                    </div>
                                    <div class="col-ak10" id="divActionApprove" runat="server">
                                        <asp:LinkButton ID="lnkbtnApprove" runat="server" CssClass="btn btn-primary btn-block pull-left" Text="Approve" CommandArgument="16" ValidationGroup="Save" OnClick="lnkbtnSendToParty_Click" />
                                    </div>
                                    <div class="col-ak10" id="divActionReject" runat="server">
                                        <asp:LinkButton ID="lnkbtnReject" runat="server" CssClass="btn btn-danger btn-block pull-left" Text="Reject" CommandArgument="17" ValidationGroup="Save" OnClick="lnkbtnSendToParty_Click" />
                                    </div>
                                    <div class="col-ak10" id="divActionEditAfterApproved" runat="server">
                                        <asp:LinkButton ID="lnkbtnEditAfterApproved" runat="server" CssClass="btn btn-success btn-block pull-left" Text="Edit" CommandArgument="31" ValidationGroup="Save" OnClick="lnkbtnSendToParty_Click" />
                                    </div>
                                    <div class="col-ak10" id="divActionDeactivated" runat="server">
                                        <asp:LinkButton ID="lnkbtnDeactivated" runat="server" CssClass="btn btn-danger btn-block pull-left" Text="Deactivate" CommandArgument="18" ValidationGroup="Save" OnClick="lnkbtnSendToParty_Click" />
                                    </div>
                                    <div class="col-ak10" id="divActionActivate" runat="server">
                                        <asp:LinkButton ID="lnkbtnActivate" runat="server" CssClass="btn btn-primary btn-block pull-left" Text="Activate" CommandArgument="30" ValidationGroup="Save" OnClick="lnkbtnSendToParty_Click" />
                                    </div>

                                </div>
                            </div>
                            <div class="row form-group">
                            </div>
                            <div id="divPartyist" runat="server">
                                <div class="row form-group">
                                    <div class="col-ak25">
                                        <label class="col-form-label">Type<span class="text-red"> </span></label>
                                        <asp:DropDownList ID="ddlSearchType" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Company Name/Code<span class="text-red"> </span></label>
                                        <asp:TextBox ID="txtSearchCompanyNameCode" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Status<span class="text-red"></span></label>
                                        <asp:DropDownList ID="ddlSearchStatus" runat="server" CssClass="form-control">
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-ak10">
                                        <label class="col-form-label" style="visibility: hidden">placeholder</label>
                                        <asp:LinkButton ID="lnkSearch" runat="server" ToolTip="Search" CssClass="btn btn-primary btn-block" Visible="true" OnClick="lnkSearch_Click">
                                                     <i class="glyphicon glyphicon-filter">
                                             </i>  
                                              <span>Apply</span>
                                        </asp:LinkButton>
                                    </div>

                                    <div class="col-ak10">
                                        <label class="col-form-label" style="visibility: hidden">placeholder</label>
                                        <asp:LinkButton ID="lnlSearchClear" runat="server" CssClass="btn btn-warning btn-block" Text="Clear" OnClick="lnlSearchClear_Click">
                                                 <i class="glyphicon glyphicon-refresh">
                                             </i>  
                                              <span>Clear</span>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                                <hr />
                                <div class="row form-group">
                                    <div class="col-ak100">
                                        <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnRowCommand="grdData_RowCommand" OnPreRender="grdData_PreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="SNo.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                        <asp:HiddenField Visible="false" ID="hdfPartyId" runat="server" Value='<%# Eval("Party_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfPartyLoginUser_Id" runat="server" Value='<%# Eval("Login_User_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfRemarks" runat="server" Value='<%# Eval("Remarks") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfParty_Type_Enum_Id" runat="server" Value='<%# Eval("Party_Type_Enum_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfCompany_Type_Id" runat="server" Value='<%# Eval("Company_Type_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfParty_Company_Code" runat="server" Value='<%# Eval("Party_Company_Code") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfgrdParty_Status_Id" runat="server" Value='<%# Eval("Party_Status_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfPartyStateId" runat="server" Value='<%# Eval("Party_State_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfPartyCityId" runat="server" Value='<%# Eval("Party_City_Id") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPartyType" Text='<%#Eval("Party_Type") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Company Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCompanyType" Text='<%#Eval("Company_Type") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Company Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPartyCompanyName" Text='<%#Eval("Party_Company_Name") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Company Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPartyCompanyCode" Text='<%#Eval("Party_Company_Code") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Person Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContactPersonName" Text='<%#Eval("Party_Contact_Person_Name") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPartyContactno" Text='<%#Eval("Party_Contact_No") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Email Id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPartyEmailId" Text='<%#Eval("Party_Email_Id") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="State">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPartyState" Text='<%#Eval("Party_State_Name") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="City">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPartyCity" Text='<%#Eval("Party_City_Name") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Party_Status_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="View">
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkBtnView" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Vview" ToolTip="View" CssClass="glyphicon glyphicon-eye-open" runat="server"></asp:LinkButton>
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
            </div>

        </ContentTemplate>
        <Triggers>
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

