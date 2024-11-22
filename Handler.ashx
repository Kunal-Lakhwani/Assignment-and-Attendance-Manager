<%@ WebHandler Language="VB" Class="Handler" %>
Imports System.IO
Imports System.Net
Imports System.Web
Imports System.Web.Script.Serialization
Imports System.Web.Services
Public Class Handler : Implements IHttpHandler
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Try
            'Check if Request is to Upload the File.
            If context.Request.Files.Count > 0 Then
                'Fetch the Uploaded File.
                Dim files As HttpFileCollection = context.Request.Files
                Dim postedFile As HttpPostedFile = files(0)
                'Set the Folder Path.
                Dim folderPath As String = context.Server.MapPath("images/course_img/" & postedFile.FileName)
                'Save the File in Folder.
                postedFile.SaveAs(folderPath)
                context.Response.ContentType = "text/plain"
                Dim f As String = postedFile.FileName
                context.Response.Write(f)
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property
End Class