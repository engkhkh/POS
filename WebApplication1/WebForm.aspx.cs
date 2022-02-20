using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication1
{
    public partial class WebForm : System.Web.UI.Page
    {

        ///
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter adapter2;
        SqlDataAdapter adapter3;
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        DataTable dtTable = new DataTable();
        public string strQuery = "";
          
       
        protected void Page_Load(object sender, EventArgs e)
        {
              //
            /*
            var rppComp = new ReportParameter();

            ViewState["strCompName"] = "ehc company";
            rppComp.Name = "rpComp";
            rppComp.Values.Add(ViewState["strCompName"].ToString().ToUpper());
            ReportViewer1.LocalReport.SetParameters(rppComp);
        */
            ///
            adapter2 = new SqlDataAdapter("select cPrj,cPrjName,cDesc from loprj011", SqlConnection);
            adapter2.Fill(ds, "tab1");
            ReportDataSource datasource = new ReportDataSource("DataSet1", ds.Tables["tab1"]);
           ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource);
            ReportViewer1.LocalReport.Refresh();
          




           // Response.Redirect(Request.Url.AbsolutePath + "/Report");

        }
        protected void ReportViewer1_Load(object sender, EventArgs e)
        {
          
          
        
        }
}
}