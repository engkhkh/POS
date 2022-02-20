Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports Microsoft.Reporting.WebForms
Imports Telerik.Web.UI

Partial Class WebApplication1_payrollrep



    Inherits System.Web.UI.Page

    ' Prices By PAY SLIP

    ' Developed by -MANU VIJAYdd

    ' Release Date - 22 FEB, 2015


    Public SqlConnection As New SqlConnection(WebConfigurationManager.ConnectionStrings("U001").ConnectionString)
    Public SqlCommand As New SqlCommand()
    Public SqlDataAdapter As New SqlDataAdapter(SqlCommand)
    Public Shared dtTable As DataTable
    Public Shared dtTable2 As DataTable
    Public Shared dtTable3 As DataTable

    Public SqlDataset As New DataSet()
    Protected strQuery As String = ""

#Region "Page code"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim rppComp = New ReportParameter
        Dim rppReportHead = New ReportParameter
        Dim rppItem = New ReportParameter
        Dim rppCost = New ReportParameter
        Dim rppItemDec = New ReportParameter
        Dim rppReportSubHead = New ReportParameter
        Dim rpAllowance = New ReportParameter
        Dim rpDeduction = New ReportParameter
        Dim rpAcct = New ReportParameter
        If Not Page.IsPostBack Then


            ' Saving Session values to ViewState




            ddlPayrollAcct.EmptyMessage = "" & " " & ""
            ddlSubCode.EmptyMessage = "" & " " & ""


            ' Checks value of "/" in url, changes visibility of radwindow and loads rest of the page
            If Request.Url.ToString.EndsWith("/") Then
                RadWindow1.Visible = False

                ' Get this session's ID from the filename
                Session("sessionID") = System.IO.Path.GetFileNameWithoutExtension(Request.PhysicalPath)
                ViewState("sessionID") = Session("sessionID")


                ViewState("Ipay") = Session("Ipay")


                ' Gets access rights of user for this session
                '  Master.getSessionAccessRights()

                ' Gets the page title of the current session


                'ViewState("IpayDesc") = Resources.u01.u0109PricesByPriceListListing

                ' Log page access to the database


                rppComp.Name = "rpComp"
                rppComp.Values.Add("EHC Company")
                rvrAcct.LocalReport.SetParameters(rppComp)

                rppReportHead.Name = "rpReportHead"
                rppReportHead.Values.Add("PayrollReport")
                rvrAcct.LocalReport.SetParameters(rppReportHead)


                rpAllowance.Name = "rpAllowance"
                rpAllowance.Values.Add("Allowances")
                rvrAcct.LocalReport.SetParameters(rpAllowance)

                rpDeduction.Name = "rpDeduction"
                rpDeduction.Values.Add("Deduction")
                rvrAcct.LocalReport.SetParameters(rpDeduction)



                rppReportSubHead.Name = "rpReportSubHead"
                rppReportSubHead.Values.Add("PayrollAccountName" & " - ")
                rvrAcct.LocalReport.SetParameters(rppReportSubHead)

                rppItem.Name = "rpItem"
                rppItem.Values.Add("Item")
                rvrAcct.LocalReport.SetParameters(rppItem)

                rppItemDec.Name = "rpItemDec"
                rppItemDec.Values.Add("ItemDec")
                rvrAcct.LocalReport.SetParameters(rppItemDec)

                rppCost.Name = "rpPrice"
                rppCost.Values.Add("Price")
                rvrAcct.LocalReport.SetParameters(rppCost)

                Dim rpAllowanceID = New ReportParameter
                Dim rpAllowanceName = New ReportParameter
                Dim rpDeductionID = New ReportParameter
                Dim rpDeductionName = New ReportParameter
                Dim rpTotal = New ReportParameter
                Dim rpNetTotal = New ReportParameter
                Dim rpAmount = New ReportParameter
                Dim rpPay = New ReportParameter
                Dim rpSubCode = New ReportParameter

                rpSubCode.Name = "rpSubCode"
                rpSubCode.Values.Add("Subcode" & " :" & Session("cDept") & " - " & Session("cDeptName"))
                rvrAcct.LocalReport.SetParameters(rpSubCode)

                rpAmount.Name = "rpAmount"
                rpAmount.Values.Add("Amount")
                rvrAcct.LocalReport.SetParameters(rpAmount)

                rpPay.Name = "rpPay"
                rpPay.Values.Add("PayrolID " & " : " & ViewState("Ipay").ToString.Trim())
                rvrAcct.LocalReport.SetParameters(rpPay)

                rpAllowanceID.Name = "rpAllowanceID"
                rpAllowanceID.Values.Add("AllowanceID")
                rvrAcct.LocalReport.SetParameters(rpAllowanceID)

                rpAllowanceID.Name = "rpAllowanceID"
                rpAllowanceID.Values.Add("AllowanceID")
                rvrAcct.LocalReport.SetParameters(rpAllowanceID)


                rpAllowanceName.Name = "rpAllowanceName"
                rpAllowanceName.Values.Add("AllowanceName")
                rvrAcct.LocalReport.SetParameters(rpAllowanceName)



                rpDeductionID.Name = "rpDeductionID"
                rpDeductionID.Values.Add("DeductionID")
                rvrAcct.LocalReport.SetParameters(rpDeductionID)

                rpAcct.Name = "rpAcct"
                rpAcct.Values.Add("Account")
                rvrAcct.LocalReport.SetParameters(rpAcct)


                rpDeductionName.Name = "rpDeductionName"
                rpDeductionName.Values.Add("DeductionName")
                rvrAcct.LocalReport.SetParameters(rpDeductionName)

                rpTotal.Name = "rpTotal"
                rpTotal.Values.Add("Total")
                rvrAcct.LocalReport.SetParameters(rpTotal)

                rpNetTotal.Name = "rpNetTotal"
                rpNetTotal.Values.Add("NetTotal")
                rvrAcct.LocalReport.SetParameters(rpNetTotal)

                Dim rpPayPeriod = New ReportParameter
                rpPayPeriod.Name = "rpPayPeriod"
                rpPayPeriod.Values.Add("PayPeriod" & " : " & Session("cFYear") & " - " & Session("PeriodName"))
                rvrAcct.LocalReport.SetParameters(rpPayPeriod)
                Dim rpApprovedBy = New ReportParameter
                rpApprovedBy.Name = "rpApprovedBy"
                rpApprovedBy.Values.Add("Approvedby")
                rvrAcct.LocalReport.SetParameters(rpApprovedBy)

                Dim rpEmployee = New ReportParameter
                rpEmployee.Name = "rpEmployee"
                rpEmployee.Values.Add("Employee")
                rvrAcct.LocalReport.SetParameters(rpEmployee)

                Dim rpSignature = New ReportParameter
                rpSignature.Name = "rpSignature"
                rpSignature.Values.Add("Signature")
                rvrAcct.LocalReport.SetParameters(rpSignature)
                Dim rpName = New ReportParameter
                rpName.Name = "rpName"
                rpName.Values.Add("Name")
                rvrAcct.LocalReport.SetParameters(rpName)
                Dim strIfNotAll As String
                If Session("cDept") <> "All" Then
                    strIfNotAll = "and hremp011.cSubCode='" & Session("cDept") & "'"
                Else
                    strIfNotAll = ""
                End If
                dtTable = New DataTable

                '                    strQuery = "  DECLARE @cols AS NVARCHAR(MAX),  " +
                '"     @query  AS NVARCHAR(MAX), " +
                '"    @Sql1 varchar(2000),  " +
                '"   @Sql2 varchar(2000)    " +
                '"select @cols = STUFF((SELECT DISTINCT ',' + QUOTENAME(ltrim(rtrim(hrpay011.cBen)))    " +
                '"                    from  hrpay011        where hrpay011.cGrpComp=" & ViewState("strGrpComp") & "         " +
                '"     FOR XML PATH(''), TYPE               ).value('.', 'NVARCHAR(MAX)')            ,1,1,'')    " +
                '"    DECLARE @ode AS NVARCHAR(MAX) " +
                '"    DECLARE @obr AS NVARCHAR(MAX)   " +
                '"  select @obr = STUFF((SELECT DISTINCT '+' + QUOTENAME(ltrim(rtrim(hrpay011.cBen))) from " +
                '"  hrpay011,hrpay102           where hrpay011.cGrpComp=" & ViewState("strGrpComp") & " and   " +
                '" hrpay011.cBen not in(110,120,130,140,150) and hrpay102.cBen=hrpay011.cBen  " +
                '"and hrpay102.iPay=" & Session("Ipay") & "  and hrpay102.cGrpComp=hrpay011.cGrpComp and hrpay102.cComp=  " & ViewState("strComp") & "  " +
                '" and hrpay011.bType=1           FOR XML PATH(''), TYPE               ).value('.', 'NVARCHAR(MAX)')  " +
                '"           ,1,1,'')    " +
                '" select @ode = STUFF((SELECT DISTINCT '+' + QUOTENAME(ltrim(rtrim(hrpay011.cBen))) from  " +
                '" hrpay011,hrpay102           where hrpay011.cGrpComp=" & ViewState("strGrpComp") & " and   hrpay011.cBen " +
                '" not in(520,510,530,540,110,120,130,140,150,151,152,160,170,190) " +
                '" and hrpay102.cBen=hrpay011.cBen and hrpay102.iPay=" & Session("Ipay") & "  and hrpay102.cGrpComp=hrpay011.cGrpComp  " +
                '"and hrpay102.cComp=  " & ViewState("strComp") & "    and hrpay011.bType=1    " +
                '"FOR XML PATH(''), TYPE               ).value('.', 'NVARCHAR(MAX)')            ,1,1,'')   " +
                '"  " +
                '" Set @Sql1 ='(select  * from(    " +
                '" SELECT  hremp011.cEmpName , hrpay011.cBen, hrpay102.cEmp empID ,SUM(hrpay102.dAmnt)dAmnt   " +
                '"  from hrpay102,hrpay011,hremp011 where Ipay=" & Session("Ipay") & "     and hrpay102.cGrpComp=" & ViewState("strGrpComp") & " and hrpay102.cComp=  " & ViewState("strComp") & "    " +
                '"     and hrpay102.cGrpComp= hrpay011.cGrpComp and  hrpay102.cGrpComp= hremp011.cGrpComp  " +
                '"   and hrpay011.cBen=hrpay102.cBen and hremp011.cEmp=hrpay102.cEmp   GROUP BY  " +
                '" hrpay102.cEmp ,hremp011.cEmpName,hrpay011.bType, hrpay011.cBen,hrpay102.cEmp,hrpay011.cBen     ) as s " +
                '"    PIVOT   (        SUM(dAmnt)       FOR  [cBen]  in  (' + @cols +' )       )AS piv )'   " +
                '" SET @Sql2=     'select EmpID,cEmpName,[110]as BS,[120] as HA,[130]as TA,[140] as FMA,[150] as MA , " +
                '"( '+@obr+'  ) as OB ,Benefit, ([520]+[510])as LA,[530] as GOSI,[540]as M,[151] as ACC, " +
                '"[152] as ACC,[160] as OVE,[170] as BON,[180] as GAS,[190] as GOS,[400] as OTH,[550] as ADV, " +
                '"[560] as TRA,[570] as SPO,[580] as VEH,[585] as VEH,[590] as ADV,[900] as OTH,[901] as REN, " +
                '"[902] as POW,[903] as TEL,[904] as ASF,[905] as SAL,[906] as WGC,[907] as ADV,[908] as ADJ, " +
                '"[909] as ACC,[910] as VEH " +
                '",isnull(('+@ode+'),0.00)ER, " +
                '"Deduction,NetTotal from ( SELECT *,(Benefit-Deduction)NetTotal FROM ' + @Sql1 +'  as h  " +
                '"Left join (Select SUM(Benefit)Benefit,SUM(Deduction)Deduction,cEmp from  " +
                '"(Select SUM(isnull((case when hrpay011.bType=1 THEN   (dAmnt)    END),0))Benefit,   " +
                '"  SUM(isnull((case when hrpay011.bType=0 THEN   (dAmnt)    END),0))Deduction,cEmp   " +
                '"  from hrpay102,hrpay011 where hrpay011.cBen=hrpay102.cBen     " +
                '" and hrpay102.cGrpComp=" & ViewState("strGrpComp") & " and hrpay102.cComp=  " & ViewState("strComp") & "    " +
                '"    and hrpay102.cGrpComp= hrpay011.cGrpComp AND Ipay=" & Session("Ipay") & "      " +
                '"GROUP BY cEmp ,hrpay011.bType) tab   GROUP BY cEmp)TAB3 on TAB3.cEmp=h.EmpID)th  ' " +
                '"exec (@Sql2) "

                '                    SqlCommand.CommandText = strQuery


                '                    SqlCommand.Connection = SqlConnection
                '                    SqlConnection.Open()
                '                    SqlDataAdapter.Fill(dtTable)

                '                    rvrAcct.LocalReport.DataSources.Clear()
                '                    SqlConnection.Close()


                '                    dtTable2 = New DataTable

                '                    ' 
                '                    SqlDataset.Tables.Add(dtTable)

                '                    strQuery = "SELECT 'BS' sf, 'Basic Salary' ff  " +
                '                                "union  " +
                '                                "SELECT 'HA' , 'Housing Allowance'  " +
                '                                "union  " +
                '                                "SELECT 'TA' , 'Travelling Allowance '   " +
                '                                "union  " +
                '                                "SELECT 'FMA' , 'Food and Meal Allowance'  " +
                '                                "union  " +
                '                                "SELECT 'MA' , 'Mobile Allowance'  " +
                '                                "union  " +
                '                                "SELECT 'OB' , 'Other Benefits'   " +
                '                                "union  " +
                '                                "SELECT 'TB' , 'Total Benefits'   " +
                '                                "union  " +
                '                                "SELECT 'LA' , 'Late & Abscence'  " +
                '                                "union  " +
                '                                "SELECT 'GOSI' , 'GOSI '  " +
                '                                "union  " +
                '                                "SELECT 'M' , 'Medical'   " +
                '                                "union  " +
                '                                "SELECT 'ER' , 'Employees Receivables'   " +
                '                                "union  " +
                '                                "SELECT 'TD' , 'Total Deductions'   " +
                '                                "union  " +
                '                                "SELECT 'NB' , 'Net Benefits'   "


                '                    SqlCommand.CommandText = strQuery


                '                    SqlCommand.Connection = SqlConnection
                '                    SqlDataAdapter.Fill(dtTable2)

                dtTable3 = New DataTable

                strQuery = "SELECT  " +
                            "SUM(isnull((case when hrpay011.bType=1 THEN   (dAmnt)    END),0))Benefit, " +
                            "SUM(isnull((case when hrpay011.bType=0 THEN   (dAmnt)    END),0))Deduction, " +
                            "SUM(isnull((case when hrpay102.cBen between 100 and 500 THEN   (dAmnt)    END),0)) AS tBenefit, " +
                            "SUM(isnull((case when hrpay102.cBen between 501 and 999THEN   (dAmnt)    END),0))tDeduction, " +
                            "ISNULL(ltrim(rtrim(hremp012.cResID)),'N/A') as cResID, ISNULL(ltrim(rtrim(hremp012.cBankAcct)),'N/A') as cBankAcct, " +
                            "ltrim(rtrim(hremp011.cEmpName)) cEmpName, ltrim(rtrim(figld042.csubcodename)) cSubcodeName,ltrim(rtrim(hrpay102.cEmp)) cEmp, " +
                            "ltrim(rtrim(hrpay011.cName)) cName, ltrim(rtrim(hrpay011.cBen)) cBen, " +
                            "SUM (hrpay102.dAmnt) dAmnt,(CASE WHEN hrpay011.bType = 1 THEN 'CONTRACT Benefit  ' else N'الاستقطاعات' end ) as 'bType', " +
                            "hrpay011.cAcctGrp,hrpay011.cAcct,LTRIM(RTRIM(figld011.cAcctGrpName)) as cAcctGrpName,LTRIM(RTRIM(figld012.cAcctName)) as cAcctName ," +
                             " SUM(isnull((case when hrpay011.cBen=150 OR hrpay011.cBen=190 OR hrpay011.cBen=200 OR hrpay011.cBen=210 OR hrpay011.cBen=170 OR hrpay011.cBen=410  THEN   (dAmnt)    END),0))  as Absent, " +
                              " SUM(isnull((case when hrpay011.cBen=410 THEN   (dAmnt)    END),0)) as Unpaid, " +
                              " SUM(isnull((case when hrpay011.cBen=490 OR hrpay011.cBen=110 OR hrpay011.cBen=120 OR hrpay011.cBen=130 OR hrpay011.cBen=160 OR hrpay011.cBen=180  THEN   (dAmnt)    END),0)) as NetLate " +
                            "FROM hrpay102, hrpay011, 	hremp011 LEFT JOIN hremp012 on hremp012.cemp=hremp011.cemp " +
                            ",figld011,figld012,figld042 " +
                            "WHERE 	Ipay in ( " & Session("Ipay") & ") AND hrpay102.cGrpComp = 10100001  " +
                            "AND hrpay102.cComp =  1001 AND hrpay102.cGrpComp = hrpay011.cGrpComp AND hrpay102.cGrpComp = hremp011.cGrpComp AND " +
                            "hrpay011.cBen = hrpay102.cBen AND hremp011.cEmp = hrpay102.cEmp " & strIfNotAll & " " +
                            "AND hrpay011.cGrpComp = figld011.cGrpComp AND hrpay011.cAcctGrp = figld011.cAcctGrp AND hrpay011.cGrpComp = figld012.cGrpComp " +
                            "AND hrpay011.cAcct = figld012.cAcct AND hrpay011.cAcctGrp = figld012.cAcctGrp and " +
                            "figld042.csubcode=hrpay102.csubcode  " +
                            "GROUP BY hrpay102.cEmp, hremp011.cEmpName, hrpay011.bType,hrpay011.cBen, hrpay102.cEmp, hrpay011.cBen,  " +
                            "hrpay011.cName,hrpay011.cAcctGrp,hrpay011.cAcct,figld011.cAcctGrpName,figld012.cAcctName,figld042.csubcodename,hremp012.cResID,hremp012.cBankAcct   ORDER BY cBen,cemp "

                ' having MAX(isnull((case when hrpay011.cBen=110  THEN   (dAmnt)    END),0)) >1000
                'strQuery = "SELECT  " +
                '            "SUM(isnull((case when hrpay011.bType=1 THEN   (dAmnt)    END),0))Benefit, " +
                '            "SUM(isnull((case when hrpay011.bType=0 THEN   (dAmnt)    END),0))Deduction, " +
                '            "ISNULL(ltrim(rtrim(hremp012.cResID)),'N/A') as cResID, ISNULL(ltrim(rtrim(hremp012.cBankAcct)),'N/A') as cBankAcct, " +
                '            "ltrim(rtrim(hremp011.cEmpName)) cEmpName, ltrim(rtrim(figld042.csubcodename)) cSubcodeName,ltrim(rtrim(hrpay102.cEmp)) cEmp, " +
                '            "ltrim(rtrim(hrpay011.cName)) cName, ltrim(rtrim(hrpay011.cBen)) cBen, " +
                '            "SUM (hrpay102.dAmnt) dAmnt,(CASE WHEN hrpay011.bType = 1 THEN 'CONTRACT Benefit  ' else N'الاستقطاعات' end ) as 'bType', " +
                '            "hrpay011.cAcctGrp,hrpay011.cAcct,LTRIM(RTRIM(figld011.cAcctGrpName)) as cAcctGrpName,LTRIM(RTRIM(figld012.cAcctName)) as cAcctName " +
                '            "FROM hrpay102, hrpay011, 	hremp011 LEFT JOIN hremp012 on hremp012.cemp=hremp011.cemp " +
                '            "WHERE 	Ipay in ( " + Session("Ipay") + " ) AND hrpay102.cGrpComp = 10100001 " +
                '            "AND hrpay102.cComp = 1001 AND hrpay102.cGrpComp = hrpay011.cGrpComp AND hrpay102.cGrpComp = hremp011.cGrpComp AND " +
                '            "hrpay011.cBen = hrpay102.cBen AND hremp011.cEmp = hrpay102.cEmp " & strIfNotAll & " " +
                '            "AND hrpay011.cGrpComp = figld011.cGrpComp AND hrpay011.cAcctGrp = figld011.cAcctGrp AND hrpay011.cGrpComp = figld012.cGrpComp " +
                '            "AND hrpay011.cAcct = figld012.cAcct AND hrpay011.cAcctGrp = figld012.cAcctGrp and " +
                '            "figld042.csubcode=hrpay102.csubcode  " +
                '            "GROUP BY hrpay102.cEmp, hremp011.cEmpName, hrpay011.bType,hrpay011.cBen, hrpay102.cEmp, hrpay011.cBen,  " +
                '            "hrpay011.cName,hrpay011.cAcctGrp,hrpay011.cAcct,figld011.cAcctGrpName,figld012.cAcctName,figld042.csubcodename,hremp012.cResID,hremp012.cBankAcct ORDER BY cBen,cemp "

                SqlCommand.CommandText = strQuery
                SqlCommand.CommandTimeout = 60




                SqlCommand.Connection = SqlConnection
                SqlDataAdapter.Fill(dtTable3)


                SqlDataset.Tables.Add(dtTable3)




                Dim rdsAcct2 As New ReportDataSource("Cben", dtTable3)
                rvrAcct.LocalReport.DataSources.Add(rdsAcct2)
                rvrAcct.LocalReport.Refresh()
                rvrAcct.Visible = True


            Else
                RadWindow1.VisibleOnPageLoad = True
                ddlPayrollAcctFill()
            End If



        End If

    End Sub

    ' Gets the description of the current price list
    Private Sub ddlPayrollAcctFill()
        dtTable = New DataTable()
        ViewState("strGrpComp") = Session("strSesGrpComp")

        SqlConnection.Open()

        strQuery = "SELECT Ipay,ltrim(rtrim(cNar))cNar FROM hrpay101 where hrpay101.cGrpComp=10100001 and  hrpay101.cComp=1001 "

        SqlDataAdapter.SelectCommand = New SqlCommand(strQuery, SqlConnection)

        'SqlDataAdapter.SelectCommand.Parameters.AddWithValue("@cGrpComp", ViewState("strGrpComp"))
        'SqlDataAdapter.SelectCommand.Parameters.AddWithValue("@cComp", ViewState("strComp"))


        SqlDataAdapter.Fill(dtTable)
        SqlConnection.Close()
        ddlPayrollAcct.DataSource = dtTable
        ddlPayrollAcct.DataBind()


    End Sub

#End Region

#Region "Rad combobox code"

    ' Fires when user selects the Price List combobox and fills it
    Protected Sub ddlPayrollAcct_ItemsRequested(ByVal sender As Object, e As RadComboBoxItemsRequestedEventArgs)
        sender.Text = ""
        sender.Items.Clear()
        dtTable = New DataTable()
        SqlDataset = New DataSet()
        SqlConnection.Open()

        strQuery = "SELECT Ipay,ltrim(rtrim(cNar))cNar FROM hrpay101 where hrpay101.cGrpComp=10100001 and  hrpay101.cComp=1001 "

        SqlDataAdapter.SelectCommand = New SqlCommand(strQuery, SqlConnection)

        'SqlDataAdapter.SelectCommand.Parameters.AddWithValue("@cGrpComp", ViewState("strGrpComp"))
        'SqlDataAdapter.SelectCommand.Parameters.AddWithValue("@cComp", ViewState("strComp"))


        SqlDataAdapter.Fill(dtTable)

        sender.DataTextField = "Ipay"
        sender.DataValueField = "Ipay"
        sender.DataSource = dtTable
        sender.DataBind()

        Session("Ipay") = sender.SelectedValue

        SqlConnection.Close()
    End Sub

    ' Fires when user changes the value in the Price List combobox
    Protected Sub ddlPayrollAcct_SelectedIndexChanged(ByVal sender As Object, ByVal e As RadComboBoxSelectedIndexChangedEventArgs)
        Session("Ipay") = e.Value.Trim
        Session("IpayDesc") = e.Text.Trim
    End Sub

    Protected Sub ddlSubCode_ItemsRequested(sender As Object, e As RadComboBoxItemsRequestedEventArgs)
        ddlSubCode_Fill(sender, "")
    End Sub

    Protected Sub ddlSubCode_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs)
        Session("cDeptName") = e.Text()
        Session("cDept") = e.Value()
    End Sub


    Protected Sub ddlSubCode_Fill(ByVal combo As RadComboBox, ByVal selectedItem As String)

        dtTable = New DataTable()

        ' Clear text and items in the combobox
        combo.Text = ""
        combo.Items.Clear()

        SqlConnection.Open()

        strQuery = "select ltrim(rtrim(csubcode))cDept, ltrim(rtrim(figld042.csubcodename)) cName from figld042 where cGrpComp= 10100001"

        Try

            SqlDataAdapter.SelectCommand = New SqlCommand(strQuery, SqlConnection)
            SqlDataAdapter.Fill(dtTable)
            'Dim dRow As New DataRow()
            Dim dRow = dtTable.NewRow()
            dRow("cDept") = "All"
            dRow("cName") = "All"
            dtTable.Rows.InsertAt(dRow, 0)
            combo.DataTextField = "cName"
            combo.DataValueField = "cDept"
            combo.DataSource = dtTable
            combo.DataBind()

            If selectedItem <> "" Then
                combo.SelectedIndex = combo.FindItemIndexByValue(selectedItem.Trim)
            Else
                combo.SelectedIndex = 0
            End If
            ViewState("cDept") = combo.SelectedValue
            Session("cDept") = combo.SelectedValue
            SqlConnection.Close()

        Catch err As Exception
            ' Handle the error, and log and display the error information
            Dim strError = "ddlBrand_Fill - " & "DatabaseErr" & " " & err.Message

            'MessageBox(ViewState("SessionID"), strError)
        Finally
            SqlConnection.Close()
        End Try

    End Sub
#End Region

#Region "Generic code"

    Protected Sub Search_Click(sender As Object, e As EventArgs)
        Dim CheckedItemIndex = 1
        Dim sbPayrollAcct As New StringBuilder()
        For CheckedItemIndex = 1 To ddlPayrollAcct.CheckedItems.Count
            If CheckedItemIndex <> -1 Then
                sbPayrollAcct.Append("'")
                sbPayrollAcct.Append(ddlPayrollAcct.CheckedItems(CheckedItemIndex - 1).Value.ToString)
                sbPayrollAcct.Append("'")
                sbPayrollAcct.Append(",")
            End If
        Next
        sbPayrollAcct.Append("'")
        sbPayrollAcct.Append("'")
        Session("Ipay") = sbPayrollAcct.ToString


        Response.Redirect(Request.Url.AbsolutePath + "/")
    End Sub

#End Region



End Class
 