USE [master]
GO
/****** Object:  Database [TeleperformanceDbHomework]    Script Date: 4.06.2022 16:56:32 ******/
CREATE DATABASE [TeleperformanceDbHomework]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeleperformanceDbHomework', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TeleperformanceDbHomework.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeleperformanceDbHomework_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TeleperformanceDbHomework_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TeleperformanceDbHomework] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeleperformanceDbHomework].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeleperformanceDbHomework] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET RECOVERY FULL 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET  MULTI_USER 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeleperformanceDbHomework] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeleperformanceDbHomework] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TeleperformanceDbHomework', N'ON'
GO
ALTER DATABASE [TeleperformanceDbHomework] SET QUERY_STORE = OFF
GO
USE [TeleperformanceDbHomework]
GO
/****** Object:  Table [dbo].[Contents]    Script Date: 4.06.2022 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contents](
	[CommentID] [tinyint] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](10) NULL,
	[Post] [tinyint] NULL,
	[Content] [nvarchar](500) NULL,
	[SendDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Contents] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 4.06.2022 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[FriendshipID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](10) NOT NULL,
	[Receiver] [nvarchar](10) NOT NULL,
	[Confirmation] [bit] NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[FriendshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FriendshipConfirmations]    Script Date: 4.06.2022 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendshipConfirmations](
	[ConfirmationID] [tinyint] IDENTITY(1,1) NOT NULL,
	[FriendshipSender] [nvarchar](10) NULL,
	[FriendshipReceiver] [nvarchar](10) NULL,
	[Confirmation] [bit] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_FriendshipConfirmation] PRIMARY KEY CLUSTERED 
(
	[ConfirmationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 4.06.2022 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](15) NOT NULL,
	[Member] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryMessages]    Script Date: 4.06.2022 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryMessages](
	[HistoryMessageID] [tinyint] IDENTITY(1,1) NOT NULL,
	[MessageID] [tinyint] NULL,
	[Sender] [nvarchar](10) NULL,
	[Subject] [nvarchar](20) NULL,
	[MessageContent] [nvarchar](500) NULL,
	[recipient] [nvarchar](10) NULL,
	[additional] [nvarchar](999) NULL,
	[SendDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[MessageType] [nvarchar](5) NULL,
 CONSTRAINT [PK_HistoryMessage] PRIMARY KEY CLUSTERED 
(
	[HistoryMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryPosts]    Script Date: 4.06.2022 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryPosts](
	[HistoryPostID] [tinyint] IDENTITY(1,1) NOT NULL,
	[PostID] [tinyint] NULL,
	[User] [nvarchar](10) NULL,
	[PostContent] [nvarchar](500) NULL,
	[Additional] [nvarchar](999) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[HistoryPostType] [nvarchar](5) NULL,
 CONSTRAINT [PK_HistoryPosts] PRIMARY KEY CLUSTERED 
(
	[HistoryPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 4.06.2022 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](10) NOT NULL,
	[Subject] [nvarchar](20) NOT NULL,
	[MessageContent] [nvarchar](500) NULL,
	[Recipient] [nvarchar](10) NULL,
	[Additional] [nvarchar](999) NULL,
	[SendDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[MessageType] [nvarchar](5) NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 4.06.2022 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [tinyint] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](10) NOT NULL,
	[PostContent] [nvarchar](500) NULL,
	[Additional] [nvarchar](999) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[PostType] [nvarchar](5) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4.06.2022 16:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Nickname] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Nickname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Contents_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Contents_Users]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_Users1] FOREIGN KEY([Receiver])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_Users1]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_Users2] FOREIGN KEY([Sender])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_Users2]
GO
ALTER TABLE [dbo].[FriendshipConfirmations]  WITH CHECK ADD  CONSTRAINT [FK_FriendshipConfirmation_Users] FOREIGN KEY([FriendshipReceiver])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[FriendshipConfirmations] CHECK CONSTRAINT [FK_FriendshipConfirmation_Users]
GO
ALTER TABLE [dbo].[FriendshipConfirmations]  WITH CHECK ADD  CONSTRAINT [FK_FriendshipConfirmation_Users1] FOREIGN KEY([FriendshipSender])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[FriendshipConfirmations] CHECK CONSTRAINT [FK_FriendshipConfirmation_Users1]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Users] FOREIGN KEY([Member])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Users]
GO
ALTER TABLE [dbo].[HistoryPosts]  WITH CHECK ADD  CONSTRAINT [FK_HistoryPosts_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[HistoryPosts] CHECK CONSTRAINT [FK_HistoryPosts_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users1] FOREIGN KEY([Sender])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users1]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
USE [master]
GO
ALTER DATABASE [TeleperformanceDbHomework] SET  READ_WRITE 
GO
