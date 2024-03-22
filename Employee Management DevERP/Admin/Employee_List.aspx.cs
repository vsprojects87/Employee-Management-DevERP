using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Employee_Management_DevERP.Admin
{
    public partial class Employee_List : System.Web.UI.Page
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
            showEmployees();
        }

        private void showEmployees()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from Employee",con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gvEmployee.DataSource = dt;
            gvEmployee.DataBind();
        }

        protected void gvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = gvEmployee.Rows[e.RowIndex];
                int empId = Convert.ToInt32(gvEmployee.DataKeys[e.RowIndex].Values[0]);
                cmd = new SqlCommand("Delete from Employee where EmpId=@empId", con);
                cmd.Parameters.AddWithValue("@empId", empId);
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
                gvEmployee.EditIndex = -1;
                showEmployees();
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

        protected void gvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEmployee.PageIndex = e.NewPageIndex;
            showEmployees();
        }
    }
}