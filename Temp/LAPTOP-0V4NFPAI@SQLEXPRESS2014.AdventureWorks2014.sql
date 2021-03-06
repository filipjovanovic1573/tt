/*=============================================================
SCRIPT HEADER

VERSION:   1.01.0001
DATE:      10-22-2016 15.35.47
SERVER:    LAPTOP-0V4NFPAI\SQLEXPRESS2014

DATABASE:	AdventureWorks2014
	Data types:
		AccountNumber, Flag, Name, NameStyle, OrderNumber, Phone
	Fulltext catalogs:
		AW2014FullTextCatalog
	Schemas:
		db_accessadmin, db_backupoperator, db_datareader, db_datawriter
		db_ddladmin, db_denydatareader, db_denydatawriter, db_owner, db_securityadmin
		dbo, guest, HumanResources, INFORMATION_SCHEMA, Person, Production
		Purchasing, Sales, sys
	Tables:
		Address, Analiza_V3_imena_kolon, Analiza_V3_promet, AWBuildVersion
		DatabaseLog, Department, Employee, EmployeeDepartmentHistory, EmployeePayHistory
		ErrorLog, FrenchDataTest, JobCandidate, ProductProductPhoto, ProductReview
		ProductSubcategory, ScrapReason, Shift, TransactionHistory


=============================================================*/
SET ANSI_WARNINGS ON
SET XACT_ABORT ON
SET ARITHABORT ON
SET NOCOUNT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
GO

USE [AdventureWorks2014]
GO
-- Create Fulltext Catalog [AW2014FullTextCatalog]
Print 'Create Fulltext Catalog [AW2014FullTextCatalog]'
GO
CREATE FULLTEXT CATALOG [AW2014FullTextCatalog]
	WITH ACCENT_SENSITIVITY = ON
	AS DEFAULT
	AUTHORIZATION [dbo]
GO
-- BEGINNING TRANSACTION STRUCTURE
PRINT 'Beginning transaction STRUCTURE'
BEGIN TRANSACTION _STRUCTURE_
GO
-- Create Schema [Sales]
Print 'Create Schema [Sales]'
GO
CREATE SCHEMA [Sales]
	AUTHORIZATION [dbo]
GO
-- Create Schema [db_denydatareader]
Print 'Create Schema [db_denydatareader]'
GO
-- Create Schema [db_ddladmin]
Print 'Create Schema [db_ddladmin]'
GO
-- Create Schema [db_securityadmin]
Print 'Create Schema [db_securityadmin]'
GO
-- Create Schema [Purchasing]
Print 'Create Schema [Purchasing]'
GO
CREATE SCHEMA [Purchasing]
	AUTHORIZATION [dbo]
GO
-- Create Schema [db_backupoperator]
Print 'Create Schema [db_backupoperator]'
GO
-- Create Schema [db_datawriter]
Print 'Create Schema [db_datawriter]'
GO
-- Create Schema [db_denydatawriter]
Print 'Create Schema [db_denydatawriter]'
GO
-- Create Schema [db_accessadmin]
Print 'Create Schema [db_accessadmin]'
GO
-- Create Schema [db_owner]
Print 'Create Schema [db_owner]'
GO
-- Create Schema [db_datareader]
Print 'Create Schema [db_datareader]'
GO
-- Create Schema [Production]
Print 'Create Schema [Production]'
GO
CREATE SCHEMA [Production]
	AUTHORIZATION [dbo]
GO
-- Create Schema [Person]
Print 'Create Schema [Person]'
GO
CREATE SCHEMA [Person]
	AUTHORIZATION [dbo]
GO
-- Create Schema [HumanResources]
Print 'Create Schema [HumanResources]'
GO
CREATE SCHEMA [HumanResources]
	AUTHORIZATION [dbo]
GO
-- Create Type [dbo].[AccountNumber]
Print 'Create Type [dbo].[AccountNumber]'
GO
CREATE TYPE [dbo].[AccountNumber]
	FROM [nvarchar](15)
	NULL
GO
-- Create Type [dbo].[Phone]
Print 'Create Type [dbo].[Phone]'
GO
CREATE TYPE [dbo].[Phone]
	FROM [nvarchar](25)
	NULL
