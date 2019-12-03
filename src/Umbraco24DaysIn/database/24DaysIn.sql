USE [master]
GO
/****** Object:  Database [Usome24DaysIn]    Script Date: 12/03/2019 10:29:18 PM ******/
CREATE DATABASE [Usome24DaysIn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Usome24DaysIn', FILENAME = N'E:\SQL Data\Data\Usome24DaysIn.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Usome24DaysIn_log', FILENAME = N'E:\SQL Data\Data\Usome24DaysIn_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Usome24DaysIn] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Usome24DaysIn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Usome24DaysIn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET ARITHABORT OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Usome24DaysIn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Usome24DaysIn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Usome24DaysIn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Usome24DaysIn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET RECOVERY FULL 
GO
ALTER DATABASE [Usome24DaysIn] SET  MULTI_USER 
GO
ALTER DATABASE [Usome24DaysIn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Usome24DaysIn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Usome24DaysIn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Usome24DaysIn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Usome24DaysIn] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Usome24DaysIn', N'ON'
GO
ALTER DATABASE [Usome24DaysIn] SET QUERY_STORE = OFF
GO
USE [Usome24DaysIn]
GO
/****** Object:  Table [dbo].[cmsContentNu]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentNu](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[data] [ntext] NOT NULL,
	[rv] [bigint] NOT NULL,
 CONSTRAINT [PK_cmsContentNu] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[isElement] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
	[variations] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroSource] [nvarchar](255) NOT NULL,
	[macroType] [int] NOT NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[variations] [int] NOT NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group] [nvarchar](100) NOT NULL,
	[languageId] [int] NULL,
	[tag] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContent]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContent](
	[nodeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_umbracoContent] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentSchedule]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentSchedule](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[date] [datetime] NOT NULL,
	[action] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersion]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[versionDate] [datetime] NOT NULL,
	[userId] [int] NULL,
	[current] [bit] NOT NULL,
	[text] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersionCultureVariation]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersionCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[availableUserId] [int] NULL,
 CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDataType]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDataType](
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
	[config] [ntext] NULL,
 CONSTRAINT [PK_umbracoDataType] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocument]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocument] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentCultureVariation]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[edited] [bit] NOT NULL,
	[available] [bit] NOT NULL,
	[published] [bit] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentVersion]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentVersion](
	[id] [int] NOT NULL,
	[templateId] [int] NULL,
	[published] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDomain]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoKeyValue]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoKeyValue](
	[key] [nvarchar](256) NOT NULL,
	[value] [nvarchar](255) NULL,
	[updated] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](14) NULL,
	[languageCultureName] [nvarchar](100) NULL,
	[isDefaultVariantLang] [bit] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[fallbackLanguageId] [int] NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[NodeId] [int] NOT NULL,
	[entityType] [nvarchar](50) NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
	[parameters] [nvarchar](500) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoMediaVersion]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMediaVersion](
	[id] [int] NOT NULL,
	[path] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[parentId] [int] NOT NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[trashed] [bit] NOT NULL,
	[nodeUser] [int] NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoPropertyData]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[segment] [nvarchar](256) NULL,
	[intValue] [int] NULL,
	[decimalValue] [decimal](38, 6) NULL,
	[dateValue] [datetime] NULL,
	[varcharValue] [nvarchar](512) NULL,
	[textValue] [ntext] NULL,
 CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[culture] [nvarchar](255) NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 12/03/2019 10:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1095, 0, N'{"properties":{"heroHeader":[{"culture":"","seg":"","val":"Umbraco Demo"}],"heroDescription":[{"culture":"","seg":"","val":"Moonfish, steelhead, lamprey southern flounder tadpole fish sculpin bigeye, blue-redstripe danio collared dogfish. Smalleye squaretail goldfish arowana butterflyfish pipefish wolf-herring jewel tetra, shiner; gibberfish red velvetfish. Thornyhead yellowfin pike threadsail ayu cutlassfish."}],"heroCTACaption":[{"culture":"","seg":"","val":"Check our products"}],"HeroCtalink":[{"culture":"","seg":"","val":"umb://document/ec4aafcc0c254f25a8fe705bfae1d324"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"rows\": [\n        {\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"allowed\": [\n                \"media\",\n                \"macro\",\n                \"embed\",\n                \"headline\"\n              ],\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": {\n                    \"macroAlias\": \"latestBlogposts\",\n                    \"macroParamsDictionary\": {\n                      \"numberOfPosts\": \"3\",\n                      \"startNodeId\": \"umb://document/1d770f10d1ca4a269d68071e2c9f7ac1\"\n                    }\n                  },\n                  \"editor\": {\n                    \"name\": \"Macro\",\n                    \"alias\": \"macro\",\n                    \"view\": \"macro\",\n                    \"render\": null,\n                    \"icon\": \"icon-settings-alt\",\n                    \"config\": {}\n                  },\n                  \"active\": false\n                }\n              ]\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"314cb47b-fbe1-eeb6-f7cc-38db875d0f06\"\n        }\n      ]\n    }\n  ]\n}"}],"footerHeader":[{"culture":"","seg":"","val":"Umbraco Demo"}],"footerDescription":[{"culture":"","seg":"","val":"Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus suscipit tortor eget felis porttitor volutpat"}],"footerCTACaption":[{"culture":"","seg":"","val":"Read All on the Blog"}],"FooterCtalink":[{"culture":"","seg":"","val":"umb://document/1d770f10d1ca4a269d68071e2c9f7ac1"}],"footerAddress":[{"culture":"","seg":"","val":"Umbraco HQ - Unicorn Square - Haubergsvej 1 - 5000 Odense C - Denmark - +45 70 26 11 62"}],"HeroBackgroundImage":[{"culture":"","seg":"","val":"umb://media/662af6ca411a4c93a6c722c4845698e7"}],"font":[{"culture":"","seg":"","val":"serif"}],"colorTheme":[{"culture":"","seg":"","val":"earth"}],"sitename":[{"culture":"","seg":"","val":"Umbraco Sample Site"}],"SiteLogo":[]},"cultureData":{},"urlSegment":"home"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1095, 1, N'{"properties":{"heroHeader":[{"culture":"","seg":"","val":"Umbraco Demo"}],"heroDescription":[{"culture":"","seg":"","val":"Moonfish, steelhead, lamprey southern flounder tadpole fish sculpin bigeye, blue-redstripe danio collared dogfish. Smalleye squaretail goldfish arowana butterflyfish pipefish wolf-herring jewel tetra, shiner; gibberfish red velvetfish. Thornyhead yellowfin pike threadsail ayu cutlassfish."}],"heroCTACaption":[{"culture":"","seg":"","val":"Check our products"}],"HeroCtalink":[{"culture":"","seg":"","val":"umb://document/ec4aafcc0c254f25a8fe705bfae1d324"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"rows\": [\n        {\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"allowed\": [\n                \"media\",\n                \"macro\",\n                \"embed\",\n                \"headline\"\n              ],\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": {\n                    \"macroAlias\": \"latestBlogposts\",\n                    \"macroParamsDictionary\": {\n                      \"numberOfPosts\": \"3\",\n                      \"startNodeId\": \"umb://document/1d770f10d1ca4a269d68071e2c9f7ac1\"\n                    }\n                  },\n                  \"editor\": {\n                    \"name\": \"Macro\",\n                    \"alias\": \"macro\",\n                    \"view\": \"macro\",\n                    \"render\": null,\n                    \"icon\": \"icon-settings-alt\",\n                    \"config\": {}\n                  },\n                  \"active\": false\n                }\n              ]\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"314cb47b-fbe1-eeb6-f7cc-38db875d0f06\"\n        }\n      ]\n    }\n  ]\n}"}],"footerHeader":[{"culture":"","seg":"","val":"Umbraco Demo"}],"footerDescription":[{"culture":"","seg":"","val":"Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus suscipit tortor eget felis porttitor volutpat"}],"footerCTACaption":[{"culture":"","seg":"","val":"Read All on the Blog"}],"FooterCtalink":[{"culture":"","seg":"","val":"umb://document/1d770f10d1ca4a269d68071e2c9f7ac1"}],"footerAddress":[{"culture":"","seg":"","val":"Umbraco HQ - Unicorn Square - Haubergsvej 1 - 5000 Odense C - Denmark - +45 70 26 11 62"}],"HeroBackgroundImage":[{"culture":"","seg":"","val":"umb://media/662af6ca411a4c93a6c722c4845698e7"}],"font":[{"culture":"","seg":"","val":"serif"}],"colorTheme":[{"culture":"","seg":"","val":"earth"}],"sitename":[{"culture":"","seg":"","val":"Umbraco Sample Site"}],"SiteLogo":[]},"cultureData":{},"urlSegment":"home"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1096, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Our Gorgeous Selection"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"defaultCurrency":[{"culture":"","seg":"","val":"[\"€\"]"}],"featuredProducts":[{"culture":"","seg":"","val":"umb://document/262beb7053a649b89e98cfde2e85a78e,umb://document/df1eb830411b4d41a3433917b76d533c,umb://document/4e96411ab8e1435f93222faee30ef5f2,umb://document/d390a562107d4f028df757aa86bad752,umb://document/bb7d5ae007ac40b8b5b918c36947fb56,umb://document/202cdc2f1a4540f4a653a7b321e1c54c,umb://document/103171c8e11c40029bb2f3404cada22a,umb://document/061662b9b02a4dcfaf5992b603e8e3e1"}]},"cultureData":{},"urlSegment":"products"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1096, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Our Gorgeous Selection"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"defaultCurrency":[{"culture":"","seg":"","val":"[\"€\"]"}],"featuredProducts":[{"culture":"","seg":"","val":"umb://document/262beb7053a649b89e98cfde2e85a78e,umb://document/df1eb830411b4d41a3433917b76d533c,umb://document/4e96411ab8e1435f93222faee30ef5f2,umb://document/d390a562107d4f028df757aa86bad752,umb://document/bb7d5ae007ac40b8b5b918c36947fb56,umb://document/202cdc2f1a4540f4a653a7b321e1c54c,umb://document/103171c8e11c40029bb2f3404cada22a,umb://document/061662b9b02a4dcfaf5992b603e8e3e1"}]},"cultureData":{},"urlSegment":"products"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1097, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Tattoo"}],"price":[{"culture":"","seg":"","val":499.0}],"category":[{"culture":"","seg":"","val":"tattoo,dedication"}],"description":[{"culture":"","seg":"","val":"Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-TATTOO"}],"photos":[{"culture":"","seg":"","val":"umb://media/20e3a8ffad1b4fe9b48cb8461c46d2d0"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"tattoo"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1097, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Tattoo"}],"price":[{"culture":"","seg":"","val":499.0}],"category":[{"culture":"","seg":"","val":"tattoo,dedication"}],"description":[{"culture":"","seg":"","val":"Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-TATTOO"}],"photos":[{"culture":"","seg":"","val":"umb://media/20e3a8ffad1b4fe9b48cb8461c46d2d0"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"tattoo"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1098, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Unicorn"}],"price":[{"culture":"","seg":"","val":249.0}],"category":[{"culture":"","seg":"","val":"animals"}],"description":[{"culture":"","seg":"","val":"Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-UNICORN"}],"photos":[{"culture":"","seg":"","val":"umb://media/1bc5280b8658402789d958e2576e469b"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"unicorn"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1098, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Unicorn"}],"price":[{"culture":"","seg":"","val":249.0}],"category":[{"culture":"","seg":"","val":"animals"}],"description":[{"culture":"","seg":"","val":"Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-UNICORN"}],"photos":[{"culture":"","seg":"","val":"umb://media/1bc5280b8658402789d958e2576e469b"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"unicorn"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1099, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Ping Pong Ball"}],"price":[{"culture":"","seg":"","val":2.0}],"category":[{"culture":"","seg":"","val":"sports,bingo"}],"description":[{"culture":"","seg":"","val":"Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-PINGPONG"}],"photos":[{"culture":"","seg":"","val":"umb://media/c09ec77f08e3466aac58c979befd3cd6"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"ping-pong-ball"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1099, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Ping Pong Ball"}],"price":[{"culture":"","seg":"","val":2.0}],"category":[{"culture":"","seg":"","val":"sports,bingo"}],"description":[{"culture":"","seg":"","val":"Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-PINGPONG"}],"photos":[{"culture":"","seg":"","val":"umb://media/c09ec77f08e3466aac58c979befd3cd6"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"ping-pong-ball"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1100, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Bowling Ball"}],"price":[{"culture":"","seg":"","val":899.0}],"category":[{"culture":"","seg":"","val":"sports,bingo"}],"description":[{"culture":"","seg":"","val":"Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-BOWLING"}],"photos":[{"culture":"","seg":"","val":"umb://media/b76ddb4ee603401499066087984740ec"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"bowling-ball"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1100, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Bowling Ball"}],"price":[{"culture":"","seg":"","val":899.0}],"category":[{"culture":"","seg":"","val":"sports,bingo"}],"description":[{"culture":"","seg":"","val":"Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-BOWLING"}],"photos":[{"culture":"","seg":"","val":"umb://media/b76ddb4ee603401499066087984740ec"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"bowling-ball"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1101, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Jumpsuit"}],"price":[{"culture":"","seg":"","val":89.0}],"category":[{"culture":"","seg":"","val":"fashion,bingo"}],"description":[{"culture":"","seg":"","val":"Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-JUMPSUIT"}],"photos":[{"culture":"","seg":"","val":"umb://media/46a025d6095a4b148b961b59ca4e951c"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"jumpsuit"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1101, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Jumpsuit"}],"price":[{"culture":"","seg":"","val":89.0}],"category":[{"culture":"","seg":"","val":"fashion,bingo"}],"description":[{"culture":"","seg":"","val":"Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta."}],"sku":[{"culture":"","seg":"","val":"UMB-JUMPSUIT"}],"photos":[{"culture":"","seg":"","val":"umb://media/46a025d6095a4b148b961b59ca4e951c"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"jumpsuit"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1102, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Banjo"}],"price":[{"culture":"","seg":"","val":399.0}],"category":[{"culture":"","seg":"","val":"bingo,music"}],"description":[{"culture":"","seg":"","val":"Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus."}],"sku":[{"culture":"","seg":"","val":"UMB-BANJO"}],"photos":[{"culture":"","seg":"","val":"umb://media/17552d12081d4d01b68132c495d6576f"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"banjo"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1102, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Banjo"}],"price":[{"culture":"","seg":"","val":399.0}],"category":[{"culture":"","seg":"","val":"bingo,music"}],"description":[{"culture":"","seg":"","val":"Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus."}],"sku":[{"culture":"","seg":"","val":"UMB-BANJO"}],"photos":[{"culture":"","seg":"","val":"umb://media/17552d12081d4d01b68132c495d6576f"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"banjo"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1103, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Knitted Unicorn West"}],"price":[{"culture":"","seg":"","val":1899.0}],"category":[{"culture":"","seg":"","val":"bingo,fashion"}],"description":[{"culture":"","seg":"","val":"Knitted Unicorn West"}],"sku":[{"culture":"","seg":"","val":"UMB-WEST"}],"photos":[{"culture":"","seg":"","val":"umb://media/1d0b713a022a49c8b842a2463c83a553"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"knitted-west"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1103, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Knitted Unicorn West"}],"price":[{"culture":"","seg":"","val":1899.0}],"category":[{"culture":"","seg":"","val":"bingo,fashion"}],"description":[{"culture":"","seg":"","val":"Knitted Unicorn West"}],"sku":[{"culture":"","seg":"","val":"UMB-WEST"}],"photos":[{"culture":"","seg":"","val":"umb://media/1d0b713a022a49c8b842a2463c83a553"}],"features":[],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"knitted-west"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1104, 0, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Biker Jacket"}],"price":[{"culture":"","seg":"","val":199.0}],"category":[{"culture":"","seg":"","val":"bingo,clothing"}],"description":[{"culture":"","seg":"","val":"Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat."}],"sku":[{"culture":"","seg":"","val":"UMB-BIKER-JACKET"}],"photos":[{"culture":"","seg":"","val":"umb://media/55514845b8bd487cb3709724852fd6bb"}],"features":[{"culture":"","seg":"","val":"[{\"key\":\"6a47c043-7699-49c6-a0ed-b335b135ea2b\",\"name\":\"Free shipping\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"Free shipping\",\"featureDetails\":\"Isn''t that awesome - you only pay for the product\"},{\"key\":\"075c935f-4987-4a46-bed9-3286c27f0121\",\"name\":\"1 Day return policy\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"1 Day return policy\",\"featureDetails\":\"You''ll need to make up your mind fast\"},{\"key\":\"457e0ee3-c066-46fa-b379-a083b38aaa20\",\"name\":\"100 Years warranty\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"100 Years warranty\",\"featureDetails\":\"But if you''re satisfied it''ll last a lifetime\"}]"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"biker-jacket"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1104, 1, N'{"properties":{"productName":[{"culture":"","seg":"","val":"Biker Jacket"}],"price":[{"culture":"","seg":"","val":199.0}],"category":[{"culture":"","seg":"","val":"bingo,clothing"}],"description":[{"culture":"","seg":"","val":"Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat."}],"sku":[{"culture":"","seg":"","val":"UMB-BIKER-JACKET"}],"photos":[{"culture":"","seg":"","val":"umb://media/55514845b8bd487cb3709724852fd6bb"}],"features":[{"culture":"","seg":"","val":"[{\"key\":\"6a47c043-7699-49c6-a0ed-b335b135ea2b\",\"name\":\"Free shipping\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"Free shipping\",\"featureDetails\":\"Isn''t that awesome - you only pay for the product\"},{\"key\":\"075c935f-4987-4a46-bed9-3286c27f0121\",\"name\":\"1 Day return policy\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"1 Day return policy\",\"featureDetails\":\"You''ll need to make up your mind fast\"},{\"key\":\"457e0ee3-c066-46fa-b379-a083b38aaa20\",\"name\":\"100 Years warranty\",\"ncContentTypeAlias\":\"feature\",\"featureName\":\"100 Years warranty\",\"featureDetails\":\"But if you''re satisfied it''ll last a lifetime\"}]"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}]},"cultureData":{},"urlSegment":"biker-jacket"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1105, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Nice crazy people"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"featuredPeople":[]},"cultureData":{},"urlSegment":"people"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1105, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Nice crazy people"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"featuredPeople":[]},"cultureData":{},"urlSegment":"people"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1106, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/cf1ab8dcad0f4a8e974b87b84777b0d6"}],"department":[{"culture":"","seg":"","val":"mvp,Denmark"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jan-skovgaard"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1106, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/cf1ab8dcad0f4a8e974b87b84777b0d6"}],"department":[{"culture":"","seg":"","val":"mvp,Denmark"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jan-skovgaard"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1107, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/eee91c05b2e84031a056dcd7f28eff89"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[{"culture":"","seg":"","val":"mattbrailsford"}],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[{"culture":"","seg":"","val":"circuitbeard"}]},"cultureData":{},"urlSegment":"matt-brailsford"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1107, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/eee91c05b2e84031a056dcd7f28eff89"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[{"culture":"","seg":"","val":"mattbrailsford"}],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[{"culture":"","seg":"","val":"circuitbeard"}]},"cultureData":{},"urlSegment":"matt-brailsford"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1108, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/fa763e0d0ceb408c8720365d57e06e32"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"lee-kelleher"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1108, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/fa763e0d0ceb408c8720365d57e06e32"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"lee-kelleher"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1109, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/c0969cab13ab4de9819a848619ac2b5d"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jeavon-leopold"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1109, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/c0969cab13ab4de9819a848619ac2b5d"}],"department":[{"culture":"","seg":"","val":"United Kingdom,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jeavon-leopold"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1110, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/34371d0892c84015912ebaacd002c5d0"}],"department":[{"culture":"","seg":"","val":"Netherlands,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jeroen-breuer"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1110, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"photo":[{"culture":"","seg":"","val":"umb://media/34371d0892c84015912ebaacd002c5d0"}],"department":[{"culture":"","seg":"","val":"Netherlands,mvp"}],"email":[],"twitterUsername":[],"facebookUsername":[],"linkedInUsername":[],"instagramUsername":[]},"cultureData":{},"urlSegment":"jeroen-breuer"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1111, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"About Us"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"name\": \"FullWidth\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": true,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"Oooh la la\",\n                  \"editor\": {\n                    \"name\": \"Headline\",\n                    \"alias\": \"headline\",\n                    \"view\": \"textstring\",\n                    \"render\": null,\n                    \"icon\": \"icon-coin\",\n                    \"config\": {\n                      \"style\": \"font-size: 36px; line-height: 45px; font-weight: bold\",\n                      \"markup\": \"<h1>#value#</h1>\"\n                    }\n                  },\n                  \"active\": false\n                }\n              ],\n              \"active\": false\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"f10995f1-918d-3e50-e50d-8c41bbe297ce\",\n          \"active\": true\n        },\n        {\n          \"label\": \"Article\",\n          \"name\": \"Article\",\n          \"areas\": [\n            {\n              \"grid\": 4,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": {\n                    \"udi\": \"umb://media/c0969cab13ab4de9819a848619ac2b5d\",\n                    \"image\": \"/media/c0969cab13ab4de9819a848619ac2b5d/00000006000000000000000000000000/18095416144_44a566a5f4_h.jpg\"\n                  },\n                  \"editor\": {\n                    \"name\": \"Image\",\n                    \"alias\": \"media\",\n                    \"view\": \"media\",\n                    \"render\": null,\n                    \"icon\": \"icon-picture\",\n                    \"config\": {}\n                  },\n                  \"active\": false,\n                }\n              ]\n            },\n            {\n              \"grid\": 8,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\",\n                  \"editor\": {\n                    \"name\": \"Rich text editor\",\n                    \"alias\": \"rte\",\n                    \"view\": \"rte\",\n                    \"render\": null,\n                    \"icon\": \"icon-article\",\n                    \"config\": {}\n                  },\n                  \"active\": false,\n                },\n                {\n                  \"value\": \"<iframe width=\\\"360\\\" height=\\\"203\\\" src=\\\"https://www.youtube.com/embed/HPgKSCp_Y_U?feature=oembed\\\" frameborder=\\\"0\\\" allow=\\\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\\\" allowfullscreen></iframe>\",\n                  \"editor\": {\n                    \"name\": \"Embed\",\n                    \"alias\": \"embed\",\n                    \"view\": \"embed\",\n                    \"render\": null,\n                    \"icon\": \"icon-movie-alt\",\n                    \"config\": {}\n                  },\n                  \"active\": false\n                }\n              ]\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"4d6e2221-e2d9-95bc-8ceb-624bc8df8e3f\"\n        }\n      ]\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about-us"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1111, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"About Us"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"name\": \"FullWidth\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": true,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"Oooh la la\",\n                  \"editor\": {\n                    \"name\": \"Headline\",\n                    \"alias\": \"headline\",\n                    \"view\": \"textstring\",\n                    \"render\": null,\n                    \"icon\": \"icon-coin\",\n                    \"config\": {\n                      \"style\": \"font-size: 36px; line-height: 45px; font-weight: bold\",\n                      \"markup\": \"<h1>#value#</h1>\"\n                    }\n                  },\n                  \"active\": false\n                }\n              ],\n              \"active\": false\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"f10995f1-918d-3e50-e50d-8c41bbe297ce\",\n          \"active\": true\n        },\n        {\n          \"label\": \"Article\",\n          \"name\": \"Article\",\n          \"areas\": [\n            {\n              \"grid\": 4,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": {\n                    \"udi\": \"umb://media/c0969cab13ab4de9819a848619ac2b5d\",\n                    \"image\": \"/media/c0969cab13ab4de9819a848619ac2b5d/00000006000000000000000000000000/18095416144_44a566a5f4_h.jpg\"\n                  },\n                  \"editor\": {\n                    \"name\": \"Image\",\n                    \"alias\": \"media\",\n                    \"view\": \"media\",\n                    \"render\": null,\n                    \"icon\": \"icon-picture\",\n                    \"config\": {}\n                  },\n                  \"active\": false,\n                }\n              ]\n            },\n            {\n              \"grid\": 8,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\",\n                  \"editor\": {\n                    \"name\": \"Rich text editor\",\n                    \"alias\": \"rte\",\n                    \"view\": \"rte\",\n                    \"render\": null,\n                    \"icon\": \"icon-article\",\n                    \"config\": {}\n                  },\n                  \"active\": false,\n                },\n                {\n                  \"value\": \"<iframe width=\\\"360\\\" height=\\\"203\\\" src=\\\"https://www.youtube.com/embed/HPgKSCp_Y_U?feature=oembed\\\" frameborder=\\\"0\\\" allow=\\\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\\\" allowfullscreen></iframe>\",\n                  \"editor\": {\n                    \"name\": \"Embed\",\n                    \"alias\": \"embed\",\n                    \"view\": \"embed\",\n                    \"render\": null,\n                    \"icon\": \"icon-movie-alt\",\n                    \"config\": {}\n                  },\n                  \"active\": false\n                }\n              ]\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"4d6e2221-e2d9-95bc-8ceb-624bc8df8e3f\"\n        }\n      ]\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about-us"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1112, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"About this Starter Kit"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,      \n      \"rows\": []\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about-this-starter-kit"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1112, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"About this Starter Kit"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,      \n      \"rows\": []\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"about-this-starter-kit"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1113, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Things to improve"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"label\": \"\",\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Here''s what could be improved in the Starter Kit so far:</p>\\n<p> </p>\\n<p>For v1:</p>\\n<ul>\\n<li>Use a custom grid editor for testimonials</li>\\n<li>Integrated Analytics on pages</li>\\n<li>Call To Action Button in the grid (with \\\"Tag Manager\\\" integration)</li>\\n<li>Macro for fetching products (with friendly grid preview)</li>\\n<li>Design Review (polish)</li>\\n<li>Verify licenses of photos (Niels)</li>\\n</ul>\\n<p>For vNext</p>\\n<ul>\\n<li><span style=\\\"text-decoration: line-through;\\\">Swap text with uploaded logo</span></li>\\n<li>Nicer pickers of products and employees</li>\\n<li>Custom Listview for products and employees</li>\\n<li>Discus template on blog posts</li>\\n<li>404 template</li>\\n<li>Member Login/Register/Profile/Forgot password</li>\\n<li>Update default styling of grid header</li>\\n<li>On a Blog post -&gt; Share/Social (tweet this / facebook this)</li>\\n</ul>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": true,\n                }\n              ],\n              \"active\": true,\n              \"hasActiveChild\": true\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"5ea1e364-8406-e5e6-a82c-45985fd6054e\",\n          \"hasActiveChild\": true,\n          \"active\": true\n        }\n      ]\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"todo-list-for-the-starter-kit"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1113, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Things to improve"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": [\n        {\n          \"label\": \"\",\n          \"name\": \"Full Width\",\n          \"areas\": [\n            {\n              \"grid\": 12,\n              \"allowAll\": false,\n              \"hasConfig\": false,\n              \"controls\": [\n                {\n                  \"value\": \"<p>Here''s what could be improved in the Starter Kit so far:</p>\\n<p> </p>\\n<p>For v1:</p>\\n<ul>\\n<li>Use a custom grid editor for testimonials</li>\\n<li>Integrated Analytics on pages</li>\\n<li>Call To Action Button in the grid (with \\\"Tag Manager\\\" integration)</li>\\n<li>Macro for fetching products (with friendly grid preview)</li>\\n<li>Design Review (polish)</li>\\n<li>Verify licenses of photos (Niels)</li>\\n</ul>\\n<p>For vNext</p>\\n<ul>\\n<li><span style=\\\"text-decoration: line-through;\\\">Swap text with uploaded logo</span></li>\\n<li>Nicer pickers of products and employees</li>\\n<li>Custom Listview for products and employees</li>\\n<li>Discus template on blog posts</li>\\n<li>404 template</li>\\n<li>Member Login/Register/Profile/Forgot password</li>\\n<li>Update default styling of grid header</li>\\n<li>On a Blog post -&gt; Share/Social (tweet this / facebook this)</li>\\n</ul>\",\n                  \"editor\": {\n                    \"alias\": \"rte\"\n                  },\n                  \"active\": true,\n                }\n              ],\n              \"active\": true,\n              \"hasActiveChild\": true\n            }\n          ],\n          \"hasConfig\": false,\n          \"id\": \"5ea1e364-8406-e5e6-a82c-45985fd6054e\",\n          \"hasActiveChild\": true,\n          \"active\": true\n        }\n      ]\n    }\n  ]\n}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"todo-list-for-the-starter-kit"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1114, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Behind The Scenes"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"howManyPostsShouldBeShown":[{"culture":"","seg":"","val":"2"}],"disqusShortname":[]},"cultureData":{},"urlSegment":"blog"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1114, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Behind The Scenes"}],"bodyText":[{"culture":"","seg":"","val":"{\n  \"name\": \"1 column layout\",\n  \"sections\": [\n    {\n      \"grid\": 12,\n      \"allowAll\": true,\n      \"rows\": []\n    }\n  ]\n}"}],"howManyPostsShouldBeShown":[{"culture":"","seg":"","val":"2"}],"disqusShortname":[]},"cultureData":{},"urlSegment":"blog"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1115, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"sendPushNotification":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"My Blog Post"}],"categories":[{"culture":"","seg":"","val":"[\"demo\",\"umbraco\",\"starter kit\"]"}],"excerpt":[{"culture":"","seg":"","val":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada."}],"bodyText":[]},"cultureData":{},"urlSegment":"my-blog-post"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1115, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"sendPushNotification":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"My Blog Post"}],"categories":[{"culture":"","seg":"","val":"[\"demo\",\"umbraco\",\"starter kit\"]"}],"excerpt":[{"culture":"","seg":"","val":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada."}],"bodyText":[]},"cultureData":{},"urlSegment":"my-blog-post"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1116, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"sendPushNotification":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Now it gets exciting"}],"categories":[{"culture":"","seg":"","val":"[\"cg16\",\"codegarden\",\"umbraco\"]"}],"excerpt":[{"culture":"","seg":"","val":"Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh."}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Article\",\"id\":\"011e74f2-b4de-0e4e-1cb9-23b2356b1213\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":{\"udi\":\"umb://media/55514845b8bd487cb3709724852fd6bb\",\"image\":\"/media/55514845b8bd487cb3709724852fd6bb/00000006000000000000000000000000/4730684907_8a7f8759cb_b.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":\"media\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":\"<p>Donec sollicitudin molestie malesuada. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada.</p>\\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Sed porttitor lectus nibh.</p>\\n<p>Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat.</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}]},"cultureData":{},"urlSegment":"another-one"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1116, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"sendPushNotification":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Now it gets exciting"}],"categories":[{"culture":"","seg":"","val":"[\"cg16\",\"codegarden\",\"umbraco\"]"}],"excerpt":[{"culture":"","seg":"","val":"Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh."}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Article\",\"id\":\"011e74f2-b4de-0e4e-1cb9-23b2356b1213\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":{\"udi\":\"umb://media/55514845b8bd487cb3709724852fd6bb\",\"image\":\"/media/55514845b8bd487cb3709724852fd6bb/00000006000000000000000000000000/4730684907_8a7f8759cb_b.jpg\"},\"editor\":{\"alias\":\"media\",\"view\":\"media\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":\"<p>Donec sollicitudin molestie malesuada. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada.</p>\\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Sed porttitor lectus nibh.</p>\\n<p>Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat.</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}]},"cultureData":{},"urlSegment":"another-one"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1117, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"sendPushNotification":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"This will be great"}],"categories":[{"culture":"","seg":"","val":"[\"great\",\"umbraco\"]"}],"excerpt":[{"culture":"","seg":"","val":"Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed"}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}]},"cultureData":{},"urlSegment":"this-will-be-great"}', 8)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1117, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"sendPushNotification":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"This will be great"}],"categories":[{"culture":"","seg":"","val":"[\"great\",\"umbraco\"]"}],"excerpt":[{"culture":"","seg":"","val":"Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed"}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}]},"cultureData":{},"urlSegment":"this-will-be-great"}', 8)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1118, 0, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Let''s have a chat"}],"contactFormHeader":[{"culture":"","seg":"","val":"Send Us A Message"}],"contactIntro":[{"culture":"","seg":"","val":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lacinia nisl. Aenean sollicitudin diam vitae enim ultrices, semper euismod magna efficitur.</p>"}],"contactForm":[{"culture":"","seg":"","val":"adf160f1-39f5-44c0-b01d-9e2da32bf093"}],"mapHeader":[{"culture":"","seg":"","val":"You''ll find us here"}],"mapCoordinates":[{"culture":"","seg":"","val":"55.40622012982414,10.388404726982117,18"}]},"cultureData":{},"urlSegment":"contact"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1118, 1, N'{"properties":{"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}],"pageTitle":[{"culture":"","seg":"","val":"Let''s have a chat"}],"contactFormHeader":[{"culture":"","seg":"","val":"Send Us A Message"}],"contactIntro":[{"culture":"","seg":"","val":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lacinia nisl. Aenean sollicitudin diam vitae enim ultrices, semper euismod magna efficitur.</p>"}],"contactForm":[{"culture":"","seg":"","val":"adf160f1-39f5-44c0-b01d-9e2da32bf093"}],"mapHeader":[{"culture":"","seg":"","val":"You''ll find us here"}],"mapCoordinates":[{"culture":"","seg":"","val":"55.40622012982414,10.388404726982117,18"}]},"cultureData":{},"urlSegment":"contact"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1119, 0, N'{"properties":{},"cultureData":{},"urlSegment":"design"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1120, 0, N'{"properties":{},"cultureData":{},"urlSegment":"people"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1121, 0, N'{"properties":{},"cultureData":{},"urlSegment":"products"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1122, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/662af6ca411a4c93a6c722c4845698e7/00000006000000000000000000000000/16403439029_f500be349b_o.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"umbraco-campari-meeting-room"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1123, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/55514845b8bd487cb3709724852fd6bb/00000006000000000000000000000000/4730684907_8a7f8759cb_b.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"biker-jacket"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1124, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/20e3a8ffad1b4fe9b48cb8461c46d2d0/00000006000000000000000000000000/7371127652_e01b6ab56f_b.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"tattoo"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1125, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/1bc5280b8658402789d958e2576e469b/00000006000000000000000000000000/14272036539_469ca21d5c_h.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"unicorn"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1126, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/c09ec77f08e3466aac58c979befd3cd6/00000006000000000000000000000000/5852022211_9028df67c0_b.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"ping-pong-ball"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1127, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/b76ddb4ee603401499066087984740ec/00000006000000000000000000000000/5852022091_87c5d045ab_b.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"bowling-ball"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1128, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/46a025d6095a4b148b961b59ca4e951c/00000006000000000000000000000000/7377957524_347859faac_b.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"jumpsuit"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1129, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/17552d12081d4d01b68132c495d6576f/00000006000000000000000000000000/7373036290_5e8420bf36_b.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"banjo"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1130, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/1d0b713a022a49c8b842a2463c83a553/00000006000000000000000000000000/7373036208_30257976a0_b.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"knitted-west"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1131, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/cf1ab8dcad0f4a8e974b87b84777b0d6/00000006000000000000000000000000/18720470241_ff77768544_h.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"jan-skovgaard"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1132, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/eee91c05b2e84031a056dcd7f28eff89/00000006000000000000000000000000/18531852339_981b067419_h.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"matt-brailsford"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1133, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/fa763e0d0ceb408c8720365d57e06e32/00000006000000000000000000000000/18531854019_351c579559_h.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"lee-kelleher"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1134, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/c0969cab13ab4de9819a848619ac2b5d/00000006000000000000000000000000/18095416144_44a566a5f4_h.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"jeavon-leopold"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1135, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/34371d0892c84015912ebaacd002c5d0/00000006000000000000000000000000/18530280048_459b8b61b2_h.jpg\",\"focalPoint\":null,\"crops\":null}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[],"umbracoExtension":[]},"cultureData":{},"urlSegment":"jeroen-breuer"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1139, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Notifications"}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"notifications"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1139, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Notifications"}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"seoMetaDescription":[],"keywords":[{"culture":"","seg":"","val":"[]"}],"umbracoNavihide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"notifications"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1140, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"24Days In Umbraco 2019"}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"sendPushNotification":[{"culture":"","seg":"","val":0}],"excerpt":[{"culture":"","seg":"","val":"This is 24Days In Umbraco Push Notification Post. With this post you can track all the notifications of the system."}]},"cultureData":{},"urlSegment":"24days-in-notification"}', 4)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1140, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"24Days In Umbraco 2019"}],"bodyText":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[]}]}"}],"sendPushNotification":[{"culture":"","seg":"","val":0}],"excerpt":[{"culture":"","seg":"","val":"This is 24Days In Umbraco Push Notification Post. With this post you can track all the notifications of the system."}]},"cultureData":{},"urlSegment":"24days-in-notification"}', 3)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1149, 0, N'{"properties":{"umbracoMemberPasswordRetrievalQuestion":[],"umbracoMemberPasswordRetrievalAnswer":[],"umbracoMemberComments":[],"umbracoMemberFailedPasswordAttempts":[],"umbracoMemberApproved":[{"culture":"","seg":"","val":1}],"umbracoMemberLockedOut":[],"umbracoMemberLastLockoutDate":[],"umbracoMemberLastLogin":[{"culture":"","seg":"","val":"2019-11-29T14:56:00Z"}],"umbracoMemberLastPasswordChangeDate":[{"culture":"","seg":"","val":"2019-11-29T14:56:00Z"}]},"cultureData":{},"urlSegment":"pasang-tamang"}', 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (535, 1083, N'contentBase', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (536, 1084, N'navigationBase', N'icon-nodes color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (537, 1085, N'products', N'icon-shopping-basket color-black', N'folder.png', NULL, 1, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (538, 1086, N'product', N'icon-sweatshirt color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (539, 1087, N'person', N'icon-user-female color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (540, 1088, N'people', N'icon-user-females-alt color-black', N'folder.png', NULL, 1, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (541, 1089, N'home', N'icon-home color-black', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (542, 1090, N'feature', N'icon-plugin color-black', N'folder.png', NULL, 0, 1, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (543, 1091, N'contentPage', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (544, 1092, N'contact', N'icon-map-location color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (545, 1093, N'blogpost', N'icon-calendar color-black', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (546, 1094, N'blog', N'icon-calendar-alt color-black', N'folder.png', NULL, 1, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (547, 1136, N'pushNotification', N'icon-sound color-orange', N'folder.png', NULL, 1, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (548, 1137, N'notificationPost', N'icon-share-alt color-orange', N'folder.png', NULL, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1085)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1088)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1091)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1094)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1136)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1137)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1085)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1087)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1088)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1091)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1092)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1093)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1094)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1084, 1136)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1085, 1086, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1088, 1087, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1085, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1088, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1091, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1092, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1094, 4)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1089, 1136, 5)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1091, 1091, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1094, 1093, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1136, 1137, 0)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1085, 1081, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1086, 1080, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1087, 1079, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1088, 1078, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1089, 1076, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1091, 1075, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1092, 1074, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1093, 1073, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1094, 1072, 1)
SET IDENTITY_INSERT [dbo].[cmsMacro] ON 

INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (1, N'3342c60f-4e46-42ee-8c08-97fecd6456fb', 1, 0, N'latestBlogposts', N'Get Latest Blogposts', 0, 0, 0, N'~/Views/MacroPartials/LatestBlogposts.cshtml', 7)
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (2, N'cc15dd93-ca5e-4fe5-bc47-dca65529c3c0', 1, 0, N'featuredProduct', N'Select Featured Products', 0, 0, 0, N'~/Views/MacroPartials/FeaturedProducts.cshtml', 7)
SET IDENTITY_INSERT [dbo].[cmsMacro] OFF
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] ON 

INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (1, N'98049085-2969-493f-8456-8f7b64dffddf', N'Umbraco.Integer', 1, 0, N'numberOfPosts', N'How many posts should be shown')
INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (2, N'f16e80ba-134c-4497-85d1-95c7ec6c12ad', N'Umbraco.ContentPicker', 1, 1, N'startNodeId', N'Where to get blog posts from')
INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (3, N'a2f2a174-7ca3-474f-a850-e92ee2478ef2', N'Umbraco.ContentPicker', 2, 0, N'product', N'Choose Product')
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] OFF
INSERT [dbo].[cmsMember] ([nodeId], [Email], [LoginName], [Password]) VALUES (1149, N'buddhistsoul@gmail.com', N'buddhistsoul@gmail.com', N'r1gAnto9trWs1Zi7N1dP9g==9h1/sk8x7+IOmeCsn1Z7riUmI0GdduLVQTVNXpJmKRM=')
SET IDENTITY_INSERT [dbo].[cmsMemberType] ON 

INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (25, 1044, 35, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (26, 1044, 36, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (27, 1044, 28, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (28, 1044, 29, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (29, 1044, 30, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (30, 1044, 31, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (31, 1044, 32, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (32, 1044, 33, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (33, 1044, 34, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsMemberType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 1, NULL, NULL, 0, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (7, -91, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, N'in pixels', 0, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (8, -91, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, N'in pixels', 0, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (9, -93, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, N'in bytes', 0, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, 0, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 1, NULL, NULL, 0, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, 0, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (26, -93, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, N'in bytes', 0, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, 0, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (29, -99, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, 0, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, 0, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, 0, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (32, -99, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, 0, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (33, -99, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, 0, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (34, -99, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, 0, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (35, -99, 1044, NULL, N'umbracoMemberPasswordRetrievalQuestion', N'Password Question', 7, 0, NULL, NULL, 0, N'00000023-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (36, -99, 1044, NULL, N'umbracoMemberPasswordRetrievalAnswer', N'Password Answer', 8, 0, NULL, NULL, 0, N'00000024-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (37, -88, 1083, 12, N'pageTitle', N'Page Title', 1, 1, NULL, N'The title of the page, this is also the first text in a google search result. The ideal length is between 40 and 60 characters', 0, N'd326c0ee-f962-4676-9c22-3bebef113753')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (38, 1060, 1083, 12, N'bodyText', N'Content', 3, 0, NULL, N'', 0, N'313643d6-9a32-454c-a304-db1a715c3c8a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (39, -89, 1084, 13, N'seoMetaDescription', N'Description', 0, 0, NULL, N'A brief description of the content on your page. This text is shown below the title in a google search result and also used for Social Sharing Cards. The ideal length is between 130 and 155 characters', 0, N'00bb7e67-192c-434d-9240-e0f404ff35de')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (40, 1065, 1084, 13, N'keywords', N'Keywords', 1, 0, NULL, N'Keywords that describe the content of the page. This is considered optional since most modern search engines don''t use this anymore', 0, N'd2090876-ba03-420d-b668-9cf6b06de73e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (41, -49, 1084, 13, N'umbracoNavihide', N'Hide in Navigation', 2, 0, NULL, N'If you don''t want this page to appear in the navigation, check this box', 0, N'3be0c585-5c09-4c4b-8e36-0f0caab6bd1a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (42, 1069, 1085, 14, N'defaultCurrency', N'Default Currency', 0, 1, NULL, N'This is just used to prefix pricing', 0, N'89bd4316-e1e7-4f15-a1d5-e4db1e09aa1c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (43, 1070, 1085, 14, N'featuredProducts', N'Featured Products', 1, 0, NULL, NULL, 0, N'c380eb07-b10d-4a23-b8bd-7ede686a87ad')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (44, -88, 1086, 15, N'productName', N'Product Name', 0, 1, NULL, NULL, 0, N'3c6297aa-9b6a-4330-a1b9-6a28cc715f4d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (45, 1068, 1086, 15, N'price', N'Price', 1, 1, NULL, NULL, 0, N'232c0654-889f-4d6f-a425-b3fabdc20ebb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (46, 1064, 1086, 15, N'category', N'Category', 2, 1, NULL, NULL, 0, N'5aa166d8-93ef-4a9d-9c3d-170b27ded422')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (47, -89, 1086, 15, N'description', N'Description', 3, 1, NULL, NULL, 0, N'61dc8cb7-7c59-457b-bf30-25c37594d786')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (48, -88, 1086, 15, N'sku', N'SKU', 4, 0, NULL, NULL, 0, N'f923163e-a3f8-40ad-92b8-abdc1694934f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (49, 1067, 1086, 15, N'photos', N'Photos', 5, 1, NULL, NULL, 0, N'ca45eeb4-e4ba-415e-be5e-5a9df397161d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (50, 1066, 1086, 16, N'features', N'Features', 0, 0, NULL, NULL, 0, N'f194cba3-b5df-44c2-8aad-0f29a300e875')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (51, 1060, 1086, 17, N'bodyText', N'Content', 0, 0, NULL, NULL, 0, N'29841af5-8859-4b04-8d98-728d2ea542e5')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (52, 1063, 1087, 18, N'photo', N'Photo', 0, 0, NULL, NULL, 0, N'6584f597-aa9f-4583-bf70-286a88a3d2d2')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (53, 1062, 1087, 18, N'department', N'Department', 1, 0, NULL, NULL, 0, N'46e59c1a-e776-45ed-8b58-ddb71b680de8')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (54, -88, 1087, 18, N'email', N'Email', 2, 0, NULL, NULL, 0, N'efcc9d8f-b1d1-4afa-8002-7408871ded8c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (55, -88, 1087, 19, N'twitterUsername', N'Twitter username', 0, 0, NULL, NULL, 0, N'96712722-6e84-41f5-b218-586d396f9d28')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (56, -88, 1087, 19, N'facebookUsername', N'Facebook username', 1, 0, NULL, NULL, 0, N'ba3d5eb6-4f15-425b-8db1-551ee6a9a2d5')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (57, -88, 1087, 19, N'linkedInUsername', N'LinkedIn username', 2, 0, NULL, NULL, 0, N'a66af125-a6bd-4dc9-9c29-c147d115ceaa')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (58, -88, 1087, 19, N'instagramUsername', N'Instagram Username', 3, 0, NULL, NULL, 0, N'c41834fa-ca4a-4095-b2ad-25b7332bb627')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (59, 1061, 1088, 20, N'featuredPeople', N'Featured People', 2, 0, NULL, NULL, 0, N'ceeb1a4a-c96c-4d71-8f8d-6000aea07ee1')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (60, -88, 1089, 21, N'heroHeader', N'Header', 0, 1, NULL, N'This is the main headline for the hero area on the Homepage', 0, N'ed45cf4c-1a74-494f-81e3-ee2f62bd1037')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (61, -89, 1089, 21, N'heroDescription', N'Description', 1, 1, NULL, NULL, 0, N'1d34e7bb-fef4-428f-9367-e072b09a599d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (62, -88, 1089, 21, N'heroCTACaption', N'Call To Action Caption', 2, 1, NULL, N'The caption on the button', 0, N'40498269-96ae-4420-bba5-5297987d04fc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (63, 1051, 1089, 21, N'HeroCtalink', N'Call To Action Link', 3, 1, NULL, NULL, 0, N'c287b87f-f995-4310-ad32-7a6b7e621301')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (64, 1053, 1089, 22, N'bodyText', N'Content', 0, 0, NULL, NULL, 0, N'20e8a3e9-4f90-4f2b-8b76-5b2cd44bb748')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (65, -88, 1089, 23, N'footerHeader', N'Header', 0, 0, NULL, NULL, 0, N'2aa05a9a-fb94-4817-8ca5-187964766204')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (66, -89, 1089, 23, N'footerDescription', N'Description', 1, 0, NULL, NULL, 0, N'91699fa5-6f8d-49a7-9fb5-385d7aed5cc6')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (67, -88, 1089, 23, N'footerCTACaption', N'Call To Action Caption', 2, 0, NULL, N'Caption on the Call To Action Button', 0, N'090d8f9e-37fb-4518-afbc-abf84f91c4a0')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (68, 1051, 1089, 23, N'FooterCtalink', N'Call To Action Link', 3, 1, NULL, NULL, 0, N'8b3fbf44-1b5f-485b-be5f-23992b83a21f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (69, -88, 1089, 23, N'footerAddress', N'Address', 4, 1, NULL, NULL, 0, N'826a5f7a-cdc7-4a3b-9aff-a730b23ce484')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (70, 1048, 1089, 24, N'HeroBackgroundImage', N'Hero Background', 0, 1, NULL, N'Spice up the homepage by adding a beautiful photo that relates to your business', 0, N'4f362f20-ca4a-40ec-bcf7-d275cd05699b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (71, 1054, 1089, 24, N'font', N'Font', 1, 1, NULL, N'', 0, N'11d78045-d73c-4e08-b51f-678ac9bc631e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (72, 1052, 1089, 24, N'colorTheme', N'Color Theme', 2, 1, NULL, N'', 0, N'598b1358-26e7-4cd5-9ff6-dc76ec40d3bf')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (73, -88, 1089, 24, N'sitename', N'Sitename', 3, 1, NULL, N'Used on the homepage as well as the title and social cards', 0, N'07d11957-9c77-45e4-9593-c31dba2b7878')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (74, 1048, 1089, 24, N'SiteLogo', N'Logo', 4, 0, NULL, N'Optional. If you add a logo it''ll be used in the upper left corner instead of the site name. Make sure to use a transparent logo for best results', 0, N'3deb2cde-c908-4ba6-9f40-05cf23c97343')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (75, -88, 1090, 25, N'featureName', N'Name', 0, 1, NULL, NULL, 0, N'24628569-d73b-4e38-8e51-acb85efcdb9f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (76, -89, 1090, 25, N'featureDetails', N'Details', 1, 0, NULL, NULL, 0, N'd20bcbce-a19d-4d21-8199-21a0e23c2a76')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (77, -88, 1092, 26, N'pageTitle', N'Page Title', 0, 1, NULL, N'The title of the page, this is also the first text in a google search result. The ideal length is between 40 and 60 characters', 0, N'f2b80fe1-01b0-42be-aedd-45663d8b88b6')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (78, -88, 1092, 26, N'contactFormHeader', N'Contact Form Header', 1, 1, NULL, NULL, 0, N'c8f99cb8-e9b9-4972-b05c-6244e2722593')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (79, 1059, 1092, 26, N'contactIntro', N'Contact Intro', 2, 1, NULL, NULL, 0, N'f361f0d3-1c19-4caf-9955-0a3ca97a8a77')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (80, -92, 1092, 26, N'contactForm', N'Pick a Contact Form', 3, 0, NULL, N'If Umbraco Forms is installed you''ll be able to select a form', 0, N'1e76eceb-c705-4051-af98-14580c113160')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (81, -88, 1092, 27, N'mapHeader', N'Map Header', 0, 0, NULL, NULL, 0, N'5527a1f2-5b05-4c8c-9f0e-46ad4397b5bc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (82, 1071, 1092, 27, N'mapCoordinates', N'Map Coordinates', 1, 0, NULL, NULL, 0, N'62f0cb6c-fd28-493d-9992-21b546cbb530')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (83, -88, 1093, 28, N'pageTitle', N'Page Title', 1, 1, NULL, N'The title of the page, this is also the first text in a google search result. The ideal length is between 40 and 60 characters', 0, N'becd9d98-bbb2-4cfb-9134-ff11bede0bba')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (84, 1065, 1093, 28, N'categories', N'Categories (tags)', 2, 0, NULL, NULL, 0, N'199c744c-5a87-4ce4-bdfa-6721d62b153a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (85, -89, 1093, 28, N'excerpt', N'Excerpt', 3, 1, NULL, N'Introduction to your blog post. This is also used in the summaries on the front of the blog as well as the homepage', 0, N'8402f31f-a735-4607-a572-836a77c5627d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (86, 1060, 1093, 28, N'bodyText', N'Content', 4, 0, NULL, NULL, 0, N'c6b5e78f-023f-4c12-b424-77a246de988a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (87, 1056, 1094, 29, N'howManyPostsShouldBeShown', N'How many posts should be shown?', 0, 1, NULL, NULL, 0, N'f33adf38-cc0d-4ca3-83f2-f1898e0578fd')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (88, -88, 1094, 29, N'disqusShortname', N'Disqus Shortname', 1, 0, NULL, N'To use comments, you''ll need to sign up for Disqus and enter your shortname here (more info: https://help.disqus.com/customer/portal/articles/472097-universal-embed-code)', 0, N'dad3e480-5a6f-47ed-8ea5-578fe816f78f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (89, -49, 1093, 28, N'sendPushNotification', N'Send Push Notification', 0, 0, NULL, NULL, 0, N'13c09614-7567-418f-b1e0-3b7098e0f8e7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (92, -89, 1137, 31, N'excerpt', N'Excerpt', 2, 0, NULL, NULL, 0, N'309e0133-ad83-4484-b8b0-004217b458d8')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [variations], [UniqueID]) VALUES (93, -49, 1137, 31, N'sendPushNotification', N'Send Push Notification', 0, 0, NULL, NULL, 0, N'079a03ea-8e63-4dc3-9718-0454e0761619')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (12, 1083, N'Content', 0, N'5b119df4-8700-4a39-ac49-4ea71c43a26e')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (13, 1084, N'Navigation & SEO', 100, N'35a8102f-75be-4f97-a543-cc85c3a13b07')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (14, 1085, N'Shop', 0, N'6960adaf-5fe3-4b4f-a66f-684984f4367a')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (15, 1086, N'Product Details', 0, N'87129652-f9b4-4e9a-8ab8-f33a8438689b')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (16, 1086, N'Features', 1, N'd41d064f-67e7-4575-a468-98a5f882822a')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (17, 1086, N'Detailed Description', 2, N'b3246c03-c442-43c2-ab50-eac8cbd0de5e')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (18, 1087, N'Details', 0, N'2e7b9a89-c997-41b0-a771-a01045ee478d')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (19, 1087, N'Social', 0, N'adf36780-a15b-4894-8728-e9c8cd603dde')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (20, 1088, N'Content', 0, N'ed4db845-57b9-496f-9014-961b5e83ef8c')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (21, 1089, N'Hero', 0, N'3865478c-5893-4ebd-aa2d-9dae64634a00')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (22, 1089, N'Content', 1, N'34c618b2-9087-402b-9d6a-3beeb017765d')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (23, 1089, N'Footer', 2, N'6e14686d-025a-4b03-b161-ab5868cc68fc')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (24, 1089, N'Design', 3, N'9e476427-02bb-4ee6-a556-860fe233c9b0')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (25, 1090, N'Feature', 0, N'523cbac1-53d0-466b-b2b7-6d31ce7a0696')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (26, 1092, N'Form', 0, N'32e7e397-ab98-49fb-8f62-7ad62eccaeed')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (27, 1092, N'Map', 1, N'6b7956f7-451b-4197-a614-b3a30a0fb3c4')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (28, 1093, N'Content', 0, N'e23813f5-6645-46c0-aa07-f657ea503cd6')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (29, 1094, N'Settings', 0, N'977e4f92-6eb5-4699-9201-bd22d96e7143')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (31, 1137, N'Content', 0, N'78ccceba-8eb3-4abe-a811-2f0cf10076fc')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1097, 1, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1097, 2, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1098, 3, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1099, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1099, 5, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1100, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1100, 5, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1101, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1101, 6, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1102, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1102, 7, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1103, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1103, 6, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1104, 4, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1104, 8, 46)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1106, 9, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1106, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1107, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1107, 11, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1108, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1108, 11, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1109, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1109, 11, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1110, 10, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1110, 12, 53)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1115, 13, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1115, 14, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1115, 15, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1116, 15, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1116, 16, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1116, 17, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1117, 15, 84)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1117, 18, 84)
SET IDENTITY_INSERT [dbo].[cmsTags] ON 

INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (3, N'default', NULL, N'animals')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (4, N'default', NULL, N'bingo')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (16, N'default', NULL, N'cg16')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (8, N'default', NULL, N'clothing')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (17, N'default', NULL, N'codegarden')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (1, N'default', NULL, N'dedication')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (13, N'default', NULL, N'demo')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (9, N'default', NULL, N'Denmark')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (6, N'default', NULL, N'fashion')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (18, N'default', NULL, N'great')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (7, N'default', NULL, N'music')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (10, N'default', NULL, N'mvp')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (12, N'default', NULL, N'Netherlands')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (5, N'default', NULL, N'sports')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (14, N'default', NULL, N'starter kit')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (2, N'default', NULL, N'tattoo')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (15, N'default', NULL, N'umbraco')
INSERT [dbo].[cmsTags] ([id], [group], [languageId], [tag]) VALUES (11, N'default', NULL, N'United Kingdom')
SET IDENTITY_INSERT [dbo].[cmsTags] OFF
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (1, 1072, N'Blog')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (2, 1073, N'Blogpost')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (3, 1074, N'contact')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (4, 1075, N'contentPage')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (5, 1076, N'home')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (6, 1077, N'master')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (7, 1078, N'people')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (8, 1079, N'Person')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (9, 1080, N'Product')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (10, 1081, N'Products')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
SET IDENTITY_INSERT [dbo].[umbracoAudit] ON 

INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T04:13:46.743' AS DateTime), -1, N'User "Administrator" ', N'umbraco/user/save', N'updating RawPasswordValue, LastPasswordChangeDate, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (2, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T04:13:47.190' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating Email, Name, Username, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (3, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T04:14:58.597' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (4, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T04:16:34.263' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (5, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T04:16:34.553' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (6, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-28T04:16:41.340' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (7, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T05:14:27.813' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (8, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T05:14:28.237' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (9, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T05:52:21.397' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (10, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T05:52:21.987' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (11, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-28T05:54:58.940' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (12, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T05:55:00.280' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (13, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T06:03:11.693' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (14, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T06:03:19.137' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (15, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T06:03:19.200' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (16, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T06:03:19.227' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (17, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T06:34:05.373' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (18, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T06:34:05.837' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (19, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T06:40:02.427' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (20, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T06:40:02.447' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (21, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T07:04:52.307' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (22, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T07:04:52.610' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (23, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T07:30:14.270' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (24, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T07:30:14.633' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (25, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T16:30:19.667' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (26, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-28T16:30:21.100' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (27, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T05:24:56.927' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (28, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T05:24:58.653' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (29, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T05:40:35.957' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (30, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T05:40:36.027' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (31, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:03:27.040' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (32, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:03:27.770' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (33, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T08:06:55.030' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/save', N'updating SessionTimeout, SecurityStamp, CreateDate, UpdateDate, Id')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (34, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T08:06:55.080' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/save', N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (35, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T08:06:55.283' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/save', N'updating Key, IsApproved, Groups, UpdateDate; groups assigned: editor')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (36, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T08:08:01.733' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/save', N'updating IsApproved, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (37, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T08:08:03.230' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/save', N'updating IsApproved, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (38, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T08:08:05.713' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/save', N'updating Key, Groups, UpdateDate; groups assigned: editor')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (39, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:08:19.193' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/logout', N'logout success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (40, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:08:25.640' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (41, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:08:25.653' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (42, 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'::1', CAST(N'2019-11-29T08:08:52.680' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (43, 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'::1', CAST(N'2019-11-29T08:09:19.437' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/sign-in/logout', N'logout success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (44, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:09:21.163' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (45, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:09:21.303' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (46, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:38:56.100' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (47, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:38:56.170' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (48, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T08:58:53.750' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (49, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T08:58:53.850' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (50, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T09:11:00.560' AS DateTime), -1, N'Member 1149 "buddhistsoul@gmail.com" <buddhistsoul@gmail.com>', N'umbraco/member/save', N'updating Name, ParentId, CreatorId, ProviderUserKey, CreateDate, UpdateDate, Id, Path, SortOrder, Level, umbracoMemberApproved')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (51, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T09:11:00.650' AS DateTime), -1, N'Member 1149 "buddhistsoul@gmail.com" <buddhistsoul@gmail.com>', N'umbraco/member/save', N'updating UpdateDate, umbracoMemberPasswordRetrievalQuestion, umbracoMemberPasswordRetrievalAnswer, umbracoMemberLastLogin, umbracoMemberLastPasswordChangeDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (52, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-11-29T09:11:00.793' AS DateTime), -1, N'Member 1149 "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/member/save', N'updating Name, UpdateDate, firstName, middleName, lastName')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (53, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T10:17:47.727' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (54, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-29T10:17:47.870' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (55, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-30T18:00:29.560' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (56, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-30T18:00:30.053' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (57, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-11-30T18:03:47.750' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/logout', N'logout success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (58, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-12-03T13:31:59.347' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (59, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-12-03T13:32:00.923' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (60, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-12-03T15:51:57.370' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (61, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-12-03T15:51:57.387' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (62, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-12-03T16:39:09.330' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (63, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-12-03T16:39:09.387' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (64, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-12-03T16:39:50.710' AS DateTime), 1, N'User "Pasang Tamang" <buddhistsoul@gmail.com>', N'umbraco/user/save', N'updating IsApproved, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (65, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-12-03T16:40:24.733' AS DateTime), 1, N'User "Editor User" <editor@admin.com>', N'umbraco/user/save', N'updating Name, Email, Key, Username, Groups, UpdateDate; groups assigned: editor')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (66, -1, N'User "Usome" <info@usome.com>', N'::1', CAST(N'2019-12-03T16:41:20.460' AS DateTime), -1, N'User "Usome" <info@usome.com>', N'umbraco/user/save', N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (67, -1, N'User "Administrator" <admin@admin.com>', N'::1', CAST(N'2019-12-03T16:41:20.550' AS DateTime), -1, N'User "Administrator" <admin@admin.com>', N'umbraco/user/save', N'updating Name, Email, Key, Username, Groups, UpdateDate; groups assigned: admin, sensitiveData')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (68, -1, N'User "Administrator" <admin@admin.com>', N'::1', CAST(N'2019-12-03T16:41:20.707' AS DateTime), -1, N'User "Administrator" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (69, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-12-03T16:41:24.640' AS DateTime), -1, N'User "Administrator" <admin@admin.com>', N'umbraco/user/sign-in/logout', N'logout success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (70, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-12-03T16:41:35.990' AS DateTime), -1, N'User "Administrator" <admin@admin.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (71, 0, N'User "SYTEM" ', N'::1', CAST(N'2019-12-03T16:41:36.003' AS DateTime), -1, N'User "Administrator" <admin@admin.com>', N'umbraco/user/sign-in/login', N'login success')
SET IDENTITY_INSERT [dbo].[umbracoAudit] OFF
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (83, CAST(N'2019-12-03T13:32:02.127' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-KAAO128//LM/W3SVC/2/ROOT [P11452/D2] 7924825970FF4E7EB28E08EA1CC14460', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (84, CAST(N'2019-12-03T15:51:57.400' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-KAAO128//LM/W3SVC/2/ROOT [P11452/D2] 7924825970FF4E7EB28E08EA1CC14460', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (85, CAST(N'2019-12-03T16:39:09.540' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-KAAO128//LM/W3SVC/2/ROOT [P11452/D2] 7924825970FF4E7EB28E08EA1CC14460', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (86, CAST(N'2019-12-03T16:39:50.733' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-KAAO128//LM/W3SVC/2/ROOT [P11452/D2] 7924825970FF4E7EB28E08EA1CC14460', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (87, CAST(N'2019-12-03T16:40:24.800' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-KAAO128//LM/W3SVC/2/ROOT [P11452/D2] 7924825970FF4E7EB28E08EA1CC14460', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (88, CAST(N'2019-12-03T16:41:20.713' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-KAAO128//LM/W3SVC/2/ROOT [P11452/D2] 7924825970FF4E7EB28E08EA1CC14460', 3)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (89, CAST(N'2019-12-03T16:41:36.057' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-KAAO128//LM/W3SVC/2/ROOT [P11452/D2] 7924825970FF4E7EB28E08EA1CC14460', 1)
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1095, 1089)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1096, 1085)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1097, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1098, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1099, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1100, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1101, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1102, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1103, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1104, 1086)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1105, 1088)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1106, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1107, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1108, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1109, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1110, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1111, 1091)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1112, 1091)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1113, 1091)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1114, 1094)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1115, 1093)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1116, 1093)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1117, 1093)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1118, 1092)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1119, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1120, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1121, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1122, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1123, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1124, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1125, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1126, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1127, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1128, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1129, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1130, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1131, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1132, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1133, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1134, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1135, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1139, 1136)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1140, 1137)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1149, 1044)
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] ON 

INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1, 1095, CAST(N'2019-11-28T09:59:44.847' AS DateTime), -1, 0, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2, 1096, CAST(N'2019-11-28T09:59:45.027' AS DateTime), -1, 0, N'Products')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (3, 1097, CAST(N'2019-11-28T09:59:45.113' AS DateTime), -1, 0, N'Tattoo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (4, 1098, CAST(N'2019-11-28T09:59:45.263' AS DateTime), -1, 0, N'Unicorn')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (5, 1099, CAST(N'2019-11-28T09:59:45.330' AS DateTime), -1, 0, N'Ping Pong Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (6, 1100, CAST(N'2019-11-28T09:59:45.430' AS DateTime), -1, 0, N'Bowling Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (7, 1101, CAST(N'2019-11-28T09:59:45.490' AS DateTime), -1, 0, N'Jumpsuit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (8, 1102, CAST(N'2019-11-28T09:59:45.590' AS DateTime), -1, 0, N'Banjo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (9, 1103, CAST(N'2019-11-28T09:59:45.670' AS DateTime), -1, 0, N'Knitted West')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (10, 1104, CAST(N'2019-11-28T09:59:45.790' AS DateTime), -1, 0, N'Biker Jacket')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (11, 1105, CAST(N'2019-11-28T09:59:45.857' AS DateTime), -1, 0, N'People')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (12, 1106, CAST(N'2019-11-28T09:59:45.893' AS DateTime), -1, 0, N'Jan Skovgaard')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (13, 1107, CAST(N'2019-11-28T09:59:45.993' AS DateTime), -1, 0, N'Matt Brailsford')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (14, 1108, CAST(N'2019-11-28T09:59:46.060' AS DateTime), -1, 0, N'Lee Kelleher')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (15, 1109, CAST(N'2019-11-28T09:59:46.113' AS DateTime), -1, 0, N'Jeavon Leopold')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (16, 1110, CAST(N'2019-11-28T09:59:46.167' AS DateTime), -1, 0, N'Jeroen Breuer')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (17, 1111, CAST(N'2019-11-28T09:59:46.233' AS DateTime), -1, 0, N'About Us')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (18, 1112, CAST(N'2019-11-28T09:59:46.277' AS DateTime), -1, 0, N'About this Starter Kit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (19, 1113, CAST(N'2019-11-28T09:59:46.313' AS DateTime), -1, 0, N'Todo list for the Starter Kit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (20, 1114, CAST(N'2019-11-28T09:59:46.350' AS DateTime), -1, 0, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (21, 1115, CAST(N'2019-11-28T09:59:46.390' AS DateTime), -1, 0, N'My Blog Post')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (22, 1116, CAST(N'2019-11-28T09:59:46.493' AS DateTime), -1, 0, N'Another one')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (23, 1117, CAST(N'2019-11-28T09:59:46.580' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (24, 1118, CAST(N'2019-11-28T09:59:46.697' AS DateTime), -1, 0, N'Contact')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (25, 1119, CAST(N'2019-11-28T09:59:44.047' AS DateTime), NULL, 1, N'Design')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (26, 1120, CAST(N'2019-11-28T09:59:44.110' AS DateTime), NULL, 1, N'People')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (27, 1121, CAST(N'2019-11-28T09:59:44.147' AS DateTime), NULL, 1, N'Products')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (28, 1122, CAST(N'2019-11-28T09:59:44.210' AS DateTime), NULL, 1, N'Umbraco Campari Meeting Room')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (29, 1123, CAST(N'2019-11-28T09:59:44.250' AS DateTime), NULL, 1, N'Biker Jacket')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (30, 1124, CAST(N'2019-11-28T09:59:44.280' AS DateTime), NULL, 1, N'Tattoo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (31, 1125, CAST(N'2019-11-28T09:59:44.313' AS DateTime), NULL, 1, N'Unicorn')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (32, 1126, CAST(N'2019-11-28T09:59:44.343' AS DateTime), NULL, 1, N'Ping Pong Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (33, 1127, CAST(N'2019-11-28T09:59:44.433' AS DateTime), NULL, 1, N'Bowling Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (34, 1128, CAST(N'2019-11-28T09:59:44.493' AS DateTime), NULL, 1, N'Jumpsuit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (35, 1129, CAST(N'2019-11-28T09:59:44.533' AS DateTime), NULL, 1, N'Banjo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (36, 1130, CAST(N'2019-11-28T09:59:44.567' AS DateTime), NULL, 1, N'Knitted West')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (37, 1131, CAST(N'2019-11-28T09:59:44.597' AS DateTime), NULL, 1, N'Jan Skovgaard')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (38, 1132, CAST(N'2019-11-28T09:59:44.627' AS DateTime), NULL, 1, N'Matt Brailsford')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (39, 1133, CAST(N'2019-11-28T09:59:44.660' AS DateTime), NULL, 1, N'Lee Kelleher')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (40, 1134, CAST(N'2019-11-28T09:59:44.690' AS DateTime), NULL, 1, N'Jeavon Leopold')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (41, 1135, CAST(N'2019-11-28T09:59:44.723' AS DateTime), NULL, 1, N'Jeroen Breuer')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (42, 1095, CAST(N'2019-11-28T09:59:44.847' AS DateTime), -1, 1, N'Home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (43, 1096, CAST(N'2019-11-28T09:59:45.027' AS DateTime), -1, 1, N'Products')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (44, 1097, CAST(N'2019-11-28T09:59:45.113' AS DateTime), -1, 1, N'Tattoo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (45, 1098, CAST(N'2019-11-28T09:59:45.263' AS DateTime), -1, 1, N'Unicorn')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (46, 1099, CAST(N'2019-11-28T09:59:45.330' AS DateTime), -1, 1, N'Ping Pong Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (47, 1100, CAST(N'2019-11-28T09:59:45.430' AS DateTime), -1, 1, N'Bowling Ball')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (48, 1101, CAST(N'2019-11-28T09:59:45.490' AS DateTime), -1, 1, N'Jumpsuit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (49, 1102, CAST(N'2019-11-28T09:59:45.590' AS DateTime), -1, 1, N'Banjo')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (50, 1103, CAST(N'2019-11-28T09:59:45.670' AS DateTime), -1, 1, N'Knitted West')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (51, 1104, CAST(N'2019-11-28T09:59:45.790' AS DateTime), -1, 1, N'Biker Jacket')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (52, 1105, CAST(N'2019-11-28T09:59:45.857' AS DateTime), -1, 1, N'People')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (53, 1106, CAST(N'2019-11-28T09:59:45.893' AS DateTime), -1, 1, N'Jan Skovgaard')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (54, 1107, CAST(N'2019-11-28T09:59:45.993' AS DateTime), -1, 1, N'Matt Brailsford')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (55, 1108, CAST(N'2019-11-28T09:59:46.060' AS DateTime), -1, 1, N'Lee Kelleher')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (56, 1109, CAST(N'2019-11-28T09:59:46.113' AS DateTime), -1, 1, N'Jeavon Leopold')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (57, 1110, CAST(N'2019-11-28T09:59:46.167' AS DateTime), -1, 1, N'Jeroen Breuer')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (58, 1111, CAST(N'2019-11-28T09:59:46.233' AS DateTime), -1, 1, N'About Us')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (59, 1112, CAST(N'2019-11-28T09:59:46.277' AS DateTime), -1, 1, N'About this Starter Kit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (60, 1113, CAST(N'2019-11-28T09:59:46.313' AS DateTime), -1, 1, N'Todo list for the Starter Kit')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (61, 1114, CAST(N'2019-11-28T09:59:46.350' AS DateTime), -1, 1, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (62, 1115, CAST(N'2019-11-28T12:50:11.420' AS DateTime), -1, 0, N'My Blog Post')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (63, 1116, CAST(N'2019-11-28T13:15:42.087' AS DateTime), -1, 0, N'Another one')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (64, 1117, CAST(N'2019-11-28T11:40:19.817' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (65, 1118, CAST(N'2019-11-28T09:59:46.697' AS DateTime), -1, 1, N'Contact')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (66, 1117, CAST(N'2019-11-28T11:48:45.827' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (67, 1117, CAST(N'2019-11-28T12:19:25.140' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (68, 1117, CAST(N'2019-11-29T11:10:21.913' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (69, 1115, CAST(N'2019-11-28T12:50:11.420' AS DateTime), -1, 1, N'My Blog Post')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (70, 1116, CAST(N'2019-11-28T13:15:42.087' AS DateTime), -1, 1, N'Another one')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (71, 1139, CAST(N'2019-11-28T13:24:25.293' AS DateTime), -1, 0, N'Notifications')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (72, 1139, CAST(N'2019-11-28T13:24:25.293' AS DateTime), -1, 1, N'Notifications')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (73, 1140, CAST(N'2019-11-28T13:28:47.140' AS DateTime), -1, 0, N'24Days.in Notification')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (74, 1140, CAST(N'2019-11-28T13:30:08.140' AS DateTime), -1, 0, N'24Days.in Notification')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (75, 1140, CAST(N'2019-11-28T13:30:32.093' AS DateTime), -1, 0, N'24Days.in Notification')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (76, 1140, CAST(N'2019-11-28T13:30:51.287' AS DateTime), -1, 0, N'24Days.in Notification')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (77, 1140, CAST(N'2019-11-28T13:30:51.287' AS DateTime), -1, 1, N'24Days.in Notification')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (78, 1117, CAST(N'2019-11-29T11:28:04.323' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (79, 1117, CAST(N'2019-11-29T11:30:10.407' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (80, 1117, CAST(N'2019-11-29T11:31:06.443' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (81, 1117, CAST(N'2019-11-29T11:31:38.653' AS DateTime), -1, 0, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (82, 1117, CAST(N'2019-11-29T11:31:38.653' AS DateTime), -1, 1, N'This will be great')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (93, 1149, CAST(N'2019-11-29T14:56:00.723' AS DateTime), NULL, 1, N'Pasang Tamang')
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] OFF
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-99, N'Umbraco.Label', N'Decimal', N'{"umbracoDataValueType":"DECIMAL"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-98, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"TIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-97, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":10, "orderBy":"username", "orderDirection":"asc", "includeProperties":[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-96, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-95, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-94, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"DATETIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-93, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"BIGINT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-92, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"STRING"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-91, N'Umbraco.Label', N'Integer', N'{"umbracoDataValueType":"INT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-90, N'Umbraco.UploadField', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-89, N'Umbraco.TextArea', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-88, N'Umbraco.TextBox', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-87, N'Umbraco.TinyMCE', N'Ntext', N'{"value":",code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-51, N'Umbraco.Integer', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-49, N'Umbraco.TrueFalse', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-43, N'Umbraco.CheckBoxList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-42, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-41, N'Umbraco.DateTime', N'Date', N'{"format":"YYYY-MM-DD"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-40, N'Umbraco.RadioButtonList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-39, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-37, N'Umbraco.ColorPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-36, N'Umbraco.DateTime', N'Date', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1041, N'Umbraco.Tags', N'Ntext', N'{"group":"default", "storageType":"Json"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1043, N'Umbraco.ImageCropper', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1046, N'Umbraco.ContentPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1047, N'Umbraco.MemberPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1048, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":false,"onlyImages":false,"disableFolderSelect":false,"startNodeId":null,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1049, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":1}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1050, N'Umbraco.MultiUrlPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1051, N'Umbraco.ContentPicker', N'Nvarchar', N'{"showOpenButton":false,"startNodeId":"umb://document/ca4249ed2b234337b52263cabe5587d1","ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1052, N'Umbraco.RadioButtonList', N'Nvarchar', N'{"items":[{"id":1,"value":"water"},{"id":2,"value":"earth"},{"id":3,"value":"sun"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1053, N'Umbraco.Grid', N'Ntext', N'{"items":{"styles":[],"config":[],"columns":12,"templates":[{"name":"1 column layout","sections":[{"grid":12}]}],"layouts":[{"name":"Full Width","areas":[{"grid":12,"allowAll":false,"allowed":["media","macro","embed","headline"]}]},{"name":"Half and half","areas":[{"grid":6,"allowAll":false,"allowed":["rte","media","macro","embed","headline","quote"]},{"grid":6,"allowAll":false,"allowed":["quote","headline","embed","macro","media","rte"]}]},{"name":"Testimonials","areas":[{"grid":4,"allowAll":false,"allowed":[]},{"grid":4,"allowAll":false,"allowed":[]},{"grid":4,"allowAll":false,"allowed":[]}]}]},"rte":{"toolbar":["code","bold","italic","styleselect","alignleft","aligncenter","alignright","bullist","numlist","outdent","indent","link","image","ace"],"stylesheets":[],"maxImageSize":500,"mode":"classic","dimensions":{"height":500}},"ignoreUserStartNodes":false,"mediaParentId":null}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1054, N'Umbraco.RadioButtonList', N'Nvarchar', N'{"items":[{"id":1,"value":"standard"},{"id":2,"value":"serif"},{"id":3,"value":"mono"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1055, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":false,"onlyImages":true,"disableFolderSelect":true,"startNodeId":"umb://document/b61e08cd366445759a7295848cb803ac","ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1056, N'Umbraco.Slider', N'Nvarchar', N'{"enableRange":false,"initVal1":0.0,"initVal2":0.0,"minVal":0.0,"maxVal":0.0,"step":0.0}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1057, N'Umbraco.Tags', N'Nvarchar', N'{"group":"default","storageType":1,"Delimiter":"\u0000"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1058, N'UmbracoForms.FormPicker', N'Nvarchar', N'{"allowedForms":[]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1059, N'Umbraco.TinyMCE', N'Ntext', N'{"editor":{"toolbar":["undo","redo","styleselect","bold","italic","alignleft","aligncenter","alignright","bullist","numlist","outdent","indent","link"],"stylesheets":[],"maxImageSize":500,"mode":"classic","dimensions":{"height":500}},"hideLabel":false,"ignoreUserStartNodes":false,"mediaParentId":null}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1060, N'Umbraco.Grid', N'Ntext', N'{"items":{"styles":[],"config":[],"columns":12,"templates":[{"name":"1 column layout","sections":[{"grid":12,"allowAll":true}]}],"layouts":[{"label":"Article","name":"Article","areas":[{"grid":4},{"grid":8}]},{"name":"Three Columns","areas":[{"grid":4,"allowAll":true},{"grid":4,"allowAll":true},{"grid":4,"allowAll":true}]},{"name":"FullWidth","areas":[{"grid":12,"allowAll":true}]}]},"rte":{"toolbar":["code","bold","italic","styleselect","alignleft","aligncenter","alignright","bullist","numlist","outdent","indent","link","image","ace","redo","undo","strikethrough","table"],"stylesheets":[],"maxImageSize":500,"mode":"classic","dimensions":{"height":500}},"ignoreUserStartNodes":false,"mediaParentId":null}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1061, N'Umbraco.MultiNodeTreePicker', N'Ntext', N'{"startNode":null,"filter":"person","minNumber":0,"maxNumber":0,"showOpenButton":false,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1062, N'Umbraco.Tags', N'Nvarchar', N'{"group":"default","storageType":0,"Delimiter":"\u0000"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1063, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":false,"onlyImages":true,"disableFolderSelect":true,"startNodeId":"umb://media/1fd2ecaff3714c009306867fa4585e7a","ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1064, N'Umbraco.Tags', N'Nvarchar', N'{"group":"default","storageType":0,"Delimiter":"\u0000"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1065, N'Umbraco.Tags', N'Nvarchar', N'{"group":"default","storageType":1,"Delimiter":"\u0000"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1066, N'Umbraco.NestedContent', N'Ntext', N'{"contentTypes":[{"ncAlias":"feature","ncTabAlias":"Feature","nameTemplate":"{{featureName}}"}],"minItems":0,"maxItems":0,"confirmDeletes":true,"showIcons":true,"hideLabel":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1067, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":false,"onlyImages":true,"disableFolderSelect":true,"startNodeId":"umb://media/6d5bf746cb8245c5bd15dd3798209b87","ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1068, N'Umbraco.Decimal', N'Decimal', N'{}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1069, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":false,"items":[{"id":1,"value":"€"},{"id":2,"value":"£"},{"id":3,"value":"$"},{"id":4,"value":"DKK"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1070, N'Umbraco.MultiNodeTreePicker', N'Ntext', N'{"startNode":null,"filter":"product","minNumber":0,"maxNumber":9,"showOpenButton":false,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1071, N'Our.Umbraco.OsmMaps', N'Nvarchar', N'{}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1138, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":10,"orderBy":"updateDate","orderDirection":"desc","includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":false}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"tabName":null,"showContentFirst":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1141, N'Umbraco.UserPicker', N'Integer', N'{}')
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1095, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1096, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1097, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1098, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1099, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1100, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1101, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1102, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1103, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1104, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1105, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1106, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1107, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1108, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1109, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1110, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1111, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1112, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1113, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1114, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1115, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1116, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1117, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1118, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1139, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1140, 1, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1, 1076, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2, 1081, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (3, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (4, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (5, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (6, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (7, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (8, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (9, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (10, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (11, 1078, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (12, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (13, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (14, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (15, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (16, 1079, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (17, 1075, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (18, 1075, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (19, 1075, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (20, 1072, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (21, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (22, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (23, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (24, 1074, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (42, 1076, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (43, 1081, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (44, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (45, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (46, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (47, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (48, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (49, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (50, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (51, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (52, 1078, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (53, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (54, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (55, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (56, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (57, 1079, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (58, 1075, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (59, 1075, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (60, 1075, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (61, 1072, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (62, 1073, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (63, 1073, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (64, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (65, 1074, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (66, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (67, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (68, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (69, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (70, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (71, NULL, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (72, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (73, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (74, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (75, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (76, NULL, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (77, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (78, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (79, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (80, 1073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (81, 1073, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (82, 1073, 0)
INSERT [dbo].[umbracoKeyValue] ([key], [value], [updated]) VALUES (N'Umbraco.Core.Upgrader.State+Umbraco.Core', N'{5B1E0D93-F5A3-449B-84BA-65366B84E2D4}', CAST(N'2019-11-28T09:58:45.343' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (1, N'en-US', N'English (United States)', 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-340, 1, N'Languages')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-339, 1, N'KeyValues')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-338, 1, N'Domains')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-337, -1, N'MemberTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-336, 1, N'MediaTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-335, 1, N'MemberTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-334, -1, N'MediaTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-333, -1, N'ContentTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-332, 1, N'ContentTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-331, -1, N'Servers')
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1, -1, -1, N'Package', CAST(N'2019-11-28T09:59:22.977' AS DateTime), N'PackagerInstall', N'Package files installed for package ''The Starter Kit''.', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2, -1, 1048, N'DataType', CAST(N'2019-11-28T09:59:37.513' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (3, -1, -1, N'DataType', CAST(N'2019-11-28T09:59:38.100' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (4, -1, -1, N'Macro', CAST(N'2019-11-28T09:59:38.460' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (5, -1, -1, N'Macro', CAST(N'2019-11-28T09:59:38.473' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (6, -1, -1, N'Template', CAST(N'2019-11-28T09:59:39.053' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (7, -1, -1, N'DocumentType', CAST(N'2019-11-28T09:59:40.320' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (8, -1, -1, N'DocumentType', CAST(N'2019-11-28T09:59:40.823' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (9, NULL, -1, N'Document', CAST(N'2019-11-28T09:59:41.963' AS DateTime), N'Save', N'Saved multiple content', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (10, -1, 1092, N'DocumentType', CAST(N'2019-11-28T09:59:43.150' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (11, -1, 1074, N'Template', CAST(N'2019-11-28T09:59:43.197' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (12, -1, 1072, N'Template', CAST(N'2019-11-28T09:59:43.617' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (13, -1, 1073, N'Template', CAST(N'2019-11-28T09:59:43.640' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (14, -1, 1074, N'Template', CAST(N'2019-11-28T09:59:43.660' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (15, -1, 1075, N'Template', CAST(N'2019-11-28T09:59:43.723' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (16, -1, 1076, N'Template', CAST(N'2019-11-28T09:59:43.740' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (17, -1, 1078, N'Template', CAST(N'2019-11-28T09:59:43.760' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (18, -1, 1079, N'Template', CAST(N'2019-11-28T09:59:43.777' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (19, -1, 1080, N'Template', CAST(N'2019-11-28T09:59:43.797' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (20, -1, 1081, N'Template', CAST(N'2019-11-28T09:59:43.817' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (21, -1, 1119, N'Media', CAST(N'2019-11-28T09:59:44.087' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (22, -1, 1120, N'Media', CAST(N'2019-11-28T09:59:44.123' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (23, -1, 1121, N'Media', CAST(N'2019-11-28T09:59:44.163' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (24, -1, 1122, N'Media', CAST(N'2019-11-28T09:59:44.233' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (25, -1, 1123, N'Media', CAST(N'2019-11-28T09:59:44.263' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (26, -1, 1124, N'Media', CAST(N'2019-11-28T09:59:44.297' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (27, -1, 1125, N'Media', CAST(N'2019-11-28T09:59:44.330' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (28, -1, 1126, N'Media', CAST(N'2019-11-28T09:59:44.400' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (29, -1, 1127, N'Media', CAST(N'2019-11-28T09:59:44.477' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (30, -1, 1128, N'Media', CAST(N'2019-11-28T09:59:44.520' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (31, -1, 1129, N'Media', CAST(N'2019-11-28T09:59:44.550' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (32, -1, 1130, N'Media', CAST(N'2019-11-28T09:59:44.580' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (33, -1, 1131, N'Media', CAST(N'2019-11-28T09:59:44.610' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (34, -1, 1132, N'Media', CAST(N'2019-11-28T09:59:44.643' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (35, -1, 1133, N'Media', CAST(N'2019-11-28T09:59:44.673' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (36, -1, 1134, N'Media', CAST(N'2019-11-28T09:59:44.707' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (37, -1, 1135, N'Media', CAST(N'2019-11-28T09:59:44.737' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (38, -1, 1095, N'Document', CAST(N'2019-11-28T09:59:44.940' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (39, -1, 1096, N'Document', CAST(N'2019-11-28T09:59:45.073' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (40, -1, 1097, N'Document', CAST(N'2019-11-28T09:59:45.257' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (41, -1, 1098, N'Document', CAST(N'2019-11-28T09:59:45.327' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (42, -1, 1099, N'Document', CAST(N'2019-11-28T09:59:45.423' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (43, -1, 1100, N'Document', CAST(N'2019-11-28T09:59:45.483' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (44, -1, 1101, N'Document', CAST(N'2019-11-28T09:59:45.587' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (45, -1, 1102, N'Document', CAST(N'2019-11-28T09:59:45.663' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (46, -1, 1103, N'Document', CAST(N'2019-11-28T09:59:45.760' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (47, -1, 1104, N'Document', CAST(N'2019-11-28T09:59:45.850' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (48, -1, 1105, N'Document', CAST(N'2019-11-28T09:59:45.890' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (49, -1, 1106, N'Document', CAST(N'2019-11-28T09:59:45.987' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (50, -1, 1107, N'Document', CAST(N'2019-11-28T09:59:46.053' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (51, -1, 1108, N'Document', CAST(N'2019-11-28T09:59:46.107' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (52, -1, 1109, N'Document', CAST(N'2019-11-28T09:59:46.160' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (53, -1, 1110, N'Document', CAST(N'2019-11-28T09:59:46.230' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (54, -1, 1111, N'Document', CAST(N'2019-11-28T09:59:46.273' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (55, -1, 1112, N'Document', CAST(N'2019-11-28T09:59:46.310' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (56, -1, 1113, N'Document', CAST(N'2019-11-28T09:59:46.347' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (57, -1, 1114, N'Document', CAST(N'2019-11-28T09:59:46.387' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (58, -1, 1115, N'Document', CAST(N'2019-11-28T09:59:46.487' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (59, -1, 1116, N'Document', CAST(N'2019-11-28T09:59:46.577' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (60, -1, 1117, N'Document', CAST(N'2019-11-28T09:59:46.690' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (61, -1, 1118, N'Document', CAST(N'2019-11-28T09:59:46.740' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (62, -1, 1095, N'Document', CAST(N'2019-11-28T09:59:46.760' AS DateTime), N'Publish', N'Branch published', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (63, -1, -1, N'Package', CAST(N'2019-11-28T09:59:46.783' AS DateTime), N'PackagerInstall', N'Package data installed for package ''The Starter Kit''.', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (64, -1, 1077, N'Template', CAST(N'2019-11-28T10:11:34.217' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (65, -1, 1077, N'Template', CAST(N'2019-11-28T10:19:51.333' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (66, -1, 1093, N'DocumentType', CAST(N'2019-11-28T11:05:38.417' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (67, -1, 1084, N'DocumentType', CAST(N'2019-11-28T11:38:00.550' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (68, -1, 1093, N'DocumentType', CAST(N'2019-11-28T11:38:24.510' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (69, -1, 1117, N'Document', CAST(N'2019-11-28T11:40:20.627' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (70, -1, 1077, N'Template', CAST(N'2019-11-28T11:43:13.637' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (71, -1, 1117, N'Document', CAST(N'2019-11-28T11:48:46.020' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (72, -1, 1117, N'Document', CAST(N'2019-11-28T12:19:25.373' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (73, -1, 1077, N'Template', CAST(N'2019-11-28T12:25:17.830' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (74, -1, 1115, N'Document', CAST(N'2019-11-28T12:50:11.720' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (75, -1, 1116, N'Document', CAST(N'2019-11-28T13:15:42.463' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (76, -1, 1136, N'DocumentType', CAST(N'2019-11-28T13:20:20.010' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (77, -1, 1136, N'DocumentType', CAST(N'2019-11-28T13:21:04.627' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (78, -1, 1137, N'DocumentType', CAST(N'2019-11-28T13:21:51.730' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (79, -1, 1083, N'DocumentType', CAST(N'2019-11-28T13:22:04.497' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (80, -1, 1137, N'DocumentType', CAST(N'2019-11-28T13:22:36.800' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (81, -1, 1138, N'DataType', CAST(N'2019-11-28T13:22:54.280' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (82, -1, 1138, N'DataType', CAST(N'2019-11-28T13:23:53.913' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (83, -1, 1136, N'DocumentType', CAST(N'2019-11-28T13:23:56.217' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (84, -1, 1089, N'DocumentType', CAST(N'2019-11-28T13:24:08.177' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (85, -1, 1139, N'Document', CAST(N'2019-11-28T13:24:25.573' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (86, -1, 1140, N'Document', CAST(N'2019-11-28T13:26:02.333' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (87, -1, 1137, N'DocumentType', CAST(N'2019-11-28T13:26:33.590' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (88, -1, 1083, N'DocumentType', CAST(N'2019-11-28T13:26:52.170' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (89, -1, 1137, N'DocumentType', CAST(N'2019-11-28T13:27:12.400' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (90, -1, 1140, N'Document', CAST(N'2019-11-28T13:28:47.377' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (91, -1, 1140, N'Document', CAST(N'2019-11-28T13:30:08.390' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (92, -1, 1140, N'Document', CAST(N'2019-11-28T13:30:32.220' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (93, -1, 1140, N'Document', CAST(N'2019-11-28T13:30:51.357' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (94, -1, 1117, N'Document', CAST(N'2019-11-29T11:10:23.113' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (95, -1, 1077, N'Template', CAST(N'2019-11-29T11:16:05.930' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (96, -1, 1117, N'Document', CAST(N'2019-11-29T11:28:04.510' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (97, -1, 1117, N'Document', CAST(N'2019-11-29T11:30:10.600' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (98, -1, 1117, N'Document', CAST(N'2019-11-29T11:31:06.603' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (99, -1, 1117, N'Document', CAST(N'2019-11-29T11:31:38.740' AS DateTime), N'Publish', NULL, NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (100, -1, 1044, N'MemberType', CAST(N'2019-11-29T13:51:13.153' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (101, -1, 1141, N'DataType', CAST(N'2019-11-29T13:57:17.273' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (102, -1, 1142, N'DocumentType', CAST(N'2019-11-29T13:58:58.067' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (103, -1, 1089, N'DocumentType', CAST(N'2019-11-29T13:59:09.737' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (104, -1, 1143, N'Document', CAST(N'2019-11-29T13:59:27.333' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (105, -1, 1143, N'Document', CAST(N'2019-11-29T14:01:35.270' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (106, -1, -1, N'DocumentType', CAST(N'2019-11-29T14:24:34.437' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (107, -1, -1, N'DocumentType', CAST(N'2019-11-29T14:24:45.417' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (108, -1, -1, N'DocumentType', CAST(N'2019-11-29T14:24:46.193' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (109, -1, 1089, N'DocumentType', CAST(N'2019-11-29T14:25:02.467' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (110, -1, 1147, N'Document', CAST(N'2019-11-29T14:44:18.100' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (111, -1, 1147, N'Document', CAST(N'2019-11-29T14:44:32.950' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (112, -1, 1147, N'Document', CAST(N'2019-11-29T14:44:45.273' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (113, -1, 1148, N'Document', CAST(N'2019-11-29T14:45:42.203' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (114, -1, 1148, N'Document', CAST(N'2019-11-29T14:54:15.680' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (115, -1, 1044, N'MemberType', CAST(N'2019-11-29T14:55:07.763' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (116, -1, 1149, N'Member', CAST(N'2019-11-29T14:56:00.530' AS DateTime), N'New', N'Member ''buddhistsoul@gmail.com'' was created with Id 1149', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (117, NULL, 1149, N'Member', CAST(N'2019-11-29T14:56:00.647' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (118, NULL, 1149, N'Member', CAST(N'2019-11-29T14:56:00.793' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (119, -1, 1143, N'Document', CAST(N'2019-11-30T23:45:44.640' AS DateTime), N'Move', N'Moved to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (120, -1, 1143, N'Document', CAST(N'2019-11-30T23:45:45.413' AS DateTime), N'Delete', N'Trashed content with Id: 1143 related to original parent content with Id: 1095', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (121, -1, 1147, N'Document', CAST(N'2019-11-30T23:45:49.580' AS DateTime), N'Move', N'Moved to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (122, -1, 1147, N'Document', CAST(N'2019-11-30T23:45:49.767' AS DateTime), N'Delete', N'Trashed content with Id: 1147 related to original parent content with Id: 1095', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (123, -1, 1148, N'Document', CAST(N'2019-11-30T23:45:49.783' AS DateTime), N'Delete', N'Trashed content with Id: 1148 related to original parent content with Id: 1147', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (124, -1, -20, N'Document', CAST(N'2019-11-30T23:45:56.070' AS DateTime), N'Delete', N'Recycle bin emptied', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (125, -1, -1, N'Document', CAST(N'2019-11-30T23:46:11.300' AS DateTime), N'Delete', N'Delete content of type 1146', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (126, -1, 1146, N'DocumentType', CAST(N'2019-11-30T23:46:11.573' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (127, -1, -1, N'Document', CAST(N'2019-11-30T23:46:17.807' AS DateTime), N'Delete', N'Delete content of type 1145', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (128, -1, 1145, N'DocumentType', CAST(N'2019-11-30T23:46:18.027' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (129, -1, -1, N'Document', CAST(N'2019-11-30T23:46:28.700' AS DateTime), N'Delete', N'Delete content of type 1142', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (130, -1, 1142, N'DocumentType', CAST(N'2019-11-30T23:46:28.787' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (131, -1, 1044, N'MemberType', CAST(N'2019-11-30T23:47:02.577' AS DateTime), N'Save', NULL, NULL)
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (25, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (26, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (27, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (28, N'/media/662af6ca411a4c93a6c722c4845698e7/00000006000000000000000000000000/16403439029_f500be349b_o.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (29, N'/media/55514845b8bd487cb3709724852fd6bb/00000006000000000000000000000000/4730684907_8a7f8759cb_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (30, N'/media/20e3a8ffad1b4fe9b48cb8461c46d2d0/00000006000000000000000000000000/7371127652_e01b6ab56f_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (31, N'/media/1bc5280b8658402789d958e2576e469b/00000006000000000000000000000000/14272036539_469ca21d5c_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (32, N'/media/c09ec77f08e3466aac58c979befd3cd6/00000006000000000000000000000000/5852022211_9028df67c0_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (33, N'/media/b76ddb4ee603401499066087984740ec/00000006000000000000000000000000/5852022091_87c5d045ab_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (34, N'/media/46a025d6095a4b148b961b59ca4e951c/00000006000000000000000000000000/7377957524_347859faac_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (35, N'/media/17552d12081d4d01b68132c495d6576f/00000006000000000000000000000000/7373036290_5e8420bf36_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (36, N'/media/1d0b713a022a49c8b842a2463c83a553/00000006000000000000000000000000/7373036208_30257976a0_b.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (37, N'/media/cf1ab8dcad0f4a8e974b87b84777b0d6/00000006000000000000000000000000/18720470241_ff77768544_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (38, N'/media/eee91c05b2e84031a056dcd7f28eff89/00000006000000000000000000000000/18531852339_981b067419_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (39, N'/media/fa763e0d0ceb408c8720365d57e06e32/00000006000000000000000000000000/18531854019_351c579559_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (40, N'/media/c0969cab13ab4de9819a848619ac2b5d/00000006000000000000000000000000/18095416144_44a566a5f4_h.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (41, N'/media/34371d0892c84015912ebaacd002c5d0/00000006000000000000000000000000/18530280048_459b8b61b2_h.jpg')
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-99, N'8f1ef1e1-9de4-40d3-a072-6673f631ca64', -1, 1, N'-1,-99', 39, 0, -1, N'Label (decimal)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-98, N'a97cec69-9b71-4c30-8b12-ec398860d7e8', -1, 1, N'-1,-98', 38, 0, -1, N'Label (time)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-97, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', -1, 1, N'-1,-97', 2, 0, -1, N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.577' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-96, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', -1, 1, N'-1,-96', 2, 0, -1, N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.577' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-95, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', -1, 1, N'-1,-95', 2, 0, -1, N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.573' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-94, N'0e9794eb-f9b5-4f20-a788-93acd233a7e4', -1, 1, N'-1,-94', 37, 0, -1, N'Label (datetime)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-93, N'930861bf-e262-4ead-a704-f99453565708', -1, 1, N'-1,-93', 36, 0, -1, N'Label (bigint)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-92, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', -1, 1, N'-1,-92', 35, 0, -1, N'Label (string)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.553' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-91, N'8e7f995c-bd81-4627-9932-c40e568ec788', -1, 1, N'-1,-91', 36, 0, -1, N'Label (integer)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.553' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-90, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', -1, 1, N'-1,-90', 34, 0, -1, N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.560' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-89, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', -1, 1, N'-1,-89', 33, 0, -1, N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.560' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-88, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', -1, 1, N'-1,-88', 32, 0, -1, N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.560' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-87, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', -1, 1, N'-1,-87', 4, 0, -1, N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.563' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-51, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', -1, 1, N'-1,-51', 2, 0, -1, N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.563' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-49, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', -1, 1, N'-1,-49', 2, 0, -1, N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.563' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-43, N'fbaf13a8-4036-41f2-93a3-974f678c312a', -1, 1, N'-1,-43', 2, 0, -1, N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.567' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-42, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', -1, 1, N'-1,-42', 2, 0, -1, N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.570' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-41, N'5046194e-4237-453c-a547-15db3a07c4e1', -1, 1, N'-1,-41', 2, 0, -1, N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.567' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-40, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', -1, 1, N'-1,-40', 2, 0, -1, N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.570' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-39, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', -1, 1, N'-1,-39', 2, 0, -1, N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.567' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-37, N'0225af17-b302-49cb-9176-b9f35cab9c17', -1, 1, N'-1,-37', 2, 0, -1, N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.573' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-36, N'e4d66c0f-b935-4200-81f0-025f7256b89a', -1, 1, N'-1,-36', 2, 0, -1, N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.573' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-21, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', -1, 0, N'-1,-21', 0, 0, -1, N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(N'2019-11-28T09:58:41.550' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-20, N'0f582a79-1e41-4cf0-bfa0-76340651891a', -1, 0, N'-1,-20', 0, 0, -1, N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(N'2019-11-28T09:58:41.547' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-1, N'916724a5-173d-4619-b97e-b9de133dd6f5', -1, 0, N'-1', 0, 0, -1, N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(N'2019-11-28T09:58:41.543' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1031, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', -1, 1, N'-1,1031', 2, 0, -1, N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2019-11-28T09:58:41.577' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1032, N'cc07b313-0843-4aa8-bbda-871c8da728c8', -1, 1, N'-1,1032', 2, 0, -1, N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2019-11-28T09:58:41.577' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1033, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', -1, 1, N'-1,1033', 2, 0, -1, N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2019-11-28T09:58:41.577' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1041, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', -1, 1, N'-1,1041', 2, 0, -1, N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.580' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1043, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', -1, 1, N'-1,1043', 2, 0, -1, N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.580' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1044, N'd59be02f-1df9-4228-aa1e-01917d806cda', -1, 1, N'-1,1044', 0, 0, -1, N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(N'2019-11-28T09:58:41.580' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1046, N'fd1e0da5-5606-4862-b679-5d0cf3a52a59', -1, 1, N'-1,1046', 2, 0, -1, N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.583' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1047, N'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548', -1, 1, N'-1,1047', 2, 0, -1, N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.583' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1048, N'135d60e0-64d9-49ed-ab08-893c9ba44ae5', -1, 1, N'-1,1048', 2, 0, -1, N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.583' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1049, N'9dbbcbbb-2327-434a-b355-af1b84e5010a', -1, 1, N'-1,1049', 2, 0, -1, N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.587' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1050, N'b4e3535a-1753-47e2-8568-602cf8cfee6f', -1, 1, N'-1,1050', 2, 0, -1, N'Multi URL Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:58:41.587' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1051, N'3ece86aa-61ad-45d5-b1dd-8f02f25df949', -1, 1, N'-1,1051', 29, 0, -1, N'Home - Call To Action Link - Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.627' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1052, N'71548df5-836c-41f8-96ac-5b98fe5e2e19', -1, 1, N'-1,1052', 30, 0, -1, N'Home - Color Theme - Radio button list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.730' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1053, N'34a7f8f5-a84e-439b-9322-466ff7ed8866', -1, 1, N'-1,1053', 31, 0, -1, N'Home - Content - Grid layout', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.750' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1054, N'fff3c360-3f90-45b3-a554-e29ca72cdce4', -1, 1, N'-1,1054', 32, 0, -1, N'Home - Font - Radio button list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.777' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1055, N'519eaa41-b905-4371-aa7c-40c9b3946f66', -1, 1, N'-1,1055', 33, 0, -1, N'Home - Logo - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.793' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1056, N'9d5ba2c5-ed7a-41f8-b454-9fc65f48752e', -1, 1, N'-1,1056', 34, 0, -1, N'Blog - How many posts should be shown - Slider', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.813' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1057, N'9d0726e6-5fa7-4455-8fe6-ed5bf9057cc4', -1, 1, N'-1,1057', 35, 0, -1, N'Blogpost - Categories - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.833' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1058, N'59accdfb-e0e7-4ff2-b8ab-4822b78d2c64', -1, 1, N'-1,1058', 36, 0, -1, N'Contact - Pick a Contact Form - Form Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.850' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1059, N'ecbbac0d-974e-490c-b533-fead926dc525', -1, 1, N'-1,1059', 37, 0, -1, N'Contact - Contact Intro - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.873' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1060, N'ea0ed4c1-c489-43b8-9058-a70babf430ff', -1, 1, N'-1,1060', 38, 0, -1, N'Content Base - Content - Grid layout', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.893' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1061, N'4885450e-a60f-42bb-984a-43988baf5283', -1, 1, N'-1,1061', 39, 0, -1, N'People - Featured People - Multinode Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.910' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1062, N'b58c1530-91c9-4c83-aa35-032aca0f7b89', -1, 1, N'-1,1062', 40, 0, -1, N'Person - Department - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.930' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1063, N'e26a8d91-a9d7-475b-bc3b-2a09f4743754', -1, 1, N'-1,1063', 41, 0, -1, N'Person - Photo - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.950' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1064, N'59ac0a33-9d34-4236-9886-99310d13d7f1', -1, 1, N'-1,1064', 42, 0, -1, N'Product - Category - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.963' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1065, N'30c35221-91b0-49a5-a599-42d1965161ea', -1, 1, N'-1,1065', 43, 0, -1, N'Navigation Base - Keywords - Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.980' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1066, N'84bbeb67-df7e-4043-8db8-55df52d01456', -1, 1, N'-1,1066', 44, 0, -1, N'Product - Features - Nested Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:37.997' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1067, N'3ada047c-6dfc-4a14-afc4-7efb79390f92', -1, 1, N'-1,1067', 45, 0, -1, N'Product - Photos - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:38.017' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1068, N'3f6619b6-08a4-4be7-8d6a-2761844ee567', -1, 1, N'-1,1068', 46, 0, -1, N'Product - Price - Decimal', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:38.040' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1069, N'28a6aeda-b3fc-4c4d-926e-607854a07891', -1, 1, N'-1,1069', 47, 0, -1, N'Products - Default Currency - Dropdown list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:38.057' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1070, N'd0382188-119b-49b7-86d3-84119a02645f', -1, 1, N'-1,1070', 48, 0, -1, N'Products - Featured Products - Multinode Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:38.070' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1071, N'fc1475d2-7c7b-4b2f-bc53-54c86fd43d6c', -1, 1, N'-1,1071', 49, 0, -1, N'Contact - Map Coordinates - Open street maps', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T09:59:38.083' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1072, N'da7dec14-13d7-4979-b048-65eebcbf0cb8', 1077, 1, N'-1,1077,1072', 0, 0, NULL, N'Blog', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:38.563' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1073, N'93655992-e20f-4593-be00-946a8f32a044', 1077, 1, N'-1,1077,1073', 0, 0, NULL, N'Blogpost', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:38.677' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1074, N'58f55298-1fd3-4d93-910b-5e8e12d0675e', 1077, 1, N'-1,1077,1074', 0, 0, NULL, N'Contact', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:38.710' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1075, N'69393a62-96f6-4a9a-afd5-5edb4dd6dda2', 1077, 1, N'-1,1077,1075', 0, 0, NULL, N'ContentPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:38.740' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1076, N'aed71a3d-0979-421a-868b-6f7c6b4493b6', 1077, 1, N'-1,1077,1076', 0, 0, NULL, N'Home', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:38.763' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1077, N'f6c3b009-3234-4f22-bbed-260f90e1b071', -1, 1, N'-1,1077', 0, 0, NULL, N'Master', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:38.793' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1078, N'af5eb940-59b4-43fe-a05c-d5757411fd03', 1077, 1, N'-1,1077,1078', 0, 0, NULL, N'People', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:38.883' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1079, N'af1dc304-a290-4379-8856-80ef7593fb64', 1077, 1, N'-1,1077,1079', 0, 0, NULL, N'Person', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:38.907' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1080, N'75ff9dd0-e07d-4333-b553-b734a24e8891', 1077, 1, N'-1,1077,1080', 0, 0, NULL, N'Product', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:38.933' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1081, N'ee7dc0f8-aee5-4920-a1da-aec9ed94bcd6', 1077, 1, N'-1,1077,1081', 0, 0, NULL, N'Products', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2019-11-28T09:59:39.017' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1082, N'bf1cc48a-a044-41ca-9291-59ad7d34da73', -1, 1, N'-1,1082', 0, 0, -1, N'Compositions', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2019-11-28T09:59:39.187' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1083, N'8e750d33-0b5f-4e55-969b-6cd93791e929', 1082, 2, N'-1,1082,1083', 0, 0, -1, N'Content Base', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:39.850' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1084, N'a1f43a06-93f7-4ae6-ab8a-2c26aca3290b', 1082, 2, N'-1,1082,1084', 1, 0, -1, N'Navigation Base', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:39.907' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1085, N'87821678-5355-4fda-921a-e4aca7912eb0', -1, 1, N'-1,1085', 0, 0, -1, N'Products', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:39.930' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1086, N'd53f5be5-6ac2-4793-9cb9-e54b6f359d26', -1, 1, N'-1,1086', 1, 0, -1, N'Product', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:39.960' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1087, N'df48f3c5-2701-4bc9-bbea-25fa4f3b85f7', -1, 1, N'-1,1087', 2, 0, -1, N'Person', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:40.003' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1088, N'3ee5ccc1-17b3-4c5e-8e40-2f2f66c1241e', -1, 1, N'-1,1088', 3, 0, -1, N'People', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:40.043' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1089, N'56788020-086d-4488-b16d-e9995230ce2f', -1, 1, N'-1,1089', 4, 0, -1, N'Home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:40.060' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1090, N'5d6ba460-5ad4-4a84-ab03-a6f2e4e74681', 1082, 2, N'-1,1082,1090', 2, 0, -1, N'Feature', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:40.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1091, N'1837f406-911e-40ad-80a1-7cb486db77aa', -1, 1, N'-1,1091', 5, 0, -1, N'Content Page', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:40.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1092, N'0622730b-d814-4ea5-b5a2-1d74732a9409', -1, 1, N'-1,1092', 6, 0, -1, N'Contact', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:40.170' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1093, N'50fc96d2-bba3-491e-aa89-02d9080fe269', -1, 1, N'-1,1093', 7, 0, -1, N'Blogpost', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:40.210' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1094, N'760a3084-660a-4085-8a11-379ece99d8f3', -1, 1, N'-1,1094', 8, 0, -1, N'Blog', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T09:59:40.257' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1095, N'ca4249ed-2b23-4337-b522-63cabe5587d1', -1, 1, N'-1,1095', 0, 0, -1, N'Home', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.087' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1096, N'ec4aafcc-0c25-4f25-a8fe-705bfae1d324', 1095, 2, N'-1,1095,1096', 0, 0, -1, N'Products', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.343' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1097, N'df1eb830-411b-4d41-a343-3917b76d533c', 1096, 3, N'-1,1095,1096,1097', 0, 0, -1, N'Tattoo', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.370' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1098, N'4e96411a-b8e1-435f-9322-2faee30ef5f2', 1096, 3, N'-1,1095,1096,1098', 1, 0, -1, N'Unicorn', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.457' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1099, N'd390a562-107d-4f02-8df7-57aa86bad752', 1096, 3, N'-1,1095,1096,1099', 2, 0, -1, N'Ping Pong Ball', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.480' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1100, N'bb7d5ae0-07ac-40b8-b5b9-18c36947fb56', 1096, 3, N'-1,1095,1096,1100', 3, 0, -1, N'Bowling Ball', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.510' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1101, N'202cdc2f-1a45-40f4-a653-a7b321e1c54c', 1096, 3, N'-1,1095,1096,1101', 4, 0, -1, N'Jumpsuit', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.533' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1102, N'103171c8-e11c-4002-9bb2-f3404cada22a', 1096, 3, N'-1,1095,1096,1102', 5, 0, -1, N'Banjo', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.563' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1103, N'061662b9-b02a-4dcf-af59-92b603e8e3e1', 1096, 3, N'-1,1095,1096,1103', 6, 0, -1, N'Knitted West', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.583' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1104, N'262beb70-53a6-49b8-9e98-cfde2e85a78e', 1096, 3, N'-1,1095,1096,1104', 7, 0, -1, N'Biker Jacket', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.613' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1105, N'e8ad9b65-cff6-4952-ac5b-efe56a60db62', 1095, 2, N'-1,1095,1105', 1, 0, -1, N'People', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.640' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1106, N'616d0f54-b8b0-450e-be0d-2ca4c06672a2', 1105, 3, N'-1,1095,1105,1106', 0, 0, -1, N'Jan Skovgaard', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.660' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1107, N'eab72f13-b22e-46d5-b270-9c196e49a53b', 1105, 3, N'-1,1095,1105,1107', 1, 0, -1, N'Matt Brailsford', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.680' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1108, N'9946f249-0d6e-496c-91b6-64eaf1a3dffd', 1105, 3, N'-1,1095,1105,1108', 2, 0, -1, N'Lee Kelleher', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.703' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1109, N'4f0b7052-d854-43b5-bb7c-6c82af4d96d1', 1105, 3, N'-1,1095,1105,1109', 3, 0, -1, N'Jeavon Leopold', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.727' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1110, N'1301ecb2-beaf-44f3-a12e-48bdbcde6023', 1105, 3, N'-1,1095,1105,1110', 4, 0, -1, N'Jeroen Breuer', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.747' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1111, N'3cce2545-e3ac-44ec-bf55-a52cc5965db3', 1095, 2, N'-1,1095,1111', 2, 0, -1, N'About Us', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.770' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1112, N'ee82cba3-a0e7-4063-9ae1-3026a4f72a3d', 1111, 3, N'-1,1095,1111,1112', 0, 0, -1, N'About this Starter Kit', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.797' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1113, N'9c1c3a2c-72b0-45e2-a3c3-3c068164a018', 1111, 3, N'-1,1095,1111,1113', 1, 0, -1, N'Todo list for the Starter Kit', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.817' AS DateTime))
GO
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1114, N'1d770f10-d1ca-4a26-9d68-071e2c9f7ac1', 1095, 2, N'-1,1095,1114', 3, 0, -1, N'Blog', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.840' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1115, N'782c631b-11e9-4e90-8fc1-6aeff37b488a', 1114, 3, N'-1,1095,1114,1115', 0, 0, -1, N'My Blog Post', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.860' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1116, N'72346384-fc5e-4a6e-a07d-559eec11dcea', 1114, 3, N'-1,1095,1114,1116', 1, 0, -1, N'Another one', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.883' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1117, N'bc41a208-5c36-4978-a3e2-7cfcfd581980', 1114, 3, N'-1,1095,1114,1117', 2, 0, -1, N'This will be great', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.913' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1118, N'4a1f4198-e143-48ba-a0f5-1a7ef2df23aa', 1095, 2, N'-1,1095,1118', 4, 0, -1, N'Contact', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T09:59:41.940' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1119, N'b6f11172-373f-4473-af0f-0b0e5aefd21c', -1, 1, N'-1,1119', 1, 0, -1, N'Design', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.047' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1120, N'1fd2ecaf-f371-4c00-9306-867fa4585e7a', -1, 1, N'-1,1120', 1, 0, -1, N'People', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.110' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1121, N'6d5bf746-cb82-45c5-bd15-dd3798209b87', -1, 1, N'-1,1121', 1, 0, -1, N'Products', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1122, N'662af6ca-411a-4c93-a6c7-22c4845698e7', 1119, 2, N'-1,1119,1122', 0, 0, -1, N'Umbraco Campari Meeting Room', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.210' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1123, N'55514845-b8bd-487c-b370-9724852fd6bb', 1121, 2, N'-1,1121,1123', 0, 0, -1, N'Biker Jacket', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.250' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1124, N'20e3a8ff-ad1b-4fe9-b48c-b8461c46d2d0', 1121, 2, N'-1,1121,1124', 0, 0, -1, N'Tattoo', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.280' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1125, N'1bc5280b-8658-4027-89d9-58e2576e469b', 1121, 2, N'-1,1121,1125', 0, 0, -1, N'Unicorn', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.313' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1126, N'c09ec77f-08e3-466a-ac58-c979befd3cd6', 1121, 2, N'-1,1121,1126', 0, 0, -1, N'Ping Pong Ball', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.343' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1127, N'b76ddb4e-e603-4014-9906-6087984740ec', 1121, 2, N'-1,1121,1127', 0, 0, -1, N'Bowling Ball', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1128, N'46a025d6-095a-4b14-8b96-1b59ca4e951c', 1121, 2, N'-1,1121,1128', 0, 0, -1, N'Jumpsuit', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.493' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1129, N'17552d12-081d-4d01-b681-32c495d6576f', 1121, 2, N'-1,1121,1129', 0, 0, -1, N'Banjo', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.533' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1130, N'1d0b713a-022a-49c8-b842-a2463c83a553', 1121, 2, N'-1,1121,1130', 0, 0, -1, N'Knitted West', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.567' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1131, N'cf1ab8dc-ad0f-4a8e-974b-87b84777b0d6', 1120, 2, N'-1,1120,1131', 0, 0, -1, N'Jan Skovgaard', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.597' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1132, N'eee91c05-b2e8-4031-a056-dcd7f28eff89', 1120, 2, N'-1,1120,1132', 0, 0, -1, N'Matt Brailsford', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.627' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1133, N'fa763e0d-0ceb-408c-8720-365d57e06e32', 1120, 2, N'-1,1120,1133', 0, 0, -1, N'Lee Kelleher', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.660' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1134, N'c0969cab-13ab-4de9-819a-848619ac2b5d', 1120, 2, N'-1,1120,1134', 0, 0, -1, N'Jeavon Leopold', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.690' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1135, N'34371d08-92c8-4015-912e-baacd002c5d0', 1120, 2, N'-1,1120,1135', 0, 0, -1, N'Jeroen Breuer', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2019-11-28T09:59:44.723' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1136, N'64fde3c9-46e7-44ec-a5bf-82a6e4391b4a', -1, 1, N'-1,1136', 9, 0, -1, N'Push Notification', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T13:20:19.810' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1137, N'33e264d0-4184-4420-88f7-48a1419e7810', -1, 1, N'-1,1137', 10, 0, -1, N'Notification Post', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2019-11-28T13:21:51.703' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1138, N'd1318b83-1d76-454a-82d6-36675fc7b1c7', -1, 1, N'-1,1138', 50, 0, -1, N'List View - pushNotification', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-28T13:22:54.213' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1139, N'2cae039b-a30f-4049-9de1-c0c8c7a769da', 1095, 2, N'-1,1095,1139', 5, 0, -1, N'Notifications', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T13:24:25.293' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1140, N'292f697c-1671-4705-a711-9482abe0847d', 1139, 3, N'-1,1095,1139,1140', 0, 0, -1, N'24Days.in Notification', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2019-11-28T13:26:02.240' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1141, N'61b21c6c-1767-4dc2-bf3a-196f70767a65', -1, 1, N'-1,1141', 51, 0, -1, N'User picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2019-11-29T13:57:17.080' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1149, N'97a23b39-efc0-4760-ada3-e68e5e8837dd', -1, 1, N'-1,1149', 1, 0, -1, N'Pasang Tamang', N'39eb0f98-b348-42a1-8662-e7eb18487560', CAST(N'2019-11-29T14:56:00.440' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] ON 

INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (147, 28, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/662af6ca411a4c93a6c722c4845698e7/00000006000000000000000000000000/16403439029_f500be349b_o.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (148, 29, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/55514845b8bd487cb3709724852fd6bb/00000006000000000000000000000000/4730684907_8a7f8759cb_b.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (149, 30, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/20e3a8ffad1b4fe9b48cb8461c46d2d0/00000006000000000000000000000000/7371127652_e01b6ab56f_b.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (150, 31, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/1bc5280b8658402789d958e2576e469b/00000006000000000000000000000000/14272036539_469ca21d5c_h.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (151, 32, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/c09ec77f08e3466aac58c979befd3cd6/00000006000000000000000000000000/5852022211_9028df67c0_b.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (152, 33, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/b76ddb4ee603401499066087984740ec/00000006000000000000000000000000/5852022091_87c5d045ab_b.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (153, 34, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/46a025d6095a4b148b961b59ca4e951c/00000006000000000000000000000000/7377957524_347859faac_b.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (154, 35, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/17552d12081d4d01b68132c495d6576f/00000006000000000000000000000000/7373036290_5e8420bf36_b.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (155, 36, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/1d0b713a022a49c8b842a2463c83a553/00000006000000000000000000000000/7373036208_30257976a0_b.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (156, 37, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/cf1ab8dcad0f4a8e974b87b84777b0d6/00000006000000000000000000000000/18720470241_ff77768544_h.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (157, 38, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/eee91c05b2e84031a056dcd7f28eff89/00000006000000000000000000000000/18531852339_981b067419_h.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (158, 39, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/fa763e0d0ceb408c8720365d57e06e32/00000006000000000000000000000000/18531854019_351c579559_h.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (159, 40, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/c0969cab13ab4de9819a848619ac2b5d/00000006000000000000000000000000/18095416144_44a566a5f4_h.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (160, 41, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/34371d0892c84015912ebaacd002c5d0/00000006000000000000000000000000/18530280048_459b8b61b2_h.jpg","focalPoint":null,"crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (161, 1, 60, NULL, NULL, NULL, NULL, NULL, N'Umbraco Demo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (162, 42, 60, NULL, NULL, NULL, NULL, NULL, N'Umbraco Demo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (163, 1, 61, NULL, NULL, NULL, NULL, NULL, NULL, N'Moonfish, steelhead, lamprey southern flounder tadpole fish sculpin bigeye, blue-redstripe danio collared dogfish. Smalleye squaretail goldfish arowana butterflyfish pipefish wolf-herring jewel tetra, shiner; gibberfish red velvetfish. Thornyhead yellowfin pike threadsail ayu cutlassfish.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (164, 42, 61, NULL, NULL, NULL, NULL, NULL, NULL, N'Moonfish, steelhead, lamprey southern flounder tadpole fish sculpin bigeye, blue-redstripe danio collared dogfish. Smalleye squaretail goldfish arowana butterflyfish pipefish wolf-herring jewel tetra, shiner; gibberfish red velvetfish. Thornyhead yellowfin pike threadsail ayu cutlassfish.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (165, 1, 62, NULL, NULL, NULL, NULL, NULL, N'Check our products', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (166, 42, 62, NULL, NULL, NULL, NULL, NULL, N'Check our products', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (167, 1, 63, NULL, NULL, NULL, NULL, NULL, N'umb://document/ec4aafcc0c254f25a8fe705bfae1d324', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (168, 42, 63, NULL, NULL, NULL, NULL, NULL, N'umb://document/ec4aafcc0c254f25a8fe705bfae1d324', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (169, 1, 64, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media",
                "macro",
                "embed",
                "headline"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": {
                    "macroAlias": "latestBlogposts",
                    "macroParamsDictionary": {
                      "numberOfPosts": "3",
                      "startNodeId": "umb://document/1d770f10d1ca4a269d68071e2c9f7ac1"
                    }
                  },
                  "editor": {
                    "name": "Macro",
                    "alias": "macro",
                    "view": "macro",
                    "render": null,
                    "icon": "icon-settings-alt",
                    "config": {}
                  },
                  "active": false
                }
              ]
            }
          ],
          "hasConfig": false,
          "id": "314cb47b-fbe1-eeb6-f7cc-38db875d0f06"
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (170, 42, 64, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media",
                "macro",
                "embed",
                "headline"
              ],
              "hasConfig": false,
              "controls": [
                {
                  "value": {
                    "macroAlias": "latestBlogposts",
                    "macroParamsDictionary": {
                      "numberOfPosts": "3",
                      "startNodeId": "umb://document/1d770f10d1ca4a269d68071e2c9f7ac1"
                    }
                  },
                  "editor": {
                    "name": "Macro",
                    "alias": "macro",
                    "view": "macro",
                    "render": null,
                    "icon": "icon-settings-alt",
                    "config": {}
                  },
                  "active": false
                }
              ]
            }
          ],
          "hasConfig": false,
          "id": "314cb47b-fbe1-eeb6-f7cc-38db875d0f06"
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (171, 1, 65, NULL, NULL, NULL, NULL, NULL, N'Umbraco Demo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (172, 42, 65, NULL, NULL, NULL, NULL, NULL, N'Umbraco Demo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (173, 1, 66, NULL, NULL, NULL, NULL, NULL, NULL, N'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus suscipit tortor eget felis porttitor volutpat')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (174, 42, 66, NULL, NULL, NULL, NULL, NULL, NULL, N'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus suscipit tortor eget felis porttitor volutpat')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (175, 1, 67, NULL, NULL, NULL, NULL, NULL, N'Read All on the Blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (176, 42, 67, NULL, NULL, NULL, NULL, NULL, N'Read All on the Blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (177, 1, 68, NULL, NULL, NULL, NULL, NULL, N'umb://document/1d770f10d1ca4a269d68071e2c9f7ac1', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (178, 42, 68, NULL, NULL, NULL, NULL, NULL, N'umb://document/1d770f10d1ca4a269d68071e2c9f7ac1', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (179, 1, 69, NULL, NULL, NULL, NULL, NULL, N'Umbraco HQ - Unicorn Square - Haubergsvej 1 - 5000 Odense C - Denmark - +45 70 26 11 62', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (180, 42, 69, NULL, NULL, NULL, NULL, NULL, N'Umbraco HQ - Unicorn Square - Haubergsvej 1 - 5000 Odense C - Denmark - +45 70 26 11 62', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (181, 1, 70, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/662af6ca411a4c93a6c722c4845698e7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (182, 42, 70, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/662af6ca411a4c93a6c722c4845698e7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (183, 1, 71, NULL, NULL, NULL, NULL, NULL, N'serif', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (184, 42, 71, NULL, NULL, NULL, NULL, NULL, N'serif', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (185, 1, 72, NULL, NULL, NULL, NULL, NULL, N'earth', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (186, 42, 72, NULL, NULL, NULL, NULL, NULL, N'earth', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (187, 1, 73, NULL, NULL, NULL, NULL, NULL, N'Umbraco Sample Site', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (188, 42, 73, NULL, NULL, NULL, NULL, NULL, N'Umbraco Sample Site', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (189, 2, 37, NULL, NULL, NULL, NULL, NULL, N'Our Gorgeous Selection', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (190, 43, 37, NULL, NULL, NULL, NULL, NULL, N'Our Gorgeous Selection', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (191, 2, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (192, 43, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (193, 2, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (194, 43, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (195, 2, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (196, 43, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (197, 2, 42, NULL, NULL, NULL, NULL, NULL, N'["€"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (198, 43, 42, NULL, NULL, NULL, NULL, NULL, N'["€"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (199, 2, 43, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/262beb7053a649b89e98cfde2e85a78e,umb://document/df1eb830411b4d41a3433917b76d533c,umb://document/4e96411ab8e1435f93222faee30ef5f2,umb://document/d390a562107d4f028df757aa86bad752,umb://document/bb7d5ae007ac40b8b5b918c36947fb56,umb://document/202cdc2f1a4540f4a653a7b321e1c54c,umb://document/103171c8e11c40029bb2f3404cada22a,umb://document/061662b9b02a4dcfaf5992b603e8e3e1')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (200, 43, 43, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/262beb7053a649b89e98cfde2e85a78e,umb://document/df1eb830411b4d41a3433917b76d533c,umb://document/4e96411ab8e1435f93222faee30ef5f2,umb://document/d390a562107d4f028df757aa86bad752,umb://document/bb7d5ae007ac40b8b5b918c36947fb56,umb://document/202cdc2f1a4540f4a653a7b321e1c54c,umb://document/103171c8e11c40029bb2f3404cada22a,umb://document/061662b9b02a4dcfaf5992b603e8e3e1')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (201, 3, 44, NULL, NULL, NULL, NULL, NULL, N'Tattoo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (202, 44, 44, NULL, NULL, NULL, NULL, NULL, N'Tattoo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (203, 3, 45, NULL, NULL, NULL, CAST(499.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (204, 44, 45, NULL, NULL, NULL, CAST(499.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (205, 3, 46, NULL, NULL, NULL, NULL, NULL, N'tattoo,dedication', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (206, 44, 46, NULL, NULL, NULL, NULL, NULL, N'tattoo,dedication', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (207, 3, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (208, 44, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (209, 3, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-TATTOO', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (210, 44, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-TATTOO', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (211, 3, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/20e3a8ffad1b4fe9b48cb8461c46d2d0')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (212, 44, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/20e3a8ffad1b4fe9b48cb8461c46d2d0')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (213, 3, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (214, 44, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (215, 4, 44, NULL, NULL, NULL, NULL, NULL, N'Unicorn', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (216, 45, 44, NULL, NULL, NULL, NULL, NULL, N'Unicorn', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (217, 4, 45, NULL, NULL, NULL, CAST(249.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (218, 45, 45, NULL, NULL, NULL, CAST(249.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (219, 4, 46, NULL, NULL, NULL, NULL, NULL, N'animals', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (220, 45, 46, NULL, NULL, NULL, NULL, NULL, N'animals', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (221, 4, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (222, 45, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (223, 4, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-UNICORN', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (224, 45, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-UNICORN', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (225, 4, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1bc5280b8658402789d958e2576e469b')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (226, 45, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1bc5280b8658402789d958e2576e469b')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (227, 4, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (228, 45, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (229, 5, 44, NULL, NULL, NULL, NULL, NULL, N'Ping Pong Ball', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (230, 46, 44, NULL, NULL, NULL, NULL, NULL, N'Ping Pong Ball', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (231, 5, 45, NULL, NULL, NULL, CAST(2.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (232, 46, 45, NULL, NULL, NULL, CAST(2.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (233, 5, 46, NULL, NULL, NULL, NULL, NULL, N'sports,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (234, 46, 46, NULL, NULL, NULL, NULL, NULL, N'sports,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (235, 5, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (236, 46, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (237, 5, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-PINGPONG', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (238, 46, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-PINGPONG', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (239, 5, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/c09ec77f08e3466aac58c979befd3cd6')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (240, 46, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/c09ec77f08e3466aac58c979befd3cd6')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (241, 5, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (242, 46, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (243, 6, 44, NULL, NULL, NULL, NULL, NULL, N'Bowling Ball', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (244, 47, 44, NULL, NULL, NULL, NULL, NULL, N'Bowling Ball', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (245, 6, 45, NULL, NULL, NULL, CAST(899.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (246, 47, 45, NULL, NULL, NULL, CAST(899.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (247, 6, 46, NULL, NULL, NULL, NULL, NULL, N'sports,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (248, 47, 46, NULL, NULL, NULL, NULL, NULL, N'sports,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (249, 6, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (250, 47, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (251, 6, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BOWLING', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (252, 47, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BOWLING', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (253, 6, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/b76ddb4ee603401499066087984740ec')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (254, 47, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/b76ddb4ee603401499066087984740ec')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (255, 6, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (256, 47, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (257, 7, 44, NULL, NULL, NULL, NULL, NULL, N'Jumpsuit', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (258, 48, 44, NULL, NULL, NULL, NULL, NULL, N'Jumpsuit', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (259, 7, 45, NULL, NULL, NULL, CAST(89.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (260, 48, 45, NULL, NULL, NULL, CAST(89.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (261, 7, 46, NULL, NULL, NULL, NULL, NULL, N'fashion,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (262, 48, 46, NULL, NULL, NULL, NULL, NULL, N'fashion,bingo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (263, 7, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (264, 48, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Cras ultricies ligula sed magna dictum porta.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (265, 7, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-JUMPSUIT', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (266, 48, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-JUMPSUIT', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (267, 7, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/46a025d6095a4b148b961b59ca4e951c')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (268, 48, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/46a025d6095a4b148b961b59ca4e951c')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (269, 7, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (270, 48, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (271, 8, 44, NULL, NULL, NULL, NULL, NULL, N'Banjo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (272, 49, 44, NULL, NULL, NULL, NULL, NULL, N'Banjo', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (273, 8, 45, NULL, NULL, NULL, CAST(399.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (274, 49, 45, NULL, NULL, NULL, CAST(399.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (275, 8, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,music', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (276, 49, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,music', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (277, 8, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (278, 49, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (279, 8, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BANJO', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (280, 49, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BANJO', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (281, 8, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/17552d12081d4d01b68132c495d6576f')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (282, 49, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/17552d12081d4d01b68132c495d6576f')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (283, 8, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (284, 49, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (285, 9, 44, NULL, NULL, NULL, NULL, NULL, N'Knitted Unicorn West', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (286, 50, 44, NULL, NULL, NULL, NULL, NULL, N'Knitted Unicorn West', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (287, 9, 45, NULL, NULL, NULL, CAST(1899.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (288, 50, 45, NULL, NULL, NULL, CAST(1899.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (289, 9, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,fashion', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (290, 50, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,fashion', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (291, 9, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Knitted Unicorn West')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (292, 50, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Knitted Unicorn West')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (293, 9, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-WEST', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (294, 50, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-WEST', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (295, 9, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1d0b713a022a49c8b842a2463c83a553')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (296, 50, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/1d0b713a022a49c8b842a2463c83a553')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (297, 9, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (298, 50, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (299, 10, 44, NULL, NULL, NULL, NULL, NULL, N'Biker Jacket', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (300, 51, 44, NULL, NULL, NULL, NULL, NULL, N'Biker Jacket', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (301, 10, 45, NULL, NULL, NULL, CAST(199.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (302, 51, 45, NULL, NULL, NULL, CAST(199.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (303, 10, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,clothing', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (304, 51, 46, NULL, NULL, NULL, NULL, NULL, N'bingo,clothing', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (305, 10, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (306, 51, 47, NULL, NULL, NULL, NULL, NULL, NULL, N'Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (307, 10, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BIKER-JACKET', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (308, 51, 48, NULL, NULL, NULL, NULL, NULL, N'UMB-BIKER-JACKET', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (309, 10, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/55514845b8bd487cb3709724852fd6bb')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (310, 51, 49, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/55514845b8bd487cb3709724852fd6bb')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (311, 10, 50, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"6a47c043-7699-49c6-a0ed-b335b135ea2b","name":"Free shipping","ncContentTypeAlias":"feature","featureName":"Free shipping","featureDetails":"Isn''t that awesome - you only pay for the product"},{"key":"075c935f-4987-4a46-bed9-3286c27f0121","name":"1 Day return policy","ncContentTypeAlias":"feature","featureName":"1 Day return policy","featureDetails":"You''ll need to make up your mind fast"},{"key":"457e0ee3-c066-46fa-b379-a083b38aaa20","name":"100 Years warranty","ncContentTypeAlias":"feature","featureName":"100 Years warranty","featureDetails":"But if you''re satisfied it''ll last a lifetime"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (312, 51, 50, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"6a47c043-7699-49c6-a0ed-b335b135ea2b","name":"Free shipping","ncContentTypeAlias":"feature","featureName":"Free shipping","featureDetails":"Isn''t that awesome - you only pay for the product"},{"key":"075c935f-4987-4a46-bed9-3286c27f0121","name":"1 Day return policy","ncContentTypeAlias":"feature","featureName":"1 Day return policy","featureDetails":"You''ll need to make up your mind fast"},{"key":"457e0ee3-c066-46fa-b379-a083b38aaa20","name":"100 Years warranty","ncContentTypeAlias":"feature","featureName":"100 Years warranty","featureDetails":"But if you''re satisfied it''ll last a lifetime"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (313, 10, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (314, 51, 51, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (315, 11, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (316, 52, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (317, 11, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (318, 52, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (319, 11, 37, NULL, NULL, NULL, NULL, NULL, N'Nice crazy people', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (320, 52, 37, NULL, NULL, NULL, NULL, NULL, N'Nice crazy people', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (321, 11, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (322, 52, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (323, 12, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (324, 53, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (325, 12, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (326, 53, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (327, 12, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/cf1ab8dcad0f4a8e974b87b84777b0d6')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (328, 53, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/cf1ab8dcad0f4a8e974b87b84777b0d6')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (329, 12, 53, NULL, NULL, NULL, NULL, NULL, N'mvp,Denmark', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (330, 53, 53, NULL, NULL, NULL, NULL, NULL, N'mvp,Denmark', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (331, 13, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (332, 54, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (333, 13, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (334, 54, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (335, 13, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/eee91c05b2e84031a056dcd7f28eff89')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (336, 54, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/eee91c05b2e84031a056dcd7f28eff89')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (337, 13, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (338, 54, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (339, 13, 55, NULL, NULL, NULL, NULL, NULL, N'mattbrailsford', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (340, 54, 55, NULL, NULL, NULL, NULL, NULL, N'mattbrailsford', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (341, 13, 58, NULL, NULL, NULL, NULL, NULL, N'circuitbeard', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (342, 54, 58, NULL, NULL, NULL, NULL, NULL, N'circuitbeard', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (343, 14, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (344, 55, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (345, 14, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (346, 55, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (347, 14, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/fa763e0d0ceb408c8720365d57e06e32')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (348, 55, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/fa763e0d0ceb408c8720365d57e06e32')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (349, 14, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (350, 55, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (351, 15, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (352, 56, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (353, 15, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (354, 56, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (355, 15, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/c0969cab13ab4de9819a848619ac2b5d')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (356, 56, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/c0969cab13ab4de9819a848619ac2b5d')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (357, 15, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (358, 56, 53, NULL, NULL, NULL, NULL, NULL, N'United Kingdom,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (359, 16, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (360, 57, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (361, 16, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (362, 57, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (363, 16, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/34371d0892c84015912ebaacd002c5d0')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (364, 57, 52, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/34371d0892c84015912ebaacd002c5d0')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (365, 16, 53, NULL, NULL, NULL, NULL, NULL, N'Netherlands,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (366, 57, 53, NULL, NULL, NULL, NULL, NULL, N'Netherlands,mvp', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (367, 17, 37, NULL, NULL, NULL, NULL, NULL, N'About Us', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (368, 58, 37, NULL, NULL, NULL, NULL, NULL, N'About Us', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (369, 17, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "name": "FullWidth",
          "areas": [
            {
              "grid": 12,
              "allowAll": true,
              "hasConfig": false,
              "controls": [
                {
                  "value": "Oooh la la",
                  "editor": {
                    "name": "Headline",
                    "alias": "headline",
                    "view": "textstring",
                    "render": null,
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold",
                      "markup": "<h1>#value#</h1>"
                    }
                  },
                  "active": false
                }
              ],
              "active": false
            }
          ],
          "hasConfig": false,
          "id": "f10995f1-918d-3e50-e50d-8c41bbe297ce",
          "active": true
        },
        {
          "label": "Article",
          "name": "Article",
          "areas": [
            {
              "grid": 4,
              "hasConfig": false,
              "controls": [
                {
                  "value": {
                    "udi": "umb://media/c0969cab13ab4de9819a848619ac2b5d",
                    "image": "/media/c0969cab13ab4de9819a848619ac2b5d/00000006000000000000000000000000/18095416144_44a566a5f4_h.jpg"
                  },
                  "editor": {
                    "name": "Image",
                    "alias": "media",
                    "view": "media",
                    "render": null,
                    "icon": "icon-picture",
                    "config": {}
                  },
                  "active": false,
                }
              ]
            },
            {
              "grid": 8,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  },
                  "active": false,
                },
                {
                  "value": "<iframe width=\"360\" height=\"203\" src=\"https://www.youtube.com/embed/HPgKSCp_Y_U?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": null,
                    "icon": "icon-movie-alt",
                    "config": {}
                  },
                  "active": false
                }
              ]
            }
          ],
          "hasConfig": false,
          "id": "4d6e2221-e2d9-95bc-8ceb-624bc8df8e3f"
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (370, 58, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "name": "FullWidth",
          "areas": [
            {
              "grid": 12,
              "allowAll": true,
              "hasConfig": false,
              "controls": [
                {
                  "value": "Oooh la la",
                  "editor": {
                    "name": "Headline",
                    "alias": "headline",
                    "view": "textstring",
                    "render": null,
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold",
                      "markup": "<h1>#value#</h1>"
                    }
                  },
                  "active": false
                }
              ],
              "active": false
            }
          ],
          "hasConfig": false,
          "id": "f10995f1-918d-3e50-e50d-8c41bbe297ce",
          "active": true
        },
        {
          "label": "Article",
          "name": "Article",
          "areas": [
            {
              "grid": 4,
              "hasConfig": false,
              "controls": [
                {
                  "value": {
                    "udi": "umb://media/c0969cab13ab4de9819a848619ac2b5d",
                    "image": "/media/c0969cab13ab4de9819a848619ac2b5d/00000006000000000000000000000000/18095416144_44a566a5f4_h.jpg"
                  },
                  "editor": {
                    "name": "Image",
                    "alias": "media",
                    "view": "media",
                    "render": null,
                    "icon": "icon-picture",
                    "config": {}
                  },
                  "active": false,
                }
              ]
            },
            {
              "grid": 8,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus. Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus. Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "render": null,
                    "icon": "icon-article",
                    "config": {}
                  },
                  "active": false,
                },
                {
                  "value": "<iframe width=\"360\" height=\"203\" src=\"https://www.youtube.com/embed/HPgKSCp_Y_U?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": null,
                    "icon": "icon-movie-alt",
                    "config": {}
                  },
                  "active": false
                }
              ]
            }
          ],
          "hasConfig": false,
          "id": "4d6e2221-e2d9-95bc-8ceb-624bc8df8e3f"
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (371, 17, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (372, 58, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (373, 17, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (374, 58, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (375, 18, 37, NULL, NULL, NULL, NULL, NULL, N'About this Starter Kit', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (376, 59, 37, NULL, NULL, NULL, NULL, NULL, N'About this Starter Kit', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (377, 18, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,      
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (378, 59, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,      
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (379, 18, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (380, 59, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (381, 18, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (382, 59, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (383, 19, 37, NULL, NULL, NULL, NULL, NULL, N'Things to improve', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (384, 60, 37, NULL, NULL, NULL, NULL, NULL, N'Things to improve', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (385, 19, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Here''s what could be improved in the Starter Kit so far:</p>\n<p> </p>\n<p>For v1:</p>\n<ul>\n<li>Use a custom grid editor for testimonials</li>\n<li>Integrated Analytics on pages</li>\n<li>Call To Action Button in the grid (with \"Tag Manager\" integration)</li>\n<li>Macro for fetching products (with friendly grid preview)</li>\n<li>Design Review (polish)</li>\n<li>Verify licenses of photos (Niels)</li>\n</ul>\n<p>For vNext</p>\n<ul>\n<li><span style=\"text-decoration: line-through;\">Swap text with uploaded logo</span></li>\n<li>Nicer pickers of products and employees</li>\n<li>Custom Listview for products and employees</li>\n<li>Discus template on blog posts</li>\n<li>404 template</li>\n<li>Member Login/Register/Profile/Forgot password</li>\n<li>Update default styling of grid header</li>\n<li>On a Blog post -&gt; Share/Social (tweet this / facebook this)</li>\n</ul>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true,
              "hasActiveChild": true
            }
          ],
          "hasConfig": false,
          "id": "5ea1e364-8406-e5e6-a82c-45985fd6054e",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (386, 60, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Here''s what could be improved in the Starter Kit so far:</p>\n<p> </p>\n<p>For v1:</p>\n<ul>\n<li>Use a custom grid editor for testimonials</li>\n<li>Integrated Analytics on pages</li>\n<li>Call To Action Button in the grid (with \"Tag Manager\" integration)</li>\n<li>Macro for fetching products (with friendly grid preview)</li>\n<li>Design Review (polish)</li>\n<li>Verify licenses of photos (Niels)</li>\n</ul>\n<p>For vNext</p>\n<ul>\n<li><span style=\"text-decoration: line-through;\">Swap text with uploaded logo</span></li>\n<li>Nicer pickers of products and employees</li>\n<li>Custom Listview for products and employees</li>\n<li>Discus template on blog posts</li>\n<li>404 template</li>\n<li>Member Login/Register/Profile/Forgot password</li>\n<li>Update default styling of grid header</li>\n<li>On a Blog post -&gt; Share/Social (tweet this / facebook this)</li>\n</ul>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true,
              "hasActiveChild": true
            }
          ],
          "hasConfig": false,
          "id": "5ea1e364-8406-e5e6-a82c-45985fd6054e",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (387, 19, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (388, 60, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (389, 19, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (390, 60, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (391, 20, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (392, 61, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (393, 20, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (394, 61, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (395, 20, 37, NULL, NULL, NULL, NULL, NULL, N'Behind The Scenes', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (396, 61, 37, NULL, NULL, NULL, NULL, NULL, N'Behind The Scenes', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (397, 20, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (398, 61, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": []
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (399, 20, 87, NULL, NULL, NULL, NULL, NULL, N'2', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (400, 61, 87, NULL, NULL, NULL, NULL, NULL, N'2', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (401, 21, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (403, 21, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (405, 21, 83, NULL, NULL, NULL, NULL, NULL, N'My Blog Post', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (407, 21, 84, NULL, NULL, NULL, NULL, NULL, N'["demo","umbraco","starter kit"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (409, 21, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (411, 21, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>\n<p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec sollicitudin molestie malesuada.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true
            }
          ],
          "hasConfig": false,
          "id": "1f96a69f-0cb9-4a00-6a76-f8cec30befec",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (413, 22, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (415, 22, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (417, 22, 83, NULL, NULL, NULL, NULL, NULL, N'Now it gets exciting', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (419, 22, 84, NULL, NULL, NULL, NULL, NULL, N'["cg16","codegarden","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (421, 22, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (423, 22, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "Article",
          "name": "Article",
          "areas": [
            {
              "grid": 4,
              "hasConfig": false,
              "controls": [
                {
                  "value": {
                    "udi": "umb://media/55514845b8bd487cb3709724852fd6bb",
                    "image": "/media/55514845b8bd487cb3709724852fd6bb/00000006000000000000000000000000/4730684907_8a7f8759cb_b.jpg"
                  },
                  "editor": {
                    "alias": "media"
                  },
                  "active": false,
                }
              ],
              "active": false
            },
            {
              "grid": 8,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Donec sollicitudin molestie malesuada. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada.</p>\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Sed porttitor lectus nibh.</p>\n<p>Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true
            }
          ],
          "hasConfig": false,
          "id": "011e74f2-b4de-0e4e-1cb9-23b2356b1213",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (425, 23, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (427, 23, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (429, 23, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (431, 23, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (433, 23, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (435, 23, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "allowAll": true,
      "rows": [
        {
          "label": "",
          "name": "Full Width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "hasConfig": false,
              "controls": [
                {
                  "value": "<p>Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": false,
                },
                {
                  "value": "",
                  "editor": {
                    "alias": "embed"
                  },
                  "active": false,
                },
                {
                  "value": "<p> </p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus.</p>\n<p>Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Vivamus suscipit tortor eget felis porttitor volutpat. Nulla porttitor accumsan tincidunt. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt.</p>\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Nulla quis lorem ut libero malesuada feugiat. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada.</p>\n<p>Proin eget tortor risus. Donec rutrum congue leo eget malesuada. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.</p>",
                  "editor": {
                    "alias": "rte"
                  },
                  "active": true,
                }
              ],
              "active": true,
              "hasActiveChild": true
            }
          ],
          "hasConfig": false,
          "id": "4820aba2-8d6b-4a7e-7f57-e0490a9b475e",
          "hasActiveChild": true,
          "active": true
        }
      ]
    }
  ]
}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (437, 24, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (438, 65, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (439, 24, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (440, 65, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (441, 24, 77, NULL, NULL, NULL, NULL, NULL, N'Let''s have a chat', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (442, 65, 77, NULL, NULL, NULL, NULL, NULL, N'Let''s have a chat', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (443, 24, 78, NULL, NULL, NULL, NULL, NULL, N'Send Us A Message', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (444, 65, 78, NULL, NULL, NULL, NULL, NULL, N'Send Us A Message', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (445, 24, 79, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lacinia nisl. Aenean sollicitudin diam vitae enim ultrices, semper euismod magna efficitur.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (446, 65, 79, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lacinia nisl. Aenean sollicitudin diam vitae enim ultrices, semper euismod magna efficitur.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (447, 24, 80, NULL, NULL, NULL, NULL, NULL, N'adf160f1-39f5-44c0-b01d-9e2da32bf093', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (448, 65, 80, NULL, NULL, NULL, NULL, NULL, N'adf160f1-39f5-44c0-b01d-9e2da32bf093', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (449, 24, 81, NULL, NULL, NULL, NULL, NULL, N'You''ll find us here', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (450, 65, 81, NULL, NULL, NULL, NULL, NULL, N'You''ll find us here', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (451, 24, 82, NULL, NULL, NULL, NULL, NULL, N'55.40622012982414,10.388404726982117,18', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (452, 65, 82, NULL, NULL, NULL, NULL, NULL, N'55.40622012982414,10.388404726982117,18', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (453, 64, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (455, 64, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (457, 64, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (459, 64, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (461, 64, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (463, 64, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Full Width","id":"4820aba2-8d6b-4a7e-7f57-e0490a9b475e","areas":[{"grid":"12","controls":[{"value":"<p>Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.</p>","editor":{"alias":"rte","view":null},"styles":null,"config":null},{"value":"","editor":{"alias":"embed","view":null},"styles":null,"config":null},{"value":"<p> </p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sollicitudin molestie malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies ligula sed magna dictum porta. Pellentesque in ipsum id orci porta dapibus.</p>\n<p>Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Vivamus suscipit tortor eget felis porttitor volutpat. Nulla porttitor accumsan tincidunt. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Nulla porttitor accumsan tincidunt.</p>\n<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Nulla quis lorem ut libero malesuada feugiat. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada.</p>\n<p>Proin eget tortor risus. Donec rutrum congue leo eget malesuada. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.</p>","editor":{"alias":"rte","view":null},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (465, 66, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (467, 66, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (469, 66, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (471, 66, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (473, 66, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (475, 66, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (477, 67, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (479, 67, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (481, 67, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (483, 67, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (485, 67, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (487, 67, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (489, 67, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (491, 62, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (492, 69, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (493, 62, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (494, 69, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (495, 62, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (496, 69, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (497, 62, 83, NULL, NULL, NULL, NULL, NULL, N'My Blog Post', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (498, 69, 83, NULL, NULL, NULL, NULL, NULL, N'My Blog Post', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (499, 62, 84, NULL, NULL, NULL, NULL, NULL, N'["demo","umbraco","starter kit"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (500, 69, 84, NULL, NULL, NULL, NULL, NULL, N'["demo","umbraco","starter kit"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (501, 62, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (502, 69, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (503, 63, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (504, 70, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (505, 63, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (506, 70, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (507, 63, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (508, 70, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (509, 63, 83, NULL, NULL, NULL, NULL, NULL, N'Now it gets exciting', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (510, 70, 83, NULL, NULL, NULL, NULL, NULL, N'Now it gets exciting', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (511, 63, 84, NULL, NULL, NULL, NULL, NULL, N'["cg16","codegarden","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (512, 70, 84, NULL, NULL, NULL, NULL, NULL, N'["cg16","codegarden","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (513, 63, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (514, 70, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (515, 63, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"011e74f2-b4de-0e4e-1cb9-23b2356b1213","areas":[{"grid":"4","controls":[{"value":{"udi":"umb://media/55514845b8bd487cb3709724852fd6bb","image":"/media/55514845b8bd487cb3709724852fd6bb/00000006000000000000000000000000/4730684907_8a7f8759cb_b.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<p>Donec sollicitudin molestie malesuada. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada.</p>\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Sed porttitor lectus nibh.</p>\n<p>Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat.</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (516, 70, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"011e74f2-b4de-0e4e-1cb9-23b2356b1213","areas":[{"grid":"4","controls":[{"value":{"udi":"umb://media/55514845b8bd487cb3709724852fd6bb","image":"/media/55514845b8bd487cb3709724852fd6bb/00000006000000000000000000000000/4730684907_8a7f8759cb_b.jpg"},"editor":{"alias":"media","view":"media"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<p>Donec sollicitudin molestie malesuada. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt. Donec rutrum congue leo eget malesuada.</p>\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus. Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Sed porttitor lectus nibh.</p>\n<p>Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec rutrum congue leo eget malesuada. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat.</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (517, 71, 37, NULL, NULL, NULL, NULL, NULL, N'Notifications', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (518, 72, 37, NULL, NULL, NULL, NULL, NULL, N'Notifications', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (519, 71, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (520, 72, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (521, 71, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (522, 72, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (523, 71, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (524, 72, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (528, 73, 37, NULL, NULL, NULL, NULL, NULL, N'24Days In Umbraco 2019', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (530, 73, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (532, 73, 93, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (534, 73, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'This is 24Days In Umbraco Push Notification Post. With this post you can track all the notifications of the system.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (536, 74, 37, NULL, NULL, NULL, NULL, NULL, N'24Days In Umbraco 2019', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (538, 74, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (540, 74, 93, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (542, 74, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'This is 24Days In Umbraco Push Notification Post. With this post you can track all the notifications of the system.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (544, 75, 37, NULL, NULL, NULL, NULL, NULL, N'24Days In Umbraco 2019', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (546, 75, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (548, 75, 93, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (550, 75, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'This is 24Days In Umbraco Push Notification Post. With this post you can track all the notifications of the system.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (552, 76, 37, NULL, NULL, NULL, NULL, NULL, N'24Days In Umbraco 2019', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (553, 77, 37, NULL, NULL, NULL, NULL, NULL, N'24Days In Umbraco 2019', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (554, 76, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (555, 77, 38, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (556, 76, 93, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (557, 77, 93, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (558, 76, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'This is 24Days In Umbraco Push Notification Post. With this post you can track all the notifications of the system.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (559, 77, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'This is 24Days In Umbraco Push Notification Post. With this post you can track all the notifications of the system.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (560, 68, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (562, 68, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (564, 68, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (566, 68, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (568, 68, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (570, 68, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (572, 68, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (574, 78, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (576, 78, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (578, 78, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (580, 78, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (582, 78, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (584, 78, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (586, 78, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (588, 79, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (590, 79, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (592, 79, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (594, 79, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (596, 79, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (598, 79, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (600, 79, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (602, 80, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (604, 80, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (606, 80, 89, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (608, 80, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (610, 80, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (612, 80, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (614, 80, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (616, 81, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (617, 82, 40, NULL, NULL, NULL, NULL, NULL, N'[]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (618, 81, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (619, 82, 41, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (620, 81, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (621, 82, 89, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (622, 81, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (623, 82, 83, NULL, NULL, NULL, NULL, NULL, N'This will be great', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (624, 81, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (625, 82, 84, NULL, NULL, NULL, NULL, NULL, N'["great","umbraco"]', NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (626, 81, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (627, 82, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (628, 81, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (629, 82, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (676, 93, 30, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (677, 93, 33, NULL, NULL, NULL, NULL, CAST(N'2019-11-29T14:56:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (678, 93, 34, NULL, NULL, NULL, NULL, CAST(N'2019-11-29T14:56:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, N'4cbeb612-e689-3563-b755-bf3ede295433', 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, N'0cc3507c-66ab-3091-8913-3d998148e423', 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (3, N'8307994f-faf2-3844-bab9-72d34514edf2', 0, N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'Relate Parent Media Folder On Delete', N'relateParentMediaFolderOnDelete')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:44366/umbraco', N'DESKTOP-KAAO128//LM/W3SVC/2/ROOT', CAST(N'2019-11-28T10:00:38.593' AS DateTime), CAST(N'2019-12-03T22:28:46.020' AS DateTime), 1, 1)
INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (2, N'http://localhost:44366/umbraco', N'DESKTOP-KAAO128//LM/W3SVC/3/ROOT', CAST(N'2019-11-28T12:34:02.553' AS DateTime), CAST(N'2019-11-28T22:22:41.093' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (-1, 0, 0, N'Administrator', N'admin@admin.com', N'CDapUoBSCaniVB/yhLEIUA==ylAFLZBzCRGofz6g22x9YlMXGQrYhjcK6pOwdtp+j+o=', N'{"hashAlgorithm":"HMACSHA256"}', N'admin@admin.com', N'en-US', N'08228f63-afb2-4a83-91c9-aa923659b77c', 0, NULL, CAST(N'2019-12-03T22:26:20.397' AS DateTime), CAST(N'2019-12-03T22:26:35.983' AS DateTime), NULL, NULL, CAST(N'2019-11-28T09:58:40.850' AS DateTime), CAST(N'2019-12-03T22:26:35.987' AS DateTime), NULL, N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true}]')
INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (1, 1, 0, N'Editor User', N'editor@admin.com', N'YYCh6ae9Npw9ADjRYjU6sw==UyhMRBeeDCeSixRqWXFmjsodpkCqigey+cS0ycNgYHk=', N'{"hashAlgorithm":"HMACSHA256"}', N'editor@admin.com', N'en-US', N'dc00d5f3-9cf4-416e-8a3d-f4d1fed7a5f2', 0, NULL, CAST(N'2019-11-29T13:51:55.063' AS DateTime), CAST(N'2019-11-29T13:53:25.630' AS DateTime), NULL, NULL, CAST(N'2019-11-29T13:51:55.003' AS DateTime), CAST(N'2019-12-03T22:25:24.617' AS DateTime), NULL, N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true}]')
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 5)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (1, 3)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] ON 

INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7ï', CAST(N'2019-11-28T09:58:44.813' AS DateTime), CAST(N'2019-11-28T09:58:44.813' AS DateTime), N'icon-medal', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (2, N'writer', N'Writers', N'CAH:F', CAST(N'2019-11-28T09:58:44.867' AS DateTime), CAST(N'2019-11-28T09:58:44.867' AS DateTime), N'icon-edit', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5Fï', CAST(N'2019-11-28T09:58:44.870' AS DateTime), CAST(N'2019-11-28T09:58:44.870' AS DateTime), N'icon-tools', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (4, N'translator', N'Translators', N'AF', CAST(N'2019-11-28T09:58:44.870' AS DateTime), CAST(N'2019-11-28T09:58:44.870' AS DateTime), N'icon-globe', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (5, N'sensitiveData', N'Sensitive data', N'', CAST(N'2019-11-28T09:58:44.873' AS DateTime), CAST(N'2019-11-28T09:58:44.873' AS DateTime), N'icon-lock', -1, -1)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] OFF
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'packages')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'translation')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'users')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (2, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (4, N'translation')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'271ef78d-188e-4d1f-9d9a-05652bd43be7', -1, CAST(N'2019-12-03T13:32:02.407' AS DateTime), CAST(N'2019-12-03T13:32:02.407' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'4f5a5d06-3508-4152-ae15-10ec656d509e', 1, CAST(N'2019-11-29T08:08:25.770' AS DateTime), CAST(N'2019-11-29T08:08:25.770' AS DateTime), CAST(N'2019-11-29T08:09:19.440' AS DateTime), N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'31d7d875-ef63-4b12-bd56-1364c73c359b', -1, CAST(N'2019-11-29T08:09:21.343' AS DateTime), CAST(N'2019-11-29T08:16:34.873' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'76a7a01e-2cc2-42cf-88c5-173376a2dbb8', -1, CAST(N'2019-12-03T16:41:20.717' AS DateTime), CAST(N'2019-12-03T16:41:20.717' AS DateTime), CAST(N'2019-12-03T16:41:24.873' AS DateTime), N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'870d1b86-52e5-4d97-8e24-1cee2cc32abd', -1, CAST(N'2019-12-03T16:39:09.543' AS DateTime), CAST(N'2019-12-03T16:41:20.190' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'be159eb9-221c-4f7d-92b3-2a396f547b32', -1, CAST(N'2019-11-28T16:30:24.643' AS DateTime), CAST(N'2019-11-28T16:31:56.780' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'a4ed162f-f837-44fe-a002-2e18b2aad3e7', -1, CAST(N'2019-11-30T18:00:30.927' AS DateTime), CAST(N'2019-11-30T18:03:47.710' AS DateTime), CAST(N'2019-11-30T18:03:47.780' AS DateTime), N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'2f80e30e-023d-4d8b-809a-30a80b57e492', -1, CAST(N'2019-11-28T05:14:29.767' AS DateTime), CAST(N'2019-11-28T05:20:16.857' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'd75bb32a-608b-412c-ae37-40801d0acd56', -1, CAST(N'2019-11-29T05:40:36.147' AS DateTime), CAST(N'2019-11-29T05:45:10.360' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'2732cfce-2189-4ce9-8b11-5f775bd43d29', -1, CAST(N'2019-11-28T06:34:07.110' AS DateTime), CAST(N'2019-11-28T06:34:07.307' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'310f2511-1b3c-4eab-aee2-612a3058afcc', -1, CAST(N'2019-11-29T10:17:49.193' AS DateTime), CAST(N'2019-11-29T10:17:49.687' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'26a195ef-239e-4a6b-8612-69a1e8b10ccd', -1, CAST(N'2019-12-03T15:51:57.403' AS DateTime), CAST(N'2019-12-03T16:11:30.737' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'f0d0f26f-db10-4f05-b27c-6a7a8ed32e7e', -1, CAST(N'2019-11-28T04:16:36.230' AS DateTime), CAST(N'2019-11-28T04:34:51.077' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'9ff47cff-43d4-4fee-a134-6cf65bdf8d07', -1, CAST(N'2019-11-29T05:25:00.143' AS DateTime), CAST(N'2019-11-29T05:30:13.103' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'8e6f3a5a-543b-4566-aad3-7fa9f5eb37c9', -1, CAST(N'2019-11-28T07:30:15.953' AS DateTime), CAST(N'2019-11-28T07:44:56.683' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'35fbc1b2-c129-4cda-8060-8633138c41d4', -1, CAST(N'2019-11-28T05:55:01.787' AS DateTime), CAST(N'2019-11-28T05:57:59.180' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'83ba5905-76f4-4b7f-ae2a-90c6d8400ebe', -1, CAST(N'2019-11-28T06:40:02.543' AS DateTime), CAST(N'2019-11-28T06:40:02.543' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'6c406980-c458-4402-8f49-929f622b8397', -1, CAST(N'2019-11-28T07:04:54.043' AS DateTime), CAST(N'2019-11-28T07:04:54.043' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'cb922b77-1cc3-44a1-848c-9af1d04c1d08', -1, CAST(N'2019-12-03T16:41:36.060' AS DateTime), CAST(N'2019-12-03T16:41:36.060' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'653878a9-e43f-4cf0-a15b-d45c9911a48f', -1, CAST(N'2019-11-29T08:03:28.910' AS DateTime), CAST(N'2019-11-29T08:07:45.147' AS DateTime), CAST(N'2019-11-29T08:08:19.317' AS DateTime), N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'40415390-a997-444b-955c-d549f656cc19', -1, CAST(N'2019-11-28T06:03:19.253' AS DateTime), CAST(N'2019-11-28T06:15:36.087' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'04076733-cce8-43dd-a109-d85a2122148b', -1, CAST(N'2019-11-29T08:58:54.113' AS DateTime), CAST(N'2019-11-29T09:10:59.923' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'b33d7d48-af5f-4968-b6a3-e122c9a808e7', -1, CAST(N'2019-11-28T05:52:23.333' AS DateTime), CAST(N'2019-11-28T05:54:57.580' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'9568f440-63eb-4f21-a3c9-f7323d7439f9', -1, CAST(N'2019-11-29T08:38:56.280' AS DateTime), CAST(N'2019-11-29T08:58:53.483' AS DateTime), NULL, N'::1')
/****** Object:  Index [IX_cmsContentType]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsDictionary_key]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_key] ON [dbo].[cmsDictionary]
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacro_UniqueId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacro_UniqueId] ON [dbo].[cmsMacro]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacroProperty_UniquePropertyId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [dbo].[cmsMacroProperty]
(
	[uniquePropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMember_LoginName]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsMember_LoginName] ON [dbo].[cmsMember]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsPropertyTypeAlias]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyTypeAlias] ON [dbo].[cmsPropertyType]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsTags]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[group] ASC,
	[tag] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTags_LanguageId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags_LanguageId] ON [dbo].[cmsTags]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_LanguageId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_LanguageId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_VersionId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_VersionId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[versionId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocument_Published]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocument_Published] ON [dbo].[umbracoDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_LanguageId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_LanguageId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_NodeId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_NodeId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[nodeId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLanguage_fallbackLanguageId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLanguage_fallbackLanguageId] ON [dbo].[umbracoLanguage]
(
	[fallbackLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoMediaVersion]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMediaVersion] ON [dbo].[umbracoMediaVersion]
(
	[id] ASC,
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ObjectType]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ParentId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ParentId] ON [dbo].[umbracoNode]
(
	[parentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoNode_Path]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Path] ON [dbo].[umbracoNode]
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_Trashed]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Trashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_UniqueId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNode_UniqueId] ON [dbo].[umbracoNode]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_LanguageId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_LanguageId] ON [dbo].[umbracoPropertyData]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_PropertyTypeId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_PropertyTypeId] ON [dbo].[umbracoPropertyData]
(
	[propertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_Segment]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_Segment] ON [dbo].[umbracoPropertyData]
(
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_VersionId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoPropertyData_VersionId] ON [dbo].[umbracoPropertyData]
(
	[versionId] ASC,
	[propertyTypeId] ASC,
	[languageId] ASC,
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl]
(
	[urlHash] ASC,
	[contentKey] ASC,
	[culture] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelation_parentChildType]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelation_parentChildType] ON [dbo].[umbracoRelation]
(
	[parentId] ASC,
	[childId] ASC,
	[relType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_alias]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_alias] ON [dbo].[umbracoRelationType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_name]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_name] ON [dbo].[umbracoRelationType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelationType_UniqueId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_UniqueId] ON [dbo].[umbracoRelationType]
(
	[typeUniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_computerName]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupAlias]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupAlias] ON [dbo].[umbracoUserGroup]
(
	[userGroupAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupName]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupName] ON [dbo].[umbracoUserGroup]
(
	[userGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUser2NodePermission_nodeId]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser2NodePermission_nodeId] ON [dbo].[umbracoUserGroup2NodePermission]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserLogin_lastValidatedUtc]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUserLogin_lastValidatedUtc] ON [dbo].[umbracoUserLogin]
(
	[lastValidatedUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserStartNode_startNodeType]    Script Date: 12/03/2019 10:29:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserStartNode_startNodeType] ON [dbo].[umbracoUserStartNode]
(
	[startNodeType] ASC,
	[startNode] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isElement]  DEFAULT ('0') FOR [isElement]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_isSensitive]  DEFAULT ('0') FOR [isSensitive]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAudit] ADD  CONSTRAINT [DF_umbracoAudit_eventDateUtc]  DEFAULT (getdate()) FOR [eventDateUtc]
GO
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  CONSTRAINT [DF_umbracoCacheInstruction_instructionCount]  DEFAULT ('1') FOR [instructionCount]
GO
ALTER TABLE [dbo].[umbracoConsent] ADD  CONSTRAINT [DF_umbracoConsent_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoContentVersion] ADD  CONSTRAINT [DF_umbracoContentVersion_versionDate]  DEFAULT (getdate()) FOR [versionDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoKeyValue] ADD  CONSTRAINT [DF_umbracoKeyValue_updated]  DEFAULT (getdate()) FOR [updated]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_isDefaultVariantLang]  DEFAULT ('0') FOR [isDefaultVariantLang]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueId]  DEFAULT (newid()) FOR [uniqueId]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsContentNu]  WITH NOCHECK ADD  CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cmsContentNu] CHECK CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[umbracoDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY([availableUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoDataType]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDataType] CHECK CONSTRAINT [FK_umbracoDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocument]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocument] CHECK CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoDomain]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomain] CHECK CONSTRAINT [FK_umbracoDomain_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoLanguage]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY([fallbackLanguageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoLanguage] CHECK CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoLog]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoLog] CHECK CONSTRAINT [FK_umbracoLog_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoMediaVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoMediaVersion] CHECK CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY([nodeUser])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueId])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
GO
USE [master]
GO
ALTER DATABASE [Usome24DaysIn] SET  READ_WRITE 
GO
