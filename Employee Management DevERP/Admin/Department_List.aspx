<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Department_List.aspx.cs" Inherits="Employee_Management_DevERP.Admin.Department_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-4  pb-4">

        <h3 class="text-center">Departments</h3>

        <div class="add-dept">

            <div class="row mr-lg-5 ml-lg-5 mb-3">

                <div class="col-md-6 pt-3">
                    <asp:Label for="ddlDept" runat="server" Style="font-weight: 600">Department</asp:Label>
                    <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control" required>
                        <asp:ListItem Value="" Selected="False">--- Choose Department ---</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Production</asp:ListItem>
                        <asp:ListItem>Marketing</asp:ListItem>
                        <asp:ListItem>Research</asp:ListItem>
                        <asp:ListItem>Customer Service</asp:ListItem>
                        <asp:ListItem>AdveriseMent</asp:ListItem>
                        <asp:ListItem>HR</asp:ListItem>
                        <asp:ListItem>Finance</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select the Department" ControlToValidate="ddlDept" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

            </div>

            <%--button--%>
            <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" Text="Add" OnClick="btnAdd_Click" BackColor="#7200cf" />
                </div>
            </div>

        </div>

        <%--Dept List--%>
        <div class="row mb-3 pt-sm-3">
            <div class="col-md-12">

                <asp:GridView ID="gvDept" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Records to Display..!" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" DataKeyNames="DepartmentId" OnRowDeleting="gvDept_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="DepartmentId" HeaderText="Id">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="Departments" HeaderText="Departments">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>


                        <asp:CommandField CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true">
                            <ControlStyle Height="25px" Width="25px"></ControlStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:CommandField>

                    </Columns>
                    <HeaderStyle BackColor="#7200cf" ForeColor="White" HorizontalAlign="Center" />

                </asp:GridView>


            </div>
        </div>

    </div>




</asp:Content>
