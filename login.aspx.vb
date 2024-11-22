Imports System.Drawing.Color
Partial Class Admin_Side_student_login
    Inherits System.Web.UI.Page
    Private Sub lgn_btn_Click(sender As Object, e As EventArgs) Handles lgn_btn.Click
        Try
            If stu_mail.Text <> "" Then
                stu_mail.BorderColor = FromArgb(202, 212, 218)
                If stu_pass.Text <> "" Then
                    stu_pass.BorderColor = FromArgb(202, 212, 218)
                    Dim d As New DAOClass
                    Dim ds As New Data.DataSet
                    Dim p(1) As String
                    p(0) = "@stu_mail"
                    p(1) = "@stu_pass"
                    Dim v(1) As String
                    v(0) = stu_mail.Text
                    v(1) = stu_pass.Text
                    ds = d.getdata(p, v, "select * from student_master where stu_mail=@stu_mail and stu_pass=@stu_pass")
                    If ds.Tables(0).Rows.Count > 0 Then
                        Label1.Text = ""
                        Session.Add("stu_mail", stu_mail.Text)
                        Session.Add("stu_name", ds.Tables(0).Rows(0).Item("stu_name"))
                        Session.Add("stu_pass", stu_pass.Text)
                        If Request.QueryString("link") <> "" Then
                            Dim link As String = Request.QueryString("link")
                            ds = d.getdata1("Select id from course_master where clink='" & link & "'")
                            Dim id As String = ds.Tables(0).Rows(0).Item(0)
                            ReDim p(4), v(4)
                            p = {"@course", "@mailID", "@name", "@role"}
                            v = {id, Session("stu_mail"), Session("stu_name"), "student"}
                            Dim qry As String = "insert into course_enrolled values(@course,@mailID,@name,@role)"
                            d.add(p, v, qry)
                            Response.Redirect("Course.aspx?link=" & link)
                        Else
                            Response.Redirect("stu_panel.aspx")
                        End If
                    Else
                        Label1.Text = "Invalid Username or Password"
                        stu_mail.Focus()
                    End If
                Else
                    stu_pass.BorderColor = Red
                    stu_pass.Focus()
                    Label1.Text = "Enter Password"
                End If
            Else
                stu_mail.BorderColor = Red
                stu_mail.Focus()
                Label1.Text = "Enter E-Mail"
            End If
        Catch ex As Exception
            Label1.Text &= ex.Message
        End Try
    End Sub
    Private Sub Admin_Side_login_Load(sender As Object, e As EventArgs) Handles Me.Load
        stu_mail.Focus()
        If Session("reg") Then
            lbl.Text = "Note : An email has been sent to your registered Email ID. Check Spam folder  if not found in inbox."
        Else
            lbl.Text = ""
        End If
    End Sub
End Class