GO
-- Create Type [dbo].[OrderNumber]
Print 'Create Type [dbo].[OrderNumber]'
GO
CREATE TYPE [dbo].[OrderNumber]
	FROM [nvarchar](25)
	NULL
GO
-- Create Type [dbo].[NameStyle]
Print 'Create Type [dbo].[NameStyle]'
GO
CREATE TYPE [dbo].[NameStyle]
	FROM [bit]
	NOT NULL
GO
-- Create Type [dbo].[Name]
Print 'Create Type [dbo].[Name]'
GO
CREATE TYPE [dbo].[Name]
	FROM [nvarchar](50)
	NULL
GO
-- Create Type [dbo].[Flag]
Print 'Create Type [dbo].[Flag]'
GO
CREATE TYPE [dbo].[Flag]
	FROM [bit]
	NOT NULL
GO
-- Create Table [dbo].[FrenchDataTest]
Print 'Create Table [dbo].[FrenchDataTest]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FrenchDataTest] (
		[TestData]     [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FrenchDataTest] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [dbo].[ErrorLog]
Print 'Create Table [dbo].[ErrorLog]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog] (
		[ErrorLogID]         [int] IDENTITY(1, 1) NOT NULL,
		[ErrorTime]          [datetime] NOT NULL,
		[UserName]           [sysname] NOT NULL,
		[ErrorNumber]        [int] NOT NULL,
		[ErrorSeverity]      [int] NULL,
		[ErrorState]         [int] NULL,
		[ErrorProcedure]     [nvarchar](126) NULL,
		[ErrorLine]          [int] NULL,
		[ErrorMessage]       [nvarchar](4000) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLog]
	ADD
	CONSTRAINT [DF_ErrorLog_ErrorTime]
	DEFAULT (getdate()) FOR [ErrorTime]
GO
ALTER TABLE [dbo].[ErrorLog] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [dbo].[DatabaseLog]
Print 'Create Table [dbo].[DatabaseLog]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatabaseLog] (
		[DatabaseLogID]     [int] IDENTITY(1, 1) NOT NULL,
		[PostTime]          [datetime] NOT NULL,
		[DatabaseUser]      [sysname] NOT NULL,
		[Event]             [sysname] NOT NULL,
		[Schema]            [sysname] NULL,
		[Object]            [sysname] NULL,
		[TSQL]              [nvarchar](max) NOT NULL,
		[XmlEvent]          [xml] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DatabaseLog] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [dbo].[Analiza_V3_promet]
