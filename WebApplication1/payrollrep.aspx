<%@ Page Language="VB" AutoEventWireup="true"  CodeFile="~/payrollrep.vb" Inherits="WebApplication1_payrollrep" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<html5>
    <head>
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
        <style type="text/css">
            
                   .rcbCheckBox {
    padding-top: 80px;
    margin-left: 16px;
    margin-top: 7px;
    float:right;
        display: table-row;
    
}

                       .RadComboBoxDropDown .rcbCheckBox, .RadComboBoxDropDown .rcbCheckAllItemsCheckBox {
              

float: right;

}
        </style>
    </telerik:RadCodeBlock>
   

     </head>
<body>
<form runat="server">
  

<div>
 HI
</div>
    <div>

        <br />
   
    <rsweb:ReportViewer ID="rvrAcct" runat="server" Font-Names="Verdana" Font-Size="8pt" BorderWidth="1pt"
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
        BackColor="White" Width="2154px" Height="1000px" Visible="false">
        <LocalReport ReportPath="payrollrep.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
         
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

    </div>
<div>
    <telerik:RadWindow ID="RadWindow1" runat="server" Height="300px" Width="480px" VisibleStatusbar="false" Behaviors="None" Modal="true" Skin="Default">
        <ContentTemplate>
            <br />
            <asp:Label ID="lblHead" runat="server" Text="payroll" class="printComboTitle" style="margin-left:172px"> </asp:Label>
            <br />
            <table id="Table1" cellspacing="2" cellpadding="2" width="460px" border="0" class="radTable">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="payroll" CssClass="Col1"></asp:Label>:
                    </td>
                    <td>
                        <telerik:RadComboBox ID="ddlPayrollAcct" runat="server" AutoPostBack="true" CssClass="Col1" 
                            HighlightTemplatedItems="true" Width="300" Height="140" CheckBoxes="true" InputCssClass="rcbCheckAllItemsCheckBox"
                            Filter="Contains" MarkFirstMatch="true"  DataValueField="Ipay"  TabIndex="0" EnableCheckAllItemsCheckBox="true" DataTextField="cNar"
                            DropDownWidth="400px">
                            <HeaderTemplate>

                                 <table style="width:300px; border:medium" > 
                                     <tr>       
                                          <td style="width:50px; "><asp:Label ID="lblbpgid" runat="server" Text="payroll id" /></td>        
                                          <td style="width:250px;" ><asp:Label ID="Label4" runat="server" Text="payroll narriation" /></td>   
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
                            ControlToValidate="ddlPayrollAcct" class="radValidate">
                            
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                   <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="subcode" CssClass="Col1"></asp:Label>:
                    </td>
                    <td>
                        <telerik:RadComboBox ID="ddlSubCode" runat="server" AutoPostBack="true" CssClass="Col1" OnClientKeyPressing="radComboKeyPress"
                            HighlightTemplatedItems="true" Width="300" Height="140"
                            EnableLoadOnDemand="true" Filter="Contains" MarkFirstMatch="true" CausesValidation="false" TabIndex="0"
                            OnClientBlur="SelectExistingItemHandler" OnItemsRequested="ddlSubCode_ItemsRequested"
                            OnSelectedIndexChanged="ddlSubCode_SelectedIndexChanged">
                            <HeaderTemplate>
                                 <table style="width:300px; border:medium" > 
                                     <tr>       
                                          <td style="width:50px; "><asp:Label ID="lblbpgid" runat="server" Text=" id" /></td>        
                                          <td style="width:250px;" ><asp:Label ID="Label4" runat="server" Text="dept name" /></td>   
                                     </tr>    
                                 </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                               
                                 <table  style="width:300px; border:medium; "  >     
                                        <tr>        
                                           <td  style="width:50px; ">            
                                              <%# DataBinder.Eval(Container.DataItem, "cDept")%>        
                                           </td>        
                                           <td  style="width:250px; ">
                                             <%# DataBinder.Eval(Container.DataItem, "cName")%>   
                                           </td> 
                                       </tr> 
                               </table>
                            </ItemTemplate>
                        </telerik:RadComboBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                            ControlToValidate="ddlPayrollAcct" class="radValidate">
                       
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <!---->
                <tr>
                    <td align="center" colspan="2" style="padding-top: 10px;">
                    <asp:TextBox runat="server" ID="textbox1" Text="zero" ></asp:TextBox>
                        </td>
                  </tr>
                <tr>
                    <td align="center" colspan="2" style="padding-top: 10px;">
                    <asp:TextBox runat="server" ID="textbox2" Text="1200" ></asp:TextBox>
                        </td>
                  </tr>
 
                <tr>
                    <td align="center" colspan="2" style="padding-top: 10px;">
                        <asp:Button CssClass="Col1" ID="Search" Text="print" runat="server" OnClick="Search_Click"></asp:Button>&nbsp;
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </telerik:RadWindow>
    </div>

    <%-- Define the set of Ajax controls for which postback is to be avoided --%>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="ddlPayrollAcct">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddlPayrollAcct" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                  </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ddlSubCode">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddlSubCode" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>



    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   
 </form>
    </body>
    </html5>