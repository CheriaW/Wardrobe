USE [master]
GO
/****** Object:  Database [BasicWardrobe]    Script Date: 11/6/2017 6:13:59 PM ******/
CREATE DATABASE [BasicWardrobe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BasicWardrobe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BasicWardrobe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BasicWardrobe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BasicWardrobe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BasicWardrobe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BasicWardrobe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BasicWardrobe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BasicWardrobe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BasicWardrobe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BasicWardrobe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BasicWardrobe] SET ARITHABORT OFF 
GO
ALTER DATABASE [BasicWardrobe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BasicWardrobe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BasicWardrobe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BasicWardrobe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BasicWardrobe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BasicWardrobe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BasicWardrobe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BasicWardrobe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BasicWardrobe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BasicWardrobe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BasicWardrobe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BasicWardrobe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BasicWardrobe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BasicWardrobe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BasicWardrobe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BasicWardrobe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BasicWardrobe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BasicWardrobe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BasicWardrobe] SET  MULTI_USER 
GO
ALTER DATABASE [BasicWardrobe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BasicWardrobe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BasicWardrobe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BasicWardrobe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BasicWardrobe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BasicWardrobe]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2017 6:13:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ClothingName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/6/2017 6:13:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[OccassionsID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SeasonID] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occassion]    Script Date: 11/6/2017 6:13:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occassion](
	[OccassionsID] [int] IDENTITY(1,1) NOT NULL,
	[OccassionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Occassion] PRIMARY KEY CLUSTERED 
(
	[OccassionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Season]    Script Date: 11/6/2017 6:13:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[SeasonName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [ClothingName]) VALUES (1, N'Tops')
INSERT [dbo].[Category] ([CategoryID], [ClothingName]) VALUES (2, N'Bottoms')
INSERT [dbo].[Category] ([CategoryID], [ClothingName]) VALUES (3, N'Shoes')
INSERT [dbo].[Category] ([CategoryID], [ClothingName]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemID], [Name], [Photo], [Type], [Color], [OccassionsID], [CategoryID], [SeasonID]) VALUES (1, N'Favorite Shoes', N'r', N'Heels', N'Red', 1, 3, 1)
INSERT [dbo].[Item] ([ItemID], [Name], [Photo], [Type], [Color], [OccassionsID], [CategoryID], [SeasonID]) VALUES (2, N'Old Shirt', NULL, N'tee', N'Gray', 1, 1, 1)
INSERT [dbo].[Item] ([ItemID], [Name], [Photo], [Type], [Color], [OccassionsID], [CategoryID], [SeasonID]) VALUES (3, N'Ratty Shoes', NULL, N'Sneakers', N'Red, Black, White', 8, 3, 1)
INSERT [dbo].[Item] ([ItemID], [Name], [Photo], [Type], [Color], [OccassionsID], [CategoryID], [SeasonID]) VALUES (4, N'Stolen Hoodie', NULL, N'Thick', N'Navy Blue', 8, 1, 4)
INSERT [dbo].[Item] ([ItemID], [Name], [Photo], [Type], [Color], [OccassionsID], [CategoryID], [SeasonID]) VALUES (5, N'Journey Bag', NULL, N'Messenger', N'Brown', 11, 4, 4)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Occassion] ON 

INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (1, N'Birthday')
INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (2, N'Anniversary')
INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (3, N'Party')
INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (4, N'Interview')
INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (5, N'Halloween')
INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (6, N'Vacation')
INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (7, N'Party')
INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (8, N'Lazy Day')
INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (10, N'Pool Day')
INSERT [dbo].[Occassion] ([OccassionsID], [OccassionName]) VALUES (11, N'Non-Specific')
SET IDENTITY_INSERT [dbo].[Occassion] OFF
SET IDENTITY_INSERT [dbo].[Season] ON 

INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (1, N'Summer')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (2, N'Winter')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (3, N'Spring')
INSERT [dbo].[Season] ([SeasonID], [SeasonName]) VALUES (4, N'Fall')
SET IDENTITY_INSERT [dbo].[Season] OFF
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Occassion] FOREIGN KEY([OccassionsID])
REFERENCES [dbo].[Occassion] ([OccassionsID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Occassion]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Season] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Season] ([SeasonID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Season]
GO
USE [master]
GO
ALTER DATABASE [BasicWardrobe] SET  READ_WRITE 
GO
