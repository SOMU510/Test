<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DocumentMaster.aspx.cs" Inherits="eAuction.DocumentMaster" %>

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
                                    <span id="spanHeader" runat="server" class="sub-title">Document Master</span>
                                    <hr />
                                </div>
                            </div>

                            <div class="row form-group">

                                <div class="col-ak50">
                                    <label class="col-form-label">Document Name<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtDocumentName" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDocumentName" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This Fields is Mandatory" ControlToValidate="txtDocumentName" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    <asp:HiddenField Visible="false" ID="hdf_DocumentId" runat="server" Value="0" />
                                    <asp:HiddenField Visible="false" ID="hdf_Document_Internal_Code" runat="server" Value="0" />
                                    <asp:HiddenField Visible="false" ID="hdfIsEditable" runat="server" Value="True" />
                                    <asp:HiddenField Visible="false" ID="hdfUniqueNo_Min_Length" runat="server" Value="0" />
                                    <asp:HiddenField Visible="false" ID="hdfUniqueNo_Max_Length" runat="server" Value="0" />
                                    <asp:HiddenField Visible="false" ID="hdfIs_Multiple_Allowed" runat="server" Value="False" />
                                    <asp:HiddenField Visible="false" ID="hdfUniqueNo_Character_Allowed" runat="server" Value="" />
                                    <asp:HiddenField Visible="false" ID="hdfValidation_Regex" runat="server" Value="" />
                                </div>
                                <div class="col-ak25">
                                    <label class="col-form-label">Is Required Valid Up To</label>
                                    <asp:CheckBox ID="ChkIsRequiredValidUpTo" runat="server" Text="Is Required Valid Up To" CssClass="checkbox checkbox-info" />
                                </div>
                                <div class="col-ak25">
                                    <label class="col-form-label">Status<span class="text-red"> *</span></label>
                                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" AutoComplete="off" Enabled="false">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvStatus" Display="Dynamic" runat="server" InitialValue="0" SetFocusOnError="True" ErrorMessage="This Fields is Mandatory" ControlToValidate="ddlStatus" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-ak100">
                                    <label class="col-form-label">Remarks<span class="text-red"> </span></label>
                                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group row" id="divActionRemark" runat="server" visible="false">
                                <div class="col-ak100">
                                    <label for="exampleInputEmail1" class="col-form-label" runat="server">Action Remarks<span class="text-red">*</span></label>
                                    <asp:TextBox ID="txtActionRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvActionRemarks" ControlToValidate="txtActionRemarks" SetFocusOnError="True" ForeColor="Red" ErrorMessage="This Field is Mandatory !" ValidationGroup="Save" Display="Dynamic" />
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
                                    <asp:LinkButton ID="btnClear" runat="server" CssClass="btn btn-warning  btn-block" Text="Clear" OnClick="btnClear_Click" />
                                </div>
                            </div>
                            <div class="row form-group">
                            </div>

                            <hr />

                            <div class="row form-group">
                                <div class="rptdata">
                                    <asp:Repeater ID="rptData" runat="server" OnItemCommand="rptData_ItemCommand">
                                        <ItemTemplate>
                                            <div class="col-ak25">
                                                <div class="dataPanel">
                                                    <div class="srnumber">
                                                        <span class="number">
                                                            <asp:Label ID="lblSrno" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label>
                                                            <asp:HiddenField ID="hdf_grd_DocumentId" runat="server" Value='<%#Eval("Document_Id") %>' Visible="false" />
                                                            <asp:HiddenField ID="hdf_grd_Document_Internal_Code" runat="server" Value='<%#Eval("Document_Internal_Code") %>' Visible="false" />
                                                            <asp:HiddenField ID="hdf_Remarks" runat="server" Value='<%#Eval("Remarks") %>' Visible="false" />
                                                            <asp:HiddenField ID="hdf_grd_Is_Editable" runat="server" Value='<%#Eval("Is_Editable") %>' Visible="false" />

                                                            <asp:HiddenField Visible="false" ID="hdf_grd_UniqueNo_Min_Length" runat="server" Value='<%#Eval("UniqueNo_Min_Length") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdf_grd_UniqueNo_Max_Length" runat="server" Value='<%#Eval("UniqueNo_Max_Length") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdf_grd_Is_Multiple_Allowed" runat="server" Value='<%#Eval("Is_Multiple_Allowed") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdf_grd_UniqueNo_Character_Allowed" runat="server" Value='<%#Eval("UniqueNo_Character_Allowed") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdf_grd_Validation_Regex" runat="server" Value='<%#Eval("Validation_Regex") %>' />
                                                        </span>
                                                    </div>
                                                    <label>Document Name </label>
                                                    <br />
                                                    <asp:Label ID="lbl_DocumentName" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                                    <asp:Label ID="lbl_DocumentCode" Text='<%#Eval("Document_Code") %>' runat="server" Visible="false"></asp:Label>
                                                    <br />
                                                    <label>Is Required Valid Up To </label>
                                                    <br />
                                                    <asp:Label ID="lbl_IsRequiredValidUpTo" Text='<%#Eval("Is_Required_Valid_Up_To") %>' runat="server"></asp:Label>
                                                    <br />
                                                    <label>Status</label><br />
                                                    <asp:HiddenField ID="hdf_Status_Id" runat="server" Value='<%#Eval("Status_Id") %>' Visible="false" />
                                                    <asp:Label ID="lbl_StatusName" Text='<%#Eval("Status_Name") %>' runat="server"></asp:Label>
                                                    <hr />
                                                    <center>
                                         <asp:LinkButton ID="lbl_Edit" CssClass="btn btn-primary" text runat="server" CommandName="Edt" CommandArgument='<%# Container.ItemIndex%>'>
                                             <i class="glyphicon glyphicon-pencil">
                                             </i>  
                                             <span>Edit</span>
                                         </asp:LinkButton>
                                      </center>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
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
