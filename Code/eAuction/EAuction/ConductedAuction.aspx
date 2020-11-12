<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ConductedAuction.aspx.cs" Inherits="eAuction.EAuction.ConductedAuction" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(
         function () {
             ApplyGridFilter('<%=grdData.ClientID%>', '330');
         }
        );
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-ak100">
                    <div class="card">
                        <div class="card-block">
                            <div class="row">
                                <li id="liMenuHeaderIcon" runat="server"></li>
                                <span id="spanHeader" runat="server" class="sub-title">Conducted Auction</span>
                                <hr />
                            </div>
                            <div id="divAuctionList" runat="server">
                                <div class="row GridScroll">
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
                                                <asp:TemplateField HeaderText="Auction Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionName" Text='<%#Eval("Auction_Name") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Auction Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionCode" Text='<%#Eval("Auction_Code") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Auction Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuctionType" Text='<%#Eval("Auction_Type") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Open Date & Time">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpenDateTime" Text='<%# _objUtility.Convert_Date_Into_ddMMMyyyyhhmmsstt(Convert.ToDateTime(Eval("Open_Date_Time"))) %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Close Date & Time">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCloseDateTime" Text='<%# _objUtility.Convert_Date_Into_ddMMMyyyyhhmmsstt(Convert.ToDateTime(Eval("Close_Date_Time"))) %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# (_objManageUserSession.GetCurrentUser_Role_Type_Enum_Id==14 || _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id==15) ?  Eval("Status_Name_For_Party"): Eval("Status_Name") %>'></asp:Label>
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

                            <div id="divAuctionDetails" runat="server">
                                <asp:HiddenField ID="hdfAuctionId" runat="server" Value="0" Visible="false" />

                                <div class="row">
                                    <div class="col-ak15">
                                        <label class="col-form-label">Auction Name : <span class="text-red"></span></label>
                                    </div>
                                    <div class="col-ak85">
                                        <asp:Label ID="lblAuctionName" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-ak15">
                                        <label class="col-form-label">
                                            <i class="glyphicon glyphicon-time"></i>
                                            <span>Open Time : </span>
                                        </label>
                                    </div>
                                    <div class="col-ak85">
                                        <asp:Label ID="lblOpenTime" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-ak15">
                                        <label class="col-form-label">
                                            <i class="glyphicon glyphicon-time"></i>
                                            <span>Close Time : </span>
                                        </label>
                                    </div>
                                    <div class="col-ak85">
                                        <asp:Label ID="lblCloseTime" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-ak15">
                                        <label class="col-form-label" runat="server" id="lblRemarks">Remarks<span class="text-red">*</span></label>
                                    </div>
                                    <div class="col-ak85">
                                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvRemarks" Display="Dynamic" runat="server" SetFocusOnError="True" ErrorMessage="This field is mandatory" ControlToValidate="txtRemarks" ForeColor="Red" ValidationGroup="Accept"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="row form-group">
                                    <div class="col-ak8" style="display: none">
                                        <label class="col-form-label">Auction Code<span class="text-red"> </span></label>
                                    </div>

                                    <div class="col-ak40">
                                        <asp:Label ID="lblAuctionCode" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="boxshadow">
                                    <br />
                                    <div class="row form-group">

                                        <div class="col-ak20">
                                            <label class="col-form-label">Item</label>
                                            <asp:DropDownList ID="ddlItem" runat="server" CssClass="form-control" AutoComplete="off" AutoPostBack="true" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-ak20" style="display: none">
                                            <label class="col-form-label">Top Highest Bid</label>
                                            <asp:DropDownList ID="ddlTopHighest" runat="server" CssClass="form-control" AutoComplete="off">
                                                <asp:ListItem Value="3">Highest 3 Bid</asp:ListItem>
                                                <asp:ListItem Value="5">Highest 5 Bid</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="row GridScroll itemList">
                                        <div class="col-ak100">
                                            <asp:GridView ID="grdAuctionItemList" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" ShowFooter="true"
                                                OnPreRender="grdAuctionItemList_PreRender" OnRowCommand="grdAuctionItemList_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SNo.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>' Width="50px"></asp:Label>
                                                            <asp:HiddenField Visible="false" ID="hdfAuctionItemLinkId" runat="server" Value='<%#Eval("Auction_Item_Link_Id") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfAuctionId" runat="server" Value='<%#Eval("Auction_Id") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfRemark" runat="server" Value='<%# Eval("Remarks") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfStatusId" runat="server" Value='<%#Eval("Status_Id") %>' />

                                                            <asp:HiddenField Visible="false" ID="hdfItemName" runat="server" Value='<%#Eval("Item_Name") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfItemCode" runat="server" Value='<%#Eval("Item_Code") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfItemDesc" runat="server" Value='<%#Eval("Item_Desc") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfReservePrice" runat="server" Value='<%#Eval("Reserve_Price") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfAttachmentFilePath1" runat="server" Value='<%#Eval("Attachment_File_Path1") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfAttachmentFilePath2" runat="server" Value='<%#Eval("Attachment_File_Path2") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfAttachmentFilePath3" runat="server" Value='<%#Eval("Attachment_File_Path3") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfUnitName" runat="server" Value='<%#Eval("Unit_Name") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfItemCategoryName" runat="server" Value='<%#Eval("Item_Category_Name") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfItemSubCategoryName" runat="server" Value='<%#Eval("Item_Sub_Category_Name") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfCMD" runat="server" Value='<%#Eval("CMD") %>' />

                                                            <asp:HiddenField Visible="false" ID="hdfApplicableTaxInPercentage" runat="server" Value='<%#Eval("Applicable_Tax_In_Percentage") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfQuantity" runat="server" Value='<%#Eval("Quantity") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfStartPrice" runat="server" Value='<%#Eval("Start_Price") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfMinimunChange" runat="server" Value='<%#Eval("Minimum_Bid_Change") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfCushion" runat="server" Value='<%#Eval("Bid_Cushion_Limit") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="View">
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkBtnView" CommandArgument='<%# Container.DataItemIndex %>' CommandName="View" ToolTip="View Item Details" CssClass="glyphicon glyphicon-eye-open" runat="server"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemName" CssClass="textellipsis" runat="server" ToolTip='<%# Eval("Item_Name") %>' Text='<%# Eval("Item_Name") %>' Width="150px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblQuantity" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Quantity"))) %>' Width="80px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Unit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblItemUnit" runat="server" Text='<%# Eval("Unit_Name") %>' Width="30px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Best Bid">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBestBid" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Bid"))) %>' Style="color: forestgreen; font-weight: bold;"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Best Bid Total">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBestBidTotal" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Total"))) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Tax Percentage">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTaxPercentage" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Applicable_Tax_In_Percentage"))) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                      <asp:TemplateField HeaderText="Party Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPartyName" runat="server" Text='<%# (Eval("Party_Contact_Person_Name")) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                  
                                                      <asp:TemplateField HeaderText="Party Contact No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPartyContactNo" runat="server" Text='<%# (Eval("Party_Contact_Person_Mobile_No")) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Party Email Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPartyEmailId" runat="server" Text='<%# (Eval("Party_Contact_Person_Email_Id")) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Rank">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRank" runat="server" Text='<%# Eval("Row_Number") %>' Width="20px" Style="color: lightseagreen; font-weight: bold;"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>

                                </div>
                                <asp:Button ID="btnItemDetails" runat="server" Style="display: none" UseSubmitBehavior="false" />
                                <asp:ModalPopupExtender ID="mpeItemDetails" runat="server" BackgroundCssClass="modalPopBackground"
                                    TargetControlID="btnItemDetails" PopupControlID="pnlForItemDetails">
                                </asp:ModalPopupExtender>
                                <asp:Panel ID="pnlForItemDetails" runat="server" Style="display: none" CssClass="modalPopUpPanelWithoutText">
                                    <div class="modalPopUpHeader">
                                        <%--Uploaded Documents--%>
                                        <asp:LinkButton ID="btnItemDetailsClose" CssClass="glyphicon glyphicon-remove pull-right" Style="padding-top: 1.5%; padding-right: 1%; color: white;" runat="server" UseSubmitBehavior="false" OnClick="btnItemDetailsClose_Click" />
                                        <asp:Label ID="lblItemDetailHeaderName" runat="server">Item Details</asp:Label>
                                    </div>
                                    <div class="modalPopUpBody">
                                        <div id="ItemDetails" runat="server">

                                            <div class="row form-group">
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Item Category<span class="text-red"> </span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblItemCategoryVal" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Item Sub Category<span class="text-red"> </span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblItemSubCategoryVal" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Item Name<span class="text-red"> </span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblItemNameVal" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Item Code<span class="text-red"> </span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblItemCodeVal" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Quantity<span class="text-red"> </span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblQuantityVal" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Unit<span class="text-red"> </span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblUnitVal" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row form-group" runat="server" visible="false">
                                                <div class="col-ak11">
                                                    <label class="col-form-label">CMD<span class="text-red"> </span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblCMDVal" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Reserve Price<span class="text-red"> </span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblReservePriceVal" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Applicable Tax(%) <span class="text-red"></span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblApplicableTaxVal" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Starting Price <span class="text-red"></span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblStartingPriceVal" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Minimum Bid Range <span class="text-red"></span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblMinimumBidRangeVal" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Bid Cushion Range <span class="text-red"></span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak38">
                                                    <asp:Label ID="lblBidCushionRangeVal" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Item Description<span class="text-red"> </span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak88">
                                                    <asp:Label ID="lblItemDescriptionVal" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Remarks<span class="text-red"></span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak88">
                                                    <asp:Label ID="lblRemarksVal" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row form-group" runat="server" id="divAttchmentDownload">
                                                <div class="col-ak11">
                                                    <label class="col-form-label">Attachment <span class="text-red"></span></label>
                                                </div>
                                                <div class="col-ak1">
                                                    :
                                                </div>
                                                <div class="col-ak20" id="divAttachment1" runat="server">
                                                    <asp:LinkButton ID="lnkBtnDownloadAttachment" runat="server" CssClass="btn btn-primary btn-block" Text="Confirm" OnClick="lnkBtnDownloadAttachment_Click">
                                       <i class="glyphicon glyphicon-save"></i>
                                       <span>Click to Download</span>
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            <div align="right" class="modalPopFooter">
                            </div>
                            </asp:Panel>
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
