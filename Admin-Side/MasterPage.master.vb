Partial Class MasterPage
  Inherits System.Web.UI.MasterPage

  Private Sub MasterPage_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Session("fname") <> "" Then
            fname.Text = Session("fname")
        Else
      Response.Redirect("login.aspx")
    End If
  End Sub
End Class
