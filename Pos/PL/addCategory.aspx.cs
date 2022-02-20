using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Pos.PL
{
    public partial class addCategory : System.Web.UI.Page
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
                if (Session["username"] == null )
                {
                    Response.Redirect("~/Login.aspx");
                }

               dt = p.fnreadcompany();
                if (dt.Rows.Count > 0)
                {
                    // Session["cmp"] = dt.Rows[0][0].ToString();
                   // Session["grpcmp"] = dt.Rows[0][3].ToString();
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
                sqlcon.Open();
                cmd = new SqlCommand("INSERT INTO [Categories] (cGrpCompany,cComp,cCId,cCDesc) VALUES('" + Session["grpcmp"] .ToString()+ "','" + Session["cmp"].ToString() + "','" + TextBoxCATID.Text + "','" + TextBoxCATNAME.Text + "') ", sqlcon);
                cmd.ExecuteNonQuery();
                Label9.Text = "Category Created /تم حفظ الصنف";
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
            TextBoxCATNAME.Text = "";
            TextBoxCATID.Text = "";
        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label9.Text = "";
            Label11.Text = "";
            Session["cmp"] = ddlcompch.SelectedValue;
            sqlcon.Open();
            cmd = new SqlCommand("SELECT MAX ([cCId]+1) as p FROM [pos].[dbo].[Categories] WHERE cComp='" + Session["cmp"].ToString() + "'", sqlcon);


            //    int x=Convert.ToInt32(cmd.ExecuteScalar());
            if (cmd.ExecuteScalar().Equals(DBNull.Value))
            {
                int init = 10000;
                TextBoxCATID.Text = Convert.ToString(init);

            }
            else
            {

                TextBoxCATID.Text = Convert.ToString(cmd.ExecuteScalar());
            }


            sqlcon.Close();
            TextBoxCATNAME.Text = "";
           

        }

       
    }
}