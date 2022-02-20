using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.Hr.PL
{
    public partial class Employee : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        DataTable dt6 = new DataTable();
        DataTable dt7 = new DataTable();
        DataTable dt8 = new DataTable();
        DataTable dt9 = new DataTable();
        DataTable dt10 = new DataTable();
        DataTable dt11 = new DataTable();
        Pos.BL.cProduct p = new BL.cProduct();
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlDataAdapter adapter3 = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        ReportDocument rprt = new ReportDocument();
        //
       
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
                    Session["labour"] = dt.Rows[0][6].ToString();
                    ddlcompch.DataSource = dt;
                    ddlcompch.DataTextField = "cCompName";
                    ddlcompch.DataValueField = "cCompany";
                    ddlcompch.DataBind();
                    //
                    ddlcompch0.DataSource = dt;
                    ddlcompch0.DataTextField = "cCompName";
                    ddlcompch0.DataValueField = "cCompany";
                    ddlcompch0.DataBind();
                    //
                    DropDownList4.DataSource = dt;
                    DropDownList4.DataTextField = "cCompName";
                    DropDownList4.DataValueField = "cCompany";
                    DropDownList4.DataBind();
                    //
                    DropDownList15.DataSource = dt;
                    DropDownList15.DataTextField = "cCompName";
                    DropDownList15.DataValueField = "cCompany";
                    DropDownList15.DataBind();
                    //
                    DropDownList22.DataSource = dt;
                    DropDownList22.DataTextField = "cCompName";
                    DropDownList22.DataValueField = "cCompany";
                    DropDownList22.DataBind();
                    //
                    //
                    DropDownList25.DataSource = dt;
                    DropDownList25.DataTextField = "cCompName";
                    DropDownList25.DataValueField = "cCompany";
                    DropDownList25.DataBind();
                    //
                    DropDownList35.DataSource = dt;
                    DropDownList35.DataTextField = "cCompName";
                    DropDownList35.DataValueField = "cCompany";
                    DropDownList35.DataBind();
                   
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
                    Label10.Text = "";
                    Label9.Text = "";
                    ////


                }
                
                  this.TextBoxDATE.Text = System.DateTime.Now.AddYears(-20).ToShortDateString();
                  this.TextBoxDATE0.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                  this.TextBox4.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                  this.TextBox13.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                  this.TextBox19.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                  this.TextBox23.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                  this.TextBox29.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                  this.TextBox30.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                  this.TextBox31.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                 // this.TextBox5555.Text = System.DateTime.Now.AddYears(0).ToShortDateString();
                  this.pnlCalendar.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.pnlCalendar0.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel1.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel2.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel3.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel4.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel6.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel7.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel8.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel9.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel10.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel11.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel12.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel13.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel14.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                  this.Panel15.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");

            }


          

        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            this.Panel3.Attributes.Add("style", " POSITION: absolute");

        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            this.Panel4.Attributes.Add("style", " POSITION: absolute");

        }
        protected void Button10_Click(object sender, EventArgs e)
        {
            this.Panel6.Attributes.Add("style", " POSITION: absolute");

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;

        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
           Session["cmp2"] = ddlcompch.SelectedValue;

        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            //
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr001]([cGrpCompany] ,[cCompany],[cEmpType],[cEmpId],[cEmpAname],[cEmpEname],[cEmpBirthdate],[cEmpAge],[cEmpGender],[cEmpNationality],[cEmpSociety],[cEmpDependent],[cEmpHomeCountry],[cEmpCurrentCountry],[cEmpPhone],[cEmpEmail],[cEmpVisa],[cEmpLisence],[cEmpCar] ,[cEmpUserLogin]) VALUES('" + Session["grpcmp"].ToString() + "','" + Session["cmp2"].ToString() + "','" + DropDownList3.SelectedItem.Text.Trim() + "','" + TextBoxId.Text.Trim() + "','" + TextBoxName.Text + "','" + TextBoxenglishName.Text + "','" + TextBoxDATE.Text + "','" + TextBoxage.Text + "','" + DropDownList1.SelectedItem.Text + "','" + TextBoxphonenationality.Text + "','" + DropDownList2.SelectedItem.Text + "','" + TextBoxdebendent.Text + "','" + TextBoxhome.Text + "','" + TextBoxcurrent.Text + "' ,'" + TextBoxphone.Text + "','" + TextBoxphoneemai.Text + "','" + TextBoxphonevisa.Text + "','" + TextBoxphoneemai0.Text + "','" + TextBoxphonecar.Text + "','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                Label9.Text = "added /تمت الاضافة ";
            }
            catch (SqlException ex)
            {
                Label10.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
                DropDownList3.SelectedIndex = 0;
                TextBoxId.Text="";
               TextBoxName.Text ="";
               TextBoxenglishName.Text = "";
               // TextBoxDATE.Text ="";
                TextBoxage.Text ="";
                 DropDownList1.SelectedIndex=0;
                TextBoxphonenationality.Text ="";
                 DropDownList2.SelectedIndex=0;
                 TextBoxdebendent.Text ="";
                TextBoxhome.Text ="";
                TextBoxcurrent.Text ="";
                 TextBoxphone.Text="";
               TextBoxphoneemai.Text ="";
              TextBoxphonevisa.Text ="";
              TextBoxphoneemai0.Text ="";
              TextBoxphonecar.Text="";

            }
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            this.pnlCalendar.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBoxDATE.Text = Calendar1.SelectedDate.ToShortDateString();
            this.pnlCalendar.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }

       
        protected void getmaxid()
        {
            int maxvoucheriseq=0;
            sqlcon.Open();
            SqlCommand cmd3 = new SqlCommand("select MAX(cEmpId+1) as maxID from [Hr001] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + Session["cmp2"].ToString() + "' and cEmpType='" + DropDownList3.SelectedItem.Text.Trim() + "' ", sqlcon);
            //  cmd2.ExecuteNonQuery();
            var objResult = cmd3.ExecuteScalar();
            // if (objResult != DBNull.Value && objResult != null )
            if (cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "مؤظف مؤقت /Temporary Employee")
            {
                maxvoucheriseq = 500000;

            }
            if (cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "مؤظف دائم  /Permanent Employee")
            {
                maxvoucheriseq = 100000;

            }
            if (cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "دوام جزئي/Part Time")
            {
                maxvoucheriseq = 900000;

            }
            if (cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "عن بعد/Remotely")
            {
                maxvoucheriseq = 9900000;

            }
            if (cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "موسمي/Seasonal")
            {
                maxvoucheriseq = 99900000;

            }
            if (cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "مقاول باطن/Subcontractor")
            {
                maxvoucheriseq = 999900000;

            }
            else if (!cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "مؤظف مؤقت /Temporary Employee")
            {
                maxvoucheriseq = Convert.ToInt32(cmd3.ExecuteScalar());

            }
            else if (!cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "مؤظف دائم  /Permanent Employee")
            {
                maxvoucheriseq = Convert.ToInt32(cmd3.ExecuteScalar());

            }
            else if (!cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "دوام جزئي/Part Time")
            {
                maxvoucheriseq = Convert.ToInt32(cmd3.ExecuteScalar());

            }
            else if (!cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "عن بعد/Remotely")
            {
                maxvoucheriseq = Convert.ToInt32(cmd3.ExecuteScalar());

            }
            else if (!cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "موسمي/Seasonal")
            {
                maxvoucheriseq = Convert.ToInt32(cmd3.ExecuteScalar());

            }
            else if (!cmd3.ExecuteScalar().Equals(DBNull.Value) && DropDownList3.SelectedItem.Text == "مقاول باطن/Subcontractor")
            {
                maxvoucheriseq = Convert.ToInt32(cmd3.ExecuteScalar());

            }
           
           
            Session["maxvoucheriseq"] = Convert.ToString(maxvoucheriseq);
            sqlcon.Close();
            TextBoxId.Text = Session["maxvoucheriseq"].ToString();

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList33_SelectedIndexChanged(object sender, EventArgs e)
        {
            getmaxid();
            Label9.Text = "";
        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            this.Panel1.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
            da = new SqlDataAdapter("select * from [Hr00Departments] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cManagementID='"+DropDownList7.SelectedValue+"'", sqlcon);
            da.Fill(dt2);
            DropDownList8.DataSource = dt2;
            DropDownList8.DataTextField = "cDepName";
            DropDownList8.DataValueField = "cDepid";
            DropDownList8.DataBind();

        }

        protected void ddlcompch0_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.TextBoxIdcompany.Text = Session["labour"].ToString();
            //
            da = new SqlDataAdapter("select * from [Hr00Management] where cGropCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch0.SelectedValue + "' ", sqlcon);
            da.Fill(dt2);
            DropDownList7.DataSource = dt2;
            DropDownList7.DataTextField = "cManagementName";
            DropDownList7.DataValueField = "cMangementId";
            DropDownList7.DataBind();
            //
            da2 = new SqlDataAdapter("select * from [Hr001] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch0.SelectedValue + "' ", sqlcon);
            da2.Fill(dt3);
            //
            DropDownList9.DataSource = dt3;
            DropDownList9.DataTextField = "cEmpAname";
            DropDownList9.DataValueField = "cEmpId";
            DropDownList9.DataBind();
            //
            DropDownList10.DataSource = dt3;
            DropDownList10.DataTextField = "cEmpAname";
            DropDownList10.DataValueField = "cEmpId";
            DropDownList10.DataBind();
            //
            DropDownList11.DataSource = dt3;
            DropDownList11.DataTextField = "cEmpAname";
            DropDownList11.DataValueField = "cEmpId";
            DropDownList11.DataBind();
            //
            DropDownList13.DataSource = dt3;
            DropDownList13.DataTextField = "cEmpAname";
            DropDownList13.DataValueField = "cEmpId";
            DropDownList13.DataBind();
        }

        protected void Button20_Click(object sender, EventArgs e)
        {
            this.Panel8.Attributes.Add("style",
                     " POSITION: absolute");
        }
        protected void Calendar7_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox13.Text = Calendar7.SelectedDate.ToShortDateString();
            this.Panel8.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }
        protected void Button13_Click(object sender, EventArgs e)
        {
            this.pnlCalendar0.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBoxDATE0.Text = Calendar2.SelectedDate.ToShortDateString();
            this.pnlCalendar0.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");
        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox4.Text = Calendar3.SelectedDate.ToShortDateString();
            this.Panel1.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");

        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            //
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00jobdata]([cGrpCompany] ,[cCompany],[cEmpId],[cLabourId],[cTitleJobInIqama],[cTitleCurrentJob],[cTitleExtraJob],[cManagementName],[cDepartmentName],[cDirectMnager],[cHeadOfDepartment],[cManagerDirector],[cContractType],[cStartingContract],[cContractDuration],[cDirectAcion],[cHouseCompany],[cCompanyDetails] ,[cInshuranceType],[cInsuranceID],[cExprience1],[cExprience2],[cUser]) VALUES('" + Session["grpcmp"].ToString() + "','" + ddlcompch0.SelectedValue + "','" + DropDownList13.SelectedValue + "','" + TextBoxIdcompany.Text + "','" + TextBoxjobtitleiniqama.Text + "','" + TextBoxjobactual.Text + "','" + TextBoxextracareer.Text + "','" + DropDownList7.SelectedItem.Text + "','" + DropDownList8.SelectedItem.Text + "','" + DropDownList9.SelectedValue + "','" + DropDownList10.SelectedValue + "','" + DropDownList11.SelectedValue + "','" + DropDownList12.SelectedItem.Text + "','" + TextBoxDATE0.Text + "' ,'" + TextBoxdurationcontract.Text + "','" + TextBox4.Text + "','" + TextBoxhousecompany.Text + "','" + TextBoxhousedetails.Text + "','" + DropDownList6.SelectedItem.Text + "','"+TextBoxinsuranceid.Text+"','"+TextBoxEXPRIENCE.Text+"','"+TextBoxEXPRIENCE2.Text+"','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
                Label81.Text = "added /تمت الاضافة ";
            }
            catch (SqlException ex)
            {
                Label82.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
                TextBoxEXPRIENCE2.Text = "";
                TextBoxEXPRIENCE.Text = "";
                TextBoxinsuranceid.Text = "";
                TextBoxhousedetails.Text = "";
                TextBoxhousecompany.Text = "";
                TextBoxdurationcontract.Text = "";
                TextBox5.Text = "";
                TextBox2.Text = "";
                TextBox1.Text = "";
                TextBoxextracareer.Text = "";
                TextBoxjobtitleiniqama.Text = "";
                TextBoxjobactual.Text = "";
                TextBox6.Text = "";

            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //
            MultiView1.ActiveViewIndex = 7;
           // BindGridviewData();

        }

        private void BindGridviewData()
        {
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("select * from [Hr00Attachement]", sqlcon);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            sqlcon.Close();
            gvDetails.DataSource = ds;
            gvDetails.DataBind();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fileUpload1.PostedFile.FileName);
            fileUpload1.SaveAs(Server.MapPath("Files/" + filename));
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("insert into [Hr00Attachement](cGrpCompany,cCompany,cEmpId,cName,cPath,cFlag) values(@cGrpCompany,@cCompany,@cEmpId,@cName,@cPath,@cFlag)", sqlcon);
            cmd.Parameters.AddWithValue("@cGrpCompany", Session["grpcmp"].ToString());
            cmd.Parameters.AddWithValue("@cCompany", DropDownList4.SelectedValue);
            cmd.Parameters.AddWithValue("@cEmpId", DropDownList5.SelectedValue);
            cmd.Parameters.AddWithValue("@cName", filename);
            cmd.Parameters.AddWithValue("@cPath", "Files/" + filename);
            cmd.Parameters.AddWithValue("@cFlag", "EmpImage");
            cmd.ExecuteNonQuery();
            sqlcon.Close();
          //  BindGridviewData();

        }
        protected void dd()
        {
            da = new SqlDataAdapter("select * from [Hr00Attachement] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList4.SelectedValue + "' and cEmpId='" + DropDownList5.SelectedValue + "' and cFlag='"+DropDownList14.SelectedValue+"' ", sqlcon);
            da.Fill(dt8);
            gvDetails.DataSource = dt8;

            gvDetails.DataBind();
        }
        // This button click event is used to download files from gridview
        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            string filePath = gvDetails.DataKeys[gvrow.RowIndex].Value.ToString();
            string ext = Path.GetExtension(filePath);
            string type = "";

            // set known types based on file extension
            if (ext != null)
            {
                switch (ext.ToLower())
                {
                    case ".htm":
                    case ".html":
                        type = "text/HTML";
                        break;

                    case ".txt":
                        type = "text/plain";
                        break;

                    case ".GIF":
                        type = "image/GIF";
                        break;

                    case ".pdf":
                        type = "Application/pdf";
                        break;

                    case ".doc":
                    case ".rtf":
                        type = "Application/msword";
                        break;
                }
            }
            if (type != "")
                Response.ContentType = type;
           // Response.ContentType = "image/jpg";
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
            Response.TransmitFile(Server.MapPath(filePath));
            Response.End();
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
            da2 = new SqlDataAdapter("select * from [Hr001] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList4.SelectedValue + "' ", sqlcon);
            da2.Fill(dt7);
            //
            DropDownList5.DataSource = dt7;
            DropDownList5.DataTextField = "cEmpAname";
            DropDownList5.DataValueField = "cEmpId";
            DropDownList5.DataBind();
        }

        protected void btnUploadpassport_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fileUpload2.PostedFile.FileName);
            fileUpload2.SaveAs(Server.MapPath("Files/" + filename));
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("insert into [Hr00Attachement](cGrpCompany,cCompany,cEmpId,cName,cPath,cFlag) values(@cGrpCompany,@cCompany,@cEmpId,@cName,@cPath,@cFlag)", sqlcon);
            cmd.Parameters.AddWithValue("@cGrpCompany", Session["grpcmp"].ToString());
            cmd.Parameters.AddWithValue("@cCompany", DropDownList4.SelectedValue);
            cmd.Parameters.AddWithValue("@cEmpId", DropDownList5.SelectedValue);
            cmd.Parameters.AddWithValue("@cName", filename);
            cmd.Parameters.AddWithValue("@cPath", "Files/" + filename);
            cmd.Parameters.AddWithValue("@cFlag", "EmpPassportImage");
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            //BindGridviewData();
        }

        protected void btnUploadidentity_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fileUpload3.PostedFile.FileName);
            fileUpload3.SaveAs(Server.MapPath("Files/" + filename));
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("insert into [Hr00Attachement](cGrpCompany,cCompany,cEmpId,cName,cPath,cFlag) values(@cGrpCompany,@cCompany,@cEmpId,@cName,@cPath,@cFlag)", sqlcon);
            cmd.Parameters.AddWithValue("@cGrpCompany", Session["grpcmp"].ToString());
            cmd.Parameters.AddWithValue("@cCompany", DropDownList4.SelectedValue);
            cmd.Parameters.AddWithValue("@cEmpId", DropDownList5.SelectedValue);
            cmd.Parameters.AddWithValue("@cName", filename);
            cmd.Parameters.AddWithValue("@cPath", "Files/" + filename);
            cmd.Parameters.AddWithValue("@cFlag", "EmpIdentityImage");
            cmd.ExecuteNonQuery();
            sqlcon.Close();
           // BindGridviewData();
        }

        protected void btnUploadcontract_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fileUpload4.PostedFile.FileName);
            fileUpload4.SaveAs(Server.MapPath("Files/" + filename));
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("insert into [Hr00Attachement](cGrpCompany,cCompany,cEmpId,cName,cPath,cFlag) values(@cGrpCompany,@cCompany,@cEmpId,@cName,@cPath,@cFlag)", sqlcon);
            cmd.Parameters.AddWithValue("@cGrpCompany", Session["grpcmp"].ToString());
            cmd.Parameters.AddWithValue("@cCompany", DropDownList4.SelectedValue);
            cmd.Parameters.AddWithValue("@cEmpId", DropDownList5.SelectedValue);
            cmd.Parameters.AddWithValue("@cName", filename);
            cmd.Parameters.AddWithValue("@cPath", "Files/" + filename);
            cmd.Parameters.AddWithValue("@cFlag", "EmpContractImage");
            cmd.ExecuteNonQuery();
            sqlcon.Close();
           // BindGridviewData();
        }

        protected void btnUploadcv_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fileUpload5.PostedFile.FileName);
            fileUpload5.SaveAs(Server.MapPath("Files/" + filename));
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("insert into [Hr00Attachement](cGrpCompany,cCompany,cEmpId,cName,cPath,cFlag) values(@cGrpCompany,@cCompany,@cEmpId,@cName,@cPath,@cFlag)", sqlcon);
            cmd.Parameters.AddWithValue("@cGrpCompany", Session["grpcmp"].ToString());
            cmd.Parameters.AddWithValue("@cCompany", DropDownList4.SelectedValue);
            cmd.Parameters.AddWithValue("@cEmpId", DropDownList5.SelectedValue);
            cmd.Parameters.AddWithValue("@cName", filename);
            cmd.Parameters.AddWithValue("@cPath", "Files/" + filename);
            cmd.Parameters.AddWithValue("@cFlag", "EmpCvImage");
            cmd.ExecuteNonQuery();
            sqlcon.Close();
           // BindGridviewData();

        }

        protected void btnUploadother_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fileUpload6.PostedFile.FileName);
            fileUpload6.SaveAs(Server.MapPath("Files/" + filename));
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("insert into [Hr00Attachement](cGrpCompany,cCompany,cEmpId,cName,cPath,cFlag) values(@cGrpCompany,@cCompany,@cEmpId,@cName,@cPath,@cFlag)", sqlcon);
            cmd.Parameters.AddWithValue("@cGrpCompany", Session["grpcmp"].ToString());
            cmd.Parameters.AddWithValue("@cCompany", DropDownList4.SelectedValue);
            cmd.Parameters.AddWithValue("@cEmpId", DropDownList5.SelectedValue);
            cmd.Parameters.AddWithValue("@cName", filename);
            cmd.Parameters.AddWithValue("@cPath", "Files/" + filename);
            cmd.Parameters.AddWithValue("@cFlag", "EmpOtherImage");
            cmd.ExecuteNonQuery();
            sqlcon.Close();
          //  BindGridviewData();
        }

        protected void DropDownList14_SelectedIndexChanged(object sender, EventArgs e)
        {
            dd();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;

        }

        protected void DropDownList15_SelectedIndexChanged(object sender, EventArgs e)
        {
            da2 = new SqlDataAdapter("select * from [Hr001] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList15.SelectedValue + "' ", sqlcon);
            da2.Fill(dt9);
            //
            DropDownList16.DataSource = dt9;
            DropDownList16.DataTextField = "cEmpAname";
            DropDownList16.DataValueField = "cEmpId";
            DropDownList16.DataBind();
            //
            da = new SqlDataAdapter(" select * from [FinBAccounts] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList15.SelectedValue + "' and iAcctUGrpLevel=4 ", sqlcon);
            da.Fill(dt10);
            DropDownList17.DataSource = dt10;
            DropDownList17.DataTextField = "cAccountName";
            DropDownList17.DataValueField = "cAccountName";
            DropDownList17.DataBind();
            //
            DropDownList18.DataSource = dt10;
            DropDownList18.DataTextField = "cAccountName";
            DropDownList18.DataValueField = "cAccountName";
            DropDownList18.DataBind();
            //
            adapter3 = new SqlDataAdapter("select * from [Hr00Benfits] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList15.SelectedValue + "' ", sqlcon);
            adapter3.Fill(dt1);
            DropDownList20.DataSource = dt1;
            DropDownList20.DataTextField = "cBenName";
            DropDownList20.DataValueField = "cBenName";
            DropDownList20.DataBind();
            ///
            //DropDownList34.DataSource = dt1;
            //DropDownList34.DataTextField = "cBenName";
            //DropDownList34.DataValueField = "cBenName";
            //DropDownList34.DataBind();
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            try
            {
                Label124.Text = "";
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00Benfits] (cGrpCompany,cCompany,cBenName,cBenGrpAccount,cBenAccount,cBenType) values('" + Session["grpcmp"].ToString() + "','" + DropDownList15.SelectedValue + "','" + TextBoxbenfit.Text.Trim() + "','" + DropDownList17.SelectedItem.Text.Trim() + "','" + DropDownList18.SelectedItem.Text.Trim() + "','" + DropDownList19.SelectedItem.Text.Trim() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label124.Text = "Added";

            }
            catch (Exception ex)
            {
                Label124.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
            }
        }

        protected void Button17_Click(object sender, EventArgs e)
        {
            try
            {
                Label123.Text = "";
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00EmpBenfits] (cGrpCompany,cCompany,cEmpId,cEmpBenfit,cEmpAmountForBenfit,cEmpPeriod,cUser) values('" + Session["grpcmp"].ToString() + "','" + DropDownList15.SelectedValue + "','" + DropDownList16.SelectedItem.Text.Trim() + "','" + DropDownList20.SelectedItem.Text.Trim() + "','" + Convert.ToDecimal(TextBoxamount.Text.Trim()) + "','" + DropDownList21.SelectedItem.Text.Trim() + "','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label123.Text = "Added";

            }
            catch (Exception ex)
            {
                Label123.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
            }
        }

        protected void DropDownList22_SelectedIndexChanged(object sender, EventArgs e)
        {
            da2 = new SqlDataAdapter("select * from [Hr001] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList22.SelectedValue + "' ", sqlcon);
            da2.Fill(dt9);
            //
            DropDownList23.DataSource = dt9;
            DropDownList23.DataTextField = "cEmpAname";
            DropDownList23.DataValueField = "cEmpId";
            DropDownList23.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button18_Click(object sender, EventArgs e)
        {
            try
            {
                Label138.Text = "";
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00Education] (cGrpCompany,cCompany,cEmpId,cEducationLevel,cEducationCertificate,cEducationissueplace,cEducationOther,cUser) values('" + Session["grpcmp"].ToString() + "','" + DropDownList22.SelectedValue + "','" + DropDownList23.SelectedItem.Text.Trim() + "','" + DropDownList24.SelectedItem.Text.Trim() + "','" + TextBoxcERTIFCATE.Text.Trim() + "','" +TextBoxcERTIFCATEISSUE.Text.Trim() + "','" + TextBoxcadd.Text.Trim() + "','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label138.Text = "Added";

            }
            catch (Exception ex)
            {
                Label138.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
            }
        }

        protected void DropDownList23_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label138.Text = "";
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
        }

        protected void DropDownList25_SelectedIndexChanged(object sender, EventArgs e)
        {
            da2 = new SqlDataAdapter("select * from [Hr001] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList25.SelectedValue + "' ", sqlcon);
            da2.Fill(dt9);
            //
            DropDownList26.DataSource = dt9;
            DropDownList26.DataTextField = "cEmpAname";
            DropDownList26.DataValueField = "cEmpId";
            DropDownList26.DataBind();

        }

        protected void DropDownList27_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label145.Text = "";
            if (DropDownList27.SelectedItem.Text.Trim() == "أقامة")
            {
                this.Panel2.Attributes.Add("style"," POSITION: absolute");
                this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel7.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel9.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel11.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                txtissuedate.Text = DateTime.Now.ToShortDateString();
                TextBox10.Text = DateTime.Now.ToShortDateString();
            }
            else if (DropDownList27.SelectedItem.Text.Trim() == "هوية وطنية")
            {
                this.Panel2.Attributes.Add("style", " POSITION: absolute");
                this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel7.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel9.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel11.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                txtissuedate.Text = DateTime.Now.ToShortDateString();
                TextBox10.Text = DateTime.Now.ToShortDateString();
            }
            else if (DropDownList27.SelectedItem.Text.Trim() == "رقم الحدود")
            {
                this.Panel2.Attributes.Add("style", " POSITION: absolute");
                this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel7.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel9.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel11.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                txtissuedate.Text = DateTime.Now.ToShortDateString();
                TextBox10.Text = DateTime.Now.ToShortDateString();
            }
            else if (DropDownList27.SelectedItem.Text.Trim() == "جواز السفر")
            {
                this.Panel2.Attributes.Add("style", " POSITION: absolute");
                this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel7.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel9.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel11.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                txtissuedate.Text = DateTime.Now.ToShortDateString();
                TextBox10.Text = DateTime.Now.ToShortDateString();
            }
            else if (DropDownList27.SelectedItem.Text.Trim() == "رخصة القيادة")
            {
                this.Panel2.Attributes.Add("style", " POSITION: absolute");
                this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel7.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel9.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel11.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                txtissuedate.Text = DateTime.Now.ToShortDateString();
                TextBox10.Text = DateTime.Now.ToShortDateString();
            }
            else if (DropDownList27.SelectedItem.Text.Trim() == "التائمينات الأجتماعية")
            {
                this.Panel5.Attributes.Add("style", " POSITION: absolute");
                this.Panel2.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel7.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel9.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel11.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                TextBox11.Text = DateTime.Now.ToShortDateString();
            }
            else if (DropDownList27.SelectedItem.Text.Trim() == "مكتب العمل")
            {
                this.Panel7.Attributes.Add("style", " POSITION: absolute");
                this.Panel9.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel2.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel11.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                TextBox11.Text = DateTime.Now.ToShortDateString();
            }
             else if (DropDownList27.SelectedItem.Text.Trim() == "التائمين الصحي")
            {
                this.Panel9.Attributes.Add("style", " POSITION: absolute");
                this.Panel7.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");

                this.Panel2.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel11.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                TextBox13.Text = DateTime.Now.ToShortDateString();
            }
            else if (DropDownList27.SelectedItem.Text.Trim() == "اشتراكات الهئية")
            {
                this.Panel11.Attributes.Add("style", " POSITION: absolute");
                this.Panel9.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel7.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel2.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                this.Panel5.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
                TextBox23.Text = DateTime.Now.ToShortDateString();
            }

        }

        protected void Calendar4_SelectionChanged(object sender, EventArgs e)
        {
            this.Panel3.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            txtissuedate.Text = Calendar4.SelectedDate.ToShortDateString();
            

        }

        protected void Calendar5_SelectionChanged(object sender, EventArgs e)
        {
            this.Panel4.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            TextBox10.Text = Calendar5.SelectedDate.ToShortDateString();
        }

        protected void Button19_Click(object sender, EventArgs e)
        {
            try
            {
                Label145.Text = "";
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00Attachements1] (cGrpCompany,cCompany,cEmpId,cDocumentryType,cDocumentryIssue,cDocumentryExpire,cDocumentryId,cUser) values('" + Session["grpcmp"].ToString() + "','" + DropDownList25.SelectedValue + "','" + DropDownList26.SelectedValue + "','" + DropDownList27.SelectedItem.Text.Trim() + "','" + txtissuedate.Text.Trim() + "','" + TextBox10.Text.Trim() + "','" + txtidentityid.Text.Trim() + "','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label145.Text = "Added";

            }
            catch (Exception ex)
            {
                Label145.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
            }
        }

        protected void DropDownList28_SelectedIndexChanged(object sender, EventArgs e)
        {
            double foreignemp = 0.0;
            double mahashemp = 0.0;
            double sandemp = 0.0;
            double dangercompany = 0.0;
            double sandcompany = 0.0;
            double mahashcompany = 0.0;
            if (DropDownList28.SelectedItem.Text.Trim()== "مقيم")
            {
                foreignemp = (Convert.ToDouble(TextBox12.Text.Trim()) + Convert.ToDouble(TextBox14.Text.Trim())) * .02;
                Label11.Text = "المبلغ المستحق للتائمينات الاجتماعية وتدفعها الشركة للموظف :"+foreignemp;
             //   Label12.Text = "تنوية : 2% بدل اخطار من اجمالي الراتب الاساسي وبدل السكن وتدفعها الشركة ";
                Session["foreignemp"] = foreignemp.ToString();
                Label13.Text = "";
                Label14.Text = "";
                
                         
            }

            else if (DropDownList28.SelectedItem.Text.Trim() == "مواطن")
            {
                mahashemp = (Convert.ToDouble(TextBox12.Text.Trim()) + Convert.ToDouble(TextBox14.Text.Trim())) * .09;
                sandemp = (Convert.ToDouble(TextBox12.Text.Trim()) + Convert.ToDouble(TextBox14.Text.Trim())) * .01;
                dangercompany = (Convert.ToDouble(TextBox12.Text.Trim()) + Convert.ToDouble(TextBox14.Text.Trim())) * .02;
                sandcompany = (Convert.ToDouble(TextBox12.Text.Trim()) + Convert.ToDouble(TextBox14.Text.Trim())) * .01;
                mahashcompany = (Convert.ToDouble(TextBox12.Text.Trim()) + Convert.ToDouble(TextBox14.Text.Trim())) * .09;
                Session["mahashemp"] = mahashemp.ToString();
                Session["sandemp"] = sandemp.ToString();
                Session["dangercompany"] = dangercompany.ToString();
                Session["sandcompany"] = sandcompany.ToString();
                Session["mahashcompany"] = mahashcompany.ToString();
              //  Label11.Text = "<br/>معاشات 9%  <br/>" + mahashemp + "ساند 1%  <br/>" + sandemp;
               
                //Label2.Text = "<br/>اخطار 2%  <br/>" + dangercompany + "<br/>ساند 1%  <br/>" + sandcompany + "معاشات 9% <br/> " + mahashcompany;
                Label11.Text = "";
                Label13.Text = "اجمالي مايدفعه الموظف للتائمينات الاجتماعية<br/> " + Convert.ToString(mahashemp + sandemp);
                Label14.Text = "<br/>اجمالي ماتدفعة الشركة للتائمينات عن الموظف " + Convert.ToString(dangercompany + sandcompany + mahashcompany);
                
            }
   

            


        }

        protected void Calendar6_SelectionChanged(object sender, EventArgs e)
        {

            this.Panel6.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            TextBox11.Text = Calendar6.SelectedDate.ToShortDateString();
        }

        protected void Button21_Click(object sender, EventArgs e)
        {

            if (DropDownList28.SelectedItem.Text.Trim() == "مقيم")
            {

                try
                {
                    Label145.Text = "";
                    sqlcon.Open();
                    cmd = new SqlCommand("insert into [Hr00SocialInsurance] (cGrpCompany,cCompany,cEmpId,cDocType,cforeignemp,cmahashemp,csandemp,cdangercompany,csandcompany,cmahashcompany,cbasic,cHouse,cUser,cJoinDate,cType) values('" + Session["grpcmp"].ToString() + "','" + DropDownList25.SelectedValue + "','" + DropDownList26.SelectedValue + "','" + DropDownList27.SelectedItem.Text.Trim() + "','" + Session["foreignemp"].ToString() + "','" + 0.0 + "','" + 0.0 + "','" + 0.0 + "','" + 0.0 + "','" + 0.0 + "','" + TextBox12.Text.Trim() + "','" + TextBox14.Text.Trim() + "','" + Session["username"].ToString() + "','" + TextBox11.Text.Trim() + "','" + DropDownList28.SelectedItem.Text.Trim() + "')", sqlcon);
                    cmd.ExecuteNonQuery();
                    Label145.Text = "Added";

                }
                catch (Exception ex)
                {
                    Label145.Text = ex.Message;
                }
                finally
                {
                    sqlcon.Close();
                    Session["foreignemp"] = 0.0;
                    DropDownList28.SelectedIndex = 0;
                    DropDownList28.DataBind();
                   
                }
            }
            else if (DropDownList28.SelectedItem.Text.Trim() == "مواطن")
            {

                try
                {
                    Label145.Text = "";
                    sqlcon.Open();
                    cmd = new SqlCommand("insert into [Hr00SocialInsurance] (cGrpCompany,cCompany,cEmpId,cDocType,cforeignemp,cmahashemp,csandemp,cdangercompany,csandcompany,cmahashcompany,cbasic,cHouse,cUser,cJoinDate,cType) values('" + Session["grpcmp"].ToString() + "','" + DropDownList25.SelectedValue + "','" + DropDownList26.SelectedValue + "','" + DropDownList27.SelectedItem.Text.Trim() + "','" + 0.0 + "','" + Session["mahashemp"].ToString() + "','" + Session["sandemp"].ToString() + "','" + Session["dangercompany"].ToString() + "','" + Session["sandcompany"].ToString() + "','" + Session["mahashcompany"].ToString() + "','" + TextBox12.Text.Trim() + "','" + TextBox14.Text.Trim() + "','" + Session["username"].ToString() + "','" + TextBox11.Text.Trim() + "','" + DropDownList28.SelectedItem.Text.Trim() + "')", sqlcon);
                    cmd.ExecuteNonQuery();
                    Label145.Text = "Added";

                }
                catch (Exception ex)
                {
                    Label145.Text = ex.Message;
                }
                finally
                {
                    sqlcon.Close();
                    Session["mahashemp"] = "0.0";
                    Session["sandemp"] = "0.0";
                    Session["dangercompany"] = "0.0";
                    Session["sandcompany"] = "0.0";
                    Session["mahashcompany"] = "0.0";
                    DropDownList28.SelectedIndex = 0;
                    DropDownList28.DataBind();
                }
            }
            else
            {
                Label145.Text = "PUT DATA AND CHOOSE FROM DROBDOWNLIST";
            }
            

        }

        protected void Button22_Click(object sender, EventArgs e)
        {
            try
                {
                    Label145.Text = "";
                    sqlcon.Open();
                    cmd = new SqlCommand("insert into [Hr00LabourEmps] (cGrpCompany,cCompany,cEmpId,cDocType,cLabourLisenceAmount,cJawzatLisenceAmount,cPenaltyAmount,cPeriod,cLabourEmpId,cUser) values('" + Session["grpcmp"].ToString() + "','" + DropDownList25.SelectedValue + "','" + DropDownList26.SelectedValue + "','" + DropDownList27.SelectedItem.Text.Trim() + "','" +TextBox15.Text.Trim() + "','" + TextBox16.Text.Trim() + "','" + TextBox18.Text.Trim() + "','" + DropDownList29.SelectedValue + "','" +TextBox17.Text.Trim() + "','" + Session["username"].ToString() + "')", sqlcon);
                    cmd.ExecuteNonQuery();
                    Label145.Text = "Added";

                }
                catch (Exception ex)
                {
                    Label145.Text = ex.Message;
                }
                finally
                {
                    sqlcon.Close();
                    
                    DropDownList29.SelectedIndex = 0;
                    DropDownList29.DataBind();
                }
            }

        protected void DropDownList29_SelectedIndexChanged(object sender, EventArgs e)
        {
            double amount=0.0;
            if (DropDownList29.SelectedItem.Text.Trim() == "عام")
            {
                amount = (Convert.ToDouble(TextBox15.Text.Trim()) + Convert.ToDouble(TextBox16.Text.Trim()) + Convert.ToDouble(TextBox18.Text.Trim()))*1;
                Label71.Text = "<br/>تكلفة الرسوم <br/>" + Convert.ToString(amount);

            }
            else if (DropDownList29.SelectedItem.Text.Trim() == "عامين")
            {
                amount = (Convert.ToDouble(TextBox15.Text.Trim()) + Convert.ToDouble(TextBox16.Text.Trim()) + Convert.ToDouble(TextBox18.Text.Trim())) * 2;
                Label71.Text ="<br/>تكلفة الرسوم <br/>"+ Convert.ToString(amount);

            }
        
        }

        protected void Button23_Click(object sender, EventArgs e)
        {
            this.Panel10.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void Calendar8_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox19.Text = Calendar8.SelectedDate.ToShortDateString();
            this.Panel10.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");

        }

        protected void Button24_Click(object sender, EventArgs e)
        {
            try
            {
                Label145.Text = "";
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00MedicalInsurance] (cGrpCompany,cCompany,cEmpId,cDocType,cMedicalNumber,cMedicalType,cAmount,cUser) values('" + Session["grpcmp"].ToString() + "','" + DropDownList25.SelectedValue + "','" + DropDownList26.SelectedValue + "','" + DropDownList27.SelectedItem.Text.Trim() + "','" + TextBox20.Text.Trim() + "','" + TextBox21.Text.Trim() + "','" +Convert.ToDouble( TextBox22.Text.Trim()) + "','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label145.Text = "Added";

            }
            catch (Exception ex)
            {
                Label145.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();

                //DropDownList29.SelectedIndex = 0;
                //DropDownList29.DataBind();
            }

        }

        protected void Button25_Click(object sender, EventArgs e)
        {
            this.Panel12.Attributes.Add("style",
                     " POSITION: absolute");
        }

        protected void Calendar9_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox23.Text = Calendar9.SelectedDate.ToShortDateString();
            this.Panel12.Attributes.Add("style",
                 "DISPLAY: none; POSITION: absolute");

        }

        protected void Button26_Click(object sender, EventArgs e)
        {
            try
            {
                Label145.Text = "";
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00Subscribe] (cGrpCompany,cCompany,cEmpId,cDocType,cSubscripeNumber,cSubscripeAmount,cSubscripeType,cUser) values('" + Session["grpcmp"].ToString() + "','" + DropDownList25.SelectedValue + "','" + DropDownList26.SelectedValue + "','" + DropDownList27.SelectedItem.Text.Trim() + "','" + TextBox24.Text.Trim() + "','" + Convert.ToDouble(TextBox26.Text.Trim()) + "','"+DropDownList30.SelectedItem.Text.Trim()+"','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label145.Text = "Added";

            }
            catch (Exception ex)
            {
                Label145.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();

                DropDownList30.SelectedIndex = 0;
                DropDownList30.DataBind();
            }
        }

        protected void DropDownList30_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList31_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList32_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList33_SelectedIndexChanged1(object sender, EventArgs e)
        {
            DataTable dt88 = new DataTable();
            adapter3 = new SqlDataAdapter("select * from [Hr00Benfits] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList15.SelectedValue + "' ", sqlcon);
            adapter3.Fill(dt88);
           
            ///
            DropDownList34.DataSource = dt88;
            DropDownList34.DataTextField = "cBenName";
            DropDownList34.DataValueField = "cBenName";
            DropDownList34.DataBind();
        }

        protected void DropDownList34_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button27_Click(object sender, EventArgs e)
        {
            try
            {
                Label167.Text = "";
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00PayrollGrade] (cGrpCompany,cCompany,cEmpId,cLevel,cClass,cGrade,cBenfit,cAmount,cUser) values('" + Session["grpcmp"].ToString() + "','" + DropDownList15.SelectedValue + "','" + DropDownList16.SelectedValue + "','" + DropDownList31.SelectedItem.Text.Trim() + "','" + DropDownList32.SelectedItem.Text.Trim() + "','" + DropDownList33.SelectedItem.Text.Trim() + "','" + DropDownList34.SelectedItem.Text.Trim() + "','" + Convert.ToDouble(TextBox27.Text.Trim()) + "','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label167.Text = "Added";

            }
            catch (Exception ex)
            {
                Label167.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();

                //DropDownList30.SelectedIndex = 0;
                //DropDownList30.DataBind();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 8;

        }

        protected void DropDownList35_SelectedIndexChanged(object sender, EventArgs e)
        {
            da2 = new SqlDataAdapter("select * from [Hr001] where  cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + DropDownList35.SelectedValue + "' ", sqlcon);
            da2.Fill(dt11);
            //
            DropDownList36.DataSource = dt11;
            DropDownList36.DataTextField = "cEmpAname";
            DropDownList36.DataValueField = "cEmpId";
            DropDownList36.DataBind();
            //
            DropDownList666.DataSource = dt11;
            DropDownList666.DataTextField = "cEmpAname";
            DropDownList666.DataValueField = "cEmpId";
            DropDownList666.DataBind();

        }

        protected void Button29_Click(object sender, EventArgs e)
        {
            this.Panel13.Attributes.Add("style", " POSITION: absolute");
        }
        protected void Calendar10_SelectionChanged(object sender, EventArgs e)
        {

            this.Panel13.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            TextBox29.Text = Calendar10.SelectedDate.ToShortDateString();
        }
        protected void Button30_Click(object sender, EventArgs e)
        {
            this.Panel14.Attributes.Add("style", " POSITION: absolute");
        }
        protected void Calendar11_SelectionChanged(object sender, EventArgs e)
        {

            this.Panel14.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            TextBox30.Text = Calendar11.SelectedDate.ToShortDateString();
        }
        //
        protected void Button31_Click(object sender, EventArgs e)
        {
            this.Panel15.Attributes.Add("style", " POSITION: absolute");
        }
        protected void Calendar12_SelectionChanged(object sender, EventArgs e)
        {

            this.Panel15.Attributes.Add("style", "DISPLAY: none; POSITION: absolute");
            TextBox31.Text = Calendar12.SelectedDate.ToShortDateString();
        }

        protected void Button28_Click(object sender, EventArgs e)
        {
            try
            {
                Label182.Text = "";
                sqlcon.Open();
                cmd = new SqlCommand("insert into [Hr00LeaveSchedule] (cGrpCompany,cCompany,cEmpId,cBalance,cContractStart,cContractEnd,cLeaveDue,cPeriod,cLastBack,cTempEmp,cUser) values('" + Session["grpcmp"].ToString() + "','" + DropDownList35.SelectedValue + "','" + DropDownList36.SelectedValue + "','" + TextBox28.Text.Trim() + "','" + TextBox29.Text.Trim() + "','" + TextBox30.Text.Trim() + "','" + TextBox31.Text.Trim() + "','" + DropDownList37.SelectedValue + "','"+TextBox5555.Text.Trim()+"','" + DropDownList666.SelectedItem.Text.Trim() + "','" + Session["username"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                Label182.Text = "Added";

            }
            catch (Exception ex)
            {
                Label182.Text = ex.Message;
            }
            finally
            {////
                sqlcon.Close();

                //DropDownList30.SelectedIndex = 0;
                //DropDownList30.DataBind();
            }

        }

        protected void DropDownList36_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label182.Text = "";
        }
        }
    }