Print 'Create Table [dbo].[Analiza_V3_promet]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Analiza_V3_promet] (
		[index_glave]     [int] NOT NULL,
		[sm]              [varchar](6) NULL,
		[leto]            [smallint] NULL,
		[mesec]           [smallint] NULL,
		[konto]           [varchar](12) NULL,
		[znesek_zb]       [money] NULL,
		[znesek_zd]       [money] NULL,
		[znesek_nb]       [money] NULL,
		[znesek_nd]       [money] NULL,
		[znesek_pb]       [money] NULL,
		[znesek_pd]       [money] NULL,
		[znesek_sb]       [money] NULL,
		[znesek_sd]       [money] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Analiza_V3_promet]
	ON [dbo].[Analiza_V3_promet] ([index_glave])
	WITH ( FILLFACTOR = 90)
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Analiza_V3_promet] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [dbo].[Analiza_V3_imena_kolon]
Print 'Create Table [dbo].[Analiza_V3_imena_kolon]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Analiza_V3_imena_kolon] (
		[index_glave]             [int] NOT NULL,
		[ime_kolone]              [varchar](15) NOT NULL,
		[ime_kolone_v_izpisu]     [varchar](50) NULL,
		[vnos_plana]              [bit] NOT NULL,
		CONSTRAINT [PK_Analiza_V3_imena_kolon]
		PRIMARY KEY
		CLUSTERED
		([index_glave], [ime_kolone])
	WITH FILLFACTOR=90
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Analiza_V3_imena_kolon] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [dbo].[AWBuildVersion]
Print 'Create Table [dbo].[AWBuildVersion]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AWBuildVersion] (
		[SystemInformationID]     [tinyint] IDENTITY(1, 1) NOT NULL,
		[Database Version]        [nvarchar](25) NOT NULL,
		[VersionDate]             [datetime] NOT NULL,
		[ModifiedDate]            [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AWBuildVersion]
	ADD
	CONSTRAINT [DF_AWBuildVersion_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[AWBuildVersion] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [Production].[TransactionHistory]
Print 'Create Table [Production].[TransactionHistory]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[TransactionHistory] (
		[TransactionID]            [int] IDENTITY(100000, 1) NOT NULL,
		[ProductID]                [int] NOT NULL,
		[ReferenceOrderID]         [int] NOT NULL,
		[ReferenceOrderLineID]     [int] NOT NULL,
		[TransactionDate]          [datetime] NOT NULL,
		[TransactionType]          [nchar](1) NOT NULL,
		[Quantity]                 [int] NOT NULL,
		[ActualCost]               [money] NOT NULL,
		[ModifiedDate]             [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Production].[TransactionHistory]
	ADD
	CONSTRAINT [DF_TransactionHistory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[TransactionHistory]
	ADD
	CONSTRAINT [DF_TransactionHistory_ReferenceOrderLineID]
	DEFAULT ((0)) FOR [ReferenceOrderLineID]
GO
ALTER TABLE [Production].[TransactionHistory]
	ADD
	CONSTRAINT [DF_TransactionHistory_TransactionDate]
	DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [Production].[TransactionHistory] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [HumanResources].[Employee]
Print 'Create Table [HumanResources].[Employee]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Employee] (
		[BusinessEntityID]      [int] NOT NULL,
		[NationalIDNumber]      [nvarchar](15) NOT NULL,
		[LoginID]               [nvarchar](256) NOT NULL,
		[OrganizationNode]      [hierarchyid] NULL,
		[OrganizationLevel]     [smallint] NULL,
		[JobTitle]              [nvarchar](50) NOT NULL,
		[BirthDate]             [date] NOT NULL,
		[MaritalStatus]         [nchar](1) NOT NULL,
		[Gender]                [nchar](1) NOT NULL,
		[HireDate]              [date] NOT NULL,
		[SalariedFlag]          [dbo].[Flag] NOT NULL,
		[VacationHours]         [smallint] NOT NULL,
		[SickLeaveHours]        [smallint] NOT NULL,
		[CurrentFlag]           [dbo].[Flag] NOT NULL,
		[rowguid]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]          [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_CurrentFlag]
	DEFAULT ((1)) FOR [CurrentFlag]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_SalariedFlag]
	DEFAULT ((1)) FOR [SalariedFlag]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_SickLeaveHours]
	DEFAULT ((0)) FOR [SickLeaveHours]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_VacationHours]
	DEFAULT ((0)) FOR [VacationHours]
