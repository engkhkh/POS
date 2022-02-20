using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.WorkFlow.PL
{
    public partial class Approve : System.Web.UI.Page
    {
        Pos.BL.cProduct p = new BL.cProduct();
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        SqlCommand cmd3 = new SqlCommand();
        SqlCommand cmd4 = new SqlCommand();
        String query = "";
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
                knowsession();
               //KNOWLEVELAPPROVALS();
               needdatasow();
                // panel hear and text boxes has date 
                this.Panel5.Attributes.Add("style", " POSITION: absolute");
            }
        }

        private void knowsession()
        {
            
        }

        //private void KNOWLEVELAPPROVALS()
        //{
        //    sqlcon.Open();
        //    da = new SqlDataAdapter(" select [wfaut101].[cRequestId],[wfaut101].[cLevelId] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc ", sqlcon);
        //    da.Fill(dt4);
        //    StringBuilder sb = new StringBuilder("");
        //    StringBuilder sbre = new StringBuilder("");
        //    for (int i = 0; i < dt4.Rows.Count; i++ )
        //    {
        //         sb.Append( dt4.Rows[i]["cLevelId"].ToString().Trim());
        //         sbre.Append(dt4.Rows[i]["cRequestId"].ToString().Trim());
        //    }
        //   Session["grade"] = sb;
        //   Session["sbre"] = sbre;
         
        //   int x = sb.Length;
        //   int y = sbre.Length;
        //   if (sb.Length == 1 && sbre.Length==8)
        //   {
        //       if (sb.ToString().Contains('1'))
        //       {
        //           query = "select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId] and [wfaut101].[cLevelId]=1  and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc";

        //       }
        //       else if (sb.ToString().Contains('2'))
        //       {
        //           string fg = "";
        //           string mg = "";
        //           da = new SqlDataAdapter(" select [wfaut101].[cEmpId] from [wfaut101],[Users] where  [wfaut101].[cCompany]=[Users].cComp and  [Users].[cId]='" + Session["username"].ToString() + "' and [wfaut101].[cLevelId]=1  and [wfaut101].[cRequestId]='" + Session["sbre"].ToString() + "' and [wfaut101].cStatus=0 ", sqlcon);
        //           da.Fill(dt5);
        //           if (dt5.Rows.Count > 0)
        //           {
        //               fg = dt5.Rows[0]["cEmpId"].ToString();
        //              // mg = dt5.Rows[1]["cEmpId"].ToString();
        //           }

        //           query = "select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId] and [wfaut101].[cLevelId]=2   and [wfaut101].cStatus not in  (select [wfaut101].cStatus from [wfaut101] where [wfaut101].cStatus=1 and ([wfaut101].[cEmpId]='" + fg.ToString() + "'  ))  order by [wfaut101].[cCreatedDate] asc";

        //       }
        //       else if (sb.ToString().Contains('3'))
        //       {
        //           string fg = "";
        //           string mg = "";
        //           da = new SqlDataAdapter(" select [wfaut101].[cEmpId] from [wfaut101],[Users] where  [wfaut101].[cCompany]=[Users].cComp and  [Users].[cId]='" + Session["username"].ToString() + "' and  ([wfaut101].[cLevelId]=1 or [wfaut101].[cLevelId]=2) and [wfaut101].[cRequestId]='" + Session["sbre"] .ToString()+ "' and [wfaut101].cStatus=0 and [wfaut101].[cLevelId]!=3 ", sqlcon);
        //           da.Fill(dt5);
        //           if (dt5.Rows.Count > 0)
        //           {
        //              fg=  dt5.Rows[0]["cEmpId"].ToString();
        //              mg=  dt5.Rows[1]["cEmpId"].ToString();
        //           }

        //           query = "select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId] and [wfaut101].[cLevelId]=3   and [wfaut101].cStatus not in  (select [wfaut101].cStatus from [wfaut101] where [wfaut101].cStatus=1 and ([wfaut101].[cEmpId]='" + fg.ToString() + "' or [wfaut101].[cEmpId]='" + mg.ToString() + "'  ))  order by [wfaut101].[cCreatedDate] asc";

        //       }
        //   }
        //   else if (sb.Length == 2 && sbre.Length == 16)
        //   {
             
        //       string reqid = Convert.ToString(sbre.ToString().Substring(8, 8));
        //       if (sb.ToString().Contains('1') && sb.ToString().Contains('1'))
        //       {

        //           query = "select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() +
        //               "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]    and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc";

        //       }
        //       else if (sb.ToString().Contains('2') && sb.ToString().Contains('3'))
        //       {
        //           query = "select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]    and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc";

        //       }
        //       else if (sb.ToString().Contains('1') && sb.ToString().Contains('2'))
        //       {
        //           query = "select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc";

        //       }
        //   }
        //   else
        //   {
        //       query = "select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc";
        //   }
           

        //   da = new SqlDataAdapter(query, sqlcon);
        //   da.Fill(dt3);
        //   GridView1.DataSource = dt3;
        //   GridView1.DataBind();
        //}
        // WANT TO KNOW DEGREE AND PARAMATAR 
        private void needdatasow()
        {
            int count=0, maxlevel=0;
            da = new SqlDataAdapter(" SELECT count(DISTINCT cRequestId) as countrequests ,MAX(cLevelId) as maxlevel from [wfaut101],[Hr001],[Users] where  [wfaut101].[cCompany]=[Users].cComp  and [wfaut101].cStatus=0 ", sqlcon);
            da.Fill(dt2);
            if (Convert.ToInt16(dt2.Rows[0]["countrequests"].ToString()) != 0 && dt2.Rows[0]["maxlevel"].ToString()!=null)
            {
                count =Convert.ToInt16( dt2.Rows[0]["countrequests"].ToString());
                maxlevel = Convert.ToInt16(dt2.Rows[0]["maxlevel"].ToString());
                

            
          
            if (count == 1 && maxlevel==1)
            {
                query = " select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor],[wfaut101].[cParam],[wfaut101].[cEmpId] from [wfaut101],[Hr001],[Users] where  [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0 and [wfaut101].[cLevelId]=1 order by [wfaut101].[cCreatedDate] asc  ";
                da = new SqlDataAdapter(query, sqlcon);//" "
                da.Fill(dt3);
                GridView1.DataSource = dt3;
                GridView1.DataBind();
            }
            else if (count == 1 && maxlevel > 1)
            {
                for (int x = 1; x <= maxlevel; x++)
                {
                    query = " select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor],[wfaut101].[cParam],[wfaut101].[cEmpId] from [wfaut101],[Hr001],[Users] where  [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0 and [wfaut101].[cLevelId]='" + (x) + "' order by [wfaut101].[cCreatedDate] asc  ";
                    da = new SqlDataAdapter(query, sqlcon);//" select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc "
                    da.Fill(dt3);
                    GridView1.DataSource = dt3;
                    GridView1.DataBind();
                }
            }
            else if (count > 1)
            {
                if (maxlevel == 1)
                {

                    query = " select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor],[wfaut101].[cParam],[wfaut101].[cEmpId] from [wfaut101],[Hr001],[Users] where  [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0 and [wfaut101].[cLevelId]='" + (1) + "' order by [wfaut101].[cCreatedDate] asc  ";
                    da = new SqlDataAdapter(query, sqlcon);//" select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc "
                    da.Fill(dt3);
                    GridView1.DataSource = dt3;
                    GridView1.DataBind();

                }
                else if (maxlevel > 1 && maxlevel <= count)

                    for (int i = 1; i <= count; i++)
                    {
                        query = " select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor],[wfaut101].[cParam],[wfaut101].[cEmpId] from [wfaut101],[Hr001],[Users] where   [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0 and [wfaut101].[cLevelId]='" + (i) + "' order by [wfaut101].[cCreatedDate] asc  ";
                        da = new SqlDataAdapter(query, sqlcon);//" select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc "
                        da.Fill(dt3);
                        GridView1.DataSource = dt3;
                        GridView1.DataBind();
                    }
                else if (maxlevel > 1 && maxlevel >= count)
                {
                    for (int j = 1; j <= maxlevel; j++)
                    {
                        query = " select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor],[wfaut101].[cParam],[wfaut101].[cEmpId] from [wfaut101],[Hr001],[Users] where  [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0 and [wfaut101].[cLevelId]='" + (j) + "' order by [wfaut101].[cCreatedDate] asc  ";
                        da = new SqlDataAdapter(query, sqlcon);//" select [wfaut101].[cCompany],[wfaut101].[cNarriation],[wfaut101].[cCreatedDate],[wfaut101].[cLevelId],[wfaut101].[cRequestId],[wfaut101].[cRequestFor] from [wfaut101],[Hr001],[Users] where [wfaut101].[cCompany]=[Users].cComp and [Users].[cId]='" + Session["username"].ToString() + "' and [Users].[cUserName]=[Hr001].[cEmpAname] and [Hr001].[cEmpId]=[wfaut101].[cEmpId]   and [wfaut101].cStatus=0  order by [wfaut101].[cCreatedDate] asc "
                        da.Fill(dt3);
                        GridView1.DataSource = dt3;
                        GridView1.DataBind();
                    }
                }
            }

            }
            else
            {
                MessageLabel.Text = "no process till now ";
            }
        }

        protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            needdatasow();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row using the SelectedRow property.
            GridViewRow row = GridView1.SelectedRow;
            Label reqfor = GridView1.SelectedRow.FindControl("lblrequestfor") as Label;
            Label reqdate = GridView1.SelectedRow.FindControl("lblrequestdate") as Label;
            Label comid = GridView1.SelectedRow.FindControl("comid") as Label;
            Label reqlblNarriation = GridView1.SelectedRow.FindControl("lblNarriation") as Label;
            Label reqid = GridView1.SelectedRow.FindControl("lblcRequestId") as Label;
            Label level = GridView1.SelectedRow.FindControl("lblcLevelId") as Label;
            Label param = GridView1.SelectedRow.FindControl("Label1") as Label;
            Label empid = GridView1.SelectedRow.FindControl("Label2") as Label;
                // Display the first name from the selected row.
            // In this example, the third column (index 2) contains
            // the first name.
            MessageLabel.Text = "RequestID Selected " + reqid.Text + "";
            Session["reqid"] = reqid.Text;
            Session["comid1"] = comid.Text;
            Session["reqlblNarriation"] = reqlblNarriation.Text;
            Session["reqfor1"] = reqfor.Text;
            Session["reqdate1"] = reqdate.Text;
            Session["level"] = level.Text;
            // store paramatar here 
            Session["session"] = param.Text.Trim();
            Session["empid"] = empid.Text.Trim();
            sqlcon.Open();
            cmd = new SqlCommand("select [Flows01].[cSession] from [Flows01] where [Flows01].[cParamatar]='" +param.Text.Trim()+ "'   ", sqlcon);
            string flowsession=cmd.ExecuteScalar().ToString().Trim();
            // TextBox7.Text = GridView1.SelectedRow.Cells[4].Text.ToString(); 
            // Session["reqid"] = TextBox7.Text;
            string HIGG = "../../WorkFlow/PL/" + flowsession.Trim() + ".aspx";
            Response.Redirect(HIGG);
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Button8_Click(object sender, EventArgs e)
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

        }

        protected void Button13_Click(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }
    }
}