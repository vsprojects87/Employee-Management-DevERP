<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Add_Employee.aspx.cs" Inherits="Employee_Management_DevERP.Admin.Add_Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-4  pb-4">
        <%--<div>
                <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
            </div>--%>
        <div class="btn-toolbar justify-content-between mb-3">
            <div class="btn-group">
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
            <div class="input-group h-25">
                <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/Employee_List.aspx" CssClass="btn btn-secondary" Visible="true">< Back</asp:HyperLink>
            </div>
        </div>


        <h3 class="text-center">Add Employee</h3>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="false" DisplayMode="List" />

        <div class="row mr-lg-5 ml-lg-5 mb-3">

            <div class="col-md-6 pt-3">
                <asp:Label for="txtName" runat="server" Style="font-weight: 600">Employee Name</asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Required" ControlToValidate="txtName" ForeColor="red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6 pt-3">
                <asp:Label for="txtMobile" runat="server" Style="font-weight: 600">Employee Contact Number</asp:Label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number" TextMode="Number" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Mobile Number Required" ControlToValidate="txtMobile" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Mobile Number Must be 10 digits" ControlToValidate="txtMobile" MinimumValue="7" MaximumValue="7" ForeColor="red"></asp:RangeValidator>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-12 pt-3">
                <asp:Label for="txtAddress" runat="server" Style="font-weight: 600">Address</asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Location" TextMode="MultiLine" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Address Required" ControlToValidate="txtAddress" ForeColor="red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <asp:Label for="txtPinCode" runat="server" Style="font-weight: 600">Pin Code</asp:Label>
                <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control" placeholder="Enter Pin Code" TextMode="Number" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Pin Code Required" ControlToValidate="txtPinCode" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Pin Must be 7 digits" ControlToValidate="txtPinCode" MinimumValue="7" MaximumValue="7" ForeColor="red"></asp:RangeValidator>
            </div>

            <div class="col-md-6 pt-3">
                <asp:Label for="fuEmployeePic" runat="server" Style="font-weight: 600">Employee Picture</asp:Label>
                <asp:FileUpload ID="fuEmployeePic" runat="server" CssClass="form-control" ToolTip=".jpg, .jpeg, .png" />
            </div>
        </div>


        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <asp:Label for="ddlDept" runat="server" Style="font-weight: 600">Department</asp:Label>
                <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control" required>
                    <asp:ListItem Value="" Text="Choose Department" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Department Required" ControlToValidate="ddlDept" ForeColor="red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6 pt-3">
                <asp:Label for="txtPost" runat="server" Style="font-weight: 600">Post</asp:Label>
                <asp:TextBox ID="txtPost" runat="server" CssClass="form-control" placeholder="Employee Post" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Post Required" ControlToValidate="txtPost" ForeColor="red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <asp:Label for="txtSalary" runat="server" Style="font-weight: 600">Salary</asp:Label>
                <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="Employee Salary" TextMode="Number" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Salary Details Required" ControlToValidate="txtSalary" ForeColor="red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6 pt-3">
                <asp:Label for="txtEmail" runat="server" Style="font-weight: 600">Email</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Employee Email" TextMode="Email" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail" ForeColor="red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <asp:Label for="txtPassword" runat="server" Style="font-weight: 600">Password</asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword" ForeColor="red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6 pt-3">
                <asp:Label for="txtConfirmPass" runat="server" Style="font-weight: 600">Confirm Password</asp:Label>
                <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Confirm Password Required" ControlToValidate="txtConfirmPass" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtConfirmPass" ControlToCompare="txtPassword" ErrorMessage="Password Doesn't Match" ForeColor="red"></asp:CompareValidator>
            </div>
        </div>


        <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
                <asp:Label for="ddlQuestion" runat="server" Style="font-weight: 600">Security Question</asp:Label>
                <asp:DropDownList ID="ddlQuestion" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">------ Choose Question ------</asp:ListItem>
                    <asp:ListItem>What was your school name?</asp:ListItem>
                    <asp:ListItem>What is your Favourite dish?</asp:ListItem>
                    <asp:ListItem>Who is your best friend?</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Select the Question" ControlToValidate="ddlQuestion" ForeColor="red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6 pt-3">
                <asp:Label for="txtAnswer" runat="server" Style="font-weight: 600">Answer</asp:Label>
                <asp:TextBox ID="txtAnswer" runat="server" CssClass="form-control" placeholder="Enter answer" required></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Answer required" ControlToValidate="txtAnswer" ForeColor="red"></asp:RequiredFieldValidator>
            </div>
        </div>

    </div>

    <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4 justify-content-center">
        <div class="col-md-3 col-md-offset-2 mb-3">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" Text="Add Employee" OnClick="btnAdd_Click" BackColor="#7200cf" Width="200px" />
        </div>
    </div>

</asp:Content>
