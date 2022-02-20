<%@ Page Title="" Language="C#" MasterPageFile="~/PL/SalesLayout.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Pos.PL.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                                <div class="card">
                                    <div class="stat-widget-two">
                                        <div class="stat-content">
                                            <div class="stat-text">مؤشر المبيعات الشهرية </div>
                                            <div class="stat-digit"> <i class="fa fa-money"></i>
                                                <asp:Chart ID="Chart1" runat="server" RightToLeft="Yes" Width="900px">
                                                    <Series>
                                                        <asp:Series Name="Series1" ChartType="SplineRange" YValuesPerPoint="4"></asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>

                                            </div>
                                        </div>
                                        
                        </div></div>
    <hr />
    <div>
           <div class="card">
                                    <div class="stat-widget-two">
                                        <div class="stat-content">
                                            <div class="stat-text">اكثر العناصر مبيعا</div>
                                            <div class="stat-digit"> <i class="fa fa-money"></i>
        <asp:Chart ID="Chart2" runat="server" RightToLeft="Yes" Width="900px">
                                                    <Series>
                                                        <asp:Series Name="Series1" YValuesPerPoint="6"></asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
    </div>
</div></div></div></div>
    <hr />
    <div>
           <div class="card">
                                    <div class="stat-widget-two">
                                        <div class="stat-content">
                                            <div class="stat-text">مراقبة المخزون لاخر شهر</div>
                                            <div class="stat-digit"> <i class="fad fa-inventory"></i>
        <asp:Chart ID="Chart3" runat="server" RightToLeft="Yes" Width="900px">
                                                    <Series>
                                                        <asp:Series Name="Series1" ChartType="StackedArea" YValuesPerPoint="6"></asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
    </div>
</div></div></div></div>
     <hr />
    <div>
           <div class="card">
                                    <div class="stat-widget-two">
                                        <div class="stat-content">
                                            <div class="stat-text">رصيد الاصناف طبقا لاخر جرد</div>
                                            <div class="stat-digit"> <i class="fa fa-money"></i>
        <asp:Chart ID="Chart4" runat="server" RightToLeft="Yes" Width="900px">
                                                    <Series>
                                                        <asp:Series Name="Series1" ChartType="Area" YValuesPerPoint="6"></asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
    </div>
</div></div></div></div>
    <hr />
    <div>
           <div class="card">
                                    <div class="stat-widget-two">
                                        <div class="stat-content">
                                            <div class="stat-text">ربح الاصناف المباعة طبقا لاخر جرد</div>
                                            <div class="stat-digit"> <i class="fa fa-money"></i>
        <asp:Chart ID="Chart5" runat="server" RightToLeft="Yes" Width="900px">
                                                    <Series>
                                                        <asp:Series Name="Series1" ChartType="SplineArea" YValuesPerPoint="6"></asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
    </div>
</div></div></div></div>


    
          

</asp:Content>
