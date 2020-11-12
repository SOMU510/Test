<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="eAuction.ChangePassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ChangePassword(controlid) {

            var id = controlid.id;
            var rfvOldPassword = id.replace("chkIsChangePassword", "rfvOldPassword")
            var rfvNewPassword = id.replace("chkIsChangePassword", "rfvNewPassword")
            var rfvreEnter = id.replace("chkIsChangePassword", "rfvreEnter")

            var txtOldPassword = id.replace("chkIsChangePassword", "txtOldPassword")
            var txtNewPassword = id.replace("chkIsChangePassword", "txtNewPassword")
            var txtreEnter = id.replace("chkIsChangePassword", "txtreEnter")

            if (document.getElementById(controlid.id).checked) {
                // document.getElementById(rfvOldPassword).style.visibility = "visible";
                //alert(document.getElementById(rfvOldPassword).disabled);
                //document.getElementById(rfvOldPassword).disabled = false;
                //alert(document.getElementById(rfvOldPassword).disabled);

                document.getElementById(txtOldPassword).disabled = false;
                ValidatorEnable(document.getElementById(rfvOldPassword), true);
                document.getElementById(txtOldPassword).value = '';

                document.getElementById(txtNewPassword).disabled = false;
                ValidatorEnable(document.getElementById(rfvNewPassword), true);
                document.getElementById(txtNewPassword).value = '';

                document.getElementById(txtreEnter).disabled = false;
                ValidatorEnable(document.getElementById(rfvreEnter), true);
                document.getElementById(txtreEnter).value = '';
            }
            else {
                document.getElementById(txtOldPassword).disabled = true;
                ValidatorEnable(document.getElementById(rfvOldPassword), false);
                document.getElementById(txtOldPassword).value = '';

                document.getElementById(txtNewPassword).disabled = true;
                ValidatorEnable(document.getElementById(rfvNewPassword), false);
                document.getElementById(txtNewPassword).value = '';

                document.getElementById(txtreEnter).disabled = true;
                ValidatorEnable(document.getElementById(rfvreEnter), false);
                document.getElementById(txtreEnter).value = '';
            }
        }


        function ChangeTransactionPassword(controlid) {

            var id = controlid.id;
            var rfvTransactionOldPassword = id.replace("chkbIsChangeTransactionPasssword", "rfvTransactionOldPassword")
            var rfvNewTranactionPassword = id.replace("chkbIsChangeTransactionPasssword", "rfvNewTranactionPassword")
            var rfvReEnterNewTranactionPassword = id.replace("chkbIsChangeTransactionPasssword", "rfvReEnterNewTranactionPassword")

            var txtTransactionOldPassword = id.replace("chkbIsChangeTransactionPasssword", "txtTransactionOldPassword")
            var txtNewTranactionPassword = id.replace("chkbIsChangeTransactionPasssword", "txtNewTranactionPassword")
            var txtReEnterNewTranactionPassword = id.replace("chkbIsChangeTransactionPasssword", "txtReEnterNewTranactionPassword")

            if (document.getElementById(controlid.id).checked) {
                document.getElementById(txtTransactionOldPassword).disabled = false;
                ValidatorEnable(document.getElementById(rfvTransactionOldPassword), true);
                document.getElementById(rfvTransactionOldPassword).validationGroup = "Save";
                document.getElementById(txtTransactionOldPassword).value = '';

                document.getElementById(txtNewTranactionPassword).disabled = false;
                ValidatorEnable(document.getElementById(rfvNewTranactionPassword), true);
                document.getElementById(rfvNewTranactionPassword).validationGroup = "Save";
                document.getElementById(txtNewTranactionPassword).value = '';

                document.getElementById(txtReEnterNewTranactionPassword).disabled = false;
                ValidatorEnable(document.getElementById(rfvReEnterNewTranactionPassword), true);
                document.getElementById(rfvReEnterNewTranactionPassword).validationGroup = "Save";
                document.getElementById(txtReEnterNewTranactionPassword).value = '';
            }
            else {
                document.getElementById(txtTransactionOldPassword).disabled = true;
                ValidatorEnable(document.getElementById(rfvTransactionOldPassword), false);
                document.getElementById(txtTransactionOldPassword).value = '';

                document.getElementById(txtNewTranactionPassword).disabled = true;
                ValidatorEnable(document.getElementById(rfvNewTranactionPassword), false);
                document.getElementById(txtNewTranactionPassword).value = '';

                document.getElementById(txtReEnterNewTranactionPassword).disabled = true;
                ValidatorEnable(document.getElementById(rfvReEnterNewTranactionPassword), false);
                document.getElementById(txtReEnterNewTranactionPassword).value = '';
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-ak100">
                    <div class="card">
                        <div class="card-block">
                            <div class="form-group row">
                                <div class="col-ak100">
                                    <span id="spanHeader" runat="server" class="sub-title">
                                        <i class="glyphicon glyphicon-edit"></i>
                                        <%-- Change Login/Transaction Password--%>
                                        Change Password
                                    </span>
                                    <hr />
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-ak35">
                                    <asp:CheckBox ID="chkIsChangePassword" runat="server" Text="Is Change Login Password" CssClass="checkbox checkbox-info" onclick="ChangePassword(this);" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-ak35">
                                    <label class="col-form-label">Old Password<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" AutoComplete="off" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvOldPassword" ControlToValidate="txtOldPassword" SetFocusOnError="True" ForeColor="Red" ErrorMessage="This Field is Mandatory" ValidationGroup="Save" Display="Dynamic" Enabled="false" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-ak35">
                                    <label class="col-form-label">New Password<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" AutoComplete="off" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNewPassword" ControlToValidate="txtNewPassword" SetFocusOnError="True" ForeColor="Red" ErrorMessage="This Field is Mandatory" ValidationGroup="Save" Display="Dynamic" Enabled="false" />
                                    <asp:RegularExpressionValidator ID="regNewPassword" runat="server" ControlToValidate="txtNewPassword" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" ValidationGroup="Save" Display="Dynamic" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-ak35">
                                    <label class="col-form-label">Re-Enter New Password<span class="text-red"> *</span></label>
                                    <asp:TextBox ID="txtreEnter" runat="server" CssClass="form-control" AutoComplete="off" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvreEnter" ControlToValidate="txtreEnter" SetFocusOnError="True" ForeColor="Red" ErrorMessage="This Field is Mandatory" ValidationGroup="Save" Display="Dynamic" Enabled="false" />
                                    <asp:CompareValidator ID="cvreEnter" Operator="Equal" runat="server" ValidationGroup="Save" ControlToValidate="txtreEnter" ControlToCompare="txtNewPassword" ForeColor="Red" ErrorMessage="Both Passwords Not Matching !!!" SetFocusOnError="true">
                                    </asp:CompareValidator>
                                </div>
                            </div>

                            <div id="divChangeTransactionPassword" runat="server" visible="false">
                                <div class="form-group row">
                                    <div class="col-ak35">
                                        <asp:CheckBox ID="chkbIsChangeTransactionPasssword" runat="server" Text="Is Change Transaction Password" CssClass="checkbox checkbox-info" onclick="ChangeTransactionPassword(this);" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-ak35">
                                        <label class="col-form-label">Old Tranaction Password<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtTransactionOldPassword" runat="server" CssClass="form-control" AutoComplete="off" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvTransactionOldPassword" ControlToValidate="txtTransactionOldPassword" SetFocusOnError="True" ForeColor="Red" ErrorMessage="This Field is Mandatory" ValidationGroup="Save" Display="Dynamic" Enabled="false" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-ak35">
                                        <label class="col-form-label">New Tranaction Password<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtNewTranactionPassword" runat="server" CssClass="form-control" AutoComplete="off" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvNewTranactionPassword" ControlToValidate="txtNewTranactionPassword" SetFocusOnError="True" ForeColor="Red" ErrorMessage="This Field is Mandatory" ValidationGroup="Save" Display="Dynamic" Enabled="false" />
                                        <asp:RegularExpressionValidator ID="revNewTranactionPassword" runat="server" ControlToValidate="txtNewTranactionPassword" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" ValidationGroup="Save" Display="Dynamic" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-ak35">
                                        <label class="col-form-label">Re-Enter New Tranaction Password<span class="text-red"> *</span></label>
                                        <asp:TextBox ID="txtReEnterNewTranactionPassword" runat="server" CssClass="form-control" AutoComplete="off" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvReEnterNewTranactionPassword" ControlToValidate="txtReEnterNewTranactionPassword" SetFocusOnError="True" ForeColor="Red" ErrorMessage="This Field is Mandatory" ValidationGroup="Save" Display="Dynamic" Enabled="false" />
                                        <asp:CompareValidator ID="cvReEnterNewTranactionPassword" Operator="Equal" runat="server" ValidationGroup="Save" ControlToValidate="txtReEnterNewTranactionPassword" ControlToCompare="txtNewTranactionPassword" ForeColor="Red" ErrorMessage="Both Passwords Not Matching !!!" SetFocusOnError="true">
                                        </asp:CompareValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-ak5"></div>
                                <div class="col-ak20">
                                    <asp:LinkButton ID="btnChangePassword" runat="server" class="btn btn-block btn-primary " Text="Change Password" ValidationGroup="Save" OnClick="btnChangePassword_Click" />
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
