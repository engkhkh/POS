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
    public partial class Unhold : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlCommand cmd4 = new SqlCommand();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlDataAdapter da3 = new SqlDataAdapter();
        SqlDataAdapter da4 = new SqlDataAdapter();
        SqlDataAdapter da5 = new SqlDataAdapter();
        SqlDataAdapter da7 = new SqlDataAdapter();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        DataTable dt6 = new DataTable();
        DataTable dt7 = new DataTable();
        DataTable dt8 = new DataTable();
        DataTable dt9 = new DataTable();
        Pos.BL.cProduct p = new BL.cProduct();
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
                    //    Session["cmp"] = dt.Rows[0][0].ToString();
                    //   Session["grpcmp"] = dt.Rows[0][3].ToString(); USE SESSION COMING FROM LOGIN PAGE SAVED ..
                   da = new SqlDataAdapter("SELECT * FROM [Users]  WHERE [cGrpCopany]='" + Session["grpcmp"].ToString() + "' AND [cComp]='" + Session["cmp"].ToString() + "' ", sqlcon);
                   da2 = new SqlDataAdapter("select * from [Company] where [cGrpCompany]='" + Session["grpcmp"].ToString() + "' AND [cCompany]='" + Session["cmp"].ToString() + "' ", sqlcon);
                   da.Fill(dt3);
                   da2.Fill(dt1);
                   ddluser.DataSource = dt3;
                   ddlcompch.DataSource = dt1;
                   ddluser.DataTextField = "cUserName";
                   ddluser.DataValueField = "cId";
                   ddlcompch.DataTextField = "cCompName";
                   ddlcompch.DataValueField = "cCompany";
                   ddluser.DataBind();
                   ddlcompch.DataBind();
                    //
                   SqlDataAdapter da8 = new SqlDataAdapter("select * from Clients  WHERE [cGrpCompany]='" + Session["grpcmp"].ToString() + "' AND [cCompany]='" + Session["cmp"].ToString() + "' ", sqlcon);
                   da8.Fill(dt8);
                   DropDownListclient.DataSource = dt8;
                   DropDownListclient.DataTextField = "cClientName";
                   DropDownListclient.DataValueField = "cClientId";
                   DropDownListclient.DataBind();
                   SqlDataAdapter da9 = new SqlDataAdapter(" select * from PaymentType where [cGrpCompany]='" + Session["grpcmp"].ToString() + "' AND [cCompany]='" + Session["cmp"].ToString() + "'  ", sqlcon);
                   da9.Fill(dt9);
                   DropDownListpaymenttype.DataSource = dt9;
                   DropDownListpaymenttype.DataTextField = "cPaymentType";
                   DropDownListpaymenttype.DataValueField = "cPaymentId";
                   DropDownListpaymenttype.DataBind();
                   //
                    

                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(RadioButton1.Checked)
            {
                da3 = new SqlDataAdapter("select * from [OrdersDetails]  WHERE [cGrpCompany]='" + Session["grpcmp"].ToString() + "' AND [cComp]='" + Session["cmp"].ToString() + "' and cOrderId='" + TextBoxOrderId.Text + "' and cId='" + ddluser.SelectedValue + "' and cFlagsave=2  ", sqlcon);
                 da3.Fill(dt4);
                 GridView1.DataSource = dt4;
                 GridView1.DataBind();
                 btnhsaved.Visible = true;
                 DropDownListclient.Visible = true;
                 DropDownListpaymenttype.Visible = true;

            }
            else 
            {
                da7 = new SqlDataAdapter("select * from [OrdersDetails]  WHERE [cGrpCompany]='" + Session["grpcmp"].ToString() + "' AND [cComp]='" + Session["cmp"].ToString() + "' and cOrderId='" + TextBoxOrderId.Text + "' and cId='" + ddluser.SelectedValue + "'  ", sqlcon);
                da7.Fill(dt7);
                GridView1.DataSource = dt7;
                GridView1.DataBind();
                btnsaveorders.Visible = true;
                DropDownListclient.Visible = true;
                DropDownListpaymenttype.Visible = true;
            }

        }
        protected void ShowData()
        {
            da4 = new SqlDataAdapter("select [cPId] ,[cProdName] ,[cQty] ,[cPrice] ,[cTotal]  from [OrdersDetails] where cId='" + ddluser.SelectedValue + "' AND  cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "' AND  cOrderId='" + TextBoxOrderId.Text + "' ", sqlcon);
          
            da4.Fill(dt5);
            GridView1.DataSource = dt5;
            GridView1.DataBind();
            //
            Labeltotalitems.Text = GridView1.Rows.Count.ToString();
            double sum = 0;
            foreach (DataRow dr in dt5.Rows)
            {
                sum = sum + Convert.ToDouble(dr["cTotal"]);

            }

            Labeltotal.Text = Convert.ToString(sum);
            double vatamount = sum * 5 / 100;
            TextBoxvat.Text = Convert.ToString(vatamount);
            //double totalpaye = sum - Convert.ToDouble(TextBoxdisc.Text);
            //Labeltotalpaybale.Text = Convert.ToString(totalpaye);
            //TextBoxnet.Text = Convert.ToString(totalpaye);
            //TextBoxremaining.Text = "";
            //TextBoxpaid.Text = "0";
            ////  ddlcompch.SelectedIndex = 0;


        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            Label prodname = GridView1.Rows[e.RowIndex].FindControl("lbl_prodname") as Label;
            TextBox qty = GridView1.Rows[e.RowIndex].FindControl("txt_qty") as TextBox;
            TextBox price = GridView1.Rows[e.RowIndex].FindControl("txt_price") as TextBox;
            TextBox pricet = GridView1.Rows[e.RowIndex].FindControl("txt_pricet") as TextBox;
            sqlcon.Open();
            //updating the record  
             cmd4 = new SqlCommand("Update [OrdersDetails] set [cQty]='" + qty.Text + "',[cPrice]='" + Convert.ToDouble(price.Text) * Convert.ToDouble(qty.Text) + "',[cTotal]='" + Convert.ToDouble(price.Text) * Convert.ToDouble(qty.Text) + "' where cId='" + ddluser.SelectedValue + "' AND cPId='" + id.Text + "'  AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "' and cOrderId='" + TextBoxOrderId.Text + "' ", sqlcon);
             //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd4.ExecuteNonQuery();
           sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            Label prodname = GridView1.Rows[e.RowIndex].FindControl("lbl_prodname") as Label;
            TextBox qty = GridView1.Rows[e.RowIndex].FindControl("txt_qty") as TextBox;
            TextBox price = GridView1.Rows[e.RowIndex].FindControl("txt_price") as TextBox;
            sqlcon.Open();
            //updating the record  
            cmd4 = new SqlCommand("delete from [OrdersDetails] where cId='" + ddluser.SelectedValue + "' AND  cQty='" + qty.Text + "'AND cPrice='" + price.Text + "' AND  cPId='" + id.Text + "'  AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "' and  cOrderId='" + TextBoxOrderId.Text + "' ", sqlcon);
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd4.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            ShowData();

        }

        protected void ddluser_SelectedIndexChanged(object sender, EventArgs e)
        {
             da5 = da3 = new SqlDataAdapter("select DISTINCT cOrderId from [OrdersDetails]  WHERE [cGrpCompany]='" + Session["grpcmp"].ToString() + "' AND [cComp]='" + Session["cmp"].ToString() + "'  and cId='" + ddluser.SelectedValue + "' and cFlagsave=2  ", sqlcon);
            
            da5.Fill(dt6);
            ddlinvoiceholding.DataSource = dt6;
            ddlinvoiceholding.DataTextField = "cOrderId";
            ddlinvoiceholding.DataValueField = "cOrderId";
            ddlinvoiceholding.DataBind();

        }

        protected void ddlinvoiceholding_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxOrderId.Text = ddlinvoiceholding.SelectedValue;
        }

        protected void btnhsaved_Click(object sender, EventArgs e)
        {
            try
            {
                sqlcon.Open();
                cmd4 = new SqlCommand("update [OrdersDetails] set [cFlagsave]=1,cOrderDate='"+DateTime.Now+"' where cOrderId='" + TextBoxOrderId.Text + "'", sqlcon);
                cmd = new SqlCommand("insert into [Orders] (cGrpCompany,cComp,cOrderId,cOrderDate,cCustomerId,cPaymentType,cVatAmount,cOrderTotal) values ('" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','"+TextBoxOrderId.Text.Trim()+"','"+DateTime.Now+"','"+DropDownListclient.SelectedValue+"','"+DropDownListpaymenttype.SelectedValue+"','"+TextBoxvat.Text+"','"+Labeltotal.Text+"') ", sqlcon);
                SqlCommand cmd5 = new SqlCommand("insert into [updateinvoice] (cGrpCompany,cComp,cUser,cOrderId,cTotal,cVat,cCountItems,cUpdateType,cGetUpdateTime) values ('" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','" + Session["username"] .ToString()+ "','"+TextBoxOrderId.Text.Trim()+"','"+Labeltotal.Text.Trim()+"','"+TextBoxvat.Text.Trim()+"','"+Labeltotalitems.Text.Trim()+"','"+0+"','"+DateTime.Now+"')", sqlcon);
                //0 meand holding ,1 mean return back invoice 
                cmd.ExecuteNonQuery();
                cmd4.ExecuteNonQuery();
                cmd5.ExecuteNonQuery();
                sqlcon.Close();
                Label9.Text = "saved";
            }
            catch(Exception ex)
            {
                Label10.Text = ex.Message;
            }

        }

        protected void btnsaveorders_Click(object sender, EventArgs e)
        {
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand("update [Orders]  set[cVatAmount]='" + Convert.ToDouble(TextBoxvat.Text) + "' ,[cOrderTotal]='" + Convert.ToDouble(Labeltotal.Text) + "' , cCustomerId='" + DropDownListclient.SelectedValue + "', cPaymentType='" + DropDownListpaymenttype.SelectedValue + "' where cOrderId='" + TextBoxOrderId.Text + "' ", sqlcon);
                SqlCommand cmd5 = new SqlCommand("insert into updateinvoice (cGrpCompany,cComp,cUser,cOrderId,cTotal,cVat,cCountItems,cUpdateType,cGetUpdateTime) values ('" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','" + Session["username"].ToString() + "','" + TextBoxOrderId.Text.Trim() + "','" + Labeltotal.Text.Trim() + "','" + TextBoxvat.Text.Trim() + "','" + Labeltotalitems.Text.Trim() + "','" + 1 + "','" + DateTime.Now + "')", sqlcon);
                //0 meand holding ,1 mean return back invoice 
                cmd.ExecuteNonQuery();
                cmd5.ExecuteNonQuery();
                sqlcon.Close();
                Label9.Text = "Saved and updated";
            }
            catch (Exception ex)
            {
                Label10.Text = ex.Message;
            }
              
        }
    }
}