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
    public partial class InvoiceForm1 : System.Web.UI.Page
    {
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);

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
        
            ViewState["init1"] = Session["init"].ToString();
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter("select *,Company.cPhone as col5 from [Orders] ,[OrdersDetails],[Company] where Orders.cGrpCompany='" + ViewState["cgrpcomp"].ToString() + "' AND Orders.cComp='" + ViewState["comp"].ToString() + "' AND  Orders.cOrderId='" + ViewState["init1"].ToString() + "' AND OrdersDetails.cGrpCompany='" + ViewState["cgrpcomp"].ToString() + "' AND OrdersDetails.cComp='" + ViewState["comp"].ToString() + "' AND OrdersDetails.cOrderId='" + ViewState["init1"].ToString() + "' AND Company.cGrpCompany='" + ViewState["cgrpcomp"].ToString() + "' AND Company.cCompany='" + ViewState["comp"].ToString() + "' AND OrdersDetails.cId='" + ViewState["CUSER"].ToString() + "'", SqlConnection);
            adapter3.Fill(ds, "tab1");
            ReportDataSource datasource1 = new ReportDataSource("DataSet1", ds.Tables["tab1"]);

            ReportViewer1.LocalReport.DataSources.Clear();
            SetReportParameters();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.Refresh();
        }



        protected void SetReportParameters()
        {
            ReportParameter[] parameters = new ReportParameter[3];
            parameters[0] = new ReportParameter("sumplusvat", Session["sum"].ToString());
            parameters[1] = new ReportParameter("net", Session["net"].ToString());

            parameters[2] = new ReportParameter("cl", Session["client"].ToString());
            this.ReportViewer1.LocalReport.SetParameters(parameters);
        }
       
    }
}