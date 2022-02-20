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

namespace Pos.Hr.Reports
{
    public partial class AttendenceEmp : System.Web.UI.Page
    {
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        Pos.BL.cProduct p = new BL.cProduct();
        SqlDataAdapter adapter3;
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        DataTable dt = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dtTable = new DataTable();
        public string strQuery = "";
        string period1 = "", period2 = "", period3 = "", cTimeFirstEntryFingerprint= "", cTimeSecondExitFingerprint = "", cTimeSecondEntryFingerprint = "", cTimeFirstExitFingerorint = "", cOverTimePeriod="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }

            }
            dt = p.fnreadcompany();
            if (dt.Rows.Count > 0)
            {
                // Session["cmp"] = dt.Rows[0][0].ToString();
                Session["grpcmp"] = dt.Rows[0][3].ToString();
                Session["labour"] = dt.Rows[0][6].ToString();
                ddlcompch.DataSource = dt;
                ddlcompch.DataTextField = "cCompName";
                ddlcompch.DataValueField = "cCompany";
                ddlcompch.DataBind();
            }
            //this.txtEndDate.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
            //this.txtStartDate.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
            this.Panel1.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            this.Panel13.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //ViewState["init1"] = Session["init"].ToString();
            //ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            //ViewState["comp"] = Session["cmp"].ToString();
            //ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter(" select [Hr00CalenderWorkingDayd].cDtDate AS DataColumn1,[Hr00Times].cTimeFirstEntryFingerprint AS DataColumn2, [Hr00Times].cTimeSecondExitFingerprint AS DataColumn3, [Hr00Times].cTimeSecondEntryFingerprint AS DataColumn6, [Hr00Times].cTimeFirstExitFingerorint AS DataColumn7 , [Hr00Times].cOverTimePeriod AS DataColumn8  ,(case when[Hr00Attendence].cType = 'C/In' then [Hr00Attendence].cAttendence  end) DataColumn4 ,(case when[Hr00Attendence].cType = 'C/Out' then [Hr00Attendence].cAttendence  end) DataColumn5 from [Hr00CalenderWorkingDayd],[Hr00Times],[Hr00Attendence] where [Hr00Times].cShiftId=[Hr00CalenderWorkingDayd].cShift AND cast([Hr00CalenderWorkingDayd].cDtDate as date ) between '" + Convert.ToDateTime(txtStartDate.Text.Trim()).ToString("yyyy-MM-dd") + "' and '" + Convert.ToDateTime(txtEndDate.Text.Trim()).ToString("yyyy-MM-dd") + "'  AND [Hr00Attendence].cEmp='" + DropDownList2.SelectedValue.Trim() + "' AND CAST([Hr00Attendence].cAttendence AS date)=CAST([Hr00CalenderWorkingDayd].cDtDate AS DATE)  ORDER BY DataColumn1 ASC ", SqlConnection);
            adapter3.Fill(ds, "tab1");
            if (ds.Tables["tab1"].Rows.Count > 0)
            {
                cTimeFirstEntryFingerprint = ds.Tables["tab1"].Rows[0]["DataColumn2"].ToString().Trim();
                cTimeSecondExitFingerprint = ds.Tables["tab1"].Rows[0]["DataColumn3"].ToString().Trim();
                cTimeSecondEntryFingerprint = ds.Tables["tab1"].Rows[0]["DataColumn6"].ToString().Trim();
                cTimeFirstExitFingerorint = ds.Tables["tab1"].Rows[0]["DataColumn7"].ToString().Trim();
                cOverTimePeriod = ds.Tables["tab1"].Rows[0]["DataColumn8"].ToString().Trim();

                //TimeSpan t = Convert.ToDateTime(ds.Tables["tab1"].Rows[0]["DataColumn7"].ToString()) - Convert.ToDateTime(ds.Tables["tab1"].Rows[0]["DataColumn6"].ToString());
                //period1 = Convert.ToString(t.TotalDays);
                //DateTime periodTIME = Convert.ToDateTime(ds.Tables["tab1"].Rows[0]["DataColumn13"].ToString());
                //period2 = Convert.ToString(periodTIME.Date.AddDays(Convert.ToInt32(ds.Tables["tab1"].Rows[0]["DataColumn5"].ToString().Trim())).ToString("MM/dd/yyyy"));
                //period3 = Convert.ToString((Convert.ToInt32(period1) - Convert.ToInt32(ds.Tables["tab1"].Rows[0]["DataColumn5"].ToString().Trim())));


            }
            ReportDataSource datasource1 = new ReportDataSource("DataSet1", ds.Tables["tab1"]);

