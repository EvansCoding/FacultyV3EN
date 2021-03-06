USE [master]
GO
/****** Object:  Database [FacultyV3EN]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE DATABASE [FacultyV3EN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FacultyV3EN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FacultyV3EN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FacultyV3EN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FacultyV3EN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FacultyV3EN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FacultyV3EN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FacultyV3EN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FacultyV3EN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FacultyV3EN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FacultyV3EN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FacultyV3EN] SET ARITHABORT OFF 
GO
ALTER DATABASE [FacultyV3EN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FacultyV3EN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FacultyV3EN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FacultyV3EN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FacultyV3EN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FacultyV3EN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FacultyV3EN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FacultyV3EN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FacultyV3EN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FacultyV3EN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FacultyV3EN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FacultyV3EN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FacultyV3EN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FacultyV3EN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FacultyV3EN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FacultyV3EN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FacultyV3EN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FacultyV3EN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FacultyV3EN] SET  MULTI_USER 
GO
ALTER DATABASE [FacultyV3EN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FacultyV3EN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FacultyV3EN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FacultyV3EN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FacultyV3EN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FacultyV3EN] SET QUERY_STORE = OFF
GO
USE [FacultyV3EN]
GO
/****** Object:  Schema [HangFire]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](1024) NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[Url_Image] [nvarchar](max) NULL,
	[Create_At] [datetime] NULL,
	[Update_At] [datetime] NULL,
	[Role_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_dbo.Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Url_Image] [nvarchar](max) NOT NULL,
	[Serial] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Banner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Confirguration]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Confirguration](
	[Id] [uniqueidentifier] NOT NULL,
	[Meta_Name] [nvarchar](max) NOT NULL,
	[Meta_Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Confirguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [uniqueidentifier] NOT NULL,
	[Meta_Name] [nvarchar](max) NOT NULL,
	[Meta_Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](1024) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Serial] [int] NOT NULL,
	[Place] [nvarchar](max) NULL,
	[DateOfEvents] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Url_Image] [nvarchar](300) NULL,
	[Url_Video] [nvarchar](300) NULL,
	[Url_LinkGoogle] [nvarchar](max) NULL,
	[Create_At] [datetime] NOT NULL,
	[Update_At] [datetime] NOT NULL,
	[Account_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Id] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](100) NULL,
	[Degree] [nvarchar](100) NOT NULL,
	[Url_Image] [nvarchar](200) NOT NULL,
	[Url_Facebook] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Serial] [int] NOT NULL,
	[Position] [nvarchar](max) NULL,
	[Academic_Rank] [nvarchar](max) NULL,
	[Specialized] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Native_Land] [nvarchar](max) NULL,
	[Url_Scientific_Works] [nvarchar](max) NULL,
	[Specialized_Research] [nvarchar](max) NULL,
	[Teaching] [nvarchar](max) NULL,
	[Create_At] [datetime] NOT NULL,
	[Update_At] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Lecturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Title] [nvarchar](1024) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Serial] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Url_Image] [nvarchar](300) NULL,
	[Url_Video] [nvarchar](300) NULL,
	[Url_LinkGoogle] [nvarchar](max) NULL,
	[Create_At] [datetime] NOT NULL,
	[Update_At] [datetime] NOT NULL,
	[Account_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sticky]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sticky](
	[Id] [uniqueidentifier] NOT NULL,
	[Meta_Name] [nvarchar](100) NOT NULL,
	[Meta_Value] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_dbo.Sticky] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Training_Process]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training_Process](
	[Id] [uniqueidentifier] NOT NULL,
	[Degree] [nvarchar](max) NULL,
	[Graduation_Year] [nvarchar](max) NULL,
	[Graduation_School] [nvarchar](max) NULL,
	[Graduation_Specialized] [nvarchar](max) NULL,
	[Lecturer_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_dbo.Training_Process] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 04/06/2020 9:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202003300732566_initialize_1', N'FacultyV3EN.Core.Migrations.Configuration', 0x1F8B0800000000000400ED5D4B6F1CB911BE07C87F68CC2909BC1A49CE2111A45DC823CB1056960C8DEC24A701D5C31911EEC76C3FB45282FD657BC84FCA5F08D94FBE9BEC668F2468E0CB886C7E64B18A5545B258FEDFEFFF3DFEE9310CBC0798A4288E4E26077BFB130F467EBC44D1FA649267AB1FFE36F9E9C73FFEE1F8E3327CF4BED5DFBD27DFE196517A32B9CFB2CDD1749AFAF73004E95E88FC244EE355B6E7C7E1142CE3E9E1FEFEDFA707075388212618CBF38E6FF22843212CFEC07FCEE2C8879B2C07C1E7780983B42AC735F302D5BB02214C37C087279373E0E741F6F4EDFDC7ABBD599CC0BD339001FC2BCAE06336F14E0304F0A0E630584D3C10457106323CE4A3AF299C67491CADE71B5C0082DBA70DC4DFAD4090C28A94A3F67353AAF60F0955D3B6610DE5E7691687968007EFAB699AF2CD7B4DF6A499463C911FF184674F84EA62324F26A7BE1F632E4C3CBEAFA3599090EF24535D7267AFC04230DDAB30DE79FC97EF1A51C11245FEBDF366F8833C812711CCB30404EFBC2FF95D80FC9FE1D36DFC1D4627511E04F488F198711D53808BBE24F10626D9D30D5C55745C2C27DE946D37E51B36CDA83625899F72847F5FE1BEC15D001B79986A9B7F0C010A6A042C5578AD4CBCCFE0F11246EBECFE64827930F1CED1235CD62515ECD708E1A5851B65490EADBBFD02D2F4D738596A7A3ED83FFCEB185D9FE3CFC9AFED13FD350916172158EBBAC63F8DBAD6F7344B20C8E0E234AB7BC28A05DEA2B07B889BA561C32BF080D6C522E325EA0146593AF16E605054A7F768532AB17A8D2DEA4FCE9338BC8983760557358B799C273E99A6585A7D0B9235CCCC8774057FD50FA8FC401C0E29570EA6A8B41D0A81900E85542C2A68662C4C45D35F3D18B6B61E2A3D9AE369AB2FB55AB4E6CA00255A42BC351D7A8BB240B7A6C7D2646730F513B4298DEAD67B2FDC942873A0CB2C3B9EC3043B3D75BF1751F6FED0DEFE04C01F5F0D13E579BDAAD7959D269EE3C59737AD3EC4789D83681493F3DED0DA75F7F40D2D61BC959E2E51F4FD531CAFB5EB6E745B6ACB0CB571ED4252DA93C6F51D626E79A3A2B0C6BDAC4A695A07D81402B0B3283B8BF2C22DCA4E5FEB7ADAE96B0B7DADDD8DA87435B355E9A5A9CBADC9004D4D00DE9AA6EE384970A5B0BAE449BEBD35DC53F21B5CF98EB3974C7DC082049341525542BC35B9EAF20046B2842E8FA84637C2C652881D8B154AD679521D400F904616EAAD49E5679881C596549EACEB6F20C847EFDB46AC32E00FBB76A8307682F49605E912FA84B1C3EC640DF2D644C9E03EE7609CFB9C196EEAA0D7AE2DF93A81CF409C892730E23D1996617817C7DF9FE16AF23E8EB4F37D3846AF5DF7B02371D9C9597A9CA28E1323373BFB531F2C6188FCC50D887482E1A6B7F906FA786ED0BFA1EE96DA4D5FAEBCFDAEBD6A861EE0E21244E35344D6F0DC47105BA715E6D83FE2E47BBA4D962D6E600A41E2DF8FCF3B08FCFB02FA4D1F6CDD26004598F0052EF7619A42F99144EDA52C64DFB707149ACF84E30ADDB7830E2F78BC41EE190FF6D6DCB44E3FC6CD22F99480655EF066F12FBCFEB7D9DFDCBF8F639D0D77DFE398264AB9D2DBDDCA38EB9B3FE136D105BDD6F73C43FEF7A741ABBA84786B6BD964F73E92C36AB47B37BDB7EAB57B3F4DD318AF3A2228EC197C7DCFCE8EFF63B4F4F4316E2515D40510A605CB0ADA60E9C0FDE3A914264509DAAC9D16B4BEFD6731FFC2134B9165466D714BD5352C3680CE09A5EC2D580B59DE9AB9A292BD3A518D49718FD20EAABC536307B5BFB7A7A35311EFD73977FD69D5E96CD5288D1CB476CCADCD90CC05AFE3AEA33318C00C7AA77E196F3E0329D9FA897A0E8FA7CF0025932AFA7AFD66B7D419C5A92E8A60D206828126AC5F30375F5358599CB4D24C3C5104730E33E1CEAFD550BC6C08E2C542D44A4100A82B3ADA978B4D685D1677B425FC91352ED74A47E3F23650D6BCBE6AEC00602F706440FC6D51372039C157209517041D10B5ACCA30DA95D3012273B8043451CC3B500B070749B16AF78943A0168620B24D281AF5913C588DD7099D66B41938BD3EA6C630B54AA060144B61CA1268417CB93AD4A48B16B5DBA6F6259BB1A214887405DB93CC451E88346BECAB8185A5065C69130DC972836A30713DE8D66E7FC45930B6BCD6B697228FD22E9A5932B19714A88C3EE3D9AB5DEBC64C3675C7D3F2955C55703C553CA73BFE0C361BDC3DF5BCAE2AF1E6E5DBBAD90F73FB9766618931F553C983B366B44D4F599C8035E46ACB7BA17394A41931FB77806C2C66CB50F88C760A144AB8EE89B3FB22176BD55C3720BFABEB31DD1BC3C65FE010DBE93CC71486580F16C44271D1882D3DF2D211042091EC3967719087916ADFAA6B5DDD8FD00055913946FBE88C86694BCD91DA3B471AA92D3547A2AED96828AAD81C8B3A20A6B1A8628B71B547C4CCB8DA6211EB78CA090D2FA7534150057F9E157CA365A1F418FA2E0A39A0C19A50351C6749549746344055648EC1047CD3484C858508D621DC8C00D685E638F5BD240D5397592CF8F2950FB3DACB228B1962DEF03053C4D458D056458A33B45565CFA338A858701EAB2AB6C3A2A3BD7940BA6EA7DAEA6A856A53EC08FA2A36199C815A9337DB29B5E7516A3BF5B1531F86EAA3DC1BBBD31FC5099DBDFE90371B477F885EB9CA237F269ED40798EEB8521D7CDAF345D5F0E56A76975ACB4E1B3F93B4F0A7D5EEA4863BE5B6979E2E8071A488BA7AA641A8624BACEA2E5900ABCA5F922494D70C4E45A0B89EE8C57B79CB1DD39D32BD3DBA75C7F5E642C99EEDEAA6E3F0DDDD315B19AACFFAEFE285B20EA18E5F63F71365D9F3B9DD6D983C0FD7D6589C9794A1EFCC794959B4DD835A47A73F4D5C3A4350536A8EC4059ED3705C95058D74EC1E43285DB15DF78A0910677D68AAC24E42C520705E52C52F7ACD2215F1AD984EEA0B8B796DC2BB99A96D4A779BD0BA5A61C38CAE36FB1A33219EC1DEA875438C63DCDC181421DE9986132A7BE1D671CD0AE4BABA1FB64A0BAABE793162DD04C6B813E62AA0C65E84550D77DE783F96B3810BD24BF8059DD5CD84B97C3BB3BB4312A0213823B2F827718E8C385F835D9C498243A654E7D6E3AA62467A8E4B2691EAF1F0A126BD995A463FD9B2B46C65726BA299363AAAEBE530930E137B1DACE422CF6C8EB6A96686D12E92999306ACF59CBA02CB0137A511705B61A75724445F163B2EEF22250F2E9AC71606940E96066D3C9EED898914C4D69D94B0C7209EAF27B31A640742641020F8A2444A437BB75809118AFC278D0B5295347F37118A557460F7FF0220840B969F4C3C4CFE035A9250C1F9539AC1B094CAF92FC12C40C5D573FDC16710A1154CB3F221D9E4709FE42860FEF7809793C97F9AA64BE69D9B4D3AFF8B68091F4F26FFF17EDBFE4BB93C42BFE4104F7771564102F287A478881EC84104D993F1192D0666D2970297193B07265671366421B5488DFCA7103CFE9986EBF52C9E1C8164DC6376A39405FCABF8BE408D3153098E5AAE09C09177F1CF4585F1CEBB4EF0023FF2F6B1C86B87313CCDFBAB5E5C4C060D776B409210D71D3897EF56B90A7A6472410476484EF4414B5296F7BCEF6262F3EADE217BBA94EA467C336CA930F814BA2E81C58CB9E36BC97EC9437A23D1FBD501AAB2855169CB21B9D914F9CB77CAF26D2BCB9D5ADAA9A5E7544B8A64DDAF5A2DC9361B26EB7B7836EA573D6D526DDE4F2F9AEFCC4651B3EE123ABF6A860AE9758671414C9933CAE2526743DE3163EBCCD064147ED5DC303A933AE8712645E7F23501B54FDDEB6CA8668E63DF83393EF1AEBB834A3AAFAE7C32EC73CF769FA9F699610767295C4EDC414EB234EFED204449E2C04178662E48CF1CB583F07479685D4DA1906B76D85C72F9645FF9FECA65B6D5576DBAE4D6A0175715494E5D61B2894C9DA13AD639CCFDEE807D3A8533C26D8B32C7E8AB9665A5533CD8F4AAFD63DDE9D516D3770E4D63C9DE8A9867E8C42098FD30213C0301DE6CA519519842E8E39704453EDA80801B36F79DA15491796C10F99A33B8811111229634939EF4A16A0D3027E15D13305216D3A12C6FA30ACD5395BE02762BB249BC40669B27731D9ABCD542621C315CF126DF39B76D044B13B7B8056E0F4967FBCC496B451F981A8E658ADABE02A5791FEA5CA80C9EEF887D7604353A97302E12903A306293FCF14C9526EDD5E5EC2DE3FEF0CEEA8E5CDD959E8DB384BE327017C97E65B8C6698095598065A816F98135E98165C8BD52071B640E96F5D52FBBB02EB9B0A217ABCCC3DAC4C3B20E7AA725364A4A2CEBB15FEAE2274DE262592FCF9BD458969656A2E3C4DD84F890A823E4D9823C37698BAD49A3B5CE8B4D4D2CA422D6926431152F3DF7B034C3B09678952290BF9A309F0E8B64C262483E760BF0E4A3B03C22C0FE498AD62D04796810419F71089A6F2EA2555C3B27DC88EA4F24671B4BEC2D9C26195A61ED5CD15A9CF516471EE43EE30E2E2FA2EB3CDBE4192619867701A38D887FA3EBBFC898CC8EF9F8BA08C94A5D90808789C8C1EF75F42147C1B219F7B9E4004601411CA74F109797BCC47E5806D74F0DD295906F4205544D5FE3EFDDC2701360B0F43A9A8307D8676C5F537809D7C07FAA5F56A841BA19C14EFBF11902EB04846985D1B6C77F62195E868F3FFE1F8517302DC5920000, N'6.4.0')
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [Url_Image], [Create_At], [Update_At], [Role_ID]) VALUES (N'a8e3185d-cb84-460a-a522-c3616e204699', N'evans@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Evans Coding', N'/Media/Uploads/Account/student_Kiet.jpg', CAST(N'2020-03-24T00:00:00.000' AS DateTime), CAST(N'2020-03-31T10:06:22.663' AS DateTime), N'ac2c04b7-212c-4795-948b-daf771f27319')
INSERT [dbo].[Account] ([Id], [Email], [Password], [FullName], [Url_Image], [Create_At], [Update_At], [Role_ID]) VALUES (N'6e3c8f1d-36a5-49b7-86f0-de12eb58f894', N'admin@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyen Kiet', N'/Media/Uploads/Account/student_Kiet.jpg', CAST(N'2020-03-24T00:00:00.000' AS DateTime), CAST(N'2020-03-31T10:06:07.990' AS DateTime), N'8cd2a365-ca4a-4102-9d83-69b1fb390fd3')
INSERT [dbo].[Banner] ([Id], [Title], [Url_Image], [Serial]) VALUES (N'72bca708-d359-4bbf-a344-ab880109cf1f', N'Banner1', N'/Media/Uploads/Banner/1920x1080_dai-hoc-dong-thap.jpg', 0)
INSERT [dbo].[Confirguration] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'b1fb631c-4f55-42f3-8628-177810d86390', N'Meta_Keywords', N'dai hoc; dong thap; university; vietnam; saigon; hanoi; dongthap; ky thuat cong nghe; dthu; ktcn; khoa ky thuat cong nghe; dong thap university;')
INSERT [dbo].[Confirguration] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'da4b778d-04ee-4273-9f39-9afea784c9ad', N'Messenger', N'#')
INSERT [dbo].[Confirguration] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'6b300161-9f93-4a8e-b23d-ded2a6a16b7e', N'Meta_Description', N'Information sharing website for students'' study and research, activities of Faculty of Engineering - Technology')
INSERT [dbo].[Contact] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'02083573-c1b2-4dbe-b2d0-0c21533dd01e', N'Map', N'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15696.135513996134!2d105.644022!3d10.418884!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x7ea6812b3aa8d308!2zS2hvYSBL4bu5IHRodeG6rXQgLSBDw7RuZyBuZ2jhu4cgLSBUcsaw4budbmcgxJBIIMSQ4buTbmcgVGjDoXA!5e0!3m2!1svi!2sus!4v1583689035142!5m2!1svi!2sus')
INSERT [dbo].[Contact] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'2a7fec6c-4e1b-45be-b443-9a8452b52bd6', N'Address', N'A7 Building, Dong Thap University, 783 - Pham Huu Lau - Ward 6, Cao Lanh City')
INSERT [dbo].[Contact] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'e0d4420b-22e2-47d0-b835-e77a010f8edd', N'Phone', N'(0277) 3881624 ')
INSERT [dbo].[Contact] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'3156d7b0-50d6-4d8d-9099-fe6c4bf5776d', N'Email', N'tnmtdhdt@googlegroups.com')
INSERT [dbo].[Events] ([Id], [Title], [Description], [Content], [Serial], [Place], [DateOfEvents], [Status], [Url_Image], [Url_Video], [Url_LinkGoogle], [Create_At], [Update_At], [Account_ID]) VALUES (N'4c2ced49-f03b-4417-8303-ab8e0081fbb6', N'Student Festival ', N'Students are organized by the Faculty of Engineering and Technology at Dong Thap University to create favorable conditions for students to interact with each other. ', N'<p>Students are organized by the Faculty of Engineering and Technology at Dong Thap University to create favorable conditions for students to interact with each other.</p>', 0, N'Dong Thap University', CAST(N'2020-02-11T00:00:00.000' AS DateTime), 1, N'/Media/Uploads/Posts/4.png', N'#', N'#', CAST(N'2020-03-30T14:53:15.273' AS DateTime), CAST(N'2020-04-06T21:14:34.073' AS DateTime), N'6e3c8f1d-36a5-49b7-86f0-de12eb58f894')
INSERT [dbo].[Events] ([Id], [Title], [Description], [Content], [Serial], [Place], [DateOfEvents], [Status], [Url_Image], [Url_Video], [Url_LinkGoogle], [Create_At], [Update_At], [Account_ID]) VALUES (N'2c2a46be-2c62-41a6-a41a-ab8e008c83b3', N'Gala IT', N'IT gala is an upcoming event, aimed at helping students from all faculties interact with each other.', N'<pre id="tw-target-text" class="tw-data-text tw-text-large tw-ta" dir="ltr" data-placeholder="Bản dịch"><span lang="en">IT gala is an upcoming event, aimed at helping students from all faculties interact with each other.</span></pre>', 0, N'Dong Thap University', CAST(N'2020-03-24T00:00:00.000' AS DateTime), 1, N'/Media/Uploads/Posts/background.png', N'#', N'#', CAST(N'2020-03-30T15:31:35.850' AS DateTime), CAST(N'2020-03-30T21:37:04.203' AS DateTime), N'6e3c8f1d-36a5-49b7-86f0-de12eb58f894')
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'9a7d5c54-3bcc-4a5b-9f15-ab8900700419', N'Nguyen Huu Long', N'D2570570.000368', N'Master of Science', N'/Media/Uploads/Lecturers/nguyenhuulong.jpg', N'#', N'0918855720', N'nhlong@dthu.edu.vn', 0, N'Head of Land Management Department', N'...', N'Soil Science', N'Lecturer', N'Dong Thap', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570570000368', N'Geodetic map, Land management', N'Surveying cadastral maps, cadastral measurement, construction measurements, urban-rural planning, application of AutoCad, MicroStation, MapInfo software in land management specialty.', CAST(N'2020-03-25T13:47:50.270' AS DateTime), CAST(N'2020-03-25T14:10:56.343' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'ba54b572-0597-4f0b-8e07-ab890074cda4', N'Dang Quoc Bao', N'D2570290.000172', N' PhD', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Giảng viên', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000172', N'...', N'...', CAST(N'2020-03-25T14:05:16.063' AS DateTime), CAST(N'2020-03-25T14:10:50.450' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'39946d3a-53d9-49dc-a371-ab8900752a0c', N'Tran Le Chan', N'D2570290.000403', N'Master', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'...', N'...', N'....', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000403', N'...', N'...', CAST(N'2020-03-25T14:06:34.920' AS DateTime), CAST(N'2020-03-25T14:10:43.817' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'dfcd7256-67d7-4af1-bcb7-ab890075a230', N'Vo Cong Chuong', N'D2570290.000174', N'...', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'Associate Professor Ph.D', N'...', N'...', N'Lecturer', N'...', N'#', N'...', N'...', CAST(N'2020-03-25T14:08:17.440' AS DateTime), CAST(N'2020-03-25T14:10:37.093' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'260ea49f-7486-4d05-87a1-ab890076acf0', N'Nguyen Thi My Dung', N'D2570290.000213', N'Master', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'...', N'...', 0, N'Deputy Head of Department of Information Technology', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000213', N'...', N'...', CAST(N'2020-03-25T14:12:05.063' AS DateTime), CAST(N'2020-03-25T14:12:05.063' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'2b5dd175-3ca1-4af5-8735-ab890076ec6c', N'Nguyen Huynh Thanh Ha', N'D2570290.000247', N'PhD', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'#', N'...', N'...', CAST(N'2020-03-25T14:12:59.237' AS DateTime), CAST(N'2020-03-25T14:12:59.237' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'c0fdb942-69cf-411b-b466-ab8900772205', N'Huynh Thi My Hong', N'D2570290.000466', N'...', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'...', N'...', N'#', N'...', N'...', CAST(N'2020-03-25T14:13:44.977' AS DateTime), CAST(N'2020-03-25T14:13:44.977' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'add376b3-1f26-4a9d-acde-ab8900775076', N'Tran Kim Huong', N'D2570290.000620', N'Master', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000620', N'...', N'...', CAST(N'2020-03-25T14:14:24.607' AS DateTime), CAST(N'2020-03-25T14:14:24.607' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'e531bd33-e300-49e4-b505-ab8900779751', N'Nguyen Minh Kha', N'D2570290.000616', N'PhD student', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000616', N'...', N'...', CAST(N'2020-03-25T14:15:25.070' AS DateTime), CAST(N'2020-03-25T14:15:25.070' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'1920b6da-1031-4659-8a31-ab890077c6cf', N'Nguyen Tuan Khanh', N'D2570290.000209', N'Associate Professor Ph.D', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'#', N'...', N'...', CAST(N'2020-03-25T14:16:05.597' AS DateTime), CAST(N'2020-03-25T14:16:05.597' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'6fb58e9a-ff9c-48ef-9dc5-ab8900780722', N'Nguyen Thi Thuy Linh', N'D2570290.000173', N'Master', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000173', N'...', N'...', CAST(N'2020-03-25T14:17:00.487' AS DateTime), CAST(N'2020-03-25T14:17:00.487' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'5e6caf74-d946-40d4-b818-ab8900784742', N'Nguyen Van Lot', N'D2570290.000210', N'PhD', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000210', N'...', N'...', CAST(N'2020-03-25T14:17:55.207' AS DateTime), CAST(N'2020-03-25T14:17:55.207' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'ed85aa98-c535-441c-a153-ab8900787f4f', N'Luong Thai Ngoc', N'D2570290.000290', N'PhD', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000290', N'...', N'...', CAST(N'2020-03-25T14:18:43.037' AS DateTime), CAST(N'2020-03-25T14:18:43.037' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'774f4f13-cce2-4288-8282-ab890078aaaa', N'Nguyen Trong Nhan', N'D2570030.000298', N'Master', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570030000298', N'...', N'...', CAST(N'2020-03-25T14:19:20.030' AS DateTime), CAST(N'2020-03-25T14:19:20.030' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'6e118060-c40e-4ce2-a5a3-ab890078d573', N'Nguyen Thi Thanh Thao', N'D2570290.000543', N'Master', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000543', N'...', N'...', CAST(N'2020-03-25T14:19:56.543' AS DateTime), CAST(N'2020-03-25T14:19:56.543' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'284453ad-c094-4e93-b463-ab890078f752', N'Le Minh Thu', N'D2570290.000542', N'Master', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570290000542', N'...', N'...', CAST(N'2020-03-25T14:20:25.447' AS DateTime), CAST(N'2020-03-25T14:20:25.447' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'e4a56f5d-858c-450c-9956-ab8900792418', N'Nguyen Ho', N'D2570150.000349', N'...', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'...', N'...', N'#', N'...', N'...', CAST(N'2020-03-25T14:21:03.653' AS DateTime), CAST(N'2020-03-25T14:21:03.653' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'b8edf8bd-4ec6-4781-bd57-ab89007985a9', N'Pham The Hung', N'D2570570.000440', N'Master of engineering', N'/Media/Uploads/Lecturers/phamthehung.jpg', N'#', N'0938612775', N'pthung@dthu.edu.vn', 3, N'Assistant dean', N'...', N'Map, remote sensing and geographic information system', N'Lecturer', N'An Giang', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570570000440', N'Geographic information system', N'General cartography, Cadastral map technique, Database management system (for students in Land Management), Geographic Information System, Applied Remote Sensing, Global Positioning System GPS.', CAST(N'2020-03-25T14:22:26.910' AS DateTime), CAST(N'2020-03-31T10:06:43.630' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'fb20fd64-419f-4f40-90db-ab890079facb', N'Lam Tuyet Huong', N'D2570570.000571', N'...', N'/Media/Uploads/Lecturers/lamtuyethuong.jpg', N'#', N'0985452287', N'lamhuongbt@gmail.com', 0, N'Teaching staff', N'...', N'Map, Remote Sensing and Geographic Information System', N'Giảng viên', N'Ben Tre', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570570000571', N'Map, Remote Sensing and Geographic Information System', N'...', CAST(N'2020-03-25T14:24:06.863' AS DateTime), CAST(N'2020-03-25T14:24:06.863' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'e49d6615-1327-473e-98a3-ab89007a6920', N'Ngo Thach Thao Ly', N'D2570570.000533', N'Master of Science', N'/Media/Uploads/Lecturers/ngothachthaoly.jpg', N'#', N'0918127713', N'nttly@dthu.edu.vn', 0, N'Teaching staff', N'...', N'Land Management', N'Lecturer', N'Soc Trang', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570570000533', N'Land Management', N'Land law, Land valuation, Land use planning', CAST(N'2020-03-25T14:25:41.013' AS DateTime), CAST(N'2020-03-25T14:25:41.013' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'65ba42a8-efea-43fa-b563-ab89007abcae', N'La Van Huynh Minh', N'D2570570.000547', N'Master of Science', N'/Media/Uploads/Lecturers/lavanhungminh.jpg', N'#', N'0986307790', N'lvhminh@dthu.edu.vn', 0, N'Teaching staff', N'...', N'Land Management', N'Lecturer', N'Dong Thap', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570570000547', N'Land Management', N'Land information management, GIS, Remote sensing, Land evaluation', CAST(N'2020-03-25T14:26:52.310' AS DateTime), CAST(N'2020-03-25T14:41:51.943' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'da5250a8-e518-44c4-bd6f-ab89007b17b6', N'Nguyen Thi Phuong', N'D2570570.000417', N'Master of Science', N'/Media/Uploads/Lecturers/nguyenthiphuong.jpg', N'#', N'0939001230', N'ntphuong@dthu.edu.vn', 0, N'Division Trade Union leader', N'...', N'Natural resource management', N'Lecturer', N'Dong Thap', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570570000417', N'Soil Science, Natural Resources and Environment Management', N'Environment and Natural Resources Management, Faded, Phi Phi', CAST(N'2020-03-25T14:28:09.990' AS DateTime), CAST(N'2020-03-25T14:28:09.990' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'564f4a76-5807-4568-a6c8-ab89007b7eb2', N'Phan Van Tuan', N'D2570570.000649', N'Master', N'/Media/Uploads/Lecturers/ttuan.jpg', N'#', N'0914033098', N'pvtuan@dthu.edu.vn', 0, N'Student Management - Secretary of the Delegation', N'...', N'Education Management', N'Lecturer', N'Dong Thap', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570570000649', N'Geographic experience operations, soft skills and educational management.', N'- Business management skills belt management; Job-seeking skills and Entrepreneurship skills Environmental science. - Topic: Building capacity to organize and organize creative experience activities in teaching; Instructions for using Microsoft Photo Story to create photo stories; Organizing experiences and scientific and technical activities for high school students; Guide to organize experiential activities in high school; Guide students to participate in the contest of Science and Innovation TTN; Building a school model associated with local reality; Guidelines for implementing the School model in association with local practices; Action education method (Project Windy). - Basic skills of students: Self-management skills; Self-study skills; Interpersonal and interpersonal skills; Teamwork skill; Speaking skill; Reading skills; Writting skill; Listening Skills; Debate skills; Problem-solving skills.', CAST(N'2020-03-25T14:29:37.870' AS DateTime), CAST(N'2020-03-25T14:29:37.870' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'fa38f64f-0f33-4dee-8940-ab89007bd24d', N'Le Diem Kieu', N'D2570410.000490', N'PhD', N'/Media/Uploads/Lecturers/ldkieu.png', N'#', N'0855559098', N'ldkieu@dthu.edu.vn', 0, N'Teaching staff', N'...', N'Ecology, Soil and water environment', N'Lecturer', N'Vinh Long', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570410000490', N'Environmental science', N'Ecology, Applied environmental ecology; Conserving biodiversity', CAST(N'2020-03-25T14:30:49.213' AS DateTime), CAST(N'2020-03-25T14:30:49.213' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'4956b491-3323-443d-9397-ab89007c292b', N'Nguyen Thi Hai Ly', N'D2570410.000389', N'PhD', N'/Media/Uploads/Lecturers/nguyenthihaily.jpg', N'#', N'0919466245', N'nthly@dthu.edu.vn', 0, N'Teaching staff', N'...', N'Environmental science, Soil and water environment', N'Lecturer', N'Dong Thap', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570410000389', N'Environmental science', N'Environmental Pollution and Environmental Biotechnology.', CAST(N'2020-03-25T14:32:03.343' AS DateTime), CAST(N'2020-03-25T14:32:03.343' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'6ff4089f-e96b-461c-8a3a-ab89007c880b', N'Pham Quoc Nguyen', N'D2570410.000367', N'PhD', N'/Media/Uploads/Lecturers/pqnguyen.jpg', N'#', N'0983254777', N'pqnguyen@dthu.edu.vn', 0, N'Head of Department of Environmental Science', N'...', N'Environment', N'Lecturer', N'Dong Thap', N'#', N'Environment', N'Soil and water environment, Environmental informatics, Environmental impact assessment', CAST(N'2020-03-25T14:33:24.303' AS DateTime), CAST(N'2020-03-25T14:41:45.223' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'70c1e833-ce04-411a-be85-ab89007cc466', N'Nguyen Thi Hong Nho', N'D2570410.000603', N'Master', N'/Media/Uploads/Lecturers/nguyenthihongnho.jpg', N'#', N'0988245452', N'nguyenthihongnho85@yahoo.com', 0, N'Teaching staff', N'...', N'Aquaculture', N'Lecturer', N'Dong Thap', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570410000603', N'Aquaculture', N'...', CAST(N'2020-03-25T14:34:15.803' AS DateTime), CAST(N'2020-03-25T14:34:15.803' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'9367b5a8-0095-4198-8aa2-ab89007d2150', N'Nguyen Huu Tan', N'D2570410.000612', N'Master of Science', N'/Media/Uploads/Lecturers/nguyenhuutan1.jpg', N'#', N'0918491663', N'nhtan@dthu.edu.vn', 0, N'Head of Aquaculture', N'...', N'Aquatic Science', N'Lecturer', N'Dong Thap', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570410000612', N'Research on seed production, commercial farming and disease prevention and treatment in Aquaculture.', N'Technology for raising freshwater fish; Aquaculture; Fish disease; Aquatic works and equipment; Crustacean rearing techniques; Seaweed farming techniques; Applied immunology in aquaculture; Preventing and treating parasitic diseases in aquatic animals; Techniques for raising natural food; Technology for producing freshwater fish breeds; Introduction to the agricultural system, ...', CAST(N'2020-03-25T14:35:35.093' AS DateTime), CAST(N'2020-03-25T14:41:38.200' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'3e352fad-e7e4-4e42-af88-ab89007d7300', N'Nguyen Thi Thanh', N'D2570410.000549', N'Master of Science', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'0939001230', N'nguyenthanhnt2@gmail.com', 0, N'Teaching staff', N'...', N'Aquaculture', N'Lecturer', N'Hai Duong', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570410000549', N'Soil Science, Natural Resources and Environment Management', N'Environment and Natural Resources Management, Faded, Phi Phi', CAST(N'2020-03-25T14:36:44.800' AS DateTime), CAST(N'2020-03-25T14:36:44.800' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'4c9dc343-80e5-4ad1-8dd5-ab89007d94d7', N'Nguyen Thi Thuy', N'D2570410.000544', N'...', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'...', N'...', N'#', N'...', N'...', CAST(N'2020-03-25T14:37:13.677' AS DateTime), CAST(N'2020-03-25T14:37:13.677' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'e5ca63b8-48be-4045-b48c-ab89007df824', N'Bui Minh Triet', N'D2570410.000615', N'Master', N'/Media/Uploads/Lecturers/noavatar-male.png', N'#', N'0364511943', N'bmtriet@dthu.edu.vn', 0, N'Teaching staff', N'...', N'Enviromental engineer', N'Lecturer', N'Dong Thap', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570410000615', N'Environmental technology and biofuels', N'Modeling the environment; Management and treatment of solid waste; Organic waste management; Technical wastewater.', CAST(N'2020-03-25T14:38:38.413' AS DateTime), CAST(N'2020-03-30T22:15:49.010' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'bc1db3fe-9a60-43cc-aaaf-ab89007e22fc', N'Ha Huynh Hong Vu', N'D2570410.000621', N'Master', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'...', N'...', 0, N'...', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570410000621', N'...', N'...', CAST(N'2020-03-25T14:39:14.973' AS DateTime), CAST(N'2020-03-25T14:39:14.973' AS DateTime))
INSERT [dbo].[Lecturer] ([Id], [FullName], [Code], [Degree], [Url_Image], [Url_Facebook], [Phone], [Email], [Serial], [Position], [Academic_Rank], [Specialized], [Title], [Native_Land], [Url_Scientific_Works], [Specialized_Research], [Teaching], [Create_At], [Update_At]) VALUES (N'0bfaee2a-0a4c-45f1-a05a-ab89007e5a60', N'Le Thi My Hanh', N'D2570450.000582', N'Master', N'/Media/Uploads/Lecturers/noavatar-female.png', N'#', N'...', N'...', 0, N'Learning management officer', N'...', N'...', N'Lecturer', N'...', N'http://khcn.dthu.edu.vn/Author.aspx?id=D2570450000582', N'...', N'...', CAST(N'2020-03-25T14:40:02.237' AS DateTime), CAST(N'2020-03-25T14:40:02.237' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Serial], [Status], [Url_Image], [Url_Video], [Url_LinkGoogle], [Create_At], [Update_At], [Account_ID]) VALUES (N'ead8513f-2858-4570-b7d3-ab8e00854381', N'Admissions 2020 - 2021', N'Faculty of technology and technology announced enrollment in 2020 - 2021', N'<h2 style="text-align: center;"><span style="color: #3366ff;"><strong>ONLINE SUPPORT LINKS FOR REGISTERING METHODS</strong></span></h2>
<p style="text-align: justify;">1. Method 1: Admission according to high school grade 12 results</p>
<p style="text-align: justify;">- Online registration link for candidates with unregistered majors:</p>
<p style="text-align: justify;">   <span style="color: #ff0000;">https://forms.gle/csnj239NJb7cAipT6</span></p>
<p style="text-align: justify;">- Link online registration for candidates with the aptitude exam:</p>
<p style="text-align: justify;">  <span style="color: #ff0000;">https://forms.gle/C7HN3utKWmiA17zu5</span></p>
<p style="text-align: justify;">2. Method 2: Direct admission for pedagogy</p>
<p style="text-align: justify;">- Link online registration:</p>
<p style="text-align: justify;">  <span style="color: #ff0000;">https://forms.gle/onv1U3Xz5z59YLea6</span></p>
<p style="text-align: justify;">3. Method 3: Admission according to the results of the 2020 National University''s Capacity Assessment Exam</p>
<p style="text-align: justify;">- Link online registration:</p>
<p style="text-align: justify;">   <span style="color: #ff0000;">https://forms.gle/Z5rBxFQDVquUk6fm9</span></p>', 0, 1, N'/Media/Uploads/Posts/2.png', N'#', N'#', CAST(N'2020-03-30T15:05:11.897' AS DateTime), CAST(N'2020-03-30T21:29:42.107' AS DateTime), N'6e3c8f1d-36a5-49b7-86f0-de12eb58f894')
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Serial], [Status], [Url_Image], [Url_Video], [Url_LinkGoogle], [Create_At], [Update_At], [Account_ID]) VALUES (N'4a697249-5963-4c6b-8a0e-ab8e008c155d', N'News about SARS-CoV-2 ', N'Covid-19 virus can survive up to 96 hours on smartphone screens, you pay attention to hygiene these days. ', N'<p style="text-align: justify;">Accordingly, the Ministry of Health has launched a page on acute respiratory infections caused by new strains of Corona virus on the website of the Ministry of Health with the domain name https://ncov.moh.gov.vn and an information app about nCoV disease called Vietnam Health. The launch of the website and application of Vietnam Health app provides an official source of information about the nCoV epidemic, contributing to help people as well as medical teams and doctors to actively respond to epidemic situations, repel unfounded fake information pages, causing confusion, anxiety in public opinion. Residents can also register information to receive instructions, self-isolation in case of suspected infection.</p>', 0, 1, N'/Media/Uploads/Posts/4.png', N'#', N'#', CAST(N'2020-03-30T15:30:01.697' AS DateTime), CAST(N'2020-04-06T21:14:17.173' AS DateTime), N'6e3c8f1d-36a5-49b7-86f0-de12eb58f894')
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Serial], [Status], [Url_Image], [Url_Video], [Url_LinkGoogle], [Create_At], [Update_At], [Account_ID]) VALUES (N'c50f1ede-db63-482f-88e5-ab8e008c3c4b', N'IELTS Teaching Method', N'Training IELTS teaching methodology for Dong Thap English teachers and teachers', N'<p>Training IELTS teaching methodology for Dong Thap English teachers and teachers.</p>', 0, 1, N'/Media/Uploads/Posts/3.jpg', N'#', N'#', CAST(N'2020-03-30T15:30:34.913' AS DateTime), CAST(N'2020-03-30T22:23:52.090' AS DateTime), N'6e3c8f1d-36a5-49b7-86f0-de12eb58f894')
INSERT [dbo].[News] ([Id], [Title], [Description], [Content], [Serial], [Status], [Url_Image], [Url_Video], [Url_LinkGoogle], [Create_At], [Update_At], [Account_ID]) VALUES (N'809fb269-fcf6-4903-922a-ab8e00e4ba28', N'MoU Signing Ceremony', N'MoU Signing Ceremony Dong Thap University and Qingdao University of Science and Technology, China and SaiLun (Vietnam) Co., LTD.', N'<p style="text-align: justify;">On 23rd December 2019, at the Rector''s meeting room, Dong Thap University discussed cooperation programs and signed a memorandum of understanding with Qingdao University of Science and Technology (China) and SaiLun (Vietnam) Co., LTD.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="/Media/Uploads/Posts/1_DSC9094.jpg" alt="Discussing the cooperation programs" width="600" height="392" /></p>
<p style="text-align: center;"><em>Discussing the cooperation programs</em></p>
<p style="text-align: justify;"><em>According to the memorandum between 3 organizations, Dong Thap University and Qingdao University of Science and Technology (China) and SaiLun (Vietnam) Co., Ltd. will cooperate on fields such as scientific research; joint training programs which are the strengths of the two universities; organize lecturer and student exchange programs ... and internships for students.</em></p>
<p style="text-align: justify;"><em><img style="display: block; margin-left: auto; margin-right: auto;" src="/Media/Uploads/Posts/3_DSC9136.jpg" alt="" width="600" height="428" /><img style="display: block; margin-left: auto; margin-right: auto;" src="/Media/Uploads/Posts/4_DSC9143.jpg" alt="" width="600" height="401" />One of Dong Thap University''s strategic policies in the current integration period is to promote international cooperation programs through scientific research, joint training programs, international student and lecturer exchange with universities in the world in general and to improve the training quality to meet the demand of domestic and foreign enterprises in particular.</em></p>', 0, 1, N'/Media/Uploads/Posts/3_DSC9136.jpg', N'#', N'#', CAST(N'2020-03-30T20:52:46.213' AS DateTime), CAST(N'2020-03-30T21:31:22.540' AS DateTime), N'6e3c8f1d-36a5-49b7-86f0-de12eb58f894')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'8cd2a365-ca4a-4102-9d83-69b1fb390fd3', N'ADMIN')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ac2c04b7-212c-4795-948b-daf771f27319', N'POSTER')
INSERT [dbo].[Sticky] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'ebbf1ea3-0a09-4919-aa9a-6f04086d8c42', N'Home', N'https://www.dthu.edu.vn/')
INSERT [dbo].[Sticky] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'1a0ecb96-ff94-4523-a9c6-8bddababcbe0', N'Language', N'http://evanscoding1999-001-site1.htempurl.com/')
INSERT [dbo].[Sticky] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'0dbe9667-af3e-4795-bb72-aeae3e66c8dd', N'Youtube', N'https://www.youtube.com/channel/UC2JvhyjI4HHHV3G9gwVWMBQ')
INSERT [dbo].[Sticky] ([Id], [Meta_Name], [Meta_Value]) VALUES (N'e831a9cd-b625-4f5d-90fb-cad9d7678445', N'Facebook', N'https://www.facebook.com/ktcndthu/?epa=SEARCH_BOX')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'66736094-25bd-4850-8d06-ab8900801615', N'University', N'2007', N'Ho Chi Minh City Pedagogical University', N'Geographic Education', N'b8edf8bd-4ec6-4781-bd57-ab89007985a9')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'e12567c6-c6f0-4b7b-b1ba-ab89008037d0', N'Master', N'2010', N'Ho Chi Minh City Polytechnic University', N'Map, remote sensing and geographic information system', N'b8edf8bd-4ec6-4781-bd57-ab89007985a9')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'bfc79247-7a1c-454a-a913-ab8900807850', N'University', N'2009', N'Can Tho University', N'Land Management', N'65ba42a8-efea-43fa-b563-ab89007abcae')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'd314a0d4-460d-4fcc-917c-ab89008097fc', N'Master', N'2012', N'Can Tho University', N'Land Management', N'65ba42a8-efea-43fa-b563-ab89007abcae')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'579a16c9-0abe-4330-8dfe-ab890080eb00', N'University', N'2004', N'Can Tho University', N'Environment', N'6ff4089f-e96b-461c-8a3a-ab89007c880b')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'267e9553-f4a9-488a-91e4-ab8900810388', N'Master', N'2008', N'Aarhus University and Can Tho University ', N'Environment', N'6ff4089f-e96b-461c-8a3a-ab89007c880b')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'21da684b-b7c8-41fc-9bb4-ab8900811a46', N'PhD', N'2018', N'Can Tho University', N'Soil and water environment', N'6ff4089f-e96b-461c-8a3a-ab89007c880b')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'c784f311-9744-429b-87f9-ab8900814dc9', N'University', N'1986', N'Can Tho University', N'Aquaculture', N'9367b5a8-0095-4198-8aa2-ab89007d2150')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'195a906a-2380-4d25-bc79-ab8900816a37', N'University', N'2003', N'HCM City Sub-Institute', N'Bachelor of politics', N'9367b5a8-0095-4198-8aa2-ab89007d2150')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'3fcfde1e-391e-4584-ae61-ab8900818d62', N'Master', N'1998', N'University of Fisheries', N'Fisheries Science', N'9367b5a8-0095-4198-8aa2-ab89007d2150')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'02bfb97c-e67a-46fb-8c61-ab890081c38e', N'University', N'2010', N'Dong Thap University', N'Geographic Education', N'564f4a76-5807-4568-a6c8-ab89007b7eb2')
INSERT [dbo].[Training_Process] ([Id], [Degree], [Graduation_Year], [Graduation_School], [Graduation_Specialized], [Lecturer_ID]) VALUES (N'5099d14d-bd58-4c5d-a732-ab890081d67f', N'Master', N'2019', N'Dong Thap University', N'Education Management', N'564f4a76-5807-4568-a6c8-ab89007b7eb2')
INSERT [HangFire].[Schema] ([Version]) VALUES (7)
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-n5nk81p:9372:33d2cc90-e5a8-477d-ab88-691e056e81a7', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2020-04-06T14:10:56.108928Z"}', CAST(N'2020-04-06T14:17:26.307' AS DateTime))
/****** Object:  Index [IX_Role_ID]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Role_ID] ON [dbo].[Account]
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Account_ID]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Account_ID] ON [dbo].[Events]
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Account_ID]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Account_ID] ON [dbo].[News]
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Lecturer_ID]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Lecturer_ID] ON [dbo].[Training_Process]
(
	[Lecturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 04/06/2020 9:19:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Account_dbo.Role_Role_ID] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_dbo.Account_dbo.Role_Role_ID]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Events_dbo.Account_Account_ID] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_dbo.Events_dbo.Account_Account_ID]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_dbo.News_dbo.Account_Account_ID] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_dbo.News_dbo.Account_Account_ID]
GO
ALTER TABLE [dbo].[Training_Process]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Training_Process_dbo.Lecturer_Lecturer_ID] FOREIGN KEY([Lecturer_ID])
REFERENCES [dbo].[Lecturer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Training_Process] CHECK CONSTRAINT [FK_dbo.Training_Process_dbo.Lecturer_Lecturer_ID]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
USE [master]
GO
ALTER DATABASE [FacultyV3EN] SET  READ_WRITE 
GO
