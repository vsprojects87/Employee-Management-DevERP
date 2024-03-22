using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Management_DevERP.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("~/LoginOrRegister.aspx");
            }
        }

        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginOrRegister.aspx");
            Session.Abandon();
        }
    }
}