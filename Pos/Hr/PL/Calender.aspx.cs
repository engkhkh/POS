using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.Hr.PL
{
    public partial class Calender : System.Web.UI.Page
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
                Bind_CheckList();// Call CheckBox List Bind Method.
            }
        }
        protected void Bind_CheckList() // Method for Binding The Checkbox List  
        {
            List<string> listContents = new List<string>();// Create a List of String Elements  
            listContents.Add("Wednesday");
            listContents.Add("Thursday");
            listContents.Add("Friday");
            listContents.Add("Saturday");
            listContents.Add("Sunday");
            listContents.Add("Monday");
            listContents.Add("Tuesday");
           

            CheckboxList1.DataSource = listContents;//Set Datasource to CheckBox List  
            CheckboxList1.DataBind(); // Bind the checkboxList with String List.  
            CheckboxList1.SelectedIndex = 2;
          

        }
        protected void GenerateCalendar(object sender, EventArgs e)
        {
            string str="";
            string str1 = "not working";
            string str2 = " working";
            updateshifttime();
            DataTable dt = BindGrid(txtStartDate.Text.Trim(), txtEndDate.Text.Trim());
            if(dt.Rows.Count>0)
            {
               
                for (int i = 0; i <dt.Rows.Count; i++)
                {
                   
                        if (dt.Rows[i]["DayName"].ToString() == CheckboxList1.Items[2].Text)
                        {

                            sqlcon.Open();
                            //str += CheckboxList1.Items[2].Text + " ," + "<br/>"; // add selected Item text to the String .  
                            string date = Convert.ToDateTime(dt.Rows[i]["date"].ToString()).ToString("yyyy/MM/dd");
                            string cDayName = dt.Rows[i]["DayName"].ToString();
                            cmd = new SqlCommand(" insert into [Hr00CalenderWorkingDayd] (cGrpComapny,cCompany,cShift,cDtDate,cDayName,cWorking,cNar) values ('" + Session["grpcmp"].ToString() + "','" + ddlcompch.SelectedValue.Trim() + "','" + DropDownList1.SelectedValue.ToString().Trim() + "','" + date.ToString() + "','" + cDayName .ToString().Trim()+ "','" + 0 + "','" + str1 + "') ", sqlcon);
                            cmd.ExecuteNonQuery();
                            sqlcon.Close();



                        }
                        else
                        {
                            sqlcon.Open();
                            //str += CheckboxList1.Items[2].Text + " ," + "<br/>"; // add selected Item text to the String .  
                            string date = Convert.ToDateTime(dt.Rows[i]["date"].ToString()).ToString("yyyy/MM/dd");
                            string cDayName = dt.Rows[i]["DayName"].ToString();
                            cmd = new SqlCommand(" insert into [Hr00CalenderWorkingDayd] (cGrpComapny,cCompany,cShift,cDtDate,cDayName,cWorking,cNar) values ('" + Session["grpcmp"].ToString() + "','" + ddlcompch.SelectedValue.Trim() + "','" + DropDownList1.SelectedValue.ToString().Trim() + "','" + date.ToString() + "','" + cDayName.ToString().Trim() + "','" + 1 + "','" + str2 + "') ", sqlcon);
                            cmd.ExecuteNonQuery();
                            sqlcon.Close();
                        }



                
                }
            }
            gvCalendarData.DataSource = dt;
            gvCalendarData.DataBind();
            lblmsg.Text = "Selected days are <br/><br/>" + str; // Show selected Item List by Label. 
            Response.Write("<script>alert('done');</script>");
        }

        private void updateshifttime()
        {
            sqlcon.Open();
            cmd = new SqlCommand(" UPDATE [Hr00Times] SET [cShiftFrom]='" + Convert.ToDateTime(txtStartDate.Text).ToString("yyyy/MM/dd") + "',[cShiftTo]='" + Convert.ToDateTime(txtEndDate.Text).ToString("yyyy/MM/dd") + "' where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch.SelectedValue.ToString().Trim() + "' and cShiftId='" + DropDownList1.SelectedValue.Trim() + "' ", sqlcon);
            cmd.ExecuteNonQuery();
            sqlcon.Close();
        }

        private DataTable BindGrid(string startDate, string endDate)
        {
            string constr = ConfigurationManager.ConnectionStrings["U001"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("GetCalendar");
            cmd.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(txtStartDate.Text.Trim()));
            cmd.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(txtEndDate.Text.Trim()));
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand = cmd;
            DataTable ds = new DataTable();
            sda.Fill(ds);
            return ds;
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{



        //    //string str = "";

        //    //for (int i = 0; i < CheckboxList1.Items.Count; i++)
        //    //{
        //    //    if (CheckboxList1.Items[i].Selected == true)// getting selected value from CheckBox List  
        //    //    {
        //    //        str += CheckboxList1.Items[i].Text + " ," + "<br/>"; // add selected Item text to the String .  
        //    //    }


        //    //}
        //    //if (str != "")
        //    //{
        //    //    str = str.Substring(0, str.Length - 7); // Remove Last "," from the string .  
        //    //    lblmsg.Text = "Selected days are <br/><br/>" + str; // Show selected Item List by Label.  
        //    //}
        //}

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            // bind shifts 
            da = new SqlDataAdapter(" select * from [Hr00Shifts] where cGrpCompany='" + Session["grpcmp"].ToString() + "'and cCompany='" + ddlcompch.SelectedValue.ToString() + "' ", sqlcon);
            da.Fill(dt1);
            DropDownList1.DataSource = dt1;
            DropDownList1.DataTextField = "cShiftName";
            DropDownList1.DataValueField = "cShiftId";
            DropDownList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand(" delete  from [Hr00CalenderWorkingDayd] where cGrpComapny='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch.SelectedValue + "' and cShift='" + DropDownList1.SelectedValue.Trim() + "' ", sqlcon);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('done');</script>");
            }
            catch (SqlException ex)
            {

            }
            finally
            {
                sqlcon.Close();

            }
        }
    }
}