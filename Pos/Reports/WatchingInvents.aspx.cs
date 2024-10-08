﻿using Microsoft.Reporting.WebForms;
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
    public partial class WatchingInvents : System.Web.UI.Page
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
            // ViewState["init1"] = Session["init"].ToString();
            ViewState["cgrpcomp"] = Session["grpcmp"].ToString();
            ViewState["comp"] = Session["cmp"].ToString();
            ViewState["CUSER"] = Session["username"].ToString();
            adapter3 = new SqlDataAdapter("select cast(Products.cPQtyInStock as float )-sum(OrdersDetails.cQty) as cQty ,Products.cPId,Products.cPName as cProdName from Products,OrdersDetails where OrdersDetails.cPId=Products.cPId and OrdersDetails.cOrderDate BETWEEN CONVERT(datetime,'" + DateTime.Now.AddDays(-30) + "') AND CONVERT(datetime,'" + DateTime.Now + "') and OrdersDetails.cGrpCompany='" + Session["grpcmp"].ToString() + "' and OrdersDetails.cComp='" + Session["cmp"].ToString() + "' and Products.cGrpCompany='" + Session["grpcmp"].ToString() + "' and Products.cComp='" + Session["cmp"].ToString() + "' GROUP by Products.cPId,Products.cPName,Products.cPQtyInStock ", SqlConnection);
            adapter3.Fill(ds, "tab1");
            ReportDataSource datasource1 = new ReportDataSource("DataSet1", ds.Tables["tab1"]);

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.Refresh();


        }
    }
}