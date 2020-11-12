<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CategoryMaster.aspx.cs" Inherits="eAuction.CategoryMaster" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(
         function () {
             ApplyGridFilter('<%=grdData.ClientID%>', '330');
         }
        );
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-ak100">
                    <div class="card">
                        <div class="card-block">
                            <div class="row">
                                <li id="liMenuHeaderIcon" runat="server"></li>
                                <span id="spanHeader" runat="server" class="sub-title">Category Master</span>
                                <hr />
                            </div>
                            <div class="row form-group">
                                <div class="col-ak20">
                                    <label class="col-form-label">Type<span class="text-red"> *</span></label>
                                    <asp:DropDownList ID="ddlCategoryType" runat="server" CssClass="form-control" AutoComplete="off">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvType" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlCategoryType" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-ak80">
                                    <label class="col-form-label">Name<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvName" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtCategoryName" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    <asp:HiddenField ID="hdfCategoryId" runat="server" Value="0" Visible="false" />
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

                            <div class="row form-group" id="divActionRemark" runat="server" visible="false">
                                <div class="col-ak100">
                                    <label class="col-form-label">Action Remarks<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtActionRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvActionRemarks" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtActionRemarks" ForeColor="Red" ValidationGroup="SaveXYZ"></asp:RequiredFieldValidator>

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
                                    <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary btn-block pull-left" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />
                                </div>
                                <div class="col-ak10">
                                    <asp:LinkButton ID="btnClear" runat="server" CssClass="btn btn-warning btn-block pull-right" Text="Clear" OnClick="btnClear_Click" />
                                </div>
                            </div>
                            <div class="row form-group">
                            </div>
                            <hr />
                            <div class="row GridScroll">
                                <div class="col-ak100">
                                    <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found"
                                        OnPreRender="grdData_PreRender" OnRowCommand="grdData_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SNo.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                    <asp:HiddenField Visible="false" ID="hdfgrdCategory_Id" runat="server" Value='<%# Eval("Category_Id") %>' />
                                                    <asp:HiddenField Visible="false" ID="hdfgrdCategory_Type_Enum_Id" runat="server" Value='<%# Eval("Category_Type_Enum_Id") %>' />
                                                    <asp:HiddenField Visible="false" ID="hdfgrdStatus_Id" runat="server" Value='<%# Eval("Status_Id") %>' />
                                                    <asp:HiddenField Visible="false" ID="hdfgrdRemarks" runat="server" Value='<%# Eval("Remarks") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType" runat="server" Text='<%# Eval("Category_Type") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCategoryName" runat="server" Text='<%# Eval("Category_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Name" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCategoryCode" runat="server" Text='<%# Eval("Category_Code") %>'></asp:Label>
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
    </asp:UpdatePanel>
    <asp:ModalUpdateProgress ID="ModalUpdateProgress1" runat="server" DisplayAfter="0"
        BackgroundCssClass="modalBackground">
        <ProgressTemplate>
            <div>
                <img src="../dist/img/lg.palette-rotating-ring-loader.gif" align="middle" />
            </div>
        </ProgressTemplate>
    </asp:ModalUpdateProgress>
</asp:Content>
