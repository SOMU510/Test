function Search_Gridview(strKey, GridId) {
    var strData = strKey.value.toLowerCase().split(" ");
    var tblData = document.getElementById(GridId);
    var rowData;
    var IsGridEmpty = true;
    for (var i = 0; i < tblData.rows.length; i++) {
        rowData = tblData.rows[i].innerHTML;
        var styleDisplay = 'none';
        for (var j = 0; j < strData.length; j++) {
            if (rowData.toLowerCase().indexOf(strData[j]) >= 0) {
                styleDisplay = '';
                IsGridEmpty = false;
            }
            else {
                styleDisplay = 'none';
                break;
            }
        }
        if (tblData.rows[i].getElementsByTagName("TH").length == 0) {
            tblData.rows[i].style.display = styleDisplay;
        }
        if (rowData.indexOf('No Records Found') >= 0) {
            tblData.getElementsByTagName("tbody")[0].removeChild(tblData.rows[i]);
        }
    }
    if (IsGridEmpty == true) {
        var row = document.createElement("tr");
        var td = document.createElement("td");
        td.innerText = 'No Records Found';
        row.appendChild(td)
        tblData.getElementsByTagName("tbody")[0].appendChild(row);
    }
}

function CreateGridScroll(GridId, ScrollHeight) {
    var grid = document.getElementById(GridId);
    if (grid.rows.length > 0) {
        var gridWidth = grid.offsetWidth - 17;
        var gridHeight = grid.offsetHeight;
        var headerCellWidths = new Array();
        for (var i = 0; i < grid.getElementsByTagName("TH").length; i++) {
            headerCellWidths[i] = grid.getElementsByTagName("TH")[i].offsetWidth;
        }
        grid.parentNode.appendChild(document.createElement("div"));
        var parentDiv = grid.parentNode;

        var table = document.createElement("table");
        for (i = 0; i < grid.attributes.length; i++) {
            if (grid.attributes[i].specified && grid.attributes[i].name != "id") {
                table.setAttribute(grid.attributes[i].name, grid.attributes[i].value);
            }
        }
        table.style.cssText = grid.style.cssText;
        table.style.width = gridWidth + "px";
        table.appendChild(document.createElement("tbody"));
        table.getElementsByTagName("tbody")[0].appendChild(grid.getElementsByTagName("TR")[0]);
        var cells = table.getElementsByTagName("TH");

        var gridRow = grid.getElementsByTagName("TR")[0];
        for (var i = 0; i < cells.length; i++) {
            var width = headerCellWidths[i];
            cells[i].style.width = parseInt(width) + "px";
            if (gridRow.getElementsByTagName("TD")[i] != undefined) {
                gridRow.getElementsByTagName("TD")[i].style.width = parseInt(width) + "px";
            }
        }
        parentDiv.removeChild(grid);
        parentDiv.appendChild(table);
        var scrollableDiv = document.createElement("div");
        if (parseInt(gridHeight) > parseInt(ScrollHeight) + 38) {
            gridWidth = parseInt(gridWidth) + 17;

        }

        scrollableDiv.style.cssText = "overflow:auto;height:" + ScrollHeight + "px;width:" + gridWidth + "px";
        scrollableDiv.appendChild(grid);
        parentDiv.appendChild(scrollableDiv);
    }
}

var specialKeys = new Array();
specialKeys.push(8); //Backspace
specialKeys.push(37); //Left Key
specialKeys.push(39); //Right Key
specialKeys.push(46); //Delete Key
specialKeys.push(9); //Tab Key
specialKeys.push(36); //Home Key
specialKeys.push(35); //End Key

function AllowNoKey(event) {
    var keyCode = event.which ? event.which : event.keyCode
    return (specialKeys.indexOf(keyCode) != -1);
}

function AllowNumericOnly(event) {
    var keyCode = event.which ? event.which : event.keyCode
    if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67 || keyCode == 86)) {
        return true;
    }
    if (event.shiftKey) {
        return false;
    }
    return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || specialKeys.indexOf(keyCode) != -1);
}

