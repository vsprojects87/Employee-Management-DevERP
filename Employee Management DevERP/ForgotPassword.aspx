<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Employee_Management_DevERP.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
              
                <div class="row justify-content-center">

                        <div class="col-md-3 col-sm-6 col-lg-3 mx-auto">

                            <div class="form-group mb-sm-3">
                                <label class="font-light" for="txtEmpId">Employee Id</label>
                                <asp:TextBox ID="txtEmpId" CssClass="form-control" runat="server" required></asp:TextBox>
                            </div>
                            <div class="form-group mb-sm-3">
                                <label class="font-light" for="txtPassword">Password</label>
                                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" required></asp:TextBox>
                            </div>

                            <asp:Button ID="btnLogIn" runat="server" CssClass="btn btn-info btn-primary-hover-outline" Text="Sign In" OnClick="btnLogIn_Click" />

                            <asp:LinkButton ID="lbForgotPass" runat="server" CssClass="m-4 mb-5">Forgot Password</asp:LinkButton>

                            <asp:Label runat="server" CssClass="ml-5 mt-4" Visible="false" Text="" ID="lblMessage"></asp:Label>
                        </div>
                </div>

        
        </div>
    </form>
</body>
</html>
