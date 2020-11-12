<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AuctionStatus.aspx.cs" Inherits="eAuction.AuctionView" %>

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
                                <li id="liMenuHeaderIcon" runat="server"></li>
                                <span id="spanHeader" runat="server" class="sub-title">Auction View</span>
                                <hr />
                            </div>
                            <div id="divAuctionStatusList" runat="server">
                                <div class="row form-group">
                                    <div class="col-ak100">
                                        <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnRowCommand="grdData_RowCommand" OnPreRender="grdData_PreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="SNo.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                        <asp:HiddenField Visible="false" ID="hdfAuctionId" runat="server" Value='<%# Eval("Auction_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfRemark" runat="server" Value='<%# Eval("Remarks") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Auction Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionType" Text='<%#Eval("Auction_Type") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Auction Category">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionCategory" Text='<%#Eval("Auction_Category") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Auction Start">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionStartDate" Text='<%#Eval("Auction_StartDate") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Auction End">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionEndDate" Text='<%#Eval("Auction_EndDate") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Source">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSource" Text='<%#Eval("Source") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Auction Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionName" Text='<%#Eval("Auction_Name") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="View">
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkBtnView" CommandArgument='<%# Container.DataItemIndex %>' CommandName="View" ToolTip="View" CssClass="glyphicon glyphicon-eye-open" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

                            <div id="divAuctionStatusView" runat="server">
                                <div class="row form-group">

                                    <div class="col-ak25">
                                        <label class="col-form-label">Auction Type : </label>
                                        <asp:Label ID="lblAuctionType" runat="server">Service</asp:Label>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Auction Category : </label>
                                        <asp:Label ID="lblAuctionCategory" runat="server">Test-1</asp:Label>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Auction Start : </label>
                                        <asp:Label ID="lblAuctionStart" runat="server">21/08/2020 11:51:47 AM</asp:Label>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Auction End : </label>
                                        <asp:Label ID="lblAuctionEnd" runat="server">22/08/2020 11:51:47 AM</asp:Label>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-ak25">
                                        <label class="col-form-label">Client Name : </label>
                                        <asp:Label ID="lblClientName" runat="server">Client-Name</asp:Label>
                                    </div>

                                    <div class="col-ak25">
                                        <label class="col-form-label">Auction Name : </label>
                                        <asp:Label ID="lblAuctionName" runat="server">Auction_Test</asp:Label>
                                    </div>

                                    <div class="col-ak25">
                                        <label class="col-form-label">Current Date : </label>
                                        <asp:Label ID="lblCurrentDate" runat="server">21/08/2020</asp:Label>
                                    </div>
                                    <div class="col-ak25">
                                        <label class="col-form-label">Charge (₹): </label>
                                        <asp:Label ID="lblCharge" runat="server">1000</asp:Label>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-ak25">
                                        <asp:LinkButton ID="lnkbtnOtherDetails" CssClass="text-red" runat="server" ToolTip="Other Details" OnClick="lnkbtnOtherDetails_Click">
                                             <i class="glyphicon glyphicon-chevron-down">
                                             </i>  
                                              <span><b>Show Product Details</b></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-ak25">
                                        <asp:LinkButton ID="lnkbtnShowVendorListForAdmin" CssClass="text-red" runat="server" ToolTip="Other Details" OnClick="lnkbtnShowVendorListForAdmin_Click">
                                             <i class="glyphicon glyphicon-chevron-down">
                                             </i>  
                                              <span><b>Show Party List(For Admin)</b></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-ak25">
                                        <asp:LinkButton ID="lnkbtnShowVendorListForClient" CssClass="text-red" runat="server" ToolTip="Other Details" OnClick="lnkbtnShowVendorListForClient_Click">
                                             <i class="glyphicon glyphicon-chevron-down">
                                             </i>  
                                              <span><b>Show Party List(For Client)</b></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>

                                <div id="divOtherDetails" runat="server">
                                    <div class="panelwhite">
                                        <div class="row form-group">
                                            <div class="col-ak25">
                                                <label class="col-form-label">Product Type : </label>
                                                <asp:Label ID="lblProductType" runat="server">Type-Test-Product</asp:Label>
                                            </div>
                                            <div class="col-ak25">
                                                <label class="col-form-label">Product Name : </label>
                                                <asp:Label ID="lblProductName" runat="server">Test 1</asp:Label>
                                            </div>
                                            <div class="col-ak25">
                                                <label class="col-form-label">Quantity : </label>
                                                <asp:Label ID="lblQTY" runat="server">6</asp:Label>
                                            </div>
                                            <div class="col-ak25">
                                                <label class="col-form-label">Unit : </label>
                                                <asp:Label ID="lblUnit" runat="server">KG</asp:Label>
                                            </div>
                                        </div>

                                        <div class="row form-group">


                                            <div class="col-ak25">
                                                <label class="col-form-label">Up To Bid Price (₹) : </label>
                                                <asp:Label ID="lblUpToPrice" runat="server" CssClass="bidtext">5000</asp:Label>
                                            </div>
                                            <div class="col-ak25">
                                                <label class="col-form-label">Applicable Tax (₹): </label>
                                                <asp:Label ID="lblApplicableTax" runat="server">200</asp:Label>
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col-ak25">
                                                <asp:LinkButton ID="lnkbtnShowLessDetails" CssClass="text-red" runat="server" ToolTip="Other Details" OnClick="lnkbtnShowLessDetails_Click">
                                             <i class="glyphicon glyphicon-chevron-up">
                                             </i>  
                                              <span><b>Hide Product Details</b></span>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <br />
                                <div id="divVendorListForAdmin" runat="server">

                                    <div class="panelblue">
                                        <div class="row form-group">
                                            <div class="col-ak100">
                                                <h4>Party List(Only For Admin)</h4>
                                                <hr />
                                            </div>
                                        </div>
                                        <div class="row GridScroll">
                                            <div class="col-ak100">
                                                <asp:GridView ID="grdVendor" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found">
                                                    <Columns>

                                                        <asp:TemplateField HeaderText="SNo.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                <asp:HiddenField Visible="false" ID="hdfVendorId" runat="server" Value='<%# Eval("Vendor_Id") %>' />
                                                                <asp:HiddenField Visible="false" ID="hdfRemark" runat="server" Value='<%# Eval("Remarks") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Vendor Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblVendorName" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Mobile No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMobileNo" Text='<%#Eval("Mobile_No") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Email Id">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEmailId" Text='<%#Eval("Email_Id") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="State">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblState" Text='<%#Eval("State_Name") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="City">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCity" Text='<%#Eval("City_Name") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Bidding Price">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBiddingPrice" Text='<%#Eval("Bidding_Price") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                    </Columns>
                                                </asp:GridView>
                                            </div>

                                        </div>
                                        <div class="row form-group">
                                            <div class="col-ak25">
                                                <asp:LinkButton ID="lnkbtnHideVendorListForAdmin" CssClass="text-red" runat="server" ToolTip="Other Details" OnClick="lnkbtnHideVendorListForAdmin_Click">
                                             <i class="glyphicon glyphicon-chevron-up">
                                             </i>  
                                              <span><b>Hide Vendor List</b></span>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="divVendorListForClient" runat="server">
                                    <br />
                                    <div class="panelblue">
                                        <div class="row form-group">
                                            <div class="col-ak100">
                                                <h4>Party List(Only For Client)</h4>
                                                <hr />
                                            </div>
                                        </div>
                                        <div class="row GridScroll">
                                            <div class="col-ak100">
                                                <asp:GridView ID="grdVendorListForClient" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="SNo.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                <asp:HiddenField Visible="false" ID="hdfVendorId" runat="server" Value='<%# Eval("Vendor_Id") %>' />
                                                                <asp:HiddenField Visible="false" ID="hdfRemark" runat="server" Value='<%# Eval("Remarks") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Default" HeaderStyle-CssClass="grid-column-no-sort">
                                                            <ItemTemplate>
                                                                <asp:RadioButton ID="rbSelectDefault" runat="server" Text=" " AutoPostBack="true" CssClass="radio-item" GroupName="Default" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Vendor Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblVendorName" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Mobile No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMobileNo" Text='<%#Eval("Mobile_No") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Email Id">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEmailId" Text='<%#Eval("Email_Id") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="State">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblState" Text='<%#Eval("State_Name") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="City">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCity" Text='<%#Eval("City_Name") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Bidding Price">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBiddingPrice" Text='<%#Eval("Bidding_Price") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                    </Columns>
                                                </asp:GridView>
                                            </div>

                                        </div>
                                        <div class="row form-group">
                                            <div class="col-ak25">
                                                <asp:LinkButton ID="lnkbtnHideVendorListForClient" CssClass="text-red" runat="server" ToolTip="Other Details" OnClick="lnkbtnHideVendorListForClient_Click">
                                             <i class="glyphicon glyphicon-chevron-up">
                                             </i>  
                                              <span><b>Hide Vendor List</b></span>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-ak25">
                                        <label class="col-form-label">Bid<span class="text-red"> </span></label>
                                        <asp:TextBox ID="txtBid" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-ak75">
                                        <label class="col-form-label">Remarks<span class="text-red"> </span></label>
                                        <asp:TextBox ID="txt_Remarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-ak10">
                                        <asp:LinkButton ID="lnkbtnBack" runat="server" CssClass="btn btn-darkgreen btn-block" Text="Back" OnClick="lnkbtnBack_Click" />
                                    </div>
                                    <div class="col-ak80">
                                    </div>
                                    <div class="col-ak10">
                                        <asp:LinkButton ID="btnParticipate" runat="server" CssClass="btn btn-success btn-block pull-left" Text="Participate" ValidationGroup="Participate" OnClick="btnParticipate_Click" />
                                    </div>

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
