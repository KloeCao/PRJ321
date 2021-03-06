USE [master]
GO
/****** Object:  Database [ProjectShoppingCart]    Script Date: 19/03/19 10:12:28 PM ******/
CREATE DATABASE [ProjectShoppingCart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectShoppingCart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProjectShoppingCart.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectShoppingCart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProjectShoppingCart_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProjectShoppingCart] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectShoppingCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectShoppingCart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectShoppingCart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectShoppingCart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectShoppingCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectShoppingCart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectShoppingCart] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectShoppingCart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectShoppingCart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectShoppingCart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectShoppingCart] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProjectShoppingCart] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProjectShoppingCart]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 19/03/19 10:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[custID] [varchar](10) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[firstName] [varchar](15) NOT NULL,
	[lastName] [varchar](15) NOT NULL,
	[middleName] [varchar](15) NULL,
	[address] [varchar](250) NOT NULL,
	[phone] [varchar](11) NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[custID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 19/03/19 10:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_order](
	[orderID] [varchar](10) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[custID] [varchar](10) NOT NULL,
	[total] [float] NOT NULL,
	[addressDelivery] [nvarchar](250) NOT NULL,
	[isDeliver] [int] NOT NULL,
 CONSTRAINT [PK_tbl_order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_orderDetail]    Script Date: 19/03/19 10:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_orderDetail](
	[id] [int] NOT NULL,
	[productID] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[unitPrice] [float] NOT NULL,
	[total] [float] NOT NULL,
	[orderID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_orderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_watch]    Script Date: 19/03/19 10:12:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_watch](
	[watchID] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[brandName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](250) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tbl_watch] PRIMARY KEY CLUSTERED 
(
	[watchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[customer] ([custID], [password], [firstName], [lastName], [middleName], [address], [phone]) VALUES (N'thu', N'111111111', N'a', N'c', N'b', N'njnj', N'23')
INSERT [dbo].[customer] ([custID], [password], [firstName], [lastName], [middleName], [address], [phone]) VALUES (N'thu1', N'123456789', N'k', N'k', N'k', N'Innovation Building, Block 24, Quang Trung Science Center Park, Tan Chanh Hiep Ward, Dictrict 12', N'988388736')
INSERT [dbo].[customer] ([custID], [password], [firstName], [lastName], [middleName], [address], [phone]) VALUES (N'thucao', N'1', N'hahaha', N'hahaha', N'hi', N'BH', N'0303')
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR1', CAST(N'2019-03-19 21:07:59.380' AS DateTime), N'thucao', 500, N'Innovation Building, Block 24, Quang Trung Science Center Park, Tan Chanh Hiep Ward, Dictrict 12', 1)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR10', CAST(N'2019-03-19 21:26:23.663' AS DateTime), N'thucao', 500, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR11', CAST(N'2019-03-19 21:29:03.637' AS DateTime), N'thucao', 1000, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR12', CAST(N'2019-03-19 21:31:01.743' AS DateTime), N'thucao', 1000, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR13', CAST(N'2019-03-19 21:43:57.633' AS DateTime), N'thucao', 600, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR14', CAST(N'2019-03-19 21:45:24.947' AS DateTime), N'thucao', 900, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR15', CAST(N'2019-03-19 21:46:48.007' AS DateTime), N'thucao', 800, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR16', CAST(N'2019-03-19 21:48:46.487' AS DateTime), N'thucao', 600, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR17', CAST(N'2019-03-19 21:51:27.507' AS DateTime), N'thucao', 300, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR18', CAST(N'2019-03-19 21:56:13.857' AS DateTime), N'thucao', 900, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR19', CAST(N'2019-03-19 22:00:35.587' AS DateTime), N'thucao', 900, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR2', CAST(N'2019-03-19 21:09:45.397' AS DateTime), N'thucao', 500, N'                ', 1)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR3', CAST(N'2019-03-19 21:11:47.177' AS DateTime), N'thucao', 300, N'                ', 1)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR4', CAST(N'2019-03-19 21:15:09.163' AS DateTime), N'thucao', 200, N'                ', 1)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR5', CAST(N'2019-03-19 21:16:34.427' AS DateTime), N'thucao', 500, N'                ', 1)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR6', CAST(N'2019-03-19 21:18:05.590' AS DateTime), N'thucao', 500, N'                ', 1)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR7', CAST(N'2019-03-19 21:18:53.680' AS DateTime), N'thucao', 500, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR8', CAST(N'2019-03-19 21:20:43.630' AS DateTime), N'thucao', 600, N'', 0)
INSERT [dbo].[tbl_order] ([orderID], [orderDate], [custID], [total], [addressDelivery], [isDeliver]) VALUES (N'OR9', CAST(N'2019-03-19 21:24:46.747' AS DateTime), N'thucao', 800, N'', 0)
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (1, N'1', 2, 200, 400, N'OR11')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (2, N'2', 1, 200, 200, N'OR18')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (3, N'3', 1, 300, 300, N'OR18')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (4, N'4', 1, 400, 400, N'OR18')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (5, N'2', 1, 200, 200, N'OR19')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (6, N'3', 1, 300, 300, N'OR19')
INSERT [dbo].[tbl_orderDetail] ([id], [productID], [quantity], [unitPrice], [total], [orderID]) VALUES (7, N'4', 1, 400, 400, N'OR19')
INSERT [dbo].[tbl_watch] ([watchID], [name], [brandName], [description], [price], [quantity]) VALUES (N'1', N'A', N'A1', N'akjskjdnjbsdfh', 100, 5)
INSERT [dbo].[tbl_watch] ([watchID], [name], [brandName], [description], [price], [quantity]) VALUES (N'2', N'B', N'B2', N'skdjfksdjflj', 200, 8)
INSERT [dbo].[tbl_watch] ([watchID], [name], [brandName], [description], [price], [quantity]) VALUES (N'3', N'C', N'C3', N'jsndfjjefw', 300, 10)
INSERT [dbo].[tbl_watch] ([watchID], [name], [brandName], [description], [price], [quantity]) VALUES (N'4', N'D', N'D4', N'jksndfjk', 400, 3)
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_customer] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[tbl_order] CHECK CONSTRAINT [FK_tbl_order_customer]
GO
ALTER TABLE [dbo].[tbl_orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_orderDetail_tbl_order] FOREIGN KEY([orderID])
REFERENCES [dbo].[tbl_order] ([orderID])
GO
ALTER TABLE [dbo].[tbl_orderDetail] CHECK CONSTRAINT [FK_tbl_orderDetail_tbl_order]
GO
ALTER TABLE [dbo].[tbl_orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_orderDetail_tbl_watch] FOREIGN KEY([productID])
REFERENCES [dbo].[tbl_watch] ([watchID])
GO
ALTER TABLE [dbo].[tbl_orderDetail] CHECK CONSTRAINT [FK_tbl_orderDetail_tbl_watch]
GO
USE [master]
GO
ALTER DATABASE [ProjectShoppingCart] SET  READ_WRITE 
GO
