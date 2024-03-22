<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEmployeeProfile.aspx.cs" Inherits="Employee_Management_DevERP.EditEmployeeProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">

            <h3 class="text-center mt-4">Update Employee</h3>
            <div class="row mb-3">

                <div class="col-md-6 pt-3">
                    <asp:Label for="txtName" runat="server" Style="font-weight: 600">Employee Name</asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name" required></asp:TextBox>
                </div>
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtMobile" runat="server" Style="font-weight: 600">Employee Contact Number</asp:Label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number" TextMode="Number" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <asp:Label for="txtAddress" runat="server" Style="font-weight: 600">Address</asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Location" TextMode="MultiLine" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtPinCode" runat="server" Style="font-weight: 600">Pin Code</asp:Label>
                    <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control" placeholder="Enter Pin Code" TextMode="Number" required></asp:TextBox>
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
                        <asp:ListItem Value="">--- Choose Department ---</asp:ListItem>
                    </asp:DropDownList><asp:SqlDataSource runat="server" ID="SqlDataSource1"></asp:SqlDataSource>
                </div>
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtPost" runat="server" Style="font-weight: 600">Post</asp:Label>
                    <asp:TextBox ID="txtPost" runat="server" CssClass="form-control" placeholder="Employee Post" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtSalary" runat="server" Style="font-weight: 600">Salary</asp:Label>
                    <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="Employee Salary" TextMode="Number" required></asp:TextBox>
                </div>
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtEmail" runat="server" Style="font-weight: 600">Email</asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Employee Email" TextMode="Email" required></asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtPassword" runat="server" Style="font-weight: 600">Password</asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                </div>
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtConfirmPass" runat="server" Style="font-weight: 600">Confirm Password</asp:Label>
                    <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
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
                </div>
                <div class="col-md-6 pt-3">
                    <asp:Label for="txtAnswer" runat="server" Style="font-weight: 600">Answer</asp:Label>
                    <asp:TextBox ID="txtAnswer" runat="server" CssClass="form-control" placeholder="Enter answer" required></asp:TextBox>
                </div>
            </div>

        </div>

        <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4 justify-content-center">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" Text="Add Employee" BackColor="#7200cf" Width="200px" />
            </div>
        </div>

    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
