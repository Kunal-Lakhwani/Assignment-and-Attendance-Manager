
Partial Class User_Master
    Inherits System.Web.UI.MasterPage

    Private Sub User_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("stu_name") <> "" Then
            fname.Text = Session("stu_name")
        Else
            Response.Redirect("login.aspx")
        End If
    End Sub

    Private Sub logout_Click(sender As Object, e As EventArgs) Handles logout.Click
        Session.RemoveAll()
        MsgBox(Session("stu_mail"))
        Response.Redirect("login.aspx")
    End Sub
End Class

