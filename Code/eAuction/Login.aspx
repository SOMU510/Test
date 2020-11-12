<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="YCS.Login" %>

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
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="LoginCss/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/select2/select2.min.css">
    <script src="Custom/JavaScript.js" type="text/javascript"></script>
    <link href="Content/bootstrap_custom.css" rel="stylesheet" />
    <link href="Custom/Theme.css" rel="stylesheet" />
    <script type="text/javascript" language="javascript" src="DataTables/jQuery-1.12.3/jquery-1.12.3.js"></script>
    <script type="text/javascript" language="javascript" src="DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
    <link type="text/css" href="DataTables/DataTables-1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />

    <script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
            document.getElementById('<%= hdfClinetURLOrigin.ClientID%>').value = window.location.origin;
        }

    </script>

    <style>
        .input-group .input-group-addon 
        {
            border-radius: 0;
            border-color: none !important;
            background-color: #fff;
            padding-left: 11px;
            padding-right: 27px;
            padding-top: 12px;
            padding-bottom: 2px;
            border-bottom: 1px solid black;
            border-top: 0px solid black;
            border-left: 0px solid black;
            border-right: 0px solid black;
        }

        .form-control {
            height: 35px !important;
            border-left: 0px solid white;
            padding-left: 5px !important;
        }

        .LoginBox {
         height: 125px;
    background-color: #00BCD4;
    margin-bottom: 10px;
    padding-top: 6px;
        }

        .headingp {
            font-size: 25px;
            padding-top: 20px;
            color: white;
        }
          .headingsign {
            font-size: 25px;
            padding-top: 2px;
            color: white;
        }
          
.btn-primary :hover {
    background-color:#054376 !Important;
}
.btn-primary {
    background-image: linear-gradient(to left, #054376, #054376) !important;
    border-color: #054376 !important;
    color: white;
}
    </style>

</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" class="hold-transition login-page Loginbody">
    <form runat="server">
        <asp:HiddenField ID="hdfClinetURLOrigin" runat="server" />
        <div class="login-box-padding">
            <div class="login-box-body">
                <div class="form-group row">
                    <div class="border-radius">
                        <div class="col-ak50">
                                                        <center>
                          <%--   <div class="LoginBox">
                                 <p class="headingp">Welcome To Crystal Corporation</p>
                                      <p class="headingsign">Sign In</p>
                             </div>--%>
<img src='<%= YCS.YCS_Configuration.LOGIN_PAGE_IMAGE_URL %>' class="img-responsive" />
                        </center>
                                          </div>
                           <div class="col-ak2" style="height:350px;border-left:2px solid #054376">
                               </div>
                               <div class="col-ak48">
                              <h2 class="w3layouts-main"><span>Welcome To <%= YCS.YCS_Configuration.LOGIN_PAGE_PRODUCT_NAME %></span></h2>
                              <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </div>
                                <asp:TextBox ID="txtLoginId" runat="server" CssClass="form-control" placeholder="Enter Login Id"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvLoginId" ControlToValidate="txtLoginId" ErrorMessage="Login Id is Mandatory" ToolTip="Login Id is Mandatory" Display="Dynamic" runat="server" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock"></span>
                                </div>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" ErrorMessage="Password is Mandatory" ToolTip="Password is Mandatory" Display="Dynamic" runat="server" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            <label class="Margin-Top">
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            </label>
                            <br />
                            <a href="ForgotPassword.aspx" class="pull-left text-blue">Reset Password?</a>
                            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary padding-20 pull-right" Text="Login" OnClick="btnLogin_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
