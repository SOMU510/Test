function previewImageFile(imgid, fileUploadId) {
    var preview = imgid;// document.querySelector(imgid); //'#<%=PreviewImage.ClientID %>'
    var file = fileUploadId;// document.querySelector(fileUploadId).files[0]; //'#<%=FileUpload.ClientID %>'

    // var fileInput = document.getElementById('ctl00$ContentPlaceHolder1$FileUpload');
    var filename = file.name;
    var a = filename.split(".");
    if (a.length == 2) {
        if (a[1].toLowerCase() == "jpg" || a[1].toLowerCase() == "jpeg" || a[1].toLowerCase() == "png" || a[1].toLowerCase() == "bmp") {

        } else {
            document.querySelector('#<%=FileUpload.ClientID %>').value = "";
            preview.src = "../Images/noimage.jpg";
            alert("Please Select Image only (.jpg, .jpeg, .png)");
            return;
        }
    } else {
        alert("Please Select Proper Extension File");
        return;
    }
    var reader = new FileReader();
    reader.onloadend = function () {
        preview.src = reader.result;
    }
    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
    }
}
var validFiles = ["bmp", "gif", "png", "jpg", "jpeg"];

function PreviewImage(fileUploadId) {
    var file = fileUploadId.files[0];
    var filename = file.name;

    var ext = filename.substring(filename.lastIndexOf(".") + 1, filename.length).toLowerCase();
    for (var i = 0; i < validFiles.length; i++) {
        if (validFiles[i] == ext)
            break;
    }
    if (i >= validFiles.length) {
        fileUploadId.value = '';
        alert("Only Image file is allowed.\nPlease load an image with an extention of one of the following:\n\n" + validFiles.join(", "));
        return false;
    }

}

function DownloadPDF(btnid) {
    //   Page_BlockSubmit = false;
    setTimeout(function () {
        //alert('PO Generated Successfully and Downloading PO PDF File in progress.');
        document.getElementById(btnid).click();//error coming cannot read property click of null in console
        ///   document.getElementById('divModelProgress').style.display = 'block';
    }, 5);
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
    //if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67)) {//OLD 01/09/2019 HARSH
    if (event.ctrlKey && (keyCode == 65 || keyCode == 97 || keyCode == 88 || keyCode == 120 || keyCode == 67 || keyCode == 99 || keyCode == 86 || keyCode == 118)) {//NEW 01/09/2019 HARSH
        return true;
    }
    if (event.shiftKey) {
        return false;
    }
    return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || specialKeys.indexOf(keyCode) != -1);
}

function AllowPercentageOnly(event, id) {
    var keyCode = event.which ? event.which : event.keyCode

    //if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67)) {//OLD 01/09/2019 HARSH
    if (event.ctrlKey && (keyCode == 65 || keyCode == 97 || keyCode == 88 || keyCode == 120 || keyCode == 67 || keyCode == 99 || keyCode == 86 || keyCode == 118)) {//NEW 01/09/2019 HARSH
        return true;
    }
    if (event.shiftKey) {
        return false;
    }
    return (
    (($(id).val().length < 2) && ($(id).val().indexOf('.') < 0) && ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105)))
	|| (($(id).val().indexOf('.') >= 0) && ($(id).val().substring($(id).val().indexOf('.')).length < 3) && ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105)))
    || ((keyCode == 190 || keyCode == 110) && ($(id).val().length <= 2) && ($(id).val().indexOf('.') < 0))
    || specialKeys.indexOf(keyCode) != -1);
}

function AllowNumericWithDotOnly(event) {
    var keyCode = event.which ? event.which : event.keyCode
    var target = event.target || event.srcElement;
    //if (event.ctrlKey && (keyCode == 65 || keyCode == 88 || keyCode == 67)) {//OLD 01/09/2019 HARSH
    if (event.ctrlKey && (keyCode == 65 || keyCode == 97 || keyCode == 88 || keyCode == 120 || keyCode == 67 || keyCode == 99 || keyCode == 86 || keyCode == 118)) {//NEW 01/09/2019 HARSH
        return true;
    }
    if (event.shiftKey) {
        return false;
    }
    return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || specialKeys.indexOf(keyCode) != -1 || ((keyCode == 190 || keyCode == 110) && (target.value.indexOf('.') < 0)));
}

function AllowAlphabetOnly(event) {
    var keyCode = event.which ? event.which : event.keyCode
    //if (event.ctrlKey && keyCode == 86) {//OLD 01/09/2019 HARSH
    if (event.ctrlKey && (keyCode == 67 || keyCode == 99 || keyCode == 86 || keyCode == 118)) {//NEW 01/09/2019 HARSH
        //return false;
        return true;
    }
    return (!((keyCode < 65 || keyCode > 90)) || specialKeys.indexOf(keyCode) != -1)
}

