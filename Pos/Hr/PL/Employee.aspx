<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/PL/HrLayout.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Pos.Hr.PL.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head111" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 226px;
        }
        .auto-style2 {
            width: 226px;
            height: 28px;
        }
        .auto-style3 {
            width: 100%;
            float: right;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder111" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Basic Data/البيانات الأساسية" OnClick="Button1_Click" ForeColor="#0066FF" /><asp:Button ID="Button2" runat="server" Text="Job Data/البيانات الوظيفية" OnClick="Button2_Click" ForeColor="#0066FF" /><asp:Button ID="Button3" runat="server" Text="Education/التعليم " ForeColor="#0066FF" OnClick="Button3_Click" /><asp:Button ID="Button4" runat="server" Text="Salary /الراتب " OnClick="Button4_Click" ForeColor="#0066FF" /><asp:Button ID="Button5" runat="server" Text="Vacations/الاجازات  " ForeColor="#0066FF" OnClick="Button5_Click" /><asp:Button ID="Button6" runat="server" Text="Legal documents/وثائق قانونية" ForeColor="#0066FF" OnClick="Button6_Click" />
    <asp:Button ID="Button8" runat="server" Text="Attachments/مرفقات" OnClick="Button8_Click" ForeColor="#0066FF" />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <br /><br /><br />
            <table align="center" cellspacing="4" dir="rtl">
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td class="auto-style1">
                        &nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="الفرع:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlcompch" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a branche -تحديد الفرع" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label26" runat="server" ForeColor="Red" Text=":Company"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList33_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="Select Type /" />
                            <asp:ListItem Selected="False" Text="مؤظف مؤقت /Temporary Employee" Value="500000" />
                            <asp:ListItem Selected="False" Text="مؤظف دائم  /Permanent Employee" Value="100000" />
                            <asp:ListItem Selected="false" Text="دوام جزئي/Part Time" Value="900000" />
                            <asp:ListItem Selected="false" Text="عن بعد/Remotely" Value="9900000" />
                            <asp:ListItem Selected="false" Text="موسمي/Seasonal" Value="99900000" />
                            <asp:ListItem Selected="false" Text="مقاول باطن/Subcontractor" Value="999900000" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label43" runat="server" ForeColor="Red" Text="الرقم الوظيفي :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxId" runat="server" ReadOnly="true" Width="79px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label44" runat="server" ForeColor="Red" Text=":EmployeeID"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="الأسم:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxName" autocomplete="off" runat="server" Width="213px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label16" runat="server" ForeColor="Red" Text=":Name"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label45" runat="server" ForeColor="Red" Text="الأسم بالأنجليزي:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxenglishName" runat="server" Width="213px" autocomplete="off" ></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label46" runat="server" ForeColor="Red" Text=":Name In English"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="تاريخ الميلاد:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                          <asp:textbox id="TextBoxDATE" runat="server"></asp:textbox>
<asp:Button ID="Button12" runat="server" Text="..." OnClick="Button12_Click" />
<asp:Panel id="pnlCalendar" runat="server" 

     style="POSITION: absolute">
 <asp:calendar id="Calendar1" runat="server" CellPadding="1" 

      BorderColor="#3366CC" Font-Names="Verdana" Font-Size="8pt" 

      Height="10px" ForeColor="#003399" DayNameFormat="Shortest" 

      Width="10px" BackColor="White" BorderWidth="1px" OnSelectionChanged="Calendar1_SelectionChanged">
  <TodayDayStyle ForeColor="White" BackColor="#99CCCC"></TodayDayStyle>
  <SelectorStyle BackColor="#99CCCC" ForeColor="#336666"></SelectorStyle>
  <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF"></NextPrevStyle>
  <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px">
  </DayHeaderStyle>
  <SelectedDayStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999">
  </SelectedDayStyle>
  <TitleStyle Font-Bold="True" BorderColor="#3366CC" BackColor="#003399" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px">
  </TitleStyle>
  <WeekendDayStyle BackColor="#CCCCFF"></WeekendDayStyle>
  <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>
 </asp:calendar>
</asp:Panel>
                        </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label17" runat="server" ForeColor="Red" Text=":Date Of Birth"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1"><%--<asp:Label ID="Label12" runat="server" ForeColor="Red" Text="DayBook"></asp:Label>--%>
                        <asp:Label ID="Label18" runat="server" ForeColor="Red" Text="السن:"></asp:Label>
                    </td>
                    <td class="auto-style1"><%-- <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="JV" Value="111" Selected="False" />
                             <asp:ListItem Text="pv" Value="111"  Selected="False" />
                        </asp:DropDownList>--%>
                        <asp:TextBox ID="TextBoxage" autocomplete="off" runat="server" Width="54px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label19" runat="server" ForeColor="Red" Text=":Age"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1"><%-- <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="Account Group:"></asp:Label>--%>
                        <asp:Label ID="Label20" runat="server" ForeColor="Red" Text="النوع-الجنس:"></asp:Label>
                    </td>
                    <td class="auto-style1"><%--  <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList>--%>
                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                             <asp:ListItem Text="MALE-ذكر" Value="ذكر" Selected="True" />
                            <asp:ListItem Text="Female-انثي" Value="أنثي" Selected="False" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label21" runat="server" ForeColor="Red" Text=":Gender"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label22" runat="server" ForeColor="Red" Text="الجنسية:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxphonenationality" autocomplete="off" runat="server" Width="125px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label23" runat="server" ForeColor="Red" Text=":Nationality"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label24" runat="server" ForeColor="Red" Text="الحالة الاجتماعية:"></asp:Label>
                    </td>
                    <td class="auto-style1"> <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                             <asp:ListItem Text="Married-متزوج" Value="متزوج" Selected="True" />
                            <asp:ListItem Text="Single-اعزب" Value="أعزب" Selected="False" />
                         <asp:ListItem Text="Engaged-مخطوب" Value="مخطوب" Selected="False" />
                        </asp:DropDownList></td>
                    <td class="auto-style1">
                        <asp:Label ID="Label25" runat="server" ForeColor="Red" Text=":Social Status"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label27" runat="server" ForeColor="Red" Text="عدد المرافقين:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxdebendent" autocomplete="off" runat="server" Width="54px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label28" runat="server" ForeColor="Red" Text=":No of Dependents"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label29" runat="server" ForeColor="Red" Text="عنوان الأصل:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxhome" runat="server" TextMode="MultiLine" Width="213px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label30" runat="server" ForeColor="Red" Text=":The Original Address"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label31" runat="server" ForeColor="Red" Text="عنوان البلد الحالي :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxcurrent" runat="server" TextMode="MultiLine" Width="213px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label32" runat="server" ForeColor="Red" Text=":Current Country Address"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label33" runat="server" ForeColor="Red" Text="الجوال :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxphone" autocomplete="off" runat="server" Width="153px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label34" runat="server" ForeColor="Red" Text=":Phone"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label35" runat="server" ForeColor="Red" Text="البريد الالكتروني  :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxphoneemai" autocomplete="off" runat="server" Width="153px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label36" runat="server" ForeColor="Red" Text=":E-Mail"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style2">
                        <asp:Label ID="Label37" runat="server" ForeColor="Red" Text="حالة التائشيرة  :"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxphonevisa" autocomplete="off" runat="server" Width="125px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label38" runat="server" ForeColor="Red" Text=":Visa Status"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label39" runat="server" ForeColor="Red" Text="رخصة القيادة  :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxphoneemai0" autocomplete="off" runat="server" Width="125px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label40" runat="server" ForeColor="Red" Text=":Driving License"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label41" runat="server" ForeColor="Red" Text="السيارة  :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxphonecar" autocomplete="off" runat="server" TextMode="MultiLine" Width="125px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label42" runat="server" ForeColor="Red" Text=":Car"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label9" runat="server" ForeColor="#3399FF"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="تسجيل البيانات/Save" />
                    </td>
                    <td class="auto-style1">
                        <asp:HyperLink ID="HyperLink1"  NavigateUrl="../../Hr/PL/EmployeeDependent.aspx" Target="_blank"  runat="server">تسجيل مرافق /Add Dependant</asp:HyperLink>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View2" runat="server">

            <table align="center" cellspacing="4" dir="rtl">
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label47" runat="server" ForeColor="Red" Text="الفرع:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlcompch0" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="cCompName" DataValueField="cCompany" OnSelectedIndexChanged="ddlcompch0_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="- Select a branche -تحديد الفرع" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label48" runat="server" ForeColor="Red" Text=":Company"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox6" runat="server" placeholder="بحث بالاسم " ></asp:TextBox>
                        <asp:DropDownList ID="DropDownList13" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                             <asp:ListItem Selected="False" Text="- Select an employee -تحديد موظف" />
                        </asp:DropDownList>
                         <br />
        <p id="para3"></p>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label49" runat="server" ForeColor="Red" Text="رقم الشركة بمكتب العمل  :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxIdcompany" runat="server"  autocomplete="off" Width="79px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label50" runat="server" ForeColor="Red" Text=":Company number in the labor office:"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label51" runat="server" ForeColor="Red" Text="المهنة بالاقامة :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxjobtitleiniqama" runat="server" autocomplete="off" Width="213px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label52" runat="server" ForeColor="Red" Text=":Job Title In Iqama"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label53" runat="server" ForeColor="Red" Text="الوظيفة الفعلية :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxjobactual" runat="server" autocomplete="off" Width="213px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label54" runat="server" ForeColor="Red" Text=":The actual job"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label83" runat="server" ForeColor="Red" Text="مهنة اضافية :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxextracareer" runat="server" autocomplete="off" Width="213px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label84" runat="server" ForeColor="Red" Text=":Extra career"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label85" runat="server" ForeColor="Red" Text="الادارة :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList7" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                            <asp:ListItem Text="تحديد الادارة " Value="000" Selected="True" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label86" runat="server" ForeColor="Red" Text=":Management"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label87" runat="server" ForeColor="Red" Text="القسم :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList8" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="تحديد القسم " Value="000" Selected="True" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label88" runat="server" ForeColor="Red" Text=":Department/Project"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label89" runat="server" ForeColor="Red" Text="المدير المباشر  :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox1" runat="server" autocomplete="off"  placeholder="بحث ب الاسم" ></asp:TextBox>
                         <asp:DropDownList ID="DropDownList9" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="اختيار المدير المباشر  " Value="000" Selected="True" />
                        </asp:DropDownList>
                       
                         <br />
        <p id="para"></p>
        
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label90" runat="server" ForeColor="Red" Text=":Direct Manager"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label91" runat="server" ForeColor="Red" Text="رئيس القسم :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                       <asp:TextBox ID="TextBox2" autocomplete="off"  runat="server" placeholder="بحث ب الاسم " ></asp:TextBox>
                         <asp:DropDownList ID="DropDownList10" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                             <asp:ListItem Text="اختيار رئيس القسم  " Value="000" Selected="True" />

                        </asp:DropDownList>
                        
                         <br />
        <p id="para1"></p>
        
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label92" runat="server" ForeColor="Red" Text=":Head Of Department"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label93" runat="server" ForeColor="Red" Text="مدير الادارة :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox5" autocomplete="off"  runat="server" placeholder="بحث ب الاسم"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList11" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="اختيار مدير الادارة   " Value="000" Selected="True" />
                        </asp:DropDownList>
                        
                           <br />
        <p id="para2"></p>
       
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label94" runat="server" ForeColor="Red" Text=":Manager Director"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label95" runat="server" ForeColor="Red" Text="نوع العقد :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList12" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                       <asp:ListItem Text="اختيار نوع العقد" Value="000" Selected="false" />
                                 <asp:ListItem Text="عقد دائم" Value="001" Selected="false" />
                            <asp:ListItem Text="عقد مؤقت" Value="002" Selected="false" />
                              <asp:ListItem Text="عقد عمل عن بعد" Value="003" Selected="false" />

                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label96" runat="server" ForeColor="Red" Text=":Contract Type:"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label55" runat="server" ForeColor="Red" Text="تاريخ بداية العقد:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxDATE0" runat="server"></asp:TextBox>
                        <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="..." />
                        <asp:Panel ID="pnlCalendar0" runat="server" style="POSITION: absolute">
                            <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar2_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                        </asp:Panel>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label56" runat="server" ForeColor="Red" Text=":Date Of StartingContract"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1"><%--<asp:Label ID="Label12" runat="server" ForeColor="Red" Text="DayBook"></asp:Label>--%>
                        <asp:Label ID="Label57" runat="server" ForeColor="Red" Text="مدة العقد :"></asp:Label>
                    </td>
                    <td class="auto-style1"><%-- <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="JV" Value="111" Selected="False" />
                             <asp:ListItem Text="pv" Value="111"  Selected="False" />
                        </asp:DropDownList>--%>
                        <asp:TextBox ID="TextBoxdurationcontract" runat="server" autocomplete="off" Width="54px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label58" runat="server" ForeColor="Red" Text=":Duration of the contract"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label97" runat="server" ForeColor="Red" Text="تاريخ مياشرة العمل  :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:Button ID="Button15" runat="server" OnClick="Button15_Click" Text="..." />
                        <asp:Panel ID="Panel1" runat="server" style="POSITION: absolute">
                            <asp:Calendar ID="Calendar3" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar3_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                        </asp:Panel>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label98" runat="server" ForeColor="Red" Text=":Date of direct action"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1"><%-- <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="Account Group:"></asp:Label>--%>
                        <asp:Label ID="Label59" runat="server" ForeColor="Red" Text="السكن بالشركة اذا وجد :"></asp:Label>
                    </td>
                    <td class="auto-style1"><%--  <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList>--%>
                        <asp:TextBox ID="TextBoxhousecompany" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label60" runat="server" ForeColor="Red" Text=":Housing the company, if any"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label61" runat="server" ForeColor="Red" Text="تفاصيل السكن:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxhousedetails" runat="server" autocomplete="off" Width="125px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label62" runat="server" ForeColor="Red" Text=":HouseDetails "></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label63" runat="server" ForeColor="Red" Text="نوع التائمين :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList6" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            <asp:ListItem Text="اختيار نوع التائمين " Value="888" Selected="false" />
                                 <asp:ListItem Text="vip  " Value="000" Selected="false" />
                            <asp:ListItem Text="b " Value="001" Selected="false" />
                              <asp:ListItem Text="c " Value="002" Selected="false" />
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label64" runat="server" ForeColor="Red" Text=":Insurance Type"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label65" runat="server" ForeColor="Red" Text="رقم التائمين:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxinsuranceid" runat="server" autocomplete="off" Width="99px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label66" runat="server" ForeColor="Red" Text=":InsuranceID"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label79" runat="server" ForeColor="Red" Text="الخبرات السابقة  :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxEXPRIENCE" runat="server" autocomplete="off" TextMode="MultiLine" Width="181px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label80" runat="server" ForeColor="Red" Text=":Exprience"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td class="auto-style1">
                        <asp:Label ID="Label99" runat="server" ForeColor="Red" Text="الخبرات السابقة2  :"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBoxEXPRIENCE2" runat="server" autocomplete="off" TextMode="MultiLine" Width="181px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label100" runat="server" ForeColor="Red" Text=":Exprience2"></asp:Label>
                    </td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label81" runat="server" ForeColor="Lime"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Button ID="Button14" runat="server" OnClick="Button14_Click" Text="تسجيل البيانات/Save" />
                    </td>
                    <td class="auto-style1">
                        &nbsp;</td>
                </tr>
                <tr style="page-break-inside: avoid">
                    <td>
                        <asp:Label ID="Label82" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View3" runat="server">

            <table align="center" class="auto-style3" dir="rtl">
                <tr>
                    <td>
                        <asp:Label ID="Label125" runat="server" ForeColor="Red" Text="الشركة او الفرع:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList22" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList22_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="تحديد الفرع او الشركة "></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label126" runat="server" ForeColor="Red" Text=":Company"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label127" runat="server" ForeColor="Red" Text="الموظف:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" placeholder="ابحث بالاسم"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList23" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList>
                        <br />
                        <p id="para6">
                        </p>
                    </td>
                  <td>
                      <asp:Label ID="Label131" runat="server" ForeColor="Red" Text=":Employee"></asp:Label>
                    </td>
                        
                        
                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label129" runat="server" ForeColor="Red" Text="درجة التعليم:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList24" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Selected="False" Text="حدد مستوي التعليم " Value="00"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="حاصل علي دكتوراه" Value="P.H.D"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="حاصل علي ماجستير" Value="Holds a master's degree"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="فوق الجامعي " Value="Above university"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="جامعي " Value="a university graduate"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="خريج ثانوي" Value="High school graduate"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="بكالوريوس" Value="Bachelor"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="متوسط" Value="Average"></asp:ListItem>
                             <asp:ListItem Selected="False" Text="معهد فني" Value="technical Institute"></asp:ListItem>
                             <asp:ListItem Selected="False" Text="لايوجد" Value="There is no"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label130" runat="server" ForeColor="Red" Text=":Education"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label132" runat="server" ForeColor="Red" Text="أسم الشهادة :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxcERTIFCATE" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label133" runat="server" ForeColor="Red" Text=":Certificate "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label134" runat="server" ForeColor="Red" Text="جهة اصدار الشهادة  :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxcERTIFCATEISSUE" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label135" runat="server" ForeColor="Red" Text=":Certificate  Issue place"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label136" runat="server" ForeColor="Red" Text="معلومات اضافية  :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxcadd" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label137" runat="server" ForeColor="Red" Text=":Other"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label138" runat="server" ForeColor="#3399FF"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button18" runat="server" OnClick="Button18_Click" Text="Add/اضف" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View4" runat="server">

            <table align="center" class="auto-style3" dir="rtl">
                <tr>
                    <td>
                        <asp:Label ID="Label103" runat="server" ForeColor="Red" Text="الشركة او الفرع:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList15" runat="server" OnSelectedIndexChanged="DropDownList15_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                         <asp:ListItem Text="تحديد الفرع او الشركة " Selected="False"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label104" runat="server" ForeColor="Red" Text=":Company"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label105" runat="server" ForeColor="Red" Text="الموظف:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox7" placeholder="ابحث بالاسم" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList16" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            
                        </asp:DropDownList>
                         <br />
        <p id="para5"></p>
                    </td>
                    <td>
                        <asp:Label ID="Label106" runat="server" ForeColor="Red" Text=":Employee"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #3399FF">&nbsp;</td>
                    <td style="background-color: #3399FF">
                        <asp:Label ID="Label107" runat="server" ForeColor="Red" Text="Add Benfits To Employee "></asp:Label>
                    </td>
                    <td style="background-color: #3399FF">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label117" runat="server" ForeColor="Red" Text="اختيار البدل:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList20" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="اختيار البدل" Selected="False"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label118" runat="server" ForeColor="Red" Text=":Select befit or deduction"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label119" runat="server" ForeColor="Red" Text="القيمة :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxamount" AutoComplete="off" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label120" runat="server" ForeColor="Red" Text=":Amount"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label121" runat="server" ForeColor="Red" Text="شهري/اسبوعي/يومي :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList21" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="يومي/Daily" Value="101"></asp:ListItem>
                            <asp:ListItem Text="اسبوعي/weekly" Value="102"></asp:ListItem>
                            <asp:ListItem Text="شهري/Monthly" Value="103"></asp:ListItem>

                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label122" runat="server" ForeColor="Red" Text=":shedule"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label123" runat="server" ForeColor="#3399FF"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button17" runat="server" Text="Add/اضف " OnClick="Button17_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="background-color: #3399FF">&nbsp;</td>
                    <td style="background-color: #3399FF">
                        <asp:Label ID="Label108" runat="server" ForeColor="Red" Text="Add New Benfits"></asp:Label>
                    </td>
                    <td style="background-color: #3399FF">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label109" runat="server" ForeColor="Red" Text="أسم البدل :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxbenfit" AutoComplete="off" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label110" runat="server" ForeColor="Red" Text=":Benfit or Dedction"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label111" runat="server" ForeColor="Red" Text="محموعة الحساب :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList17" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="اختر مجموعة الحساب " Selected="False"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label112" runat="server" ForeColor="Red" Text=":Account Group"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label113" runat="server" ForeColor="Red" Text=" الحساب :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList18" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Selected="False" Text="اختر الحساب "></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label114" runat="server" ForeColor="Red" Text=":Account "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label115" runat="server" ForeColor="Red" Text=" نوع البدل   :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList19" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="benfit/بدل" Value="100" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="deduction/خصم" Selected="False" Value="200"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label116" runat="server" ForeColor="Red" Text=":Type"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label124" runat="server" ForeColor="#3399FF"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button16" runat="server" Text="Add/اضف" OnClick="Button16_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="background-color: #3399FF">&nbsp;</td>
                    <td style="background-color: #3399FF">
                        <asp:Label ID="Label156" runat="server" ForeColor="Red" Text=" Payroll Grade Master"></asp:Label>
                    </td>
                    <td style="background-color: #3399FF">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label157" runat="server" ForeColor="Red" Text="المستوي :"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropDownList31" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList31_SelectedIndexChanged">
                            <asp:ListItem Text="اختر المستوي " Value="000" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="11" Value="11" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="12" Value="12" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="13" Value="13" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="14" Value="14" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="15" Value="15" Selected="false"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="Label158" runat="server" ForeColor="Red" Text=":Level"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label159" runat="server" ForeColor="Red" Text="الفئة :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList32" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList32_SelectedIndexChanged">
                        <asp:ListItem Text="اختر الفئة " Value="000" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="A" Value="A" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="B" Value="B" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="C" Value="C" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="D" Value="D" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="F" Value="F" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="G" Value="G" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="H" Value="H" Selected="False"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label160" runat="server" ForeColor="Red" Text=":Class"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label161" runat="server" ForeColor="Red" Text="الدرجة :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList33" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList33_SelectedIndexChanged1">
                        <asp:ListItem Text="اختر" Value="000" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Minimum" Value="Minimum" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="Average" Value="Average" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="Maximum" Value="Maximum" Selected="False"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label162" runat="server" ForeColor="Red" Text=":Grade"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label163" runat="server" ForeColor="Red" Text="البدل :"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropDownList34" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList34_SelectedIndexChanged">
                       <asp:ListItem Text="تحديد البدل " Value="000" Selected="True"></asp:ListItem>

                             </asp:DropDownList>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="Label164" runat="server" ForeColor="Red" Text=":Benfit"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label165" runat="server" ForeColor="Red" Text="المبلغ :"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox27" Text="0.0" AutoComplete="off" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="Label166" runat="server" ForeColor="Red" Text=":Amount"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label167" runat="server" ForeColor="#3399FF"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="Button27" runat="server" OnClick="Button27_Click" Text="Add/اضف" />
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View5" runat="server">

            <table align="center" class="auto-style3" dir="rtl">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label139" runat="server" ForeColor="Red" Text="الشركة او الفرع:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList25" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList25_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="حدد الشركة " Value="0000"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label140" runat="server" ForeColor="Red" Text=":Company"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label141" runat="server" ForeColor="Red" Text="الموظف:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox9" placeholder="بحث بالأسم" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList26" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList>
                        <br />
                        <p id="para7"></p>
                    </td>
                    <td>
                        <asp:Label ID="Label142" runat="server" ForeColor="Red" Text=":Employee"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label143" runat="server" ForeColor="Red" Text="نوع الوثيقة :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList27" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList27_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="حدد نوع الوثيقة  " Value="00"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="أقامة" Value="أقامة"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="هوية وطنية" Value="هوية وطنية"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="رقم الحدود" Value="رقم الحدود"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="جواز السفر" Value="جواز السفر"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="التائمينات الأجتماعية" Value="التائمينات الأجتماعية"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="مكتب العمل" Value="مكتب العمل"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="التائمين الصحي" Value="التائمين الصحي"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="اشتراكات الهئية" Value="اشتراكات الهئية"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="رخصة القيادة" Value="رخصة القيادة"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label144" runat="server" ForeColor="Red" Text=":Documentry Type"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Panel ID="Panel2" runat="server" style="POSITION: absolute">
                            <table><tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="تاريخ الاصدار"></asp:Label>

                                    <asp:TextBox ID="txtissuedate" runat="server" AutoComplete="off"></asp:TextBox>
                                    
                                    <asp:Button ID="Button7" runat="server" Text="--" OnClick="Button7_Click" />
                                    <asp:Panel ID="Panel3" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar4" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar4_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="تاريخ الأنتهاء"></asp:Label>
                                    <asp:TextBox ID="TextBox10" runat="server" AutoComplete="off"></asp:TextBox>
                                    
                                    <asp:Button ID="Button9" runat="server" Text="--" OnClick="Button9_Click" />
                                    <asp:Panel ID="Panel4" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar5" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar5_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>

                                </td>
                                <td>
                                    <asp:TextBox ID="txtidentityid" placeholder="ضع الرقم " runat="server" AutoComplete="off" ></asp:TextBox>
                                    <asp:Button ID="Button19" runat="server" Text="Add/اضافة" OnClick="Button19_Click" />
                                </td>
                                   </tr>
                            
                                </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel5" runat="server" style="POSITION: absolute">
                            <table><tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text="تاريخ الألتحاق"></asp:Label>
                                    <asp:TextBox ID="TextBox11" runat="server" AutoComplete="off"></asp:TextBox>
                                    <asp:Button ID="Button10" runat="server" Text=".." OnClick="Button10_Click" />
                                    <asp:Panel ID="Panel6" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar6" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar6_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="الراتب الاساسي للموظف "></asp:Label>
                                    <asp:TextBox ID="TextBox12" placeholder="" runat="server" AutoComplete="off"></asp:TextBox>
                                    </td>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text="بدل السكن للموظف  "></asp:Label>
                                    <asp:TextBox ID="TextBox14" runat="server" AutoComplete="off"></asp:TextBox>
                                    </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList28"  runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList28_SelectedIndexChanged">
                                        <asp:ListItem Selected="TRUE" Text="حددالموظف مواطن ام مقيم " Value="00"></asp:ListItem>
                                        <asp:ListItem Selected="False" Text="مواطن" Value="مواطن"></asp:ListItem>
                                        <asp:ListItem Selected="False" Text="مقيم" Value="مقيم"></asp:ListItem>

                                    </asp:DropDownList>


                                    
                                   

                                </td>
                                 <td>
                                   
                                    <asp:Button ID="Button21" runat="server" Text="Add/تسجيل" OnClick="Button21_Click" />
                                </td>
                                <td>
                                     <asp:Label ID="Label11" runat="server" Text="" ForeColor="BlueViolet"></asp:Label>
                                    <asp:Label ID="Label12" runat="server" Text="" ForeColor="Green"></asp:Label>
                                    <asp:Label ID="Label13" runat="server" Text="" ForeColor="red"></asp:Label>
                                    <asp:Label ID="Label14" runat="server" Text="" ForeColor="red"></asp:Label>
                                </td>
                               
                                   </tr>
                            
                                </table>
                        </asp:Panel>
                        
                        <asp:Panel ID="Panel7" runat="server" style="POSITION: absolute">
                            <table><tr>
                                <td>
                                    <asp:Label ID="Label15" runat="server" Text="تاريخ التجديد"></asp:Label>
                                    <asp:TextBox ID="TextBox13" runat="server" AutoComplete="off"></asp:TextBox>
                                    <asp:Button ID="Button20" runat="server" Text=".." OnClick="Button20_Click" />
                                    <asp:Panel ID="Panel8" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar7" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar7_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>
                                </td>
                                <td>
                                    <asp:Label ID="Label67" runat="server" Text="رسوم رخصة العمل "></asp:Label>
                                    <asp:TextBox ID="TextBox15" placeholder="" Width="70px" Text="9650" runat="server" AutoComplete="off"></asp:TextBox>
                                    </td>
                                <td>
                                    <asp:Label ID="Label68" runat="server" Text="رسوم الجوازات"></asp:Label>
                                    <asp:TextBox ID="TextBox16" Text="650" Width="70px" runat="server" AutoComplete="off"></asp:TextBox>
                                    </td>
                                <td>
                                    <asp:Label ID="Label73" runat="server" Text="غرامات "></asp:Label>
                                    <asp:TextBox ID="TextBox18" Text="0.0" placeholder="غرامات" Width="60px" runat="server" AutoComplete="off"></asp:TextBox>
                                    </td>
                                <td>
                                    
                                    <asp:TextBox ID="TextBox17" placeholder="رقم العامل بمكتب العمل "  runat="server" AutoComplete="off" Width="85px"></asp:TextBox>
                                    </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList29"  runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList29_SelectedIndexChanged">
                                        <asp:ListItem Selected="TRUE" Text="حددالموظف مدة التجديد " Value="00"></asp:ListItem>
                                        <asp:ListItem Selected="False" Text="عام" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="False" Text="عامين" Value="2"></asp:ListItem>
                                       

                                    </asp:DropDownList>


                                    
                                   

                                </td>
                                 <td>
                                   
                                    <asp:Button ID="Button22" runat="server" Text="Add/تسجيل" OnClick="Button22_Click" />
                                </td>
                                <td>
                                     <asp:Label ID="Label69" runat="server" Text="" ForeColor="BlueViolet"></asp:Label>
                                    <asp:Label ID="Label70" runat="server" Text="" ForeColor="Green"></asp:Label>
                                    <asp:Label ID="Label71" runat="server" Text="" ForeColor="red"></asp:Label>
                                    <asp:Label ID="Label72" runat="server" Text="" ForeColor="red"></asp:Label>
                                </td>
                               
                                   </tr>
                            
                                </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel9" runat="server" style="POSITION: absolute">
                            <table><tr>
                                <td>
                                    <asp:Label ID="Label74" runat="server" Text="تاريخ الاشتراك"></asp:Label>
                                    <asp:TextBox ID="TextBox19" runat="server" AutoComplete="off"></asp:TextBox>
                                    <asp:Button ID="Button23" runat="server" Text=".." OnClick="Button23_Click" />
                                    <asp:Panel ID="Panel10" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar8" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar8_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>
                                </td>
                                <td>
                                    <asp:Label ID="Label75" runat="server" Text="رقم التائمين "></asp:Label>
                                    <asp:TextBox ID="TextBox20" placeholder="" Width="120px"  runat="server" AutoComplete="off"></asp:TextBox>
                                    </td>
                                <td>
                                    <asp:Label ID="Label76" runat="server" Text="الفئة"></asp:Label>
                                    <asp:TextBox ID="TextBox21"  Width="90px" runat="server" AutoComplete="off" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                <td>
                                    <asp:Label ID="Label77" runat="server" Text="القيمة"></asp:Label>
                                    <asp:TextBox ID="TextBox22" text="0.0" placeholder="القيمة" Width="60px" runat="server" AutoComplete="off"></asp:TextBox>
                                    </td>
                                <td>
                                    
                                    
                                    </td>
                                <td>
                                    


                                    
                                   

                                </td>
                                 <td>
                                   
                                    <asp:Button ID="Button24" runat="server" Text="Add/تسجيل" OnClick="Button24_Click" />
                                </td>
                                <td>
                                     <asp:Label ID="Label78" runat="server" Text="" ForeColor="BlueViolet"></asp:Label>
                                    <asp:Label ID="Label128" runat="server" Text="" ForeColor="Green"></asp:Label>
                                    <asp:Label ID="Label146" runat="server" Text="" ForeColor="red"></asp:Label>
                                    <asp:Label ID="Label147" runat="server" Text="" ForeColor="red"></asp:Label>
                                </td>
                               
                                   </tr>
                            
                                </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel11" runat="server" style="POSITION: absolute">
                            <table><tr>
                                <td>
                                    <asp:Label ID="Label148" runat="server" Text="تاريخ الاشتراك"></asp:Label>
                                    <asp:TextBox ID="TextBox23" runat="server" AutoComplete="off"></asp:TextBox>
                                    <asp:Button ID="Button25" runat="server" Text=".." OnClick="Button25_Click" />
                                    <asp:Panel ID="Panel12" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar9" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar9_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>
                                </td>
                                <td>
                                    <asp:Label ID="Label149" runat="server" Text="رقم العضوية  "></asp:Label>
                                    <asp:TextBox ID="TextBox24" placeholder="" Width="120px"  runat="server" AutoComplete="off"></asp:TextBox>
                                    </td>
                                <td>
                                    
                                    </td>
                                <td>
                                    <asp:Label ID="Label151" runat="server" Text="القيمة"></asp:Label>
                                    <asp:TextBox ID="TextBox26" text="0.0" placeholder="القيمة" Width="60px" runat="server" AutoComplete="off"></asp:TextBox>
                                    </td>
                                <td>
                                    
                                    
                                    </td>
                                <td>
                                    


                                    
                                   <asp:DropDownList ID="DropDownList30"  runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList30_SelectedIndexChanged">
                                        <asp:ListItem Selected="TRUE" Text="حدد جهة الاشتراك " Value="00"></asp:ListItem>
                                        <asp:ListItem Selected="False" Text="هئية المهندسين " Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="False" Text="هئية المحاسبين " Value="2"></asp:ListItem>
                                       

                                    </asp:DropDownList>

                                </td>
                                 <td>
                                   
                                    <asp:Button ID="Button26" runat="server" Text="Add/تسجيل" OnClick="Button26_Click" />
                                </td>
                                <td>
                                     <asp:Label ID="Label152" runat="server" Text="" ForeColor="BlueViolet"></asp:Label>
                                    <asp:Label ID="Label153" runat="server" Text="" ForeColor="Green"></asp:Label>
                                    <asp:Label ID="Label154" runat="server" Text="" ForeColor="red"></asp:Label>
                                    <asp:Label ID="Label155" runat="server" Text="" ForeColor="red"></asp:Label>
                                </td>
                               
                                   </tr>
                            
                                </table>
                        </asp:Panel>


                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label145" runat="server" ForeColor="#3399FF"></asp:Label>
                    </td>
                    <td>
                        
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View6" runat="server">

        </asp:View>
        <asp:View ID="View7" runat="server">

        </asp:View>
        <asp:View ID="View8" runat="server">
            
            
            
            
            <div>

            
                <table align="center" class="auto-style3" dir="rtl">
                    <tr>
                        <td>اختار الفرع</td>
                        <td>
                            <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                                <asp:ListItem Selected="False" Text="- Select a branche -تحديد الفرع" />
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>اختار الموظف او ابحث عنه</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" autocomplete="off" placeholder="بحث باالأسم "></asp:TextBox>
                            <asp:DropDownList ID="DropDownList5" runat="server">
                                <asp:ListItem Selected="False" Text="- Select An Employee -اختيار الموظف " />
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="background-color: #3399FF">&nbsp;</td>
                        <td style="background-color: #3399FF">
                            <asp:Label ID="Label101" runat="server" ForeColor="Red" Text="Upload  "></asp:Label>
                        </td>
                        <td style="background-color: #3399FF">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:FileUpload ID="fileUpload1" runat="server" />
                            <asp:Button ID="btnUpload" runat="server" onclick="btnUpload_Click" Text="Upload Image" />
                        </td>
                        <td><asp:FileUpload ID="fileUpload2" runat="server" />
                            <asp:Button ID="btnUploadpassport" runat="server" onclick="btnUploadpassport_Click" Text="Upload PassportImage" /></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:FileUpload ID="fileUpload3" runat="server" />
                            <asp:Button ID="btnUploadidentity" runat="server" onclick="btnUploadidentity_Click" Text="Upload identity" />
                        </td>
                        <td>
                            <asp:FileUpload ID="fileUpload4" runat="server" />
                            <asp:Button ID="btnUploadcontract" runat="server" onclick="btnUploadcontract_Click" Text="Upload contract" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:FileUpload ID="fileUpload5" runat="server" />
                            <asp:Button ID="btnUploadcv" runat="server" onclick="btnUploadcv_Click" Text="Upload cv" />
                        </td>
                        <td>
                            <asp:FileUpload ID="fileUpload6" runat="server" />
                            <asp:Button ID="btnUploadother" runat="server" onclick="btnUploadother_Click" Text="Upload Other" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr style:"background-color: #0066FF">
                        <td style="background-color: #3399FF">&nbsp;</td>
                        <td style="background-color: #3399FF">
                            <asp:Label ID="Label102" runat="server" ForeColor="Red" Text="Download / "></asp:Label>
                        </td>
                        <td style="background-color: #3399FF">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:DropDownList ID="DropDownList14" runat="server" OnSelectedIndexChanged="DropDownList14_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                                <asp:ListItem Selected="False" Text="Select DownloadType -اختار نوع التحميل "  Value="100"/>
                                <asp:ListItem Selected="False" Text=" DownloadPhoto -تحميل صورة للموظف "  Value="EmpImage"/>
                                 <asp:ListItem Selected="False" Text=" DownloadPassport -تحميل جواز سفر  للموظف "  Value="EmpPassportImage"/>
                                 <asp:ListItem Selected="False" Text=" DownloadIdentity -تحميل الاقامه للموظف "  Value="EmpIdentityImage"/>
                                <asp:ListItem Selected="False" Text=" DownloadContract -تحميل العقد للموظف "  Value="EmpContractImage"/>
                                <asp:ListItem Selected="False" Text=" DownloadResume -تحميل السيرة الذاتية للموظف "  Value="EmpCvImage"/>
                                <asp:ListItem Selected="False" Text=" DownloadOther -تحميل ملفات اخري  للموظف "  Value="EmpOtherImage"/>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="false" CssClass="Gridview" DataKeyNames="cPath">
                                <HeaderStyle BackColor="#df5015" />
                                <Columns>
                                    <asp:BoundField DataField="cEmpId" HeaderText="Id" />
                                    <asp:BoundField DataField="cName" HeaderText="FileName" />
                                    <asp:TemplateField HeaderText="FilePath">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDownload" runat="server" OnClick="lnkDownload_Click" Text="Download/تحميل"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
             <br />
                </div>
            <div>
                <br />
</div>
<div>
</div>

        </asp:View>
        <asp:View ID="View9" runat="server">

            <table align="center" class="auto-style3" dir="rtl">
                <tr>
                    <td>
                        <asp:Label ID="Label168" runat="server" Text="الشركة او الفرع" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList35" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList35_SelectedIndexChanged" AppendDataBoundItems="True">
                            <asp:ListItem Text="تحديد" Value="00" Selected="false"></asp:ListItem>

                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label169" runat="server" Text="Company" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label170" runat="server" Text="الموظف " ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox25" AutoComplete="Off" placeholder="بحث باالأسم " runat="server"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList36" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList36_SelectedIndexChanged">
                            <asp:ListItem Text="تحديد" Value="00" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <p id="para8"></p>
                    </td>
                    <td>
                        <asp:Label ID="Label171" runat="server" Text="Employee" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label172" runat="server" ForeColor="Red" Text="الرصيد:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox28" AutoComplete="off" Text="30"  runat="server" Width="52px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label173" runat="server" ForeColor="Red" Text="Balance"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label174" runat="server" ForeColor="Red" Text="بداية العقد :"></asp:Label>
                    </td>
                    <td>
                                    <asp:TextBox ID="TextBox29" runat="server" AutoComplete="off"></asp:TextBox>
                                    <asp:Button ID="Button29" runat="server" Text=".." OnClick="Button29_Click" />
                                    <asp:Panel ID="Panel13" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar10" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar10_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="Label175" runat="server" ForeColor="Red" Text="Contract Start"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label176" runat="server" ForeColor="Red" Text="نهاية العقد :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox30" runat="server" AutoComplete="off"></asp:TextBox>
                                    <asp:Button ID="Button30" runat="server" Text=".." OnClick="Button30_Click" />
                                    <asp:Panel ID="Panel14" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar11" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar11_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="Label177" runat="server" ForeColor="Red" Text="Contract End"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label178" runat="server" ForeColor="Red" Text="تاريخ أستحقاق الأجازة :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox31" runat="server" AutoComplete="off"></asp:TextBox>
                                    <asp:Button ID="Button31" runat="server" Text=".." OnClick="Button31_Click" />
                                    <asp:Panel ID="Panel15" runat="server" style="POSITION: absolute">
                                    <asp:Calendar ID="Calendar12" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" OnSelectionChanged="Calendar12_SelectionChanged" Width="10px">
                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                <WeekendDayStyle BackColor="#CCCCFF" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                            </asp:Calendar>
                                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="Label179" runat="server" ForeColor="Red" Text="Leave due date"></asp:Label>
                    </td>
                </tr>
				<tr>
				<td>
                        <asp:Label ID="Label1799" runat="server" ForeColor="Red" Text="تاريخ اخر عودة من الأجازة "></asp:Label>
                    </td>
					<td>
                         <asp:TextBox ID="TextBox5555"  AutoComplete="Off" placeholder="9/29/2020" runat="server"></asp:TextBox>
                    </td>
					<td>
                        <asp:Label ID="Label1798" runat="server" ForeColor="Red" Text="Last Return Date"></asp:Label>
                    </td>
				
				</tr>
                <tr>
                    <td>
                        <asp:Label ID="Label180" runat="server" ForeColor="Red" Text="مدة تجديد العقد  :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList37" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Text="تجديد العقد  " Value="00" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="لمدة عام " Value="1" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="لمدة عامين " Value="2" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="لمدة 3 اعوام" Value="3" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="لمدة 4 اعوام" Value="4" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="لمدة 5 اعوام" Value="5" Selected="False"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label181" runat="server" ForeColor="Red" Text="The period of contract renewal"></asp:Label>
                    </td>
                </tr>
				 <tr>
                    <td>
                        <asp:Label ID="Label1171" runat="server" Text="الموظف البديل " ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox55" AutoComplete="Off" placeholder="بحث باالأسم " runat="server"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList666" runat="server" AppendDataBoundItems="True" AutoPostBack="True" >
                            <asp:ListItem Text="تحديد" Value="00" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <p id="para88"></p>
                    </td>
                    <td>
                        <asp:Label ID="Label371" runat="server" Text="Employee" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label182" runat="server" ForeColor="#3399FF"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button28" runat="server" Text="Add/أضف" OnClick="Button28_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View10" runat="server">

        </asp:View>
    </asp:MultiView>
     <script src="../../assets/jQueryv3.3.1.js"></script>
    <script type="text/javascript">
        $(function() {
            var $txt = $('input[id$=TextBox1]');
            var $ddl = $('select[id$=DropDownList9]');
            var $items = $('select[id$=DropDownList9] option');
 
            $txt.keyup(function() {
                searchDdl($txt.val());
            });
 
            function searchDdl(item) {
                $ddl.empty();
                var exp = new RegExp(item, "i");
                var arr = $.grep($items,
                    function(n) {
                        return exp.test($(n).text());
                    });
 
                if (arr.length > 0) {
                    countItemsFound(arr.length);
                    $.each(arr, function() {
                        $ddl.append(this);
                        $ddl.get(0).selectedIndex = 0;
                    }
                    );
                }
                else {
                    countItemsFound(arr.length);
                    $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                }
            }
 
            function countItemsFound(num) {
                $("#para").empty();
                if ($txt.val().length) {
                    $("#para").html(num + " items found");
                }
 
            }
        });
        </script>
     <script type="text/javascript">
         $(function () {
             var $txt = $('input[id$=TextBox2]');
             var $ddl = $('select[id$=DropDownList10]');
             var $items = $('select[id$=DropDownList10] option');

             $txt.keyup(function () {
                 searchDdl($txt.val());
             });

             function searchDdl(item) {
                 $ddl.empty();
                 var exp = new RegExp(item, "i");
                 var arr = $.grep($items,
                     function (n) {
                         return exp.test($(n).text());
                     });

                 if (arr.length > 0) {
                     countItemsFound(arr.length);
                     $.each(arr, function () {
                         $ddl.append(this);
                         $ddl.get(0).selectedIndex = 0;
                     }
                     );
                 }
                 else {
                     countItemsFound(arr.length);
                     $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                 }
             }

             function countItemsFound(num) {
                 $("#para1").empty();
                 if ($txt.val().length) {
                     $("#para1").html(num + " items found");
                 }

             }
         });
        </script>
		 <script type="text/javascript">
         $(function () {
             var $txt = $('input[id$=TextBox55]');
             var $ddl = $('select[id$=DropDownList1666]');
             var $items = $('select[id$=DropDownList1666] option');

             $txt.keyup(function () {
                 searchDdl($txt.val());
             });

             function searchDdl(item) {
                 $ddl.empty();
                 var exp = new RegExp(item, "i");
                 var arr = $.grep($items,
                     function (n) {
                         return exp.test($(n).text());
                     });

                 if (arr.length > 0) {
                     countItemsFound(arr.length);
                     $.each(arr, function () {
                         $ddl.append(this);
                         $ddl.get(0).selectedIndex = 0;
                     }
                     );
                 }
                 else {
                     countItemsFound(arr.length);
                     $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                 }
             }

             function countItemsFound(num) {
                 $("#para88").empty();
                 if ($txt.val().length) {
                     $("#para88").html(num + " items found");
                 }

             }
         });
        </script>
		
    <script type="text/javascript">
        $(function () {
            var $txt = $('input[id$=TextBox5]');
            var $ddl = $('select[id$=DropDownList11]');
            var $items = $('select[id$=DropDownList11] option');

            $txt.keyup(function () {
                searchDdl($txt.val());
            });

            function searchDdl(item) {
                $ddl.empty();
                var exp = new RegExp(item, "i");
                var arr = $.grep($items,
                    function (n) {
                        return exp.test($(n).text());
                    });

                if (arr.length > 0) {
                    countItemsFound(arr.length);
                    $.each(arr, function () {
                        $ddl.append(this);
                        $ddl.get(0).selectedIndex = 0;
                    }
                    );
                }
                else {
                    countItemsFound(arr.length);
                    $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                }
            }

            function countItemsFound(num) {
                $("#para2").empty();
                if ($txt.val().length) {
                    $("#para2").html(num + " items found");
                }

            }
        });
        </script>
    <script type="text/javascript">
        $(function () {
            var $txt = $('input[id$=TextBox6]');
            var $ddl = $('select[id$=DropDownList13]');
            var $items = $('select[id$=DropDownList13] option');

            $txt.keyup(function () {
                searchDdl($txt.val());
            });

            function searchDdl(item) {
                $ddl.empty();
                var exp = new RegExp(item, "i");
                var arr = $.grep($items,
                    function (n) {
                        return exp.test($(n).text());
                    });

                if (arr.length > 0) {
                    countItemsFound(arr.length);
                    $.each(arr, function () {
                        $ddl.append(this);
                        $ddl.get(0).selectedIndex = 0;
                    }
                    );
                }
                else {
                    countItemsFound(arr.length);
                    $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                }
            }

            function countItemsFound(num) {
                $("#para3").empty();
                if ($txt.val().length) {
                    $("#para3").html(num + " items found");
                }

            }
        });
        </script>
     <script type="text/javascript">
         $(function () {
             var $txt = $('input[id$=TextBox3]');
             var $ddl = $('select[id$=DropDownList5]');
             var $items = $('select[id$=DropDownList5] option');

             $txt.keyup(function () {
                 searchDdl($txt.val());
             });

             function searchDdl(item) {
                 $ddl.empty();
                 var exp = new RegExp(item, "i");
                 var arr = $.grep($items,
                     function (n) {
                         return exp.test($(n).text());
                     });

                 if (arr.length > 0) {
                     countItemsFound(arr.length);
                     $.each(arr, function () {
                         $ddl.append(this);
                         $ddl.get(0).selectedIndex = 0;
                     }
                     );
                 }
                 else {
                     countItemsFound(arr.length);
                     $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                 }
             }

             function countItemsFound(num) {
                 $("#para4").empty();
                 if ($txt.val().length) {
                     $("#para4").html(num + " items found");
                 }

             }
         });
        </script>
     <script type="text/javascript">
         $(function () {
             var $txt = $('input[id$=TextBox7]');
             var $ddl = $('select[id$=DropDownList16]');
             var $items = $('select[id$=DropDownList16] option');

             $txt.keyup(function () {
                 searchDdl($txt.val());
             });

             function searchDdl(item) {
                 $ddl.empty();
                 var exp = new RegExp(item, "i");
                 var arr = $.grep($items,
                     function (n) {
                         return exp.test($(n).text());
                     });

                 if (arr.length > 0) {
                     countItemsFound(arr.length);
                     $.each(arr, function () {
                         $ddl.append(this);
                         $ddl.get(0).selectedIndex = 0;
                     }
                     );
                 }
                 else {
                     countItemsFound(arr.length);
                     $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                 }
             }

             function countItemsFound(num) {
                 $("#para5").empty();
                 if ($txt.val().length) {
                     $("#para5").html(num + " items found");
                 }

             }
         });
        </script>
    <script type="text/javascript">
        $(function () {
            var $txt = $('input[id$=TextBox8]');
            var $ddl = $('select[id$=DropDownList23]');
            var $items = $('select[id$=DropDownList23] option');

            $txt.keyup(function () {
                searchDdl($txt.val());
            });

            function searchDdl(item) {
                $ddl.empty();
                var exp = new RegExp(item, "i");
                var arr = $.grep($items,
                    function (n) {
                        return exp.test($(n).text());
                    });

                if (arr.length > 0) {
                    countItemsFound(arr.length);
                    $.each(arr, function () {
                        $ddl.append(this);
                        $ddl.get(0).selectedIndex = 0;
                    }
                    );
                }
                else {
                    countItemsFound(arr.length);
                    $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                }
            }

            function countItemsFound(num) {
                $("#para6").empty();
                if ($txt.val().length) {
                    $("#para6").html(num + " items found");
                }

            }
        });
        </script>
     <script type="text/javascript">
         $(function () {
             var $txt = $('input[id$=TextBox9]');
             var $ddl = $('select[id$=DropDownList26]');
             var $items = $('select[id$=DropDownList26] option');

             $txt.keyup(function () {
                 searchDdl($txt.val());
             });

             function searchDdl(item) {
                 $ddl.empty();
                 var exp = new RegExp(item, "i");
                 var arr = $.grep($items,
                     function (n) {
                         return exp.test($(n).text());
                     });

                 if (arr.length > 0) {
                     countItemsFound(arr.length);
                     $.each(arr, function () {
                         $ddl.append(this);
                         $ddl.get(0).selectedIndex = 0;
                     }
                     );
                 }
                 else {
                     countItemsFound(arr.length);
                     $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                 }
             }

             function countItemsFound(num) {
                 $("#para7").empty();
                 if ($txt.val().length) {
                     $("#para7").html(num + " items found");
                 }

             }
         });
        </script>
    <script type="text/javascript">
        $(function () {
            var $txt = $('input[id$=TextBox25]');
            var $ddl = $('select[id$=DropDownList36]');
            var $items = $('select[id$=DropDownList36] option');

            $txt.keyup(function () {
                searchDdl($txt.val());
            });

            function searchDdl(item) {
                $ddl.empty();
                var exp = new RegExp(item, "i");
                var arr = $.grep($items,
                    function (n) {
                        return exp.test($(n).text());
                    });

                if (arr.length > 0) {
                    countItemsFound(arr.length);
                    $.each(arr, function () {
                        $ddl.append(this);
                        $ddl.get(0).selectedIndex = 0;
                    }
                    );
                }
                else {
                    countItemsFound(arr.length);
                    $ddl.append("<option>No Items Found/لم يتم العثور </option>");
                }
            }

            function countItemsFound(num) {
                $("#para8").empty();
                if ($txt.val().length) {
                    $("#para8").html(num + " items found");
                }

            }
        });
        </script>
</asp:Content>
