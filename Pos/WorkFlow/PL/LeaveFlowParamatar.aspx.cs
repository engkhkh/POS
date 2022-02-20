using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.WorkFlow.PL
{
  
    public partial class LeaveFlowParamatar : System.Web.UI.Page
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
                    TextBoxSession.Text = "Wflowleave";

                }

            }
        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand("INSERT INTO [Flows01] (cGrpCompany,cCompany,cParamatar,cSession) VALUES('" + Session["grpcmp"].ToString() + "','" + Session["cmp"].ToString() + "','" + TextBoxParamatarName.Text.Trim()+ "','" + TextBoxSession.Text.Trim() + "') ", sqlcon);
                cmd.ExecuteNonQuery();
                Label9.Text = "Flows Created /تم تسجيل البيانات ";
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

            TextBoxParamatarName.Text = "Lv";
            TextBoxSession.Text = "Wflowleave";

        }
    }
}