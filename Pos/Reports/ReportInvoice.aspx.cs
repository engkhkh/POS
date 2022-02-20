using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace Pos.Reports
{
    public partial class ReportInvoice : System.Web.UI.Page
    {
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter adapter2;
        SqlDataAdapter adapter3;
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        DataTable dtTable = new DataTable();
        public string strQuery = "";
        protected void Page_Load(object sender, EventArgs e)
        {/*
            var rppComp = new ReportParameter();
            var rpptotal = new ReportParameter();

            //
            ViewState["strCompName"] = "ehc company";
            rppComp.Name = "rpComp";
            rppComp.Values.Add(ViewState["strCompName"].ToString().ToUpper());
            ReportViewer1.LocalReport.SetParameters(rppComp);
            //
            rpptotal.Name = "rptotal";
            rpptotal.Values.Add("cTotal");
            ReportViewer1.LocalReport.SetParameters(rpptotal);
          *///
            ReportViewer1.LocalReport.EnableHyperlinks = true;
            ViewState["init1"] = Session["init"].ToString();
            adapter3 = new SqlDataAdapter("select * from [Orders] ,[OrdersDetails] where Orders.cOrderId='" + ViewState["init1"].ToString() + "' AND OrdersDetails.cOrderId='" + ViewState["init1"] .ToString()+ "'", SqlConnection);
            adapter3.Fill(ds, "tab1");
            ReportDataSource datasource1 = new ReportDataSource("DataSet1", ds.Tables["tab1"]);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.Refresh();



        }
    }
}