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
    public partial class ReportAllInvoices : System.Web.UI.Page
    {
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter adapter2;
        SqlDataAdapter adapter3;
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        DataTable dtTable = new DataTable();
        public string strQuery = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }

            //  ViewState["init1"] = Session["init"].ToString();
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter("select DISTINCT Orders.cOrderId,Orders.cOrderDate,Orders.cVatAmount as cVat,Orders.cOrderTotal, OrdersDetails.cId AS col4,OrdersDetails.cDisc,bpcontacts.bpname as col5 from [Orders],[bpcontacts] ,[OrdersDetails] where Orders.cCustomerId=bpcontacts.bpid and OrdersDetails.cOrderId=Orders.cOrderId and Orders.cComp='" + Session["cmp"].ToString() + "' and OrdersDetails.cComp='" + Session["cmp"].ToString() + "' and OrdersDetails.cFlagsave=1  ", SqlConnection);
            adapter3.Fill(ds, "tab1");
            ReportDataSource datasource1 = new ReportDataSource("DataSet1", ds.Tables["tab1"]);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.Refresh();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/PL/Invoices.aspx");
        }
    }
}