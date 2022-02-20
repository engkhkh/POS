using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;



namespace Pos.DAL
{
    public class DAL
    {
        public SqlConnection SqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);

        // method openconnection
        public void opencon()
        {
            if (SqlConnection.State != ConnectionState.Open)
            {
                SqlConnection.Open();

            }
        }
        // method connection close 
        public void closecon()
        {
            if(SqlConnection.State!=ConnectionState.Closed)
            {
                SqlConnection.Close();
            }
        }
        // read data
        public DataTable readdata(string storeprocedure,SqlParameter[] parm)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = storeprocedure;
            cmd.Connection = SqlConnection;
            if(parm!=null)
            {
                for (int i = 0; i < parm.Length; i++)
                {
                    cmd.Parameters.Add(parm[i]);

                }
            }
            SqlDataAdapter dataadapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dataadapter.Fill(dt);
            return dt;




        }
        // excutecommand
        public void excutecommand(string storeprocedure, SqlParameter[] parm)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = storeprocedure;
            cmd.Connection = SqlConnection;
            if (parm != null)
            {
                cmd.Parameters.AddRange(parm);
            }
            cmd.ExecuteNonQuery();
        }



    }
    
      
}