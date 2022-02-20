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
    public partial class Leave_Request_Pending : System.Web.UI.Page
    {
        Pos.BL.cProduct p = new BL.cProduct();
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        DataTable dt6 = new DataTable();

        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        SqlCommand cmd3 = new SqlCommand();
        SqlCommand cmd4 = new SqlCommand();
        SqlCommand cmd5 = new SqlCommand();
        String selectedreq = "";
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

                    //// dropdownlist 

                    //DropDownList2.DataSource = dt;
                    //DropDownList2.DataTextField = "cCompName";
                    //DropDownList2.DataValueField = "cCompany";
                    //DropDownList2.DataBind();



                }
                // methods 
                needdatasow();
                // panel hear and text boxes has date 
                //this.TextBox2.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                //this.TextBox5.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                //this.TextBox6.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                //this.Panel1.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                //this.Panel2.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                //this.Panel3.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                //this.Panel4.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                // show panels here 
                this.Panel5.Attributes.Add("style", " POSITION: absolute");



            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            needdatasow();

        }

        private void needdatasow()
        {
            da = new SqlDataAdapter(" select DISTINCT [Hr11Leave].[cCompany],[Hr11Leave].[cRequestId],[Hr11Leave].[cRequestDate],[Hr11Leave].[cRequestFor],[Hr11Leave].[cRequestTopic],[Hr11Leave].[cVacationStart],[Hr11Leave].[cVacationEnd],[wfaut101].[cParam] from [Hr11Leave],[wfaut101] where [wfaut101].[cFlag]='بالانتظار'and [wfaut101].cCompany=[Hr11Leave].cCompany and [Hr11Leave].cRequestId=[wfaut101].cRequestId order by Hr11Leave.cRequestId desc ", sqlcon);
            da.Fill(dt3);
            GridView1.DataSource = dt3;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label comid = GridView1.Rows[e.RowIndex].FindControl("comid") as Label;
            Label reqid = GridView1.Rows[e.RowIndex].FindControl("lblrequestid") as Label;
            TextBox reqtopice = GridView1.Rows[e.RowIndex].FindControl("txtrequesttopic") as TextBox;
            TextBox vacationstart = GridView1.Rows[e.RowIndex].FindControl("vacationstartdate") as TextBox;
            TextBox vacationend = GridView1.Rows[e.RowIndex].FindControl("vacationstartend") as TextBox;
            // Label EMPid1 = (Label)sender;
            // GridViewRow row1 = (GridViewRow)EMPid.NamingContainer;
            sqlcon.Open();
            //updating the record  
            cmd = new SqlCommand("delete from [Hr11Leave] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + comid.Text + "'  and   cRequestId='" + reqid.Text + "'  ", sqlcon);
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            needdatasow();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
          
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            // needdatasow();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update 
            Label comid = GridView1.Rows[e.RowIndex].FindControl("comid") as Label;
            Label reqid = GridView1.Rows[e.RowIndex].FindControl("lblrequestid") as Label;
            TextBox reqtopice = GridView1.Rows[e.RowIndex].FindControl("txtrequesttopic") as TextBox;
            TextBox vacationstart = GridView1.Rows[e.RowIndex].FindControl("vacationstartdate") as TextBox;
            TextBox vacationend = GridView1.Rows[e.RowIndex].FindControl("vacationstartend") as TextBox;


            sqlcon.Open();
            //updating the record  
            cmd = new SqlCommand("Update [Hr11Leave] set [cRequestTopic]='" + reqtopice.Text + "',[cVacationStart]='" + vacationstart.Text + "',[cVacationEnd]='" + vacationend.Text + "' where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + comid.Text + "'  and   cRequestId='" + reqid.Text + "'  ", sqlcon);
            //* Convert.ToDouble(qty.Text)
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  

            needdatasow();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row using the SelectedRow property.
            GridViewRow row = GridView1.SelectedRow;
            Label reqfor = GridView1.SelectedRow.FindControl("lblrequestfor") as Label;
            Label reqdate = GridView1.SelectedRow.FindControl("lblrequestdate") as Label;
            Label comid = GridView1.SelectedRow.FindControl("comid") as Label;
            Label reqid = GridView1.SelectedRow.FindControl("lblrequestid") as Label;
            Label level = GridView1.SelectedRow.FindControl("lblcLevelId") as Label;
            Label param = GridView1.SelectedRow.FindControl("Label1") as Label;
            //Label empid = GridView1.SelectedRow.FindControl("Label2") as Label;
            // Display the first name from the selected row.
            // In this example, the third column (index 2) contains
            // the first name.
            MessageLabel.Text = "" + reqid.Text + "";
            selectedreq = reqid.Text;
            Session["comid1"] = comid.Text;
            Session["reqid"] = reqid.Text;
            Session["reqfor1"] = reqfor.Text;
            Session["reqdate"] = reqdate.Text;
            // store paramatar here 
            Session["session"] = param.Text.Trim();
            //Session["empid"] = empid.Text.Trim();
            // TextBox7.Text = GridView1.SelectedRow.Cells[4].Text.ToString(); 
            // Session["reqid"] = TextBox7.Text;

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Button9_Click(object sender, EventArgs e)
        {

        }

        protected void Button10_Click(object sender, EventArgs e)
        {

        }

        protected void Button11_Click(object sender, EventArgs e)
        {

        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../WorkFlow/Reports/LeaveReport2.aspx");
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("../../WorkFlow/Reports/LeaveReport.aspx");
            //String url_To_Open = "../../WorkFlow/Reports/LeaveReport.aspx";
            //string modified_URL = "window.open('" + url_To_Open + "', '_blank');";
            //ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", modified_URL, true);
        }

        protected void Button8_Click(object sender, EventArgs e)
        {

        }
    }
}