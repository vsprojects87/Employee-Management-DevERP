using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Management_DevERP
{
    public partial class LoginOrRegister : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        SqlDataReader reader;
        string username, password = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelSignIn.Visible = true;
                PanelSignUp.Visible = false;
            }
        }

        protected void lbsignin_Click1(object sender, EventArgs e)
        {
            PanelSignIn.Visible = true;
            PanelSignUp.Visible = false;
        }

        protected void lbsignup_Click1(object sender, EventArgs e)
        {
            PanelSignIn.Visible = false;
            PanelSignUp.Visible = true;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                string query = @"insert into [User](Username,Password,Name,Address,Mobile,Email) values(@Username,@Password,@Name,@Address,@Mobile,@Email)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUsernameReg.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword2.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Register Successfully";
                    lblMessage.CssClass = "alert alert-success";
                    clear();
                }
                else
                {
                    lblSignUpMessage.Visible = true;
                    lblSignUpMessage.Text = "Cannot save record right now, please try after some time";
                    lblSignUpMessage.CssClass = "alert alert-danger";
                }
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblSignUpMessage.Visible = true;
                    lblSignUpMessage.Text = "<b>" + txtUsername.Text.Trim() + " </b> username already exist";
                    lblSignUpMessage.CssClass = "alert alert-danger";
                }
                else
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
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


        private void clear()
        {
            txtUsernameReg.Text = string.Empty;
            txtPassword2.Text = string.Empty;
            txtName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtConformPassword.Text = string.Empty;
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            try
            {

                username = ConfigurationManager.AppSettings["username"];
                password = ConfigurationManager.AppSettings["password"];
                if (username == txtUsername.Text.Trim() && password == txtPassword.Text.Trim())
                {
                    Session["admin"] = username;
                    Response.Redirect("../Admin/Dashboard.aspx", false);
                }
                else
                {
                    string query = @"Select * from [Employee] where Username=@Username and Password=@Password";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    con.Open();
                    reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["user"] = reader["Username"].ToString();
                        Session["userId"] = reader["UserId"].ToString();
                        Response.Redirect("../Employee/Profile.aspx", false);
                    }
                    else
                    {
                        Response.Write("<script>alert('User not found, Try again with Valid Credentials')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                con.Close();
            }
            finally
            {
                con.Close();
            }

        }

        
    }
}