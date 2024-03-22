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
    public partial class Dashboard : System.Web.UI.Page
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
            bindLabels();
        }

        private void bindLabels()
        {
            con.Open();
            cmd = new SqlCommand("select COUNT(*) from Employee", con);
            int te = (int)cmd.ExecuteScalar();
            lblEmp.Text=te.ToString();

            cmd = new SqlCommand("select COUNT(*) from Department", con);
            int td = (int)cmd.ExecuteScalar();
            lblDept.Text = td.ToString();
            con.Close();
        }
    }
}