<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionExpired.aspx.cs" Inherits="YCS.SessionExpired" %>

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
    <link rel="stylesheet" href="Custom/Theme.css">

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
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" oncontextmenu="return false" ondragstart="return false">
    <form id="form1" runat="server">
        <div class="card">
            <h1 class="text-center" style="margin: auto">
                <span>Session is expired.</span>
                <br />
                <span>Please Logout and Login again.</span>
            </h1>
        </div>
    </form>
</body>
</html>
