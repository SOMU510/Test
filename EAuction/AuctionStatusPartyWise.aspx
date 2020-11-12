<%@ Page Title="" Language="C#" MasterPageFile="~/EAuction/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AuctionStatusPartyWise.aspx.cs" Inherits="eAuction.AuctionStatusPartyWise" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .FooterFont {
            font-weight: bold;
        }

        .itemList {
        }

        .textellipsis {
            white-space: nowrap;
            width: 50px;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>

    <script type="text/javascript">
        var control_focus_id = null;

        Sys.Application.add_load(
         function () {
             ApplyGridFilter('<%=grdData.ClientID%>', '330');
             ApplyGridFilter('<%=grdAuctionItemList.ClientID%>', '330');
             if (control_focus_id != null && control_focus_id != '' && control_focus_id != undefined) {
                 document.getElementById(control_focus_id).focus();
                 if (document.getElementById(control_focus_id).value != null && document.getElementById(control_focus_id).value != '') {
                     document.getElementById(control_focus_id).selectionStart = document.getElementById(control_focus_id).value.length
                 }
             }
             control_focus_id = null;
         }
        );

        setInterval(function myfunction() {
            console.log('Ram');
            if (document.getElementById('ContentPlaceHolder1_hdfIsAutoUpdate').value == "1") {
                document.getElementById('ContentPlaceHolder1_hdfLastFocusControl').value = document.activeElement.id;
                document.getElementById('ContentPlaceHolder1_btnAutoUpdate').click();
            }
        }, 1000 * 15);

        setInterval(function myfunction() {
            Display_CurrentTime();
        }, 1000);

        setInterval(function myfunction() {
            Auction_Closing_Time();
            _CurrentDate.setSeconds(parseInt(_CurrentDate.getSeconds()) + 1);
        }, 1000);

        function Current_Timer(controlid, currentdate, closedate) {
            try {

                if (controlid != null && controlid != '' && controlid != undefined) {
                    control_focus_id = controlid;
                }

                if (currentdate != null && currentdate != '') {
                    var arrDateTime = currentdate.split(" ");

                    _CurrentDate.setFullYear(arrDateTime[0].split("/")[2], arrDateTime[0].split("/")[1] - 1, arrDateTime[0].split("/")[0]);
                    _CurrentDate.setHours(arrDateTime[1].split(":")[0]);
                    _CurrentDate.setMinutes(arrDateTime[1].split(":")[1]);
                    _CurrentDate.setSeconds(arrDateTime[1].split(":")[2]);
                }

                if (closedate != null && closedate != '') {
                    var arrDateTime = closedate.split(" ");
                    _CloseDate.setFullYear(arrDateTime[0].split("/")[2], arrDateTime[0].split("/")[1] - 1, arrDateTime[0].split("/")[0]);
                    _CloseDate.setHours(arrDateTime[1].split(":")[0]);
                    _CloseDate.setMinutes(arrDateTime[1].split(":")[1]);
                    _CloseDate.setSeconds(arrDateTime[1].split(":")[2]);
                }

            }
            catch (err) {

            }
        }

        function Control_Focus(controlid) {
            setTimeout(function () {

            }, 1000)
        }

        var _CurrentDate = new Date;
        var _CloseDate = new Date;

        function Auction_Closing_Time() {
            if (document.getElementById('ContentPlaceHolder1_hdfIsAutoUpdate').value == "1") {
                var one_day = 1000 * 60 * 60 * 24;

                // Convert both dates to milliseconds
                var date1_ms = _CurrentDate.getTime();
                var date2_ms = _CloseDate.getTime();

                // Calculate the difference in milliseconds
                var difference_ms = date2_ms - date1_ms;
                //take out milliseconds
                difference_ms = difference_ms / 1000;
                var seconds = Math.floor(difference_ms % 60);
                difference_ms = difference_ms / 60;
                var minutes = Math.floor(difference_ms % 60);
                difference_ms = difference_ms / 60;
                var hours = Math.floor(difference_ms % 24);
                var days = Math.floor(difference_ms / 24);

                var resultshow = ''
                if (days > 0) {
                    resultshow = resultshow + days + ' Days,';
                }

                if (document.getElementById('ContentPlaceHolder1_lblAvailableInVal') != null && _CloseDate > _CurrentDate) {
                    document.getElementById('ContentPlaceHolder1_lblAvailableInVal').innerHTML = resultshow + hours + ' Hrs, ' + minutes + ' Min,' + seconds + ' Sec';;
                }
                else {
                    document.getElementById('ContentPlaceHolder1_lblAvailableInVal').innerHTML = '';
                }
            }
        }

        function Display_CurrentTime() {
            //if (document.getElementById('ContentPlaceHolder1_grdAuctionItemList_filter') != null && document.getElementById('ContentPlaceHolder1_grdAuctionItemList_filter') != undefined) {
            //    document.getElementById('ContentPlaceHolder1_grdAuctionItemList_filter').style.display = "none";
            //}

            var x = new Date()
            var x = new Date();

            var month = x.getMonth() + 1;
            var day = x.getDate();
            var year = x.getFullYear();

            if (month < 10) { month = '0' + month; }
            if (day < 10) { day = '0' + day; }

            var x3 = day + '/' + month + '/' + year;

            // time part //
            var hour = x.getHours();
            var minute = x.getMinutes();
            var second = x.getSeconds();

            var ampm = hour >= 12 ? 'PM' : 'AM';
            hour = hour % 12;
            hour = hour != 0 ? hour : 12; // the hour '0' should be '12'

            if (hour < 10) { hour = '0' + hour; }
            if (minute < 10) { minute = '0' + minute; }
            if (second < 10) { second = '0' + second; }

            var x3 = x3 + ' ' + hour + ':' + minute + ':' + second + ' ' + ampm;

            if (document.getElementById('ContentPlaceHolder1_lblLiveTime') != null) {
                document.getElementById('ContentPlaceHolder1_lblLiveTime').innerHTML = x3;
            }

            // Current_Timer();
        }

        function CalculateTotal(txtUnitRate) {
            //var unitControlId = txtUnitRate.id;
            //var taxPercentageControlId = unitControlId.replace("txtUnitRate", "lblTaxPercentage");
            //var QuantityControlId = unitControlId.replace("txtUnitRate", "lblQuantity");

            //var taxAmountControlId = unitControlId.replace("txtUnitRate", "txtTaxAmount");
            //var totalAmountId = unitControlId.replace("txtUnitRate", "txtTotalAmount");
            //var finalAmountId = unitControlId.replace("txtUnitRate", "txtFinalAmount");

            //document.getElementById(taxAmountControlId).value = '';
            //document.getElementById(totalAmountId).value = '';
            //document.getElementById(finalAmountId).value = '';

            //if (document.getElementById(unitControlId).value != '') {
            //    document.getElementById(totalAmountId).value = (parseFloat(document.getElementById(unitControlId).value) * parseFloat(document.getElementById(QuantityControlId).innerText)).toFixed(2);
            //    document.getElementById(taxAmountControlId).value = ((parseFloat(document.getElementById(totalAmountId).value) * parseFloat(document.getElementById(taxPercentageControlId).innerText)) / 100).toFixed(2);
            //    document.getElementById(finalAmountId).value = (parseFloat(document.getElementById(totalAmountId).value) + parseFloat(document.getElementById(taxAmountControlId).value)).toFixed(2);
            //}
        }

        var xPos, yPos;
        $(document).ready(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandler);
            prm.add_endRequest(EndRequestHandler);
            function BeginRequestHandler(sender, args) {
                //console.log('Ram 1');
                //if (document.getElementsByClassName('row GridScroll itemList')[0] != null) {
                //    console.log('Ram 2');
                //    xPos = document.getElementsByClassName('row GridScroll itemList')[0].scrollLeft;
                //    yPos = document.getElementsByClassName('row GridScroll itemList')[0].scrollTop;
                //    console.log('Ram 3');
                //}
                //if ($('.itemList').find('.dataTables_scrollBody') != null) {
                //    console.log('Ram 2');
                //    xPos = $('.itemList').find('.dataTables_scrollBody').scrollLeft();
                //    yPos = $('.itemList').find('.dataTables_scrollBody').scrollTop();
                //    console.log(xPos);
                //    console.log(yPos);
                //    console.log('Ram 3');
                //}
            }
            function EndRequestHandler(sender, args) {
                //console.log('Ram 4');
                //if ($('.itemList').find('.dataTables_scrollBody') != null) {
                //    console.log('Ram 5');
                //    $('.itemList').find('.dataTables_scrollBody').scrollLeft(xPos);
                //    $('.itemList').find('.dataTables_scrollBody').scrollTop(yPos);
                //    console.log('Ram 6');
                //}
                //if (document.getElementsByClassName('row GridScroll itemList')[0] != null) {
                //    console.log('Ram 5');
                //    document.getElementsByClassName('row GridScroll itemList')[0].scrollLeft = xPos;
                //    document.getElementsByClassName('row GridScroll itemList')[0].scrollTop = yPos;
                //    console.log('Ram 6');
                //}
            }
        });

        //function BeginRequestHandler(sender, args) {
        //    xPos = $get('divGrid').scrollLeft;
        //    yPos = $get('divGrid').scrollTop;
        //}
        //function EndRequestHandler(sender, args) {
        //    $get('divGrid').scrollLeft = xPos;
        //    $get('divGrid').scrollTop = yPos;
        //}


    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-ak100">
                    <div class="card">
                        <div class="card-block">
                            <div class="row">
                                <div class="col-ak75">
                                    <li id="liMenuHeaderIcon" runat="server"></li>
                                    <span id="spanHeader" runat="server" class="sub-title">Auction Status</span>
                                </div>
                                <div class="col-ak15" id="divstatus" runat="server">
                                    <asp:Label ID="lblStatus" runat="server" CssClass="status btn-block text-center"></asp:Label>
                                </div>
                                <div class="col-ak10" id="divActionClear" runat="server">
                                    <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-primary btn-block" Text="Back" OnClick="btnBack_Click" />
                                </div>
                            </div>
                            <div class="col-ak100">
                                <hr />
                            </div>
                            <asp:HiddenField ID="hdfAuctionId" runat="server" Value="0" Visible="false" />
                            <asp:HiddenField ID="hdfAuctionTypeEnum_Id" runat="server" Value="0" Visible="false" />
                            <asp:HiddenField ID="hdfAuctionPartyId" runat="server" Value="0" Visible="false" />
                            <asp:HiddenField ID="hdfIsAutoUpdate" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfIs_ShowBidHistoryPopUp" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfIs_ShowBidEntryPopUp" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfIs_ShowItemPopup" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfLastFocusControl" runat="server" Value="" />
                            <asp:HiddenField ID="hdfIsAcceptAuction" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfOpenTime" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfCloseTime" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfMin" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfHour" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfClosedTimeWithAddedMin" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfUpdateCloseTime" runat="server" Value="0" />

                            <asp:Button ID="btnAutoUpdate" runat="server" OnClick="btnAutoUpdate_Click" Style="display: none" UseSubmitBehavior="false" />
                            <div id="divAuctionList" runat="server">
                                <div class="row">
                                    <div class="col-ak5">
                                        <label class="col-form-label">Type<span class="text-red"> *</span></label>
                                    </div>
                                    <div class="col-ak25">
                                        <asp:DropDownList ID="ddlDashBoardAuction" runat="server" CssClass="form-control" AutoComplete="off" AutoPostBack="true" OnSelectedIndexChanged="ddlDashBoardAuction_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row GridScroll">
                                    <div class="col-ak100">
                                        <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnRowCommand="grdData_RowCommand" OnPreRender="grdData_PreRender" OnRowDataBound="grdData_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="SNo.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                        <asp:HiddenField Visible="false" ID="hdfAuctionId" runat="server" Value='<%# Eval("Auction_Id") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfRemark" runat="server" Value='<%# Eval("Remarks") %>' />
                                                        <asp:HiddenField Visible="false" ID="hdfExtendAuctionInMinutes" runat="server" Value='<%# Eval("Extend_Auction_In_Minutes") %>' />
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

                                                <asp:TemplateField HeaderText="Open/Close Duration">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpenCloseDuration" Text='<%# WillOpenIn(Convert.ToDateTime(Eval("Open_Date_Time")),Convert.ToDateTime(Eval("Close_Date_Time")),true,(_objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == 14 || _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == 15) ? Convert.ToInt64(Eval("Status_Id_For_Party")) : Convert.ToInt64(Eval("Action_Status_Id"))) %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Open/Close Duration(Extend)">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpenCloseDurationWithExtendTime" Text='<%# WillOpenIn(Convert.ToDateTime(Eval("Open_Date_Time")),Convert.ToDateTime(Eval("CloseTimeWithExtend")),true,(_objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == 14 || _objManageUserSession.GetCurrentUser_Role_Type_Enum_Id == 15) ? Convert.ToInt64(Eval("Status_Id_For_Party")) : Convert.ToInt64(Eval("Action_Status_Id"))) %>' runat="server"></asp:Label>
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

                                <div class="row form-group">
                                    <div class="col-ak70">
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
                                                <asp:Label ID="lblAvailableInDisp" class="col-form-label" runat="server" Text="Available In"> </asp:Label>
                                            </div>
                                            <div class="col-ak85">
                                                <asp:Label ID="lblAvailableInVal" runat="server" CssClass="text-red"></asp:Label>
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

                                    </div>
                                    <div class="col-ak8">
                                        <img src="../Images/clock.gif" class="clock" />
                                        <asp:LinkButton ID="btnAccept" runat="server" CssClass="animated-button1" Text="Accept" ValidationGroup="Accept" OnClick="btnAccept_Click">
                                        </asp:LinkButton>
                                        <asp:TextBox ID="lblAccept" runat="server" CssClass="animated-button1" AutoComplete="off" Width="102" Text="Not Accepted" Visible="false" Enabled="false">
                                        </asp:TextBox>
                                    </div>

                                    <div class="col-ak22 margin-top-13">
                                        <div class="row form-group">
                                            <div class="col-ak100">
                                                <h3>Live Time <i class="glyphicon glyphicon-hand-down"></i></h3>
                                                <asp:Label ID="lblLiveTime" runat="server" CssClass="livetime"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row margin-top-15">
                                            <div class="col-ak50">
                                                <asp:LinkButton ID="btnRefresh" runat="server" CssClass="btn btn-info btn-block" Text="Refresh" OnClick="btnRefresh_Click">
                                       <i class="glyphicon glyphicon-refresh"></i>
                                         <span>Refresh</span>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="col-ak50">
                                                <asp:LinkButton ID="btnAllBidHistory" runat="server" CssClass="btn btn-warning btn-block" OnClick="btnAllBidHistory_Click">
                                         <i class="glyphicon glyphicon-menu-hamburger"></i>
                                         <span>Bid History</span>
                                                </asp:LinkButton>
                                            </div>

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

                                    <div class="row GridScroll itemList">
                                        <div class="col-ak100">
                                            <asp:GridView ID="grdAuctionItemList" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" ShowFooter="true"
                                                OnPreRender="grdAuctionItemList_PreRender" OnRowCommand="grdAuctionItemList_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SNo.">
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
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
                                                            <asp:HiddenField Visible="false" ID="hdfBestBid" runat="server" Value='<%#Eval("Best_Bid") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfStartPrice" runat="server" Value='<%#Eval("Start_Price") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfMinimunChange" runat="server" Value='<%#Eval("Minimum_Bid_Change") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfCushion" runat="server" Value='<%#Eval("Bid_Cushion_Limit") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfMyUnitRate" runat="server" Value='<%#Eval("My_Unit_Rate") %>' />
                                                            <asp:HiddenField Visible="false" ID="hdfBestBidAuctionPartyLinkId" runat="server" Value='<%#Eval("Best_Bid_Auction_Party_Link_Id") %>' />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblFooterTotalDisp" runat="server" Text="Total" CssClass="FooterFont"></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="header-center grid-column-no-sort" HeaderText="View">
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkBtnView" CommandArgument='<%# Container.DataItemIndex %>' CommandName="View" ToolTip="View Item Details" CssClass="glyphicon glyphicon-eye-open" runat="server"></asp:LinkButton>
                                                            &nbsp;&nbsp;
                                                        <asp:LinkButton ID="lnkBtnBidHistory" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Bid History" ToolTip="Item Bid History" CssClass="glyphicon glyphicon-menu-hamburger" runat="server"></asp:LinkButton>
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
                                                            <asp:Label ID="lblBestBid" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Best_Bid"))) %>' Style="color: crimson; font-weight: bold;"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Best Bid Total">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBestBidTotal" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Best_Bid_Total"))) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblFooterBestBidTotal" runat="server" CssClass="FooterFont"></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Rank">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRank" runat="server" Text='<%# Eval("Item_Bid_Rank") %>' Width="20px" Style="color: lightseagreen; font-weight: bold;"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Unit Rate">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtUnitRate" runat="server" CssClass="form-control" onkeydown="return AllowDecimalOnly(this,event,2);" onkeyup="return CalculateTotal(this);" Width="80px" autocomplete="off"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Total Amt" Visible="false">
                                                        <HeaderStyle Width="50px" Wrap="true" />
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-control" onkeydown="return AllowDecimalOnly(this,event,2);" Enabled="false" Width="80px"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tax Amt" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtTaxAmount" runat="server" CssClass="form-control" onkeydown="return AllowDecimalOnly(this,event,2);" Enabled="false" Width="80px"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Final Amt" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtFinalAmount" runat="server" CssClass="form-control" onkeydown="return AllowDecimalOnly(this,event,2);" Enabled="false" Width="80px"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Bid">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnBid" runat="server" CssClass="btn btn-primary btn-block" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Bid" Text="Bid" ToolTip="Click to Bid" OnClick="btnBid_Click" Width="40px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Lead">
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnTakeLead" runat="server" CssClass="glyphicon glyphicon-arrow-up" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Take Lead" ToolTip="Take Lead" OnClick="btnTakeLead_Click" Width="40px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="My Bid">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMyUnitRate" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("My_Unit_Rate"))) %>' Width="80px" Style="color: green; font-weight: bold;"></asp:Label>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="My Total">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMyTotalValue" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("My_Total_Value"))) %>' Width="80px"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblFooterMyTotalValue" runat="server" CssClass="FooterFont"></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="My Tax">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMyTaxValue" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("My_Tax_Value"))) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblFooterMyTaxValue" runat="server" CssClass="FooterFont"></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="My Final Total">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMyFinalTotalValue" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("My_Final_Total"))) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblFooterMyFinalTotalValue" runat="server" CssClass="FooterFont"></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Start Price">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStartPrice" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Start_Price"))) %>' Width="80px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Min Bid Change">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMinimumBidChange" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Minimum_Bid_Change"))) %>' Width="80px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cushion Bid Limit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBidCushionLimit" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Bid_Cushion_Limit"))) %>' Width="80px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tax Percentage">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTaxPercentage" runat="server" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Applicable_Tax_In_Percentage"))) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>



                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <asp:Button ID="btnBid" runat="server" Style="display: none" UseSubmitBehavior="false" />
                <asp:ModalPopupExtender ID="mpeForBidHistory" runat="server" BackgroundCssClass="modalPopBackground"
                    TargetControlID="btnBid" PopupControlID="pnlForBidHistory">
                </asp:ModalPopupExtender>
                <asp:Panel ID="pnlForBidHistory" runat="server" Style="display: none" CssClass="modalPopUpPanelWithoutText">
                    <div class="modalPopUpHeader">
                        <%--Uploaded Documents--%>
                        <asp:LinkButton ID="btnBidHistoryClose" CssClass="glyphicon glyphicon-remove pull-right" Style="padding-top: 1.5%; padding-right: 1%; color: white;" runat="server" UseSubmitBehavior="false" OnClick="btnBidHistoryClose_Click" />
                        <asp:Label ID="lblGDocumentName" runat="server">Bid History</asp:Label>
                    </div>
                    <div class="modalPopUpBody">
                        <div class="row GridScroll">
                            <div class="col-ak100">
                                <asp:GridView ID="grdBidHistory" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnRowCommand="grdBidHistory_RowCommand" OnPreRender="grdBidHistory_PreRender">
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNo.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                <asp:HiddenField Visible="false" ID="hdfAuction_Party_Item_Bid_Id" runat="server" Value='<%# Eval("Auction_Party_Item_Bid_Id") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItemName" Text='<%#Eval("Item_Name") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuantity" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Quantity"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bid">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAuctionBid" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Bid"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTotal" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Total"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tax Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTaxAmount" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Tax_Amount"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Final Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFinalAmount" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Final_Amount"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bid Date Time">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOpenDateTime" Text='<%# _objUtility.Convert_Date_Into_ddMMMyyyyhhmmsstt(Convert.ToDateTime(Eval("CreatedOn_Date"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div align="right" class="modalPopFooter">
                    </div>
                </asp:Panel>

                <asp:Button ID="btnBidEntry" runat="server" Style="display: none" UseSubmitBehavior="false" />
                <asp:ModalPopupExtender ID="mpeForBidEntry" runat="server" BackgroundCssClass="modalPopBackground"
                    TargetControlID="btnBidEntry" PopupControlID="pnlForAuctionBid">
                </asp:ModalPopupExtender>
                <asp:Panel ID="pnlForAuctionBid" runat="server" Style="display: none; height: 175px" CssClass="modalPopUpPanelWithoutText">
                    <div class="modalPopUpHeader">
                        <%--Uploaded Documents--%>
                        <asp:LinkButton ID="btnBidEntryClose" CssClass="glyphicon glyphicon-remove pull-right" Style="padding-top: 1.5%; padding-right: 1%; color: white;" runat="server" OnClick="btnCloseAuctionBid_Click" />
                        <asp:Label ID="lblGAuctionBidName" runat="server">Auction Bid</asp:Label>
                    </div>
                    <%-- <div class="modalPopUpBody">--%>
                    <div>
                        <div class="row">
                            <div class="col-ak100">
                                <asp:GridView ID="grdBidEntry" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-bordered table-striped" EmptyDataText="No Records Found" OnRowCommand="grdBidEntry_RowCommand" OnPreRender="grdBidEntry_PreRender">
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNo.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSrno" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                <asp:HiddenField Visible="false" ID="hdfItemGrid_RowId" runat="server" Value='<%# Eval("ItemGrid_RowId") %>' />
                                                <asp:HiddenField Visible="false" ID="hdfCallFrom" runat="server" Value='<%# Eval("CallFrom") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItemName" Text='<%#Eval("Item_Name") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuantity" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Quantity"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bid">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBid" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Bid"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTotal" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Total"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tax Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTaxAmount" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Tax_Amount"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Final Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFinalAmount" Text='<%# NumberFormat(Convert.ToDecimal(Eval("Final_Amount"))) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-ak75" runat="server" id="divTakeLead" style="visibility: hidden">
                                <label class="col-form-label"><span class="text-red">* Bid value may be differ when Update Bid</span></label>
                            </div>
                            <div class="col-ak10">
                                <asp:LinkButton ID="btnConfirm" runat="server" CssClass="btn btn-primary btn-block" Text="Confirm" OnClick="btnConfirm_Click" />
                            </div>
                            <div class="col-ak10">
                                <asp:LinkButton ID="btnCloseAuctionBid" runat="server" CssClass="btn btn-danger btn-block" Text="Close" OnClick="btnCloseAuctionBid_Click" />
                            </div>
                        </div>
                    </div>
                    <div align="right" class="modalPopFooter">
                    </div>
                </asp:Panel>

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
                                <%-- <div class="col-ak25 displayMiddle" id="divAttachment2" runat="server">
                                <asp:Image ID="imgAttachment2" src="../Images/camera.jpg" runat="server" />
                            </div>
                            <div class="col-ak25 displayMiddle" id="divAttachment3" runat="server">
                                <asp:Image ID="imgAttachment3" src="../Images/camera.jpg" runat="server" />
                            </div>--%>
                            </div>


                            <div class="row form-group">
                                <div class="col-ak20 displayMiddle">
                                    <%--  <label id="lblAttachment" runat="server" class="col-form-label">Attachment 1<span class="text-red"> </span></label>
                                <asp:Image ID="PreviewImageAttachment" src="../Images/camera.jpg" title="Upload " onclick="triggerAttachmentFileUpload()" runat="server" />
                                <asp:FileUpload ID="fuAttachmentUploadImage" runat="server" onchange="UploadAttachmentFile(this)" Style="visibility: hidden; display: none" accept="image/*;capture=camera"></asp:FileUpload>
                                <asp:Button runat="server" ID="btnAttachmentImage" Style="display: none" UseSubmitBehavior="false" Text="upload temp" CssClass="Control_Display_None" OnClick="btnAttachmentImage_Click" />
                                <div runat="server" id="divAttachment" visible="false" class="displayMiddle">
                                    <asp:HiddenField ID="hdfAttachmentImagePath" runat="server" Visible="false" />
                                    <asp:ImageButton ID="ImgbtnAttachmentPreview" runat="server" CssClass="imgshow" Visible="false" Height="45" Width="45" />

                                    <asp:LinkButton ID="lnkbtnAttachmentRemoveImage" runat="server" ToolTip="Remove " CssClass="btn btn-danger margin-top-66" OnClick="lnkbtnAttachmentRemoveImage_Click">
                                                             <i class="glyphicon glyphicon-remove"></i>
                                                               <span></span>
                                    </asp:LinkButton>--%>
                                </div>
                            </div>
                        </div>


                    </div>
            </div>
            <div align="right" class="modalPopFooter">
            </div>
            </asp:Panel>


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="lnkBtnDownloadAttachment" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ModalUpdateProgress ID="ModalUpdateProgress1" runat="server" DisplayAfter="0"
        BackgroundCssClass="modalBackground">
        <ProgressTemplate>
            <div>
                <%--<img src="../dist/img/lg.palette-rotating-ring-loader.gif" align="middle" />--%>
            </div>
        </ProgressTemplate>
    </asp:ModalUpdateProgress>
</asp:Content>
