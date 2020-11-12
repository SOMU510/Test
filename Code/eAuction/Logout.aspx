<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="YCS.Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%= YCS.YCS_Configuration.BROWSER_TITLE_BAR_PRODUCT_NAME %></title>
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
        <div id="menu" runat="server" visible="false">
            <li id="liMenuHeaderIcon" runat="server"></li>
            <span id="spanHeader" runat="server">Logout</span>
        </div>
        <div>
            <h1>you are successfully logged out.</h1>
            <asp:LinkButton ID="lnkbtnLogin" runat="server" Text="Click to Login" OnClick="lnkbtnLogin_Click"></asp:LinkButton>
        </div>
    </form>
</body>
</html>
