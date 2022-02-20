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
    public partial class UEmployeeDependent : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        DataTable dt6 = new DataTable();
        Pos.BL.cProduct p = new BL.cProduct();
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlDataAdapter adapter3 = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
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
                    //ddlcompch.DataSource = dt;
                    //ddlcompch.DataTextField = "cCompName";
                    //ddlcompch.DataValueField = "cCompany";
                    //ddlcompch.DataBind();
                    ///
                    //TextBoxpdqty.Text = "1.0";
                    //TextBoxpdremaining.Text = "0.0";
                    //TextBoxpdsaleditem.Text = "1.0";
                    //TextBoxpdnew.Text = "0.0";
                    //TextBoxpdprice.Text = "0.0";
                    //TextBoxpdcost.Text = "0.0";
                    //TextBoxpdTOPIC.Text = "";
                    //TextBoxpid.Text = "";
                    //TextBoxpdname.Text = "";

                    ////


                }
                Bind();


            }

        }

        private void Bind()
        {
            da = new SqlDataAdapter("select * from Hr00Dependents where cEmpId='" + Session["cu1"].ToString() + "'", sqlcon);
            da.Fill(dt2);
            GridView1.DataSource = dt2;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label empid = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox empdepename = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenName") as TextBox;
            TextBox empdepenjoindate = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenJoinDate") as TextBox;
            TextBox emdepenage = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenAge") as TextBox;
            TextBox empdepennationality = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenNationality") as TextBox;
            TextBox empdepenidentityid = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenIdentityId") as TextBox;
            TextBox empdependentidentityexpiry = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenIdentityExpiry") as TextBox;
            TextBox empdepenpassportid = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenPassportId") as TextBox;
            TextBox empdepenpassportexpiry = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenpassportExpiry") as TextBox;
            TextBox empdepenrelativee = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenRelative") as TextBox;
            
            sqlcon.Open();
            //updating the record  
            cmd = new SqlCommand("Update [Hr00Dependents] set [cDepenName]='" + empdepename.Text + "',[cDepenJoinDate]='" + empdepenjoindate.Text + "',[cDepenAge]='" + emdepenage.Text + "',[cDepenNationality]='" + empdepennationality.Text + "',[cDepenIdentityId]='" + empdepenidentityid.Text + "',[cDepenIdentityExpiry]='" + empdependentidentityexpiry.Text + "',[cDepenPassportId]='" + empdepenpassportid.Text + "',[cDepenpassportExpiry]='" + empdepenpassportexpiry.Text + "',[cDepenRelative]='" + empdepenrelativee.Text + "' where   cDepenName='" + empdepename.Text + "'  ", sqlcon);
            //* Convert.ToDouble(qty.Text)
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  

            Bind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label EMPid = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox DEPENname = GridView1.Rows[e.RowIndex].FindControl("txt_cDepenName") as TextBox;
           // Label EMPid1 = (Label)sender;
            GridViewRow row1 = (GridViewRow)EMPid.NamingContainer;
            sqlcon.Open();
            //updating the record  
            cmd = new SqlCommand("delete from [Hr00Dependents] where   cDepenName='" + DEPENname.Text + "'", sqlcon);
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            Bind();

        }
    }
}