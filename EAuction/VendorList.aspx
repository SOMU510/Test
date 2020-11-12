<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="VendorList.aspx.cs" Inherits="eAuction.VendorList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
    <div class="row">
        <div class="col-ak100">
            <div class="card">
                <div class="card-block">
                    <div class="row">
                            <li id="liMenuHeaderIcon" runat="server"></li>
                            <span id="spanHeader" runat="server" class="sub-title">City Master</span>
                            <hr />
                        </div>
                     <div class="row form-group">
                                <div class="col-ak25">
                                    <label class="col-form-label">Type<span class="text-red"> *</span></label>
                                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" AutoComplete="off" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                 </asp:DropDownList>
                                                                 </div>
                              <div class="col-ak20">
                            <label class="col-form-label">Status<span class="text-red"> *</span></label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" AutoComplete="off">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvStatus" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlStatus" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

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
                                                    <asp:HiddenField Visible="false" ID="hdfVendorId" runat="server" Value='<%# Eval("Vendor_Id") %>' />
                                                    <asp:HiddenField Visible="false" ID="hdfRemark" runat="server" Value='<%# Eval("Remarks") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Designation">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDesignationName" Text='<%#Eval("Designation_Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Company Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCompanyName" Text='<%#Eval("Company_Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Company Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCompanyType" Text='<%#Eval("Company_Type") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMobileNo" Text='<%#Eval("Mobile_No") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmailId" Text='<%#Eval("Email_Id") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="State">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblState" Text='<%#Eval("State_Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="City">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCity" Text='<%#Eval("City_Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pincode">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPincode" Text='<%#Eval("Pincode") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="View">
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBtnView" CommandArgument='<%# Container.DataItemIndex %>' CommandName="View" ToolTip="View" CssClass="glyphicon glyphicon-eye-open" runat="server"></asp:LinkButton>
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
            
                  </contenttemplate>
    </asp:UpdatePanel>
    <asp:ModalUpdateProgress ID="ModalUpdateProgress1" runat="server" DisplayAfter="0"
        BackgroundCssClass="modalBackground">
        <progresstemplate>
                <div>
                    <img src="../dist/img/lg.palette-rotating-ring-loader.gif" align="middle" />
                </div>
            </progresstemplate>
    </asp:ModalUpdateProgress>
</asp:Content>
