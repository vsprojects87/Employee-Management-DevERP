using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Employee_Management_DevERP
{
    public partial class EditEmployeeProfile : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpId"] == null)
            {
                Response.Redirect("~/LoginOrRegister.aspx");
            }
            if (!IsPostBack)
            {
                FillData();
            }
            bindddldept();

        }

        private void bindddldept()
        {
            SqlDataAdapter adpdept = new SqlDataAdapter("select Distinct(Departments) from [Department]", con);
            DataTable dt = new DataTable();
            adpdept.Fill(dt);
            ddlDept.DataSource = dt;
            ddlDept.DataValueField = "Departments";
            ddlDept.DataTextField = "Departments";
            ddlDept.DataBind();
        }

        private void FillData()
        {
            if (Session["EmpId"] != null)
            {
                cmd = new SqlCommand("Select * from Employee where EmpId=@EmpId", con);
                cmd.Parameters.AddWithValue("@EmpId", Session["EmpId"]);
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                cmd = new SqlCommand("UpdateEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
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
                cmd.Parameters.AddWithValue("@EmpId", Session["EmpId"]);
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
                            string savePath = Path.Combine(physicalPath, Path.GetFileName(selectedFile.FileName));

                            selectedFile.SaveAs(savePath);
                            string imageName = selectedFile.FileName;
                            cmd.Parameters.AddWithValue("@EmpPhoto", imageName);
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
                    clear();
                    Response.Redirect("~/Employee/Profile.aspx");
                    Response.Write("<script>alert('Updated Successfully')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Cannot Update Right Now, Try again Later !')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
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
            ddlDept.ClearSelection();
            ddlQuestion.ClearSelection();
            txtPinCode.Text = string.Empty;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Employee/Profile.aspx");
        }
    }
}