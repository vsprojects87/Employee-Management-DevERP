using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Management_DevERP
{
    public partial class EditEmployeeProfile : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
            }
        }

        private void FillData()
        {
            if (Request.QueryString["EmpId"] != null)
            {
                string query = "select * from Employee where EmpId='" + Request.QueryString["id"] + "' ";
                cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtName.Text = sdr["EmpName"].ToString();
                        txtPost.Text = sdr["EmpPost"].ToString();
                        ddlDept.SelectedValue = sdr["EmpDept"].ToString();
                        txtSalary.Text = sdr["EmpSalary"].ToString();
                        txtMobile.Text = sdr["EmpMobile"].ToString();
                        txtEmail.Text = sdr["EmpEmail"].ToString();
                        txtAnswer.Text = sdr["EmpAnswer"].ToString();
                        ddlQuestion.SelectedValue = sdr["EmpQuestion"].ToString();
                        txtPinCode.Text = sdr["EmpPinCode"].ToString();
                        txtAddress.Text = sdr["EmpAddress"].ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('No Data Found');</script>");
                }
                sdr.Close();
                con.Close();
            }
        }


    }
}