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
    public partial class UEmployee : System.Web.UI.Page
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
            da = new SqlDataAdapter("select * from Hr001 where cEmpId='" + Session["cu"].ToString() + "'", sqlcon);
            da.Fill(dt2);
            GridView1.DataSource = dt2;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label empid = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox emparabicname = GridView1.Rows[e.RowIndex].FindControl("txt_EmpNamearabic") as TextBox;
            TextBox empenglishname = GridView1.Rows[e.RowIndex].FindControl("txt_empnameenglish") as TextBox;
            TextBox embbirthdate = GridView1.Rows[e.RowIndex].FindControl("txt_birthdate") as TextBox;
            TextBox empage = GridView1.Rows[e.RowIndex].FindControl("txt_age") as TextBox;
            TextBox empnationality = GridView1.Rows[e.RowIndex].FindControl("txt_Nationality") as TextBox;
            TextBox empdependent = GridView1.Rows[e.RowIndex].FindControl("txt_dependent") as TextBox;
            TextBox emphomeaddress = GridView1.Rows[e.RowIndex].FindControl("txt_homeAddress") as TextBox;
            TextBox empcurrentaddress = GridView1.Rows[e.RowIndex].FindControl("txt_currentAddress") as TextBox;
            TextBox empphone = GridView1.Rows[e.RowIndex].FindControl("txt_phone") as TextBox;
            TextBox empemail = GridView1.Rows[e.RowIndex].FindControl("txt_email") as TextBox;
            TextBox empvisa = GridView1.Rows[e.RowIndex].FindControl("txt_visa") as TextBox;
            TextBox empliscence = GridView1.Rows[e.RowIndex].FindControl("txt_liscence") as TextBox;
            TextBox empcar = GridView1.Rows[e.RowIndex].FindControl("txt_car") as TextBox;
            sqlcon.Open();
            //updating the record  
            cmd = new SqlCommand("Update [Hr001] set [cEmpAname]='" + emparabicname.Text + "',[cEmpEname]='" + empenglishname.Text + "',[cEmpBirthdate]='" + embbirthdate.Text + "',[cEmpAge]='" + empage.Text + "',[cEmpNationality]='" + empnationality.Text + "',[cEmpDependent]='" + empdependent.Text + "',[cEmpHomeCountry]='" + emphomeaddress.Text + "',[cEmpCurrentCountry]='" + empcurrentaddress.Text + "',[cEmpPhone]='" + empphone.Text + "',[cEmpEmail]='" + empemail.Text + "',[cEmpVisa]='" + empvisa.Text + "',[cEmpLisence]='" + empliscence.Text + "',[cEmpCar]='" + empcar.Text + "' where  cEmpId='" + empid.Text + "'  AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cCompany='" + Session["cmp"].ToString() + "'  ", sqlcon);
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

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind();
        }
    }
}