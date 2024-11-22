
Partial Class Admin_Side_student_register
    Inherits System.Web.UI.Page
    Private Sub reg_Click(sender As Object, e As EventArgs) Handles reg.Click
        Dim d As New DAOClass
        Dim msg As String = "Hello Student :), Your password is "
        Dim p(3) As String
        p(0) = "@stu_mail"
        p(1) = "@stu_name"
        p(2) = "@stu_enroll"
        p(3) = "@stu_pass"
        Dim v(3) As String
        v(0) = stu_mail.Text
        v(1) = stu_name.Text
        v(2) = stu_enroll.Text
        v(3) = d.gen_pwd()
        msg &= v(3)
        d.add(p, v, "insert into student_master (stu_mail,stu_name,stu_enroll,stu_pass) values (@stu_mail,@stu_name,@stu_enroll,@stu_pass)")
        Session("reg") = True
        d.send(stu_mail.Text, "Account Varification", msg)
        Response.Redirect("student_login.aspx")
    End Sub
    Private Sub student_registration_Load(sender As Object, e As EventArgs) Handles Me.Load
        stu_name.Focus()
    End Sub
End Class
