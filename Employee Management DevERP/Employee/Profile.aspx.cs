using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Management_DevERP.Employee
{
    public partial class Profile : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        string EmployeeName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpId"] == null)
            {
                Response.Redirect("~/LoginOrRegister.aspx");
            }
            bindDatalist();
        }

        private void bindDatalist()
        {
            SqlDataAdapter adp = new SqlDataAdapter("Select * from Employee where EmpId=" + Session["EmpId"].ToString(), con);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();

            // Find the label control on the master page and modify its text property
            Label labelOnMasterPage = this.Master.FindControl("lblName") as Label;
            if (labelOnMasterPage != null)
            {
                labelOnMasterPage.Text = dt.Rows[0]["EmpName"].ToString(); ;
            }

        }
    }
}