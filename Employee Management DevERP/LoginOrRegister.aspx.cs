﻿using System;
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

      protected void lbsignin_Click(object sender, EventArgs e)
        {
            clear();
            PanelSignIn.Visible = true;
            PanelSignUp.Visible = false;
        }

        protected void lbsignup_Click(object sender, EventArgs e)
        {
            clear();
            PanelSignIn.Visible = false;
            PanelSignUp.Visible = true;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                cmd = new SqlCommand("InsertEmployee", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmpName", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpMobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpAddress", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpEmail", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpPinCode", txtPinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpPassword", txtPassword2.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpQuestion", ddlQuestion.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@EmpAnswer", txtAnswer.Text.Trim());
                DateTime currentDate = DateTime.Today;
                cmd.Parameters.AddWithValue("@EmpJoinDate", currentDate);

                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    clear();
                    PanelSignUp.Visible=false;
                    PanelSignIn.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Somthing Went Wrong, Try after some time');</script>");
                }
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    Response.Write("<script>alert('Employee Already Exists');</script>");
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
            txtEmpId.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtEmpId.Text = string.Empty;
            txtPassword2.Text = string.Empty;
            txtName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtConformPassword.Text = string.Empty;
        }

        protected void lbForgotPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ForgotPassword.aspx");
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            try
            {

                username = ConfigurationManager.AppSettings["username"];
                password = ConfigurationManager.AppSettings["password"];
                if (username == txtEmpId.Text.Trim() && password == txtPassword.Text.Trim())
                {
                    Session["admin"] = username;
                    Response.Redirect("~/Admin/Dashboard.aspx", false);
                }
                else
                {
                    string query = @"Select * from [Employee] where EmpId=@EmpId and EmpPassword=@EmpPassword";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@EmpId", txtEmpId.Text.Trim());
                    cmd.Parameters.AddWithValue("@EmpPassword", txtPassword.Text.Trim());
                    con.Open();
                    reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["EmpName"] = reader["EmpName"].ToString();
                        Session["EmpId"] = reader["EmpId"].ToString();
                        Response.Redirect("~/Employee/Profile.aspx", false);
                        clear();
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