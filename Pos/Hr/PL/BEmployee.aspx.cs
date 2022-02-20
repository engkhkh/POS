using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.Hr.PL
{
    public partial class BEmployee : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        DataTable dt6 = new DataTable();
        Pos.BL.cProduct p = new BL.cProduct();
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlDataAdapter adapter3 = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }


                dt = p.fnreadcompany();
                if (dt.Rows.Count > 0)
                {
                    // Session["cmp"] = dt.Rows[0][0].ToString();
                    Session["grpcmp"] = dt.Rows[0][3].ToString();
                    //ddlcompch.DataSource = dt;
                    //ddlcompch.DataTextField = "cCompName";
                    //ddlcompch.DataValueField = "cCompany";
                    //ddlcompch.DataBind();
                    ///
                    //TextBoxpdqty.Text = "1.0";
                    //TextBoxpdremaining.Text = "0.0";
                    //TextBoxpdsaleditem.Text = "1.0";
                    //TextBoxpdnew.Text = "0.0";
                    //TextBoxpdprice.Text = "0.0";
                    //TextBoxpdcost.Text = "0.0";
                    //TextBoxpdTOPIC.Text = "";
                    //TextBoxpid.Text = "";
                    //TextBoxpdname.Text = "";

                    ////


                }
                Bind();


            }
        }

        private void Bind()
        {
            da = new SqlDataAdapter("select * from Hr001 where cGrpCompany='" + Session["grpcmp"].ToString() + "' order by cEmpId asc ", sqlcon);
            da.Fill(dt2);
            GridView1.DataSource = dt2;
            GridView1.DataBind();
        }
        protected void Gridview1_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
             //   DownloadFile(e.CommandArgument.ToString());
                Response.Write("<script>");
                Response.Write("window.open('../../Hr/PL/Employee.aspx','_blank')");
                Response.Write("</script>");
            }
        }


        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void lnkView_Click(Object sender, CommandEventArgs e)
        {
          //  LinkButton row = (LinkButton)(((LinkButton)e.CommandArgument).NamingContainer);
            LinkButton lb = (LinkButton)sender;
            GridViewRow row1 = (GridViewRow)lb.NamingContainer;
            Response.Write("<script>");
            Response.Write("window.open('../../Hr/PL/UEmployee.aspx','_blank')");
            Response.Write("</script>");
            Session["cu"] = e.CommandArgument;
          //  Session["co"] = row.Cells[0].Text;

        }
        protected void lnkView2_Click(Object sender, CommandEventArgs e)
        {
            //  LinkButton row = (LinkButton)(((LinkButton)e.CommandArgument).NamingContainer);
            LinkButton lb = (LinkButton)sender;
            GridViewRow row1 = (GridViewRow)lb.NamingContainer;
            Response.Write("<script>");
            Response.Write("window.open('../../Hr/PL/UEmployeeDependent.aspx','_blank')");
            Response.Write("</script>");
            Session["cu1"] = e.CommandArgument;
            //  Session["co"] = row.Cells[0].Text;

        }
        protected void lnkView3_Click(Object sender, CommandEventArgs e)
        {
            //  LinkButton row = (LinkButton)(((LinkButton)e.CommandArgument).NamingContainer);
            LinkButton lb = (LinkButton)sender;
            GridViewRow row1 = (GridViewRow)lb.NamingContainer;
            Response.Write("<script>");
            Response.Write("window.open('../../Hr/PL/UEmployeeJob.aspx','_blank')");
            Response.Write("</script>");
            Session["cu2"] = e.CommandArgument;
            //  Session["co"] = row.Cells[0].Text;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select * from Hr001 where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cEmpId+cEmpAname+cEmpEname like '%" + TextBox1.Text + "%'  ", sqlcon);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind();
        }
    }
}