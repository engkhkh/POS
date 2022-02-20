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
    public partial class Balance : System.Web.UI.Page
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


        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
           // lblday.Text = Calendar1.TodaysDate.ToShortDateString();
            lblbday.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ReportViewer1.Enabled = true;
            adapter3 = new SqlDataAdapter("  select SUM(case when Orders.cPaymentType = 101 then cOrderTotal else 0 end) as cOrderTotal,SUM(case when Orders.cPaymentType = 100 then cOrderTotal else 0 end) as col4,SUM(case when Orders.cPaymentType = 102 then cOrderTotal else 0 end) as col5  from [Orders] where cComp='" + Session["cmp"].ToString() + "'  AND  Orders.cOrderDate BETWEEN CONVERT(datetime,'" + lblbday.Text + "') AND CONVERT(datetime,'" + DateTime.Now + "'); ", SqlConnection);
            adapter3.Fill(ds, "tab1");
            ReportDataSource datasource1 = new ReportDataSource("DataSet1", ds.Tables["tab1"]);
           
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.Refresh();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/PL/Invoices.aspx");
        }
    }
}