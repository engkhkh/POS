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
    public partial class ItemsInventory : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        DataTable dt6 = new DataTable();
        Pos.BL.cProduct p = new BL.cProduct();
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                
                dt = p.fnreadcompany();
                if (dt.Rows.Count > 0)
                {
                    // Session["cmp"] = dt.Rows[0][0].ToString();
                    Session["grpcmp"] = dt.Rows[0][3].ToString();
                    ddlcompch.DataSource = dt;
                    ddlcompch.DataTextField = "cCompName";
                    ddlcompch.DataValueField = "cCompany";
                    ddlcompch.DataBind();
                    ///
                    //TextBoxpdqty.Text = "1.0";
                    //TextBoxpdremaining.Text = "0.0";
                    //TextBoxpdsaleditem.Text = "1.0";
                    //TextBoxpdnew.Text = "0.0";
                    //TextBoxpdprice.Text = "0.0";
                    //TextBoxpdcost.Text = "0.0";
                    //TextBoxpdTOPIC.Text = "";
                    //TextBoxpid.Text = "";
                    //TextBoxpdname.Text = "";
                    Label10.Text = "";
                    Label9.Text = "";
                    ////
                  

                }
                this.TextBox1.Text = System.DateTime.Now.ToShortDateString();
                this.TextBox2.Text = System.DateTime.Now.ToShortDateString(); ;
                this.pnlCalendar.Attributes.Add("style",
                     "DISPLAY: none; POSITION: absolute");
                this.Panel1.Attributes.Add("style",
                    "DISPLAY: none; POSITION: absolute");
            }
            

        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlcateg.Items.Clear();
            ddlcateg.Items.Add("Select Category");

            SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter("SELECT *FROM [pos].[dbo].[Categories] where cGrpCompany='" + Session["grpcmp"].ToString()+ "' and   cComp='" + ddlcompch.SelectedValue + "' ", WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
            SqlDataAdapter da3 = new System.Data.SqlClient.SqlDataAdapter("SELECT *FROM [pos].[dbo].[Units]", WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
            da.Fill(dt2);
            da3.Fill(dt3);
            //  dt2 = p.fnreadcategory(ddlcompch.SelectedValue);
            if (dt2.Rows.Count > 0)
            {
             //  Session["grpcmp"] = dt.Rows[0][0].ToString();
                // Session["catg"] = dt2.Rows[0][2].ToString();
                ddlcateg.DataSource = dt2;
                ddlcateg.DataTextField = "cCDesc";
                ddlcateg.DataValueField = "cCId";
                ddlcateg.DataBind();
                //
                
                //
                ddlunit.DataSource = dt3;
                ddlunit.DataTextField = "cTypeName";
                ddlunit.DataValueField = "cTypeId";
                ddlunit.DataBind();

            }
            Session["cmp"] = ddlcompch.SelectedValue;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            try
            {
                cmd = new SqlCommand("UPDATE [dbo].[Products] SET [cPPriceCost]='" + TextBoxpdcost.Text + "' ,[cPPrice]='" + TextBoxpdprice.Text + "',[cPQtyInStock]='" + TextBoxpdnew.Text + "' where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cComp='" + ddlcompch.SelectedValue + "' and cCId='" + ddlcateg.SelectedValue + "' and cPId='" + ddlproduct.SelectedValue + "' ", sqlcon);
      
                cmd2 = new SqlCommand("insert into [ItemsInventory] (cGrpCompany,cComp,cCId,cPId,cOldQty,cNewQty,cUnit,cPNewCost,cPNewSale,cPSaledQtyFromOldQty,cDateFrom,cDateTo,cTopic)  VALUES ('" + Session["grpcmp"].ToString() + "','" + ddlcompch.SelectedValue + "','" + ddlcateg.SelectedValue + "','" + ddlproduct.SelectedValue + "'," + Convert.ToDouble(TextBoxpdqty.Text) + "," + Convert.ToDouble(TextBoxpdnew.Text) + ",'" + ddlunit.SelectedValue + "'," + Convert.ToDouble(TextBoxpdcost.Text) + "," + Convert.ToDouble(TextBoxpdprice.Text) + "," + Convert.ToDouble(TextBoxpdsaleditem.Text) + ",'" + Calendar1.SelectedDate + "','" + DateTime.Now + "','" + TextBoxpdTOPIC.Text + "')", sqlcon);
                sqlcon.Open();
                cmd.ExecuteNonQuery();
               cmd2.ExecuteNonQuery();
                sqlcon.Close();
                Label9.Text = "updated";
            }
            catch (SqlException ex)
            {
                Label10.Text = ex.Message;
                
            }
            //TextBoxpdqty.Text = "0.0";
            //TextBoxpdremaining.Text = "1.0";
            //TextBoxpdsaleditem.Text = "1.0";
            //TextBoxpdnew.Text = "0.0";
            //TextBoxpdprice.Text = "0.0";
            //TextBoxpdcost.Text = "0.0";
            ////TextBoxpdTOPIC.Text = "";
            //TextBoxpid.Text = "";
            //TextBoxpdname.Text = "";
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            this.pnlCalendar.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
            this.pnlCalendar.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            this.Panel1.Attributes.Add("style",
                     " POSITION: absolute");

        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox2.Text = Calendar2.SelectedDate.ToShortDateString();
            this.Panel1.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }

        protected void ddlproduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataAdapter da6 = new SqlDataAdapter(" select *, cTypeName as cTypeName from [Products],[Units] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cComp='" + ddlcompch.SelectedValue + "' and cCId='" + ddlcateg.SelectedValue + "' and cPId='" + ddlproduct.SelectedValue + "' and Units.cTypeId=Products.cUnitId ", sqlcon);
            da6.Fill(dt5);
            SqlDataAdapter da7 = new SqlDataAdapter("SELECT SUM(OrdersDetails.cQty) from OrdersDetails where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cComp='" + ddlcompch.SelectedValue + "' and cCId='" + ddlcateg.SelectedValue + "' and  OrdersDetails.cPId='" + ddlproduct.SelectedValue + "' AND  OrdersDetails.cOrderDate BETWEEN CONVERT(datetime,'" + Calendar1.SelectedDate.ToShortDateString() + "') AND CONVERT(datetime,'" + DateTime.Now+ "') ", sqlcon);
            da7.Fill(dt6);
            try
            {
                if (dt5.Rows.Count > 0)
                {
                    // Session["grpcmp"] = dt5.Rows[0][0].ToString();
                    TextBoxpid.Text = dt5.Rows[0][2].ToString();
                    TextBoxpdname.Text = dt5.Rows[0][3].ToString();
                    TextBoxpdqty.Text = dt5.Rows[0][4].ToString();
                    TextBoxpdcost.Text = dt5.Rows[0][5].ToString();
                    TextBoxpdprice.Text = dt5.Rows[0][6].ToString();
                    ddlunit.SelectedValue = dt5.Rows[0][12].ToString();
                    TextBoxpdsaleditem.Text = dt6.Rows[0][0].ToString();
                    Label10.Text = "";
                    Label9.Text = "";

                }

                double remaining = Convert.ToDouble(TextBoxpdqty.Text) - Convert.ToDouble(TextBoxpdsaleditem.Text);
                TextBoxpdremaining.Text = Convert.ToString(remaining);
            }
            catch(Exception ex)
            {
                Label10.Text = ex.Message;
            }

        }

        protected void ddlcateg_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["catg"] = ddlcateg.SelectedValue;
            da2 = new SqlDataAdapter("select * from [Products] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cComp='" + ddlcompch.SelectedValue + "' and cCId='" + ddlcateg.SelectedValue + "' ", sqlcon);
            da2.Fill(dt4);
            ddlproduct.DataSource = dt4;
            ddlproduct.DataTextField = "cPName";
            ddlproduct.DataValueField = "cPId";
            ddlproduct.DataBind();

        }
    }
}