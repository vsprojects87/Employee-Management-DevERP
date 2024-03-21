using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Management_DevERP.Admin
{
    public partial class Add_Department : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string query = @"insert into [Department](Department,Post,Salary) values(@Department,@Post,@Salary)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Department", ddlDept.SelectedValue);
                cmd.Parameters.AddWithValue("@Post", txtPost.Text.Trim());
                cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    Response.Write("<script>alert('Department Added Successfully !');</script>");
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
                clear();
            }
        }

        private void clear()
        {
            ddlDept.SelectedIndex = 0;
            txtSalary.Text = string.Empty;
            txtPost.Text = string.Empty;
        }
    }
}