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

namespace Pos.Hr.Reports
{
    public partial class BpStatement : System.Web.UI.Page
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
            da = new SqlDataAdapter("select * from [bpcontacts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch.SelectedValue + "' ", sqlcon);
            da.Fill(dt2);
            ddlcompch0.DataSource = dt2;
            ddlcompch0.DataTextField = "bpname";
            ddlcompch0.DataValueField = "bpid";
            ddlcompch0.DataBind();
            //ddlcacheir.DataSource = dt2;
            //ddlcacheir.DataTextField = "cUserName";
            //ddlcacheir.DataValueField = "cId";
            //ddlcacheir.DataBind();

        }
        protected void SetReportParameters()
        {
            ReportParameter[] parameters = new ReportParameter[2];
            parameters[0] = new ReportParameter("fromDate", Calendar1.SelectedDate.ToString());
            parameters[1] = new ReportParameter("toDate", Calendar2.SelectedDate.ToString());
            this.ReportViewer1.LocalReport.SetParameters(parameters);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string CAL1 = Calendar1.SelectedDate.ToString();
            string CAL2 = Calendar2.SelectedDate.ToString();
            ReportViewer1.Enabled = true;
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter(" select FinGenLedg.iJV as cOrderId  ,FinGenLedg.dtJVDate as cOrderDate , FinGenLedg.cNar as cProdName , FinGenLedg.dFAmntDr  as cQty ,FinGenLedg.dFAmntCr as  cVat, bpcontacts.bpname as cTotal FROM [bpcontacts],[FinGenLedg] WHERE bpcontacts.bpid=FinGenLedg.cBP AND FinGenLedg.cGrpCompany='" + Session["grpcmp"].ToString() + "' AND  FinGenLedg.cCompany='" + ddlcompch.SelectedValue + "' AND FinGenLedg.cBP='" + ddlcompch0.SelectedValue + "' AND FinGenLedg.dtJVDate BETWEEN '" + CAL1 + "' AND '" + CAL2 + "'   ORDER BY  cOrderId ASC; ", sqlcon);
            adapter3.Fill(ds, "tab1");
            ReportDataSource datasource1 = new ReportDataSource("DataSet1", ds.Tables["tab1"]);

            ReportViewer1.LocalReport.DataSources.Clear();
            SetReportParameters();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.Refresh();
            // rprt.PrintOptions.PrinterName = "Canon iR2525/2530 UFRII LT";
            //  rprt.PrintOptions.PrinterName = "HP LaserJet Professional CM1410 Series PCL 6";
            //  rprt.PrintToPrinter(1, false, 1, 1);
            //  
        }

        protected void ddlcompch0_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}