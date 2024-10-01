USE [master]
GO
/****** Object:  Database [pos]    Script Date: 6/26/2020 2:36:27 PM ******/
CREATE DATABASE [pos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [pos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pos] SET ARITHABORT OFF 
GO
ALTER DATABASE [pos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pos] SET  MULTI_USER 
GO
ALTER DATABASE [pos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pos] SET QUERY_STORE = OFF
GO
USE [pos]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [pos]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/26/2020 2:36:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cGrpCompany] [nchar](8) NOT NULL,
	[cComp] [nchar](5) NOT NULL,
	[cCId] [nchar](5) NOT NULL,
	[cCDesc] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[cGrpCompany] ASC,
	[cComp] ASC,
	[cCId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 6/26/2020 2:36:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[cCompany] [nchar](5) NOT NULL,
	[cClientId] [nchar](4) NOT NULL,
	[cClientName] [nvarchar](150) NOT NULL,
	[cClientPhone] [nvarchar](50) NOT NULL,
	[cClientDesc] [nvarchar](250) NOT NULL,
	[cGrpCompany] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[cCompany] ASC,
	[cClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 6/26/2020 2:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[cCompany] [nchar](5) NOT NULL,
	[cCompName] [nvarchar](250) NOT NULL,
	[cCDesc] [nvarchar](250) NOT NULL,
	[cGrpCompany] [nchar](10) NOT NULL,
	[cPhone] [nchar](10) NULL,
	[cVatID] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 6/26/2020 2:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[cGrpCompany] [nchar](8) NOT NULL,
	[cComp] [nchar](8) NOT NULL,
	[cCustomerId] [nchar](10) NOT NULL,
	[cCFName] [nchar](50) NOT NULL,
	[cCLName] [nchar](50) NOT NULL,
	[cCTel] [nchar](30) NULL,
	[cCEmail] [nchar](30) NULL,
	[cCAddress] [nchar](100) NULL,
	[cCImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[cGrpCompany] ASC,
	[cComp] ASC,
	[cCustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinBAccounts]    Script Date: 6/26/2020 2:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinBAccounts](
	[cGrpCompany] [nchar](10) NOT NULL,
	[cCompany] [nchar](5) NOT NULL,
	[cAccountName] [nvarchar](250) NOT NULL,
	[cAccountNameEn] [nvarchar](250) NOT NULL,
	[iAcctUGrpLevel] [nchar](2) NULL,
	[IAccountCode] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinCostCentre]    Script Date: 6/26/2020 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinCostCentre](
	[cGrpCompany] [nchar](10) NOT NULL,
	[cCompany] [nchar](5) NOT NULL,
	[cCatId] [nchar](5) NOT NULL,
	[cCatName] [nvarchar](255) NOT NULL,
	[cCostId] [nchar](5) NOT NULL,
	[cCostName] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinDayBook]    Script Date: 6/26/2020 2:36:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinDayBook](
	[cGrpComp] [nchar](10) NOT NULL,
	[cCompany] [nchar](5) NOT NULL,
	[cDayBook] [nchar](5) NOT NULL,
	[cDayBookName] [nvarchar](255) NOT NULL,
	[cTrType] [nchar](3) NOT NULL,
	[cAcctGrp] [nchar](10) NULL,
	[cAcct] [nchar](10) NULL,
	[iDayBookSer] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinGenLedg]    Script Date: 6/26/2020 2:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinGenLedg](
	[cGrpCompany] [nchar](10) NOT NULL,
	[cCompany] [nchar](5) NOT NULL,
	[cDayBook] [nchar](10) NOT NULL,
	[iJV] [nchar](10) NOT NULL,
	[iJVSeq] [nchar](4) NOT NULL,
	[dtJVDate] [date] NOT NULL,
	[cFYear] [nchar](10) NOT NULL,
	[iFPeriod] [nchar](10) NOT NULL,
	[cAcctGrp] [nchar](10) NOT NULL,
	[cAcct] [nchar](10) NOT NULL,
	[cSubCode] [nchar](10) NOT NULL,
	[dAmntDr] [decimal](10, 2) NOT NULL,
	[dAmntCr] [decimal](10, 2) NOT NULL,
	[cHCur] [nchar](10) NOT NULL,
	[cFCur] [nchar](10) NOT NULL,
	[dExRate] [float] NOT NULL,
	[dFAmntDr] [decimal](10, 2) NOT NULL,
	[dFAmntCr] [decimal](10, 2) NOT NULL,
	[bOpen] [nchar](1) NOT NULL,
	[cNar] [nvarchar](255) NOT NULL,
	[cLinkTable] [nchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinLevels]    Script Date: 6/26/2020 2:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinLevels](
	[cGrpCompany] [nchar](10) NOT NULL,
	[cCompany] [nchar](4) NOT NULL,
	[cLevelId] [nchar](2) NOT NULL,
	[cLevelName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrpCompanies]    Script Date: 6/26/2020 2:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrpCompanies](
	[cGrpCompany] [nchar](10) NOT NULL,
	[cGrpName] [nvarchar](50) NOT NULL,
	[cDesc] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_GrpCompanies] PRIMARY KEY CLUSTERED 
