﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Management_DevERP.Employee
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/LoginOrRegister.aspx");
        }
    }
}