using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.Hr.PL
{
    public partial class JournalVoucher : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        Pos.BL.cProduct p = new BL.cProduct();
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlDataAdapter da3 = new SqlDataAdapter();
        SqlCommand cmd4 = new SqlCommand();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        SqlCommand cmd3 = new SqlCommand();
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack)
            {
                Session["bpid"]="";
                Session["bpaccount"] = "";
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                //da = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts] where where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "'  and  iAcctUGrpLevel=4", sqlcon);
                //da.Fill(dt2);
                //DropDownList6.DataSource = dt2;
                //DropDownList6.DataTextField = "cAccountName1";
                //DropDownList6.DataValueField = "IAccountCode1";
                //DropDownList6.DataBind();
                //da2 = new SqlDataAdapter("select * from [FinCostCentre] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "'   ", sqlcon);
                //da2.Fill(dt3);
                //DropDownList7.DataSource = dt3;
                //DropDownList7.DataTextField = "cCostName";
                //DropDownList7.DataValueField = "cCostId";
                //DropDownList7.DataBind();
                //da3 = new SqlDataAdapter("select * from [bpcontacts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' ", sqlcon);
                //da3.Fill(dt4);
                //DropDownList8.DataSource = dt4;
                //DropDownList8.DataTextField = "bpname";
                //DropDownList8.DataValueField = "bpid";
                //DropDownList8.DataBind();
                this.TextBox4.Text = System.DateTime.Now.ToShortDateString();
                this.TextBox5.Text = System.DateTime.Now.ToShortDateString();
                this.Calendar1.SelectedDate = System.DateTime.Now.Date;
                dt = p.fnreadcompany();
                if (dt.Rows.Count > 0)
                {
                    // Session["cmp"] = dt.Rows[0][0].ToString();
                    //Session["grpcmp"] = dt.Rows[0][3].ToString();
                    ddlcompch.DataSource = dt;
                    ddlcompch.DataTextField = "cCompName";
                    ddlcompch.DataValueField = "cCompany";
                    ddlcompch.DataBind();
                    Label10.Text = "";
                    Label9.Text = "";



                }
            }
             
            //this.TextBox4.Text = System.DateTime.Now.ToShortDateString();
            //this.TextBox5.Text = System.DateTime.Now.ToShortDateString(); ;
            this.pnlCalendar.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
            this.pnlCalendar0.Attributes.Add("style",
                "DISPLAY: none; POSITION: absolute");

        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts]  where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' and  iAcctUGrpLevel=4", sqlcon);
            da.Fill(dt2);
            DropDownList6.DataSource = dt2;
            DropDownList6.DataTextField = "cAccountName1";
            DropDownList6.DataValueField = "IAccountCode1";
            DropDownList6.DataBind();
            da2 = new SqlDataAdapter("select * from [FinCostCentre] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "'   ", sqlcon);
            da2.Fill(dt3);
            DropDownList7.DataSource = dt3;
            DropDownList7.DataTextField = "cCostName";
            DropDownList7.DataValueField = "cCostId";
            DropDownList7.DataBind();
            da3 = new SqlDataAdapter("select * from [bpcontacts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' ", sqlcon);
            da3.Fill(dt4);
            DropDownList8.DataSource = dt4;
            DropDownList8.DataTextField = "bpname";
            DropDownList8.DataValueField = "bpid";
            DropDownList8.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            this.pnlCalendar.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            this.pnlCalendar0.Attributes.Add("style",
                    " POSITION: absolute");

        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox5.Text = Calendar2.SelectedDate.ToShortDateString();
            this.pnlCalendar0.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox4.Text = Calendar1.SelectedDate.ToShortDateString();
            this.pnlCalendar.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }
        protected void getmaxijv()
        {
            int maxvoucher;
           
            sqlcon.Open();
            SqlCommand cmd2 = new SqlCommand("select MAX(iJV+1) as maxjv from [FinGenLedg] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' ", sqlcon);
            if (cmd2.ExecuteScalar().Equals(DBNull.Value))
            {
                maxvoucher =2020000001;

            }
            else
            {
                maxvoucher = Convert.ToInt32(cmd2.ExecuteScalar());
            }
            Session["maxvoucher"] = Convert.ToString(maxvoucher);
            sqlcon.Close();
        }
        protected void getmaxijvseq()
        {
            int maxvoucheriseq;
            sqlcon.Open();
            SqlCommand cmd3 = new SqlCommand("select MAX(iJVSeq+1) as maxjv from [FinGenLedg] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' and iJV='" + Session["maxvoucher"].ToString()+ "' ", sqlcon);
            //  cmd2.ExecuteNonQuery();
            if (cmd3.ExecuteScalar().Equals(DBNull.Value))
            {
                maxvoucheriseq =  1;

            }
            else
            {
                maxvoucheriseq = Convert.ToInt32(cmd3.ExecuteScalar());
            }
            Session["maxvoucheriseq"] = Convert.ToString(maxvoucheriseq);
            sqlcon.Close();

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            getmaxijvseq();
           
                try
                {
                    sqlcon.Open();

                    cmd = new SqlCommand("insert into [FinGenLedg] ([cGrpCompany],[cCompany],[cDayBook],[iJV],[iJVSeq],[dtJVDate],[cFYear],[iFPeriod],[cAcctGrp],[cAcct],[cSubCode],[cBP],[cBPAccount],[dAmntDr],[dAmntCr],[cHCur],[cFCur],[dExRate],[dFAmntDr],[dFAmntCr],[bOpen],[cNar],[cLinkTable]) Values ('" + Session["grpcmp"].ToString() + "','" + ddlcompch.SelectedValue + "','" + 111 + "','" + Session["maxvoucher"].ToString() + "','" + Session["maxvoucheriseq"].ToString() + "','" + Calendar1.SelectedDate + "','" + Calendar1.SelectedDate.Year.ToString() + "','" + Calendar1.SelectedDate.Month.ToString() + "','" + Session["acc"].ToString() + "','" + Session["acc"].ToString() + "','" + DropDownList7.SelectedValue + "','" + Session["bpid"].ToString() + "','" + Session["bpaccount"].ToString() + "','" + Convert.ToDouble(TextBox3.Text.Trim()) + "','" + Convert.ToDouble(TextBox2.Text.Trim()) + "','" + DropDownList3.SelectedValue + "','" + DropDownList4.SelectedValue + "','" + DropDownList4.Text + "','" + Convert.ToDouble(DropDownList4.SelectedValue) * Convert.ToDouble(TextBox3.Text.Trim()) + "','" + Convert.ToDouble(DropDownList4.SelectedValue) * Convert.ToDouble(TextBox2.Text.Trim()) + "','" + 1 + "','" + TextBox1.Text.Trim() + "','" + Session["username"].ToString() + "')", sqlcon);
                    cmd.ExecuteNonQuery();
                    da = new SqlDataAdapter("select [dAmntCr] AS Credit ,[dAmntDr] AS Debit ,[cNar] AS Narrition  ,[iJV] AS VoucherID from [FinGenLedg]  where [iJV] ='" + Session["maxvoucher"].ToString() + "'", sqlcon);
                    da.Fill(dt2);
                    GridView1.DataSource = dt2;
                    GridView1.DataBind();
                    showdata();
                }
                catch(Exception ex)
                {
                    Label10.Text = ex.Message;
                }
                finally
                {
                    TextBox2.Text = "0.0";
                    TextBox3.Text = "0.0";
                    sqlcon.Close();
                }

            
              //  Label10.Text = "Not Balanced/طرفي القيد غير متساويين ";
            
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            getmaxijv();
            GridView1.DataBind();
            TextBox1.Text = "";
            Label21.Text = "";
            Label22.Text = "";
            
        }
        private void showdata()
        {
            da = new SqlDataAdapter("select [dAmntCr] AS Credit ,[dAmntDr] AS Debit ,[cNar] AS Narrition  ,[iJV] AS VoucherID from [FinGenLedg]  where [iJV] ='" + Session["maxvoucher"].ToString() + "'", sqlcon);
            da.Fill(dt4);
            GridView1.DataSource = dt4;
            GridView1.DataBind();
            float GTotald = 0f, GTotalc = 0f;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                String total = (GridView1.Rows[i].FindControl("lbl_DEB") as Label).Text;
                String totalc = (GridView1.Rows[i].FindControl("lbl_CRED") as Label).Text;

                GTotald += Convert.ToSingle(total);
                GTotalc += Convert.ToSingle(totalc);

            }
            Label21.Text = "total debit :" + GTotald.ToString();
            Label22.Text = "total credit :" + GTotalc.ToString();

        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TextBox DEP = GridView1.Rows[e.RowIndex].FindControl("txt_DEB") as TextBox;
            TextBox CRED = GridView1.Rows[e.RowIndex].FindControl("txt_CRED") as TextBox;
            sqlcon.Open();
            //updating the record  
            cmd4 = new SqlCommand("delete from [FinGenLedg]  where dAmntDr='" + DEP.Text + "' and dAmntCr='"+CRED.Text+"' and   iJV ='" + Session["maxvoucher"].ToString() + "' and iJVSeq='" + Session["maxvoucheriseq"].ToString() + "' and cLinkTable='" + Session["username"].ToString() + "'   AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cCompany='" + ddlcompch.SelectedValue + "'", sqlcon);
            //* Convert.ToDouble(qty.Text)
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd4.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  
          showdata();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        //  showdata();

        }

      

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox DEP = GridView1.Rows[e.RowIndex].FindControl("txt_DEB") as TextBox;
            TextBox CRED = GridView1.Rows[e.RowIndex].FindControl("txt_CRED") as TextBox;
            sqlcon.Open();
            //updating the record  
            cmd4 = new SqlCommand(" UPDATE [FinGenLedg] SET [dAmntDr] ='" +Convert.ToDouble(DEP.Text) + "',  [dAmntCr] ='" +Convert.ToDouble( CRED.Text) + "' where  iJV ='" + Session["maxvoucher"].ToString() + "' and iJVSeq='" + Session["maxvoucheriseq"].ToString() + "' and  cLinkTable='" + Session["username"].ToString() + "'   AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cCompany='" + ddlcompch.SelectedValue + "' ", sqlcon);
            //* Convert.ToDouble(qty.Text)
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd4.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            showdata();

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
            Session["bpid"] = DropDownList8.SelectedValue;
            getbpaccount();
        }

        private void getbpaccount()
        {
            sqlcon.Open();
            cmd3 = new SqlCommand("select bpgcode from [bpcontacts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' and bpid='" + DropDownList8.SelectedValue + "' ", sqlcon);
            Session["bpg"] = cmd3.ExecuteScalar();
            cmd = new SqlCommand("select accountid from [bpgroups] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' and code='" + Session["bpg"].ToString() + "'", sqlcon);
            Session["bpaccount"] = cmd.ExecuteScalar();
             Session["acc"] = Session["bpaccount"].ToString();
            sqlcon.Close();
        }

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label10.Text = "";
            Session["acc"] = DropDownList6.SelectedValue;
            Session["bpaccount"] = "";
            Session["bpid"] = "";
        }
    }
}