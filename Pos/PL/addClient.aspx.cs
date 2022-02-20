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
    public partial class addClient : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        DataTable dt = new DataTable();
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
            Label9.Text = "";
            Label11.Text = "";
            Session["cmp"] = ddlcompch.SelectedValue;
            sqlcon.Open();
            cmd = new SqlCommand("SELECT MAX ([cClientId]+1) as p FROM [pos].[dbo].[Clients] WHERE cCompany='" + Session["cmp"].ToString() + "'", sqlcon);


            //    int x=Convert.ToInt32(cmd.ExecuteScalar());
            if (cmd.ExecuteScalar().Equals(DBNull.Value))
            {
                int init = 1000;
                TextBoxclientid.Text = Convert.ToString(init);

            }
            else
            {

                TextBoxclientid.Text = Convert.ToString(cmd.ExecuteScalar());
            }


            sqlcon.Close();
           
            TextBoxClientName.Text = "";
            TextBoxClientPhone.Text = "";
            TextBoxClientdesc.Text="";


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand("INSERT INTO [Clients] (cCompany,cClientId,cClientName,cClientPhone,cClientDesc,cGrpCompany) VALUES('" + Session["cmp"].ToString() + "','" + TextBoxclientid.Text + "','" + TextBoxClientName.Text + "','" + TextBoxClientPhone.Text + "','" + TextBoxClientdesc.Text + "','" + Session["grpcmp"].ToString() + "') ", sqlcon);
                cmd.ExecuteNonQuery();
                Label9.Text = "Clients Created /تم تسجيل البيانات ";
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

            TextBoxclientid.Text = "";
            TextBoxClientName.Text = "";
            TextBoxClientPhone.Text = "";
            TextBoxClientdesc.Text = "";
        }
    }
}