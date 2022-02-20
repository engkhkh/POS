using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using System.IO;

namespace Pos.Hr.PL
{
    public partial class Leave_Request_Before : System.Web.UI.Page
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

                    DropDownList2.DataSource = dt;
                    DropDownList2.DataTextField = "cCompName";
                    DropDownList2.DataValueField = "cCompany";
                    DropDownList2.DataBind();



                }
                // methods 
                needdatasow();
               // panel hear and text boxes has date 
                this.TextBox2.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                this.TextBox5.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                this.TextBox6.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                this.Panel1.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel2.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel3.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel4.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                // show panels here 
                this.Panel5.Attributes.Add("style", " POSITION: absolute");



            }
        }
        // top menu actions
        protected void Button8_Click(object sender, EventArgs e)
        {
            this.Panel1.Attributes.Add("style", " POSITION: absolute");
            this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            // DISAPPEAR PREVIOUS REQUEST 
            DropDownList2.SelectedIndex = 0;
            TextBox1.Text = "";
            TextBox4.Text = "";
            Label15.Text = "";
        }

        protected void Button9_Click(object sender, EventArgs e)
        {

        }

        protected void Button10_Click(object sender, EventArgs e)
        {

        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            String lvparamatar = "";
            String firstapproveidtogetmail = "";
            if (Session["comid"] != null && selectedreq.ToString().Trim() != null)
            {
               
             
            try
            {
                sqlcon.Open();
                cmd5 = new SqlCommand("select [Hr00Departments].[cDepid] from [Hr00Departments],[Hr00jobdata],[Hr001] where Hr001.cEmpAname='" + Session["reqfor"].ToString() + "' and Hr001.cEmpId=Hr00jobdata.cEmpId and [Hr00Departments].[cDepName]=[Hr00jobdata].[cDepartmentName] ", sqlcon);
                lvparamatar = "lv" + cmd5.ExecuteScalar();
                cmd = new SqlCommand(" SELECT count(*)   FROM [Flows02] WHERE cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + Session["comid"].ToString() + "' and  [cParamatar]='" + lvparamatar.ToString().Trim() + "'", sqlcon);
               int count =(int) cmd.ExecuteScalar();
               da = new SqlDataAdapter(" SELECT [cGrade],[cEmpId]  FROM [pos].[dbo].[Flows02] WHERE cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + Session["comid"].ToString() + "' and  [cParamatar]='" + lvparamatar.ToString().Trim() + "' group by   [cGrade],[cEmpId]  ", sqlcon);
               da.Fill(dt5);
             
               if (count != 0)
               {
                   string cflag = "بالانتظار";
                   // get first approve to send mail 
                   firstapproveidtogetmail = dt5.Rows[0]["cEmpId"].ToString();
                   cmd = new SqlCommand("insert into [Hr11Leave01] (cGrpCompany,cCompany,cRequestId,cApproved,cUser) values('" + Session["grpcmp"].ToString() + "','" + Session["comid"].ToString() + "','" + Session["reqid"].ToString() + "','" + 0 + "','" + Session["username"].ToString() + "')", sqlcon);
                   cmd.ExecuteNonQuery();
                   for (int i = 1; i <= count && dt5.Rows.Count > 0; i++)
                   {
                       //MessageLabel.Text = "";
                       String nar = "LeaveRequest";

                       cmd2 = new SqlCommand("insert into [wfaut101] (cGrpCompany,cCompany,cRequestId,cRequestFor,cEmpId,cLevelId,cCreatedDate,cApprovedDate,cNarriation,cParam,cRemark,cStatus,cFlag) values('" + Session["grpcmp"].ToString() + "','" + Session["comid"].ToString() + "','" + Session["reqid"].ToString() + "','" + Session["reqfor"].ToString() + "','" + dt5.Rows[i - 1]["cEmpId"].ToString() + "','" + i + "','" + Session["reqdate"].ToString() + "','" + 0 + "','" + nar + "','" + lvparamatar.ToString() + "','" + 0 + "','" + 0 + "','" + cflag + "')", sqlcon);
                       cmd2.ExecuteNonQuery();
                   }

                   // get mail for requestor 
                   da = new SqlDataAdapter("select [Hr001].cEmpEmail from [Hr00jobdata],[Hr001] where [Hr00jobdata].cGrpCompany='" + Session["grpcmp"].ToString() + "' and [Hr00jobdata].cCompany='" + Session["comid"].ToString() + "' and Hr001.cEmpAname='" + Session["reqfor"].ToString() + "' and Hr001.cEmpId=Hr00jobdata.cEmpId  ", sqlcon);
                   da.Fill(dt4);
                   //get mail for first approval 
                   da = new SqlDataAdapter("select [Hr001].cEmpEmail from [Hr00jobdata],[Hr001] where [Hr00jobdata].cGrpCompany='" + Session["grpcmp"].ToString() + "' and [Hr00jobdata].cCompany='" + Session["comid"].ToString() + "'  and Hr001.cEmpId='" + firstapproveidtogetmail.Trim() + "' and Hr00jobdata.cEmpId='" + firstapproveidtogetmail.Trim() + "'  ", sqlcon);
                   da.Fill(dt6);
                   // send mail
                  // Session["directmanager"] = dt4.Rows[0]["cManagerDirector"].ToString();
                   Session["mail"] = dt4.Rows[0]["cEmpEmail"].ToString().Trim();
                   Session["mailforfirstapproval"] = dt6.Rows[0]["cEmpEmail"].ToString().Trim();
                   //
                   try
                   {
                       string body = this.createEmailBody("", "RequestId Sent To Approval ", Session["reqid"].ToString());

                       this.SendHtmlFormattedEmail("Request Sent To Approval!", body);
                       //MailMessage mail = new MailMessage();
                       //SmtpClient SmtpServer = new SmtpClient("us2.smtp.mailhostbox.com");
                       //mail.IsBodyHtml = true;
                       //mail.From = new MailAddress("hr@enghous.com");
                       //mail.To.Add(Session["mail"].ToString());
                       //mail.Subject = "بخصوص طلب اجازة ";
                       //mail.Body = "Hi" + Session["reqfor"].ToString() +
                       //    "<br/>لديك طلب اجازة رقم <br/>" + Session["reqid"].ToString() +"<br/>"+
                       //    "سوف يصلك اميل اخر في حالة الاعتماد<br/> "+"<br/>"+"HR Team"; 

                       //SmtpServer.Port = 25;
                       //SmtpServer.UseDefaultCredentials = false;
                       //SmtpServer.Credentials = new System.Net.NetworkCredential("hr@enghous.com", "HR123456789");
                       //SmtpServer.EnableSsl = true;
                       //mail.IsBodyHtml = true;
                       //SmtpServer.Send(mail);
                       //MessageBox.Show("mail Send");
                   }
                   catch (Exception ex)
                   {
                       MessageLabel.Text = ex.Message;
                       // Response.Write("<script>alert('CANT SEND MAIL ');</script>");
                       //MessageBox.Show(ex.ToString());
                   }

               }

               else
               {
                   cmd = new SqlCommand("insert into [Hr11Leave01] (cGrpCompany,cCompany,cRequestId,cApproved,cUser) values('" + Session["grpcmp"].ToString() + "','" + Session["comid"].ToString() + "','" + Session["reqid"].ToString() + "','" + 1 + "','" + Session["username"].ToString() + "')", sqlcon);
                   cmd.ExecuteNonQuery();
                   Response.Write("<script>No Approval Setup,So go to Approved Directly ');</script>");
               }
                // get who will approve 
                //   da = new SqlDataAdapter("select [Hr00jobdata].cDirectMnager,[Hr00jobdata].cHeadOfDepartment,[Hr00jobdata].cManagerDirector,[Hr001].cEmpEmail from [Hr00jobdata],[Hr001] where [Hr00jobdata].cGrpCompany='" + Session["grpcmp"].ToString() + "' and [Hr00jobdata].cCompany='" + Session["comid"].ToString() + "' and Hr001.cEmpAname='" + Session["reqfor"].ToString() + "' and Hr001.cEmpId=Hr00jobdata.cEmpId  ", sqlcon);
                //da.Fill(dt4);
                //if(dt4.Rows.Count>0){
                //    // put in pending table 
                    
                    
                //    //cmd3 = new SqlCommand("insert into [wfaut101] (cGrpCompany,cCompany,cRequestId,cRequestFor,cEmpId,cLevelId,cCreatedDate,cApprovedDate,cNarriation,cParam,cRemark,cStatus) values('" + Session["grpcmp"].ToString() + "','" + Session["comid"].ToString() + "','" + Session["reqid"].ToString() + "','" + Session["reqfor"].ToString() + "','" + dt4.Rows[0]["cHeadOfDepartment"].ToString() + "','" + 2 + "','" + Session["reqdate"].ToString() + "','" + 0 + "','" + nar + "','" + Session["lvparamatar"] .ToString()+ "','" + 0 + "','" + 0 + "')", sqlcon);
                //    //cmd3.ExecuteNonQuery();
                //    //cmd4 = new SqlCommand("insert into [wfaut101] (cGrpCompany,cCompany,cRequestId,cRequestFor,cEmpId,cLevelId,cCreatedDate,cApprovedDate,cNarriation,cParam,cRemark,cStatus) values('" + Session["grpcmp"].ToString() + "','" + Session["comid"].ToString() + "','" + Session["reqid"].ToString() + "','" + Session["reqfor"].ToString() + "','" + dt4.Rows[0]["cManagerDirector"].ToString() + "','" + 3 + "','" + Session["reqdate"].ToString() + "','" + 0 + "','" + nar + "','" + Session["lvparamatar"] .ToString()+ "','" + 0 + "','" + 0 + "')", sqlcon);
                //    //cmd4.ExecuteNonQuery();
                //    //cmd6 = new SqlCommand("insert into [Flows01](cGrpCompany,cCompany,cParamatar,cGrade,cEmp) values('" + Session["grpcmp"].ToString() + "','" + Session["comid"].ToString() + "','" + Session["lvparamatar"].ToString() + "','" + 1 + "','" + dt4.Rows[0]["cDirectMnager"].ToString() + "')", sqlcon);
                //    //cmd6.ExecuteNonQuery();
                //    // send mail to requestor 
                   
                   

                //}
                //else
                //{
                    
                //}
                




                // send mail

            }
            catch(SqlException EX){

            }
                finally{
                    needdatasow();

            }
            }
            else
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('PLEASE SELECT REQUEST')", true);
                Response.Write("<script>alert('PLEASE SELECT REQUEST ');</script>");
            }

        }

        private string createEmailBody(string p1, string p2, string p3)
        {
            string body = string.Empty;
            //using streamreader for reading my htmltemplate   

            using (StreamReader reader = new StreamReader(Server.MapPath("../../Hr/PL/HtmlTemplate.html")))
            {

                body = reader.ReadToEnd();

            }

            body = body.Replace("{UserName}", p1); //replacing the required things  

            body = body.Replace("{Title}", p2);

            body = body.Replace("{message}", p3);

            return body;  
        }

        private void SendHtmlFormattedEmail(string p, string body)
        {
            using (MailMessage mailMessage = new MailMessage())
            {

                mailMessage.From = new MailAddress("hr@enghous.com");

                mailMessage.Subject = p;

                mailMessage.Body = body;

                mailMessage.IsBodyHtml = true;

                mailMessage.To.Add(Session["mail"].ToString());
                mailMessage.To.Add(Session["mailforfirstapproval"].ToString());
                

                SmtpClient smtp = new SmtpClient();

                smtp.Host = "us2.smtp.mailhostbox.com";

                smtp.EnableSsl =true;

                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();

                NetworkCred.UserName = "hr@enghous.com";

                NetworkCred.Password = "HR123456789";  

                smtp.UseDefaultCredentials = true;

                smtp.Credentials = NetworkCred;

                smtp.Port = 25; //reading from web.config  

                smtp.Send(mailMessage);

            }  
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../WorkFlow/Reports/LeaveReport2.aspx");
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../WorkFlow/Reports/LeaveReport.aspx");
        }
        

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox2.Text = Calendar1.SelectedDate.ToShortDateString();
            this.Panel2.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            this.Panel2.Attributes.Add("style", " POSITION: absolute");
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            TextBox5.Text = Calendar2.SelectedDate.ToShortDateString();
            this.Panel3.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            this.Panel3.Attributes.Add("style", " POSITION: absolute");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.Panel4.Attributes.Add("style", " POSITION: absolute");
        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {
            TextBox6.Text = Calendar3.SelectedDate.ToShortDateString();
            this.Panel4.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
           
            try
            {
                Label15.Text = "";
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr11Leave] (cGrpCompany,cCompany,cRequestId,cRequestDate,cRequestFor,cRequestTopic,cVacationStart,cVacationEnd,cTravelTo,cUser) values('" + Session["grpcmp"].ToString() + "','" + DropDownList2.SelectedValue + "','" + TextBox1.Text.Trim() + "','" + TextBox2.Text.Trim() + "','" + DropDownList1.SelectedItem.Text.Trim() + "','" + TextBox4.Text.Trim() + "','" + TextBox5.Text.Trim() + "','"+TextBox6.Text.Trim()+"','"+TextBox8.Text.Trim()+"','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label15.Text = "Added";

            }
            catch (Exception ex)
            {
                Label15.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
                // panels open and close here 
                this.Panel1.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel5.Attributes.Add("style", " POSITION: absolute");

                needdatasow();
                //DropDownList30.SelectedIndex = 0;
                //DropDownList30.DataBind();
            }
        }
        protected void getmax()
        {
             
            sqlcon.Open();
            cmd = new SqlCommand("SELECT MAX ([cRequestId]+1) as p FROM [pos].[dbo].[Hr11Leave] WHERE cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + DropDownList2.SelectedValue + "'", sqlcon);
            //    int x=Convert.ToInt32(cmd.ExecuteScalar());
            if (cmd.ExecuteScalar().Equals(DBNull.Value))
            {
                int init = 20000000;
                TextBox1.Text = Convert.ToString(init);

            }
            else
            {

                TextBox1.Text = Convert.ToString(cmd.ExecuteScalar());
            }


            sqlcon.Close();
        }
        protected void showwhosent()
        {

        }
        protected void needdatasow()
        {
          
            
            da = new SqlDataAdapter(" select  DISTINCT [Hr11Leave].[cCompany],[Hr11Leave].[cRequestId],[Hr11Leave].[cRequestDate],[Hr11Leave].[cRequestFor],[Hr11Leave].[cRequestTopic],[Hr11Leave].[cVacationStart],[Hr11Leave].[cVacationEnd],[wfaut101].[cParam] from [Hr11Leave],[wfaut101] where Hr11Leave.cGrpCompany='" + Session["grpcmp"].ToString() + "'  and Hr11Leave.cRequestId NOT IN (SELECT cRequestId from Hr11Leave01 ) and Hr11Leave.cUser='" + Session["username"].ToString() + 
                "' UNION select DISTINCT [Hr11Leave].[cCompany],[Hr11Leave].[cRequestId],[Hr11Leave].[cRequestDate],[Hr11Leave].[cRequestFor],[Hr11Leave].[cRequestTopic],[Hr11Leave].[cVacationStart],[Hr11Leave].[cVacationEnd],[wfaut101].[cParam] from [Hr11Leave],[wfaut101] where [wfaut101].[cFlag]='مرفوض'and [wfaut101].cCompany=[Hr11Leave].cCompany and [Hr11Leave].cRequestId=[wfaut101].cRequestId  order by Hr11Leave.cRequestId desc ", sqlcon);
            da.Fill(dt3);
            if (dt3.Rows.Count <= 0)
            {
                da = new SqlDataAdapter(" select  DISTINCT [Hr11Leave].[cCompany],[Hr11Leave].[cRequestId],[Hr11Leave].[cRequestDate],[Hr11Leave].[cRequestFor],[Hr11Leave].[cRequestTopic],[Hr11Leave].[cVacationStart],[Hr11Leave].[cVacationEnd] from [Hr11Leave] where Hr11Leave.cGrpCompany='" + Session["grpcmp"].ToString() + "'  and Hr11Leave.cRequestId NOT IN (SELECT cRequestId from Hr11Leave01 ) and Hr11Leave.cUser='" + Session["username"].ToString() +
                "'  order by Hr11Leave.cRequestId desc ", sqlcon);
                da.Fill(dt3);
                GridView1.DataSource = dt3;
                GridView1.DataBind();

            }
            else
            {
                GridView1.DataSource = dt3;
                GridView1.DataBind();
            }

           
           
        }
        
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            getmax();
            Label15.Text = "";
            da = new SqlDataAdapter(" select * from [Hr001] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList2.SelectedValue + "' ", sqlcon);
            da.Fill(dt2);
            DropDownList1.DataSource = dt2;
            DropDownList1.DataTextField = "cEmpAname";
            DropDownList1.DataValueField = "cEmpId";
            DropDownList1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label15.Text = "";
        }

        protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            needdatasow();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            da = new SqlDataAdapter(" select * from [Hr11Leave] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and [cRequestId]+[cRequestFor]+[cRequestTopic]+[cRequestDate]  like '%" + TextBox7.Text + "%'   ", sqlcon);
            da.Fill(dt3);
            GridView1.DataSource = dt3;
            GridView1.DataBind();

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
            cmd = new SqlCommand("Update [Hr11Leave] set [cRequestTopic]='" + reqtopice.Text + "',[cVacationStart]='" + vacationstart.Text + "',[cVacationEnd]='" + vacationend.Text + "' where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='"+comid.Text+"'  and   cRequestId='" + reqid.Text + "'  ", sqlcon);
            //* Convert.ToDouble(qty.Text)
            //AND cCId='" + Session["cpcatid"].ToString() + "'
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  

            needdatasow();

        }

       

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
           
           /*
            foreach(GridViewRow row in GridView1.Rows)
            {
                if(row.RowIndex==GridView1.SelectedIndex)
                {
                    row.BackColor = System.Drawing.ColorTranslator.FromHtml("#3366FF");
                    row.ToolTip = string.Empty;
                    Label16.Text = row.Cells[2].Text;
                    Session["reqid"] = Label16.Text;
                }
                else
                {
                   // row.BackColor=System.Drawing.ColorTranslator.FromHtml("#7FFFD4");GridView1_RowCancelingEdit
                    row.ToolTip = "click the row to selecting the row ";
                }
            }
             */
           
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
            //    e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
            //    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            //    e.Row.ToolTip = "Click the row for selecting this row";
            //} 
            //e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
            
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int index = Convert.ToInt32(e.CommandArgument);
            //needdatasow();//Your method to set datasource anddatabind GridView1
            //GridView1.Rows[index].Attributes.Add("style", "background-color:yellow");
            //// Even better add a class here so that you have more control from css
            //// GridView1.Rows[index].Attributes.Add("class", "mycustomclass");
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row using the SelectedRow property.
            GridViewRow row = GridView1.SelectedRow;
            Label reqfor = GridView1.SelectedRow.FindControl("lblrequestfor") as Label;
            Label reqdate = GridView1.SelectedRow.FindControl("lblrequestdate") as Label;
            Label comid = GridView1.SelectedRow.FindControl("comid") as Label;
            Label reqid = GridView1.SelectedRow.FindControl("lblrequestid") as Label;
           Label param = GridView1.SelectedRow.FindControl("Label1") as Label;
            ////Label empid = GridView1.SelectedRow.FindControl("Label2") as Label;
            // Display the first name from the selected row.
            // In this example, the third column (index 2) contains
            // the first name.
            MessageLabel.Text = "" + reqid .Text+ "";
            selectedreq = reqid.Text;
            Session["comid"] = comid.Text;
            Session["reqid"] = reqid.Text;
            Session["reqfor"]=reqfor.Text;
            Session["reqdate"] = reqdate.Text;
            Session["session"] = param.Text;
            // store paramatar here 
            // STORE SESSION FOR session used in reports
            Session["comid1"] = Session["comid"].ToString();
            Session["reqfor1"] = Session["reqfor"].ToString();
            //Session["session"] = param.Text.Trim();
            //Session["empid"] = empid.Text.Trim();
           // TextBox7.Text = GridView1.SelectedRow.Cells[4].Text.ToString(); 
           // Session["reqid"] = TextBox7.Text;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Response.Redirect("../../WorkFlow/Reports/LeaveReport2.aspx");
        }

        
    }
}