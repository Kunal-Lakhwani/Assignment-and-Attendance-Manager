
Partial Class Attendance
    Inherits System.Web.UI.Page
    Protected Sub stu_status_Click(sender As Object, e As EventArgs)
        Dim btn As Button = sender
        Dim row As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim lbl As Label = row.FindControl("Status")
        If btn.Text = "Present" Then
            btn.Text = "Absent"
            lbl.Text = "Absent"
        ElseIf btn.Text = "Absent" Then
            btn.Text = "Present"
            lbl.Text = "Present"
        End If
    End Sub

    Private Sub User_Side_Attendance_Load(sender As Object, e As EventArgs) Handles Me.Load
        attntbl.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub
End Class
