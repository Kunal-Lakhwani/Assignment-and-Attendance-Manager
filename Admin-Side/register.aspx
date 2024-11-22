<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Registration</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="hold-transition register-page">
        <div class="register-box">
            <div class="card card-outline card-primary">
                <div class="card-header text-center" style="padding-bottom: 0px;">
                    <a href="#" class="h1">Tolani Commerce College</a>
                </div>
                <div class="card-body" style="margin-top: 0px">
                    <p class="login-box-msg">Register</p>

                    <div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="fname" CssClass="form-control" runat="server" placeholder="Full name"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="fmail" placeholder="Email" CssClass="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="fpwd" TextMode="Password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="fcpwd" TextMode="Password" CssClass="form-control" runat="server" placeholder="Retype password"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">                            
                            <div class="col-4">
                                <asp:Button ID="reg" runat="server" CssClass="btn btn-primary btn-block" Text="Register"></asp:Button>
                                <asp:Label ID="lblimg" Visible="false" runat="server" Text="Label" />
                                <asp:Label ID="lblid" Visible="false" runat="server" Text="Label" />
                                <asp:TextBox ID="pwd" runat="server" />
                                <asp:TextBox ID="cpwd" runat="server" />
                                <asp:FileUpload accept="image/*" ID="FileUpload1" runat="server" />
                            </div>                            
                        </div>
                    </div>
                    <a href="login.html" class="text-center">Already have an account ? Login</a>
                </div>                
            </div>            
        </div>        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="fmail" DataSourceID="SqlDataSource1">
            <Columns>
                <%--<asp:TemplateField HeaderText="Header">
              <itemtemplate>
                <asp:Image id="img1" ImageUrl='<% "../" + Eval("bimg") %>' runat="server"/>
              </itemtemplate>
            </asp:TemplateField>--%>
                <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname"></asp:BoundField>
                <asp:BoundField DataField="fmail" HeaderText="fmail" ReadOnly="True" SortExpression="fmail"></asp:BoundField>
                <asp:BoundField DataField="fpwd" HeaderText="fpwd" SortExpression="fpwd"></asp:BoundField>
                <asp:BoundField DataField="fcpwd" HeaderText="fcpwd" SortExpression="fcpwd"></asp:BoundField>
                <asp:TemplateField HeaderText="Table">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" CommandName="Delete" CausesValidation="false" runat="server" />
                        <asp:ImageButton ID="ImageButton2" OnClick="ImageButton2_Click" CausesValidation="false" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>       
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' DeleteCommand="DELETE FROM [admins_master] WHERE [fmail] = @fmail" InsertCommand="INSERT INTO [admins_master] ([fname], [fmail], [fpwd], [fcpwd]) VALUES (@fname, @fmail, @fpwd, @fcpwd)" SelectCommand="SELECT * FROM [admins_master]" UpdateCommand="UPDATE [admins_master] SET [fname] = @fname, [fpwd] = @fpwd, [fcpwd] = @fcpwd WHERE [fmail] = @fmail">
            <DeleteParameters>
                <asp:Parameter Name="fmail" Type="String"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="fname" Type="String"></asp:Parameter>
                <asp:Parameter Name="fmail" Type="String"></asp:Parameter>
                <asp:Parameter Name="fpwd" Type="String"></asp:Parameter>
                <asp:Parameter Name="fcpwd" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="sfname" Type="String"></asp:Parameter>
                <asp:Parameter Name="fpwd" Type="String"></asp:Parameter>
                <asp:Parameter Name="fcpwd" Type="String"></asp:Parameter>
                <asp:Parameter Name="fmail" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <script src="../plugins/jquery/jquery.min.js"></script>
        <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../dist/js/adminlte.min.js"></script>
    </div>
</asp:Content>
