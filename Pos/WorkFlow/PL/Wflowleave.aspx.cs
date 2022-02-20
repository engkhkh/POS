using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.WorkFlow.PL
{
    public partial class Wflowleave : System.Web.UI.Page
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
        string HIGG="";
        string LeaveRequest = "LeaveRequest";
        String requestormail="";
        String approvalmail = "";
        string flag = "موافق";
        string flag2 = "مرفوض ";
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
                //knowsession();
                ////KNOWLEVELAPPROVALS();
                //needdatasow();
                bringdata();
                // panel hear and text boxes has date 
                this.Panel5.Attributes.Add("style", " POSITION: absolute");
            }

        }

        private void bringdata()
        {
            da = new SqlDataAdapter("select [cRequestId],[cRequestDate],[cRequestFor],[cRequestTopic],[cVacationStart],[cVacationEnd] from [Hr11Leave] where [cGrpCompany]='" + Session["grpcmp"].ToString() + "' and [cCompany]='" + Session["comid1"].ToString().Trim() + "' and [cRequestId]='" + Session["reqid"] .ToString().Trim()+ "'", sqlcon);
            da.Fill(dt2);
            if (dt2.Rows.Count > 0)
            {
                TextBoxrequestId.Text = dt2.Rows[0]["cRequestId"].ToString().Trim();
                TextBoxrequestfor.Text = dt2.Rows[0]["cRequestFor"].ToString().Trim();
                TextBoxrequestNotice.Text = dt2.Rows[0]["cRequestTopic"].ToString().Trim();
                TextBoxLeaveStart.Text = dt2.Rows[0]["cVacationStart"].ToString().Trim();
                TextBoxLeaveEnd.Text = dt2.Rows[0]["cVacationEnd"].ToString().Trim();
            }
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
            Response.Redirect("../../WorkFlow/Reports/LeaveReport2.aspx");
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../WorkFlow/Reports/LeaveReport.aspx");
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            
            // in approved case 
            // bring maxgrade 
            int maxgrade=0;
            sqlcon.Open();
            cmd2 = new SqlCommand("select MAX(cLevelId) as maxlevel from [wfaut101] where [cGrpCompany]='" +
                Session["grpcmp"].ToString() + "' and [cCompany]='" + Session["comid1"].ToString().Trim() +
                "' and [cRequestId]='" + Session["reqid"].ToString().Trim() + "' ", sqlcon);
            maxgrade =Convert.ToInt16( cmd2.ExecuteScalar());
            sqlcon.Close();
                //update status to 1 for which user and grade level 
                sqlcon.Open();
            cmd = new SqlCommand("update [wfaut101] set [cApprovedDate]='" + DateTime.Now + "', [cRemark]='"
                + TextBoxrequestNoticeapproval.Text.Trim() + "',[cStatus]=1,[cFlag]='"+flag.ToString().Trim()+"'  where [cGrpCompany]='" +
                Session["grpcmp"].ToString() + "' and [cCompany]='" + Session["comid1"].ToString().Trim() +
                "' and [cRequestId]='" + Session["reqid"].ToString().Trim() + "' and [cLevelId]='"+
                Session["level"].ToString().Trim() + "'  ", sqlcon);
            cmd.ExecuteNonQuery();
            sqlcon.Close();
         
            // check if it was last level,update status in Hr11Leave01 table 
            if (maxgrade ==Convert.ToInt16( Session["level"].ToString().Trim()))
            {
                sqlcon.Open();
                cmd3 = new SqlCommand(" update [Hr11Leave01] set [cApproved]=1 where [cGrpCompany]='" +
                Session["grpcmp"].ToString() + "' and [cCompany]='" + Session["comid1"].ToString().Trim() +
                "' and [cRequestId]='" + Session["reqid"].ToString().Trim() + "'", sqlcon);
                cmd3.ExecuteNonQuery();
                sqlcon.Close();
            }
            // send mail
            string wholevel = "LeaveRequest Approved by Level : " + Session["level"].ToString().Trim();
            string body = this.createEmailBody("", wholevel, Session["reqid"].ToString());

            this.SendHtmlFormattedEmail("LeaveRequest Approved", body);
             HIGG = "../../WorkFlow/PL/Approve.aspx";
            Response.Redirect(HIGG);
        }
        private string createEmailBody(string p1, string p2, string p3)
        {
            string body = string.Empty;
            //using streamreader for reading my htmltemplate   

            using (StreamReader reader = new StreamReader(Server.MapPath("../../WorkFlow/PL/HtmlTemplate.html")))
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
            getmailsid();
            using (MailMessage mailMessage = new MailMessage())
            {

                mailMessage.From = new MailAddress("hr@enghous.com");

                mailMessage.Subject = p;

                mailMessage.Body = body;

                mailMessage.IsBodyHtml = true;

                mailMessage.To.Add(requestormail.ToString());
                mailMessage.To.Add(approvalmail.ToString());


                SmtpClient smtp = new SmtpClient();

                smtp.Host = "us2.smtp.mailhostbox.com";

                smtp.EnableSsl = true;

                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();

                NetworkCred.UserName = "hr@enghous.com";

                NetworkCred.Password = "HR123456789";

                smtp.UseDefaultCredentials = true;

                smtp.Credentials = NetworkCred;

                smtp.Port = 25; //reading from web.config  

                smtp.Send(mailMessage);

            }
        }

        private void getmailsid()
        {
            // get mail for requestor 
            da = new SqlDataAdapter("select [Hr001].cEmpEmail from [Hr001] where [Hr001].cGrpCompany='" + Session["grpcmp"].ToString() + "' and [Hr001].cCompany='" + Session["comid1"].ToString() + "' and Hr001.cEmpAname='" + Session["reqfor1"].ToString() + "' or Hr001.cEmpId='" + Session["empid"].ToString().Trim() + "'  ", sqlcon);
            da.Fill(dt4);
            try
            {
                if (dt4.Rows.Count > 0 )
                {
                    requestormail = dt4.Rows[0]["cEmpEmail"].ToString().Trim();
                    // USING TERNIARY OPERATOR TO GET MAIL IF NULl
                        approvalmail = (dt4.Rows.Count > 1) ? dt4.Rows[1]["cEmpEmail"].ToString().Trim() : "khilel208@hotmail.com";

                    
                }
            }
            catch (SqlException ex)
            {
                Response.Write("<script>alert('CANT SEND MAIL ');</script>"+ex.Message);
            }
        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            // when in reject case 

           
           
            //update status to 1 for which user and grade level 
            sqlcon.Open();
            cmd = new SqlCommand("update [wfaut101] set [cApprovedDate]='" + DateTime.Now + "', [cRemark]='"
                + TextBoxrequestNoticeapproval.Text.Trim() + "',[cStatus]=1 ,[cFlag]='"+flag2+"' where [cGrpCompany]='" +
                Session["grpcmp"].ToString() + "' and [cCompany]='" + Session["comid1"].ToString().Trim() +
                "' and [cRequestId]='" + Session["reqid"].ToString().Trim() + "' and [cLevelId]='" +
                Session["level"].ToString().Trim() + "'  ", sqlcon);
            cmd.ExecuteNonQuery();
            sqlcon.Close();



            string wholevel = "LeaveRequest Rejected by Level : " + Session["level"].ToString().Trim();
            string body = this.createEmailBody("", wholevel, Session["reqid"].ToString());

            this.SendHtmlFormattedEmail("LeaveRequest Rejected", body);
            // delete who coming in next level because rejected in this level
            sqlcon.Open();
            cmd3= new SqlCommand(" delete from [wfaut101] where [cGrpCompany]='" +
                Session["grpcmp"].ToString() + "' and [cCompany]='" + Session["comid1"].ToString().Trim() +
                "' and [cRequestId]='" + Session["reqid"].ToString().Trim() + "' and [cLevelId]>'" +
                Session["level"].ToString().Trim() + "' ; delete from [Hr11Leave01] where [cGrpCompany]='" +
                Session["grpcmp"].ToString() + "' and [cCompany]='" + Session["comid1"].ToString().Trim() +
                "' and [cRequestId]='" + Session["reqid"].ToString().Trim() + "'  ", sqlcon);

            cmd3.ExecuteNonQuery();
            sqlcon.Close();
             HIGG = "../../WorkFlow/PL/Approve.aspx";
            Response.Redirect(HIGG);
        }
    }
}