<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="Admin_Side_student_login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />  
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />  
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
  <link rel="stylesheet" href="dist/css/adminlte.min.css" />
</head>
<body class="hold-transition login-page">
  <asp:Label runat="server" id="lbl" Text=""></asp:Label>
    <form runat="server" id="form1">
  <div class="login-box">
    <div class="card card-outline card-primary">
      <div class="card-header text-center">
        <a href="default.aspx" class="h1">Tolani Commerce College</a>
      </div>
      <div class="card-body">
        <p class="login-box-msg">Sign in to start your session</p>        
          <div class="input-group mb-3">
            <asp:TextBox ID="stu_mail" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>            
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-envelope" runat="server" id="spn"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <asp:TextBox ID="stu_pass" TextMode="Password" CssClass="form-control" ViewStateMode="Disabled" placeholder="Password" runat="server"></asp:TextBox>
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>            
          </div>
        <asp:Label ID="Label1" runat="server" Text="" forecolor="red"/>
          <div class="row">        
            <div class="col-4">
              <asp:Button text="Sign In" runat="server" ID="lgn_btn" cssclass="btn btn-primary btn-block" />           
            </div>            
          </div>
        <p class="mb-1">
          <a href="pass_recovery.aspx">I forgot my password</a>
        </p>
        <p class="mb-0">
          <a href="register.aspx" class="text-center">Register a new membership</a>
        </p>
      </div>      
    </div>    
  </div>    
</form>
  <script src="plugins/jquery/jquery.min.js"></script>  
  <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>  
  <script src="dist/js/adminlte.min.js"></script>
</body>
</html>