function AllowPercentageOnly(event) {
    var keyCode = event.which ? event.which : event.keyCode;
    var target = event.target || event.srcElement;
    if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67 || keyCode == 86)) {
        return true;
    }
    if (event.shiftKey) {
        return false;
    }
    return (
        (target.value.length == 2 && parseInt(target.value) == 10 && (keyCode == 48 || keyCode == 96))
        || ((target.value.length < 2) && (target.value.indexOf('.') < 0) && ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105)))
        || ((target.value.indexOf('.') >= 0) && (target.value.substring(target.value.indexOf('.')).length < 3) && ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105)))
        || ((keyCode == 190 || keyCode == 110) && (target.value.length <= 2) && (target.value.indexOf('.') < 0))
        || (specialKeys.indexOf(keyCode) != -1)
    );
}

function AllowNumericWithDotOnly(event) {
    var keyCode = event.which ? event.which : event.keyCode
    var target = event.target || event.srcElement;
    if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67 || keyCode == 86)) {
        return true;
    }
    if (event.shiftKey) {
        return false;
    }
    return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || specialKeys.indexOf(keyCode) != -1 || ((keyCode == 190 || keyCode == 110) && (target.value.indexOf('.') < 0)));
}

function AllowAlphabetOnly(event) {
    var keyCode = event.which ? event.which : event.keyCode
    if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67 || keyCode == 86)) {
        return true;
    }
    return (!((keyCode < 65 || keyCode > 90)) || specialKeys.indexOf(keyCode) != -1)
}

function AllowAlphabetWithSpace(event) {
    var keyCode = event.which ? event.which : event.keyCode
    if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67 || keyCode == 86)) {
        return true;
    }
    return (!((keyCode < 65 || keyCode > 90)) || keyCode == 32 || specialKeys.indexOf(keyCode) != -1)
}

function AllowAlphanumericWithSpace(event) {
    var keyCode = event.which ? event.which : event.keyCode
    if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67 || keyCode == 86)) {
        return true;
    }
    if (event.shiftKey && (keyCode >= 48 && keyCode <= 57)) {
        return false;
    }
    return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || keyCode == 32 || !(keyCode < 65 || keyCode > 90) || specialKeys.indexOf(keyCode) != -1)
}

function AllowAlphanumericWithUnderscore(event) {
    var keyCode = event.which ? event.which : event.keyCode
    if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67 || keyCode == 86)) {
        return true;
    }
    if (event.shiftKey && (keyCode >= 48 && keyCode <= 57)) {
        return false;
    }
    return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || keyCode == 189 || !(keyCode < 65 || keyCode > 90) || specialKeys.indexOf(keyCode) != -1)
}

function AllowAlphanumeric(event) {
    var keyCode = event.which ? event.which : event.keyCode
    if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67 || keyCode == 86)) {
        return true;
    }
    if (event.shiftKey && (keyCode >= 48 && keyCode <= 57)) {
        return false;
    }
    return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || !(keyCode < 65 || keyCode > 90) || specialKeys.indexOf(keyCode) != -1)
}

function ApplyGridFilter(gridClientId, scrollYpixel) {
    var grid = document.getElementById(gridClientId);
    if (grid != null) {
        if ((grid.rows.length > 1) && (grid.rows[0].cells.length == grid.rows[1].cells.length)) {
            var oTable = $('#' + gridClientId).dataTable({
                "sDom": "Rlfrtip",
                "bAutoWidth": false,
                "bFilter": true,
                "bPagination": false,
                "bPaginate": false,
                "bInfo": false,
                "scrollY": scrollYpixel + "px",
                "scrollX": true,
                "scrollCollapse": true
                //"overflow": -webkit - paged - y
            });
        }
    }
}

function ApplyGridFilterWithoutSearch(gridClientId, scrollYpixel) {
    var grid = document.getElementById(gridClientId);
    if (grid != null) {
        if ((grid.rows.length > 1) && (grid.rows[0].cells.length == grid.rows[1].cells.length)) {
            var oTable = $('#' + gridClientId).dataTable({
                "sDom": "Rlfrtip",
                "bAutoWidth": false,
                "bFilter": false,
                "bPagination": false,
                "bPaginate": false,
                "bInfo": false,
                "scrollY": scrollYpixel + "px",
                "scrollX": true,
                "scrollCollapse": true
                //"overflow": -webkit - paged - y
            });
        }
    }
}

