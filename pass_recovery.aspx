<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pass_recovery.aspx.vb" Inherits="Admin_Side_pass_recovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Recover Password</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <link rel="stylesheet" href="dist/css/adminlte.min.css" />
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
        <div class="login-box">
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    <a href="#" class="h1">Change Your Password</a>
                </div>
                <div class="card-body">
                    <p class="login-box-msg">You are only one step a way from your new password, change your password now.</p>
                    <div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="fpwd" runat="server" CssClass="form-control" placeholder="Password" />
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="fcpwd" runat="server" CssClass="form-control" placeholder="Confirm Password" />
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <asp:Button ID="rec_btn" runat="server" CssClass="btn btn-primary btn-block" Text="Change Password" />
                            </div>
                        </div>
                    </div>
                    <p class="mt-3 mb-1">
                        <a href="student_login.aspx">Login</a>
                    </p>
                </div>
            </div>
        </div>
        <script src="plugins/jquery/jquery.min.js"></script>
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="dist/js/adminlte.min.js"></script>
    </form>
</body>
</html>
