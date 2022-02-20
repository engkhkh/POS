using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.Configuration;
using System.Drawing.Imaging;


namespace Pos.PL
{
    public partial class Itemusercontrol : System.Web.UI.UserControl
    {
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        Pos.BL.cProduct p = new BL.cProduct();
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
      
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"]==null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                
                dt = p.fnreadcompany();
                if (dt.Rows.Count > 0)
                {
                   // Session["cmp"] = dt.Rows[0][0].ToString();
                 //   Session["grpcmp"] = dt.Rows[0][3].ToString();
                    ddlcompch.DataSource = dt;
                    ddlcompch.DataTextField = "cCompName";
                    ddlcompch.DataValueField = "cCompany";
                    ddlcompch.DataBind();
                    
                }
              
            }

        }
       
       
        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlcateg.Items.Clear();
            ddlcateg.Items.Add("Select Category");
           
            SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter("SELECT *FROM [pos].[dbo].[Categories] where cComp='"+ddlcompch.SelectedValue+"' ", WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
            SqlDataAdapter da3 = new System.Data.SqlClient.SqlDataAdapter("SELECT *FROM [pos].[dbo].[Units]", WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
            da.Fill(dt2);
            da3.Fill(dt3);
           //  dt2 = p.fnreadcategory(ddlcompch.SelectedValue);
            if (dt2.Rows.Count > 0)
            {
               // Session["catg"] = dt2.Rows[0][2].ToString();
                ddlcateg.DataSource = dt2;
                ddlcateg.DataTextField = "cCDesc";
                ddlcateg.DataValueField = "cCId";
                ddlcateg.DataBind();
                ///
                ddlunit.DataSource = dt3;
                ddlunit.DataTextField = "cTypeName";
                ddlunit.DataValueField = "cTypeId";
                ddlunit.DataBind();
                
            }
            Session["cmp"] = ddlcompch.SelectedValue;
            sqlcon.Open();
            cmd = new SqlCommand("SELECT MAX ([cPId]+1) as p FROM [pos].[dbo].[Products] WHERE cComp='" + Session["cmp"].ToString() + "'", sqlcon);
          

            //    int x=Convert.ToInt32(cmd.ExecuteScalar());
            if (cmd.ExecuteScalar().Equals(DBNull.Value))
            {
                int init = 10000000;
                TextBoxpid.Text = Convert.ToString(init);

            }
            else
            {

                TextBoxpid.Text = Convert.ToString(cmd.ExecuteScalar());
            }
           
               
            sqlcon.Close();

        }
        

      
        private byte[] ConvertImageToByteArray(System.Drawing.Image imageToConvert,
                                       System.Drawing.Imaging.ImageFormat formatOfImage)
        {
            byte[] Ret;
            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    imageToConvert.Save(ms, formatOfImage);
                    Ret = ms.ToArray();
                }
            }
            catch (Exception) { throw; }
            return Ret;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["cmp"] = ddlcompch.SelectedValue;
            Session["catg"] = ddlcateg.SelectedValue;
            Session["unit"] = ddlunit.SelectedValue;
            try
            {
                if (File1.PostedFile.ContentLength == 0)
                {
                    Label11.Text = "Browse Image/حدد الصورة";
                }
                else
                {

                    Label11.Text = File1.PostedFile.FileName;
                    if (Label11.Text.EndsWith(".png") || Label11.Text.EndsWith(".jpg") || Label11.Text.EndsWith(".jpeg") || Label11.Text.EndsWith(".gif") || Label11.Text.EndsWith(".bmp"))
                    {


                        File1.PostedFile.SaveAs(Server.MapPath("~/Images/" + "/" + File1.PostedFile.FileName));

                    }
                    else
                    {
                        Label11.Text = "NOT (.png,.jpg,.jpeg,.gif,.bmp) File";

                    }
                }
                Imageprod.ImageUrl = "~/Images/" + "/" + File1.PostedFile.FileName;




                System.Drawing.Image imag = System.Drawing.Image.FromStream(File1.PostedFile.InputStream);
                byte[] cyf = ConvertImageToByteArray(imag, System.Drawing.Imaging.ImageFormat.Jpeg);
               
                sqlcon.Open();
                cmd = new SqlCommand("INSERT INTO Products (cGrpCompany ,cComp ,cPId,cPName ,cPQtyInStock ,cPPrice ,cPImage,cPBcode ,cCId,cPPriceCost,cUnitId) VALUES ('" + Session["grpcmp"].ToString() + "', '" + Session["cmp"].ToString() + "', '" + TextBoxpid.Text + "', '" + TextBoxpdname.Text + "', '" + TextBoxpdqty.Text + "', '" + TextBoxpdprice.Text + "','" + cyf[1000] + "','" + TextBoxpdbarcode.Text + "','" + Session["catg"].ToString() + "','" + TextBoxpdcost.Text + "','" + Session["unit"].ToString() + "')", sqlcon);
                cmd.ExecuteNonQuery();
                  
                //int queryResult = cmd.ExecuteNonQuery();
                //if (queryResult == 1)
                    Label9.Text = "product Created /تم حفظ المنتج";
                    Label10.Text = "";
                   
                
            }
            catch (Exception ex)
            {
                Label10.Text = "Error: " + ex.Message;
                Label9.Text = "";
            }
            finally
            {
                sqlcon.Close();
            }
            TextBoxpid.Text = "";
            TextBoxpdname.Text = "";
            TextBoxpdqty.Text = "";
            TextBoxpdprice.Text = "";
            TextBoxpdbarcode.Text = "";
           // Label10.Text = "";
           // Label9.Text = "";
            Imageprod.Visible = false;
            Label11.Text = "";
            ddlcateg.SelectedIndex = 0;
            ddlcompch.SelectedIndex = 0;
           
           
          //  p.addproduct(Session["grpcmp"].ToString(), Session["cmp"].ToString(), TextBoxpid.Text, TextBoxpdname.Text, TextBoxpdqty.Text, TextBoxpdprice.Text,cyf[1000], TextBoxpdbarcode.Text, Session["catg"].ToString());
           
            
          //  Response.Redirect("http://tawsulcode.com/");
        }

        /* read bytes to image 
         * 
         * link tutorial 
         *  // https://www.codeproject.com/Articles/33310/C-Save-and-Load-Image-from-Database
         * public void ProcessRequest (HttpContext context)
{
        System.Data.SqlClient.SqlDataReader rdr = null;
        System.Data.SqlClient.SqlConnection conn = null;
        System.Data.SqlClient.SqlCommand selcmd = null;
        try
        {
          conn = new System.Data.SqlClient.SqlConnection
		(System.Configuration.ConfigurationManager.ConnectionStrings
		["ConnectionString"].ConnectionString);
          selcmd = new System.Data.SqlClient.SqlCommand
		("select pic1 from msg where msgid=" + 
		context.Request.QueryString["imgid"], conn);
          conn.Open();
          rdr = selcmd.ExecuteReader();
          while (rdr.Read())
          {
            context.Response.ContentType = "image/jpg";
            context.Response.BinaryWrite((byte[])rdr["pic1"]);
          }
          if (rdr != null)
            rdr.Close();
        }
        finally
        {
          if (conn != null)
              conn.Close();
        }
}
         * */


        protected void Button2_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("osk.exe");
        }
}
}