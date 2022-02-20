using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Attend : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=.;Initial Catalog=zkteco_biotime; integrated security=false;  User ID=u001;Password=kh602050$0;");
        SqlDataAdapter adapter2;
        SqlDataAdapter adapter3;
        DataSet ds = new DataSet();
        DataTable t2 = new DataTable();
        public string strQuery = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            adapter2 = new SqlDataAdapter("select pin as N'الرقم الوظيفي',userinfo.name as N'الاسم',  checktime as N'الوقت ',CASE WHEN checktype = 0 then N'دخول' else N'خروج' END checktype from checkinout,userinfo where checkinout.pin=1324 and checkinout.pin=userinfo.badgenumber  ORDER BY checktime DESC ", sqlcon);
            adapter2.Fill(t2);
            radgrid1.DataSource = t2;
            radgrid1.DataBind();

        }
    }
}