            ReportViewer1.LocalReport.DataSources.Clear();
            SetReportParameters();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.Refresh();
        }
        protected void SetReportParameters()
        {
            ReportParameter[] parameters = new ReportParameter[10];
            parameters[0] = new ReportParameter("ReportParameter1", txtStartDate.Text.Trim());
            parameters[1] = new ReportParameter("ReportParameter2", txtEndDate.Text.Trim());

            parameters[2] = new ReportParameter("ReportParameter3", DropDownList2.SelectedItem.Text.Trim());
            parameters[3] = new ReportParameter("ReportParameter4", cTimeFirstEntryFingerprint.Trim());
            parameters[4] = new ReportParameter("ReportParameter5", cTimeSecondExitFingerprint.Trim());
            parameters[5] = new ReportParameter("ReportParameter6", cTimeSecondEntryFingerprint.Trim());
            parameters[6] = new ReportParameter("ReportParameter7", cTimeFirstExitFingerorint.Trim());
            parameters[7] = new ReportParameter("ReportParameter8", TextBox2.Text.Trim());
            parameters[8] = new ReportParameter("ReportParameter9", cOverTimePeriod.Trim());
            parameters[9] = new ReportParameter("ReportParameter10", DropDownList2.SelectedValue.Trim());
            this.ReportViewer1.LocalReport.SetParameters(parameters);//
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            da2 = new SqlDataAdapter("select * from [Hr001] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch.SelectedValue + "' ", SqlConnection);
            da2.Fill(dt3);
            //
            DropDownList2.DataSource = dt3;
            DropDownList2.DataTextField = "cEmpAname";
            DropDownList2.DataValueField = "cEmpId";
            DropDownList2.DataBind();
            //


        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox2.Text = "";
            SqlConnection.Open();
            cmd = new SqlCommand(" select cShiftName,[Hr00Shifts].[cShiftId] from  [Hr00Shifts],[Hr00EmpByShift] where [Hr00EmpByShift].cGrpCompany='" + Session["grpcmp"].ToString().Trim() + "' and [Hr00EmpByShift].cCompany='" + ddlcompch.SelectedValue + "' and [Hr00EmpByShift].cCompany=[Hr00Shifts].cCompany  AND  [Hr00EmpByShift].[cEmpId]='" + DropDownList2.SelectedValue + "' and [Hr00EmpByShift].[cShiftId]=[Hr00Shifts].[cShiftId]  ", SqlConnection);
         //  TextBox2.Text=Convert.ToString( cmd.ExecuteScalar());
           SqlDataReader reader = cmd.ExecuteReader();
           while (reader.Read())
           {
               TextBox2.Text = reader["cShiftName"].ToString().Trim() + "/" + reader["cShiftId"].ToString().Trim();
           }
            //
            

           SqlConnection.Close();

        }

        protected void Button29_Click(object sender, EventArgs e)
        {
            this.Panel13.Attributes.Add("style",
                     " POSITION: LEFT");
        }

        protected void Calendar10_SelectionChanged(object sender, EventArgs e)
        {
            txtStartDate.Text = Calendar10.SelectedDate.ToShortDateString().Trim();
            
            this.Panel13.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
        }//
        //
        protected void Button2_Click(object sender, EventArgs e)
        {
            this.Panel1.Attributes.Add("style",
                     " POSITION: LEFT");
        }//

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = Calendar1.SelectedDate.ToShortDateString().Trim();
            this.Panel1.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
        }
    }
}