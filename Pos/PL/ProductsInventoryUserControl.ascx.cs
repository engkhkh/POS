using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.Configuration;

namespace Pos.PL
{
    public partial class ProductsInventoryUserControl : System.Web.UI.UserControl
    {
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        Pos.BL.cProduct p = new BL.cProduct();
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

                }

            }

        }
        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlcateg.Items.Clear();
            ddlcateg.Items.Add("Select Category");
            Label9.Text = "";
            Label11.Text = "";

            SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter("SELECT *FROM [pos].[dbo].[Categories] where cComp='" + ddlcompch.SelectedValue + "' ", WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
            SqlDataAdapter da2 = new System.Data.SqlClient.SqlDataAdapter("SELECT *FROM [pos].[dbo].[Inventory] where cCompany='" + ddlcompch.SelectedValue + "' ", WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
            SqlDataAdapter da3 = new System.Data.SqlClient.SqlDataAdapter("SELECT *FROM [pos].[dbo].[Units]", WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
            SqlDataAdapter da4 = new System.Data.SqlClient.SqlDataAdapter("SELECT *FROM [pos].[dbo].[Suppliers] where cCompany='" + ddlcompch.SelectedValue + "' ", WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
            da.Fill(dt2);
            da2.Fill(dt3);
            da3.Fill(dt4);
            da4.Fill(dt5);
            //  dt2 = p.fnreadcategory(ddlcompch.SelectedValue);
            if (dt2.Rows.Count > 0 )
            {
                // Session["catg"] = dt2.Rows[0][2].ToString();
                ddlcateg.DataSource = dt2;
                ddlcateg.DataTextField = "cCDesc";
                ddlcateg.DataValueField = "cCId";
                ddlcateg.DataBind();
                //
                ddlInventory.DataSource = dt3;
                ddlInventory.DataTextField = "cVName";
                ddlInventory.DataValueField = "cVId";
                ddlInventory.DataBind();
                //
                ddlunit.DataSource = dt4;
                ddlunit.DataTextField = "cTypeName";
                ddlunit.DataValueField = "cTypeId";
                ddlunit.DataBind();
                //
                ddlsup.DataSource = dt5;
                ddlsup.DataTextField = "cSupName";
                ddlsup.DataValueField = "cSupId";
                ddlsup.DataBind();

            }
            Session["cmp"] = ddlcompch.SelectedValue;
            sqlcon.Open();
            cmd = new SqlCommand("SELECT MAX ([cProdId]+1) as p FROM [pos].[dbo].[InventoryProducts] WHERE cCompId='" + Session["cmp"].ToString() + "'", sqlcon);


            //    int x=Convert.ToInt32(cmd.ExecuteScalar());
            if (cmd.ExecuteScalar().Equals(DBNull.Value))
            {
                int init = 10000000;
                TextBoxpid.Text = Convert.ToString(init);

            }
            else
            {

                TextBoxpid.Text = Convert.ToString(cmd.ExecuteScalar());
            }


            sqlcon.Close();


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["cmp"] = ddlcompch.SelectedValue;
            Session["catg"] = ddlcateg.SelectedValue;
            Session["inventory"] = ddlInventory.SelectedValue;
            Session["unit"] = ddlunit.SelectedValue;
            Session["supplier"] = ddlsup.SelectedValue;
            try
            {
                sqlcon.Open();
             //   SqlCommand cmd1 = new SqlCommand("INSERT INTO Products (cGrpCompany ,cComp ,cPId,cPName ,cPQtyInStock ,cPPrice ,cPImage,cPBcode ,cCId,cUnitId) VALUES ('" + Session["grpcmp"].ToString() + "', '" + Session["cmp"].ToString() + "', '" + TextBoxpid.Text + "', '" + TextBoxpdname.Text + "', '" + TextBoxpdqty.Text + "', '" + TextBoxpdpurchaseprice.Text + "','" + null + "','" + TextBoxpdbarcode.Text + "','" + Session["catg"].ToString() + "','" + Session["unit"] .ToString()+ "')", sqlcon);
                cmd = new SqlCommand("INSERT INTO InventoryProducts (cGrpCompany ,cCompId ,cProdInventoryId,cProdCatId ,cProdId ,cProdName,cProdQtyStock,cProdPricePurchase,cProdPriceSales,cBarCode,cSupId,cUnitId) VALUES ('" + Session["grpcmp"].ToString() + "', '" + Session["cmp"].ToString() + "','" + Session["inventory"].ToString() + "','" + Session["catg"].ToString() + "', '" + TextBoxpid.Text + "', '" + TextBoxpdname.Text + "', '" + TextBoxpdqty.Text + "', '" + TextBoxpdpurchaseprice.Text + "','" + TextBoxpdsalesprice.Text + "','" + TextBoxpdbarcode.Text + "','" + Session["supplier"].ToString()+ "','" + Session["unit"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
             //   cmd1.ExecuteNonQuery();

                //int queryResult = cmd.ExecuteNonQuery();
                //if (queryResult == 1)
                Label9.Text = "product Created /تم حفظ المنتج";
                Label10.Text = "";

            }
            catch (Exception ex)
            {
                Label10.Text = "Error: " + ex.Message;
                Label9.Text = "";
            }
            finally
            {
                sqlcon.Close();
            }
            TextBoxpid.Text = "";
            TextBoxpdname.Text = "";
            TextBoxpdqty.Text = "";
          
            TextBoxpdpurchaseprice.Text = "";
            TextBoxpdsalesprice.Text = "";
            TextBoxpdbarcode.Text = "";
            // Label10.Text = "";
            // Label9.Text = "";
           
            Label11.Text = "";
            ddlcateg.SelectedIndex = 0;
            ddlcompch.SelectedIndex = 0;
            ddlInventory.SelectedIndex = 0;
            ddlunit.SelectedIndex = 0;
            ddlsup.SelectedIndex = 0;
           

        }
}
}