function ApplyGridFilterWithoutSearchSorting(gridClientId, scrollYpixel) {
    var grid = document.getElementById(gridClientId);
    if (grid != null) {
        if ((grid.rows.length > 1) && (grid.rows[0].cells.length == grid.rows[1].cells.length)) {
            var oTable = $('#' + gridClientId).dataTable({
                "sDom": "Rlfrtip",
                "bAutoWidth": false,
                "bFilter": false,
                "bPagination": false,
                "bPaginate": false,
                "bInfo": false,
                "scrollY": scrollYpixel + "px",
                "scrollX": true,
                "scrollCollapse": true,
                "ordering": false,
                //"overflow": -webkit - paged - y
            });
        }
    }
}
function Validated_Percetage_Keyup(txt, e) {
    if (txt != null) {
        if (txt.value > 100) {
            txt.value = 100;
        }
    }
    return false;
}

function Validated_Decimal_Onchange(txt, e) {
    if (isNaN(parseFloat(txt.value)) || parseFloat(txt.value) == undefined || parseFloat(txt.value) == NaN || parseFloat(txt.value) == null) {
        txt.value = '';
    }
    return false;
}

function AllowDecimalOnly(e, t, allowfractiondigit) {
    var n;
    var r;

    if (allowfractiondigit == undefined || typeof (allowfractiondigit) == 'undefined' || allowfractiondigit == null || allowfractiondigit == '' || isNaN(allowfractiondigit)) {
        allowfractiondigit = 2;
    }

    var evt1 = t || window.event;
    var keyCodeval = evt1.keyCode;
    //alert(keyCodeval);
    if (keyCodeval == 8 || keyCodeval == 9 || keyCodeval == 46 || keyCodeval == 37 || keyCodeval == 39) {
        return true;
    }

    if (navigator.appName == "Microsoft Internet Explorer" || navigator.appName == "Netscape") {
        n = t.keyCode;
        r = 1;
        if (navigator.appName == "Netscape") {
            if (n == null) {
                n = t.charCode;
            }
            r = 0
        }
    } else {
        n = t.charCode;
        r = 0
    }

    if (keyCodeval == 110 || keyCodeval == 190) {
        if (e.value.indexOf('.') != -1) {
            if (r == 1) {
                t.returnValue = false;
            }
            else {
                t.preventDefault();
            }
            return false;
        }
    }


    if (!((n >= 48 && n <= 57) || (n >= 96 && n <= 105) || n == 110 || n == 190 || n == 0 || n == 46)) {
        if (r == 1) {
            t.returnValue = false;
        }
        else {
            t.preventDefault();
        }
    }
    // alert('DQ');
    if (e.value.indexOf('.') != -1) {
        // alert('EQ');
        if (n == 46) {
            //alert('FQ');
            if (r == 1) {
                t.returnValue = false;
            }
            else {
                t.preventDefault();
            }
        }
        else if (e.value.substr(e.value.indexOf('.')).length > allowfractiondigit) {
            //alert('GQ');
            if (r == 1) {
                t.returnValue = false;
            }
            else {
                t.preventDefault();
            }
        }
    }
}

function chkAll_CheckedChanged(checkBox) {
    __doPostBack(checkBox.id, checkBox.checked);
    return true;
}

function ConvertToCamelCase(event) {
    var target = event.target || event.srcElement;

    if ((target.value.length > 0)) {
        var str = target.value.split(' ');
        var storedata = [];
        for (var x = 0; x < str.length; x++) {
            storedata.push(str[x].charAt(0).toUpperCase() + str[x].slice(1));
        }
        target.value = storedata.join(' ');
        return storedata.join(' ');
    }
}

function ConvertToUpperCase(event) {
    var target = event.target || event.srcElement;
    target.value = target.value.toUpperCase();
    return target.value.toUpperCase();
}

