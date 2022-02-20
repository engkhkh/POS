using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.PL
{
    public partial class Dashboard : System.Web.UI.Page
    {

        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);

        SqlDataAdapter adapter3;
        SqlDataAdapter adapter4;
        SqlDataAdapter adapter5;
        SqlDataAdapter adapter6;
        SqlDataAdapter adapter7;
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        DataTable t3 = new DataTable();
        DataTable t4 = new DataTable();
        DataTable t5 = new DataTable();
        DataTable dtTable = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
            adapter3 = new SqlDataAdapter("select * from Orders where Orders.cOrderDate BETWEEN CONVERT(datetime,'" + DateTime.Now.AddDays(-30) + "') AND CONVERT(datetime,'" + DateTime.Now + "') and Orders.cGrpCompany='" + Session["grpcmp"].ToString() + "' and Orders.cComp='" + Session["cmp"].ToString() + "'  ORDER BY  cOrderId ASC ", SqlConnection);
            adapter4 = new SqlDataAdapter("select sum(OrdersDetails.cQty) as cQty ,Products.cPId,Products.cPName from Products,OrdersDetails where OrdersDetails.cPId=Products.cPId and OrdersDetails.cOrderDate BETWEEN CONVERT(datetime,'" + DateTime.Now.AddDays(-30) + "') AND CONVERT(datetime,'" + DateTime.Now + "') and OrdersDetails.cGrpCompany='" + Session["grpcmp"].ToString() + "' and OrdersDetails.cComp='" + Session["cmp"].ToString() + "' and Products.cGrpCompany='" + Session["grpcmp"].ToString() + "' and Products.cComp='" + Session["cmp"].ToString() + "' GROUP by Products.cPId,Products.cPName ", SqlConnection);
            adapter5 = new SqlDataAdapter("select cast(Products.cPQtyInStock as float )-sum(OrdersDetails.cQty) as cQtyDiff ,Products.cPId,Products.cPName from Products,OrdersDetails where OrdersDetails.cPId=Products.cPId and OrdersDetails.cOrderDate BETWEEN CONVERT(datetime,'" + DateTime.Now.AddDays(-30) + "') AND CONVERT(datetime,'" + DateTime.Now + "') and OrdersDetails.cGrpCompany='" + Session["grpcmp"].ToString() + "' and OrdersDetails.cComp='" + Session["cmp"].ToString() + "' and Products.cGrpCompany='" + Session["grpcmp"].ToString() + "' and Products.cComp='" + Session["cmp"].ToString() + "' GROUP by Products.cPId,Products.cPName,Products.cPQtyInStock", SqlConnection);
            adapter6 = new SqlDataAdapter("select cast(Products.cPPrice as float )-cast(Products.cPPriceCost as float ) as ProductProfit ,Products.cPQtyInStock as productqtyinstock,Products.cPId,Products.cPName from Products where Products.cGrpCompany='" + Session["grpcmp"].ToString() + "' and Products.cComp='" + Session["cmp"].ToString() + "' GROUP by Products.cPId,Products.cPName,Products.cPQtyInStock,Products.cPPriceCost,Products.cPPrice", SqlConnection);
            adapter7 = new SqlDataAdapter("select cast(Products.cPPrice as float )-cast(Products.cPPriceCost as float ) as ProductProfit ,Products.cPQtyInStock as productqtyinstock,Products.cPId,Products.cPName from Products where Products.cGrpCompany='" + Session["grpcmp"].ToString() + "' and Products.cComp='" + Session["cmp"].ToString() + "' GROUP by Products.cPId,Products.cPName,Products.cPQtyInStock,Products.cPPriceCost,Products.cPPrice", SqlConnection);
            adapter3.Fill(t2);
            adapter4.Fill(dtTable);
            adapter5.Fill(t3);
            adapter6.Fill(t4);
            adapter7.Fill(t5);
            Chart1.DataSource = t2;
            Chart2.DataSource = dtTable;
            Chart3.DataSource = t3;
            Chart4.DataSource = t4;
            Chart5.DataSource = t5;
            Chart1.Series[0].XValueMember = "cOrderId";
            Chart1.Series[0].YValueMembers = "cOrderTotal";
            Chart2.Series[0].XValueMember = "cPName";
            Chart2.Series[0].YValueMembers = "cQty";
            Chart3.Series[0].XValueMember = "cPName";
            Chart3.Series[0].YValueMembers = "cQtyDiff";
            Chart4.Series[0].XValueMember = "cPName";
            Chart4.Series[0].YValueMembers = "productqtyinstock";
            Chart5.Series[0].XValueMember = "cPName";
            Chart5.Series[0].YValueMembers = "ProductProfit";
            

            Chart1.DataBind();
            Chart2.DataBind();
            Chart3.DataBind();
            Chart4.DataBind();
            Chart5.DataBind();



        }
    }
}