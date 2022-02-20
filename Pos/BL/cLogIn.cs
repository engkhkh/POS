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
    public class cLogIn//
    {
        public DataTable fnlogin(string id, string pswd)
        {
            DAL.DAL dal1 = new DAL.DAL();
            SqlParameter[] parm = new SqlParameter[2];
            parm[0] = new SqlParameter("id", SqlDbType.VarChar, 50);
            parm[0].Value = id;
            parm[1] = new SqlParameter("pwd", SqlDbType.VarChar, 50);
            parm[1].Value = pswd;
            //parm[2] = new SqlParameter("grpcompany", SqlDbType.VarChar, 50);
            //parm[2].Value = grpcomp;
            //parm[3] = new SqlParameter("comp", SqlDbType.VarChar, 50);
            //parm[3].Value = comp;
            dal1.opencon();
            DataTable dt = new DataTable();
            dt = dal1.readdata("splogin2", parm);
            dal1.closecon();
            return dt;




        }
    }
}