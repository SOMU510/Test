<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CreateAuction.aspx.cs" Inherits="eAuction.CreateAuction" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .checkbox label, .radio label {
            color: #054376;
        }
    </style>

    <script type="text/javascript">
        Sys.Application.add_load(
         function () {
             ApplyGridFilter('<%=grdData.ClientID%>', '450');
         }
        );
    </script>

    <script type="text/javascript">

        function UploadAttachmentFile(fileUpload)
        {
            Page_BlockSubmit = false;
            var id = fileUpload.id;
            id = id.replace("ContentPlaceHolder1_fuAttachmentUploadImage", "ContentPlaceHolder1_btnAttachmentImage")
            if (fileUpload.value != '') {
                document.getElementById(id).click();
                document.getElementById('divModelProgress').style.display = 'block';
            }
        }

        function triggerAttachmentFileUpload() {
            if (document.getElementById('divModelProgress').style.display == 'block') {
                return;
            }

            document.getElementById("ContentPlaceHolder1_fuAttachmentUploadImage").click();
            UploadAttachmentFile(document.getElementById("ContentPlaceHolder1_fuAttachmentUploadImage"));
        }


    </script>

    <script type="text/javascript">

        function UploadAttachment2File(fileUpload) {
            Page_BlockSubmit = false;
            var id = fileUpload.id;
            id = id.replace("ContentPlaceHolder1_fuAttachment2UploadImage", "ContentPlaceHolder1_btnAttachment2Image")
            if (fileUpload.value != '') {
                document.getElementById(id).click();
                document.getElementById('divModelProgress').style.display = 'block';
            }
        }

        function triggerAttachment2FileUpload() {
            if (document.getElementById('divModelProgress').style.display == 'block') {
                return;
            }

            document.getElementById("ContentPlaceHolder1_fuAttachment2UploadImage").click();
            UploadAttachment2File(document.getElementById("ContentPlaceHolder1_fuAttachment2UploadImage"));
        }


    </script>

    <script type="text/javascript">

        function UploadAttachment3File(fileUpload) {
            Page_BlockSubmit = false;
            var id = fileUpload.id;
            id = id.replace("ContentPlaceHolder1_fuAttachment3UploadImage", "ContentPlaceHolder1_btnAttachment3Image")
            if (fileUpload.value != '') {
                document.getElementById(id).click();
                document.getElementById('divModelProgress').style.display = 'block';
            }
        }

        function triggerAttachment3FileUpload() {
            if (document.getElementById('divModelProgress').style.display == 'block') {
                return;
            }

            document.getElementById("ContentPlaceHolder1_fuAttachment3UploadImage").click();
            UploadAttachment3File(document.getElementById("ContentPlaceHolder1_fuAttachment3UploadImage"));
        }


    </script>

    <script type="text/javascript">
        function UploadCatalogFile(fileUpload) {
            Page_BlockSubmit = false;
            var id = fileUpload.id;
            id = id.replace("ContentPlaceHolder1_fuCatalogUploadImage", "ContentPlaceHolder1_btnCatalogImage")
            if (fileUpload.value != '') {
                document.getElementById(id).click();
                document.getElementById('divModelProgress').style.display = 'block';
            }
        }

        function triggerCatalogFileUpload() {
            if (document.getElementById('divModelProgress').style.display == 'block') {
                return;
            }

            document.getElementById("ContentPlaceHolder1_fuCatalogUploadImage").click();
            UploadFile(document.getElementById("ContentPlaceHolder1_fuCatalogUploadImage"));
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
                                    <a id="hrefCreateAuction" runat="server"><span id="spanHeader" runat="server" class="sub-title">Create Auction</span></a>
                                </div>
                                <div class="col-ak15">
                                    <asp:LinkButton ID="lnkbtnCreateAuction" CssClass="btn btn-success btn-block" ToolTip="Create Auction" runat="server" OnClick="btnClear_Click" CausesValidation="false" UseSubmitBehavior="false">
                                    <i class="glyphicon glyphicon-plus"></i>
                                    <span>Create Auction</span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnAuctionList" CssClass="btn btn-info btn-block" ToolTip="Auction List" runat="server" OnClick="lnkbtnAuctionList_Click" CausesValidation="false" UseSubmitBehavior="false">
                                    <i class="glyphicon glyphicon-list"></i>
                                    <span>Auction List</span>
                                    </asp:LinkButton>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-ak100">
                                    <hr />
                                </div>
                            </div>

                            <div id="divCreateAuction" runat="server">
                                <div id="divAuctionMainData" runat="server">
                                    <div class="col-ak20" id="DivFirm" runat="server" visible="false">
                                        <label class="col-form-label">Firm<span class="text-red"> *</span></label>
                                        <asp:DropDownList ID="ddlFirm" runat="server" CssClass="form-control" AutoComplete="off">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvFirm" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlFirm" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-ak25">
                                            <label class="col-form-label">Auction Name<span class="text-red"> *</span></label>
                                            <asp:TextBox ID="txtAuctionName" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvAuctionName" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This Fields is Mandatory" ControlToValidate="txtAuctionName" ForeColor="Red" ValidationGroup="SaveAsDraft"></asp:RequiredFieldValidator>
                                            <asp:HiddenField ID="hdfId" runat="server" Value="0" Visible="false" />
                                        </div>
                                        <div class="col-ak25">
                                            <label class="col-form-label">Auction Type<span class="text-red"> *</span></label>
                                            <asp:DropDownList ID="ddlAuctionType" runat="server" CssClass="form-control" AutoComplete="off" AutoPostBack="true" OnSelectedIndexChanged="ddlAuctionType_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvAuctionType" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlAuctionType" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-ak25">
                                            <label class="col-form-label">Primary Currency<span class="text-red"> *</span></label>
                                            <asp:DropDownList ID="ddlPrimaryCurrency" runat="server" CssClass="form-control" AutoComplete="off">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvPrimaryCurrency" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlPrimaryCurrency" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-ak25">
                                            <label class="col-form-label">Client<span class="text-red"> *</span></label>
                                            <asp:DropDownList ID="ddlParty" runat="server" CssClass="form-control" AutoComplete="off" AutoPostBack="true" OnSelectedIndexChanged="ddlParty_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvParty" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlParty" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>

                                    </div>

                                    <div class="row form-group">
                                        <div class="col-ak25">
                                            <label class="col-form-label">Company Name<span class="text-red"> *</span></label>
                                            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" AutoComplete="off" Enabled="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCompanyName" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This Fields is Mandatory" ControlToValidate="txtCompanyName" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-ak25">
                                            <label class="col-form-label">Company Code<span class="text-red"> *</span></label>
                                            <asp:TextBox ID="txtCompanyCode" runat="server" CssClass="form-control" AutoComplete="off" Enabled="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCompanyCode" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This Fields is Mandatory" ControlToValidate="txtCompanyCode" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-ak25">
                                            <asp:RadioButton ID="rbSelectBusinessUnitDropdown" runat="server" Text=" Business Unit" AutoPostBack="true" CssClass="radio-item" GroupName="Default" OnCheckedChanged="rbSelectBusinessUnitDropdown_CheckedChanged" />
                                            <asp:DropDownList ID="ddlBusinessUnit" runat="server" CssClass="form-control" AutoComplete="off">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvBusinessUnit" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlBusinessUnit" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-ak25">
                                            <asp:RadioButton ID="rbSelectBusinessUnitTextbox" runat="server" Text=" Business Unit" AutoPostBack="true" CssClass="radio-item" GroupName="Default" OnCheckedChanged="rbSelectBusinessUnitTextbox_CheckedChanged" />
                                            <asp:TextBox ID="txtBusinessUnit" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvtxtBusinessUnit" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This Fields is Mandatory" ControlToValidate="txtBusinessUnit" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

                                        </div>

                                    </div>

                                    <div class="row form-group">
                                        <div class="col-ak25">
                                            <asp:Label ID="Label1" CssClass="col-form-label" runat="server">Open Date Time</asp:Label><span id="Span1" class="text-red" runat="server">*</span><br />
                                            <telerik:RadDateTimePicker RenderMode="Lightweight" DateInput-DateFormat="dd/MM/yyyy hh:mm tt" runat="server" ID="RadAuctionStartDateTime" CssClass="form-control" Width="100%">
                                            </telerik:RadDateTimePicker>
                                        </div>
                                        <div class="col-ak25">
                                            <asp:Label ID="Label6" CssClass="col-form-label" runat="server">Close Date Time</asp:Label><span id="Span2" class="text-red" runat="server">*</span><br />
                                            <telerik:RadDateTimePicker RenderMode="Lightweight" DateInput-DateFormat="dd/MM/yyyy hh:mm tt" runat="server" ID="RadAuctionCloseDateTime" CssClass="form-control" Width="100%">
                                            </telerik:RadDateTimePicker>
                                        </div>
                                        <div class="col-ak25">
                                            <asp:Label ID="Label7" CssClass="col-form-label" runat="server">Extend Auction Time(Min)<span class="text-red">*</span></asp:Label><br />
                                            <asp:TextBox ID="txtExtendAuctionTime" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowDecimalOnly(this,event);"></asp:TextBox>
                                        </div>
                                        <div class="col-ak25">
                                            <asp:Label ID="Label2" CssClass="col-form-label" runat="server">Grace Period(Min)<span class="text-red">*</span></asp:Label><br />
                                            <asp:TextBox ID="txtGracePeriodMin" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowDecimalOnly(this,event);"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-ak25">
                                            <label class="col-form-label">Extend Auction Time If New Bid<span class="text-red"> *</span></label>
                                            <asp:DropDownList ID="ddlExtendAuctionTimeIfNew" runat="server" CssClass="form-control" AutoComplete="off">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvExtendAuctionTimeIfNew" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlExtendAuctionTimeIfNew" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-ak25">
                                            <label class="col-form-label">Bid Info Shown To Participate<span class="text-red">*</span></label>
                                            <asp:DropDownList ID="ddlBidInformationShownToParticipate" runat="server" CssClass="form-control" AutoComplete="off">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvBidInformationShownToParticipate" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlBidInformationShownToParticipate" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-ak25">
                                            <label class="col-form-label">CMD<span class="text-red"> *</span></label>
                                            <asp:TextBox ID="txtCMD" runat="server" CssClass="form-control" AutoComplete="off" Enabled="false" Text="0"></asp:TextBox>
                                        </div>
                                        <div class="col-ak25 displayMiddle">
                                            <label id="Label3" runat="server" class="col-form-label">Catalog<span class="text-red"> </span></label>
                                            <asp:Image ID="PreviewImageCatalog" src="../Images/camera.jpg" title="Upload Document" onclick="triggerCatalogFileUpload()" runat="server" />
                                            <asp:FileUpload ID="fuCatalogUploadImage" runat="server" onchange="UploadCatalogFile(this)" Style="visibility: hidden; display: none" accept="image/*;capture=camera"></asp:FileUpload>
                                            <asp:Button runat="server" ID="btnCatalogImage" Style="display: none" UseSubmitBehavior="false" Text="upload temp" CssClass="Control_Display_None" OnClick="btnCatalogImage_Click" />
                                            <div runat="server" id="divCatalog" visible="false" class="displayMiddle">
                                                <asp:HiddenField ID="hdfCatalogImagePath" runat="server" Visible="false" />
                                                <asp:ImageButton ID="ImgbtnCatalogPreview" runat="server" CssClass="imgshow" Visible="false" Height="45" Width="45" OnClick="ImgbtnCatalogPreview_Click" />
                                                <asp:LinkButton ID="lnkbtnCatalogRemoveImage" runat="server" ToolTip="Remove Document" CssClass="btn btn-danger margin-top-66" OnClick="lnkbtnCatalogRemoveImage_Click">
                                                             <i class="glyphicon glyphicon-remove"></i>
                                                             <span></span>
                                                </asp:LinkButton>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row form-group">

                                        <div class="col-ak100">
                                            <label class="col-form-label">Description<span class="text-red"> *</span></label>
                                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvDescription" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtDescription" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>

                                    </div>
                                </div>

                                <div id="divSendInvitation" runat="server">
                                    <div class="row form-group">
                                        <div class="col-ak25">
                                            <asp:CheckBox ID="cbSendInvitiationToAllCustomer" Text="Send Invitiation To All Customer" CssClass="checkbox checkbox-info" runat="server" AutoPostBack="true" OnCheckedChanged="cbSendInvitiationToAllCustomer_CheckedChanged"></asp:CheckBox>
                                        </div>
                                        <div class="col-ak25">
                                            <asp:CheckBox ID="cbSendInvitiationToAllSupplier" Text="Send Invitiation To All Supplier" CssClass="checkbox checkbox-info" runat="server" AutoPostBack="true" OnCheckedChanged="cbSendInvitiationToAllSupplier_CheckedChanged"></asp:CheckBox>
                                        </div>
                                        <div class="col-ak25">
                                            <asp:CheckBox ID="cbSendInvitiationToAllServicesCustomer" Text="Send Invitiation To Service Customer" CssClass="checkbox checkbox-info" runat="server" AutoPostBack="true" OnCheckedChanged="cbSendInvitiationToAllServicesCustomer_CheckedChanged"></asp:CheckBox>
                                        </div>
                                        <div class="col-ak25">
                                            <asp:LinkButton ID="btnViewPartyList" runat="server" CssClass="text-blue" OnClick="btnViewPartyList_Click">
                                                <i class="glyphicon glyphicon-eye-open"></i><span> <b>View Customer/Supplier</b></span>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>

                                <div class="boxshadow" runat="server" visible="false" id="divViewPartyList">
                                    <div id="DivPartyList" runat="server">
                                        <div class="row form-group">
                                            <div id="divAddNewParty" runat="server">
                                                <div class="col-ak20">
                                                    <label class="col-form-label">Party<span class="text-red"> *</span></label>
                                                    <asp:DropDownList ID="ddlAddNewParty" runat="server" CssClass="form-control" AutoComplete="off">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvAddNewParty" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" InitialValue="0" ControlToValidate="ddlAddNewParty" ForeColor="Red" ValidationGroup="AddParty"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-ak10">
                                                    <label class="col-form-label" style="visibility: hidden">PlaceHolder</label>
                                                    <asp:LinkButton ID="btnAddParty" runat="server" CssClass="btn btn-success btn-block" ValidationGroup="AddParty" OnClick="btnAddParty_Click">
                                <i class="glyphicon glyphicon-plus"></i>
                                <span>Add Party</span>
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                            <div class="col-ak55">
                                            </div>
                                            <div id="divRemoveParty" runat="server">
                                                <div class="col-ak15">
                                                    <label class="col-form-label" style="visibility: hidden">PlaceHolder</label>
                                                    <asp:LinkButton ID="btnRemoveParty" runat="server" CssClass="btn btn-danger btn-block" ValidationGroup="RemoveParty" OnClick="btnRemoveParty_Click">
                                <i class="glyphicon glyphicon-remove"></i>
                                <span>Remove Party</span>
                                                    </asp:LinkButton>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row form-group">
                                            <div class="col-ak100">
                                                <asp:GridView ID="grdPartyList" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="SNo.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                <asp:HiddenField Visible="false" ID="hdfPartyId" runat="server" Value='<%# Eval("Party_Id") %>' />
                                                                <asp:HiddenField Visible="false" ID="hdfAuctionPartyLinkId" runat="server" Value='<%# Eval("Auction_Party_Link_Id") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderStyle-CssClass="grid-column-no-sort" Visible="false">
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="chkAll" Text="Select" CssClass="checkbox checkbox-info" runat="server" Checked="false" AutoPostBack="true" onclick="return chkAll_CheckedChanged(this);"></asp:CheckBox>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="cbIndividual" Text=" " CssClass="checkbox checkbox-info" runat="server" Checked='<%#Convert.ToBoolean(Eval("Is_Available")) ? true : false %>'></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--<asp:TemplateField HeaderText="Company Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCompanyType" Text='<%#Eval("Company_Type") %>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
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
                                                        <asp:TemplateField HeaderText="Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPartyContactPersonName" Text='<%#Eval("Party_Contact_Person_Name") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Contact No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPartyContactno" Text='<%#Eval("Party_Contact_No") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Email-Id">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPartyContactPersonEmailId" Text='<%#Eval("Party_Contact_Person_Email_Id") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                     
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col-ak15">
                                                <asp:LinkButton ID="btnHidePartyList" runat="server" CssClass="text-red" OnClick="btnHidePartyList_Click">
                                                    <i class="glyphicon glyphicon-eye-close"></i><span><b> Hide List</b></span>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="boxshadow">
                               
                                    <div class="row form-group" id="divbtnAddItem" runat="server">
                                        <div class="col-ak15 margin-top-10">
                                            <asp:LinkButton ID="btnAddItemPopup" runat="server" CssClass="btn btn-success btn-block" OnClick="btnAddItemPopup_Click">
                                                <i class="glyphicon glyphicon-hand-right"></i><span id="spanAddViewItem" runat="server"> Add Item</span>
                                            </asp:LinkButton>
                                        </div>
                                    </div>

                                    <div class="row form-group scroll-x">
                                        <div class="col-ak100">
                                            <asp:GridView ID="grdPartyOnlyDisp" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnRowCommand="grdItemData_RowCommand" OnPreRender="grdItemData_PreRender">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SNo.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item Category">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemCategorydisp" runat="server" Text='<%# Eval("Item_Category_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item Sub Category">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemSubCategorydisp" runat="server" Text='<%# Eval("Item_Sub_Category_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemNamedisp" runat="server" Text='<%# Eval("Item_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemCodedisp" runat="server" Text='<%# Eval("Item_Code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="QTY">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblQuantitydisp" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Unit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemUnitdisp" runat="server" Text='<%# Eval("Unit_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item Description" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemDescriptiondisp" runat="server" Text='<%# Eval("Item_Desc") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Reserve Price" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReservePricedisp" runat="server" Text='<%# Eval("Reserve_Price") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Applicable Tax(%)" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApplicableTaxInPercentagedisp" runat="server" Text='<%# Eval("Applicable_Tax_In_Percentage") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Start Price">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStartPricedisp" runat="server" Text='<%# Eval("Start_Price") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Minimum Bid Range" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMinimumBidChangedisp" runat="server" Text='<%# Eval("Minimum_Bid_Change") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Bid Cushion Range" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBidCushionLimitdisp" runat="server" Text='<%# Eval("Bid_Cushion_Limit") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CMD" Visible="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCMDdisp" runat="server" Text='<%# Eval("CMD") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remarks" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemRemarksdisp" runat="server" Text='<%# Eval("Remarks") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>

                            <div id="divbuttonRemark" runat="server">
                                <div class="row">
                                    <div class="col-ak100">
                                        <label class="col-form-label">Remarks<span class="text-red"> </span></label>
                                        <asp:TextBox ID="txt_Remarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row" id="DivActionRemark" runat="server" visible="false">
                                    <div class="col-ak100">
                                        <label for="exampleInputEmail1" class="col-form-label" runat="server">Action Remarks<span class="text-red">*</span></label>
                                        <asp:TextBox ID="txt_Action_Remarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfv_Action_Remarks" ControlToValidate="txt_Action_Remarks" SetFocusOnError="True" ForeColor="Red" ErrorMessage="This Field is Mandatory !" ValidationGroup="Save" Display="Dynamic" />
                                    </div>
                                </div>

                                <div id="divTransactionPass" runat="server">
                                    <div class="row form-group">
                                        <div class="col-ak20">
                                            <label class="col-form-label" id="lblTransactionPassword" runat="server" visible="false">Transaction Password <span class="text-red">*</span></label>
                                        </div>
                                        <div class="col-ak20">
                                            <asp:TextBox ID="txtUserTransactionPassword" Visible="false" TextMode="Password" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvUserTransactionPassword" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtUserTransactionPassword" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div id="OldAndNewRecord" runat="server">
                                    <div class="row form-group">
                                        <br />
                                        <div class="col-ak30">
                                        </div>
                                        <div class="col-ak15">
                                            <asp:LinkButton ID="btnSaveAsDraft" runat="server" CssClass="btn btn-blue  btn-block" Text="Save As Draft" ValidationGroup="SaveAsDraft" OnClick="btnSaveAsDraft_Click" />
                                        </div>
                                        <div class="col-ak15">
                                            <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-success  btn-block" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />
                                        </div>
                                        <div class="col-ak10">
                                            <asp:LinkButton ID="btnClear" runat="server" CssClass="btn btn-warning  btn-block" Text="Clear" OnClick="btnClear_Click" />
                                        </div>
                                    </div>
                                </div>

                                <div id="divProcessButton" runat="server">
                                    <div class="row form-group">
                                        <div class="col-ak15">
                                            <asp:LinkButton ID="btnReadyforPublishing" runat="server" CssClass="btn btn-info  btn-block" Text="Ready For Publishing" ValidationGroup="Save" OnClick="btnReadyforPublishing_Click" />
                                        </div>
                                        <div class="col-ak10">
                                            <asp:LinkButton ID="btnPublished" runat="server" CssClass="btn btn-primary  btn-block" Text="Published" ValidationGroup="Save" OnClick="btnPublished_Click" />
                                        </div>
                                        <div class="col-ak10">
                                            <asp:LinkButton ID="btnReject" runat="server" CssClass="btn btn-danger  btn-block" Text="Reject" ValidationGroup="Save" OnClick="btnReject_Click" />
                                        </div>
                                        <div class="col-ak10">
                                            <asp:LinkButton ID="btnActive" runat="server" CssClass="btn btn-warning  btn-block" Text="Active" ValidationGroup="Save" OnClick="btnActive_Click" />
                                        </div>
                                        <div class="col-ak10">
                                            <asp:LinkButton ID="btnDiscarded" runat="server" CssClass="btn btn-danger  btn-block" Text="Discarded" ValidationGroup="Save" OnClick="btnDiscarded_Click" />
                                        </div>
                                        <div class="col-ak10">
                                            <asp:LinkButton ID="btnConducted" runat="server" CssClass="btn btn-info  btn-block" Text="Conducted" ValidationGroup="Save" OnClick="btnConducted_Click" />
                                        </div>
                                        <div class="col-ak10">
                                            <asp:LinkButton ID="btnSettled" runat="server" CssClass="btn btn-warning  btn-block" Text="Settled" ValidationGroup="Save" OnClick="btnSettled_Click" />
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div id="divAuctionList" runat="server">
                                <asp:HiddenField ID="hdfAuctionStatusId" runat="server" Visible="false" Value="0" />
                                <div class="row form-group GridScroll">
                                    <div class="col-ak100">
                                        <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnRowCommand="grdData_RowCommand" OnPreRender="grdData_PreRender" OnRowDataBound="grdData_RowDataBound">

                                            <Columns>
                                                <asp:TemplateField HeaderText="SNo.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                        <asp:HiddenField Visible="false" ID="hdfAuctionId" runat="server" Value='<%# Eval("Auction_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfRemark" runat="server" Value='<%# Eval("Remarks") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfAuctionStatusIddb" runat="server" Value='<%# Eval("Action_Status_Id") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Auction Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionName" Text='<%#Eval("Auction_Name") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Catalog">
                                                    <ItemTemplate>
                                                        <asp:Image ID="ImageCatalog" Style="height: 50px; width: 50px" runat="server" ImageUrl='<%# Eval("Upload_Catalogue_File_Path") %>' Height="120px" Width="150px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Auction Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionType" Text='<%#Eval("Auction_Type") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Primary Currency">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPrimaryCurrency" Text='<%#Eval("Currency_Name") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Open Date & Time">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpenDateTime" Text='<%# _objUtility.Convert_Date_Into_ddMMyyyyhhmmsstt(Convert.ToDateTime(Eval("Open_Date_Time"))) %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Close Date & Time">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCloseDateTime" Text='<%# _objUtility.Convert_Date_Into_ddMMyyyyhhmmsstt(Convert.ToDateTime(Eval("Close_Date_Time"))) %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status_Name") %>' CssClass="fontweight700"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="View">
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkBtnView" CommandArgument='<%# Container.DataItemIndex %>' CommandName="View" ToolTip="View" CssClass="glyphicon glyphicon-eye-open" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="Edit">
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkBtnEdt" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Edt" ToolTip="Edit" CssClass="glyphicon glyphicon-pencil" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="Clone">
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkBtnClone" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Clone" ToolTip="Clone" CssClass="fa fa-clone" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

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
                                            <asp:Label ID="lblGDocumentName" runat="server">Item</asp:Label>
                                        </div>
                                        <div class="modalPopUpBody">
                                            <div id="divImgpdf" runat="server">
                                                <div id="divIamgePreview" runat="server">
                                                    <asp:Image ID="itemImgFullView" runat="server" CssClass="modalPopUpImageSizeWithoutText" />
                                                </div>
                                                <div id="divpdfPreview" runat="server">
                                                    <iframe id="IframePDF" runat="server" height="800" width="100%"></iframe>
                                                </div>
                                            </div>

                                            <div id="divItemDetailsAdd" runat="server">

                                                <div id="ItemDetails" runat="server">
                                                    <asp:HiddenField ID="hdfAuctionItemLinkId" runat="server" Value="0" Visible="false" />
                                                    <asp:HiddenField ID="hdfItemEditIndex" runat="server" Value="0" Visible="false" />

                                                    <div id="DivItemDisabledEnable" runat="server">
                                                        <div class="row form-group">
                                                            <div class="col-ak20">
                                                                <label class="col-form-label">Item Category<span class="text-red"> *</span></label>
                                                                <asp:DropDownList ID="ddlItemCategory" runat="server" CssClass="form-control" AutoComplete="off">
                                                                    <asp:ListItem Value="0">select</asp:ListItem>
                                                                    <asp:ListItem Value="1">IC-Test1</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvItemCategory" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlItemCategory" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak20">
                                                                <label class="col-form-label">Item Sub Category<span class="text-red"> *</span></label>
                                                                <asp:DropDownList ID="ddlItemSubCategory" runat="server" CssClass="form-control" AutoComplete="off">
                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                    <asp:ListItem Value="1">ISC-Test1</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvItemSubCategory" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlItemSubCategory" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak20">
                                                                <label class="col-form-label">Item Name<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvItemName" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtItemName" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak20">
                                                                <label class="col-form-label">Item Code<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvItemCode" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtItemCode" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak7">
                                                                <label class="col-form-label">QTY<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtQTY" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowDecimalOnly(this,event,3);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvQTY" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtQTY" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak13">
                                                                <label class="col-form-label">Unit<span class="text-red"> *</span></label>
                                                                <asp:DropDownList ID="ddlUnit" runat="server" CssClass="form-control" AutoComplete="off"></asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvUnit" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlUnit" InitialValue="0" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>

                                                        <div class="row form-group">
                                                            <div class="col-ak20">
                                                                <label class="col-form-label">Reserve Price<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtReservePrice" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowDecimalOnly(this,event,3);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvReservePrice" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtReservePrice" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak20">
                                                                <label class="col-form-label">Applicable Tax(%)<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtApplicableTax" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowDecimalOnly(this,event,3);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvApplicableTax" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtApplicableTax" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak20">
                                                                <label class="col-form-label">Starting Price<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtStartingPrice" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowDecimalOnly(this,event,3);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvStartingPrice" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtStartingPrice" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak20">
                                                                <label class="col-form-label">Minimum Bid Range<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtMinimumBidRange" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowDecimalOnly(this,event,3);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvMinimumBidRange" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtMinimumBidRange" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak20">
                                                                <label class="col-form-label">Bid Cushion Range<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtBidCushionRange" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowDecimalOnly(this,event,3);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvBidCushionRange" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtBidCushionRange" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>

                                                        <div class="row form-group">
                                                            <div class="col-ak20">
                                                                <label class="col-form-label">CMD<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtItemCMD" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowDecimalOnly(this,event,3);"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvItemCMD" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtItemCMD" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-ak20 displayMiddle">
                                                                <label id="lblAttachment" runat="server" class="col-form-label">Attachment 1<span class="text-red"> </span></label>
                                                                <asp:Image ID="PreviewImageAttachment" src="../Images/camera.jpg" title="Upload " onclick="triggerAttachmentFileUpload()" runat="server" />
                                                                <asp:FileUpload ID="fuAttachmentUploadImage" runat="server" onchange="UploadAttachmentFile(this)" Style="visibility: hidden; display: none" accept="image/*;capture=camera"></asp:FileUpload>
                                                                <asp:Button runat="server" ID="btnAttachmentImage" Style="display: none" UseSubmitBehavior="false" Text="upload temp" CssClass="Control_Display_None" OnClick="btnAttachmentImage_Click" />
                                                                <div runat="server" id="divAttachment" visible="false" class="displayMiddle">
                                                                    <asp:HiddenField ID="hdfAttachmentImagePath" runat="server" Visible="false" />
                                                                    <asp:ImageButton ID="ImgbtnAttachmentPreview" runat="server" CssClass="imgshow" Visible="false" Height="45" Width="45" OnClick="ImgbtnAttachmentPreview_Click" />

                                                                    <asp:LinkButton ID="lnkbtnAttachmentRemoveImage" runat="server" ToolTip="Remove " CssClass="btn btn-danger margin-top-66" OnClick="lnkbtnAttachmentRemoveImage_Click">
                                                             <i class="glyphicon glyphicon-remove"></i>
                                                               <span></span>
                                                                    </asp:LinkButton>
                                                                </div>
                                                            </div>

                                                            <div class="col-ak20 displayMiddle">
                                                                <label id="lblAttachment2" runat="server" class="col-form-label">Attachment 2 <span class="text-red"></span></label>
                                                                <asp:Image ID="PreviewImageAttachment2" src="../Images/camera.jpg" title="Upload " onclick="triggerAttachment2FileUpload()" runat="server" />
                                                                <asp:FileUpload ID="fuAttachment2UploadImage" runat="server" onchange="UploadAttachment2File(this)" Style="visibility: hidden; display: none" accept="image/*;capture=camera"></asp:FileUpload>
                                                                <asp:Button runat="server" ID="btnAttachment2Image" Style="display: none" UseSubmitBehavior="false" Text="upload temp" CssClass="Control_Display_None" OnClick="btnAttachment2Image_Click" />
                                                                <div runat="server" id="divAttachment2" visible="false" class="displayMiddle">
                                                                    <asp:HiddenField ID="hdfAttachment2ImagePath" runat="server" Visible="false" />
                                                                    <asp:ImageButton ID="ImgbtnAttachment2Preview" runat="server" CssClass="imgshow" Visible="false" Height="45" Width="45" OnClick="ImgbtnAttachment2Preview_Click" />

                                                                    <asp:LinkButton ID="lnkbtnAttachment2RemoveImage" runat="server" ToolTip="Remove " CssClass="btn btn-danger margin-top-66" OnClick="lnkbtnAttachment2RemoveImage_Click">
                                                             <i class="glyphicon glyphicon-remove"></i>
                                                               <span></span>
                                                                    </asp:LinkButton>
                                                                </div>
                                                            </div>
                                                            <div class="col-ak20 displayMiddle">
                                                                <label id="lblAttachment3" runat="server" class="col-form-label">Attachment 3<span class="text-red"> </span></label>
                                                                <asp:Image ID="PreviewImageAttachment3" src="../Images/camera.jpg" title="Upload " onclick="triggerAttachment3FileUpload()" runat="server" />
                                                                <asp:FileUpload ID="fuAttachment3UploadImage" runat="server" onchange="UploadAttachment3File(this)" Style="visibility: hidden; display: none" accept="image/*;capture=camera"></asp:FileUpload>
                                                                <asp:Button runat="server" ID="btnAttachment3Image" Style="display: none" UseSubmitBehavior="false" Text="upload temp" CssClass="Control_Display_None" OnClick="btnAttachment3Image_Click" />
                                                                <div runat="server" id="divAttachment3" visible="false" class="displayMiddle">
                                                                    <asp:HiddenField ID="hdfAttachment3ImagePath" runat="server" Visible="false" />
                                                                    <asp:ImageButton ID="ImgbtnAttachment3Preview" runat="server" CssClass="imgshow" Visible="false" Height="45" Width="45" OnClick="ImgbtnAttachment3Preview_Click" />
                                                                    <asp:LinkButton ID="lnkbtnAttachment3RemoveImage" runat="server" ToolTip="Remove " CssClass="btn btn-danger margin-top-66" OnClick="lnkbtnAttachment3RemoveImage_Click">
                                                             <i class="glyphicon glyphicon-remove"></i>
                                                               <span></span>
                                                                    </asp:LinkButton>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row form-group">
                                                            <div class="col-ak100">
                                                                <label class="col-form-label">Item Description<span class="text-red"> *</span></label>
                                                                <asp:TextBox ID="txtItemDescription" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvItemDescription" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtItemDescription" ForeColor="Red" ValidationGroup="ItemDetails"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>

                                                        <div class="row form-group">
                                                            <div class="col-ak90">
                                                                <label class="col-form-label">Remarks<span class="text-red"> </span></label>
                                                                <asp:TextBox ID="txtItemRemark" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                                            </div>

                                                            <div class="col-ak10">
                                                                <label class="col-form-label" style="visibility: hidden">PlaceHolder</label>
                                                                <asp:LinkButton ID="lnkbtnAdd" runat="server" CssClass="btn btn-success btn-block" ValidationGroup="ItemDetails" OnClick="lnkbtnAdd_Click">
                                <i class="glyphicon glyphicon-plus"></i>
                                <span>Add</span>
                                                                </asp:LinkButton>
                                                            </div>
                                                        </div>

                                                        <div class="row form-group">
                                                            <div class="col-ak100">
                                                                <center>
                                                            <b><asp:Label ID="lblMessage" runat="server" CssClass="text-red"></asp:Label></b>
                                                        </center>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="row form-group scroll-x">
                                                    <div class="col-ak100">
                                                        <asp:GridView ID="grdItemData" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnRowCommand="grdItemData_RowCommand" OnPreRender="grdItemData_PreRender">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="SNo.">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                        <asp:HiddenField Visible="false" ID="hdfAuctionItemLinkId" runat="server" Value='<%#Eval("Auction_Item_Link_Id") %>' />
                                                                        <asp:HiddenField Visible="false" ID="hdfAuctionId" runat="server" Value='<%#Eval("Auction_Id") %>' />
                                                                        <asp:HiddenField Visible="false" ID="hdfRemark" runat="server" Value='<%# Eval("Remarks") %>' />
                                                                        <asp:HiddenField Visible="false" ID="hdfStatusId" runat="server" Value='<%#Eval("Status_Id") %>' />
                                                                        <asp:HiddenField Visible="false" ID="hdfAttachmentFilePath1" runat="server" Value='<%#Eval("Attachment_File_Path1") %>' />
                                                                        <asp:HiddenField Visible="false" ID="hdfAttachmentFilePath2" runat="server" Value='<%#Eval("Attachment_File_Path2") %>' />
                                                                        <asp:HiddenField Visible="false" ID="hdfAttachmentFilePath3" runat="server" Value='<%#Eval("Attachment_File_Path3") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Item Category">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemCategory" runat="server" Text='<%# Eval("Item_Category_Name") %>'></asp:Label>
                                                                        <asp:HiddenField Visible="false" ID="hdfItemCategoryId" runat="server" Value='<%# Eval("Item_Category_Id") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Item Sub Category">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemSubCategory" runat="server" Text='<%# Eval("Item_Sub_Category_Name") %>'></asp:Label>
                                                                        <asp:HiddenField Visible="false" ID="hdfItemSubCategoryId" runat="server" Value='<%# Eval("Item_Sub_Category_Id") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Item Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("Item_Name") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Item Code">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemCode" runat="server" Text='<%# Eval("Item_Code") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="QTY">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Unit">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemUnit" runat="server" Text='<%# Eval("Unit_Name") %>'></asp:Label>
                                                                        <asp:HiddenField Visible="false" ID="hdfItemUnitId" runat="server" Value='<%# Eval("Unit_Id") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Item Description" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemDescription" runat="server" Text='<%# Eval("Item_Desc") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Reserve Price" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblReservePrice" runat="server" Text='<%# Eval("Reserve_Price") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Applicable Tax(%)" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblApplicableTaxInPercentage" runat="server" Text='<%# Eval("Applicable_Tax_In_Percentage") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Start Price">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStartPrice" runat="server" Text='<%# Eval("Start_Price") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Minimum Bid Range" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblMinimumBidChange" runat="server" Text='<%# Eval("Minimum_Bid_Change") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Bid Cushion Range" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblBidCushionLimit" runat="server" Text='<%# Eval("Bid_Cushion_Limit") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="CMD" Visible="true">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCMD" runat="server" Text='<%# Eval("CMD") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Remarks" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblItemRemarks" runat="server" Text='<%# Eval("Remarks") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="Remove">
                                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkBtnRemove" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Remove" ToolTip="Remove" CssClass="glyphicon glyphicon-trash text-red" runat="server"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="Edit">
                                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkBtnEdit" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Edt" ToolTip="Remove" CssClass="glyphicon glyphicon-pencil text-green" runat="server"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div align="right" class="modalPopFooter">
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAttachmentImage" />
            <asp:PostBackTrigger ControlID="btnAttachment2Image" />
            <asp:PostBackTrigger ControlID="btnAttachment3Image" />
            <asp:PostBackTrigger ControlID="btnCatalogImage" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:HiddenField ID="ValidImageExtension" runat="server" />

    <asp:ModalUpdateProgress ID="ModalUpDateProgress1" runat="server" DisplayAfter="0"
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
