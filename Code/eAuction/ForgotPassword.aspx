<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="YCS.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%= YCS.YCS_Configuration.BROWSER_TITLE_BAR_PRODUCT_NAME %></title>
    <!-- custom-theme -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport">
    <link href="LoginCss/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/select2/select2.min.css">
    <script src="Custom/JavaScript.js" type="text/javascript"></script>
    <link href="Content/bootstrap_custom.css" rel="stylesheet" />

    <link href="Custom/Theme.css" rel="stylesheet" />
    <script type="text/javascript" language="javascript" src="DataTables/jQuery-1.12.3/jquery-1.12.3.js"></script>
    <script type="text/javascript" language="javascript" src="DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
    <link type="text/css" href="DataTables/DataTables-1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />


    <style>
        .input-group .input-group-addon {
            border-radius: 0;
            border-color: none !important;
            background-color: #fff;
            padding-left: 11px;
            padding-right: 18px;
            padding-top: 12px;
            padding-bottom: 2px;
              border-bottom: 1px solid black;
            border-top: 0px solid black;
            border-left: 0px solid black;
            border-right: 0px solid black;
        }

        .form-control {
            height: 45px !important;
            border-left: 0px solid white;
        }
    </style>

    <script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }

        var isNS = (navigator.appName == "Netscape") ? 1 : 0;
        if (navigator.appName == "Netscape") document.captureEvents(Event.MOUSEDOWN || Event.MOUSEUP);
        function mischandler() {
            return false;
        }
        function mousehandler(e) {
            var myevent = (isNS) ? e : event;
            var eventbutton = (isNS) ? myevent.which : myevent.button;
            if ((eventbutton == 2) || (eventbutton == 3)) return false;
        }
        document.oncontextmenu = mischandler;
        document.onmousedown = mousehandler;
        document.onmouseup = mousehandler;
        document.addEventListener('contextmenu', event => event.preventDefault());
    </script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" oncontextmenu="return false" ondragstart="return false" class="Loginbody">
    <div class="login-box-padding">
        <div class="login-box-body">
            <form id="form2" runat="server">
                <div class="form-group row">
                    <div class="border-radius">
                        <div class="col-ak50">
                            <center>
                               <img src='<%= YCS.YCS_Configuration.RESET_PASSWORD_PAGE_IMAGE_URL %>' class="img-responsive" />
                        </center>
                        </div>
                        <div class="col-ak2" style="height: 350px; border-left: 2px solid #054376">
                        </div>

                        <div class="col-ak48">
                            <h2 class="w3layouts-main">Welcome To <%= YCS.YCS_Configuration.LOGIN_PAGE_PRODUCT_NAME %></span></h2>
                             <center><h4>Reset Password</h4></center>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </div>
                                <asp:TextBox ID="txt_Login_Id" runat="server" CssClass="form-control" AutoComplete="off" placeholder="Enter Login Id"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvUserName" Display="Dynamic" runat="server" SetFocusOnError="True"
                                ErrorMessage="Login Id is Mandatory" ToolTip="Login Id is Mandatory" ControlToValidate="txt_Login_Id"
                                ForeColor="Red"></asp:RequiredFieldValidator>

                            <label class="Margin-Top">
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            </label>
                            <br />
                            <u><b><a class="text-blue pull-left" href="Login.aspx">Back To Login</a></b></u>
                            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary padding-20 pull-right" Text="Reset" OnClick="btnLogin_Click" />
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="btnResetTransactionPassword" runat="server" CssClass="btn btn-primary padding-20 pull-right" Text="Reset Transaction Password" OnClick="btnResetTransactionPassword_Click" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>
    <!-- Sparkline -->
    <script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- DataTables -->
    <script src="plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- ChartJS -->
    <script src="bower_components/Chart.js/Chart.js"></script>
    <script src="bootbox/bootbox.min.js"></script>
    <script src="bootbox/bootbox.locales.min.js"></script>
</body>
</html>
