﻿using System;
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
    public partial class Times : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
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
                    // Session["cmp"] = dt.Rows[0][0].ToString();
                    //  Session["grpcmp"] = dt.Rows[0][3].ToString();
                    ddlcompch.DataSource = dt;
                    ddlcompch.DataTextField = "cCompName";
                    ddlcompch.DataValueField = "cCompany";
                    ddlcompch.DataBind();


                }

            }
        }

       
      

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            da = new SqlDataAdapter(" select * from [Hr00Shifts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch.SelectedValue + "'   ", sqlcon);
            da.Fill(dt2);
            ddlcompch0.DataSource = dt2;
            ddlcompch0.DataTextField = "cShiftName";
            ddlcompch0.DataValueField = "cShiftId";
            ddlcompch0.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand("INSERT INTO [Hr00Times] (cGrpCompany,cCompany,cTimeFirstEntryFingerprint,cTimeSecondEntryFingerprint,cTimeFirstExitFingerorint,cTimeSecondExitFingerprint,cOverTimePeriod,cShiftId,cUser) VALUES('" + Session["grpcmp"].ToString() + "','" + ddlcompch.SelectedValue + "','" + TextBox1.Text.Trim() + "','" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "','" + TextBox4.Text.Trim() + "','" + TextBox5.Text.Trim() + "','" + ddlcompch0.SelectedValue.Trim() + "','" + Session["username"].ToString() + "') ", sqlcon);
                cmd.ExecuteNonQuery();
                Label9.Text = "Time Added To Shift /تم تسجيل البيانات ";
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
           
            ddlcompch0.SelectedIndex = 0;

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";

        }

        protected void ddlcompch0_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}