<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RoleMenuLinking.aspx.cs" Inherits="eAuction.RoleMenuLinking" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-ak100">
                    <div class="card">
                        <div class="card-block">
                            <div class="row">
                                <div class="col-ak100">
                                    <li id="liMenuHeaderIcon" runat="server"></li>
                                    <span id="spanHeader" runat="server" class="sub-title">Role Menu Linking</span>
                                    <hr />
                                </div>
                            </div>

                            <div id="divMenuRights" runat="server">
                                <div class="row form-group">
                                    <div class="col-ak33" style="display: none">
                                        <label class="col-form-label">Firm<span class="text-red"> *</span></label>
                                        <asp:DropDownList ID="ddlFirm" runat="server" CssClass="form-control" AutoComplete="off">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvFirm" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlFirm" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-ak20">
                                        <label class="col-form-label">Role Type<span class="text-red"> *</span></label>
                                        <asp:DropDownList ID="ddlRoleType" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlRoleType_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                    <div class="col-ak20">
                                          <label class="col-form-label">Role<span class="text-red"> *</span></label>
                                        <asp:DropDownList ID="ddlRoleName" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlRoleName_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvRoleName" runat="server" Display="Dynamic" InitialValue="0" SetFocusOnError="True" ErrorMessage="This Field is Mandatory" ToolTip="This Field is Mandatory" ControlToValidate="ddlRoleName" ValidationGroup="Save" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:HiddenField Visible="false" ID="hdfId" runat="server" />
                                        <asp:HiddenField Visible="false" ID="hdfDefaultMenuId" runat="server" Value="0" />
                                    </div>

                                </div>

                                <div class="row form-group">
                                    <div class="col-ak100">
                                        <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnPreRender="grdData_PreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="SNo.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                        <asp:HiddenField Visible="false" ID="hdfMenuId" runat="server" Value='<%# Eval("Menu_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfFirmRoleMenuRightId" runat="server" Value='<%# Eval("Role_Menu_Right_Id") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="grid-column-no-sort">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAll" Text="Select" CssClass="checkbox checkbox-info" runat="server" Checked="false" AutoPostBack="true" onclick="return chkAll_CheckedChanged(this);"></asp:CheckBox>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="cbIndividual" Text=" " CssClass="checkbox checkbox-info" runat="server" Checked='<%#Convert.ToBoolean(Eval("Is_Available")) ? true : false %>'></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Default" HeaderStyle-CssClass="grid-column-no-sort">
                                                    <ItemTemplate>
                                                        <asp:RadioButton ID="rbSelectDefault" runat="server" Text=" " AutoPostBack="true" CssClass="radio-item" GroupName="Default" Checked='<%#Convert.ToBoolean(Eval("Is_Default")) ? true : false %>' OnCheckedChanged="rbSelectDefault_CheckedChanged" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Menu Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMenuName" runat="server" Text='<%# Eval("Menu_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Parent Menu Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblParentMenuName" runat="server" Text='<%# Eval("Parent_Menu_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-ak13">
                                          <label class="col-form-label">Remarks<span class="text-red"> *</span></label>
                                    </div>
                                    <div class="col-ak87">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="divActionRemark" runat="server" visible="false">
                                    <div class="col-ak13">
                                        <label class="col-form-label">Action Remarks<span class="text-red">*</span></label>
                                    </div>
                                    <div class="col-ak87">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtActionRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvActionRemarks" runat="server" ControlToValidate="txtActionRemarks" ErrorMessage="This Field is Mandatory" ValidationGroup="SaveXyz" SetFocusOnError="true" CssClass="requiredvalidator" Display="Dynamic"></asp:RequiredFieldValidator>
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
                                        <asp:LinkButton ID="btnSave" CssClass="btn btn-primary btn-block" Text="Save" ValidationGroup="Save" CausesValidation="true" runat="server" OnClick="btnSave_Click" />
                                    </div>
                                    <div class="col-ak10">
                                        <asp:LinkButton ID="btnClear" CssClass="btn btn-warning btn-block" Text="Clear" runat="server" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnClear_Click" />
                                    </div>
                                </div>
                                <div class="row form-group">
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
