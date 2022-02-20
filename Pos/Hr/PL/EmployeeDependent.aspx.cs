using CrystalDecisions.CrystalReports.Engine;
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
    public partial class EmployeeDependent : System.Web.UI.Page
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
        ReportDocument rprt = new ReportDocument();
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
                    Label10.Text = "";
                    Label9.Text = "";
                    ////


                }
                da = new SqlDataAdapter("select * from Hr001 where cGrpCompany='" + Session["grpcmp"] .ToString()+ "'", sqlcon);
                da.Fill(dt2);
                DropDownList4.DataSource = dt2;
                DropDownList4.DataTextField = "cEmpAname";
                DropDownList4.DataValueField = "cEmpId";
                DropDownList4.DataBind();
                this.TextBoxDATE.Text = System.DateTime.Now.AddYears(-20).ToShortDateString();
                this.TextBoxdebendent.Text = System.DateTime.Now.AddYears(1).ToShortDateString();
                this.TextBoxcurrent.Text = System.DateTime.Now.AddYears(5).ToShortDateString();
                this.pnlCalendar.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel1.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel2.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            }

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBoxDATE.Text = Calendar1.SelectedDate.ToShortDateString();
            this.pnlCalendar.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");

        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBoxdebendent.Text = Calendar2.SelectedDate.ToShortDateString();
            this.Panel1.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBoxcurrent.Text = Calendar3.SelectedDate.ToShortDateString();
            this.Panel2.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            this.pnlCalendar.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            
                this.Panel1.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            this.Panel2.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        

        protected void Button15_Click(object sender, EventArgs e)
        {
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00Dependents] (cGrpCompany,cCompany,cEmpId,cDepenName,cDepenJoinDate,cDepenAge,cDepenGender,cDepenNationality,cDepenIdentityId,cDepenIdentityExpiry,cDepenPassportId,cDepenpassportExpiry,cDepenRelative,cUser) values ('" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','" + DropDownList4.SelectedValue + "','" + TextBoxName.Text + "','" + TextBoxDATE.Text + "','" + TextBoxage.Text + "','" + DropDownList1.SelectedItem.Text + "','" + TextBoxphonenationality.Text + "','" + TextBoxIDENTITYID.Text + "','" + TextBoxdebendent.Text + "','" + TextBoxhome.Text + "','" + TextBoxcurrent.Text + "','" + TextBoxphone.Text + "','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label9.Text = "added/تم التسجيل ";
            }
            catch(SqlException ex)
            {
                Label10.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
                TextBoxphone.Text = "";
                TextBoxName.Text = "";
                TextBoxIDENTITYID.Text = "";
                TextBoxId0.Text = "";
                TextBoxhome.Text = "";
                TextBoxphonenationality.Text = "";
                TextBoxage.Text = "";
                this.TextBoxDATE.Text = System.DateTime.Now.AddYears(-20).ToShortDateString();
                this.TextBoxdebendent.Text = System.DateTime.Now.AddYears(1).ToShortDateString();
                this.TextBoxcurrent.Text = System.DateTime.Now.AddYears(5).ToShortDateString();

            }
        }
    }
}