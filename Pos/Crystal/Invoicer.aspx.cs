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

namespace Pos.Crystal
{
    public partial class Invoicer : System.Web.UI.Page
    {
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);

        SqlDataAdapter adapter3;
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        DataTable dtTable = new DataTable();
        public string strQuery = "";
        ReportDocument rprt = new ReportDocument();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
            rprt.Load(Server.MapPath("/Crystal/InvoiceClient1.rpt"));

            ViewState["init1"] = Session["init"].ToString();
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter("select *,Company.cPhone as col5 from [Orders] ,[OrdersDetails],[Company] where Orders.cGrpCompany='" + ViewState["cgrpcomp"].ToString() + "' AND Orders.cComp='" + ViewState["comp"].ToString() + "' AND  Orders.cOrderId='" + ViewState["init1"].ToString() + "' AND OrdersDetails.cGrpCompany='" + ViewState["cgrpcomp"].ToString() + "' AND OrdersDetails.cComp='" + ViewState["comp"].ToString() + "' AND OrdersDetails.cOrderId='" + ViewState["init1"].ToString() + "' AND Company.cGrpCompany='" + ViewState["cgrpcomp"].ToString() + "' AND Company.cCompany='" + ViewState["comp"].ToString() + "' AND OrdersDetails.cId='" + ViewState["CUSER"].ToString() + "' ", SqlConnection);
            adapter3.Fill(ds, "DataTable2");

            rprt.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rprt;
            // rprt.PrintOptions.PrinterName = "Canon iR2525/2530 UFRII LT";
            //  rprt.PrintOptions.PrinterName = "HP LaserJet Professional CM1410 Series PCL 6";
         //   rprt.PrintToPrinter(1, false, 1, 1);
            
           

        }
        /*
         private void PrintReport(string printerName)
      {
         PageMargins margins;

         margins = reportDocument.PrintOptions.PageMargins;
         margins.bottomMargin = 350;
         margins.leftMargin = 350;
         margins.rightMargin = 350;
         margins.topMargin = 350;
         reportDocument.PrintOptions.ApplyPageMargins(margins);

         reportDocument.PrintOptions.PrinterName = printerName;

         reportDocument.PrintToPrinter(1, false,0,0);
      }
         */
    }
}