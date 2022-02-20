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
    public partial class Invoices : System.Web.UI.Page
    {

        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlDataAdapter da3 = new SqlDataAdapter();
        SqlDataAdapter sqladapter = new SqlDataAdapter();
		SqlDataAdapter da9 = new SqlDataAdapter();
		SqlDataAdapter da99 = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        SqlCommand cmd3 = new SqlCommand();
        SqlCommand cmd4 = new SqlCommand();
        SqlCommand cmd5 = new SqlCommand();
        SqlCommand cmd6 = new SqlCommand();
        SqlCommand cmd7 = new SqlCommand();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt8 = new DataTable();
        DataTable dt9 = new DataTable();
		  DataTable dt99 = new DataTable();
        DataTable datable = new DataTable();
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
                 //   Session["grpcmp"] = dt.Rows[0][3].ToString();
                    SqlDataAdapter da8 = new SqlDataAdapter("SELECT * FROM [PaymentType] WHERE [cGrpCompany]='" + Session["grpcmp"].ToString() + "' AND [cCompany]='" + Session["cmp"].ToString() + "' ", sqlcon);
                   da9 = new SqlDataAdapter("SELECT * FROM [bpcontacts] WHERE [cGrpCompany]='" + Session["grpcmp"].ToString() + "' AND [cCompany]='" + Session["cmp"].ToString() + "'   ", sqlcon);
                    da8.Fill(dt8);
                    da9.Fill(dt9);
                    ddlcompch.DataSource = dt8;
                    DropDownList1.DataSource = dt9;
                    ddlcompch.DataTextField = "cPaymentType";
                    ddlcompch.DataValueField = "cPaymentId";
                    DropDownList1.DataTextField = "bpname";
                    DropDownList1.DataValueField = "bpid";
                    ddlcompch.DataBind();
                    DropDownList1.DataBind();
					
								

                }
               

            }
            da = new SqlDataAdapter("SELECT * FROM [pos].[dbo].[Categories] where cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"] .ToString()+ "' ", sqlcon);
            da.Fill(dt1);
            
            dlInvoices.DataSource = dt1;
            dlInvoices.DataBind();
           // TXTBXSCANER.Focus();
            MultiView1.ActiveViewIndex = 0;

        
            
        }
 

        protected void dlInvoices_ItemCommand(object source, DataListCommandEventArgs e)
        {
			
            /* declaring variable as integer Type to store Id value in i */
            int i;

            /* select an row index where you selected Id */
            int index = Convert.ToInt32(e.Item.ItemIndex);

            /*To get and Link Button Form selected row*/
            LinkButton lnkId = (LinkButton)e.Item.FindControl("lnkId");

            /* Assigning selected Id Value to Display in Label */
           // Label1.Text = lnkId.Text;

            /* If you want to store selected Id value in i variable */
            i = Convert.ToInt32(lnkId.Text);
            da2 = new SqlDataAdapter("SELECT * FROM [pos].[dbo].[Products] where cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "' AND cCId='" + lnkId.Text + "'", sqlcon);
            da2.Fill(dt2);
            DataList1.DataSource = dt2;
            DataList1.DataBind();

        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            /* declaring variable as integer Type to store Id value in i */
            int i;

            /* select an row index where you selected Id */
            int index = Convert.ToInt32(e.Item.ItemIndex);

            /*To get and Link Button Form selected row*/
            LinkButton lnkId = (LinkButton)e.Item.FindControl("lnkcPId");
          /*  int count = DataList1.Items.Count;
            for (int  j = 0; j < count; j++)
            {
                if (e.CommandName == "Item")
                {
                    int index2 = Convert.ToInt32(e.Item.ItemIndex);
                    LinkButton lnkId2 = (LinkButton)e.Item.FindControl("lnkcPId");

                }
            }*/

                /* Assigning selected Id Value to Display in Label */
             //   Label1.Text = lnkId.Text;

            /* If you want to store selected Id value in i variable */
            i = Convert.ToInt32(lnkId.Text);
            da2 = new SqlDataAdapter("SELECT * FROM [pos].[dbo].[Products] where cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "'  AND cPId='" + lnkId.Text + "'", sqlcon);
            da2.Fill(dt2);
            if (dt2.Rows.Count > 0)
            {
               Session["grpcmp"] = dt2.Rows[0][0].ToString();
               Session["cmp"] = dt2.Rows[0][1].ToString();
               Session["cpid"] = dt2.Rows[0][2].ToString();
               Session["cpname"] = dt2.Rows[0][3].ToString();
               Session["cpqtyinstock"] = dt2.Rows[0][4].ToString();
               int qtystock = 1;
               Session["cpprice"] = dt2.Rows[0][6].ToString();
               
            //   Session["cppricecostperunit"] = dt2.Rows[0][6].ToString();
               Session["cpparcode"] = dt2.Rows[0][8].ToString();
               Session["cpcatid"] = dt2.Rows[0][9].ToString();
               Session["cpunitid"] = dt2.Rows[0][10].ToString();
               int cFlagsave = 0;
              // cmd = new SqlCommand("INSERT INTO [Orders] (cGrpCompany,cComp) VALUES('" + Session["grpcmp"].ToString() + "','" + Session["cmp"] .ToString()+ "')", sqlcon);
              // cmd2 = new SqlCommand("INSERT INTO [Order] (cCompany) VALUES ('"+Session["cmp"] .ToString()+"')", sqlcon);
               cmd3 = new SqlCommand("INSERT INTO [OrdersDetails] (cGrpCompany,cComp,cCId,cPId,cProdName,cQty,cPrice,cTotal,cFlagsave,cId) VALUES ('" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','" + Session["cpcatid"].ToString() + "','" + Session["cpid"].ToString() + "','" + Session["cpname"].ToString() + "'," + qtystock + ",'" + Session["cpprice"].ToString() + "','" + qtystock *Convert.ToDouble(Session["cpprice"].ToString())+ "'," + cFlagsave + ",'" + Session["username"].ToString() + "') ", sqlcon);
               sqlcon.Open();
              // cmd.ExecuteNonQuery();
              // cmd2.ExecuteNonQuery();
               cmd3.ExecuteNonQuery();
               ShowData();
               sqlcon.Close();
                
            }
          //  MultiView1.ActiveViewIndex = 1;

          }

        protected void ShowData()
        {
            da3 = new SqlDataAdapter("select [cPId] ,[cProdName] ,[cQty] ,[cPrice] ,[cTotal]  from [OrdersDetails] where cId='" + Session["username"].ToString() + "' AND  cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "' AND  cFlagsave=0 ", sqlcon);
            da3.Fill(dt3);
            GridView1.DataSource = dt3;
            GridView1.DataBind();
            //
           Labeltotalitems.Text= GridView1.Rows.Count.ToString();
           double sum = 0;
           double vatamount = 0;
           double sumplusvat = 0;
           double totalpaye = 0;
           foreach (DataRow dr in dt3.Rows)
           {
               sum = sum + Convert.ToDouble(dr["cTotal"]);
               
           }
           
           
           vatamount = sum * 15 / 100;
           sumplusvat = sum + vatamount;
           totalpaye = sumplusvat - Convert.ToDouble(TextBoxdisc.Text);
           Labeltotal.Text = Convert.ToString(sum);
           TextBoxvat.Text = Convert.ToString(vatamount);
           Labeltotalpaybale.Text = Convert.ToString(totalpaye);
           TextBoxnet.Text = Convert.ToString(totalpaye);
           TextBoxremaining.Text = "";
           TextBoxpaid.Text = "0";
           

        //  ddlcompch.SelectedIndex = 0;
           

        }
        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }
        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            Label prodname = GridView1.Rows[e.RowIndex].FindControl("lbl_prodname") as Label;
            TextBox qty = GridView1.Rows[e.RowIndex].FindControl("txt_qty") as TextBox;
            TextBox price = GridView1.Rows[e.RowIndex].FindControl("txt_price") as TextBox;
            TextBox pricet = GridView1.Rows[e.RowIndex].FindControl("txt_pricet") as TextBox;
            sqlcon.Open();
            //updating the record  
            cmd4 = new SqlCommand("Update [OrdersDetails] set [cQty]='" + qty.Text + "',[cPrice]='" + Convert.ToDouble(price.Text)  + "',[cTotal]='" + Convert.ToDouble(price.Text) * Convert.ToDouble(qty.Text) + "' where cId='" + Session["username"].ToString() + "' AND cPId='" + id.Text + "'  AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "' AND cFlagsave=0 ", sqlcon);
            //* Convert.ToDouble(qty.Text)
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd4.ExecuteNonQuery();
           sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowData();
        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            Label prodname = GridView1.Rows[e.RowIndex].FindControl("lbl_prodname") as Label;
            TextBox qty = GridView1.Rows[e.RowIndex].FindControl("txt_qty") as TextBox;
            TextBox price = GridView1.Rows[e.RowIndex].FindControl("txt_price") as TextBox;
            sqlcon.Open();
            //updating the record  
            cmd4 = new SqlCommand("delete from [OrdersDetails] where cId='" + Session["username"].ToString() + "' AND  cQty='" + qty.Text + "'AND cPrice='" + price.Text + "' AND  cPId='" + id.Text + "'  AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "' AND cFlagsave=0 ", sqlcon);
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd4.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected void Buttoncancel_Click(object sender, EventArgs e)
        {
            cmd4 = new SqlCommand("delete from [OrdersDetails] where cId='" + Session["username"].ToString() + "' AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "' AND cFlagsave=0 ", sqlcon);
            sqlcon.Open();
            cmd4.ExecuteNonQuery();
            sqlcon.Close();
            GridView1.EditIndex = -1;
            ShowData();

        }

        protected void Buttonhold_Click(object sender, EventArgs e)
        {
            selectmax();
            cmd4 = new SqlCommand("UPDATE [OrdersDetails] SET [cFlagsave]=2 ,cDisc='" + TextBoxdisc.Text + "', [cOrderDate]='" + DateTime.Now + "' ,[cOrderId]='" + Session["init"].ToString() + "'  WHERE cFlagsave=0   ", sqlcon);
            sqlcon.Open();
            cmd4.ExecuteNonQuery();
            sqlcon.Close();
            GridView1.EditIndex = -1;
            ShowData(); 
            /*
             * 
             * cId='" + Session["username"].ToString() + "' AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "' AND
             * */
        }
        protected void selectmax()
        {
            sqlcon.Open();
            cmd7 = new SqlCommand("SELECT MAX ([cOrderId]+1) as p FROM [pos].[dbo].[OrdersDetails] WHERE cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cComp='" + Session["cmp"].ToString() + "'", sqlcon);


            //    int x=Convert.ToInt32(cmd.ExecuteScalar());
            if (cmd7.ExecuteScalar().Equals(DBNull.Value))
            {
                
                int init = 20000000;
                Session["init"] = Convert.ToString(init);

            }
            else
            {

                Session["init"] = Convert.ToString(cmd7.ExecuteScalar());
            }


            sqlcon.Close();
        }

        protected void Buttonpayment_Click(object sender, EventArgs e)
        {
          //  Button2.Visible = true;
          //  Button3.Visible = true;
          //  Button6.Visible = true;
          ////  Label8.Visible = true;
          //  TextBoxpaid.Visible = true;
          ////  Label7.Visible = true;
          //  TextBoxnet.Visible = true;
          ////  Label1.Visible = true;
          //  TextBoxremaining.Visible = true;
          //  ddlcompch.Visible = true;
            
            
            
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {


            TextBoxvat.Text = GridView1.Rows.Count.ToString();


        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("osk.exe");
        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
            try
            {
                double remianing = Convert.ToDouble(TextBoxpaid.Text) - Convert.ToDouble(Labeltotalpaybale.Text);
                TextBoxremaining.Text = Convert.ToString(remianing);
            }
            catch(Exception ex)
            {
                TextBoxremaining.Text = "ضع مبلغ";
            }

            

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            getmaxijv();
          
            Session["sum"] = Labeltotal.Text;
            Session["vat"] = TextBoxvat.Text;
            Session["net"] = TextBoxnet.Text;
            Session["paid"] = TextBoxpaid.Text;
            Session["client"] = DropDownList1.SelectedItem.Text;
           
            // put in orderdetails and orders table 
            selectmax();
            Session["invoiceId"] = Session["init"].ToString() + ddlcompch.SelectedItem.Text + ":قيمة فاتورة";
            Session["invoiceId1"] = Session["init"].ToString() +ddlcompch.SelectedItem.Text+ ":تحصيل فاتورة";
            sqlcon.Open();
            cmd = new SqlCommand("UPDATE  [OrdersDetails] SET cOrderId='" + Session["init"].ToString() + "',cDisc='" + TextBoxdisc.Text + "',cFlagsave=1,cOrderDate='" + DateTime.Now + "'  WHERE cFlagsave=0 ", sqlcon);
            cmd2 = new SqlCommand("INSERT INTO [Orders] (cGrpCompany,cComp,cOrderId,cOrderDate,cCustomerId,cPaymentType,cVatAmount,cOrderTotal) VALUES ('" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','" + Session["init"].ToString() + "','" + DateTime.Now + "','" + DropDownList1.SelectedValue + "','" + ddlcompch.SelectedValue + "','" + TextBoxvat.Text + "','" +TextBoxnet.Text + "') ", sqlcon);
            cmd4 = new SqlCommand("insert into [FinGenLedg] ([cGrpCompany],[cCompany],[cDayBook],[iJV],[iJVSeq],[dtJVDate],[cFYear],[iFPeriod],[cAcctGrp],[cAcct],[cSubCode],[cBP],[cBPAccount],[dAmntDr],[dAmntCr],[cHCur],[cFCur],[dExRate],[dFAmntDr],[dFAmntCr],[bOpen],[cNar],[cLinkTable]) Values ('" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','" + 333 + "','" + Session["maxvoucher"].ToString() + "','" + 1 + "','" + DateTime.Now.Date.ToString() + "','" + DateTime.Now.Year.ToString() + "','" + DateTime.Now.Month.ToString() + "','" + 110400003 + "','" + 110400003 + "','" + 1010 + "','" + DropDownList1.SelectedValue + "','" + 110400003 + "','" + Convert.ToDouble(Session["net"].ToString()) + "','" + 0.00 + "','" + 300 + "','" + 1.0 + "','" + 1 + "','" + Convert.ToDouble(Session["net"].ToString()) + "','" + 0.00 + "','" + 1 + "','" + Session["invoiceId"].ToString() + "','" + Session["username"].ToString() + "')", sqlcon);
            cmd4.ExecuteNonQuery();
            cmd5 = new SqlCommand("insert into [FinGenLedg] ([cGrpCompany],[cCompany],[cDayBook],[iJV],[iJVSeq],[dtJVDate],[cFYear],[iFPeriod],[cAcctGrp],[cAcct],[cSubCode],[cBP],[cBPAccount],[dAmntDr],[dAmntCr],[cHCur],[cFCur],[dExRate],[dFAmntDr],[dFAmntCr],[bOpen],[cNar],[cLinkTable]) Values ('" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','" + 333 + "','" + Session["maxvoucher"].ToString() + "','" + 2 + "','" + DateTime.Now.Date.ToString() + "','" + DateTime.Now.Year.ToString() + "','" + DateTime.Now.Month.ToString() + "','" + 110400003 + "','" + 110400003 + "','" + 1010 + "','" + DropDownList1.SelectedValue + "','" + 110400003 + "','" + 0.00 + "','" + Convert.ToDouble(Session["paid"].ToString()) + "','" + 300 + "','" + 1.0 + "','" + 1 + "','" + 0.00 + "','" + Convert.ToDouble(Session["paid"].ToString()) + "','" + 1 + "','" + Session["invoiceId1"].ToString() + "','" + Session["username"].ToString() + "')", sqlcon);
            cmd5.ExecuteNonQuery();
            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
           // ViewState["init"] = Session["init"].ToString();
            sqlcon.Close();
            GridView1.EditIndex = -1;
            ShowData(); 
        }
        protected void getmaxijv()
        {
            int maxvoucher;

            sqlcon.Open();
            SqlCommand cmd2 = new SqlCommand("select MAX(iJV+1) as maxjv from [FinGenLedg] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + Session["cmp"].ToString()+ "' ", sqlcon);
            if (cmd2.ExecuteScalar().Equals(DBNull.Value))
            {
                maxvoucher = 2020000001;

            }
            else
            {
                maxvoucher = Convert.ToInt32(cmd2.ExecuteScalar());
            }
            Session["maxvoucher"] = Convert.ToString(maxvoucher);
            sqlcon.Close();
        }
        
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Reports/ReportInvoice.aspx");

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Reports/Balance.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("~/Login.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
           // Response.Redirect("/Crystal/Invoicer.aspx");
            
            Response.Redirect("~/ppd/Reports/InvoiceForm1.aspx");
        }


        protected void Button44_Click(object sender, EventArgs e)
        {
            //load data and fill to gridview
            

        }
       
        protected void TXTBXSCANER_TextChanged(object sender, EventArgs e)
        {
            //your code goes here

            Session["scanner"] = TXTBXSCANER.Text;
            sqladapter = new SqlDataAdapter("select * from Products where Products.cPId='" + Session["scanner"].ToString() + "' OR Products.cPBcode='" + Session["scanner"].ToString() + "' OR Products.cPName like '%" + Session["scanner"].ToString() + "%' ", sqlcon);
            datable = new DataTable();
            sqladapter.Fill(datable);
            // 10000000  //'" + TXTBXSCANER.Text.Trim() + "' or Products.cPBcode='" + TXTBXSCANER.Text + "'  or Products.cPName like '%'" + TXTBXSCANER.Text + "'%'
            if (datable.Rows.Count > 0)
            {
                Session["grpcmp1"] = datable.Rows[0][0].ToString();
                Session["cmp1"] = datable.Rows[0][1].ToString();
                Session["cpid1"] = datable.Rows[0][2].ToString();
                Session["cpname1"] = datable.Rows[0][3].ToString();
                Session["cpqtyinstock1"] = datable.Rows[0][4].ToString();
                int qtystock = 1;
                Session["cpprice1"] = datable.Rows[0][6].ToString();

                //   Session["cppricecostperunit"] = dt2.Rows[0][6].ToString();
                Session["cpparcode1"] = datable.Rows[0][8].ToString();
                Session["cpcatid1"] = datable.Rows[0][9].ToString();
                Session["cpunitid1"] = datable.Rows[0][10].ToString();
                int cFlagsave1 = 0;
                // cmd = new SqlCommand("INSERT INTO [Orders] (cGrpCompany,cComp) VALUES('" + Session["grpcmp"].ToString() + "','" + Session["cmp"] .ToString()+ "')", sqlcon);
                // cmd2 = new SqlCommand("INSERT INTO [Order] (cCompany) VALUES ('"+Session["cmp"] .ToString()+"')", sqlcon);
                cmd3 = new SqlCommand("INSERT INTO [OrdersDetails] (cGrpCompany,cComp,cCId,cPId,cProdName,cQty,cPrice,cTotal,cFlagsave,cId) VALUES ('" + Session["grpcmp1"].ToString() + "','" + Session["cmp1"].ToString() + "','" + Session["cpcatid1"].ToString() + "','" + Session["cpid1"].ToString() + "','" + Session["cpname1"].ToString() + "'," + qtystock + ",'" + Session["cpprice1"].ToString() + "','" + qtystock * Convert.ToDouble(Session["cpprice1"].ToString()) + "'," + cFlagsave1 + ",'" + Session["username"].ToString() + "') ", sqlcon);
                sqlcon.Open();
                // cmd.ExecuteNonQuery();
                // cmd2.ExecuteNonQuery();
                cmd3.ExecuteNonQuery();
                ShowData();
                //  SendKeys.SendWait("{ENTER}");
                TXTBXSCANER.Text = "";
                TXTBXSCANER.Focus();
                sqlcon.Close();


                //
            }
            
        }
    
        

       

            
       
       

       

        
        







        /*
        protected void dlInvoices_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["incat"] = dlInvoices.SelectedValue;
            Label1.Text = Session["incat"].ToString();
            da2 = new SqlDataAdapter("SELECT [cPName] FROM [pos].[dbo].[Products]", sqlcon);
            da2.Fill(dt2);
            DataList1.DataSource = dt2;
            DataList1.DataBind();
        }
        */

       
    }
    /*
      <h3> Your Birthday:</h3>
            <asp:Calendar ID="Calendar1" runat="server"  SelectionMode="DayWeekMonth" onselectionchanged="Calendar1_SelectionChanged">
            </asp:Calendar>
                 <p>Todays date is: 
            <asp:Label ID="lblday" runat="server"></asp:Label>
         </p>
         
         <p>Your Birday is: 
            <asp:Label ID="lblbday" runat="server"></asp:Label>
         </p>
     * ///
     *  protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            lblday.Text = Calendar1.TodaysDate.ToShortDateString();
            lblbday.Text = Calendar1.SelectedDate.ToShortDateString();
        }

     */
}