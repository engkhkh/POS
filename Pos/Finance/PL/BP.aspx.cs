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
    public partial class BP : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        Pos.BL.cProduct p = new BL.cProduct();
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
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
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                da = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts] where   iAcctUGrpLevel=4", sqlcon);
                da.Fill(dt2);
                DropDownList3.DataSource = dt2;
                DropDownList3.DataTextField = "cAccountName1";
                DropDownList3.DataValueField = "IAccountCode1";
                DropDownList3.DataBind();
                //
                //da2 = new SqlDataAdapter("select * from [bpgroups] where cGrpCompany='" + Session["grpcmp"].ToString() + "'  ", sqlcon);
                //da2.Fill(dt3);
                //DropDownList7.DataSource = dt3;
                //DropDownList7.DataTextField = "grpname";
                //DropDownList7.DataValueField = "code";
                //DropDownList7.DataBind();
                //
                dt = p.fnreadcompany();
                if (dt.Rows.Count > 0)
                {
                    // Session["cmp"] = dt.Rows[0][0].ToString();
                    //Session["grpcmp"] = dt.Rows[0][3].ToString();
                    ddlcompch.DataSource = dt;
                    ddlcompch.DataTextField = "cCompName";
                    ddlcompch.DataValueField = "cCompany";
                    ddlcompch.DataBind();
                    ddlcompch0.DataSource = dt;
                    ddlcompch0.DataTextField = "cCompName";
                    ddlcompch0.DataValueField = "cCompany";
                    ddlcompch0.DataBind();
                    //
                   
                    //
                    Label22.Text = "";
                    Label23.Text = "";
                    Label10.Text = "";
                    Label9.Text = "";



                }
            
            
            
            }

            
        }
        protected void getmaxcode()
        {
            int maxvoucheriseq;
            sqlcon.Open();
            SqlCommand cmd3 = new SqlCommand("select MAX(code+1) as maxjv from [bpgroups] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' ", sqlcon);
            //  cmd2.ExecuteNonQuery();
            if (cmd3.ExecuteScalar().Equals(DBNull.Value))
            {
                maxvoucheriseq = 10;

            }
            else
            {
                maxvoucheriseq = Convert.ToInt32(cmd3.ExecuteScalar());
            }
            Session["maxcode"] = Convert.ToString(maxvoucheriseq);
            sqlcon.Close();
        }
        protected void getmaxcode2()
        {
            int maxvoucheriseq;
            sqlcon.Open();
            SqlCommand cmd3 = new SqlCommand("select MAX(bpid+1) as maxjv from [bpcontacts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch0.SelectedValue + "' ", sqlcon);
            //  cmd2.ExecuteNonQuery();
            if (cmd3.ExecuteScalar().Equals(DBNull.Value))
            {
                maxvoucheriseq = 1000;

            }
            else
            {
                maxvoucheriseq = Convert.ToInt32(cmd3.ExecuteScalar());
            }
            Session["maxcode2"] = Convert.ToString(maxvoucheriseq);
            sqlcon.Close();
            TextBoxBPID.Text = Session["maxcode2"].ToString();
            
        }
        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            getmaxcode();
            TextBoxlevelid.Text = Session["maxcode"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
         //   getmaxcode();
            try
            {
                sqlcon.Open();

                cmd = new SqlCommand("insert into [bpgroups] ([cGrpCompany],[cCompany],[code],[grpname],[accountid],[bptypeid]) Values ('" + Session["grpcmp"].ToString() + "','" + ddlcompch.SelectedValue + "','" + TextBoxlevelid.Text + "','" + TextBoxlevelName.Text + "','" + DropDownList3.SelectedValue + "','" + DropDownList4.SelectedValue + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label9.Text = "added/تم اضافته";
               
            }
            catch (Exception ex)
            {
                Label10.Text = ex.Message;
            }
            finally
            {
                TextBoxlevelid.Text = "";
                TextBoxlevelName.Text = "";
                
                sqlcon.Close();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
           
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //
            try
            {
                sqlcon.Open();

                cmd = new SqlCommand("insert into [bpcontacts] ([cGrpCompany],[cCompany],[bpgcode],[bpid],[bpname],[bpemail],[bpphone],[bpcity],[bpzipcode]) Values ('" + Session["grpcmp"].ToString() + "','" + ddlcompch0.SelectedValue + "','" + DropDownList7.SelectedValue + "','" + TextBoxBPID.Text + "','" + TextBoxBPNAME.Text + "','" + TextBoxBPEMAIL.Text + "','" + TextBoxBPPHONE.Text + "','" + TextBoxBPCITY.Text + "','" + TextBoxBPZIP.Text + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label22.Text = "added/تم اضافته";

            }
            catch (Exception ex)
            {
                Label23.Text = ex.Message;
            }
            finally
            {
                TextBoxBPID.Text = "";
                TextBoxBPNAME.Text = "";
                TextBoxBPPHONE.Text = "";
                TextBoxBPEMAIL.Text = "";
                TextBoxBPCITY.Text = "";
                TextBoxBPZIP.Text = "";
                
                sqlcon.Close();
            }

        }

        protected void ddlcompch0_SelectedIndexChanged(object sender, EventArgs e)
        {
            dt3.Columns.Clear();

            da2 = new SqlDataAdapter("select * from [bpgroups] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch0.SelectedValue + "' ", sqlcon);
            da2.Fill(dt3);
            DropDownList7.DataSource = dt3;
            DropDownList7.DataTextField = "grpname";
            DropDownList7.DataValueField = "code";
            DropDownList7.DataBind();
        }

        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            getmaxcode2();
        }
    }
}