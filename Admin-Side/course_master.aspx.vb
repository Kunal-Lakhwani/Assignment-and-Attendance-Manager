Imports System.Web.Services
Imports System.Data.SqlClient
Partial Class Admin_Side_course_master
    Inherits System.Web.UI.Page
    <WebMethod()>
    Public Shared Sub SaveDataCourse(cname As String, ccode As String, cdesc As String, csem As String, ByVal cimg As String)
        Dim d As New DAOClass
        Dim link As String = CType(Hex(CType(d.gen_link(), Int64)), String)
        Dim c As New SqlConnection("Data Source=103.212.121.67;Initial Catalog=Data_student;Persist Security Info=True;User ID=data_student;Password=Student@4050")
        Dim file As String = "~/images/course_img/" & cimg
        Dim cmd As New SqlCommand("insert into course_master values('" & cname & "','" & ccode & "','" & cdesc & "','" & csem & "','" & file & "','" & link & "')", c)
        c.Open()
        cmd.ExecuteNonQuery()
        c.Close()
    End Sub
    Private Sub Admin_Side_course_master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim d As New DAOClass
            Dim c As New SqlConnection("Data Source=103.212.121.67;Initial Catalog=Data_student;Persist Security Info=True;User ID=data_student;Password=Student@4050")
            Dim ds As New Data.DataSet
            Dim da As New SqlDataAdapter("select ccode,cname from course_master", c)
            c.Open()
            da.SelectCommand.ExecuteReader()
            c.Close()
            da.Fill(ds)
            links.DataSource = ds.Tables(0)
            links.DataValueField = "ccode"
            links.DataTextField = "cname"
            links.DataBind()
        End If
    End Sub
    Private Sub btn_link_Click(sender As Object, e As EventArgs) Handles btn_link.Click
        Dim c As New SqlConnection("Data Source=103.212.121.67;Initial Catalog=Data_student;Persist Security Info=True;User ID=data_student;Password=Student@4050")
        Dim cmd As New SqlCommand("select clink from course_master where ccode=" & links.SelectedValue, c)
        Dim ds As SqlDataReader
        c.Open()
        ds = cmd.ExecuteReader()
        While ds.Read
            txt_link.Text = "http://localhost:57924/login.aspx?link=" & ds.Item(0)
        End While
        c.Close()
    End Sub
    <WebMethod()>
    Public Shared Function lnk(sub_link As String) As String
        Dim c As New SqlConnection("Data Source=103.212.121.67;Initial Catalog=Data_student;Persist Security Info=True;User ID=data_student;Password=Student@4050")
        Dim cmd As New SqlCommand("select clink from course_master where ccode=" & sub_link, c)
        Dim ds As SqlDataReader
        Dim link As String = ""
        c.Open()
        ds = cmd.ExecuteReader()
        While ds.Read
            link = "http://localhost:57924/login.aspx?link=" & ds.Item(0)
        End While
        c.Close()
        Return link
    End Function
End Class