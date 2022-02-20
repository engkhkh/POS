using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.Hr.PL
{
    public partial class UploadAttendence : System.Web.UI.Page
    {

        Pos.BL.cProduct p = new BL.cProduct();
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        DataTable dt6 = new DataTable();

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


                dt6 = p.fnreadcompany();
                if (dt6.Rows.Count > 0)
                {
                    // Session["cmp"] = dt.Rows[0][0].ToString();
                    Session["grpcmp"] = dt6.Rows[0][3].ToString();

                    //// dropdownlist 

                    //DropDownList2.DataSource = dt;
                    //DropDownList2.DataTextField = "cCompName";
                    //DropDownList2.DataValueField = "cCompany";
                    //DropDownList2.DataBind();



                }
     
            }
        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {

                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);

                string FolderPath = ConfigurationManager.AppSettings["FolderPath"];



                string FilePath = Server.MapPath(FolderPath + FileName);

                FileUpload1.SaveAs(FilePath);

                Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text);
                Button1.Visible = true;
                Label2.Text = "";

            }

        }


        private void Import_To_Grid(string FilePath, string Extension, string isHDR)
        {

            string conStr = "";

            switch (Extension)
            {

                case ".xls": //Excel 97-03

                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;

                    break;

                case ".xlsx": //Excel 07

                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;

                    break;

            }

            conStr = String.Format(conStr, FilePath, isHDR);

            OleDbConnection connExcel = new OleDbConnection(conStr);

            OleDbCommand cmdExcel = new OleDbCommand();

            OleDbDataAdapter oda = new OleDbDataAdapter();
            DataTable dt = new DataTable();


            cmdExcel.Connection = connExcel;



            //Get the name of First Sheet

            connExcel.Open();

            DataTable dtExcelSchema;

            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

            connExcel.Close();



            //Read Data from First Sheet

            connExcel.Open();

            cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";

            oda.SelectCommand = cmdExcel;

            oda.Fill(dt);

            connExcel.Close();



            //Bind Data to GridView

            GridView1.Caption = Path.GetFileName(FilePath);

            GridView1.DataSource = dt;
            //Label2.Text = "Done";
            Session["dt"] = dt;
         
            GridView1.DataBind();
            // READ COLUMN AND INSERT INTO DB
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    sqlcon.Open();
            //    cmd = new SqlCommand(" insert into [Hr00Attendence] (cGrpCompany,cCompany,cEmp,cAttendence,cType) values ('10100001',1001,'" + dt.Rows[i]["F3"].ToString().Trim() + "','" + dt.Rows[i]["F4"].ToString().Trim() + "','" + dt.Rows[i]["F5"].ToString().Trim() + "') ", sqlcon);
            //    cmd.ExecuteNonQuery();
            //    sqlcon.Close();
            //}


        }


        protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

            string FileName = GridView1.Caption;

            string Extension = Path.GetExtension(FileName);

            string FilePath = Server.MapPath(FolderPath + FileName);



            Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text);

            GridView1.PageIndex = e.NewPageIndex;

            GridView1.DataBind();
            Label2.Text = "";
        }

      

        protected void Button1_Click(object sender, EventArgs e)
        {

            

                Import_To_Grid3("", "", rbHDR.SelectedItem.Text);
                Label2.Text = "done";

          


        }
        private void Import_To_Grid3(string FilePath, string Extension, string isHDR)
        {

            // READ COLUMN AND INSERT INTO DB
            dt3 = Session["dt"] as DataTable;
            for (int i = 0; i < dt3.Rows.Count; i++)
            {
                sqlcon.Open();
                cmd = new SqlCommand(" insert into [Hr00Attendence] (cGrpCompany,cCompany,cEmp,cAttendence,cType) values ('10100001',1001,'" + dt3.Rows[i]["F3"].ToString().Trim() + "','" + dt3.Rows[i]["F4"].ToString().Trim() + "','" + dt3.Rows[i]["F5"].ToString().Trim() + "') ", sqlcon);
                cmd.ExecuteNonQuery();
                sqlcon.Close();
            }
            
            //foreach (GridViewRow row in GridView1.Rows)
            //{
               
            //    sqlcon.Open();
            //    cmd = new SqlCommand(" insert into [Hr00Attendence] (cGrpCompany,cCompany,cEmp,cAttendence,cType) values ('10100001',1001,'" + row.Cells[2].Text.Trim() + "','" + row.Cells[3].Text.Trim() + "','" + row.Cells[4].Text.Trim() + "') ", sqlcon);
            //    cmd.ExecuteNonQuery();
            //    sqlcon.Close();
               
            //}




        }
    }
}