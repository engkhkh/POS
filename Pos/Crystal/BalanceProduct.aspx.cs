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
    public partial class BalanceProduct : System.Web.UI.Page
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
            rprt1.Load(Server.MapPath("/Crystal/BalanceProduct1.rpt"));

            //  ViewState["init1"] = Session["init"].ToString();
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter("select cast(Products.cPPrice as float )-cast(Products.cPPriceCost as float ) as cQty,Products.cPName as cProdName from Products where Products.cGrpCompany='" + Session["grpcmp"].ToString() + "' and Products.cComp='" + Session["cmp"].ToString() + "' GROUP by Products.cPId,Products.cPName,Products.cPQtyInStock,Products.cPPriceCost,Products.cPPrice ", SqlConnection);
            adapter3.Fill(ds, "DataTable2");

            rprt1.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rprt1;
            //  rprt1.PrintToPrinter(1, false, 1, 1);

        }
    }
}