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
    public partial class UEmployeeJob : System.Web.UI.Page
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
            da = new SqlDataAdapter("select * from [Hr00jobdata] where cEmpId='" + Session["cu2"].ToString() + "'", sqlcon);
            da.Fill(dt2);
            GridView1.DataSource = dt2;
            GridView1.DataBind();


        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind();
       
            /*
            lbl_ID.Text = dt2.Rows[0][2].ToString();
            lbl_Emptitleiniqama.Text = dt2.Rows[0][4].ToString();
            txt_Emptitleiniqama.Text = dt2.Rows[0][4].ToString();
            lbl_empcurrentjob.Text = dt2.Rows[0][5].ToString();
            txt_empcurrentjob.Text = dt2.Rows[0][5].ToString();
            lbl_ExtraJob.Text = dt2.Rows[0][6].ToString();
            txt_ExtraJob.Text = dt2.Rows[0][6].ToString();
            lbl_cManagementName.Text = dt2.Rows[0][7].ToString();
            DropDownListmaanagement.SelectedItem.Text = dt2.Rows[0][7].ToString();
            lbl_cDepartmentName.Text = dt2.Rows[0][8].ToString();
            DropDownListheaddepartment.SelectedItem.Text = dt2.Rows[0][8].ToString();
            lbl_cDirectMnager.Text = dt2.Rows[0][9].ToString();
            DropDownListDirectmanager.SelectedValue = dt2.Rows[0][9].ToString();
            lbl_cHeadOfDepartment.Text = dt2.Rows[0][10].ToString();
            DropDownListheaddepartment.SelectedValue = dt2.Rows[0][10].ToString();
            lbl_cManagerDirector.Text = dt2.Rows[0][11].ToString();
            DropDownListManagerDirector.SelectedValue = dt2.Rows[0][11].ToString();
            lbl_cContractType.Text = dt2.Rows[0][12].ToString();
            DropDownListcContractType.SelectedItem.Text = dt2.Rows[0][12].ToString();
            txt_cStartingContract.Text = dt2.Rows[0][13].ToString();
            lbl_cStartingContract.Text = dt2.Rows[0][13].ToString();
            txt_cContractDuration.Text = dt2.Rows[0][14].ToString();
            lbl_cContractDuration.Text = dt2.Rows[0][14].ToString();
            txt_cDirectAcion.Text = dt2.Rows[0][15].ToString();
            lbl_cDirectAcion.Text = dt2.Rows[0][15].ToString();
            txt_cHouseCompany.Text = dt2.Rows[0][16].ToString();
            lbl_cHouseCompany.Text = dt2.Rows[0][16].ToString();
            txt_cCompanyDetails.Text = dt2.Rows[0][17].ToString();
            lbl_cCompanyDetails.Text = dt2.Rows[0][17].ToString();
            lbl_cInshuranceType.Text = dt2.Rows[0][18].ToString();
            DropDownListcInshuranceType.SelectedItem.Text = dt2.Rows[0][18].ToString();
            txt_cInsuranceID.Text = dt2.Rows[0][19].ToString();
            lbl_cInsuranceID.Text = dt2.Rows[0][19].ToString();
            lbl_cExprience1.Text = dt2.Rows[0][20].ToString();
            txt_cExprience1.Text = dt2.Rows[0][20].ToString();
            lbl_cExprience2.Text = dt2.Rows[0][21].ToString();
            txt_cExprience2.Text = dt2.Rows[0][21].ToString();
            //
            DropDownListmaanagement.DataSource = dt2;
            DropDownListmaanagement.DataTextField = "cManagementName";
            DropDownListmaanagement.DataValueField = "cManagementName";
            DropDownListmaanagement.DataBind();
            //
            DropDownListDepartmentName.DataSource = dt2;
            DropDownListDepartmentName.DataTextField = "cDepartmentName";
            DropDownListDepartmentName.DataValueField = "cDepartmentName";
            DropDownListDepartmentName.DataBind();
            //
            DropDownListDirectmanager.DataSource = dt2;
            DropDownListDirectmanager.DataTextField = "cDirectMnager";
            DropDownListDirectmanager.DataValueField = "cDirectMnager";
            DropDownListDirectmanager.DataBind();
            //
            DropDownListheaddepartment.DataSource = dt2;
            DropDownListheaddepartment.DataTextField = "cHeadOfDepartment";
            DropDownListheaddepartment.DataValueField = "cHeadOfDepartment";
            DropDownListheaddepartment.DataBind();
            //
            DropDownListManagerDirector.DataSource = dt2;
            DropDownListManagerDirector.DataTextField = "cManagerDirector";
            DropDownListManagerDirector.DataValueField = "cManagerDirector";
            DropDownListManagerDirector.DataBind();
            //
            DropDownListcContractType.DataSource = dt2;
            DropDownListcContractType.DataTextField = "cContractType";
            DropDownListcContractType.DataValueField = "cContractType";
            DropDownListcContractType.DataBind();
            //
             
            DropDownListcInshuranceType.DataSource = dt2;
            DropDownListcInshuranceType.DataTextField = "cInshuranceType";
            DropDownListcInshuranceType.DataValueField = "cInshuranceType";
            DropDownListcInshuranceType.DataBind();
           * */


        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label empid = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox txt_Emptitleiniqama = GridView1.Rows[e.RowIndex].FindControl("txt_Emptitleiniqama") as TextBox;
            TextBox txt_empcurrentjob = GridView1.Rows[e.RowIndex].FindControl("txt_empcurrentjob") as TextBox;
            TextBox txt_ExtraJob = GridView1.Rows[e.RowIndex].FindControl("txt_ExtraJob") as TextBox;
            DropDownList DropDownListmaanagement = GridView1.Rows[e.RowIndex].FindControl("DropDownListmaanagement") as DropDownList;
            DropDownList DropDownListDepartmentName = GridView1.Rows[e.RowIndex].FindControl("DropDownListDepartmentName") as DropDownList;
            DropDownList DropDownListDirectmanager = GridView1.Rows[e.RowIndex].FindControl("DropDownListDirectmanager") as DropDownList;
            DropDownList DropDownListheaddepartment = GridView1.Rows[e.RowIndex].FindControl("DropDownListheaddepartment") as DropDownList;
            DropDownList DropDownListManagerDirector = GridView1.Rows[e.RowIndex].FindControl("DropDownListManagerDirector") as DropDownList;
            TextBox txt_cContractType = GridView1.Rows[e.RowIndex].FindControl("txt_cContractType") as TextBox;
            TextBox txt_cStartingContract = GridView1.Rows[e.RowIndex].FindControl("txt_cStartingContract") as TextBox;
            TextBox txt_cContractDuration = GridView1.Rows[e.RowIndex].FindControl("txt_cContractDuration") as TextBox;
            TextBox txt_cDirectAcion = GridView1.Rows[e.RowIndex].FindControl("txt_cDirectAcion") as TextBox;
            TextBox txt_cHouseCompany = GridView1.Rows[e.RowIndex].FindControl("txt_cHouseCompany") as TextBox;
            TextBox txt_cCompanyDetails = GridView1.Rows[e.RowIndex].FindControl("txt_cCompanyDetails") as TextBox;
            TextBox txt_istcInshuranceType = GridView1.Rows[e.RowIndex].FindControl("txt_istcInshuranceType") as TextBox;
            TextBox txt_cInsuranceID = GridView1.Rows[e.RowIndex].FindControl("txt_cInsuranceID") as TextBox;
            TextBox txt_cExprience1 = GridView1.Rows[e.RowIndex].FindControl("txt_cExprience1") as TextBox;
            TextBox txt_cExprience2 = GridView1.Rows[e.RowIndex].FindControl("txt_cExprience2") as TextBox;
            sqlcon.Open();
            //updating the record  
            cmd = new SqlCommand("Update [Hr00jobdata] set [cTitleJobInIqama]='" + txt_Emptitleiniqama.Text + "',[cTitleCurrentJob]='" + txt_empcurrentjob.Text + "',[cTitleExtraJob]='" + txt_ExtraJob.Text + "',[cManagementName]='" + DropDownListmaanagement.SelectedItem.Text + "',[cDepartmentName]='" + DropDownListDepartmentName.SelectedItem.Text + "',[cDirectMnager]='" + DropDownListDirectmanager.SelectedValue + "',[cHeadOfDepartment]='" + DropDownListheaddepartment.SelectedValue + "',[cManagerDirector]='" + DropDownListManagerDirector.SelectedValue + "',[cContractType]='" + txt_cContractType.Text + "',[cStartingContract]='" + txt_cStartingContract.Text.Trim() + "',[cContractDuration]='" + txt_cContractDuration.Text + "',[cDirectAcion]='" + txt_cDirectAcion.Text.Trim() + "',[cHouseCompany]='" + txt_cHouseCompany.Text + "' ,[cCompanyDetails]='" + txt_cCompanyDetails.Text + "',[cInshuranceType]='" + txt_istcInshuranceType.Text + "',[cInsuranceID]='" + txt_cInsuranceID.Text + "' ,[cExprience1]='" + txt_cExprience1.Text + "',[cExprience2]='" + txt_cExprience2.Text + "' where  cEmpId='" + empid.Text + "'  AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cCompany='" + Session["cmp"].ToString() + "'  ", sqlcon);
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
            Label empid = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox txt_Emptitleiniqama = GridView1.Rows[e.RowIndex].FindControl("txt_Emptitleiniqama") as TextBox;
            TextBox txt_empcurrentjob = GridView1.Rows[e.RowIndex].FindControl("txt_empcurrentjob") as TextBox;
            TextBox txt_ExtraJob = GridView1.Rows[e.RowIndex].FindControl("txt_ExtraJob") as TextBox;
            DropDownList DropDownListmaanagement = GridView1.Rows[e.RowIndex].FindControl("DropDownListmaanagement") as DropDownList;
            DropDownList DropDownListDepartmentName = GridView1.Rows[e.RowIndex].FindControl("DropDownListDepartmentName") as DropDownList;
            DropDownList DropDownListDirectmanager = GridView1.Rows[e.RowIndex].FindControl("DropDownListDirectmanager") as DropDownList;
            DropDownList DropDownListheaddepartment = GridView1.Rows[e.RowIndex].FindControl("DropDownListheaddepartment") as DropDownList;
            DropDownList DropDownListManagerDirector = GridView1.Rows[e.RowIndex].FindControl("DropDownListManagerDirector") as DropDownList;
            TextBox txt_cContractType = GridView1.Rows[e.RowIndex].FindControl("txt_cContractType") as TextBox;
            TextBox txt_cStartingContract = GridView1.Rows[e.RowIndex].FindControl("txt_cStartingContract") as TextBox;
            TextBox txt_cContractDuration = GridView1.Rows[e.RowIndex].FindControl("txt_cContractDuration") as TextBox;
            TextBox txt_cDirectAcion = GridView1.Rows[e.RowIndex].FindControl("txt_cDirectAcion") as TextBox;
            TextBox txt_cHouseCompany = GridView1.Rows[e.RowIndex].FindControl("txt_cHouseCompany") as TextBox;
            TextBox txt_cCompanyDetails = GridView1.Rows[e.RowIndex].FindControl("txt_cCompanyDetails") as TextBox;
            TextBox txt_istcInshuranceType = GridView1.Rows[e.RowIndex].FindControl("txt_istcInshuranceType") as TextBox;
            TextBox txt_cInsuranceID = GridView1.Rows[e.RowIndex].FindControl("txt_cInsuranceID") as TextBox;
            TextBox txt_cExprience1 = GridView1.Rows[e.RowIndex].FindControl("txt_cExprience1") as TextBox;
            TextBox txt_cExprience2 = GridView1.Rows[e.RowIndex].FindControl("txt_cExprience2") as TextBox;
            sqlcon.Open();
            //updating the record  
            cmd = new SqlCommand("delete from  [Hr00jobdata]  where  cEmpId='" + empid.Text + "'  AND cGrpCompany='" + Session["grpcmp"].ToString() + "' AND cCompany='" + Session["cmp"].ToString() + "'  ", sqlcon);
            //* Convert.ToDouble(qty.Text)
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  

            Bind();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
            if (e.Row.RowType == DataControlRowType.DataRow &&(e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
            {
                da = new SqlDataAdapter("select * from [Hr00Management] ", sqlcon);
                da.Fill(dt4);
                //
                da = new SqlDataAdapter("select * from [Hr00Departments] ", sqlcon);
                da.Fill(dt5);
                //
                da = new SqlDataAdapter("select * from [Hr001] ", sqlcon);
                da.Fill(dt6);
                // Here you will get the Control you need like:
                DropDownList dl = (DropDownList)e.Row.FindControl("DropDownListmaanagement");
                DropDownList dldepartment = (DropDownList)e.Row.FindControl("DropDownListDepartmentName");
                DropDownList dldIRECTMANAGER = (DropDownList)e.Row.FindControl("DropDownListDirectmanager");
                DropDownList dldIRECTMANAGER1 = (DropDownList)e.Row.FindControl("DropDownListheaddepartment");
                DropDownList dlmanagerdiretort = (DropDownList)e.Row.FindControl("DropDownListManagerDirector");

                //
                dldIRECTMANAGER.DataSource = dt6;
                dldIRECTMANAGER.DataTextField = "cEmpAname";
                dldIRECTMANAGER.DataValueField = "cEmpId";
                dldIRECTMANAGER.DataBind();
                dldIRECTMANAGER1.DataSource = dt6;
                dldIRECTMANAGER1.DataTextField = "cEmpAname";
                dldIRECTMANAGER1.DataValueField = "cEmpId";
                dldIRECTMANAGER1.DataBind();
                dlmanagerdiretort.DataSource = dt6;
                dlmanagerdiretort.DataTextField = "cEmpAname";
                dlmanagerdiretort.DataValueField = "cEmpId";
                dlmanagerdiretort.DataBind();
                //
                dl.DataSource = dt4;
                dl.DataTextField = "cManagementName";
                dl.DataValueField = "cMangementId";
                dl.DataBind();
                //dl.SelectedItem.Text = Session["mgname"].ToString();
                //
                dldepartment.DataSource = dt5;
                dldepartment.DataTextField = "cDepName";
                dldepartment.DataValueField = "cDepid";
                //dldepartment.SelectedItem.Text = dt2.Rows[0][8].ToString();
                dldepartment.DataBind();
            }
            
        }
    }
}
/*
   protected global::System.Web.UI.WebControls.GridView GridView1;
        protected global::System.Web.UI.WebControls.DropDownList DropDownListmaanagement;
        protected global::System.Web.UI.WebControls.DropDownList DropDownListDepartmentName;
        protected global::System.Web.UI.WebControls.DropDownList DropDownListDirectmanager;
        protected global::System.Web.UI.WebControls.DropDownList DropDownListheaddepartment;
        protected global::System.Web.UI.WebControls.DropDownList DropDownListManagerDirector;
        protected global::System.Web.UI.WebControls.DropDownList DropDownListcContractType;
        protected global::System.Web.UI.WebControls.DropDownList DropDownListcInshuranceType;
        protected global::System.Web.UI.WebControls.Label lbl_ID;
        protected global::System.Web.UI.WebControls.Label lbl_Emptitleiniqama;
        protected global::System.Web.UI.WebControls.TextBox txt_Emptitleiniqama;
        protected global::System.Web.UI.WebControls.Label lbl_empcurrentjob;
        protected global::System.Web.UI.WebControls.TextBox txt_empcurrentjob;
        protected global::System.Web.UI.WebControls.Label lbl_ExtraJob;
        protected global::System.Web.UI.WebControls.TextBox txt_ExtraJob;
        protected global::System.Web.UI.WebControls.Label lbl_cManagementName;
        protected global::System.Web.UI.WebControls.Label lbl_cDepartmentName;
        protected global::System.Web.UI.WebControls.Label lbl_cDirectMnager;
        protected global::System.Web.UI.WebControls.Label lbl_cHeadOfDepartment;
        protected global::System.Web.UI.WebControls.Label lbl_cManagerDirector;
        protected global::System.Web.UI.WebControls.Label lbl_cContractType;
        protected global::System.Web.UI.WebControls.Label lbl_cStartingContract;
        protected global::System.Web.UI.WebControls.TextBox txt_cStartingContract;
        protected global::System.Web.UI.WebControls.Label lbl_cContractDuration;
        protected global::System.Web.UI.WebControls.TextBox txt_cContractDuration;
        protected global::System.Web.UI.WebControls.Label lbl_cDirectAcion;
        protected global::System.Web.UI.WebControls.TextBox txt_cDirectAcion;
        protected global::System.Web.UI.WebControls.Label lbl_cHouseCompany;
        protected global::System.Web.UI.WebControls.TextBox txt_cHouseCompany;
        protected global::System.Web.UI.WebControls.Label lbl_cCompanyDetails;
        protected global::System.Web.UI.WebControls.TextBox txt_cCompanyDetails;
        protected global::System.Web.UI.WebControls.Label lbl_cInshuranceType;
        protected global::System.Web.UI.WebControls.Label lbl_cInsuranceID;
        protected global::System.Web.UI.WebControls.TextBox txt_cInsuranceID;
        protected global::System.Web.UI.WebControls.Label lbl_cExprience1;
        protected global::System.Web.UI.WebControls.TextBox txt_cExprience1;
        protected global::System.Web.UI.WebControls.Label lbl_cExprience2;
        protected global::System.Web.UI.WebControls.TextBox txt_cExprience2;




 
 
 */