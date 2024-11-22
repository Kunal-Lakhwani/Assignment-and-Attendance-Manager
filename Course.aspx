<%@ Page Title="" Language="VB" MasterPageFile="User-Side.master" AutoEventWireup="false" CodeFile="Course.aspx.vb" Inherits="Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .user-card {
            min-width: 200px;
            max-width: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0"></h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="stu_panel">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="card">
                <div class="card-header d-flex p-0">
                    <h3 class="card-title p-3">
                        <!-- Label that displays the name of current course -->
                        <asp:Label ID="Course_Name" runat="server"></asp:Label>
                    </h3>
                    <ul class="nav nav-pills ml-auto p-2">
                        <li class="nav-item">
                            <a class="nav-link active" href="#assignments" data-toggle="tab">
                                <i class=" nav-icon fas fa-book"></i>
                                Assignments
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#people" data-toggle="tab">
                                <i class="nav-icon fas fa-users"></i>
                                Users
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#materials" data-toggle="tab">
                                <i class="nav-icon fas fa-bookmark"></i>
                                Materials
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <!-- Assignments -->
                        <div class="tab-pane active" id="assignments">
                            <div class="card">
                                <div class="card-header" style="background-color: #007bff;">
                                    <h3 class="card-title" style="color: white;">Course Name</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>Assignment</label>
                                                <label class="form-control">Subject Name</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Uploaded On : </label>
                                                <label>28-03-2022</label>
                                                <label class="form-control">Finish And upload given assignment before given date.</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- textarea -->
                                            <div class="form-group">
                                                <label>File Of Assignment</label>
                                                <label>
                                                    <button class="form-control">Download</button></label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Uploaded By</label>
                                                <label class="form-control">Teacher Name</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Upload Your Work</label>
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="exampleInputFile">
                                                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                                    </div>
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">Upload</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <footer>Due Date : <label>31-03-2022</label></footer>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        <!-- Users -->
                        <div class="tab-pane" id="people">
                            <div class="card card-red card-columns">
                                <div class="card-header">
                                    <h3 class="card-title">Teachers</h3>
                                </div>
                                <div class="card-body">
                                    <asp:Repeater ID="teach_lst" runat="server" DataSourceID="TeacherDataSource">
                                        <ItemTemplate>
                                            <div class="card card-primary card-outline user-card">
                                                <div class="card-header">
                                                    <h5 class="card-title"><%#Eval("uName") %></h5>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <asp:SqlDataSource runat="server" ID="TeacherDataSource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString3 %>' SelectCommand="Select uName from course_enrolled where uRole='teacher' and cID in (Select id from course_master where clink = @link);">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="link" DbType="String" Name="link"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div class="card card-blue card-columns">
                                <div class="card-header">
                                    <h3 class="card-title">Students</h3>
                                </div>
                                <div class="card-body flex-column flex-wrap">
                                    <asp:Repeater ID="stud_lst" runat="server" DataSourceID="StudentDataSource">
                                        <ItemTemplate>
                                            <div class="card card-blue card-outline user-card">
                                                <div class="card-header">
                                                    <h5 class="card-title"><%#Eval("uName") %></h5>
                                                </div>
                                                <div class="card-body teacher-only">
                                                    <asp:Button runat="server" class="btn btn-block btn-success" Text="Make Teacher" CommandName="User_upgrade" CommandArgument='<%#Eval("id") %>'></asp:Button>
                                                    <asp:Button runat="server" class="btn btn-block btn-danger" Text="Remove" CommandName="Remove_User" CommandArgument='<%#Eval("id") %>'></asp:Button>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <asp:SqlDataSource runat="server" ID="StudentDataSource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString3 %>' SelectCommand="Select * from course_enrolled where uRole='student' and cID in (Select id from course_master where clink = @link);" DeleteCommand="Delete from course_enrolled where id = @enrollid" UpdateCommand="Update course_enrolled set uRole='Teacher' where id = @enrollid">
                                    <DeleteParameters>
                                        <asp:Parameter Name="enrollid"></asp:Parameter>
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="link" DbType="String" Name="link"></asp:QueryStringParameter>
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="enrollid"></asp:Parameter>
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>

                        <!-- Materials -->

                        <div class="tab-pane" id="materials">
                            <div class="card card-red">
                                <div class="card-header">Study Materials</div>
                                <div class="card-body">
                                    <asp:Repeater ID="mat_lst" runat="server" DataSourceID="MaterialsDataSource">
                                        <ItemTemplate>
                                            <div class="card">
                                                <div class="card-title">
                                                    <h5 class="card-header">
                                                        <%#Eval("mname") %>
                                                    </h5>
                                                </div>
                                                <div class="card-body">
                                                    <asp:Button runat="server" Text="Download" CommandName="downloadbtn" CommandArgument='<%# Eval("mfile") %>' />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <asp:SqlDataSource runat="server" ID="MaterialsDataSource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT * FROM [material_master] WHERE ([cID] = @cID)">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="cID" Name="cID" Type="Decimal"></asp:SessionParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.card-body -->
            </div>
            <!-- ./card -->
        </section>
    </div>
</asp:Content>