function AllowAlphabetWithSpace(event) {
    var keyCode = event.which ? event.which : event.keyCode
    //if (event.ctrlKey && keyCode == 86) {//OLD 01/09/2019 HARSH
    if (event.ctrlKey && (keyCode == 67 || keyCode == 99 || keyCode == 86 || keyCode == 118)) {//NEW 01/09/2019 HARSH
        //return false;
        return true;
    }
    return (!((keyCode < 65 || keyCode > 90)) || keyCode == 32 || specialKeys.indexOf(keyCode) != -1)
}

function AllowAlphanumericWithSpace(event) {
    var keyCode = event.which ? event.which : event.keyCode
    //if (event.ctrlKey && keyCode == 86) {//OLD 01/09/2019 HARSH
    if (event.ctrlKey && (keyCode == 67 || keyCode == 99 || keyCode == 86 || keyCode == 118)) {//NEW 01/09/2019 HARSH
        //return false;
        return true;
    }
    //added 9/10/2019 HARSH
    if (event.shiftKey && (keyCode = 34)) {
        return true;
    }
    if ((keyCode >= 180 && keyCode <= 226)) {
        return true;
    }
    if ((keyCode >= 91 && keyCode <= 93)) {
        return true;
    }
    //end
    if (event.shiftKey && (keyCode >= 48 && keyCode <= 57)) {
        return false;
    }
    //return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || keyCode == 32 || !(keyCode < 65 || keyCode > 90) || specialKeys.indexOf(keyCode) != -1)
    return ((keyCode >= 96 && keyCode <= 105) || keyCode == 32 || !(keyCode < 65 || keyCode > 90) || specialKeys.indexOf(keyCode) != -1)
}

function AllowAlphanumeric(event) {
    var keyCode = event.which ? event.which : event.keyCode
    //if (event.ctrlKey && keyCode == 86) {//OLD 01/09/2019 HARSH
    if (event.ctrlKey && (keyCode == 67 || keyCode == 99 || keyCode == 86 || keyCode == 118)) {//NEW 01/09/2019 HARSH
        //return false;
        return true;
    }
    if (event.shiftKey && (keyCode >= 48 && keyCode <= 57)) {
        return false;
    }
    return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || !(keyCode < 65 || keyCode > 90) || specialKeys.indexOf(keyCode) != -1)
}
function verifybirthdate(sender, args) {
    //validate that a DOB is at least 18 years old.

    var today = new Date();
    var today_year = today.getFullYear();
    var value = sender._selectedDate.format(sender._format);
    //            value = value.replace("-", "/").replace("-", "/");
    //            var splitDate = value.split("/");
    var dob_year = sender._selectedDate.getFullYear();
    var dob_day = sender._selectedDate.getDate();
    var dob_month = sender._selectedDate.getMonth();
    var dob;

    dob = new Date(dob_year, dob_month, dob_day); // as months are 0-11
    if ((dob_day == dob.getDate()) && (dob_month == (dob.getMonth())) && (dob_year == dob.getFullYear())) {
        //dob_month = dob_month - 1; // as months are 0-11
        var age = today_year - dob_year;
        var today_month = today.getMonth();
        var today_day = today.getDate();
        if (dob_month > today_month) { age = age - 1 }  // next birthday not yet reached
        else if (dob_month == today_month && today_day < dob_day) { age = age - 1 }  // next birthday not yet reached
        if (age < 18) {
            alert("Age should be greater then or equal to 18 years.");
            sender._textbox.set_Value('')
            return false;
        } else {
            return age;
        }
    }
    else {
        alert("Age should be greater then or equal to 18 years.");
        sender._textbox.set_Value('')
        return false;
    }

    return true;
}
function verifyjoiningdate(sender, args) {
    var d = new Date();
    d.setDate(d.getDate());
    if (sender._selectedDate > d) {
        alert("Date should be Today or less than Today");
        sender._textbox.set_Value('')
    }
}
function verifyleavingdate(sender, args) {
    var d = new Date();
    d.setDate(d.getDate());
    if (sender._selectedDate < d) {
        alert("Date should be greater than Today");
        sender._textbox.set_Value('')
    }
}
function ApplyGridFilter(gridClientId, scrollYpixel) {
    var grid = document.getElementById(gridClientId);
    if (grid != null) {
        if (grid.rows.length > 2) {
            var oTable = $('#' + gridClientId).dataTable({
                "sDom": "Rlfrtip",
                "bAutoWidth": false,
                "bFilter": true,
                "bPagination": false,
                "bPaginate": false,
                "bInfo": true,
                "scrollY": scrollYpixel + "px",
                "scrollX": true,
                "scrollCollapse": true
            });
        }
    }
}