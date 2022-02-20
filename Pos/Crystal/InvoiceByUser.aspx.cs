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
    public partial class InvoiceByUser : System.Web.UI.Page
    {
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter adapter2;
        SqlDataAdapter adapter3;
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        DataTable dtTable = new DataTable();
        public string strQuery = "";
        ReportDocument rprt1 = new ReportDocument();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
            rprt1.Load(Server.MapPath("/Crystal/InvoiceByUser1.rpt"));

            //  ViewState["init1"] = Session["init"].ToString();
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter("select DISTINCT Orders.cOrderId,Orders.cOrderDate,Orders.cVatAmount as cVat,Orders.cOrderTotal, OrdersDetails.cId AS col4,OrdersDetails.cDisc from [Orders] ,[OrdersDetails] where OrdersDetails.cOrderId=Orders.cOrderId and Orders.cComp='" + Session["cmp"].ToString() + "' and OrdersDetails.cComp='" + Session["cmp"].ToString() + "' and OrdersDetails.cFlagsave=1 ", SqlConnection);
            adapter3.Fill(ds, "DataTable2");

            rprt1.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rprt1;
          //  rprt1.PrintToPrinter(1, false, 1, 1);
           
                
           

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/PL/Invoices.aspx");
        }
    }
}