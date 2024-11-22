Imports System.Drawing.Color
Partial Class Admin_Side_login
  Inherits System.Web.UI.Page
  Private Sub lgn_btn_Click(sender As Object, e As EventArgs) Handles lgn_btn.Click
    Try
      If fmail.Text <> "" Then
        fmail.BorderColor = Transparent
        If fpwd.Text <> "" Then
          fpwd.BorderColor = Transparent
          Dim d As New DAOClass
          Dim ds As New Data.DataSet
          Dim p(1) As String
          p(0) = "@fmail"
          p(1) = "@fpwd"
          Dim v(1) As String
          v(0) = fmail.Text
          v(1) = fpwd.Text
                    ds = d.getdata(p, v, "select * from admins_master where fmail=@fmail and fpwd=@fpwd")
                    If ds.Tables(0).Rows.Count > 0 Then
            Label1.Text = ""
            Session.Add("fmail", fmail.Text)
            Session.Add("fname", ds.Tables(0).Rows(0).Item("fname"))
            Session.Add("fpass", fpwd.Text)
            Response.Redirect("Default.aspx")
          Else
            Label1.Text = "Invalid Username or Password"
            fmail.Focus()
          End If
        Else
          fpwd.BorderColor = Red
          fpwd.Focus()
          Label1.Text = "Enter Password"
        End If
      Else
        fmail.BorderColor = Red
        fmail.Focus()
        Label1.Text = "Enter E-Mail"
      End If
    Catch ex As Exception
      Label1.Text &= ex.Message
    End Try
  End Sub
  Private Sub Admin_Side_login_Load(sender As Object, e As EventArgs) Handles Me.Load
    fmail.Focus()
  End Sub
End Class
