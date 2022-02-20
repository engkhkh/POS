using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pos.BL;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace Pos
{
    public partial class Login : System.Web.UI.Page
    {
        BL.cLogIn log = new cLogIn();
       
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

       

        protected void Button1_Click1(object sender, EventArgs e)
        {
         
           DataTable dt = new DataTable();
           
           dt = log.fnlogin(TextBox1.Text, TextBox2.Text);
            if (dt.Rows.Count > 0)
            {
                Session["username"] = dt.Rows[0][0].ToString();
                Session["usertype"] = dt.Rows[0][2].ToString();
                Session["grpcmp"] = dt.Rows[0][3].ToString();
                Session["cmp"] = dt.Rows[0][4].ToString();
               // Session["module"] = dt.Rows[0][5].ToString();

                if (Session["username"] != null && Session["usertype"].ToString() == "user" && Session["module"].ToString()=="Sales")
                {
                    Response.Redirect("~/PL/Invoices.aspx");
                }
                else if (Session["username"] != null && Session["usertype"].ToString() == "admin" && Session["module"].ToString() == "Sales")
                {
                    Response.Redirect("~/PL/Dashboard.aspx");

                }
                else if (Session["username"] != null && Session["usertype"].ToString() == "accountant" && Session["module"].ToString() == "Finance")
                {
                    Response.Redirect("~/Finance/PL/AddLevel.aspx");

                }
                else if (Session["username"] != null && Session["usertype"].ToString() == "HR"&& Session["module"].ToString()=="HR")
                {
                    Response.Redirect("~/Hr/PL/Employee.aspx");

                }
                else if (Session["username"] != null && Session["usertype"].ToString() == "WorkFlow" && Session["module"].ToString() == "WorkFlow")
                {
                    Response.Redirect("~/WorkFlow/PL/Approve.aspx");

                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
            ViewState["username"] = Session["username"];
            ViewState["grpcmp"] = Session["grpcmp"];
            ViewState["cmp"] = Session["cmp"];

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["module"] = DropDownList1.SelectedValue;
        }
}
}