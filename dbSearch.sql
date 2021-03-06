USE [master]
GO
/****** Object:  Database [dbSearchProject]    Script Date: 08/09/2021 16:54:52 ******/
CREATE DATABASE [dbSearchProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbSearchProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbSearchProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbSearchProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbSearchProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbSearchProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbSearchProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbSearchProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbSearchProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbSearchProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbSearchProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbSearchProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbSearchProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbSearchProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbSearchProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbSearchProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbSearchProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbSearchProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbSearchProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbSearchProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbSearchProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbSearchProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbSearchProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbSearchProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbSearchProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbSearchProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbSearchProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbSearchProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbSearchProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbSearchProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbSearchProject] SET  MULTI_USER 
GO
ALTER DATABASE [dbSearchProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbSearchProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbSearchProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbSearchProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbSearchProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbSearchProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbSearchProject] SET QUERY_STORE = OFF
GO
USE [dbSearchProject]
GO
/****** Object:  Table [dbo].[ClientSearchFile]    Script Date: 08/09/2021 16:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSearchFile](
	[searchID] [int] IDENTITY(1,1) NOT NULL,
	[fileName] [nvarchar](50) NULL,
	[filePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientSearchFile] PRIMARY KEY CLUSTERED 
(
	[searchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultSearchFile]    Script Date: 08/09/2021 16:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultSearchFile](
	[searchID] [int] NULL,
	[resultID] [int] IDENTITY(1,1) NOT NULL,
	[FileAndPath] [nvarchar](max) NULL,
 CONSTRAINT [PK_ResultSearchFile] PRIMARY KEY CLUSTERED 
(
	[resultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClientSearchFile] ON 

INSERT [dbo].[ClientSearchFile] ([searchID], [fileName], [filePath]) VALUES (20, N'', N'c:\temp')
INSERT [dbo].[ClientSearchFile] ([searchID], [fileName], [filePath]) VALUES (21, N'hello', N'c:\temp')
INSERT [dbo].[ClientSearchFile] ([searchID], [fileName], [filePath]) VALUES (22, N'shalom', N'c:\temp')
INSERT [dbo].[ClientSearchFile] ([searchID], [fileName], [filePath]) VALUES (23, N'hello', N'c:\')
INSERT [dbo].[ClientSearchFile] ([searchID], [fileName], [filePath]) VALUES (24, N'hello', N'c:\temp')
INSERT [dbo].[ClientSearchFile] ([searchID], [fileName], [filePath]) VALUES (25, N'hello', N'c:\temp')
INSERT [dbo].[ClientSearchFile] ([searchID], [fileName], [filePath]) VALUES (26, N'g', N'c:\temp')
INSERT [dbo].[ClientSearchFile] ([searchID], [fileName], [filePath]) VALUES (27, N's', N'c:\\temp')
INSERT [dbo].[ClientSearchFile] ([searchID], [fileName], [filePath]) VALUES (28, N'o', N'c:\\temp')
SET IDENTITY_INSERT [dbo].[ClientSearchFile] OFF
GO
SET IDENTITY_INSERT [dbo].[ResultSearchFile] ON 

INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (20, 3, N'c:\temp\bbb\Hello.pptx')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (20, 4, N'c:\temp\bbb\hello.txt')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (21, 5, N'c:\temp\bbb\Hello.pptx')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (21, 6, N'c:\temp\bbb\hello.txt')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (22, 7, N'c:\temp\bbb\shalom.rtf')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (23, 8, N'c:\Python39\tcl\tk8.6\demos\hello')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (23, 9, N'c:\temp\bbb\hello.txt')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (23, 10, N'c:\Windows\servicing\LCU\Package_for_RollupFix~31bf3856ad364e35~amd64~~19041.1110.1.15\amd64_microsoft-windows-c..riencehost.appxmain_31bf3856ad364e35_10.0.19041.1081_none_77965eac02bec6bf\f\hello.js')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (23, 11, N'c:\Windows\servicing\LCU\Package_for_RollupFix~31bf3856ad364e35~amd64~~19041.1110.1.15\amd64_microsoft-windows-c..riencehost.appxmain_31bf3856ad364e35_10.0.19041.1081_none_77965eac02bec6bf\r\hello.js')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (23, 12, N'c:\Windows\servicing\LCU\Package_for_RollupFix~31bf3856ad364e35~amd64~~19041.1165.1.8\amd64_microsoft-windows-c..riencehost.appxmain_31bf3856ad364e35_10.0.19041.1151_none_77888de202c996ab\f\hello.js')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (23, 13, N'c:\Windows\servicing\LCU\Package_for_RollupFix~31bf3856ad364e35~amd64~~19041.1165.1.8\amd64_microsoft-windows-c..riencehost.appxmain_31bf3856ad364e35_10.0.19041.1151_none_77888de202c996ab\r\hello.js')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (23, 14, N'c:\Windows\SystemApps\Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy\js\hello.js')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (23, 15, N'c:\Windows\WinSxS\amd64_microsoft-windows-c..riencehost.appxmain_31bf3856ad364e35_10.0.19041.1081_none_77965eac02bec6bf\hello.js')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (23, 16, N'c:\Windows\WinSxS\amd64_microsoft-windows-c..riencehost.appxmain_31bf3856ad364e35_10.0.19041.1151_none_77888de202c996ab\hello.js')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (24, 17, N'c:\temp\bbb\hello.txt')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (25, 18, N'c:\temp\bbb\hello.txt')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (25, 19, N'c:\temp\bbb\Hello_my name.pptx')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (26, 20, N'c:\temp\aaa\eee\gleb.rtf')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (27, 21, N'c:\\temp\bbb\shalom.rtf')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (27, 22, N'c:\\temp\ccc\yes.pub')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (27, 23, N'c:\\temp\33.xlsx')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (28, 24, N'c:\\temp\bbb\hello.txt')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (28, 25, N'c:\\temp\bbb\Hello_my name.pptx')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (28, 26, N'c:\\temp\bbb\shalom.rtf')
INSERT [dbo].[ResultSearchFile] ([searchID], [resultID], [FileAndPath]) VALUES (28, 27, N'c:\\temp\ccc\nope.txt')
SET IDENTITY_INSERT [dbo].[ResultSearchFile] OFF
GO
ALTER TABLE [dbo].[ResultSearchFile]  WITH CHECK ADD  CONSTRAINT [FK_ResultSearchFile_ClientSearchFile] FOREIGN KEY([searchID])
REFERENCES [dbo].[ClientSearchFile] ([searchID])
GO
ALTER TABLE [dbo].[ResultSearchFile] CHECK CONSTRAINT [FK_ResultSearchFile_ClientSearchFile]
GO
USE [master]
GO
ALTER DATABASE [dbSearchProject] SET  READ_WRITE 
GO
