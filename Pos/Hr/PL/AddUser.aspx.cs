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
    public partial class AddUser : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
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
                    //   Session["cmp"] = dt.Rows[0][0].ToString();
                    //  Session["grpcmp"] = dt.Rows[0][3].ToString();
                    ddlcompch.DataSource = dt;
                    ddlcompch.DataTextField = "cCompName";
                    ddlcompch.DataValueField = "cCompany";
                    ddlcompch.DataBind();
                  

                }


            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                String HR = "HR";
                sqlcon.Open();
                cmd = new SqlCommand("INSERT INTO [Users] (cId,cPassword,cType,cGrpCopany,cComp,cUserName,cUserAddress,cUserNo,cModule) VALUES('" + TextBoxUserNameLogin.Text.Trim() + "','" + TextBoxPassword.Text.Trim() + "','" + ddlcompUSERTYPE.SelectedValue.Trim() + "','" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','" + DropDownList1.SelectedItem.Text + "','" + TextBoxaddress.Text + "','" + TextBoxUserno.Text + "','" + HR + "') ", sqlcon);
                cmd.ExecuteNonQuery();
                Label9.Text = "User Created / بيانات الدخول للنظام  " + "<br/>" + TextBoxUserNameLogin.Text + "<br/>" + TextBoxPassword.Text;
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
            TextBoxUserNameLogin.Text = "";
            TextBoxfullname.Text = "";
            TextBoxPassword.Text = "";
            TextBoxaddress.Text = "";
            ddlcompch.SelectedIndex = 0;

        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            da2 = new SqlDataAdapter("select * from [Hr001] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch.SelectedValue + "' ", sqlcon);
            da2.Fill(dt3);
            //
            DropDownList1.DataSource = dt3;
            DropDownList1.DataTextField = "cEmpAname";
            DropDownList1.DataValueField = "cEmpId";
            DropDownList1.DataBind();
            /*
             da2 = new SqlDataAdapter("select * from [Users]  ", sqlcon);
            da2.Fill(dt3);
            ddlcompUSERTYPE.DataSource = dt3;
            ddlcompUSERTYPE.DataTextField = "cType";
            ddlcompUSERTYPE.DataValueField = "cType";
             */
            Label9.Text = "";
            Label11.Text = "";
            Session["cmp"] = ddlcompch.SelectedValue;
            sqlcon.Open();
            cmd = new SqlCommand("SELECT MAX ([cUserNo]+1) as p FROM [pos].[dbo].[Users] WHERE cComp='" + Session["cmp"].ToString() + "'", sqlcon);


            //    int x=Convert.ToInt32(cmd.ExecuteScalar());
            if (cmd.ExecuteScalar().Equals(DBNull.Value))
            {
                int init = 10000;
                TextBoxUserno.Text = Convert.ToString(init);

            }
            else
            {

                TextBoxUserno.Text = Convert.ToString(cmd.ExecuteScalar());
            }


            sqlcon.Close();
            TextBoxUserNameLogin.Text = "";
            TextBoxfullname.Text = "";
            TextBoxPassword.Text = "";
            TextBoxaddress.Text = "";


        }

        protected void ddlcompch1_SelectedIndexChanged(object sender, EventArgs e)
        {



        }

    }
}