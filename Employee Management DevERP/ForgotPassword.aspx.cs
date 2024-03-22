using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Management_DevERP
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string query = @"Select EmpPassword from [Employee] where EmpId=@EmpId and EmpAnswer=@EmpAnswer";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@EmpId", txtEmpId.Text.Trim());
            cmd.Parameters.AddWithValue("@EmpAnswer", txtAnswer.Text.Trim());
            con.Open();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblGetPass.Visible = true;
                 lblGetPass.Text = "Password : " + reader["EmpPassword"].ToString();
                clear();
            }
            else
            {
                Response.Write("<script>alert('Wrong Answer, Try again with Valid Details')</script>");
            }
        }

        private void clear()
        {
            txtAnswer.Text = string.Empty;
            txtEmpId.Text = string.Empty;
            ddlQuestion.SelectedIndex = 0;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginOrRegister.aspx");
        }
    }
}