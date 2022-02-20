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
    public partial class WatchingInvents : System.Web.UI.Page
    {
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        ReportDocument rprt1 = new ReportDocument();
        DataSet ds = new DataSet();
        SqlDataAdapter adapter3;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
            rprt1.Load(Server.MapPath("/Crystal/WatchingInvents1.rpt"));

            //  ViewState["init1"] = Session["init"].ToString();
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter("select cast(Products.cPQtyInStock as float )-sum(OrdersDetails.cQty) as cQty ,Products.cPId,Products.cPName as cProdName from Products,OrdersDetails where OrdersDetails.cPId=Products.cPId and OrdersDetails.cOrderDate BETWEEN CONVERT(datetime,'" + DateTime.Now.AddDays(-30) + "') AND CONVERT(datetime,'" + DateTime.Now + "') and OrdersDetails.cGrpCompany='" + Session["grpcmp"].ToString() + "' and OrdersDetails.cComp='" + Session["cmp"].ToString() + "' and Products.cGrpCompany='" + Session["grpcmp"].ToString() + "' and Products.cComp='" + Session["cmp"].ToString() + "' GROUP by Products.cPId,Products.cPName,Products.cPQtyInStock ", SqlConnection);
            adapter3.Fill(ds, "DataTable2");

            rprt1.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rprt1;
            //  rprt1.PrintToPrinter(1, false, 1, 1);

        }
    }
}