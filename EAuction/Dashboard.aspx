<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="eAuction.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function Dashboard(id) {
            document.getElementById('ContentPlaceHolder1_hdfDashboardName').value = id;
            document.getElementById('ContentPlaceHolder1_btnShowDashboardList').click();
            return true;
        }
        function DataList_Width() {
            document.getElementById('ContentPlaceHolder1_dlDashBoard').width = '100%';
        }
    </script>
    <div class="row">
        <div class="col-ak100">
            <div class="card">
                <div class="card-block">
                    <div class="row">
                        <li id="liMenuHeaderIcon" runat="server"></li>
                        <span id="spanHeader" runat="server" class="sub-title">Dasboard</span>
                        <hr />
                    </div>
                    <asp:Button ID="btnShowDashboardList" runat="server" OnClick="btnShowDashboardList_Click" Style="display: none" UseSubmitBehavior="false" />

                    <asp:HiddenField ID="hdfDashboardName" runat="server" Value="" />

                    <div class="dashborad">
                        <section class="statistics">
                            <div class="container-fluid">
                                <asp:DataList ID="dlDashBoard" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-ak100">
                                                <div class="box" runat="server" id="divTodayAuction">
                                                    <asp:HiddenField ID="hdfDashboardId" runat="server" Value='<%# Eval("Dashboard_Id") %>' Visible="false" />
                                                    <i class='<%# Eval("Dashboard_Icon_CSS") %>'></i>
                                                    <div class="info">
                                                        <span runat="server" id="spanTodayAuction"><%# Eval("Dashboard_Name") %></span><br />
                                                        <h3 runat="server" id="hTodayAuction"><%# Eval("No_Of_Auction") %></h3>

                                                        <%-- <p>Lorem ipsum dolor sit amet</p>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
