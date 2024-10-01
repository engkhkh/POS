USE [master]
GO
/****** Object:  Database [pos]    Script Date: 6/26/2020 2:33:18 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 6/26/2020 2:33:19 PM ******/
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
/****** Object:  Table [dbo].[Clients]    Script Date: 6/26/2020 2:33:20 PM ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 6/26/2020 2:33:20 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 6/26/2020 2:33:21 PM ******/
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
/****** Object:  Table [dbo].[FinBAccounts]    Script Date: 6/26/2020 2:33:21 PM ******/
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
/****** Object:  Table [dbo].[FinCostCentre]    Script Date: 6/26/2020 2:33:21 PM ******/
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
/****** Object:  Table [dbo].[FinDayBook]    Script Date: 6/26/2020 2:33:22 PM ******/
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
/****** Object:  Table [dbo].[FinGenLedg]    Script Date: 6/26/2020 2:33:23 PM ******/
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
/****** Object:  Table [dbo].[FinLevels]    Script Date: 6/26/2020 2:33:23 PM ******/
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
/****** Object:  Table [dbo].[GrpCompanies]    Script Date: 6/26/2020 2:33:24 PM ******/
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
/****** Object:  Table [dbo].[Inventory]    Script Date: 6/26/2020 2:33:25 PM ******/
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
/****** Object:  Table [dbo].[InventoryProducts]    Script Date: 6/26/2020 2:33:25 PM ******/
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
/****** Object:  Table [dbo].[ItemsInventory]    Script Date: 6/26/2020 2:33:26 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 6/26/2020 2:33:26 PM ******/
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
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 6/26/2020 2:33:27 PM ******/
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
/****** Object:  Table [dbo].[PaymentType]    Script Date: 6/26/2020 2:33:27 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 6/26/2020 2:33:28 PM ******/
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
/****** Object:  Table [dbo].[Suppliers]    Script Date: 6/26/2020 2:33:28 PM ******/
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
/****** Object:  Table [dbo].[Units]    Script Date: 6/26/2020 2:33:28 PM ******/
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
/****** Object:  Table [dbo].[updateinvoice]    Script Date: 6/26/2020 2:33:29 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/26/2020 2:33:29 PM ******/
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
ALTER TABLE [dbo].[InventoryProducts] ADD  CONSTRAINT [DF_InventoryProducts_cDate]  DEFAULT (getdate()) FOR [cDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_cOrderDate]  DEFAULT (getdate()) FOR [cOrderDate]
GO
ALTER TABLE [dbo].[OrdersDetails] ADD  CONSTRAINT [DF_OrdersDetails_cOrderDate]  DEFAULT (getdate()) FOR [cOrderDate]
GO
/****** Object:  StoredProcedure [dbo].[addproduct]    Script Date: 6/26/2020 2:33:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[splogin2]    Script Date: 6/26/2020 2:33:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spreadcategory]    Script Date: 6/26/2020 2:33:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spreadcompany]    Script Date: 6/26/2020 2:33:30 PM ******/
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
