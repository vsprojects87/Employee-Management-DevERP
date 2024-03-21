<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Add_Department.aspx.cs" Inherits="Employee_Management_DevERP.Admin.Add_Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-4  pb-4">

        <div class="row mr-lg-5 ml-lg-5 mb-3">

            <div class="col-md-6 pt-3">
                <asp:Label for="ddlDept" runat="server" Style="font-weight: 600">Department</asp:Label>
                <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control" required>
                    <asp:ListItem Value="0">--- Choose Department ---</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Production</asp:ListItem>
                    <asp:ListItem>Marketing</asp:ListItem>
                    <asp:ListItem>Research</asp:ListItem>
                    <asp:ListItem>Customer Service</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-6 pt-3">
                <asp:Label for="txtPost" runat="server" Style=" font-weight: 600">Post</asp:Label>
                <asp:TextBox ID="txtPost" runat="server" CssClass="form-control" placeholder="Enter the Post" required></asp:TextBox>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <asp:Label for="txtSalary" runat="server" Style="font-weight: 600">Salary</asp:Label>
                <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="Enter the Salary for Post" TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <%--button--%>
        <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" Text="Add" OnClick="btnAdd_Click" BackColor="#7200cf" />
            </div>
        </div>
    </div>

</asp:Content>
