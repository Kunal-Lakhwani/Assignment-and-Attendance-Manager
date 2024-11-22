<%@ Page Title="" Language="VB" MasterPageFile="User-Side.master" AutoEventWireup="false" CodeFile="Attendance.aspx.vb" Inherits="Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <%--<link rel="stylesheet" href="../Admin-Side/dist/css/adminlte.min.css">--%>

    <style>
        .dte-footer {
            background-color: white !important;
        }

            .dte-footer > .border-hide {
                border-inline: 0;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../plugins/jquery/jquery.min.js" />
            <asp:ScriptReference Path="../plugins/bootstrap/js/bootstrap.bundle.min.js"></asp:ScriptReference>
            <asp:ScriptReference Path="../plugins/bootstrap-switch/js/bootstrap-switch.min.js"></asp:ScriptReference>
            <asp:ScriptReference Path="../dist/js/adminlte.min.js" />
            <asp:ScriptReference Path="../plugins/datatables/jquery.dataTables.min.js" />
            <asp:ScriptReference Path="../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js" />
            <asp:ScriptReference Path="../plugins/datatables-responsive/js/dataTables.responsive.min.js" />
            <asp:ScriptReference Path="../plugins/datatables-responsive/js/responsive.bootstrap4.min.js" />
            <asp:ScriptReference Path="../plugins/datatables-buttons/js/dataTables.buttons.min.js" />
            <asp:ScriptReference Path="../plugins/datatables-buttons/js/buttons.bootstrap4.min.js" />
            <asp:ScriptReference Path="../plugins/jszip/jszip.min.js" />
            <asp:ScriptReference Path="../plugins/pdfmake/pdfmake.min.js" />
            <asp:ScriptReference Path="../plugins/pdfmake/vfs_fonts.js" />
            <asp:ScriptReference Path="../plugins/datatables-buttons/js/buttons.html5.min.js" />
            <asp:ScriptReference Path="../plugins/datatables-buttons/js/buttons.print.min.js" />
            <asp:ScriptReference Path="../plugins/datatables-buttons/js/buttons.colVis.min.js" />
            <asp:ScriptReference Path="~/User-Side/Ajax-Scripts/AttendanceReload.js" />
        </Scripts>
    </asp:ScriptManager>--%>
    <div class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>DataTables</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">DataTables</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">DataTable with default features</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <asp:GridView ID="attntbl" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="fmail" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname"></asp:BoundField>
                                                <asp:BoundField DataField="fmail" HeaderText="fmail" ReadOnly="True" SortExpression="fmail"></asp:BoundField>
                                                <asp:BoundField DataField="fpwd" HeaderText="fpwd" SortExpression="fpwd"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Status" runat="server" Style="display: none" Text="Present"></asp:Label>
                                                        <asp:Button ID="stu_status" runat="server" Text="Present" OnClick="stu_status_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString3 %>' SelectCommand="SELECT * FROM [admins_master]"></asp:SqlDataSource>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
    </div>
    <script src="../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../plugins/pdfmake/pdfmake.min.js"></script>
    <script src="../plugins/pdfmake/vfs_fonts.js"></script>
    <script src="../plugins/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
    <script>
        function getAspControlID(id) {
            var aspid = $("[id$=" + id + "]").attr("id");
            return aspid;
        }

        $(document).ready((function () {
            $("#" + getAspControlID("attntbl")).DataTable({
                "responsive": true, "lengthChange": false, "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print"]
            }).buttons().container().appendTo('#' + getAspControlID("attntbl") + '_wrapper .col-md-6:eq(0)');
        }));
    </script>
</asp:Content>
