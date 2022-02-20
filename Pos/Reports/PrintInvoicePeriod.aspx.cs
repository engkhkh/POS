using CrystalDecisions.CrystalReports.Engine;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.Reports
{
    public partial class PrintInvoicePeriod : System.Web.UI.Page
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
                    //Session["grpcmp"] = dt.Rows[0][3].ToString();
                    ddlcompch.DataSource = dt;
                    ddlcompch.DataTextField = "cCompName";
                    ddlcompch.DataValueField = "cCompany";
                    ddlcompch.DataBind();
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
                this.TextBox1.Text = System.DateTime.Now.ToShortDateString();
                this.TextBox2.Text = System.DateTime.Now.ToShortDateString(); ;
                this.pnlCalendar.Attributes.Add("style",
                     "DISPLAY: none; POSITION: absolute");
                this.Panel1.Attributes.Add("style",
                    "DISPLAY: none; POSITION: absolute");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            this.pnlCalendar.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
            this.pnlCalendar.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            this.Panel1.Attributes.Add("style",
                     " POSITION: absolute");

        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox2.Text = Calendar2.SelectedDate.ToShortDateString();
            this.Panel1.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }

        protected void ddlcacheir_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select * from [Users] where cGrpCopany='" + Session["grpcmp"].ToString() + "' and cComp='" + ddlcompch.SelectedValue + "' ", sqlcon);
            da.Fill(dt2);
            //ddlcacheir.DataSource = dt2;
            //ddlcacheir.DataTextField = "cUserName";
            //ddlcacheir.DataValueField = "cId";
            //ddlcacheir.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter(" select Orders.cOrderId as cOrderId  ,OrdersDetails.cOrderDate as cOrderDate , cProdName , cQty , cVat,cTotal FROM [OrdersDetails],[Orders] WHERE Orders.cOrderId=OrdersDetails.cOrderId AND Orders.cGrpCompany='" + Session["grpcmp"].ToString() + "' AND Orders.cComp='" + ddlcompch.SelectedValue + "' AND Orders.cOrderDate BETWEEN CONVERT(datetime,'" + Calendar1.SelectedDate + "') AND CONVERT(datetime,'" + Calendar2.SelectedDate + "')   ORDER BY  cOrderId ASC; ", sqlcon);
            adapter3.Fill(ds, "tab1");
            ReportDataSource datasource1 = new ReportDataSource("DataSet1", ds.Tables["tab1"]);

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.Refresh();
        // rprt.PrintOptions.PrinterName = "Canon iR2525/2530 UFRII LT";
          //  rprt.PrintOptions.PrinterName = "HP LaserJet Professional CM1410 Series PCL 6";
          //  rprt.PrintToPrinter(1, false, 1, 1);
            //  
        }

    }
}