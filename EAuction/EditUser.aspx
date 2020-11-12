<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="eAuction.EAuction.EditUser" %>

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
                                <span id="spanHeader" runat="server" class="sub-title">
                                    <i class="glyphicon glyphicon-edit"></i>
                                    Edit Profile</span>
                                <hr />
                            </div>
                            <div id="divEmployee" runat="server">
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
                                        <label class="col-form-label">Login Id<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtLoginId" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvLoginId" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtLoginId" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>

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

                                    <div class="col-ak80">
                                        <label class="col-form-label">Address<span class="text-red"> </span></label>
                                        <asp:TextBox ID="txtEmployee_Address" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-ak20">
                                        <label class="col-form-label">Pincode<span class="text-red"> </span></label>
                                        <asp:TextBox ID="txtEmployee_Pincode" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowNumericOnly(event);" MaxLength="6"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="divParty" runat="server">

                                <div class="row form-group">
                                    <div class="col-ak20">
                                        <label class="col-form-label">Company Name<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtParty_Company_Name" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPartyCompanyName" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtParty_Company_Name" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-ak20">
                                        <label class="col-form-label">Company Code<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtParty_Company_Code" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPartyCompanyCode" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtParty_Company_Code" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-ak20">
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
                                    <div class="col-ak20">
                                        <label class="col-form-label">Designation<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtPartyDesignation" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvDesignation" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtPartyDesignation" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-ak20">
                                        <label class="col-form-label">Mobile No.<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtParty_Mobile_No" runat="server" CssClass="form-control" AutoComplete="off" MaxLength="10" onkeydown="return AllowNumericOnly(event);"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtParty_Mobile_No" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Invalid Mobile No." ToolTip="Invalid Mobile No." ControlToValidate="txtParty_Mobile_No" ValidationGroup="Save" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-ak20">
                                        <label class="col-form-label">Email Id<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtParty_Email_Id" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPartyEmailId" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtParty_Email_Id" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtParty_Email_Id" ValidationGroup="Save" ForeColor="Red" ErrorMessage="Invalid Email" ValidationExpression="^\w*(?=\w*[a-zA-z])\w+([-.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-ak70">
                                        <label class="col-form-label">Address<span class="text-red">*</span></label>
                                        <asp:TextBox ID="txtParty_Address" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    </div>

                                    <div class="col-ak10">
                                        <label class="col-form-label">Pincode<span class="text-red">*</span></label>
                                        <asp:TextBox ID="txtParty_Pincode" runat="server" CssClass="form-control" AutoComplete="off" onkeydown="return AllowNumericOnly(event);" MaxLength="6"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="divActionRemarks" runat="server" visible="true">
                                <div class="row form-group">
                                    <div class="col-ak100">
                                        <label class="col-form-label">Action Remarks<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtEditRemark" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEditRemark" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtEditRemark" ForeColor="Red" ValidationGroup="Save"></asp:RequiredFieldValidator>
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
                                    <asp:LinkButton ID="btnUpdateEmployee" runat="server" CssClass="btn btn-primary btn-block" Text="Save" ValidationGroup="Save" OnClick="btnUpdateEmployee_Click" />
                                    <asp:LinkButton ID="btnUpdateParty" runat="server" CssClass="btn btn-primary btn-block" Text="Save" ValidationGroup="Save" OnClick="btnUpdateParty_Click" />
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
