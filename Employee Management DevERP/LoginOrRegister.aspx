<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginOrRegister.aspx.cs" Inherits="Employee_Management_DevERP.LoginOrRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />


    <style>
        body {
            background-color: rgb(27 27 27);
        }

        .font-light {
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">


        <div class="container">

            <div class="block mt-5">


                <div class="row justify-content-center text-center mb-3">
                    <div class="col-md-6 col-lg-6 pb-2">
                        <asp:LinkButton ID="lbsignin" CssClass="btn btn-outline-dark btn-primary" runat="server" OnClick="lbsignin_Click">Sign In</asp:LinkButton>
                        <asp:LinkButton ID="lbsignup" CssClass="btn btn-outline-dark btn-warning" runat="server" OnClick="lbsignup_Click">Sign Up</asp:LinkButton>
                    </div>
                </div>

                <div class="row justify-content-center">

                    <asp:Panel ID="PanelSignIn" runat="server">
                        <%--sign in--%>
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
                    </asp:Panel>
                </div>

                <%--sign up--%>

                <div class="row justify-content-center">

                    <asp:Panel ID="PanelSignUp" runat="server">
                        <div class="col-md-3 col-lg-6 pb-0 mx-auto">

                            <div class="form-group mb-sm-2">
                                <label class="font-light" for="txtName">Full Name</label>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server" required></asp:TextBox>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 mb-sm-2">

                                    <div class="form-group">
                                        <label class="font-light" for="txtMobile">Mobile</label>
                                        <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-6 mb-sm-2">
                                    <div class="form-group">
                                        <label class="font-light" for="txtEmail">Email</label>
                                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>






                            <div class="row">

                                <div class="col-sm-6 mb-sm-2">
                                    <div class="form-group mb-sm-2">
                                        <label class="font-light" for="txtAddress">Address</label>
                                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="2" required></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-sm-6 mb-sm-2">

                                    <div class="form-group">
                                        <label class="font-light" for="txtPinCode">Pin Code</label>
                                        <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-6">

                                    <div class="form-group">
                                        <label class="font-light" for="txtPassword2">Password</label>
                                        <asp:TextBox ID="txtPassword2" CssClass="form-control" runat="server" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-6">

                                    <div class="form-group">
                                        <label class="font-light" for="txtConfirmPassword">Confirm Password</label>
                                        <asp:TextBox ID="txtConformPassword" CssClass="form-control" runat="server" required></asp:TextBox>
                                    </div>

                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="font-light" for="ddlQuestion">Security Question</label>
                                        <asp:DropDownList ID="ddlQuestion" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="">------ Choose Question ------</asp:ListItem>
                                            <asp:ListItem Value="0">What was your school name?</asp:ListItem>
                                            <asp:ListItem Value="1">What is your Favourite dish?</asp:ListItem>
                                            <asp:ListItem Value="2">Who is your best friend?</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="font-light" for="txtAnswer">Answer</label>
                                        <asp:TextBox ID="txtAnswer" CssClass="form-control" runat="server" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-info btn-primary-hover-outline" Text="Sign Up" OnClick="btnSignUp_Click" />
                            <asp:Label ID="lblSignUpMessage" runat="server" Text="hii" CssClass="m-5" ForeColor="Red"></asp:Label>

                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>



    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
