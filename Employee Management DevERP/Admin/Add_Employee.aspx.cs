using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Management_DevERP.Admin
{
    public partial class Add_Employee : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        SqlDataReader reader;
        DataTable dt;
        SqlDataAdapter adpdept, adppost;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("~/LoginOrRegister.aspx");
            }
            bindddldept();
        }

        private void bindddldept()
        {
            adpdept = new SqlDataAdapter("select Distinct(Departments) from [Department]", con);
            dt = new DataTable();
            adpdept.Fill(dt);
            ddlDept.DataSource = dt;
            ddlDept.DataValueField = "Departments";
            ddlDept.DataTextField = "Departments";
            ddlDept.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "insert into " +
                    "Employee(EmpName,EmpMobile,EmpAddress,EmpSalary,EmpPost,EmpDept,EmpEmail," +
                    "EmpPinCode,EmpPassword,EmpQuestion,EmpAnswer,EmpPhoto,EmpJoinDate) " +
                    "values(@EmpName,@EmpMobile,@EmpAddress,@EmpSalary,@EmpPost,@EmpDept,@EmpEmail," +
                    "@EmpPinCode,@EmpPassword,@EmpQuestion,@EmpAnswer,@EmpPhoto,@EmpJoinDate)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpName", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpMobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpAddress", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpEmail", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpPinCode", txtPinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpPassword", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpQuestion", ddlQuestion.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@EmpAnswer", txtAnswer.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpDept", ddlDept.SelectedValue);
                cmd.Parameters.AddWithValue("@EmpPost", txtPost.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpSalary", txtSalary.Text.Trim());
                DateTime currentDate = DateTime.Today;
                cmd.Parameters.AddWithValue("@EmpJoinDate", currentDate);

                if (fuEmployeePic.HasFile)
                {
                    HttpPostedFile selectedFile = fuEmployeePic.PostedFile;
                    string contentType = selectedFile.ContentType;
                    if (contentType == "image/jpeg" || contentType == "image/png")
                    {
                        if (selectedFile.ContentLength <= 524288)
                        {
                            string physicalPath = Server.MapPath("~/SiteData/Imgs");
                            if (!Directory.Exists(physicalPath))
                            {
                                Directory.CreateDirectory(physicalPath);
                            }
                            selectedFile.SaveAs(physicalPath + selectedFile.FileName);
                            cmd.Parameters.AddWithValue("@EmpPhoto", physicalPath);
                        }
                        else
                        {
                            Response.Write("<script>alert('Please select file less than 512 KB')</script>");
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('Please select image file only')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please select a file')</script>");
                }

                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Register Successfully";
                    lblMsg.CssClass = "alert alert-success";
                    clear();
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Cannot save record right now, please try after some time";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"')</script>");
            }
            finally
            {
                con.Close();
            }
        }

        private void clear()
        {
            txtName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtConfirmPass.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtPost.Text = string.Empty;
            txtSalary.Text = string.Empty;
            ddlDept.SelectedIndex = 0;
        }
    }
}