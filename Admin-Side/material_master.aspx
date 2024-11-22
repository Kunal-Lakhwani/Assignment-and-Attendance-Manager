<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="material_master.aspx.vb" Inherits="Admin_Side_material_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Material Master</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
    <script src="../plugins/jquery/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#add").click(function () {
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="hold-transition sidebar-mini">
        <div class="wrapper">
            <div class="content-wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Add Material</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Material Master</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Material Details</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputName">Course Name</label>
                                        <asp:DropDownList ID="mCourses" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Material Name</label>
                                        <asp:TextBox ID="mname" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDescription">Material Description</label>
                                        <asp:TextBox ID="mdesc" CssClass="form-control" runat="server" Rows="4" Columns="0" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStatus">Semester</label>
                                        <asp:DropDownList ID="msem" CssClass="form-control" runat="server">
                                            <asp:ListItem Selected="False">Select Semester</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputClientCompany">Material File</label>
                                        <asp:FileUpload CssClass="form-control-file" accept="application/pdf,application/vnd.ms-excel" ID="mfile" runat="server" />
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1.7">
                                            <asp:Button CssClass="btn btn-success float-right" ID="m_add" runat="server" Text="Add Course" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Exam Paper Details</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputName">Subject Name</label>
                                        <asp:TextBox ID="ename" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Course Code</label>
                                        <asp:TextBox ID="ecode" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStatus">Semester</label>
                                        <asp:DropDownList ID="esem" CssClass="form-control" runat="server">
                                            <asp:ListItem Selected="False">Select Semester</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputClientCompany">Paper File</label>
                                        <asp:FileUpload CssClass="form-control-file" accept="application/pdf,application/vnd.ms-excel" ID="efile" runat="server" />
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1.7">
                                            <asp:Button CssClass="btn btn-success float-right" ID="e_add" runat="server" Text="Add Course" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card card-primary">
                                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ecode" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="523px">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                            <asp:BoundField DataField="ecode" HeaderText="Exam Code" ReadOnly="True" SortExpression="ecode" />
                                            <asp:BoundField DataField="ename" HeaderText="Name" SortExpression="ename" />
                                            <asp:BoundField DataField="esem" HeaderText="Semester" SortExpression="esem" />
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
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:data_studentConnectionString %>" DeleteCommand="DELETE FROM [exam_master] WHERE [ecode] = @ecode" InsertCommand="INSERT INTO [exam_master] ([ecode], [ename], [esem], [efile]) VALUES (@ecode, @ename, @esem, @efile)" SelectCommand="SELECT * FROM [exam_master]" UpdateCommand="UPDATE [exam_master] SET [ename] = @ename, [esem] = @esem, [efile] = @efile WHERE [ecode] = @ecode">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ecode" Type="Decimal" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ecode" Type="Decimal" />
                                            <asp:Parameter Name="ename" Type="String" />
                                            <asp:Parameter Name="esem" Type="Decimal" />
                                            <asp:Parameter Name="efile" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ename" Type="String" />
                                            <asp:Parameter Name="esem" Type="Decimal" />
                                            <asp:Parameter Name="efile" Type="String" />
                                            <asp:Parameter Name="ecode" Type="Decimal" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="mcode" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                        <asp:BoundField DataField="mcode" HeaderText="Material Code" ReadOnly="True" SortExpression="mcode" />
                                        <asp:BoundField DataField="mname" HeaderText="Name" SortExpression="mname" />
                                        <asp:BoundField DataField="mdesc" HeaderText="Description" SortExpression="mdesc" />
                                        <asp:BoundField DataField="msem" HeaderText="Semester" SortExpression="msem" />
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:data_studentConnectionString3 %>" DeleteCommand="DELETE FROM [material_master] WHERE [mcode] = @mcode" InsertCommand="INSERT INTO [material_master] ([cID], [mname], [mdesc], [msem], [mfile]) VALUES (@cID, @mname, @mdesc, @msem, @mfile)" SelectCommand="SELECT * FROM [material_master]" UpdateCommand="UPDATE [material_master] SET [cID] = @cID, [mname] = @mname, [mdesc] = @mdesc, [msem] = @msem, [mfile] = @mfile WHERE [mcode] = @mcode">
                                    <DeleteParameters>
                                        <asp:Parameter Name="mcode" Type="Decimal" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="cID" Type="Decimal" />
                                        <asp:Parameter Name="mname" Type="String" />
                                        <asp:Parameter Name="mdesc" Type="String" />
                                        <asp:Parameter Name="msem" Type="Decimal" />
                                        <asp:Parameter Name="mfile" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="cID" Type="Decimal" />
                                        <asp:Parameter Name="mname" Type="String" />
                                        <asp:Parameter Name="mdesc" Type="String" />
                                        <asp:Parameter Name="msem" Type="Decimal" />
                                        <asp:Parameter Name="mfile" Type="String" />
                                        <asp:Parameter Name="mcode" Type="Decimal"></asp:Parameter>
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        >
                    </div>
                </section>
            </div>
            <aside class="control-sidebar control-sidebar-dark">
            </aside>
        </div>
        <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../dist/js/adminlte.min.js"></script>
        <script src="../dist/js/demo.js"></script>
        <script src="../dist/js/pages/alrt.js"></script>
    </div>
</asp:Content>