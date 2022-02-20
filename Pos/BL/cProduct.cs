using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pos.DAL;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace Pos.BL
{
    public class cProduct
    {
        public DataTable fnreadcompany()
        {
            DAL.DAL dal1 = new DAL.DAL();
            dal1.opencon();
            DataTable dt = new DataTable();
            dt = dal1.readdata("spreadcompany", null);
            dal1.closecon();
            return dt;




        }
        public DataTable fnreadcategory(string selectedcompany)
        {
            DAL.DAL dal1 = new DAL.DAL();
            SqlParameter[] parm = new SqlParameter[1];
            parm[0] = new SqlParameter("cComp", SqlDbType.NChar, 5);
            parm[0].Value = selectedcompany;
            dal1.opencon();
            DataTable dt = new DataTable();
            dt = dal1.readdata("spreadcategory",parm);
            dal1.closecon();
            return dt;




        }
        public void addproduct(string gcmp, string cmp, string pid, string pname, string pqty, string pprice, byte pimage, string pbarcode, string prodcategory)
        {
            DAL.DAL dal1 = new DAL.DAL();
            dal1.opencon();
            SqlParameter[] parm = new SqlParameter[9];
            parm[0] = new SqlParameter("cGrpCompany", SqlDbType.VarChar, 8);
            parm[0].Value = gcmp;
            parm[1] = new SqlParameter("cComp", SqlDbType.VarChar, 5);
            parm[1].Value = cmp;
            parm[2] = new SqlParameter("cPId", SqlDbType.VarChar, 8);
            parm[2].Value = pid;
            parm[3] = new SqlParameter("cPName", SqlDbType.VarChar,100);
            parm[3].Value = pid;
            parm[4] = new SqlParameter("cPQtyInStock", SqlDbType.VarChar, 10);
            parm[4].Value = pqty;
            parm[5] = new SqlParameter("cPPrice", SqlDbType.VarChar, 10);
            parm[5].Value = pprice;
            parm[6] = new SqlParameter("cPImage", SqlDbType.Image);
            parm[6].Value = pimage;
            parm[7] = new SqlParameter("cPBcode", SqlDbType.VarChar, 50);
            parm[7].Value = pbarcode;
            parm[8] = new SqlParameter("cCId", SqlDbType.VarChar, 5);
            parm[8].Value = prodcategory;
         
            dal1.excutecommand("addproduct", parm);
            dal1.closecon();


        
        
        
        }





       
    }
}