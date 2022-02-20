using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pos.Hr.PL
{
    public partial class ChartOfAccounts : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["U001"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlDataAdapter da2 = new SqlDataAdapter();
        SqlDataAdapter da3 = new SqlDataAdapter();
        SqlDataAdapter adapter2 = new SqlDataAdapter();
        SqlDataAdapter ada = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        DataTable dt = new DataTable();
        DataTable d = new DataTable();
        DataTable d2 = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable table1 = new DataTable();
        DataTable table2 = new DataTable();
        DataTable table3 = new DataTable();
        Pos.BL.cProduct p = new BL.cProduct();
        string accountgrouplevelid1, accountgrouplevelname1, accountgrouplevelid2, accountgrouplevelname2, accountgrouplevelid3, accountgrouplevelname3;
        TreeNode accountgrouplevelNode1, accountgroupLevelNode2,accountgroupLevelNode3;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                
                dt = p.fnreadcompany();
                dt2 = p.fnreadcompany();
                dt3 = p.fnreadcompany();
                dt4 = p.fnreadcompany();
                if (dt.Rows.Count > 0)
                {
                    // Session["cmp"] = dt.Rows[0][0].ToString();
                    //  Session["grpcmp"] = dt.Rows[0][3].ToString();
                    ddlcompch.DataSource = dt;
                    ddlcompch.DataTextField = "cCompName";
                    ddlcompch.DataValueField = "cCompany";
                    ddlcompch.DataBind();
                    //
                    ddlcompch0.DataSource = dt2;
                    ddlcompch0.DataTextField = "cCompName";
                    ddlcompch0.DataValueField = "cCompany";
                    ddlcompch0.DataBind();
                    //
                    ddlcompch1.DataSource = dt3;
                    ddlcompch1.DataTextField = "cCompName";
                    ddlcompch1.DataValueField = "cCompany";
                    ddlcompch1.DataBind();
                    //
                    ddlcompch2.DataSource = dt4;
                    ddlcompch2.DataTextField = "cCompName";
                    ddlcompch2.DataValueField = "cCompany";
                    ddlcompch2.DataBind();
                    //
                    
                }
                MultiView1.ActiveViewIndex = -1;
                
            }
        }

        private void LoadData()
        {
            da = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts] where iAcctUGrpLevel=1", sqlcon);
            da.Fill(d);
            for (int i = 0; i < d.Rows.Count; i++)
            {
                accountgrouplevelid1 = d.Rows[i]["IAccountCode1"].ToString();
                accountgrouplevelname1 = d.Rows[i]["cAccountName1"].ToString();
                accountgrouplevelNode1 = new TreeNode(accountgrouplevelname1, accountgrouplevelid1);
                TreeView1.Nodes.Add(accountgrouplevelNode1);
                /*
                da2 = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where iAcctUGrpLevel=2  ", sqlcon);
                da2.Fill(dt2);
                for (int j = 0; j < dt2.Rows.Count; j++)
                {
                    accountgrouplevelid2 = dt2.Rows[j]["IAccountCode2"].ToString();
                    accountgrouplevelname2 = dt2.Rows[j]["cAccountName2"].ToString();
                    accountgroupLevelNode2 = new TreeNode(accountgrouplevelname2, accountgrouplevelid2);
                    accountgrouplevelNode1.ChildNodes.Add(accountgroupLevelNode2);
                    da3 = new SqlDataAdapter("select cAccountName as cAccountName3,IAccountCode as IAccountCode3 from [FinBAccounts] where iAcctUGrpLevel=3", sqlcon);
                    da3.Fill(dt3);
                    for (int k = 0; k < dt3.Rows.Count; k++)
                    {
                        accountgrouplevelid3 = dt3.Rows[k]["IAccountCode3"].ToString();
                        accountgrouplevelname3 = dt3.Rows[k]["cAccountName3"].ToString();
                        accountgroupLevelNode3 = new TreeNode(accountgrouplevelname3, accountgrouplevelid3);
                        accountgroupLevelNode2.ChildNodes.Add(accountgroupLevelNode3);

                    }
                }

               */
               
            }
        }
         private void LoadData2()
        {
            da = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts] where iAcctUGrpLevel=2 ORDER BY IAccountCode ASC; ", sqlcon);
            da.Fill(d2);
            for (int i = 0; i < d2.Rows.Count; i++)
            {
                accountgrouplevelid1 = d2.Rows[i]["IAccountCode1"].ToString();
                accountgrouplevelname1 = d2.Rows[i]["cAccountName1"].ToString();
                accountgrouplevelNode1 = new TreeNode(accountgrouplevelname1, accountgrouplevelid1);
                TreeView1.Nodes.Add(accountgrouplevelNode1);
                /*
                da2 = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where iAcctUGrpLevel=2  ", sqlcon);
                da2.Fill(dt2);
                for (int j = 0; j < dt2.Rows.Count; j++)
                {
                    accountgrouplevelid2 = dt2.Rows[j]["IAccountCode2"].ToString();
                    accountgrouplevelname2 = dt2.Rows[j]["cAccountName2"].ToString();
                    accountgroupLevelNode2 = new TreeNode(accountgrouplevelname2, accountgrouplevelid2);
                    accountgrouplevelNode1.ChildNodes.Add(accountgroupLevelNode2);
                    da3 = new SqlDataAdapter("select cAccountName as cAccountName3,IAccountCode as IAccountCode3 from [FinBAccounts] where iAcctUGrpLevel=3", sqlcon);
                    da3.Fill(dt3);
                    for (int k = 0; k < dt3.Rows.Count; k++)
                    {
                        accountgrouplevelid3 = dt3.Rows[k]["IAccountCode3"].ToString();
                        accountgrouplevelname3 = dt3.Rows[k]["cAccountName3"].ToString();
                        accountgroupLevelNode3 = new TreeNode(accountgrouplevelname3, accountgrouplevelid3);
                        accountgroupLevelNode2.ChildNodes.Add(accountgroupLevelNode3);

                    }
                }

               */

            }


        }
         
         private void LoadData3()
         {

             da = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts] where iAcctUGrpLevel=3 ORDER BY IAccountCode ASC; ", sqlcon);
             da.Fill(d2);
             for (int i = 0; i < d2.Rows.Count; i++)
             {
                 accountgrouplevelid1 = d2.Rows[i]["IAccountCode1"].ToString();
                 accountgrouplevelname1 = d2.Rows[i]["cAccountName1"].ToString();
                 accountgrouplevelNode1 = new TreeNode(accountgrouplevelname1, accountgrouplevelid1);
                // TreeView1.Nodes.Add(accountgrouplevelNode1);
                 dt2.Clear();
                 da2 = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where iAcctUGrpLevel=4  ", sqlcon);
                 da2.Fill(dt2);
                 for (int j = 0; j < dt2.Rows.Count; j++)
                 {
                     accountgrouplevelid2 = dt2.Rows[j]["IAccountCode2"].ToString();
                     accountgrouplevelname2 = dt2.Rows[j]["cAccountName2"].ToString();
                     accountgroupLevelNode2 = new TreeNode(accountgrouplevelname2, accountgrouplevelid2);
                     accountgrouplevelNode1.ChildNodes.Add(accountgroupLevelNode2);
                     /*     da3 = new SqlDataAdapter("select cAccountName as cAccountName3,IAccountCode as IAccountCode3 from [FinBAccounts] where iAcctUGrpLevel=3", sqlcon);
                          da3.Fill(dt3);
                          for (int k = 0; k < dt3.Rows.Count; k++)
                          {
                              accountgrouplevelid3 = dt3.Rows[k]["IAccountCode3"].ToString();
                              accountgrouplevelname3 = dt3.Rows[k]["cAccountName3"].ToString();
                              accountgroupLevelNode3 = new TreeNode(accountgrouplevelname3, accountgrouplevelid3);
                              accountgroupLevelNode2.ChildNodes.Add(accountgroupLevelNode3);

                          }
                      * */
                 }

                 TreeView1.Nodes.Add(accountgrouplevelNode1);

             }

         }
         private void LoadData4()
         {
             da = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts] where iAcctUGrpLevel=3 ORDER BY IAccountCode ASC; ", sqlcon);
             da.Fill(d2);
             for (int i = 0; i < d2.Rows.Count; i++)
             {
                 accountgrouplevelid1 = d2.Rows[i]["IAccountCode1"].ToString();
                 accountgrouplevelname1 = d2.Rows[i]["cAccountName1"].ToString();
                 accountgrouplevelNode1 = new TreeNode(accountgrouplevelname1, accountgrouplevelid1);
                 TreeView1.Nodes.Add(accountgrouplevelNode1);
                 dt2.Clear();
                 da2 = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where iAcctUGrpLevel=4  ", sqlcon);
                 da2.Fill(dt2);
                 for (int j = 0; j < dt2.Rows.Count; j++)
                 {
                     accountgrouplevelid2 = dt2.Rows[j]["IAccountCode2"].ToString();
                     accountgrouplevelname2 = dt2.Rows[j]["cAccountName2"].ToString();
                     accountgroupLevelNode2 = new TreeNode(accountgrouplevelname2, accountgrouplevelid2);
                     accountgrouplevelNode1.ChildNodes.Add(accountgroupLevelNode2);
                /*     da3 = new SqlDataAdapter("select cAccountName as cAccountName3,IAccountCode as IAccountCode3 from [FinBAccounts] where iAcctUGrpLevel=3", sqlcon);
                     da3.Fill(dt3);
                     for (int k = 0; k < dt3.Rows.Count; k++)
                     {
                         accountgrouplevelid3 = dt3.Rows[k]["IAccountCode3"].ToString();
                         accountgrouplevelname3 = dt3.Rows[k]["cAccountName3"].ToString();
                         accountgroupLevelNode3 = new TreeNode(accountgrouplevelname3, accountgrouplevelid3);
                         accountgroupLevelNode2.ChildNodes.Add(accountgroupLevelNode3);

                     }
                 * */
                 }

                

             }

         }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TreeView1.Nodes.Clear();
            MultiView1.ActiveViewIndex = 0;
            LoadData();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TreeView1.Nodes.Clear();
            MultiView1.ActiveViewIndex = 1;
            LoadData2();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TreeView1.Nodes.Clear();
            MultiView1.ActiveViewIndex = 2;
            LoadData3();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            TreeView1.Nodes.Clear();
            MultiView1.ActiveViewIndex = 3;
            LoadData4();
        }

        protected void ddlcompch_SelectedIndexChanged(object sender, EventArgs e)
        {
             adapter2 = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' and  iAcctUGrpLevel=1", sqlcon);
            table1 = new DataTable();
            adapter2.Fill(table1);
            ddllevel2.DataSource = table1;
            ddllevel2.DataTextField = "cAccountName1";
            ddllevel2.DataValueField = "cAccountName1";
            ddllevel2.DataBind();
            SqlDataAdapter dataadapter1 = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch.SelectedValue + "'  and  iAcctUGrpLevel=2 ORDER BY IAccountCode2 ASC;  ", sqlcon);
            DataTable dtabledt1 = new DataTable();
            dataadapter1.Fill(dtabledt1);
            ddllevel12.DataSource = dtabledt1;
            ddllevel12.DataTextField = "cAccountName2";
            ddllevel12.DataValueField = "cAccountName2";
            ddllevel12.DataBind();
        
        }

        protected void ddlcompch0_SelectedIndexChanged(object sender, EventArgs e)
        {
            adapter2 = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch0.SelectedValue + "' and  iAcctUGrpLevel=2 ORDER BY IAccountCode ASC; ", sqlcon);
            table2 = new DataTable();
            adapter2.Fill(table2);
            ddllevel3.DataSource = table2;
            ddllevel3.DataTextField = "cAccountName1";
            ddllevel3.DataValueField = "cAccountName1";
            ddllevel3.DataBind();
            SqlDataAdapter dataadapter1 = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch0.SelectedValue + "'  and  iAcctUGrpLevel=3 ORDER BY IAccountCode2 ASC;  ", sqlcon);
            DataTable dtabledt2 = new DataTable();
            dataadapter1.Fill(dtabledt2);
            ddllevel4.DataSource = dtabledt2;
            ddllevel4.DataTextField = "cAccountName2";
            ddllevel4.DataValueField = "cAccountName2";
            ddllevel4.DataBind();
        }

        protected void ddlcompch1_SelectedIndexChanged(object sender, EventArgs e)
        {
            adapter2 = new SqlDataAdapter("select cAccountName as cAccountName1,IAccountCode as IAccountCode1 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch1.SelectedValue + "' and  iAcctUGrpLevel=3 ORDER BY IAccountCode ASC; ", sqlcon);
            table2 = new DataTable();
            adapter2.Fill(table2);
            ddllevel5.DataSource = table2;
            ddllevel5.DataTextField = "cAccountName1";
            ddllevel5.DataValueField = "cAccountName1";
            ddllevel5.DataBind();
            SqlDataAdapter dataadapter1 = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch1.SelectedValue + "'  and  iAcctUGrpLevel=4 ORDER BY IAccountCode2 ASC;  ", sqlcon);
            DataTable dtabledt2 = new DataTable();
            dataadapter1.Fill(dtabledt2);
            ddllevel6.DataSource = dtabledt2;
            ddllevel6.DataTextField = "cAccountName2";
            ddllevel6.DataValueField = "cAccountName2";
            ddllevel6.DataBind();
        }

        protected void ddlcompch2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddllevel2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataAdapter dataadapter = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch.SelectedValue + "'  and  cAccountName='" + ddllevel2.SelectedValue + "'  ", sqlcon);
            DataTable dtabledt = new DataTable();
            dataadapter.Fill(dtabledt);
            ddllevel12.DataSource = dtabledt;
            ddllevel12.DataTextField = "cAccountName2";
            ddllevel12.DataValueField = "cAccountName2";
            ddllevel12.DataBind();
            //
          
           
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try{
            sqlcon.Open();
            cmd = new SqlCommand("INSERT INTO [dbo].[FinBAccounts] ([cGrpCompany] ,[cCompany],[cAccountName],[cAccountNameEn] ,[iAcctUGrpLevel],[IAccountCode]) VALUES ('" + Session["grpcmp"].ToString() + "','" + ddlcompch.SelectedValue + "','" + TextBoxgroupnameA.Text.Trim() + "','" + TextBoxgroupnameE .Text.Trim()+ "',"+2+",'"+TextBoxcode.Text.Trim()+"') ", sqlcon);
            cmd.ExecuteNonQuery();
            Label9.Text = "تم اضافة المستوي الثاني ";



            }
            catch (Exception ex){
                Label10.Text=ex.Message;
            }
            finally
            {
                sqlcon.Close();
            }
        }

        protected void ddllevel12_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
           

            //
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("select MAX(IAccountCode+1) as IAccountCode1 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' and  cAccountName ='" + ddllevel12.SelectedValue + "' and iAcctUGrpLevel=2 ", sqlcon);
            SqlDataAdapter ada = new SqlDataAdapter("select IAccountCode as IAccountCode1 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch.SelectedValue + "' and  cAccountName ='" + ddllevel2.SelectedValue + "'", sqlcon);
            DataTable table3 = new DataTable();
            ada.Fill(table3);
            if (cmd.ExecuteScalar().Equals(DBNull.Value))
            {
                foreach (DataRow row in table3.Rows)
                {
                    if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1)
                    {
                        int init = 11;
                        TextBoxcode.Text = Convert.ToString(init);
                    }

                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 2)
                    {
                        int init = 21;
                        TextBoxcode.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 3)
                    {
                        int init = 31;
                        TextBoxcode.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 4)
                    {
                        int init = 41;
                        TextBoxcode.Text = Convert.ToString(init);
                    }
                }

            }
            else
            {

                TextBoxcode.Text = Convert.ToString(cmd.ExecuteScalar());
            }
            sqlcon.Close();
        }

        protected void ddllevel3_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataAdapter dataadapter = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch0.SelectedValue + "'  and  cAccountName='" + ddllevel3.SelectedValue + "'  ", sqlcon);
            DataTable dtabledt21 = new DataTable();
            dataadapter.Fill(dtabledt21);
            ddllevel4.DataSource = dtabledt21;
            ddllevel4.DataTextField = "cAccountName2";
            ddllevel4.DataValueField = "cAccountName2";
            ddllevel4.DataBind();
            
        }

        protected void ddllevel4_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("select MAX(IAccountCode+1) as IAccountCode1 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch0.SelectedValue + "' and  cAccountName ='" + ddllevel4.SelectedValue + "' and iAcctUGrpLevel=3 ", sqlcon);
            SqlDataAdapter ada = new SqlDataAdapter("select IAccountCode as IAccountCode1 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch0.SelectedValue + "' and  cAccountName ='" + ddllevel3.SelectedValue + "'", sqlcon);
            DataTable table3 = new DataTable();
            ada.Fill(table3);
            if (cmd.ExecuteScalar().Equals(DBNull.Value))
            {
                foreach (DataRow row in table3.Rows)
                {
                    if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 11)
                    {
                        int init = 1101;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 12)
                    {
                        int init = 1201;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 13)
                    {
                        int init = 1301;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 14)
                    {
                        int init = 1401;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 15)
                    {
                        int init = 1501;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }

                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 21)
                    {
                        int init = 2101;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 22)
                    {
                        int init = 2201;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 23)
                    {
                        int init = 2301;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 24)
                    {
                        int init = 2401;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 25)
                    {
                        int init = 2501;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 31)
                    {
                        int init = 3101;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 32)
                    {
                        int init = 3201;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 33)
                    {
                        int init = 3301;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 34)
                    {
                        int init = 3401;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 35)
                    {
                        int init = 3501;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 41)
                    {
                        int init = 4101;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 42)
                    {
                        int init = 4201;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 43)
                    {
                        int init = 4301;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 44)
                    {
                        int init = 4401;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 45)
                    {
                        int init = 4501;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                }

            }
            else
            {

                TextBoxcode0.Text = Convert.ToString(cmd.ExecuteScalar());
            }
            sqlcon.Close();


        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand("INSERT INTO [dbo].[FinBAccounts] ([cGrpCompany] ,[cCompany],[cAccountName],[cAccountNameEn] ,[iAcctUGrpLevel],[IAccountCode]) VALUES ('" + Session["grpcmp"].ToString() + "','" + ddlcompch0.SelectedValue + "','" + TextBoxgroupnameA0.Text.Trim() + "','" + TextBoxgroupnameE0.Text.Trim() + "'," + 3 + ",'" + TextBoxcode0.Text.Trim() + "') ", sqlcon);
                cmd.ExecuteNonQuery();
                Label20.Text = "تم اضافة المستوي الثالث ";



            }
            catch (Exception ex)
            {
                Label21.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
            }
        }

        protected void ddllevel5_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataAdapter dataadapter1 = new SqlDataAdapter("select cAccountName as cAccountName2,IAccountCode as IAccountCode2 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and cCompany='" + ddlcompch1.SelectedValue + "'  and  cAccountName='" + ddllevel5.SelectedValue + "' ORDER BY IAccountCode2 ASC;  ", sqlcon);
            DataTable dtabledt2 = new DataTable();
            dataadapter1.Fill(dtabledt2);
            ddllevel6.DataSource = dtabledt2;
            ddllevel6.DataTextField = "cAccountName2";
            ddllevel6.DataValueField = "cAccountName2";
            ddllevel6.DataBind();
        }

        protected void ddllevel6_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand("select MAX(IAccountCode+1) as IAccountCode1 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch1.SelectedValue + "' and  cAccountName ='" + ddllevel6.SelectedValue + "' and iAcctUGrpLevel=4 ", sqlcon);
            SqlDataAdapter ada = new SqlDataAdapter("select IAccountCode as IAccountCode1 from [FinBAccounts] where cGrpCompany='" + Session["grpcmp"].ToString() + "' and  cCompany='" + ddlcompch1.SelectedValue + "' and  cAccountName ='" + ddllevel5.SelectedValue + "'", sqlcon);
            DataTable table3 = new DataTable();
            ada.Fill(table3);
            if (cmd.ExecuteScalar().Equals(DBNull.Value))
            {
                foreach (DataRow row in table3.Rows)
                {
                    if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1101)
                    {
                        int init = 110100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1102)
                    {
                        int init = 110200001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1103)
                    {
                        int init = 110300001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1104)
                    {
                        int init = 110400001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1105)
                    {
                        int init = 110500001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1201)
                    {
                        int init = 120100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1301)
                    {
                        int init = 130100001;
                        TextBoxcode0.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1401)
                    {
                        int init = 140100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 1501)
                    {
                        int init = 150100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }

                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 2101)
                    {
                        int init = 210100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 2201)
                    {
                        int init = 220100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 2301)
                    {
                        int init = 230100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 2401)
                    {
                        int init = 240100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 2501)
                    {
                        int init = 250100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 3101)
                    {
                        int init = 310100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 3201)
                    {
                        int init = 320100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 3301)
                    {
                        int init = 330100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 3401)
                    {
                        int init = 340100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 3501)
                    {
                        int init = 350100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 4101)
                    {
                        int init = 410101000;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 4201)
                    {
                        int init = 420101000;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 4301)
                    {
                        int init = 430100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 4401)
                    {
                        int init = 440100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                    else if (Convert.ToInt32(row["IAccountCode1"].ToString()) == 4501)
                    {
                        int init = 450100001;
                        TextBoxcode1.Text = Convert.ToString(init);
                    }
                }

            }
            else
            {

                TextBoxcode1.Text = Convert.ToString(cmd.ExecuteScalar());
            }
            sqlcon.Close();

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            try
            {
                sqlcon.Open();
                cmd = new SqlCommand("INSERT INTO [dbo].[FinBAccounts] ([cGrpCompany] ,[cCompany],[cAccountName],[cAccountNameEn] ,[iAcctUGrpLevel],[IAccountCode]) VALUES ('" + Session["grpcmp"].ToString() + "','" + ddlcompch1.SelectedValue + "','" + TextBoxgroupnameA1.Text.Trim() + "','" + TextBoxgroupnameE1.Text.Trim() + "'," + 4 + ",'" + TextBoxcode1.Text.Trim() + "') ", sqlcon);
                cmd.ExecuteNonQuery();
                Label30.Text = "تم اضافة الحساب ";



            }
            catch (Exception ex)
            {
                Label31.Text = ex.Message;
            }
            finally
            {
                sqlcon.Close();
            }

        }

       
    }
}