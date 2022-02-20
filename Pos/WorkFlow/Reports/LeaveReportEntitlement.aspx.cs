using CrystalDecisions.CrystalReports.Engine;
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

namespace Pos.WorkFlow.Reports
{
    public partial class LeaveReportEntitlement : System.Web.UI.Page
    {
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);

        SqlDataAdapter adapter3;
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        DataTable dtTable = new DataTable();
        public string strQuery = "";
        string period1 = "", period2 = "", period3 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }

            }

            //ViewState["init1"] = Session["init"].ToString();
            //ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            //ViewState["comp"] = Session["cmp"].ToString();
            //ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter("select [Hr001].[cEmpAname] AS DataColumn1,[Hr00jobdata].[cTitleCurrentJob] AS DataColumn2,[Hr00jobdata].[cDepartmentName] AS DataColumn3,[Hr11Leave].[cTravelTo] AS DataColumn4,[Hr00LeaveSchedule].[cBalance] AS DataColumn5 ,[Hr11Leave].[cVacationStart] AS DataColumn6,[Hr11Leave].[cVacationEnd] AS DataColumn7,[Hr00LeaveSchedule].[cLastBack] AS DataColumn8 ,[Hr00LeaveSchedule].[cTempEmp] AS DataColumn9,[Hr00jobdata].[cDirectAcion] AS DataColumn11,[Hr00LeaveSchedule].[cLeaveDue] AS DataColumn13   from [Hr001],[Hr00jobdata],[Hr11Leave],[Hr00LeaveSchedule] where [Hr00LeaveSchedule].cEmpId=[Hr00jobdata].cEmpId AND [Hr00jobdata].cEmpId=[Hr001].cEmpId AND  [Hr001].cGrpCompany='" + Session["grpcmp"].ToString() +
                "' AND [Hr001].cCompany='" + Session["comid1"].ToString() +
                "' AND  [Hr001].[cEmpAname]='" + Session["reqfor1"].ToString().Trim() +
                "' AND [Hr11Leave].cRequestFor='" + Session["reqfor1"].ToString().Trim() +

                "' AND [Hr11Leave].cRequestId='" + Session["reqid"].ToString().Trim() + "'", SqlConnection);
            adapter3.Fill(ds, "tab1");
            if (ds.Tables["tab1"].Rows.Count > 0)
            {

                TimeSpan t = Convert.ToDateTime(ds.Tables["tab1"].Rows[0]["DataColumn7"].ToString()) - Convert.ToDateTime(ds.Tables["tab1"].Rows[0]["DataColumn6"].ToString());
                period1 = Convert.ToString(t.TotalDays);
                DateTime periodTIME = Convert.ToDateTime(ds.Tables["tab1"].Rows[0]["DataColumn13"].ToString());
                period2 = Convert.ToString(periodTIME.Date.AddDays(Convert.ToInt32(ds.Tables["tab1"].Rows[0]["DataColumn5"].ToString().Trim())).ToString("MM/dd/yyyy"));
                period3 = Convert.ToString((Convert.ToInt32(period1) - Convert.ToInt32(ds.Tables["tab1"].Rows[0]["DataColumn5"].ToString().Trim())));


            }
            ReportDataSource datasource1 = new ReportDataSource("DataSet1", ds.Tables["tab1"]);
            ReportViewer1.LocalReport.DataSources.Clear();
            //SetReportParameters();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.Refresh();//





        }
        protected void SetReportParameters()
        {
            ReportParameter[] parameters = new ReportParameter[3];
            parameters[0] = new ReportParameter("period1", Convert.ToString(period1));
            parameters[1] = new ReportParameter("period2", Convert.ToString(period2));

            parameters[2] = new ReportParameter("period3", Convert.ToString(period3));
            this.ReportViewer1.LocalReport.SetParameters(parameters);
        }

    }
}