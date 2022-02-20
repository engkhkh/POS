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
    public partial class BarcodeProduct : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlDataAdapter adapter3 = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        DataTable dt6 = new DataTable();
        DataTable dt5 = new DataTable();
        Pos.BL.cProduct p = new BL.cProduct();
        DataSet ds = new DataSet();
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
            da = new SqlDataAdapter("select * from products where cGrpCompany='"+Session["grpcmp"].ToString()+"' and cComp='"+Session["cmp"].ToString()+"' ", sqlcon);
            da.Fill(dt6);
            DropDownList1.DataSource = dt6;
            DropDownList1.DataTextField = "cPName";
            DropDownList1.DataValueField = "cPId";
            DropDownList1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            rprt.Load(Server.MapPath("/Crystal/BarProduct.rpt"));
            adapter3 = new SqlDataAdapter(" select cPId as cOrderId , cPName as cProdName , cPPrice as col4  from products where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cComp='" + Session["cmp"].ToString() + "' and cPId='"+DropDownList1.SelectedValue+"' ", sqlcon);
            adapter3.Fill(ds, "DataTable2");
            rprt.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rprt;
            // rprt.PrintOptions.PrinterName = "Canon iR2525/2530 UFRII LT";
            //  rprt.PrintOptions.PrinterName = "HP LaserJet Professional CM1410 Series PCL 6";
            //  rprt.PrintToPrinter(1, false, 1, 1);
        }
    }
}