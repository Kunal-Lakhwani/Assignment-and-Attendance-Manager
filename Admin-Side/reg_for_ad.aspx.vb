Partial Class student_registration
  Inherits System.Web.UI.Page

  Private Sub reg_Click(sender As Object, e As EventArgs) Handles reg.Click
    Dim d As New DAOClass
    Dim p(2) As String
    p(0) = "@fname"
    p(1) = "@fmail"
    p(2) = "@fpwd"
    Dim v(2) As String
    v(0) = fname.Text
    v(1) = fmail.Text
    v(2) = fpwd.Text
        d.add(p, v, "insert into admins_master (fname,fmail,fpwd) values (@fname,@fmail,@fpwd)")
        Response.Redirect("login.aspx")
  End Sub

  Private Sub student_registration_Load(sender As Object, e As EventArgs) Handles Me.Load
    fname.Focus()
  End Sub
End Class
