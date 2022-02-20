<%@ Page Language="C#" AutoEventWireup="true" Codefile="report.aspx.cs" Inherits="WebApplication1.report" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <telerik:RadCodeBlock ID="RadGridFunctions" runat="server">
        <script type="text/javascript">
        <%-- Used for selecting only an existing item from the combo boxes --%>
            function SelectExistingItemHandler(sender, eventArgs) {
                var textInTheCombo = sender.get_text();
                var item = sender.findItemByText(textInTheCombo);
                <%-- If there is no item like the entered text, select the first item --%>
                if (!item) {
                    sender.trackChanges();
                    sender.get_items().getItem(0).select();
                    sender.commitChanges();
                }
            }
            <%-- Used for selecting an item in the combo box by pressing TAB --%>
            function radComboKeyPress(comboBox, eventArgs) {
                var keyCode = eventArgs.get_domEvent().keyCode;
                if (keyCode == 9) {
                    comboBox.get_highlightedItem().select();
                }
            }
        </script>
         </telerik:RadCodeBlock>
    <title></title>
</head>
<body>
   
    <p>
        <br />
    </p>
    <p>
       </p>
    <form id="form1" runat="server">
        <div>

            <telerik:RadWindow ID="RadWindow1" runat="server" Height="300px" Width="480px" VisibleStatusbar="false" Behaviors="None" Modal="true" Skin="Outlook" VisibleOnPageLoad="True">
        <ContentTemplate>
            <br />
            <asp:Label ID="lblHead" runat="server" Text="PayRoll Anyalisis " class="printComboTitle" style="margin-left:172px"> </asp:Label>
            <br />
            <table id="Table1" cellspacing="2" cellpadding="2" width="460px" border="0" >
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Choose Payroll:"  ></asp:Label>:
                    </td>
                    <td>
                        <telerik:RadComboBox ID="ddlPayrollAcct" runat="server" AutoPostBack="false" CssClass="Col1" 
                            HighlightTemplatedItems="true" Width="300" Height="140" CheckBoxes="true"
                            Filter="Contains" MarkFirstMatch="true"  DataValueField="Ipay"  TabIndex="0" EnableCheckAllItemsCheckBox="true" DataTextField="cNar"
                            DropDownWidth="400px" OnItemsRequested="ddlPayrollAcct_ItemsRequested" OnSelectedIndexChanged="ddlPayrollAcct_SelectedIndexChanged"  DropDownAutoWidth="Disabled">
                            <HeaderTemplate>

                                 <table style="width:300px; border:medium" > 
                                     <tr>       
                                          <td style="width:50px; "><asp:Label ID="lblbpgid" runat="server" Text=" Id" /></td>        
                                          <td style="width:250px;" ><asp:Label ID="Label4" runat="server" Text="Name" /></td>   
                                     </tr>    
                                 </table>
                              
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table  style="width:300px; border:medium; "  >     
                                        <tr>        
                                           <td  style="width:50px; ">            
                                              <%# DataBinder.Eval(Container.DataItem, "Ipay")%>        
                                           </td>        
                                           <td  style="width:250px; ">
                                             <%# DataBinder.Eval(Container.DataItem, "cNar")%>   
                                           </td> 
                                       </tr> 
                               </table> 
                            </ItemTemplate>
                        </telerik:RadComboBox>



                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ControlToValidate="ddlPayrollAcct" class="radValidate" ErrorMessage="!" >
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                   
 
                <tr>
                    <td align="center" colspan="2" style="padding-top: 10px; width:50px;">
                        <asp:Button  ID="Search" Text="Print all" runat="server" OnClick="Search_Click"></asp:Button>&nbsp;
                    </td>
                </tr>
                 <tr>
                    <td align="center" colspan="2" style="padding-top: 10px; width:50px;">
                        <asp:Button  ID="Button1" Text="Payroll from zero-1200" runat="server" ></asp:Button>&nbsp;
                    </td>
                </tr>
                 <tr>
                    <td align="center" colspan="2" style="padding-top: 10px; width:50px;">
                        <asp:Button  ID="Button2" Text="Payroll from 1201-1250" runat="server" ></asp:Button>&nbsp;
                    </td>
                </tr>
                 <tr>
                    <td align="center" colspan="2" style="padding-top: 10px; width:50px;">
                        <asp:Button  ID="Button3" Text="Payroll from 2501-5000" runat="server" ></asp:Button>&nbsp;
                    </td>
                </tr>
                 <tr>
                    <td align="center" colspan="2" style="padding-top: 10px; width:50px;">
                        <asp:Button  ID="Button4" Text="Payroll from 5001-upto" runat="server" ></asp:Button>&nbsp;
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </telerik:RadWindow>
 <%-- Define the set of Ajax controls for which postback is to be avoided --%>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="ddlPayrollAcct">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddlPayrollAcct" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                  </UpdatedControls>
            </telerik:AjaxSetting>
            
        </AjaxSettings>
    </telerik:RadAjaxManager>
        </div>
       <!-- second div to report -->
        <div>


        </div>
          <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="10pt" BorderWidth="1pt" Visible="False"
        
        BackColor="#FFFFCC"  Height="500px" Width="1000px" OnLoad="ReportViewer1_Load" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport  ReportPath="report.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="WebApplication1.u001DataSetTableAdapters.reportTableAdapter"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
