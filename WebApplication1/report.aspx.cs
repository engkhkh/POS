using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class report : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=.;Initial Catalog=zkteco_biotime; integrated security=false;  User ID=u001;Password=kh602050$0;");
        SqlDataAdapter adapter2;
        SqlDataAdapter adapter3;
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        DataTable dtTable = new DataTable();
        public string strQuery = "";
        ///
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
    
        
        protected void Page_Load(object sender, EventArgs e)
        {
            var rppComp = new ReportParameter();
            var rppReportHead = new ReportParameter();
            var rppItem = new ReportParameter();
            var rppCost = new ReportParameter();
            var rppItemDec = new ReportParameter();
            var rppReportSubHead = new ReportParameter();
            var rpAllowance = new ReportParameter();
            var rpDeduction = new ReportParameter();
            var rpAcct = new ReportParameter();
            if (Request.Url.ToString().EndsWith("/"))
            {
                RadWindow1.Visible = false;
                // Get this session's ID from the filename
                Session["sessionID"] = System.IO.Path.GetFileNameWithoutExtension(Request.PhysicalPath);
                ViewState["sessionID"] = Session["sessionID"];


                ViewState["Ipay"] = Session["Ipay"];
                //
                ViewState["strCompName"] = "ehc company";
                rppComp.Name = "rpComp";
                rppComp.Values.Add(ViewState["strCompName"].ToString().ToUpper());
                ReportViewer1.LocalReport.SetParameters(rppComp);
                //
                ViewState["RPHEAD"]="PAYROLL ANYLISIS";
                rppReportHead.Name = "rpReportHead";
                rppReportHead.Values.Add(ViewState["RPHEAD"].ToString().ToUpper());
                ReportViewer1.LocalReport.SetParameters(rppReportHead);
                //
                rpAllowance.Name = "rpAllowance";
                rpAllowance.Values.Add("Allowance");
                ReportViewer1.LocalReport.SetParameters(rpAllowance);
                //
               rpDeduction.Name = "rpDeduction";
               rpDeduction.Values.Add("Deduction");
               ReportViewer1.LocalReport.SetParameters(rpDeduction);
                //
                rppReportSubHead.Name = "rpReportSubHead";
                rppReportSubHead.Values.Add("accountname" + " - ");
                ReportViewer1.LocalReport.SetParameters(rppReportSubHead);
                //
                rppItem.Name = "rpItem";
                rppItem.Values.Add("item");
                ReportViewer1.LocalReport.SetParameters(rppItem);
                //
               rppItemDec.Name = "rpItemDec";
               rppItemDec.Values.Add("itemdec");
               ReportViewer1.LocalReport.SetParameters(rppItemDec);
                //
              rppCost.Name = "rpPrice";
              rppCost.Values.Add("price");
              ReportViewer1.LocalReport.SetParameters(rppCost);
                ////////////
                  var rpAllowanceID = new ReportParameter();
            var rpAllowanceName = new ReportParameter();
            var rpDeductionID = new ReportParameter();
            var rpDeductionName = new ReportParameter();
            var rpTotal = new ReportParameter();
            var rpNetTotal = new ReportParameter();
            var rpAmount = new ReportParameter();
            var rpPay = new ReportParameter();
            var rpSubCode = new ReportParameter();
                //
            rpSubCode.Name = "rpSubCode";
            rpSubCode.Values.Add("all" + " :" + "all" + " - " + "all");
            ReportViewer1.LocalReport.SetParameters(rpSubCode);

            rpAmount.Name = "rpAmount";
            rpAmount.Values.Add("amount");
            ReportViewer1.LocalReport.SetParameters(rpAmount);

            rpPay.Name = "rpPay";
            rpPay.Values.Add("payroll id" + " : " + ViewState["Ipay"].ToString().Trim());
            ReportViewer1.LocalReport.SetParameters(rpPay);

            rpAllowanceID.Name = "rpAllowanceID";
            rpAllowanceID.Values.Add("AllowanceID");
            ReportViewer1.LocalReport.SetParameters(rpAllowanceID);

            rpAllowanceID.Name = "rpAllowanceID";
            rpAllowanceID.Values.Add("AllowanceID");
            ReportViewer1.LocalReport.SetParameters(rpAllowanceID);


            rpAllowanceName.Name = "rpAllowanceName";
            rpAllowanceName.Values.Add("AllowanceName");
            ReportViewer1.LocalReport.SetParameters(rpAllowanceName);



            rpDeductionID.Name = "rpDeductionID";
            rpDeductionID.Values.Add("DeductionID");
            ReportViewer1.LocalReport.SetParameters(rpDeductionID);

            rpAcct.Name = "rpAcct";
            rpAcct.Values.Add("Acct");
            ReportViewer1.LocalReport.SetParameters(rpAcct);


            rpDeductionName.Name = "rpDeductionName";
            rpDeductionName.Values.Add("DeductionName");
            ReportViewer1.LocalReport.SetParameters(rpDeductionName);

            rpTotal.Name = "rpTotal";
            rpTotal.Values.Add("total");
            ReportViewer1.LocalReport.SetParameters(rpTotal);

            rpNetTotal.Name = "rpNetTotal";
            rpNetTotal.Values.Add("NetTotal");
            ReportViewer1.LocalReport.SetParameters(rpNetTotal);

            var rpPayPeriod = new ReportParameter();
            rpPayPeriod.Name = "rpPayPeriod";
            rpPayPeriod.Values.Add("period"+ " : " + "cFYear" + " - " + "PeriodName");
            ReportViewer1.LocalReport.SetParameters(rpPayPeriod);
                //
            var rpApprovedBy = new ReportParameter();
            rpApprovedBy.Name = "rpApprovedBy";
            rpApprovedBy.Values.Add("approved by");
            ReportViewer1.LocalReport.SetParameters(rpApprovedBy);
                //

            var rpEmployee = new ReportParameter();
            rpEmployee.Name = "rpEmployee";
            rpEmployee.Values.Add("Employee");
            ReportViewer1.LocalReport.SetParameters(rpEmployee);
                //

            var rpSignature = new ReportParameter();
            rpSignature.Name = "rpSignature";
            rpSignature.Values.Add("Signature");
            ReportViewer1.LocalReport.SetParameters(rpSignature);
                //
            var rpName = new ReportParameter();
            rpName.Name = "rpName";
            rpName.Values.Add("pname");
            ReportViewer1.LocalReport.SetParameters(rpName);
                //////////
            dtTable = new DataTable();
         //   adapter2 = new SqlDataAdapter("", WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
            adapter2 = new SqlDataAdapter("SELECT  "  + 
                "SUM(isnull((case when hrpay011.bType=1 THEN   (dAmnt)    END),0))Benefit, " +
                "SUM(isnull((case when hrpay011.bType=0 THEN   (dAmnt)    END),0))Deduction, " + 
                "ISNULL(ltrim(rtrim(hremp012.cResID)),'N/A') as cResID, ISNULL(ltrim(rtrim(hremp012.cBankAcct)),'N/A') as cBankAcct, " +
                "ltrim(rtrim(hremp011.cEmpName)) cEmpName, ltrim(rtrim(figld042.csubcodename)) cSubcodeName,ltrim(rtrim(hrpay102.cEmp)) cEmp, " + 
                "ltrim(rtrim(hrpay011.cName)) cName, ltrim(rtrim(hrpay011.cBen)) cBen, " +
                "SUM (hrpay102.dAmnt) dAmnt,(CASE WHEN hrpay011.bType = 1 THEN 'Benefit' else 'Deduction' end ) as 'bType', " + 
                "hrpay011.cAcctGrp,hrpay011.cAcct,LTRIM(RTRIM(figld011.cAcctGrpName)) as cAcctGrpName,LTRIM(RTRIM(figld012.cAcctName)) as cAcctName " +
                "FROM hrpay102, hrpay011, 	hremp011 LEFT JOIN hremp012 on hremp012.cemp=hremp011.cemp " +
                ",figld011,figld012,figld042 " +
                "WHERE 	Ipay in ( " + Session["Ipay"] + ") AND hrpay102.cGrpComp = 10100001  " +
                "AND hrpay102.cComp =  1001 AND hrpay102.cGrpComp = hrpay011.cGrpComp AND hrpay102.cGrpComp = hremp011.cGrpComp AND " + 
                "hrpay011.cBen = hrpay102.cBen AND hremp011.cEmp = hrpay102.cEmp  " +
                "AND hrpay011.cGrpComp = figld011.cGrpComp AND hrpay011.cAcctGrp = figld011.cAcctGrp AND hrpay011.cGrpComp = figld012.cGrpComp " +
                "AND hrpay011.cAcct = figld012.cAcct AND hrpay011.cAcctGrp = figld012.cAcctGrp and " +
                "figld042.csubcode=hrpay102.csubcode  " +
                "GROUP BY hrpay102.cEmp, hremp011.cEmpName, hrpay011.bType,hrpay011.cBen, hrpay102.cEmp, hrpay011.cBen,  " + 
                "hrpay011.cName,hrpay011.cAcctGrp,hrpay011.cAcct,figld011.cAcctGrpName,figld012.cAcctName,figld042.csubcodename,hremp012.cResID,hremp012.cBankAcct ORDER BY cBen,cemp ", ConfigurationManager.ConnectionStrings["u001"].ConnectionString);
            adapter2.Fill(ds, "dttable");

            // ReportViewer1.LocalReport.DataSources.Add();
            //  ReportDataSource rdsAcct2 = new ReportDataSource("Cben", ds.Tables[0]);
            ReportDataSource datasource = new ReportDataSource("DataSet1", ds.Tables[0]);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource);
            ReportViewer1.LocalReport.Refresh();
            ReportViewer1.Visible = true;
                //ReportViewer1.Visible = true;



                

 

            
            }
            else
            {
                RadWindow1.VisibleOnPageLoad = true;
                ddlPayrollAcctFill();
            }







            
            /*
            adapter2 = new SqlDataAdapter(
                strQuery = "SELECT  " +
                            "SUM(isnull((case when hrpay011.bType=1 THEN   (dAmnt)    END),0))Benefit, " +
                            "SUM(isnull((case when hrpay011.bType=0 THEN   (dAmnt)    END),0))Deduction, " +
                            "ISNULL(ltrim(rtrim(hremp012.cResID)),'N/A') as cResID, ISNULL(ltrim(rtrim(hremp012.cBankAcct)),'N/A') as cBankAcct, " +
                            "ltrim(rtrim(hremp011.cEmpName)) cEmpName, ltrim(rtrim(figld042.csubcodename)) cSubcodeName,ltrim(rtrim(hrpay102.cEmp)) cEmp, " +
                            "ltrim(rtrim(hrpay011.cName)) cName, ltrim(rtrim(hrpay011.cBen)) cBen, " +
                            "SUM (hrpay102.dAmnt) dAmnt,(CASE WHEN hrpay011.bType = 1 THEN 'Benefit' else 'Deduction' end ) as 'bType', " +
                            "hrpay011.cAcctGrp,hrpay011.cAcct,LTRIM(RTRIM(figld011.cAcctGrpName)) as cAcctGrpName,LTRIM(RTRIM(figld012.cAcctName)) as cAcctName " +
                            "FROM hrpay102, hrpay011, 	hremp011 LEFT JOIN hremp012 on hremp012.cemp=hremp011.cemp " +
                            ",figld011,figld012,figld042 " +
                            "WHERE 	Ipay =4 AND hrpay102.cGrpComp = 10100001  " +
                            "AND hrpay102.cComp =  1001 AND hrpay102.cGrpComp = hrpay011.cGrpComp AND hrpay102.cGrpComp = hremp011.cGrpComp AND " +
                            "hrpay011.cBen = hrpay102.cBen AND hremp011.cEmp = hrpay102.cEmp " +
                            "AND hrpay011.cGrpComp = figld011.cGrpComp AND hrpay011.cAcctGrp = figld011.cAcctGrp AND hrpay011.cGrpComp = figld012.cGrpComp " +
                            "AND hrpay011.cAcct = figld012.cAcct AND hrpay011.cAcctGrp = figld012.cAcctGrp and " +
                            "figld042.csubcode=hrpay102.csubcode  " +
                            "GROUP BY hrpay102.cEmp, hremp011.cEmpName, hrpay011.bType,hrpay011.cBen, hrpay102.cEmp, hrpay011.cBen,  " +
                            "hrpay011.cName,hrpay011.cAcctGrp,hrpay011.cAcct,figld011.cAcctGrpName,figld012.cAcctName,figld042.csubcodename,hremp012.cResID,hremp012.cBankAcct ORDER BY cBen,cemp ", ConfigurationManager.ConnectionStrings["u001"].ConnectionString);
            adapter2.Fill(ds, "dttable");
            
           // ReportViewer1.LocalReport.DataSources.Add();
          //  ReportDataSource rdsAcct2 = new ReportDataSource("Cben", ds.Tables[0]);
            ReportDataSource rds1 = new ReportDataSource("rds1", ds.Tables["dttable"]);
            ReportViewer1.LocalReport.DataSources.Add(rds1);
            ReportViewer1.LocalReport.Refresh();
            ReportViewer1.LocalReport.DataSources.Clear();
            //ReportViewer1.Visible = true;
             * 
             * */
          
        }
        public void ddlPayrollAcctFill()
        {

            adapter2 = new SqlDataAdapter("SELECT Ipay,ltrim(rtrim(cNar))cNar FROM hrpay101 where hrpay101.cGrpComp=10100001 and  hrpay101.cComp=1001 ", SqlConnection);
            adapter2.Fill(t2);
            ddlPayrollAcct.DataSource = t2;
            ddlPayrollAcct.DataBind();
            Session["Ipay"] = ddlPayrollAcct.SelectedValue;

        }


        protected void Search_Click(object sender, EventArgs e)
        {
            var CheckedItemIndex = 1;
            StringBuilder sbPayrollAcct = new StringBuilder();
            for (CheckedItemIndex = 1; CheckedItemIndex <= ddlPayrollAcct.CheckedItems.Count; CheckedItemIndex++)
            {
                if (CheckedItemIndex != -1)
                {
                    sbPayrollAcct.Append("'");
                    sbPayrollAcct.Append(ddlPayrollAcct.CheckedItems[CheckedItemIndex - 1].Value.ToString());
                   // ddlPayrollAcct.CheckedItems[0].Value.ToString();
                    sbPayrollAcct.Append("'");
                    sbPayrollAcct.Append(",");
                }
            }
            sbPayrollAcct.Append("'");
            sbPayrollAcct.Append("'");
            Session["Ipay"] = sbPayrollAcct.ToString();


            Response.Redirect(Request.Url.AbsolutePath + "/");
        }
        protected void ddlPayrollAcct_ItemsRequested(object sender, Telerik.Web.UI.RadComboBoxItemsRequestedEventArgs e)
        {
            SqlConnection.Open();
            ddlPayrollAcct.Text = "";
            ddlPayrollAcct.Items.Clear();
            adapter2= new SqlDataAdapter ("SELECT Ipay,ltrim(rtrim(cNar))cNar FROM hrpay101 where hrpay101.cGrpComp=10100001 and  hrpay101.cComp=1001", SqlConnection);
            adapter2.Fill(t2);
            ddlPayrollAcct.DataSource = t2;
            ddlPayrollAcct.DataTextField = "Ipay";
            ddlPayrollAcct.DataValueField = "Ipay";

            ddlPayrollAcct.DataBind();
            Session["Ipay"] = ddlPayrollAcct.SelectedValue;

            SqlConnection.Close();



        }
        protected void ddlPayrollAcct_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["Ipay"] = e.Value;
            Session["IpayDesc"] = e.Text.Trim();

        }
        protected void ReportViewer1_Load(object sender, EventArgs e)
        {
            adapter2.Fill(ds, "dttable");

            // ReportViewer1.LocalReport.DataSources.Add();
            //  ReportDataSource rdsAcct2 = new ReportDataSource("Cben", ds.Tables[0]);
            ReportDataSource datasource = new ReportDataSource("DataSet1", ds.Tables[0]);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource);
            ReportViewer1.LocalReport.Refresh();
        }
}
}