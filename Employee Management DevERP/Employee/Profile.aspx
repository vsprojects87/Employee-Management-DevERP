﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Emp.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Employee_Management_DevERP.Employee.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .card{
            border:1px solid gray;
            margin:5%;
        }
    </style>

    <div class="card">
        <img class="card-img-top img-fluid" style="width:12em" src="../SiteData/Imgs/scenery_5423377.png" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
    </div>

</asp:Content>