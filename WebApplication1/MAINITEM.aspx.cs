using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace WebApplication1
{
    public partial class MAINITEM : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=.;Initial Catalog=ehlive; integrated security=false;  User ID=u001;Password=kh602050$0;");
        SqlDataAdapter adapter2;
        SqlDataAdapter adapter3;
        DataSet ds=new DataSet();
        public string strQuery = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Enabled = false;
            Label2.Enabled = false;
            Label3.Enabled = false;
            Label4.Enabled = false;
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";
            Label4.Text = "";
       
        }
       public void  fillradproject(RadComboBox combo,String selecteditem){
             combo.Items.Clear();
             string sqlSelectCommand = "SELECT cPrj,cPrjName,cDesc from [loprj011]  ";

            SqlDataAdapter adapter = new SqlDataAdapter(sqlSelectCommand, ConfigurationManager.ConnectionStrings["u001"].ConnectionString);
            //adapter.SelectCommand.Parameters.AddWithValue("@text", e.Text);
            //  adapter.SelectCommand.Parameters.AddWithValue("@cPrj", ViewState["cPrj"]);
            //(object)DBNull.Value
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            combo.DataTextField = "cPrjName";
            combo.DataValueField = "cPrj";
            combo.DataSource = dataTable;
            combo.DataBind();
            if (selecteditem != "")
            {
                combo.SelectedIndex = combo.FindItemIndexByValue(selecteditem);
            }
            else
            {
                combo.SelectedIndex = 1;
            }
          ViewState["cPrj"] = combo.SelectedValue;

            }
       public void fillradsub(RadComboBox combo,string selecteditem)
       {
           combo.Text= "";
           combo.Items.Clear();
          String strQuery = "select 'ALL' 'cSubPrj','ALL' 'cSubPrjDesc' ";
          adapter2 = new SqlDataAdapter(strQuery, sqlcon);
          adapter2.Fill(ds, "tab");

           adapter2 = new SqlDataAdapter("select * from [loprj049] where cPrj='" + ViewState["cPrj"] + "'", sqlcon);
           adapter2.Fill(ds, "tab");
           combo.DataTextField = "cSubPrjDesc";
           combo.DataValueField = "cSubPrj";
           combo.DataSource = ds.Tables["tab"];
           combo.DataBind();
           if (selecteditem != "")
           {
               combo.SelectedIndex = combo.FindItemIndexByValue(selecteditem);
           }
           else
           {
               combo.SelectedIndex = 1;
           }
         
         ViewState["cSubPrj"] = combo.SelectedValue;
       }
     public void    fillmain(RadComboBox combo,string selecteditem ){
         combo.Text = "";
         combo.Items.Clear();
         String strQuery = "select 'ALL' 'cDesc','ALL' 'cMItem' ";
         adapter2 = new SqlDataAdapter(strQuery, sqlcon);
         adapter2.Fill(ds, "tab1");
         /*
         if(ViewState["cSubPrj"] == "ALL" )
         {
             adapter2 = new SqlDataAdapter("select *,loprj014.cCompTypeDesc from [loprj047],[loprj014] where  loprj014.ccomptype=loprj047.cCompType and cSubPrj='" + Session["cSubPrj"] + "'", sqlcon);
            strQuery = "select rtrim(cMItem) as cMItem,rtrim(cRef) as cRef from loprj047,loprj049 where loprj049.csubprj=loprj047.csubprj and loprj049.cPrj=@pPrj  ";
        
         }
         else
         {
           
             strQuery = "select rtrim(cMItem) as cMItem,rtrim(cRef) as cRef from loprj047 where  loprj047.cSubPrj=@pSubPrj ";
         }
          * */
             adapter2 = new SqlDataAdapter("select *,loprj014.cCompTypeDesc from [loprj047],[loprj014] where  loprj014.ccomptype=loprj047.cCompType and cSubPrj='" + Session["cSubPrj"] + "'", sqlcon);
         adapter2.Fill(ds, "tab1");
         combo.DataTextField = "cDesc";
         combo.DataValueField = "cMItem";
         combo.DataSource = ds.Tables["tab1"];
         combo.DataBind();
     //   ViewState["cRef"] = ds.Tables["tab1"].Columns["cRef"].ToString();
         if (selecteditem != "")
         {
             combo.SelectedIndex = combo.FindItemIndexByValue(selecteditem);
         }
         else
         {
             combo.SelectedIndex = 1;
         }

         ViewState["cMItem"] = combo.SelectedValue;

        }
       
        protected void CheckoutButton_Click(object sender, EventArgs e)
        {

         
           // Label4.Text = Convert.ToString(Session["cRef"]);
            ////RAD GRID CODE 
            string sqlSelectCommand = "SELECT  LTRIM(RTRIM(loprj043.cItem)) AS Item,  " +
                       "	LTRIM(RTRIM(loitm021.cItemName)) AS ItemName,    " +
                       "    LTRIM(RTRIM(loitm031.cUnitName)) AS Unit, " +
                       "	loprj043.dQty AS Qty,    " +
                       "	loprj043.dRate AS Rate,    " +
                       "	loprj043.dValue AS TAmnt,    " +
                       "	loprj043.dMQty AS ModifiedQty,    " +
                       "	loprj043.dMRate AS ModifiedRate,    " +
                       "	loprj043.dMValue AS TMAmnt,    " +
                       "	loprj043.dRecQty AS ReceiptQty   , " +
                        " CASE WHEN LOPRJ043.bOpen = 1 then 'Opened' else 'Closed' END bOpen" +
                       " FROM	loprj043,	loprj047,	loitm021,loitm031,hremp011    " +
                       " WHERE    " +
                       " hremp011.cuser=loprj043.cuser and " +
                       " loitm031.cunit=loprj043.cunit and loitm031.cgrpcomp=loprj043.cgrpcomp and " +
                       "	loprj043.cGrpComp = loprj047.cGrpComp    " +
                       " AND loprj043.cComponent = loprj047.cMItem    " +
                       " AND loprj043.cGrpComp = loitm021.cGrpComp    " +
                       " AND loprj043.cItem = loitm021.cItem    " +

                       " AND loprj043.cPrj = '" + Session["cPrj"] + "' AND loprj043.cComponent = '" + Session["cMItem"] + "'";

            SqlDataAdapter adapter = new SqlDataAdapter(sqlSelectCommand, ConfigurationManager.ConnectionStrings["u001"].ConnectionString);
            //adapter.SelectCommand.Parameters.AddWithValue("@text", e.Text);
            //  adapter.SelectCommand.Parameters.AddWithValue("@cPrj", ViewState["cPrj"]);
            //(object)DBNull.Value
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
           
           RadGrid1.DataSource = dataTable;
            RadGrid1.DataBind();
           

        }

        protected void RadComboBoxProduct_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            ViewState["cPrj"] = e.Value;
            Session["cPrj"] = e.Value;
           
        }
        protected void RadComboBoxsubproject_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            ViewState["cSubPrj"] = e.Value;
            Session["cSubPrj"] = e.Value;
            Session["cRef"] = ViewState["cRef"];
        }
       
        protected void RadComboBoxsubproject_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            RadComboBox combo = (RadComboBox)sender;
            fillradsub(combo, "");
           
        }
        protected void RadComboBoxProduct_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            RadComboBox combo = (RadComboBox)sender;
            fillradproject(combo, "");
        }
        protected void RadComboBoxmain_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            //fill
            ViewState["cMItem"] = e.Value;
            Session["cMItem"] = e.Value;
        }
        protected void RadComboBoxmain_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            //fill
            RadComboBox combo = (RadComboBox)sender;
            fillmain(combo, "");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Enabled = true;
            Label2.Enabled = true;
            Label3.Enabled = true;
            Label4.Enabled = true;
            Label1.Text = "dcp:sum(mrate)in boq/qty in mainitem";
            Label2.Text = "dNpunit:rate in mainitem  without qty after discount-dcp";
            Label3.Text = "dNpvalue:total rate in mainitem -(dNpunit*qty in mainitem)";
            Label4.Text = "breakdowncost:sales value-dNpvalue";
            
                SqlDataAdapter adapter3 = new SqlDataAdapter("select rtrim(loprj011.cprjname) as PrjName,rtrim(loprj049.csubprjdesc) as SubProject,(loprj047.cDesc) as Name, rtrim(loprj047.cRef) as cRef, " +
                               " loprj047.dQty as dQty,loprj047.dRate as dRate,loprj047.dDiscPer as dDiscPer,(loprj047.dRate/100)*(100-loprj047.dDiscPer) as dNetRate,loprj047.dQty * ((loprj047.dRate/100)*(100-loprj047.dDiscPer)) as salesValue, " +
                               " (select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem ) as dCP, " +
                               " ((loprj047.dRate/100)*(100-loprj047.dDiscPer)) - (select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem ) as dNPUnit, " +
                               " ((loprj047.dRate/100)*(100-loprj047.dDiscPer)*dQty) - ((select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem )*dQty) as dNPValue, " +
                               " (select count(*) from loprj043 where loprj043.cComponent=loprj047.cMItem and loprj043.cItem <> '11021010') as cBD, " +
                               " (select Isnull(sum(dQty*dRate)/sum(dQty),0) from loprj148 where loprj047.CMItem=loprj148.cComponent) as cAC " +
                               " from " +
                               "loprj011,loprj049,loprj047 where " +
                               "loprj047.cSubPrj=loprj049.cSubPrj and loprj049.cPrj=loprj011.cPrj and " +
                               "loprj049.cPrj='" + Session["cPrj"] + "'", sqlcon);
                DataTable dataTable2 = new DataTable();
                adapter3.Fill(dataTable2);
                RadGrid1.DataSource = dataTable2;
                RadGrid1.DataBind();
                

               /*  strQuery = "select rtrim(loprj011.cprjname) as cPrjName,rtrim(loprj049.csubprjdesc) as cSubPrjDescrtrim,(loprj047.cDesc) as Name, rtrim(loprj047.cRef) as cRef, " +
                               " loprj047.dQty as dQty,loprj047.dRate as dRate,loprj047.dDiscPer as dDiscPer,(loprj047.dRate/100)*(100-loprj047.dDiscPer) as dNetRate,loprj047.dQty * ((loprj047.dRate/100)*(100-loprj047.dDiscPer)) as salesValue, " +
                               " (select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem ) as dCP, " +
                               " ((loprj047.dRate/100)*(100-loprj047.dDiscPer)) - (select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem ) as dNPUnit, " +
                               " ((loprj047.dRate/100)*(100-loprj047.dDiscPer)*dQty) - ((select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem )*dQty) as dNPValue, " +
                               " (select count(*) from loprj043 where loprj043.cComponent=loprj047.cMItem and loprj043.cItem <> '11021010') as cBD, " +
                               " (select Isnull(sum(dQty*dRate)/sum(dQty),0) from loprj148 where loprj047.CMItem=loprj148.cComponent) as cAC " +
                               " from " +
                               "loprj011,loprj049,loprj047 where " +
                               "loprj047.cSubPrj=loprj049.cSubPrj and loprj049.cPrj=loprj011.cPrj and " +
                               "loprj049.cPrj='" + Session["cPrj"] + "'";*/
           

                /* strQuery = "select rtrim(loprj011.cprjname) as cPrjName,rtrim(loprj049.csubprjdesc) as cSubPrjDesc,(loprj047.cDesc) as Name, rtrim(loprj047.cRef) as cRef, " +
                               " loprj047.dQty as dQty,loprj047.dRate as dRate,loprj047.dDiscPer as dDiscPer,(loprj047.dRate/100)*(100-loprj047.dDiscPer) as dNetRate,loprj047.dQty * ((loprj047.dRate/100)*(100-loprj047.dDiscPer)) as dNetValue, " +
                               " (select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem ) as dCP, " +
                               " ((loprj047.dRate/100)*(100-loprj047.dDiscPer)) - (select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem ) as dNPUnit, " +
                               " ((loprj047.dRate/100)*(100-loprj047.dDiscPer)*dQty) - ((select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem )*dQty) as dNPValue, " +
                               " (select count(*) from loprj043 where loprj043.cComponent=loprj047.cMItem and loprj043.cItem <> '11021010') as cBD, " +
                               " (select Isnull(sum(dQty*dRate)/sum(dQty),0) from loprj148 where loprj047.CMItem=loprj148.cComponent) as cAC " +
                               " from " +
                               "loprj011,loprj049,loprj047 where " +
                               "loprj047.cSubPrj=loprj049.cSubPrj and loprj049.cPrj=loprj011.cPrj and " +
                               "loprj047.cMItem='" + Session["cMItem"] + "'";*/
            

               /* strQuery = "select rtrim(loprj011.cprjname) as cPrjName,rtrim(loprj049.csubprjdesc) as cSubPrjDesc,(loprj047.cDesc) as Name, rtrim(loprj047.cRef) as cRef, " +
                             " loprj047.dQty as dQty,loprj047.dRate as dRate,loprj047.dDiscPer as dDiscPer,(loprj047.dRate/100)*(100-loprj047.dDiscPer) as dNetRate,loprj047.dQty * (loprj047.dRate*(100-loprj047.dDiscPer)) as dNetValue, " +
                             " (select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem ) as dCP, " +
                             " ((loprj047.dRate/100)*(100-loprj047.dDiscPer)) - (select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem ) as dNPUnit, " +
                             " ((loprj047.dRate/100)*(100-loprj047.dDiscPer)*dQty) - ((select case when loprj047.dQty = 0 then 0 else sum(loprj043.dMValue)/loprj047.dQty end  from loprj043 where loprj043.cComponent=loprj047.cMItem )*dQty) as dNPValue, " +
                             " (select count(*) from loprj043 where loprj043.cComponent=loprj047.cMItem and loprj043.cItem <> '11021010') as cBD, " +
                             " (select Isnull(sum(dQty*dRate)/sum(dQty),0) from loprj148 where loprj047.CMItem=loprj148.cComponent) as cAC " +
                             " from " +
                             "loprj011,loprj049,loprj047 where " +
                             "loprj047.cSubPrj=loprj049.cSubPrj and loprj049.cPrj=loprj011.cPrj and " +
                             "loprj047.cSubPrj='" + ViewState["cSubPrj"] + "'";*/
            }

            //SqlCommand cmd = new SqlCommand();
            //adapter3 = new SqlDataAdapter(cmd);
            //cmd.CommandText = strQuery;
            //cmd.Connection = sqlcon;
            //cmd.Parameters.Clear();
            //sqlcon.Open();
            //DataTable dataTable2 = new DataTable();
            //adapter3.Fill(dataTable2);
           

       
}
}