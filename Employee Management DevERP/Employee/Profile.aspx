﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Emp.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Employee_Management_DevERP.Employee.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .card {
            border: 1px solid gray;
            margin: 5%;
        }

        span {
            margin: 15px;
        }
    </style>


    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Vertical">
        <ItemTemplate>

            <div class="card w-100">
                <asp:Image ID="Image1" runat="server" CssClass="card-img-top img-fluid" alt="Employee Image" ImageUrl="~/SiteData/Imgs/ImageUrl="~/SiteData/Imgs/<%# Eval("EmpPhoto") %>"/>

                <div class="card-body">
                    <h5 class="card-title"><%# Eval("EmpName") %></h5>
                    <table class="table">
                        <tr>
                            <td>
                                <label>Post :</label><span class="card-text"><%# Eval("EmpPost") %></span>
                            </td>
                            <td>
                                <label>Department :</label><span class="card-text"><%# Eval("EmpDept") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Mobile Number :</label><span class="card-text"><%# Eval("EmpMobile") %></span>
                            </td>
                            <td>
                                <label>Pin Code :</label><span class="card-text"><%# Eval("EmpPinCode") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label>Address :</label><span class="card-text"><%# Eval("EmpAddress") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
    <label>Email :</label><span class="card-text"><%# Eval("EmpEmail") %></span>
</td>
<td>
    <label>Joined Date :</label><span class="card-text"><%# Eval("EmpJoinDate") %>
</td>
</span>
                        </tr>
                    </table>
                    <a href="#" class="btn btn-primary">Update Profile</a>
                </div>
            </div>

        </ItemTemplate>
    </asp:DataList>


</asp:Content>
