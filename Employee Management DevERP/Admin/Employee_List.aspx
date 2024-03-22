<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Employee_List.aspx.cs" Inherits="Employee_Management_DevERP.Admin.Employee_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h3 class="text-center">Job List</h3>

    <div class="row mb-3 pt-sm-3">
        <div class="col-md-12">

            <asp:GridView ID="gvEmployee" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Records to Display..!" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" DataKeyNames="EmpId" OnRowDeleting="gvEmployee_RowDeleting" OnPageIndexChanging="gvEmployee_PageIndexChanging">

<%--                OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound"--%>

                <Columns>

                    <asp:BoundField DataField="EmpId" HeaderText="Employee Id">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="EmpName" HeaderText="Name">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="EmpPost" HeaderText="Post">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="EmpDept" HeaderText="Department">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="EmpSalary" HeaderText="Salary">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>


                    <asp:BoundField DataField="EmpMobile" HeaderText="Contact">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="EmpAddress" HeaderText="Address">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="EmpPinCode" HeaderText="Pin Code">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="EmpPassword" HeaderText="Password">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="EmpQuestion" HeaderText="Security Question" ItemStyle-Width="100px">
                        <ItemStyle HorizontalAlign="Center" ></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="EmpAnswer" HeaderText="Answer">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="EmpJoinDate" HeaderText="Joined Date" DataFormatString="{0:dd MMMM yyyy}">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                   

                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="EditEmployee" CommandArgument='<%#Eval("EmpId") %>'>Edit</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>

                    <asp:CommandField CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true" DeleteText="Remove">
                        <ControlStyle Height="25px" Width="55px"></ControlStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:CommandField>

                </Columns>
                <HeaderStyle BackColor="#7200cf" ForeColor="White" />

            </asp:GridView>


        </div>
    </div>



</asp:Content>
