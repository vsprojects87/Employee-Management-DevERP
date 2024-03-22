using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Management_DevERP.Admin
{
    public partial class Department_List : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("~/LoginOrRegister.aspx");
            }
            showDept();
        }

        private void showDept()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Department", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gvDept.DataSource = dt;
            gvDept.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = new SqlCommand("select Departments from Department where Departments='" + ddlDept.SelectedValue + "'  ", con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                Response.Write("<script>alert('Department Already Exists !');</script>");
                con.Close();
            }
            else
            {
                reader.Close();
                try
                {
                    string query = @"insert into [Department](Departments) values(@Departments)";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Departments", ddlDept.SelectedValue);
                    int r = cmd.ExecuteNonQuery();
                    if (r > 0)
                    {
                        Response.Write("<script>alert('Department Added Successfully !');</script>");
                        ddlDept.SelectedIndex = 0;
                        showDept();
                    }
                    else
                    {
                        Response.Write("<script>alert('Try Again Later');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void gvDept_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = gvDept.Rows[e.RowIndex];
                int deptId = Convert.ToInt32(gvDept.DataKeys[e.RowIndex].Values[0]);
                cmd = new SqlCommand("Delete from Department where DepartmentId=@DepartmentId", con);
                cmd.Parameters.AddWithValue("@DepartmentId", deptId);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    Response.Write("<script>alert('Employee Removed Successfully !');</script>");

                }
                else
                {
                    Response.Write("<script>alert('No Record Found !');</script>");
                }
                con.Close();
                gvDept.EditIndex = -1;
                showDept();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }

        }
    }
}