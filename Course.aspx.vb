
Partial Class Course
    Inherits System.Web.UI.Page
    Private Sub Course_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim d As New DAOClass
            Dim ds As Data.DataSet = d.getdata({"@link"}, {Request.QueryString("link")}, "Select id,cname from course_master where clink = @link")
            Dim courseID As Integer = ds.Tables(0).Rows(0).Item(0)
            Session.Add("cID", ds.Tables(0).Rows(0).Item(0))
            Session.Add("cname", ds.Tables(0).Rows(0).Item(1))
            ds = d.getdata({"@mail", "@courseID"}, {Session("stu_mail"), courseID}, "Select uRole from course_enrolled where uMail = @mail and cID = @courseID")
            Session.Add("UserRole", ds.Tables(0).Rows(0).Item(0))
        End If
        Course_Name.Text = Session("cname")
        If Session("UserRole") <> "Teacher" Then
            Dim Script As String = "var onlyTeacher = document.getElementsByClassName('teacher-only');for(let i = 0;i<onlyTeacher.length;i++){onlyTeacher[i].style.display = 'none';onlyTeacher[i].innerHTML = '';}"
            If Not Page.ClientScript.IsStartupScriptRegistered(Me.GetType(), "removeTeacherOnly") Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "removeTeacherOnly", Script, True)

            End If
        End If
    End Sub

    Private Sub stud_lst_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles stud_lst.ItemCommand
        If Session("UserRole") = "Teacher" Then
            Dim id As String = e.CommandArgument()
            If e.CommandName = "User_upgrade" Then
                StudentDataSource.UpdateParameters("enrollid").DefaultValue = id
                StudentDataSource.Update()
            ElseIf e.CommandName = "Remove_User" Then
                StudentDataSource.DeleteParameters("enrollid").DefaultValue = id
                StudentDataSource.Delete()
            End If
            StudentDataSource.DataBind()
            stud_lst.DataBind()
        End If
    End Sub

    Private Sub mat_lst_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles mat_lst.ItemCommand
        If e.CommandName = "downloadbtn" Then
            Dim fileName As String = e.CommandArgument
            Response.AddHeader("Content-Disposition", "attachment;filename=""" & fileName & """")
            Response.TransmitFile(Server.MapPath("~\files\materials\" & fileName))
            Response.[End]()
        End If
    End Sub
End Class
