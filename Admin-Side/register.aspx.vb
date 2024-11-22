
Partial Class register
  Inherits System.Web.UI.Page

  Private Sub reg_Click(sender As Object, e As EventArgs) Handles reg.Click
    If Session("bf") = 0 Then
      'Used to upload file
      'Dim file_name As String = "images/student_img" & FileUpload1.PostedFile.FileName '(For Student Profile Picture)
      'If FileUpload1.HasFile Then
      '  SqlDataSource1.InsertParameters("fname").DefaultValue = fname.Text
      '  SqlDataSource1.InsertParameters("fmail").DefaultValue = fmail.Text
      '  SqlDataSource1.InsertParameters("fpwd").DefaultValue = fpwd.Text
      '  SqlDataSource1.InsertParameters("fcpwd").DefaultValue = fcpwd.Text
      '  SqlDataSource1.InsertParameters("f_image").DefaultValue = file_name
      '  FileUpload1.SaveAs(Server.MapPath(file_name))
      '  SqlDataSource1.Insert()
      '  SqlDataSource1.DataBind()
      'End If
      SqlDataSource1.InsertParameters("fname").DefaultValue = fname.Text
      SqlDataSource1.InsertParameters("fmail").DefaultValue = fmail.Text
      SqlDataSource1.InsertParameters("fpwd").DefaultValue = fpwd.Text
      SqlDataSource1.InsertParameters("fcpwd").DefaultValue = fcpwd.Text
      SqlDataSource1.Insert()
      SqlDataSource1.DataBind()
    Else
      'For Image updation
      '  Dim f_name As String = ""
      '  If FileUpload1.HasFile Then
      '    f_name = "images/student_img" & FileUpload1.PostedFile.FileName '(For Student Profile Picture)
      '    FileUpload1.SaveAs(Server.MapPath(f_name))
      '    If System.IO.File.Exists(Server.MapPath(lblimg.Text)) Then
      '      System.IO.File.Delete(Server.MapPath(lblimg.Text))
      '    End If
      '    SqlDataSource1.UpdateParameters("f_image").DefaultValue = f_name
      '  Else
      '  f_name = lblimg.Text
      'End If
      SqlDataSource1.UpdateParameters("fname").DefaultValue = fname.Text
        SqlDataSource1.UpdateParameters("fmail").DefaultValue = fmail.Text
        SqlDataSource1.UpdateParameters("fpwd").DefaultValue = pwd.Text
        SqlDataSource1.UpdateParameters("fcpwd").DefaultValue = cpwd.Text
        SqlDataSource1.Update()
        SqlDataSource1.DataBind()
      End If
      lblid.Text = ""
      lblimg.Text = ""
    Session.Add("bf", 0)
    fname.Text = ""
    fmail.Text = ""
  End Sub
  Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs)
    Try
      Dim row As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
      Dim rindex As Integer = row.RowIndex
      fname.Text = GridView1.Rows(rindex).Cells(0).Text
      fmail.Text = GridView1.Rows(rindex).Cells(1).Text
      pwd.Text = GridView1.Rows(rindex).Cells(2).Text
      cpwd.Text = GridView1.Rows(rindex).Cells(3).Text
      Session.Add("bf", 1)
    Catch ex As Exception

    End Try
  End Sub

  Private Sub register_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not Page.IsPostBack Then
      Session.Add("bf", 0)
    End If
  End Sub
End Class
