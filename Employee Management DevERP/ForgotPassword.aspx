<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Employee_Management_DevERP.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="margin-top: 30vh">

            <div class="row justify-content-center">

                <div class="col-md-3 col-sm-6 col-lg-3 mx-auto">

                    <div class="form-group mb-sm-3">
                        <label class="font-light" for="txtEmpId">Employee Id</label>
                        <asp:TextBox ID="txtEmpId" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                    <div class="form-group mb-sm-3">
                        <label class="font-light" for="ddlQUe">Security Question</label>
                        <asp:DropDownList ID="ddlQuestion" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">------ Choose Question ------</asp:ListItem>
                            <asp:ListItem>What was your school name?</asp:ListItem>
                            <asp:ListItem>What is your Favourite dish?</asp:ListItem>
                            <asp:ListItem>Who is your best friend?</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group mb-sm-3">
                        <label class="font-light" for="txtAnswer">Answer</label>
                        <asp:TextBox ID="txtAnswer" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>

                    <asp:Button ID="btnChangePassword" runat="server" CssClass="btn btn-info btn-primary-hover-outline" Text="Get Password" OnClick="btnChangePassword_Click"/>

                    <asp:Label runat="server" CssClass="ml-5 mt-4 d-block" Visible="false" Text="" ID="lblGetPass"></asp:Label>
                </div>
            </div>


        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
