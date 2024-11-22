<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="repaat.aspx.vb" Inherits="Admin_Side_repaat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .in {
            display: inline-block;
            vertical-align: top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content-wrapper">
        <asp:Repeater runat="server" ID="r1" DataSourceID="SqlDataSource1">
            <ItemTemplate>

                <div class="row">
                    <div class="container-fluid">
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-info">
                                          <div class="inner">
                                    <h3><%# Eval("ccode ") %></h3>
                                    <p><%# Eval("cname") %></p>
                                </div>
                                <div class="icon">
                                    <asp:Image ImageUrl='<%# Eval("cimg") %>' runat="server" Height="50px" Width="50px"></asp:Image>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                </div>
                </div>
                </div>
         
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT * FROM [course_master] ORDER BY [ccode] DESC"></asp:SqlDataSource>
    </div>
</asp:Content>
