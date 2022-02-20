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
    public partial class PrintInvoice : System.Web.UI.Page
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

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            rprt.Load(Server.MapPath("/Crystal/InvoiceClient1.rpt"));

          //  ViewState["init1"] = Session["init"].ToString();
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter("select *, Company.cCompName as col4,Company.cPhone as col5 from [Orders] ,[OrdersDetails],[Company] where Orders.cGrpCompany='" + ViewState["cgrpcomp"].ToString() + "' AND Orders.cComp='" + ViewState["comp"].ToString() + "' AND  Orders.cOrderId='" + TextBoxorderid.Text + "' AND OrdersDetails.cGrpCompany='" + ViewState["cgrpcomp"].ToString() + "' AND OrdersDetails.cComp='" + ViewState["comp"].ToString() + "' AND OrdersDetails.cOrderId='" + TextBoxorderid.Text + "' AND Company.cGrpCompany='" + ViewState["cgrpcomp"].ToString() + "' AND Company.cCompany='" + ViewState["comp"].ToString() + "'  ", SqlConnection);
            adapter3.Fill(ds, "DataTable2");

            rprt.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rprt;
            //   rprt.PrintToPrinter(1, false, 1, 1);
        }
    }
}