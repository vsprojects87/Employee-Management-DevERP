<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Employee_Management_DevERP.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div>
            <h1>Hello Admin !</h1>
        </div>
        <div class="row m-5">
            <div class="col-md-4">


                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h4 class="card-title">Total Employees</h4>
                        <h1 class="p-4">
                            <asp:Label ID="lblEmp" runat="server" Text="0"></asp:Label></h1>
                        <a href="Add_Employee.aspx" class="card-link">Add Employee</a>
                        <a href="Employee_List.aspx" class="card-link">Manage</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">

                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h4 class="card-title">Total Departments</h4>
                        <h1 class="p-4">
                            <asp:Label ID="lblDept" runat="server" Text="0"></asp:Label>
                        </h1>
                        <a href="Department_List.aspx" class="card-link">Add Department</a>
                        <a href="Department_List.aspx" class="card-link">Manage</a>
                    </div>
                </div>
            </div>
        </div>
    </div>





</asp:Content>

