<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="course_master.aspx.vb" Inherits="Admin_Side_course_master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Master</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap/js/bootstrap.min.js" />
    <link rel="shortcut icon" href="#" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../plugins/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            /*swal({
                title: "Are you sure?",
                text: "Once deleted, you will not be able to recover this imaginary file!",
                icon: "warning",
                buttons: true,
                dangerMode: true,
                })
            .then((willDelete) => {
                    if (willDelete) {
                            swal("Poof! Your imaginary file has been deleted!", {
                            icon: "success",
                        });
                    } else {
                        swal("Your imaginary file is safe!", {icon: "info"});
                    }
                });*/
            $("#cname").focus()
            var val_name = false;
            var val_code = false;
            var val_desc = false;
            var val_sem = false;
            var val_file = false;
            var cname = document.getElementById("cname");
            cname.addEventListener('blur', () => { validateCname(); });
            function validateCname() {
                let name = $("#cname").val();
                if (name.length == '') {
                    $("#cname").css("border-color", "red");
                    val_name = false;
                }
                else {
                    $("#cname").css("border-color", "#ced4da");
                    val_name = true;
                }
            }
            var ccode = document.getElementById("ccode");
            ccode.addEventListener('blur', () => { validateCcode(); });
            function validateCcode() {
                let name = $("#ccode").val();
                if (name.length == '') {
                    $("#ccode").css("border-color", "red");
                    val_code = false;
                }
                else {
                    $("#ccode").css("border-color", "#ced4da");
                    val_code = true;
                }
            }
            ccode.addEventListener('keyup', () => { checknum(); });
            function checknum() {
                let regex = /^[0-9]*$/;
                let v = ccode.value;
                let code = $("#ccode");
                if (!regex.test(v)) {
                    code.css("border-color", "red");
                    $("#s_code").css("color", "red");
                    $("#s_code").html("Course Code can only be a number.");
                }
                else {
                    code.css("border-color", "#ced4da");
                    $("#s_code").html("");
                }
            }
            var cdesc = document.getElementById("cdesc");
            cdesc.addEventListener('blur', () => { validateCdesc(); });
            function validateCdesc() {
                let name = $("#cdesc").val();
                if (name.length == '') {
                    $("#cdesc").css("border-color", "red");
                    val_desc = false;
                }
                else {
                    $("#cdesc").css("border-color", "#ced4da");
                    val_desc = true;
                }
            }
            var csem = document.getElementById("csem");
            csem.addEventListener('blur', () => { validateCsem(); });
            function validateCsem() {
                var sem = $("select.csem").children("option:selected").val();
                if (sem == 0) {
                    $("#csem").css("border-color", "red");
                    val_sem = false;
                }
                else {
                    $("#csem").css("border-color", "#ced4da");
                    val_sem = true;
                }
            }
            var cfile = document.getElementById("FileUpload1");
            cfile.addEventListener('blur', () => { validateCfile(); })
            function validateCfile() {
                if (cfile.value == '') {
                    $("#s1").css("color", "red");
                    $("#s1").html("Enter Valid File.");
                    val_file = false;
                }
                else {
                    $("#s1").html("");
                    $("#s1").hide();
                    val_file = true;
                }
            }
            $("#add").click(function () {
                var check = validate_input();
                if (check == true) {
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
                        error: function () { alert("Record was not inserted."); }
                    });
                }
                else {
                    alert("Please enter all fields.");
                }
            });
            $("#btn_link").click(function () {
                let lnk = $("#links").children("option:selected").val();
                alert(lnk);
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
                        alert(file + " Uploaded successfully");
                    },
                    error: function (err) { alert(err + " An Unexpected Error Occured"); },
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
            function validate_input() {
                if (val_name == true && val_code == true && val_desc == true && val_sem == true && val_file == true) {
                    return true;
                }
                else {
                    return false;
                }
            }
        });
    </script>
    <style>
        .hidden {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="hold-transition sidebar-mini">
        <div class="wrapper">
            <div class="content-wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Add Course</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Course Master</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>
                <asp:Label runat="server"></asp:Label>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Course Details</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputName">Course Name</label>
                                        <input type="text" id="cname" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Course Code</label>
                                        <input id="ccode" class="form-control" />
                                        <span id="s_code"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDescription">Course Description</label>
                                        <input id="cdesc" class="form-control" type="text" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStatus">Semester</label>
                                        <select class="form-control csem" id="csem">
                                            <option selected value="0">Select Semester</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputClientCompany">Course Image (Optional)</label>
                                        <input type="file" class="form-control-file file_upd FileUpload1" accept="image/*" id="FileUpload1" />
                                        <span id="s1"></span>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1.7">
                                            <input type="reset" class="btn btn-success float-right" id="add" value="Add Course" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="true" ShowEditButton="True" />
                                        <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                                        <asp:BoundField DataField="cname" HeaderText="Course Name" SortExpression="cname"></asp:BoundField>
                                        <asp:BoundField DataField="ccode" HeaderText="Course Code" SortExpression="ccode"></asp:BoundField>
                                        <asp:BoundField DataField="cdesc" HeaderText="Description" SortExpression="cdesc"></asp:BoundField>
                                        <asp:BoundField DataField="csem" HeaderText="Semester" SortExpression="csem"></asp:BoundField>
                                        <asp:BoundField DataField="cimg" HeaderText="Image" SortExpression="cimg"></asp:BoundField>
                                        <asp:TemplateField ShowHeader="false">
                                            <ItemTemplate>
                                                <asp:Image ID="img1" Width="60px" Height="60px" ImageUrl='<%# Eval("cimg") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString2 %>' DeleteCommand="DELETE FROM [course_master] WHERE [id] = @id" InsertCommand="INSERT INTO [course_master] ([cname], [ccode], [cdesc], [csem], [cimg]) VALUES (@cname, @ccode, @cdesc, @csem, @cimg)" SelectCommand="SELECT * FROM [course_master]" UpdateCommand="UPDATE [course_master] SET [cname] = @cname, [ccode] = @ccode, [cdesc] = @cdesc, [csem] = @csem, [cimg] = @cimg WHERE [id] = @id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id" Type="Decimal"></asp:Parameter>
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="cname" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="ccode" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="cdesc" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="csem" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="cimg" Type="String"></asp:Parameter>
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="cname" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="ccode" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="cdesc" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="csem" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="cimg" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="id" Type="Decimal"></asp:Parameter>
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputStatus">Generate Course Link</label>
                                        <asp:DropDownList ID="links" CssClass="form-control csem" runat="server">
                                        </asp:DropDownList><br />
                                        <asp:Button runat="server" Class="btn btn-success float-left" ID="btn_link" Text="Generate" /><br />
                                        <br />
                                        <asp:TextBox ReadOnly="true" CssClass="form-control" ID="txt_link" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <aside class="control-sidebar control-sidebar-dark">
            </aside>
        </div>
    </div>
</asp:Content>