function Action_Confirm_Bootbox(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, valiationgroupname, message, eventname, fn) {
    $(document).ready(function () {
        if (document.getElementsByClassName('bootbox modal fade bootbox-alert in').length > 0 || document.getElementsByClassName('bootbox modal fade bootbox-confirm in').length > 0) {
            return;
        }
        bootbox.confirm({
            title: "Message",//"Pernod Ricard India @ KYC",
            message: message.replace("'", ""), buttons: {
                confirm: {
                    label: '<i class="glyphicon glyphicon-ok"></i> Yes',
                    className: 'btn-primary'
                },
                cancel: {
                    label: '<i class="glyphicon glyphicon-remove"></i> No',
                    className: 'btn-danger'
                }
            }, callback: function (result) {
                if (result && fn == undefined) {
                    if (controluniqueid != null && controluniqueid != undefined && controluniqueid != '') {
                        __doPostBack(controluniqueid, '');
                    }
                }
                else if (fn != undefined && fn != null) {
                    fn(result);
                }
                else if (result == false) {
                    if (controlfocusclientid != null && controlfocusclientid != undefined && controlfocusclientid != '') {
                        setTimeout(function () {
                            document.getElementById(controlfocusclientid).focus();
                        }, 5);
                    }
                }
            }
        })
    });
}

function Action_Alert_Bootbox(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, ispostback, message, url, iconcss, fn) {
    $(document).ready(function () {
        if (document.getElementsByClassName('bootbox modal fade bootbox-alert in').length > 0 || document.getElementsByClassName('bootbox modal fade bootbox-confirm in').length > 0) {
            return;
        }
        bootbox.alert({
            title: "Message",//"Pernod Ricard India @ KYC",
            message: message.replace("'", ""),
            buttons: {
                ok: {
                    label: '<i class="glyphicon glyphicon-ok"></i> OK',
                    className: 'btn-primary'
                }
            },
            callback: function (result) {
                if (url != undefined && url != null && url != "") {
                    window.location = url;
                    return;
                }
                else if (fn != undefined && fn != null) {
                    fn(result);
                }
                else {
                    if (controlfocusclientid != null && controlfocusclientid != undefined && controlfocusclientid != '') {
                        if (ispostback == null || ispostback == '' || ispostback == undefined || ispostback == 'false') {
                            setTimeout(function () {
                                document.getElementById(controlfocusclientid).focus();
                            }, 5);
                        }
                        else if (controluniqueid != null && controluniqueid != undefined && controluniqueid != '' && ispostback == 'true') {
                            __doPostBack(controluniqueid, '');
                        }
                    }
                }
            }
        })
    });
}


function Action_Confirm_ReturnResult(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, valiationgroupname, message, eventname, fn) {
    if (typeof (Page_ClientValidate) == 'function') {
        if (Page_ClientValidate(valiationgroupname)) {
            Action_Confirm_Bootbox(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, valiationgroupname, message, eventname, fn);
        }
    }
    else {
        Action_Confirm_Bootbox(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, valiationgroupname, message, eventname, fn);
    }
    return false;
}

function Action_Confirm(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, valiationgroupname, message, eventname) {
    if (typeof (Page_ClientValidate) == 'function') {
        if (Page_ClientValidate(valiationgroupname)) {
            Action_Confirm_Bootbox(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, valiationgroupname, message, eventname);
        }
    }
    else {
        Action_Confirm_Bootbox(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, valiationgroupname, message, eventname);
    }
    return false;
}

function Action_Alert(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, ispostback, message, url, iconcss, fn) {
    Action_Alert_Bootbox(controlclientid, controluniqueid, controlfocusclientid, controlfocusuniqueid, ispostback, message, url, iconcss, fn);
    return false;
}

function SetControlFocus(controlid) {
    setTimeout(function () {
        document.getElementById(controlid).focus();
    }, 5);
}

//function Action_Validate(controlclientid, valiationgroupname, action) {
//    if (typeof (Page_ClientValidate) == 'function') {
//        if (Page_ClientValidate(valiationgroupname)) {
//            return confirm('Do you want to ' + action + '?');
//        }
//    }
//    else {
//        return confirm('Do you want to ' + action + '?');
//    }

//}

function GetPANRegex() {
    var regpan = /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
    return regpan;
}