GO
ALTER TABLE [HumanResources].[Employee] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [HumanResources].[EmployeeDepartmentHistory]
Print 'Create Table [HumanResources].[EmployeeDepartmentHistory]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [HumanResources].[EmployeeDepartmentHistory] (
		[BusinessEntityID]     [int] NOT NULL,
		[DepartmentID]         [smallint] NOT NULL,
		[ShiftID]              [tinyint] NOT NULL,
		[StartDate]            [date] NOT NULL,
		[EndDate]              [date] NULL,
		[ModifiedDate]         [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
	ADD
	CONSTRAINT [DF_EmployeeDepartmentHistory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [HumanResources].[EmployeePayHistory]
Print 'Create Table [HumanResources].[EmployeePayHistory]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [HumanResources].[EmployeePayHistory] (
		[BusinessEntityID]     [int] NOT NULL,
		[RateChangeDate]       [datetime] NOT NULL,
		[Rate]                 [money] NOT NULL,
		[PayFrequency]         [tinyint] NOT NULL,
		[ModifiedDate]         [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[EmployeePayHistory]
	ADD
	CONSTRAINT [DF_EmployeePayHistory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[EmployeePayHistory] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [HumanResources].[JobCandidate]
Print 'Create Table [HumanResources].[JobCandidate]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [HumanResources].[JobCandidate] (
		[JobCandidateID]       [int] IDENTITY(1, 1) NOT NULL,
		[BusinessEntityID]     [int] NULL,
		[Resume]               [xml] NULL,
		[ModifiedDate]         [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[JobCandidate]
	ADD
	CONSTRAINT [DF_JobCandidate_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[JobCandidate] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [HumanResources].[Shift]
Print 'Create Table [HumanResources].[Shift]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Shift] (
		[ShiftID]          [tinyint] IDENTITY(1, 1) NOT NULL,
		[Name]             [dbo].[Name] NOT NULL,
		[StartTime]        [time](7) NOT NULL,
		[EndTime]          [time](7) NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Shift]
	ADD
	CONSTRAINT [DF_Shift_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[Shift] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [Person].[Address]
Print 'Create Table [Person].[Address]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[Address] (
		[AddressID]           [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[AddressLine1]        [nvarchar](60) NOT NULL,
		[AddressLine2]        [nvarchar](60) NULL,
		[City]                [nvarchar](30) NOT NULL,
		[StateProvinceID]     [int] NOT NULL,
		[PostalCode]          [nvarchar](15) NOT NULL,
		[SpatialLocation]     [geography] NULL,
		[rowguid]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]        [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Person].[Address]
	ADD
	CONSTRAINT [DF_Address_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[Address]
	ADD
	CONSTRAINT [DF_Address_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[Address] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [Production].[ProductProductPhoto]
Print 'Create Table [Production].[ProductProductPhoto]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Production].[ProductProductPhoto] (
		[ProductID]          [int] NOT NULL,
		[ProductPhotoID]     [int] NOT NULL,
		[Primary]            [dbo].[Flag] NOT NULL,
		[ModifiedDate]       [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductProductPhoto]
	ADD
	CONSTRAINT [DF_ProductProductPhoto_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductProductPhoto]
	ADD
	CONSTRAINT [DF_ProductProductPhoto_Primary]
	DEFAULT ((0)) FOR [Primary]
GO
ALTER TABLE [Production].[ProductProductPhoto] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [Production].[ProductReview]
Print 'Create Table [Production].[ProductReview]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductReview] (
		[ProductReviewID]     [int] IDENTITY(1, 1) NOT NULL,
		[ProductID]           [int] NOT NULL,
		[ReviewerName]        [dbo].[Name] NOT NULL,
		[ReviewDate]          [datetime] NOT NULL,
		[EmailAddress]        [nvarchar](50) NOT NULL,
		[Rating]              [int] NOT NULL,
		[Comments]            [nvarchar](3850) NULL,
		[ModifiedDate]        [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductReview]
	ADD
	CONSTRAINT [DF_ProductReview_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductReview]
	ADD
	CONSTRAINT [DF_ProductReview_ReviewDate]
	DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [Production].[ProductReview] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [Production].[ProductSubcategory]
Print 'Create Table [Production].[ProductSubcategory]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductSubcategory] (
		[ProductSubcategoryID]     [int] IDENTITY(1, 1) NOT NULL,
		[ProductCategoryID]        [int] NOT NULL,
		[Name]                     [dbo].[Name] NOT NULL,
		[rowguid]                  [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]             [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductSubcategory]
	ADD
	CONSTRAINT [DF_ProductSubcategory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductSubcategory]
	ADD
	CONSTRAINT [DF_ProductSubcategory_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Production].[ProductSubcategory] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [Production].[ScrapReason]
Print 'Create Table [Production].[ScrapReason]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ScrapReason] (
		[ScrapReasonID]     [smallint] IDENTITY(1, 1) NOT NULL,
		[Name]              [dbo].[Name] NOT NULL,
		[ModifiedDate]      [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ScrapReason]
	ADD
	CONSTRAINT [DF_ScrapReason_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ScrapReason] SET (LOCK_ESCALATION = TABLE)
GO

-- Create Table [HumanResources].[Department]
Print 'Create Table [HumanResources].[Department]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Department] (
		[DepartmentID]     [smallint] IDENTITY(1, 1) NOT NULL,
		[Name]             [dbo].[Name] NOT NULL,
		[GroupName]        [dbo].[Name] NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Department]
	ADD
	CONSTRAINT [DF_Department_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[Department] SET (LOCK_ESCALATION = TABLE)
GO

-- COMMITTING TRANSACTION STRUCTURE
PRINT 'Committing transaction STRUCTURE'
IF @@TRANCOUNT>0
	COMMIT TRANSACTION _STRUCTURE_
GO

SET NOEXEC OFF
GO
