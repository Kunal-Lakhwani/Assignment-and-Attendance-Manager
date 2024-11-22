<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="exam_master.aspx.vb" Inherits="Admin_Side_exam_master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exam Master</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap/js/bootstrap.min.js"/>
    <link rel="shortcut icon" href="#" />
    <script src="../plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#add").click(function () {
                swal("Hello");
                var fname = updFile();
                var cname = document.getElementById("cname").value;
                var ccode = document.getElementById("ccode").value;
                var cdesc = document.getElementById("cdesc").value;
                var csem = $("select.csem").children("option:selected").val();
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "course_master.aspx/SaveDataCourse",
                    data: "{'cname':'" + cname + "','ccode':'" + ccode + "','cdesc':'" + cdesc + "','csem':'" + csem + "','cimg':'" + fname + "'}",
                    dataType: "json",
                    success: function (data) {
                        alert("Inserted Succcessfully.");
                    },
                    error: function () { alert("An Unexpected Error Occured"); }
                });
            });
            function updFile() {
                var fPath = document.getElementById("FileUpload1");
                var fData = new FormData();
                fData.append(fPath.files[0].name, fPath.files[0]);
                $.ajax({
                    url: "../Handler.ashx",
                    type: 'POST',
                    data: fData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (file) {
                        
                        alert(file + " File Uploaded successfully");
                    },
                    error: function (err) { alert( err + "An Unexpected Error Occured"); },
                    xhr: function () {
                        var fileXhr = $.ajaxSettings.xhr();
                        if (fileXhr.upload) {
                            alert("File is being uploaded");
                        }
                        return fileXhr;
                    }
                });
                return fPath.files[0].name;
            }
        });
    </script>
    <style>
        .hidden {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>