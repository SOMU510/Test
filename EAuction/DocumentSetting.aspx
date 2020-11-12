<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DocumentSetting.aspx.cs" Inherits="eAuction.DocumentSetting" %>
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
                                    <span id="spanHeader" runat="server" class="sub-title">Document Setting</span>
                                    <hr />
                                </div>
                            </div>
                           
                            <div class="row">
                                  <div class="col-ak20" style="display: none">
                                    <label class="col-form-label">Firm<span class="text-red"> *</span></label>
                                    <asp:DropDownList ID="ddlFirm" runat="server" CssClass="form-control" AutoComplete="off">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvFirm" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="ddlFirm" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-ak25" style="display: none">
                                    <asp:HiddenField Visible="false" ID="hdf_Action" runat="server" Value="0" />
                                    <asp:HiddenField Visible="false" ID="hdf_Document_Setting_Id" runat="server" Value="0" />
                                </div>
                            </div>

                            <div class="row form-group" id="Div_rptdata" runat="server">
                                <div class="rptdata">
                                    <asp:Repeater ID="rptData" runat="server">
                                        <ItemTemplate>

                                            <div class="col-ak25">
                                                <div class="dataPanel">
                                                    <div class="srnumber">
                                                        <span class="number">
                                                            <asp:Label ID="lblSrno" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label>
                                                        </span>
                                                    </div>
                                                    <label>Document Name </label>
                                                    <br />
                                                    <asp:Label ID="lbl_DocumentName" Text='<%#Eval("Document_Name") %>' runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdf_Document_Id" runat="server" Value='<%#Eval("Document_Id") %>' Visible="false" />
                                                  
                                                    <br />
                                                    <label>Employee</label><br />
                                                    <asp:DropDownList ID="ddl_Employee" runat="server" CssClass="form-control" AutoComplete="off">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfv_Employee" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="*" ControlToValidate="ddl_Employee" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

                                                    <label>Supplier</label><br />
                                                    <asp:DropDownList ID="ddl_Supplier" runat="server" CssClass="form-control" AutoComplete="off">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfv_Supplier" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="*" ControlToValidate="ddl_Supplier" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

                                                    <label>Customer</label><br />
                                                    <asp:DropDownList ID="ddl_Customer" runat="server" CssClass="form-control" AutoComplete="off">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfv_Customer" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="*" ControlToValidate="ddl_Customer" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

                                                     <label>Client</label><br />
                                                    <asp:DropDownList ID="ddl_Client" runat="server" CssClass="form-control" AutoComplete="off">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvClient" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="*" ControlToValidate="ddl_Client" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div id="divNoData" runat="server">
                                <br />
                                <div class="row">
                                    <div class="col-ak100">
                                        <div class="NoRecord">
                                            <center>
                                                 <img src="../Images/NoRecordFound.png" class="img-responsive" />
                                             </center>
                                        </div>
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="row form-group">
                                <div class="col-ak20" id="divStatus" runat="server" visible="false">
                                    <label class="col-form-label">Status<span class="text-red"> *</span></label>
                                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" AutoComplete="off" Enabled="false">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvStatus" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This Field is Mandatory" ControlToValidate="ddlStatus" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-ak100">
                                    <label class="col-form-label">Remarks<span class="text-red"> </span></label>
                                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                </div>

                            </div>

                            <div class="row form-group" id="divActionRemark" runat="server" visible="false">
                                <div class="col-ak100">
                                    <label class="col-form-label">Action Remarks<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtActionRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvActionRemarks" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This Field is Mandatory" ControlToValidate="txtActionRemarks" ForeColor="Red" ValidationGroup="SaveXYZ"></asp:RequiredFieldValidator>

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
                                    <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary  btn-block" Text="Save" ValidationGroup="Save" OnClick="btnSave_Click" />
                                </div>
                                <div class="col-ak10">
                                    <asp:LinkButton ID="btnClear" runat="server" CssClass="btn btn-warning btn-block" Text="Clear" OnClick="btnClear_Click" />
                                </div>
                            </div>
                            <div class="row form-group">
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
