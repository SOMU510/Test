<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="WelcomeScreen.aspx.cs" Inherits="eAuction.WelcomeScreen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="Div1" class="row" runat="server" visible="false">
                                <li id="liMenuHeaderIcon" runat="server"></li>
                                <span id="spanHeader" runat="server" class="sub-title">Unit Master</span>
                                <hr />
                            </div>
    <div class="row">
        <div class="col-ak100">
            <center>
    <img src="../Images/auction.jpg" class="img-responsive" />
      </center>
</div>
        </div>
</asp:Content>