(
	[cGrpCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 6/26/2020 2:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[cCompany] [nchar](5) NOT NULL,
	[cVId] [nchar](3) NOT NULL,
	[cVName] [nvarchar](250) NOT NULL,
	[cVDesc] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[cVId] ASC,
	[cCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryProducts]    Script Date: 6/26/2020 2:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryProducts](
	[cGrpCompany] [nchar](10) NOT NULL,
	[cCompId] [nchar](5) NOT NULL,
	[cProdInventoryId] [nchar](3) NOT NULL,
	[cProdCatId] [nchar](5) NOT NULL,
	[cProdId] [char](10) NOT NULL,
	[cProdName] [nvarchar](150) NOT NULL,
	[cProdQtyStock] [nvarchar](50) NOT NULL,
	[cProdPricePurchase] [nvarchar](50) NOT NULL,
	[cProdPriceSales] [nvarchar](50) NULL,
	[cBarCode] [nvarchar](100) NULL,
	[cSupId] [nchar](4) NULL,
	[cUnitId] [nchar](3) NULL,
	[cDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemsInventory]    Script Date: 6/26/2020 2:36:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsInventory](
	[cGrpCompany] [nchar](10) NOT NULL,
	[cComp] [nchar](5) NOT NULL,
	[cCId] [nchar](5) NOT NULL,
	[cPId] [nchar](10) NOT NULL,
	[cOldQty] [decimal](10, 2) NOT NULL,
	[cNewQty] [decimal](10, 2) NOT NULL,
	[cUnit] [nchar](5) NOT NULL,
	[cPNewCost] [decimal](10, 2) NOT NULL,
	[cPNewSale] [decimal](10, 2) NOT NULL,
	[cPSaledQtyFromOldQty] [decimal](10, 2) NOT NULL,
	[cDateFrom] [date] NOT NULL,
	[cDateTo] [datetime] NOT NULL,
	[cTopic] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/26/2020 2:36:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[cGrpCompany] [nchar](8) NOT NULL,
	[cComp] [nchar](5) NOT NULL,
	[cOrderId] [nvarchar](150) NOT NULL,
	[cOrderDate] [datetime] NULL,
	[cCustomerId] [nchar](10) NULL,
	[cPaymentType] [nchar](3) NOT NULL,
	[cVatAmount] [decimal](10, 2) NOT NULL,
	[cOrderTotal] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[cGrpCompany] ASC,
	[cComp] ASC,
	[cOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 6/26/2020 2:36:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[cGrpCompany] [nchar](8) NOT NULL,
	[cComp] [nchar](5) NOT NULL,
	[cCId] [nchar](5) NOT NULL,
	[cPId] [nchar](10) NOT NULL,
	[cProdName] [nvarchar](150) NOT NULL,
	[cOrderId] [nchar](10) NULL,
	[cQty] [decimal](10, 2) NOT NULL,
	[cPrice] [decimal](10, 2) NOT NULL,
	[cVat]  AS (([cTotal]*(5))/(100)),
	[cDisc] [decimal](10, 2) NULL,
	[cTotal] [decimal](10, 2) NULL,
	[cFlagsave] [nchar](1) NOT NULL,
	[cOrderDate] [datetime] NULL,
	[cId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 6/26/2020 2:36:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[cGrpCompany] [nchar](10) NOT NULL,
	[cCompany] [nchar](5) NOT NULL,
	[cPaymentId] [nchar](3) NULL,
	[cPaymentType] [nvarchar](250) NOT NULL,
	[cDesc] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/26/2020 2:36:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[cGrpCompany] [nvarchar](150) NOT NULL,
	[cComp] [nvarchar](150) NOT NULL,
	[cPId] [char](10) NOT NULL,
	[cPName] [nvarchar](150) NOT NULL,
	[cPQtyInStock] [nvarchar](150) NOT NULL,
	[cPPriceCost] [nvarchar](150) NULL,
	[cPPrice] [nvarchar](150) NOT NULL,
	[cPImage] [image] NULL,
	[cPBcode] [nvarchar](150) NULL,
	[cCId] [nvarchar](150) NOT NULL,
	[cUnitId] [nchar](3) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[cGrpCompany] ASC,
	[cComp] ASC,
	[cPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 6/26/2020 2:36:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[cCompany] [nchar](5) NOT NULL,
	[cSupId] [nchar](4) NOT NULL,
	[cSupName] [nvarchar](150) NOT NULL,
	[cSubDesc] [nvarchar](150) NOT NULL,
	[cSubPhone] [char](15) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[cCompany] ASC,
	[cSupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 6/26/2020 2:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[cGroupCompany] [nchar](10) NOT NULL,
	[cTypeId] [nchar](3) NOT NULL,
	[cTypeName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Units_1] PRIMARY KEY CLUSTERED 
(
	[cGroupCompany] ASC,
	[cTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[updateinvoice]    Script Date: 6/26/2020 2:36:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[updateinvoice](
	[cGrpCompany] [nchar](10) NOT NULL,
	[cComp] [nchar](5) NOT NULL,
	[cUser] [nvarchar](250) NOT NULL,
	[cOrderId] [nchar](20) NOT NULL,
	[cTotal] [decimal](10, 2) NOT NULL,
	[cVat] [decimal](10, 2) NOT NULL,
	[cCountItems] [decimal](10, 2) NOT NULL,
	[cUpdateType] [nchar](1) NOT NULL,
	[cGetUpdateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/26/2020 2:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[cId] [nvarchar](50) NOT NULL,
	[cPassword] [nvarchar](50) NOT NULL,
	[cType] [nvarchar](50) NOT NULL,
	[cGrpCopany] [nchar](10) NOT NULL,
	[cComp] [char](5) NOT NULL,
	[cUserName] [nvarchar](250) NULL,
	[cUserAddress] [nvarchar](250) NULL,
	[cUserNo] [nchar](5) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10000', N'القهوة الباردة                                                                                      ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10001', N'القهوة السخنة                                                                                       ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10002', N'العصيرات                                                                                            ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10003', N'الشكولاتات                                                                                          ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10004', N'الدونات                                                                                             ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10005', N'البلاك كوفي                                                                                         ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10006', N'الاضافات                                                                                            ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10007', N'بطايق الشحن                                                                                         ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10008', N'حلويات ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1001 ', N'10009', N'كيكات ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1002 ', N'10000', N'كابوتشينات                                                                                          ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1002 ', N'10001', N'شكولاتات                                                                                            ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1002 ', N'10002', N'حلويات                                                                                              ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1002 ', N'10003', N'سندوتشات                                                                                            ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1002 ', N'10004', N'مشروبات باردة                                                                                       ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1002 ', N'10005', N'عامة')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1003 ', N'10000', N'وجبات                                                                                               ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1003 ', N'10001', N'حلويات                                                                                              ')
INSERT [dbo].[Categories] ([cGrpCompany], [cComp], [cCId], [cCDesc]) VALUES (N'10100001', N'1003 ', N'10002', N'مشروبات                                                                                             ')
INSERT [dbo].[Clients] ([cCompany], [cClientId], [cClientName], [cClientPhone], [cClientDesc], [cGrpCompany]) VALUES (N'1001 ', N'1000', N'عميل عام', N'-', N'client', N'10100001  ')
INSERT [dbo].[Clients] ([cCompany], [cClientId], [cClientName], [cClientPhone], [cClientDesc], [cGrpCompany]) VALUES (N'1001 ', N'1001', N'عميل 1', N'----', N'--', N'10100001  ')
INSERT [dbo].[Clients] ([cCompany], [cClientId], [cClientName], [cClientPhone], [cClientDesc], [cGrpCompany]) VALUES (N'1001 ', N'1002', N'عميل ااحمد ', N'5654544', N'--', N'10100001  ')
INSERT [dbo].[Clients] ([cCompany], [cClientId], [cClientName], [cClientPhone], [cClientDesc], [cGrpCompany]) VALUES (N'1002 ', N'1000', N'عميل عام', N'--', N'--', N'10100001  ')
INSERT [dbo].[Clients] ([cCompany], [cClientId], [cClientName], [cClientPhone], [cClientDesc], [cGrpCompany]) VALUES (N'1003 ', N'1000', N'عميل عام', N'--', N'--', N'10100001  ')
INSERT [dbo].[Company] ([cCompany], [cCompName], [cCDesc], [cGrpCompany], [cPhone], [cVatID]) VALUES (N'1001 ', N'الكافيه فرع الطائف', N'الكافيه فرع الطائف', N'10100001  ', N'0506377112', N'                                                  ')
INSERT [dbo].[Company] ([cCompany], [cCompName], [cCDesc], [cGrpCompany], [cPhone], [cVatID]) VALUES (N'1002 ', N'الكافيه فرع مكه', N'الكافيه فرع مكه', N'10100001  ', N'0507777404', NULL)
INSERT [dbo].[Company] ([cCompany], [cCompName], [cCDesc], [cGrpCompany], [cPhone], [cVatID]) VALUES (N'1003 ', N'الكافيه فرع الرياض ', N'الكافيه فرع الرياض ', N'10100001  ', NULL, NULL)
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'الأصول', N'Assets', N'1 ', N'1         ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'الإلتزامات وحقوق الملكيـــة', N'Liabilities and equity', N'1 ', N'2         ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'الايرادات ', N'Revenues', N'1 ', N'3         ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'المصروفات', N'Expenses', N'1 ', N'4         ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'الاصول الثابتة', N'fixed assets', N'2 ', N'11        ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'مشاريع تحت التنفيذ', N'--', N'2 ', N'13        ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'ايرادات تشغيلية  للغير', N'o--', N'2 ', N'31        ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'مباني المخازن بجازان', N'B2', N'4 ', N'110400002 ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'مباني الفرع الجديد بالطائف', N'B3', N'4 ', N'110400003 ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'الاصول المتداولة', N'current assets', N'2 ', N'12        ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'الاجور', N'FEES', N'2 ', N'41        ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'اراضي', N'lands', N'3 ', N'1101      ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'اثاث ومعدات مكتبية', N'FUR', N'3 ', N'1102      ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'الات وتجهيزات', N'MACHINES', N'3 ', N'1103      ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'عقارات', N'buildings', N'3 ', N'1104      ')
INSERT [dbo].[FinBAccounts] ([cGrpCompany], [cCompany], [cAccountName], [cAccountNameEn], [iAcctUGrpLevel], [IAccountCode]) VALUES (N'10100001  ', N'1001 ', N'مبني الشركة بالرياض', N'bu1', N'4 ', N'110400001 ')
INSERT [dbo].[FinCostCentre] ([cGrpCompany], [cCompany], [cCatId], [cCatName], [cCostId], [cCostName]) VALUES (N'1010001   ', N'1001 ', N'101  ', N'General Administration', N'10101', N'General Administration')
INSERT [dbo].[FinCostCentre] ([cGrpCompany], [cCompany], [cCatId], [cCatName], [cCostId], [cCostName]) VALUES (N'1010001   ', N'1001 ', N'101  ', N'General Administration', N'10102', N'الإدارة المالية - المركز الرئيسي')
INSERT [dbo].[FinDayBook] ([cGrpComp], [cCompany], [cDayBook], [cDayBookName], [cTrType], [cAcctGrp], [cAcct], [iDayBookSer]) VALUES (N'10100001  ', N'1001 ', N'101  ', N'Opening Balance', N'101', NULL, NULL, N'2020      ')
INSERT [dbo].[FinDayBook] ([cGrpComp], [cCompany], [cDayBook], [cDayBookName], [cTrType], [cAcctGrp], [cAcct], [iDayBookSer]) VALUES (N'10100001  ', N'1001 ', N'111  ', N'Journal Voucher', N'101', NULL, NULL, N'2020      ')
INSERT [dbo].[FinGenLedg] ([cGrpCompany], [cCompany], [cDayBook], [iJV], [iJVSeq], [dtJVDate], [cFYear], [iFPeriod], [cAcctGrp], [cAcct], [cSubCode], [dAmntDr], [dAmntCr], [cHCur], [cFCur], [dExRate], [dFAmntDr], [dFAmntCr], [bOpen], [cNar], [cLinkTable]) VALUES (N'10100001  ', N'1001 ', N'111       ', N'2020000001', N'1   ', CAST(N'2020-06-25' AS Date), N'2020      ', N'6         ', N'110400003 ', N'110400003 ', N'10101     ', CAST(44.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(10, 2)), N'300       ', N'1.0       ', 1, CAST(44.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(10, 2)), N'1', N'TEST', N'TEST                                                                                                ')
INSERT [dbo].[FinGenLedg] ([cGrpCompany], [cCompany], [cDayBook], [iJV], [iJVSeq], [dtJVDate], [cFYear], [iFPeriod], [cAcctGrp], [cAcct], [cSubCode], [dAmntDr], [dAmntCr], [cHCur], [cFCur], [dExRate], [dFAmntDr], [dFAmntCr], [bOpen], [cNar], [cLinkTable]) VALUES (N'10100001  ', N'1001 ', N'111       ', N'2020000002', N'1   ', CAST(N'2020-06-25' AS Date), N'2020      ', N'6         ', N'110400003 ', N'110400003 ', N'10101     ', CAST(544.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), N'300       ', N'1.0       ', 1, CAST(544.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), N'1', N'TEST', N'TEST                                                                                                ')
INSERT [dbo].[FinGenLedg] ([cGrpCompany], [cCompany], [cDayBook], [iJV], [iJVSeq], [dtJVDate], [cFYear], [iFPeriod], [cAcctGrp], [cAcct], [cSubCode], [dAmntDr], [dAmntCr], [cHCur], [cFCur], [dExRate], [dFAmntDr], [dFAmntCr], [bOpen], [cNar], [cLinkTable]) VALUES (N'10100001  ', N'1001 ', N'111       ', N'2020000003', N'0   ', CAST(N'2020-06-25' AS Date), N'2020      ', N'6         ', N'110400003 ', N'110400003 ', N'10101     ', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'300       ', N'1.0       ', 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'1', N'TEST', N'TEST                                                                                                ')
INSERT [dbo].[FinGenLedg] ([cGrpCompany], [cCompany], [cDayBook], [iJV], [iJVSeq], [dtJVDate], [cFYear], [iFPeriod], [cAcctGrp], [cAcct], [cSubCode], [dAmntDr], [dAmntCr], [cHCur], [cFCur], [dExRate], [dFAmntDr], [dFAmntCr], [bOpen], [cNar], [cLinkTable]) VALUES (N'10100001  ', N'1001 ', N'111       ', N'2020000004', N'0   ', CAST(N'2020-06-25' AS Date), N'2020      ', N'6         ', N'110400002 ', N'110400002 ', N'10101     ', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'300       ', N'1.0       ', 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'1', N'TEST2', N'TEST2                                                                                               ')
INSERT [dbo].[FinLevels] ([cGrpCompany], [cCompany], [cLevelId], [cLevelName]) VALUES (N'10100001  ', N'1001', N'1 ', N'level1')
INSERT [dbo].[FinLevels] ([cGrpCompany], [cCompany], [cLevelId], [cLevelName]) VALUES (N'10100001  ', N'1001', N'2 ', N'level2')
INSERT [dbo].[GrpCompanies] ([cGrpCompany], [cGrpName], [cDesc]) VALUES (N'10100001  ', N'groupcompany1', N'groupcompany')
INSERT [dbo].[Inventory] ([cCompany], [cVId], [cVName], [cVDesc]) VALUES (N'1001 ', N'101', N'مخزن  كافية الطائف 1', N'مخزن كافية الطائف 1')
INSERT [dbo].[Inventory] ([cCompany], [cVId], [cVName], [cVDesc]) VALUES (N'1002 ', N'101', N'مخزن كافية مكة 1', N'مخزن كافية مكة 1')
INSERT [dbo].[Inventory] ([cCompany], [cVId], [cVName], [cVDesc]) VALUES (N'1003 ', N'101', N'مخزن المطعم 1', N'مخزن المطعم 1')
INSERT [dbo].[Inventory] ([cCompany], [cVId], [cVName], [cVDesc]) VALUES (N'1001 ', N'102', N'مخزن كافية لطائف 2', N'مخزن كافية لطائف 2')
INSERT [dbo].[Inventory] ([cCompany], [cVId], [cVName], [cVDesc]) VALUES (N'1002 ', N'102', N'مخزن كافية مكة 2', N'مخزن كافية مكة 2')
INSERT [dbo].[Inventory] ([cCompany], [cVId], [cVName], [cVDesc]) VALUES (N'1003 ', N'102', N'مخزن المطعم 2', N'مخزن المطعم 2')
INSERT [dbo].[Inventory] ([cCompany], [cVId], [cVName], [cVDesc]) VALUES (N'1001 ', N'103', N'مخزن كافية الطائف 3', N'مخزن')
INSERT [dbo].[Inventory] ([cCompany], [cVId], [cVName], [cVDesc]) VALUES (N'1002 ', N'103', N'مخزن كافيه مكة 3', N'مخزن كافيه مكة 3')
INSERT [dbo].[Inventory] ([cCompany], [cVId], [cVName], [cVDesc]) VALUES (N'1003 ', N'103', N'مخزن مطعم الطائف 3', N'مخزن مطعم الطائف 3')
INSERT [dbo].[InventoryProducts] ([cGrpCompany], [cCompId], [cProdInventoryId], [cProdCatId], [cProdId], [cProdName], [cProdQtyStock], [cProdPricePurchase], [cProdPriceSales], [cBarCode], [cSupId], [cUnitId], [cDate]) VALUES (N'10100001  ', N'1001 ', N'102', N'10001', N'10000000  ', N'شاي ب الحليب ', N'600', N'2', N'8', N'654', N'1001', N'108', CAST(N'2020-04-23T13:50:02.420' AS DateTime))
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000002  ', CAST(600.00 AS Decimal(10, 2)), CAST(700.00 AS Decimal(10, 2)), N'101  ', CAST(8.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(N'2020-05-07' AS Date), CAST(N'2020-05-14T16:01:33.000' AS DateTime), N'--')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000006  ', CAST(500.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)), N'101  ', CAST(16.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(N'2020-05-13' AS Date), CAST(N'2020-05-14T16:54:28.000' AS DateTime), N'---')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000000  ', CAST(600.00 AS Decimal(10, 2)), CAST(650.00 AS Decimal(10, 2)), N'101  ', CAST(3.50 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(N'2020-05-13' AS Date), CAST(N'2020-05-14T16:54:56.000' AS DateTime), N'---')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000000  ', CAST(650.00 AS Decimal(10, 2)), CAST(700.00 AS Decimal(10, 2)), N'101  ', CAST(3.50 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), CAST(N'2020-05-07' AS Date), CAST(N'2020-05-14T17:07:10.000' AS DateTime), N'--')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000001  ', CAST(800.00 AS Decimal(10, 2)), CAST(900.00 AS Decimal(10, 2)), N'101  ', CAST(7.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(N'2020-05-12' AS Date), CAST(N'2020-05-14T17:43:19.000' AS DateTime), N'--')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000000  ', CAST(700.00 AS Decimal(10, 2)), CAST(720.00 AS Decimal(10, 2)), N'101  ', CAST(3.50 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), CAST(N'2020-05-13' AS Date), CAST(N'2020-05-14T17:10:29.000' AS DateTime), N'00')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000004  ', CAST(700.00 AS Decimal(10, 2)), CAST(800.00 AS Decimal(10, 2)), N'102  ', CAST(6.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), CAST(N'2020-05-13' AS Date), CAST(N'2020-05-14T17:14:53.000' AS DateTime), N'-')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000001  ', CAST(200.00 AS Decimal(10, 2)), CAST(800.00 AS Decimal(10, 2)), N'101  ', CAST(7.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(N'2020-05-12' AS Date), CAST(N'2020-05-14T17:41:35.000' AS DateTime), N'--')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000000  ', CAST(720.00 AS Decimal(10, 2)), CAST(800.00 AS Decimal(10, 2)), N'101  ', CAST(3.50 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), CAST(N'2020-05-01' AS Date), CAST(N'2020-05-14T19:28:11.000' AS DateTime), N'--')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000000  ', CAST(800.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(10, 2)), N'101  ', CAST(3.50 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(560.00 AS Decimal(10, 2)), CAST(N'2020-05-06' AS Date), CAST(N'2020-05-14T21:55:21.000' AS DateTime), N'---')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000000  ', CAST(600.00 AS Decimal(10, 2)), CAST(700.00 AS Decimal(10, 2)), N'101  ', CAST(3.50 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(560.00 AS Decimal(10, 2)), CAST(N'2020-05-06' AS Date), CAST(N'2020-05-14T21:57:03.000' AS DateTime), N'---')
INSERT [dbo].[ItemsInventory] ([cGrpCompany], [cComp], [cCId], [cPId], [cOldQty], [cNewQty], [cUnit], [cPNewCost], [cPNewSale], [cPSaledQtyFromOldQty], [cDateFrom], [cDateTo], [cTopic]) VALUES (N'10100001  ', N'1001 ', N'10000', N'10000000  ', CAST(700.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), N'101  ', CAST(3.50 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(900.00 AS Decimal(10, 2)), CAST(N'2020-05-06' AS Date), CAST(N'2020-05-14T22:22:58.000' AS DateTime), N'--')
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000000', CAST(N'2020-05-28T09:21:18.000' AS DateTime), N'1000      ', N'101', CAST(20.75 AS Decimal(10, 2)), CAST(415.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000001', CAST(N'2020-05-28T09:22:50.000' AS DateTime), N'1000      ', N'100', CAST(6.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000002', CAST(N'2020-05-28T09:22:59.000' AS DateTime), N'1000      ', N'100', CAST(6.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000003', CAST(N'2020-05-28T09:32:28.000' AS DateTime), N'1000      ', N'100', CAST(1.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000004', CAST(N'2020-05-31T11:21:20.000' AS DateTime), N'1000      ', N'100', CAST(10.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000005', CAST(N'2020-05-31T11:22:19.000' AS DateTime), N'1000      ', N'100', CAST(4.80 AS Decimal(10, 2)), CAST(96.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000006', CAST(N'2020-05-31T11:27:41.000' AS DateTime), N'1000      ', N'100', CAST(7.20 AS Decimal(10, 2)), CAST(144.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000007', CAST(N'2020-05-31T12:48:53.000' AS DateTime), N'1001      ', N'101', CAST(13.50 AS Decimal(10, 2)), CAST(270.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000008', CAST(N'2020-05-31T12:51:46.000' AS DateTime), N'1000      ', N'100', CAST(2.05 AS Decimal(10, 2)), CAST(41.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000009', CAST(N'2020-05-31T12:51:56.000' AS DateTime), N'1000      ', N'100', CAST(2.70 AS Decimal(10, 2)), CAST(54.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000010', CAST(N'2020-05-31T15:18:49.000' AS DateTime), N'1000      ', N'100', CAST(2.10 AS Decimal(10, 2)), CAST(42.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000011', CAST(N'2020-06-03T13:15:24.000' AS DateTime), N'1000      ', N'100', CAST(26.95 AS Decimal(10, 2)), CAST(539.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000012', CAST(N'2020-06-03T13:15:55.000' AS DateTime), N'1000      ', N'100', CAST(0.60 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000013', CAST(N'2020-06-03T13:16:00.000' AS DateTime), N'1000      ', N'100', CAST(2.95 AS Decimal(10, 2)), CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000014', CAST(N'2020-06-03T13:16:30.000' AS DateTime), N'1000      ', N'100', CAST(31.90 AS Decimal(10, 2)), CAST(638.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000015', CAST(N'2020-06-12T21:02:27.000' AS DateTime), N'1000      ', N'100', CAST(1.80 AS Decimal(10, 2)), CAST(36.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000016', CAST(N'2020-06-12T21:11:36.000' AS DateTime), N'1000      ', N'101', CAST(4.40 AS Decimal(10, 2)), CAST(88.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([cGrpCompany], [cComp], [cOrderId], [cOrderDate], [cCustomerId], [cPaymentType], [cVatAmount], [cOrderTotal]) VALUES (N'10100001', N'1001 ', N'20000017', CAST(N'2020-06-12T21:12:12.000' AS DateTime), N'1000      ', N'100', CAST(0.95 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)))
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000003  ', N'لاتين', N'20000016  ', CAST(2.00 AS Decimal(10, 2)), CAST(88.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(88.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-12T21:11:36.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000001  ', N'قهوة باردة', N'20000017  ', CAST(1.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-12T21:12:12.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000004  ', N'قهوة ترمس', N'20000017  ', CAST(1.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-12T21:12:12.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000011  ', N'طبق ارز باللبن ', N'20000004  ', CAST(10.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T11:21:20.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000010  ', N'طبق ام علي ', N'20000005  ', CAST(8.00 AS Decimal(10, 2)), CAST(96.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(96.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T11:22:19.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000012  ', N'جروب فروت ', N'20000006  ', CAST(12.00 AS Decimal(10, 2)), CAST(144.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(144.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T11:27:41.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000009  ', N'طبق مشكل ', N'20000007  ', CAST(5.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:48:53.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000011  ', N'طبق ارز باللبن ', N'20000007  ', CAST(5.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:48:53.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000012  ', N'جروب فروت ', N'20000007  ', CAST(5.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:48:53.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000010  ', N'طبق ام علي ', N'20000007  ', CAST(5.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:48:53.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10002', N'10000007  ', N'برتقال', N'20000008  ', CAST(1.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:51:46.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10002', N'10000013  ', N'عصير كوكتيل ', N'20000008  ', CAST(1.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:51:46.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10002', N'10000008  ', N'مانجو', N'20000008  ', CAST(1.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:51:46.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10002', N'10000014  ', N'عصير موز باللبن ', N'20000008  ', CAST(1.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:51:46.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000010  ', N'طبق ام علي ', N'20000009  ', CAST(1.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:51:56.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000012  ', N'جروب فروت ', N'20000009  ', CAST(1.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:51:56.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000011  ', N'طبق ارز باللبن ', N'20000009  ', CAST(1.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:51:56.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000009  ', N'طبق مشكل ', N'20000009  ', CAST(1.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T12:51:56.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000000  ', N'شاي ', N'20000000  ', CAST(10.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-28T09:21:18.000' AS DateTime), N'user')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000003  ', N'لاتين', N'20000000  ', CAST(10.00 AS Decimal(10, 2)), CAST(220.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(220.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-28T09:21:18.000' AS DateTime), N'user')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000005  ', N'قهوة تركي ', N'20000000  ', CAST(15.00 AS Decimal(10, 2)), CAST(135.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(135.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-28T09:21:18.000' AS DateTime), N'user')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000000  ', N'شاي ', N'20000001  ', CAST(20.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-28T09:22:50.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000002  ', N'قهوة تركي', N'20000002  ', CAST(10.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-28T09:22:59.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000009  ', N'طبق مشكل ', N'20000003  ', CAST(2.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-28T09:32:28.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000009  ', N'طبق مشكل ', N'20000010  ', CAST(1.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T15:18:49.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000011  ', N'طبق ارز باللبن ', N'20000010  ', CAST(1.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T15:18:49.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000010  ', N'طبق ام علي ', N'20000010  ', CAST(1.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'1', CAST(N'2020-05-31T15:18:49.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000004  ', N'قهوة ترمس', N'20000011  ', CAST(1.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:15:24.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000001  ', N'قهوة باردة', N'20000011  ', CAST(1.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:15:24.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000002  ', N'قهوة تركي', N'20000011  ', CAST(10.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:15:24.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000003  ', N'لاتين', N'20000011  ', CAST(10.00 AS Decimal(10, 2)), CAST(220.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(220.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:15:24.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000000  ', N'شاي ', N'20000011  ', CAST(10.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:15:24.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000002  ', N'قهوة تركي', N'20000011  ', CAST(10.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:15:24.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000002  ', N'قهوة تركي', N'20000012  ', CAST(1.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:15:55.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000004  ', N'قهوة ترمس', N'20000013  ', CAST(1.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:16:00.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000003  ', N'لاتين', N'20000013  ', CAST(1.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:16:00.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000000  ', N'شاي ', N'20000013  ', CAST(1.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:16:00.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000001  ', N'قهوة باردة', N'20000013  ', CAST(1.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:16:00.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000002  ', N'قهوة تركي', N'20000013  ', CAST(1.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:16:00.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000006  ', N'ترمس قهوة عربي', N'20000014  ', CAST(10.00 AS Decimal(10, 2)), CAST(260.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(260.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:16:30.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000005  ', N'قهوة تركي ', N'20000014  ', CAST(10.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:16:30.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000003  ', N'لاتين', N'20000014  ', CAST(9.00 AS Decimal(10, 2)), CAST(198.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(198.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:16:30.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000004  ', N'قهوة ترمس', N'20000014  ', CAST(10.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-03T13:16:30.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10009', N'10000015  ', N'كيكة بالشكولاتة', N'20000015  ', CAST(2.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-12T21:02:27.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10008', N'10000009  ', N'طبق مشكل ', N'20000015  ', CAST(1.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-12T21:02:27.000' AS DateTime), N'admin')
INSERT [dbo].[OrdersDetails] ([cGrpCompany], [cComp], [cCId], [cPId], [cProdName], [cOrderId], [cQty], [cPrice], [cDisc], [cTotal], [cFlagsave], [cOrderDate], [cId]) VALUES (N'10100001', N'1001 ', N'10000', N'10000000  ', N'شاي ', N'20000015  ', CAST(1.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-12T21:02:27.000' AS DateTime), N'admin')
INSERT [dbo].[PaymentType] ([cGrpCompany], [cCompany], [cPaymentId], [cPaymentType], [cDesc]) VALUES (N'10100001  ', N'1001 ', N'100', N'شبكة-Card', N'Card')
INSERT [dbo].[PaymentType] ([cGrpCompany], [cCompany], [cPaymentId], [cPaymentType], [cDesc]) VALUES (N'10100001  ', N'1001 ', N'101', N'نقدي-Cash', N'Cash')
INSERT [dbo].[PaymentType] ([cGrpCompany], [cCompany], [cPaymentId], [cPaymentType], [cDesc]) VALUES (N'10100001  ', N'1002 ', N'100', N'شبكة-Card', N'Card')
INSERT [dbo].[PaymentType] ([cGrpCompany], [cCompany], [cPaymentId], [cPaymentType], [cDesc]) VALUES (N'10100001  ', N'1002 ', N'101', N'نقدي-Cash', N'Cash')
INSERT [dbo].[PaymentType] ([cGrpCompany], [cCompany], [cPaymentId], [cPaymentType], [cDesc]) VALUES (N'10100001  ', N'1003 ', N'100', N'شبكة-Card', N'Card')
INSERT [dbo].[PaymentType] ([cGrpCompany], [cCompany], [cPaymentId], [cPaymentType], [cDesc]) VALUES (N'10100001  ', N'1003 ', N'101', N'نقدي-Cash', N'Cash')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000000  ', N'شاي ', N'1000', N'3.5', N'6', 0x323036, N'111', N'10000', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000001  ', N'قهوة باردة', N'900', N'7', N'10', 0x323231, N'454544554', N'10000', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000002  ', N'قهوة تركي', N'700', N'8', N'12', 0x323231, N'666', N'10000', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000003  ', N'لاتين', N'200', N'20', N'22', 0x323231, N'66', N'10000', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000004  ', N'قهوة ترمس', N'800', N'6', N'9', 0x323231, N'88', N'10000', N'102')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000005  ', N'قهوة تركي ', N'800', N'6', N'9', 0x323231, N'22', N'10000', N'103')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000006  ', N'ترمس قهوة عربي', N'300', N'16', N'26', 0x323231, N'88', N'10000', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000007  ', N'برتقال', N'900', N'3', N'5', 0x323231, N'877', N'10002', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000008  ', N'مانجو', N'600', N'3', N'6', 0x323231, N'8888888', N'10002', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000009  ', N'طبق مشكل ', N'600', N'8', N'10', 0x323231, N'88', N'10008', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000010  ', N'طبق ام علي ', N'500', N'10', N'12', 0x323231, N'300676270401', N'10008', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000011  ', N'طبق ارز باللبن ', N'50', N'10', N'20', 0x323231, N'0014600820050512070004', N'10008', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000012  ', N'جروب فروت ', N'300', N'10', N'12', 0x323231, N'22', N'10008', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000013  ', N'عصير كوكتيل ', N'500', N'10', N'15', 0x323231, N'666', N'10002', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000014  ', N'عصير موز باللبن ', N'600', N'11', N'15', 0x323231, N'555', N'10002', N'101')
INSERT [dbo].[Products] ([cGrpCompany], [cComp], [cPId], [cPName], [cPQtyInStock], [cPPriceCost], [cPPrice], [cPImage], [cPBcode], [cCId], [cUnitId]) VALUES (N'10100001  ', N'1001 ', N'10000015  ', N'كيكة بالشكولاتة', N'200', N'7', N'10', 0x323333, N'5555', N'10009', N'101')
INSERT [dbo].[Suppliers] ([cCompany], [cSupId], [cSupName], [cSubDesc], [cSubPhone]) VALUES (N'1001 ', N'1001', N'Supplier 1', N'Supplier 1', N'0560471082     ')
INSERT [dbo].[Suppliers] ([cCompany], [cSupId], [cSupName], [cSubDesc], [cSubPhone]) VALUES (N'1001 ', N'1002', N'supplier2', N's', N'058085745      ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'100', N'N/A                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'101', N'عدد                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'102', N'ساعة                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'103', N'م3                                                ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'104', N'يومية                                             ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'105', N'مقطوعية                                           ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'106', N'برميل                                             ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'107', N'لتر                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'108', N'لفة                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'109', N'كجم                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'110', N'علبة                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'111', N'طن                                                ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'112', N'عينة                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'113', N'حبة                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'114', N'شيكارة                                            ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'115', N'م2                                                ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'116', N'لوح                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'117', N'مقطوع                                             ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'118', N'كيس                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'119', N'م ط                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'120', N'م ط                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'121', N'كرتونة                                            ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'122', N'دسته                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'123', N'بالشدة                                            ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'124', N'م.ط                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'125', N'درام                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'126', N'كرتون                                             ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'127', N'درزن                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'128', N'باله                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'129', N'قطعة                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'130', N'جالون                                             ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'131', N'بالحبة                                            ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'132', N'سطل                                               ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'133', N'شتلة                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'143', N'سنوي                                              ')
INSERT [dbo].[Units] ([cGroupCompany], [cTypeId], [cTypeName]) VALUES (N'10100001  ', N'153', N'شهري                                              ')
INSERT [dbo].[updateinvoice] ([cGrpCompany], [cComp], [cUser], [cOrderId], [cTotal], [cVat], [cCountItems], [cUpdateType], [cGetUpdateTime]) VALUES (N'10100001  ', N'1001 ', N'admin', N'20000016            ', CAST(88.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'0', CAST(N'2020-06-12T21:11:36.000' AS DateTime))
INSERT [dbo].[updateinvoice] ([cGrpCompany], [cComp], [cUser], [cOrderId], [cTotal], [cVat], [cCountItems], [cUpdateType], [cGetUpdateTime]) VALUES (N'10100001  ', N'1001 ', N'admin', N'20000017            ', CAST(19.00 AS Decimal(10, 2)), CAST(0.95 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), N'1', CAST(N'2020-06-12T21:13:12.000' AS DateTime))
INSERT [dbo].[Users] ([cId], [cPassword], [cType], [cGrpCopany], [cComp], [cUserName], [cUserAddress], [cUserNo]) VALUES (N'accountant1', N'123', N'accountant', N'10100001  ', N'1001 ', N'محمد', N'الرياض', N'10002')
INSERT [dbo].[Users] ([cId], [cPassword], [cType], [cGrpCopany], [cComp], [cUserName], [cUserAddress], [cUserNo]) VALUES (N'admin', N'123', N'admin', N'10100001  ', N'1001 ', N'خليل ابراهيم لملوم', N'الرياض ', N'10000')
INSERT [dbo].[Users] ([cId], [cPassword], [cType], [cGrpCopany], [cComp], [cUserName], [cUserAddress], [cUserNo]) VALUES (N'admin2', N'123', N'admin', N'10100001  ', N'1002 ', N'admin2', N'--', N'10001')
INSERT [dbo].[Users] ([cId], [cPassword], [cType], [cGrpCopany], [cComp], [cUserName], [cUserAddress], [cUserNo]) VALUES (N'user', N'112', N'user', N'10100001  ', N'1001 ', N'مستخدم 1', N'الرياض ', N'10001')
INSERT [dbo].[Users] ([cId], [cPassword], [cType], [cGrpCopany], [cComp], [cUserName], [cUserAddress], [cUserNo]) VALUES (N'user2', N'112', N'user', N'10100001  ', N'1002 ', N'مستخدم 2', N'الرياض', N'10000')
ALTER TABLE [dbo].[InventoryProducts] ADD  CONSTRAINT [DF_InventoryProducts_cDate]  DEFAULT (getdate()) FOR [cDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_cOrderDate]  DEFAULT (getdate()) FOR [cOrderDate]
GO
ALTER TABLE [dbo].[OrdersDetails] ADD  CONSTRAINT [DF_OrdersDetails_cOrderDate]  DEFAULT (getdate()) FOR [cOrderDate]
GO
/****** Object:  StoredProcedure [dbo].[addproduct]    Script Date: 6/26/2020 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addproduct]
@cGrpCompany VARCHAR(8),@cComp VARCHAR(5),@cPId VARCHAR(8),@cPName VARCHAR(100),@cPQtyInStock VARCHAR(10)
,@cPPrice VARCHAR(10),@cPImage IMAGE,@cPBcode VARCHAR(50),@cCId VARCHAR(5)


AS 


INSERT INTO [dbo].[Products]
           ([cGrpCompany]
           ,[cComp]
           ,[cPId]
           ,[cPName]
           ,[cPQtyInStock]
           ,[cPPrice]
           ,[cPImage]
           ,[cPBcode]
           ,[cCId])
     VALUES
           (@cGrpCompany
           ,@cComp
           ,@cPId 
           ,@cPName
           ,@cPQtyInStock
           ,@cPPrice
           ,@cPImage
           ,@cPBcode
           ,@cCId)

GO
/****** Object:  StoredProcedure [dbo].[splogin2]    Script Date: 6/26/2020 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[splogin2]
@id varchar(50),@pwd varchar(50)
AS
select [cId],[cPassword],[cType],[cGrpCopany],[cComp] from pos.dbo.Company,Users
where cId=@id AND cPassword=@pwd AND [cComp]=pos.dbo.Company.cCompany AND [cGrpCompany]=pos.dbo.Company.cGrpCompany
GO
/****** Object:  StoredProcedure [dbo].[spreadcategory]    Script Date: 6/26/2020 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spreadcategory]
@cmp varchar(50)
AS
select * from Categories 
where cComp=@cmp
GO
/****** Object:  StoredProcedure [dbo].[spreadcompany]    Script Date: 6/26/2020 2:36:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spreadcompany]
AS
select * from Company
GO
USE [master]
GO
ALTER DATABASE [pos] SET  READ_WRITE 
GO
