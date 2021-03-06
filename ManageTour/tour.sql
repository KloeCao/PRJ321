USE [master]
GO
/****** Object:  Database [TourManagement]    Script Date: 3/9/2019 8:23:35 PM ******/
CREATE DATABASE [TourManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TourManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TourManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TourManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TourManagement_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TourManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TourManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TourManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TourManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TourManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TourManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TourManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [TourManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TourManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TourManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TourManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TourManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TourManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TourManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TourManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TourManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TourManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TourManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TourManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TourManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TourManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TourManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TourManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TourManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TourManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TourManagement] SET  MULTI_USER 
GO
ALTER DATABASE [TourManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TourManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TourManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TourManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TourManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TourManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role] [varchar](50) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[username] [varchar](50) NOT NULL,
	[fullname] [nvarchar](250) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedBack](
	[feedbackID] [varchar](10) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[tourID] [varchar](10) NOT NULL,
	[feedbackContent] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [varchar](10) NOT NULL,
	[dateCreate] [datetime] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[payment] [varchar](50) NOT NULL,
	[tourID] [varchar](10) NOT NULL,
	[numOfAdult] [int] NOT NULL,
	[numOfKid] [int] NOT NULL,
	[orderStatus] [int] NOT NULL,
	[isReturn] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderDetailsID] [varchar](10) NOT NULL,
	[orderID] [varchar](10) NOT NULL,
	[tourID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[statusID] [int] NOT NULL,
	[statusContent] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passenger](
	[passengerID] [varchar](10) NOT NULL,
	[orderID] [varchar](10) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[birthday] [date] NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[isAdult] [bit] NOT NULL,
	[passengerStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Passenger] PRIMARY KEY CLUSTERED 
(
	[passengerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[username] [varchar](50) NOT NULL,
	[fullname] [nvarchar](250) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[address] [nvarchar](4000) NOT NULL,
	[birthday] [date] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tour](
	[tourID] [varchar](10) NOT NULL,
	[tourCategoryID] [varchar](10) NOT NULL,
	[journey] [nvarchar](1000) NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[agenda] [nvarchar](4000) NOT NULL,
	[departure] [nvarchar](250) NOT NULL,
	[timeBegin] [datetime] NOT NULL,
	[timeEnd] [datetime] NOT NULL,
	[timeLiving] [nvarchar](50) NOT NULL,
	[picture] [varchar](500) NOT NULL,
	[priceForAdult] [float] NOT NULL,
	[priceForKid] [float] NOT NULL,
	[quantityPassenger] [int] NOT NULL,
	[vehicle] [nvarchar](50) NOT NULL,
	[tourGuideID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[tourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TourCategory]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TourCategory](
	[categoryID] [varchar](10) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TourCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TourGuide]    Script Date: 3/9/2019 8:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TourGuide](
	[tourGuideID] [varchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[address] [nvarchar](250) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[birthday] [date] NOT NULL,
 CONSTRAINT [PK_TourGuide] PRIMARY KEY CLUSTERED 
(
	[tourGuideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'hgl', N'123hgl', N'user', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'ltd', N'ltd123', N'admin', 0)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'ltg', N'ltg123', N'user', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'nmk', N'nmk123', N'user', 0)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'nne', N'nne123', N'admin', 0)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'nva', N'nva123', N'admin', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'phm', N'phm123', N'user', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'pnka', N'pnka123', N'user', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg001', N'tg001', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg002', N'tg002', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg003', N'tg003', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg004', N'tg004', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg005', N'tg005', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg006', N'tg006', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg007', N'tg006', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg008', N'tg008', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg009', N'tg009', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tg010', N'tg010', N'guide', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tkc', N'tkc123', N'admin', 1)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tth', N'tth123', N'user', 0)
INSERT [dbo].[Account] ([username], [password], [role], [status]) VALUES (N'tvb', N'tvb123', N'admin', 1)
INSERT [dbo].[Customer] ([username], [fullname], [email], [phone]) VALUES (N'hgl', N'HoÃ ng Gia Linh', N'hgl@gmail.com', N'0909784665')
INSERT [dbo].[Customer] ([username], [fullname], [email], [phone]) VALUES (N'ltg', N'Le Thi Giang', N'ltg@gmail.com', N'0909784555')
INSERT [dbo].[Customer] ([username], [fullname], [email], [phone]) VALUES (N'nmk', N'Nguyễn Minh Khoa', N'nmk@gmail.com', N'0987456980')
INSERT [dbo].[Customer] ([username], [fullname], [email], [phone]) VALUES (N'phm', N'Phan Hoàng Minh', N'phm@gmail.com', N'0909123900')
INSERT [dbo].[Customer] ([username], [fullname], [email], [phone]) VALUES (N'pnka', N'phan nguyá»n kim anh', N'pnka@gmail.com', N'0931794393')
INSERT [dbo].[Customer] ([username], [fullname], [email], [phone]) VALUES (N'tth', N'Trần Thị Hoa', N'tth@gmail.com', N'0980981239')
INSERT [dbo].[Order] ([orderID], [dateCreate], [username], [payment], [tourID], [numOfAdult], [numOfKid], [orderStatus], [isReturn]) VALUES (N'ODAFR11', CAST(N'2019-02-27 16:13:23.257' AS DateTime), N'phm', N'By Cast', N'AFR1', 1, 1, 1, 0)
INSERT [dbo].[Order] ([orderID], [dateCreate], [username], [payment], [tourID], [numOfAdult], [numOfKid], [orderStatus], [isReturn]) VALUES (N'ODAFR12', CAST(N'2019-02-27 16:18:07.967' AS DateTime), N'phm', N'By Cast', N'AFR1', 1, 0, -1, 0)
INSERT [dbo].[Order] ([orderID], [dateCreate], [username], [payment], [tourID], [numOfAdult], [numOfKid], [orderStatus], [isReturn]) VALUES (N'ODAFR13', CAST(N'2019-02-27 16:22:29.443' AS DateTime), N'hgl', N'By Cast', N'AFR1', 1, 0, 100, 0)
INSERT [dbo].[Order] ([orderID], [dateCreate], [username], [payment], [tourID], [numOfAdult], [numOfKid], [orderStatus], [isReturn]) VALUES (N'ODASIA21', CAST(N'2019-03-02 19:14:55.930' AS DateTime), N'hgl', N'By Cast', N'ASIA2', 1, 1, 0, 0)
INSERT [dbo].[Order] ([orderID], [dateCreate], [username], [payment], [tourID], [numOfAdult], [numOfKid], [orderStatus], [isReturn]) VALUES (N'ODNVN11', CAST(N'2019-03-02 19:25:41.067' AS DateTime), N'hgl', N'By Cast', N'NVN1', 1, 0, 25, 0)
INSERT [dbo].[Order] ([orderID], [dateCreate], [username], [payment], [tourID], [numOfAdult], [numOfKid], [orderStatus], [isReturn]) VALUES (N'ODNVN41', CAST(N'2019-02-27 16:17:02.007' AS DateTime), N'phm', N'By Cast', N'NVN4', 1, 0, 0, 0)
INSERT [dbo].[Order] ([orderID], [dateCreate], [username], [payment], [tourID], [numOfAdult], [numOfKid], [orderStatus], [isReturn]) VALUES (N'ODSVN51', CAST(N'2019-02-28 15:32:45.660' AS DateTime), N'ltg', N'By Cast', N'SVN5', 1, 2, 0, 0)
INSERT [dbo].[OrderStatus] ([statusID], [statusContent]) VALUES (-1, N'DESTROY0')
INSERT [dbo].[OrderStatus] ([statusID], [statusContent]) VALUES (0, N'WAITITNG')
INSERT [dbo].[OrderStatus] ([statusID], [statusContent]) VALUES (1, N'CHECKED')
INSERT [dbo].[OrderStatus] ([statusID], [statusContent]) VALUES (25, N'DESTROY25')
INSERT [dbo].[OrderStatus] ([statusID], [statusContent]) VALUES (50, N'DESTROY50')
INSERT [dbo].[OrderStatus] ([statusID], [statusContent]) VALUES (100, N'DESTROY100')
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PAFR11', N'ODAFR11', N'phan nguyen kim anh', CAST(N'1991-11-27' AS Date), N'0931794393', 1, 1)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PAFR12', N'ODAFR11', N'phan hoang minh', CAST(N'2010-12-09' AS Date), N'0931794393', 0, 1)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PAFR13', N'ODAFR12', N'phan tran ngoc kim', CAST(N'1995-07-12' AS Date), N'0931794393', 1, 0)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PAFR14', N'ODAFR13', N'hoang gia linh', CAST(N'1991-11-27' AS Date), N'0931794393', 1, 0)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PASIA21', N'ODASIA21', N'lê thị giang', CAST(N'1991-11-27' AS Date), N'0931794393', 1, 0)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PASIA22', N'ODASIA21', N'lê thị gia an', CAST(N'2010-12-09' AS Date), N'0931794393', 0, 0)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PNVN11', N'ODNVN11', N'lê thị giang', CAST(N'1997-09-29' AS Date), N'0931794393', 1, 0)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PNVN41', N'ODNVN41', N'phan nguyen kim anh', CAST(N'1991-11-27' AS Date), N'0931794393', 1, 0)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PSVN51', N'ODSVN51', N'lê thị giang', CAST(N'1997-09-29' AS Date), N'0931794393', 1, 0)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PSVN52', N'ODSVN51', N'lê thị gia an', CAST(N'2010-12-09' AS Date), N'0931794393', 0, 0)
INSERT [dbo].[Passenger] ([passengerID], [orderID], [fullname], [birthday], [phone], [isAdult], [passengerStatus]) VALUES (N'PSVN53', N'ODSVN51', N'lê thị an', CAST(N'2008-10-31' AS Date), N'0931994793', 0, 0)
INSERT [dbo].[Staff] ([username], [fullname], [email], [phone], [address], [birthday]) VALUES (N'ltd', N'Lê Thị Dung', N'ltd@gmail.com', N'0909124556', N'123 Bình Quới, Bình Thạnh', CAST(N'1990-09-09' AS Date))
INSERT [dbo].[Staff] ([username], [fullname], [email], [phone], [address], [birthday]) VALUES (N'nne', N'Nguyễn Nam Em', N'nne@gmail.com', N'0909446798', N'456 Nơ Trang Long quận 10', CAST(N'1991-11-11' AS Date))
INSERT [dbo].[Staff] ([username], [fullname], [email], [phone], [address], [birthday]) VALUES (N'nva', N'Nguyễn Văn An', N'nva@gmail.com', N'0978653421', N'789 Xô Viết Nghệ Tĩnh quận Bình Thạnh', CAST(N'1992-12-20' AS Date))
INSERT [dbo].[Staff] ([username], [fullname], [email], [phone], [address], [birthday]) VALUES (N'tkc', N'Trần Kim Chi', N'tkc@gmail.com', N'0977468129', N'Phú Yên', CAST(N'1993-08-08' AS Date))
INSERT [dbo].[Staff] ([username], [fullname], [email], [phone], [address], [birthday]) VALUES (N'tvb', N'Trần Văn Bình', N'tvb@gmail.com', N'0989425791', N'Bà Rịa', CAST(N'1994-07-07' AS Date))
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'AFR1', N'AFR', N'Nam Phi', N'Du ngoạn Nam Phi để thăm năm ông lớn (big five) của Châu Phi: Voi, Sư Tử, Báo, Trâu và Hà Mã, khám phá Johannesburg giàu có và Pretoria thanh lịch, hữu tình
//Choáng ngợp trước thành  phố Cape Town thịnh vượng và căng tràn sức sống thiên nhiên
//Trải nghiệm đầy lý thú khi đặt chân lên mũi Hảo Vọng - địa danh nổi tiếng trong lịch sử hàng hải
//Đặc biệt, khách sạn 4 sao suốt hành trình và các bữa ăn đặc sắc: thưởng thức rượu vang danh tiếng, tôm hùm …', N'NGÀY 1 : TP.HCM -  SINGAPORE - JOHANNESBURG//Quý khách tự túc tập trung tại ga đi quốc tế Tân Sơn Nhất, cùng hướng dẫn viên làm thủ tục đón đi Singapore. Nghỉ đêm trên máy bay.//NGÀY 2 : JOHANNESBURG - PRETORIA - SUN CITY//Đến sân bay Changi, nối chuyến bay đi Johannesburg. Nghỉ đêm trên máy bay. 6h sáng (giờ địa phương), máy bay đáp xuống sân bay OR Tambo. Đoàn làm thủ tục nhập cảnh. Khởi hành đến Pretoria phong cảnh hữu tình. Viếng thăm Đài tưởng niệm Voortrekker, công trình ghi dấu sự kiện người hàng ngàn người Boer (hậu duệ của những người Hà Lan) vào năm 1855 đã làm cuộc di dân về hướng Bắc. Gần đó là quảng trường Nhà Thờ - trái tim của thành phố và Union Building - nơi ở và làm việc của Tổng thống. Chiêm ngưỡng bức tượng đồng của Nelson Mandela - Tổng thống da màu đầu tiên của Nam Phi. Đoàn di chuyển đến Sun City - khu liên hợp giải trí và nghỉ dưỡng xa hoa nhất đất nước. Nhận phòng khách sạn 4 sao Soho. Khách tự do tham quan các công trình kiến trúc nguy nga, tráng lệ và tham dự các trò chơi hấp dẫn ở những khu vui chơi giải trí hoặc tham quan casino. Nghỉ đêm tại Sun City.//NGÀY 3 : SUN CITY - GOLD REEF CITY - JOHANNESBURG//Quý khách thức dậy sớm và bắt đầu ngày mới với hành trình khám phá Công viên Quốc gia Pilanesberg, một trong bốn công viên lớn nhất Nam Phi với hơn 7000 loài động vật và 360 loài chim. Đoàn ngồi xe đặc chủng xuyên qua những cảnh quan savan và nếu may mắn quý khách sẽ gặp năm ông lớn (big five) của Châu Phi: Voi, Sư Tử, Báo, Trâu và Hà Mã sống trong điều kiện tự nhiên. Khởi hành đến khu phức hợp vui chơi giải trí Gold Reef City. Tại đây, quý khách tham quan hầm mỏ và tìm hiểu câu chuyện lịch sử ngành khai thác và công nghệ chế biến quặng vàng ở Johannesburg. Trên đường đi, đoàn di chuyển ngang qua Carlton Centre – trung tâm thương mại sầm uất nhất và là tòa nhà cao nhất Nam Phi; Tòa án tối cao và trụ sở chính của Anglo American - công ty khai thác mỏ có lịch sử lâu đời lên đến 100 năm (1917 – 2017). Tiếp tục di chuyển đến nhận phòng khách sạn và nghỉ đêm tại Johannesburg.//NGÀY 4 :  JOHANNESBURG - CAPE TOWN - NÚI ĐÁ BÀN//
Trả phòng. Xe đưa đoàn ra sân bay nội địa đáp chuyến bay đi Cape Town. Tham quan Nông trại đà điểu (Cape Town Ostrich Ranch). Quý khách quay về Capte Town đi cáp treo (cable way) lên tham quan Núi Đá Bàn (Table Mountain), ngắm nhìn toàn cảnh thành phố Cape Town bên dưới. Xe đưa đoàn di chuyển ngang qua nhiều công trình nổi tiếng như Tòa nhà Quốc Hội, Lâu đài Hy vọng và công viên Company. Đoàn di chuyển đến Sea Point, vùng ngoại ô giàu có với nhiều nhà hàng, quán cà phê xinh xắn, ngắm vịnh Camp với bãi cát trắng phau, điểm xuyến những những hàng cọ dừa đung đưa. Nghỉ đêm tại Cape Town.//NGÀY 5 : CAPE TOWN - KHU BẢO TỒN THIÊN NHIÊN MŨI HẢO VỌNG//Khởi hành đi bán đảo Cape (Cape Peninsula). Ghé Vịnh Hout, lên tàu qua đảo Duiker thăm loài hải cẩu Nam Phi. Xe chạy dọc Chapman''s Peak. Thưởng thức bữa trưa với món tôm hùm. Tiếp tục hành trình đến khu Bảo tồn thiên nhiên Mũi Hảo Vọng là nơi còn lưu giữ một hệ sinh thái hoang sơ, nguyên vẹn nhất của hành tinh. Đoàn ghé tham quan bãi biển Boulders là nơi sinh sống của hơn 2000 chú chim cánh cụt châu Phi. Xe đưa đoàn đi dọc theo bờ Tây để đến với Cape Point - vùng đất cuối cùng của châu Phi. Quý khách lên đỉnh núi bằng xe điện bánh răng cưa (funicular) thăm ngọn hải đăng cổ, nơi giao nhau giữa Đại Tây Dương và Ấn Độ Dương. Nghỉ đêm tại Cape Town.//NGÀY 6 : CAPE TOWN - GROOT CONSTANTIA//Đoàn khởi hành đến Groot Constantia - nơi sản xuất rượu đầu tiên ở khu vực phía Nam Cape Town. Tiếp tục ghé tham quan cây cầu treo Treetop Canopy Walkway trong khu vườn thực vật nổi tiếng Kirstenbosch Botanical Gardens. Buổi chiều, Quý khách tự do dạo chơi tại V&A Waterfront - khu phức hợp mua sắm nhộn nhịp. Nghỉ đêm tại Cape Town.//NGÀY 7 : CAPE TOWN - SINGAPORE//Trả phòng. Ra sân bay về lại Singapore. Ăn và nghỉ trên máy bay.//NGÀY 8: SINGAPORE - TP.HCM//Chuyển tiếp chuyến bay về Tp. HCM. Kết thúc chương trình du lịch Nam Phi.', N'Hồ Chí Minh', CAST(N'2019-04-27 19:30:00.000' AS DateTime), CAST(N'2019-05-05 09:30:00.000' AS DateTime), N'8 ngày 7 đêm', N'Gold-Reef-City.jpg;Groot-Constantia.jpg;NamPhi_Table_Mountain.jpg;Seals-of-Duikers.jpg;Voortrekker-monument-in-Pretoria.jpg', 70000000, 58000000, 30, N'máy bay', N'tg004')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'AFR2', N'AFR', N'NAM PHI [JOHANNESBURG - SUN CITY - PRETORIA - CAPE TOWN]', N'Du ngoạn Nam Phi để thăm năm ông lớn (big five) của Châu Phi: Voi, Sư Tử, Báo, Trâu và Hà Mã, khám phá Johannesburg giàu có và Pretoria thanh lịch, hữu tình', N'NGÀY 1 : TP.HCM -  SINGAPORE - JOHANNESBURG//NGÀY 2 : JOHANNESBURG - PRETORIA - SUN CITY//NGÀY 3 : SUN CITY - GOLD REEF CITY - JOHANNESBURG//NGÀY 4 :  JOHANNESBURG - CAPE TOWN - NÚI ĐÁ BÀN//NGÀY 5 : CAPE TOWN - KHU BẢO TỒN THIÊN NHIÊN MŨI HẢO VỌNG//NGÀY 6 : CAPE TOWN - GROOT CONSTANTIA//NGÀY 7 : CAPE TOWN - SINGAPORE//NGÀY 8: SINGAPORE - TP.HCM', N'1', CAST(N'2019-04-27 00:00:00.000' AS DateTime), CAST(N'2019-05-05 00:00:00.000' AS DateTime), N'8 ngày 7 đêm', N'null', 69000000, 55000000, 25, N'1', N'tg002')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'AME1', N'AME', N'Hoa Kì', N'Hành trình qua những thành phố danh tiếng nhất xứ sở cờ hoa: New York - Philadelphia - Washington D.C - Las Vegas - San Diego - Los Angeles 
//Thỏa sức khám phá Bờ Đông - Bờ Tây nước Mỹ, chiêm ngưỡng những tuyệt tác kiến trúc như tượng Nữ thần Tự Do, Nhà Trắng, đài tưởng niệm Washington.... 
//Hòa mình vào không khí trường quay hoành tráng tại Universal Studios, trung tâm kinh đô điện ảnh Hollywood 
//Ghé thăm Little Saigon - nơi sinh sống của cộng đồng người Việt .Đặc biệt, tham quan San Diego - thành phố bên bờ Thái Bình Dương, mang hơi thở văn hóa của người Mexico - thế giới của đồ lưu niệm và món ăn ngon không thể bỏ lỡ', N'NGÀY 1: TP.HCM - GUANGZHOU//Tự túc tập trung tại Ga đi quốc tế Tân Sơn Nhất làm thủ tục bay đi Quảng Châu, Trung Quốc. Đến Quảng Châu, đoàn chuyển tiếp chuyến bay đi New York - trung tâm văn hóa và kinh tế của thế giới. Ăn và nghỉ trên máy bay.//NGÀY 2: GUANGZHOU - NEW YORK - NEW JERSEY//
Máy bay hạ cánh tại sân bay JFK (New York). Bắt đầu hành trình khám phá nước Mỹ. Sau bữa trưa, qúy khách tự do mua sắm tại Outlet mall. Nhận phòng khách sạn 3 sao, nghỉ đêm tại New Jersey.//NGÀY 3: NEW JERSEY - NEW YORK - CITY TOUR//Bắt đầu hành trình khám phá trái táo lớn New York. Quý khách đi thuyền ra đảo Liberty, chiêm ngưỡng các toà nhà chọc trời hùng vĩ và tham quan Tượng Nữ Thần Tự Do - nằm trên vịnh Hudson án ngữ cửa ra vào thành phố. Buổi chiều, Quý khách tham quan Đại lộ số 5 - nơi được mệnh danh là Thánh địa của ngành công nghiệp thời trang với những chuỗi cửa hàng xa hoa, Trung tâm Rockefeller - nơi đặt trụ sở của những công ty lớn ở Mỹ. Nghỉ đêm tại New Jersey.//NGÀY 4: NEW JERSEY - PHILADELPHIA - WASHINGTON D.C//Trả phòng. Đoàn khởi hành đi Philadelphia bằng đường bộ. Tham quan các di tích lịch sử: chuông Tự do, chụp hình bên ngoài Dinh Độc lập. Tiếp tục hành trình đến Washington D.C. Nhận phòng khách sạn. Nghỉ đêm tại Washington D.C.//NGÀY 5: WASHINGTON D.C – LAS VEGAS//Tham quan thủ đô Washington D.C xinh đẹp. Chiêm ngưỡng và chụp hình bên ngoài Nhà Trắng, tòa nhà Quốc hội Mỹ, đài tưởng niệm chiến tranh Việt Nam và chiến tranh Triều Tiên, Đài tưởng niệm Washington. Tham quan Bảo tàng quốc gia về lịch sử - tự nhiên, Bảo tàng hàng không và không gian quốc gia. Qúy khách ra sân bay đáp chuyến bay quốc nội đi Las Vegas - thiên đường giải trí nước Mỹ với những khách sạn và casino vĩ đại. Các bữa ăn sẽ được bố trí tùy theo tình hình chuyến bay. Nhận phòng khách sạn. Nghỉ đêm tại Las Vegas.//NGÀY 6: LAS VEGAS - ĐẬP THỦY ĐIỆN HOOVER //Tham quan đập Hoover hùng vĩ và ngắm hồ nước nhân tạo Mead xanh rì. Trở về Las Vegas, ghé mua sắm hàng hiệu tại Premium Outlet Mall . Xe đưa đoàn chạy dọc theo trục đường nhộn nhịp của Las Vegas để ngắm nhìn “The Strip” - con đường dài hơn 6km tập trung những khách sạn và casino nổi tiếng và sang trọng bậc nhất Nghỉ đêm tại Las Vegas.//NGÀY 7: LAS VEGAS - LOS ANGELES (Ăn sáng, trưa, tối)//Trả phòng. Đoàn chia tay Las Vegas và khởi hành đi Los Angeles bằng đường bộ. Qúy khách ăn trưa tại chuỗi siêu thị Barstow nằm ở phía Tây hoang mạc Mojave. Đến Los Angeles, quý khách tự do tham quan và dạo chơi khu Little Saigon để tìm hiểu về cuộc sống của cộng đồng người Việt tại Mỹ. Nhận phòng khách sạn. Nghỉ đêm tại Los Angeles.//NGÀY 8: LOS ANGELES - SAN DIEGO - LOS ANGELES//Khởi hành đi San Diego. Dạo bộ tại phố cổ San Diego duyên dáng còn lưu giữ nhiều công trình xưa mang kiến trúc Châu Âu và hàng quán lưu niệm sinh động đậm hơi thở văn hóa Mexico; tham quan công viên Balboa, chụp hình bên ngoài chiến hạm USS Midway. Về lại Los Angeles nghỉ đêm.//NGÀY 9: LOS ANGELES - UNIVERSAL STUDIOS HOLLYWOOD – GUANGZHOU//Trả phòng. Khám phá Universal Studios - trường quay các bộ phim nổi tiếng của điện ảnh thế giới như King Kong, Công viên Khủng long… Quý khách còn có dịp được tận mắt chứng kiến các kỹ xảo âm thanh, khói lửa và nước trong các cảnh quay động đất, mưa, nước lũ và cháy nổ. Tham quan trung tâm kinh đô điện ảnh Hollywood, tản bộ trên con đường danh vọng Hollywood Boulevard - nơi in tên các tài tử nghệ sĩ điện ảnh như Marilyn Monroe, Michael Jackson. Dừng chân tại nhà hát Chinese Mann’s Theatre - nơi in dấu tay của các diễn viên điện ảnh nổi tiếng. Xe đưa đoàn ra sân bay về Quảng Châu.//NGÀY 10: NGHỈ NGƠI TRÊN CHUYẾN BAY//NGÀY 11: GUANGZHOU - TP. HCM//Đến sân bay Quảng Châu lúc 05g40, đoàn làm thủ tục nối chuyến bay về Tp.Hồ Chí Minh. Máy bay đáp xuống sân bay Tân Sơn Nhất lúc 11g00. Kết thúc chương trình tour du lịch Mỹ.', N'Hồ Chí Minh', CAST(N'2019-04-23 15:00:00.000' AS DateTime), CAST(N'2019-05-04 13:30:00.000' AS DateTime), N'11 ngày 10 đêm', N'Charging-Bull-in-Lower-Manhattan.jpg;Balboa-park.jpg;Hollywood-Boulevard.jpg;Liberty-Bell---Philadelphia.jpg;Liberty-Island.jpg;The-Strip.jpg;Washington-Monument.jpg', 86000000, 84990000, 25, N'máy bay', N'tg010')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'AME2', N'AME', N'Hoa Kì', N'Khám phá Bờ Đông nước Mỹ chứa đựng vô vàn thú vị với mức giá siêu tiết kiệm. 
// Thỏa sức mua sắm và chiêm ngắm vẻ đẹp hoa lệ kiểu Mỹ trên mọi góc phố, dạo bước trên Đại lộ số 5 - mệnh danh Thánh địa ngành công nghiệp thời trang với những chuỗi cửa hàng xa hoa của New York.
//Chiêm ngưỡng những tuyệt tác kiến trúc: tượng Nữ thần Tự do, Nhà Trắng, Tòa nhà Quốc hội.... và ngỡ ngàng trước hệ thống Bảo tàng về Lịch sử - Tự nhiên nổi danh thế giới.', N'NGÀY 1: TP.HCM – HONGKONG – NEW YORK
//Tự túc tập trung tại lầu 2 - Ga đi quốc tế sân bay Tân Sơn Nhất, làm thủ tục đáp chuyến bay CX766 (11:15 - 15:00) đi Hongkong. Làm thủ tục nối tiếp chuyến bay CX846 (18:55 - 22:35) đi New York . Máy bay hạ cánh tại sân bay JFK (New York ) lúc 22:35 tối cùng ngày (giờ địa phương). Nghỉ đêm tại New Jersey.
//NGÀY 2: NEW JERSEY - NEW YORK - CITY TOUR (Ăn sáng, trưa, tối)
//Bắt đầu hành trình khám phá trái táo lớn New York. Tham quan phố Tài chính Wall . Đi thuyền ra đảo Liberty, ngắm nhìn các toà nhà chọc trời hùng vĩ và tham quan Tượng Nữ Thần Tự Do - nằm trên vịnh Hudson án ngữ cửa ra vào thành phố New York. Chiều tham quan Đại lộ số 5 - nơi được mệnh danh là Thánh địa của ngành công nghiệp thời trang với những chuỗi cửa hàng xa hoa, Trung tâm Rockefeller - nơi đặt trụ sở của những công ty lớn ở Mỹ, Quảng trường thời đại (Times Square) náo nhiệt. Nghỉ đêm tại New Jersey.
//NGÀY 3: WASHINGTON DC - PHILADELPHIA – NEW JERSEY (Ăn sáng, trưa, tối)
//Trả phòng. Khởi hành đi Philadelphia. Dừng chân mua sắm tại Delware . Đến Philadelphia, đoàn tham quan di tích lịch sử: chuông Tự do (Liberty Bell), chụp hình bên ngoài Dinh Độc lập (Independence Hall). Tiếp tục hành trình đến với thủ đô Washington DC. Nghỉ đêm tại Washington DC.
//NGÀY 4: WASHINGTON DC  CITY TOUR (Ăn sáng, trưa, tối)
//Bắt đầu hành trình tham quan thủ đô nước Mỹ : chiêm ngưỡng bên ngoài Nhà Trắng, tòa nhà Quốc hội Mỹ, đài tưởng niệm chiến tranh Việt Nam và chiến tranh Triều Tiên, đài tưởng niệm Washington. Quý khách có dịp ngắm nhìn hoa anh đào nở rực rỡ. Tham quan Bảo tàng quốc gia về lịch sử - tự nhiên và Bảo tàng hàng không và không gian quốc gia. Nghỉ đêm tại Washington DC.
//NGÀY 5: WASHINGTON DC- HONGKONG (Ăn sáng, trưa, tối)
//Trả phòng. Xe đón quý khách đến trung tâm thương mại. Tự do trải nghiệm mua sắm và dạo phố. Xe đón đoàn ra sân bay New York đáp chuyến bay rạng sáng hôm sau CX869 (01:20 - 05:15+1) trở về Hongkong. Ăn tối và nghỉ đêm trên máy bay.
//NGÀY 6: NGHỈ NGƠI TRÊN MÁY BAY
//NGÀY 7: HONGKONG – TP.HCM
//Đến sân bay Hongkong, làm thủ tục nối chuyến bay CX767 (08:35 – 10:15) về Tp. HCM. Máy bay đáp xuống sân bay Tân Sơn Nhất lúc 10:15.  Kết thúc chương trình tour Mỹ bờ Đông.', N'Hồ Chí Minh', CAST(N'2019-03-28 11:00:00.000' AS DateTime), CAST(N'2019-04-03 11:30:00.000' AS DateTime), N'6 ngày 5 đêm', N'Independence-Hall-Philadelphia_276721367.jpg;Liberty-Harbor_488211028.jpg;Wahington_212236582.jpg', 55000000, 44000000, 25, N'máy bay', N'tg001')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'ASIA1', N'ASIA', N'Lào - Campuchia - Thái Lan', N'Một hành trình có thể đi đến 3 nước trong khu vực Đông Dương //Tham quan thác Khone Phapheng được nhiều người biết đến như một Niagara của Lào.//Ghé thăm Điện thờ Hoàng Gia tại Đông Bắc Thái Lan.', N'NGÀY 01: TP. HỒ CHÍ MINH – BÌNH DƯƠNG – HOA LƯ – KRATIE (Ăn sáng, trưa, chiều)//Đón đoàn tại văn phòng Saigontourist, khởi hành đi Campuchia theo quốc lộ 13, dùng điểm tâm tại Bình Dương. Đến cửa khẩu Hoa Lư làm thủ tục xuất cảnh Việt Nam, nhập cảnh Campuchia. Dùng cơm trưa tại thị trấn Kratie và nhận phòng khách sạn nghỉ ngơi. Buổi chiều, đoàn tham quan Cá Heo nước ngọt trên sông Mekong, loài cá nằm trong danh sách đỏ cần được bảo vệ của Hiệp Hội Bảo Vệ Động Vật Thế Giới. Nghỉ đêm tại Kratie.//NGÀY 02: KRATIE – PAKSE (Ăn sáng, trưa, chiều)//Đoàn trả phòng, khởi hành đi Pakse (Thủ phủ Nam Lào, miền cao Boloven). Đến cửa khẩu Domclo – Noong Nooch Khiến làm thủ tục xuất cảnh Campuchia, nhập cảnh Lào. Xe đưa đoàn tham quan thác Khone Phapheng – khúc gãy của dòng song Mekong mà mọi phương triện giao thông đều không thể đi qua được. Tiếp tục hành trình đến Thành phố Pakse – Thủ phủ Nam Lào. //Đến Pakse, đoàn vãng cảnh Chùa núi Samileau, ngắm cảnh sông Mekong và thành phố Pakse từ Điện Tam Bảo. Tiếp tục viếng chùa Wat Luông – ngôi chùa cổ & lớn nhất thành phố Pakse, đây là nơi học đạo của các Tăng sư Phật Giáo của miền Hạ Lào. Nhận phòng & tự do khám phá Pakse về đêm. Nghỉ đêm tại Pakse.//NGÀY 03: PAKSE – UBON RATCHATHANI (Ăn sáng, trưa, chiều)//Xe đưa đoàn đi tham quan Di sản văn hoá Thế giới chùa Wat Phou – ngôi đền cổ nhất ở Lào được xây dụng từ thời kỳ tiền Angkor (thế kỷ thứ VI) và từng là trung tâm thờ thần Siva của đạo Hindu. Đoàn tiếp tục tham quan thác Tat Nhương – thác nước nằm trên miền cao nguyên Boloven và tìm hiểu đời sống văn hoá của các dân tộc thiểu số vùng Hạ Lào (Nam Lào).//Đoàn xuất phát đến Vương quốc Thái Lan qua cửa khẩu Vangtao – Chongmek. Trên đường, đoàn trải nghiệm về dòng sông hai màu, viếng Chùa Nong Bua và tiếp tục tham quan điện thờ Hoàng Gia được xây dựng vào giữa thế kỷ thứ XVIII nơi có tượng Phật tạc theo tượng Phật vàng ở Bangkok. Sau đó, đoàn tham quan & mua sắm tại các trung tâm thương mại lớn của Thành phố Ubon như: BigC, Robinson, … Dùng cơm tối với món xôi gà nướng mang đậm văn hoá ẩm thực người dân Lào – Đông Bắc Thái Lan. Nhận phòng khách sạn & nghỉ đêm tại thành phố Ubon Ratchathani (thủ phủ miền Đông Bắc Thái Lan).//NGÀY 04: UBON RATCHATHANI – PAKSE - STUNGTRENG (Ăn sáng, trưa, chiều)//Đoàn tham quan Công viên Thành phố Thung Si Mương – nơi có ngôi chùa cổ mang đậm kiến trúc miền Đông Bắc Thái Lan. Tiếp tục tham quan khu phố người Việt (Vietnam Town) tại Ubon Ratchathani – tỉnh cực Đông của Thái Lan giáp Lào & Campuchia, nơi người Việt Nam có mặt từ cuối thế Kỷ thứ XVIII; đây cũng là nơi có Chùa Liên Hiệp Quốc với nhiều ngôi chùa đại diện cho nhiều quốc gia kể cả Việt Nam.//Sau đó, đoàn xuất phát trở lại Hạ Lào dùng cơm trưa và tham quan mua sắm tại Trung tâm thương mại DaoHuong – khu mua sắm của một Việt Kiều làm ăn thành đạt trên đất Lào. Đoàn ra cửa khẩu Lào – Campuchia làm thủ tục trở về Campuchia. Chiều đến thủ phủ tỉnh StungTreng nhận phòng khách sạn và nghỉ đêm tại StungTreng.//NGÀY 05: STUNGTRENG – KRATIE – HOA LƯ – TPHCM  (Ăn sáng, trưa)//Đoàn trả phòng, khởi hành về Việt Nam theo quốc lộ 13. Đến cửa khẩu Hoa Lư làm thủ tục xuất cảnh Campuchia, nhập cảnh Việt Nam. Xe đưa du khách về TPHCM, kết thúc chuyến tham quan.', N'Hồ Chí Minh', CAST(N'2019-03-06 09:00:00.000' AS DateTime), CAST(N'2019-03-11 14:00:00.000' AS DateTime), N'5 ngày 4 đêm', N'21504.jpg;download.jpg;laos.jpg', 8867000, 6666000, 30, N'máy bay + xe du lịch', N'tg006')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'ASIA2', N'ASIA', N'HongKong', N'Chiêm ngưỡng danh lam thắng cảnh nổi tiếng của Hongkong//Cơ hội shopping tại thiên đường mua sắm (tại Harbour City, Cantoon Road hay dãy phố Upper Lascar - nơi các cửa tiệm và quầy hàng của thành phố bày bán nhiều loại sản phẩm tinh xảo nhất thế giới...)', N'GÀY 1: HÀ NỘI - HONG KONG (Ăn Tối)//07h30: Đón Quý khách tại 55B Phan Chu Trinh đưa đoàn ra sân bay Nội Bài đáp chuyến bay VN 592 (10:35 - 13:30) đi Hong Kong. Tới Hongkong, tham quan Cầu treo Đại Thanh Mã - Cầu treo đẹp nhất Châu Á và lớn thứ 7 thế giới, được xây năm 1997 nối liền hai hòn đảo quan trọng của Hong Kong. Tự do khám phá chợ Qúy Bà. Nghỉ đêm tại Hong Kong.//NGÀY 2 : HONG KONG (Ăn sáng, Trưa, Tối)//Tham quan núi Thái Bình - đây là điểm cao nhất của Hồng Kông, có thể phóng tầm mắt ngắm nhìn những tòa nhà chọc trời và cảng Victoria với con đường dẫn tới những ngọn đồi xanh của New Territories, tham quan Quảng trường Bauhinia - nơi diễn ra lễ trao trả Hồng Kông về cho Trung Quốc (năm 1997). Tham quan Vịnh Nước Cạn, Miếu Thần Tài, Miếu Huỳnh Đại Tiên, Avenue Garden, tham quan Thiền Viện Chí Liên - được xây dựng độc đáo với toàn bộ công trình bằng gỗ không dùng một cây đinh nào để xâu kết các mối nối với nhau theo kiến trúc đời Đường, tham quan Vườn Nam Liên mang nét kiến trúc Nhật Bản nổi bật với một ngôi đền hình bát giác tọa lạc trên một hồ nước nhỏ với màu vàng óng ánh với hàng ngàn cây bonsai các loại. Tham quan và mua sắm tại trung tâm vàng bạc đá quý, cửa hàng miễn thuế. Nghỉ đêm tại khách sạn.//NGÀY 3 : THIÊN ĐƯỜNG MUA SẮM (Ăn sáng)//Tự do trải nghiệm thiên đường mua sắm (Quý khách tự túc bữa trưa & tối, phương tiện đi lại, … Hướng dẫn viên của Saigontourist sẽ hỗ trợ tư vấn thông tin cho đoàn). Đoàn nghỉ đêm tại khách sạn trung tâm tại Hong Kong.//NGÀY 4 : HONG KONG – HÀ NỘI (Ăn sáng)//Tự do sinh hoạt buổi sáng sau đó đoàn trả phòng. Xe đưa đón đoàn ra sân bay Chek Lap Kok làm thủ tục cho chuyến bay VN593 (14:30 - 15:30) về lại Hà Nội. Xe Saigontourist đón khách tại sân bay và đưa về điểm hẹn ban đầu. Kết thúc chương trình.

', N'Hà Nội', CAST(N'2019-03-23 00:00:00.000' AS DateTime), CAST(N'2019-03-27 09:00:00.000' AS DateTime), N'4 ngày 3 đêm', N'dc_150814_Hongkong.jpg;Golden-Bauhinia-Square_328018754.jpg', 13990000, 10390000, 30, N'máy bay', N'tg007')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'ASIA3', N'ASIA', N'Nhật Bản', N'Hiện thực hóa ước mơ khám phá cảnh đẹp và văn hóa đặc sắc Nhật Bản với thủ tục visa thuận lợi, nhanh chóng hơn bao giờ hết.
//Thưởng lãm một Tokyo hiện đại nhưng vẫn đầy cảm xúc bên sắc hoa anh đào lãng mạn tại công viên Ueno hay chiêm ngưỡng núi Phú Sĩ hùng vĩ - biểu tượng của xứ Phù Tang. //Viếng chùa thiêng Kinkakuji, chùa Quan Âm Asakusa... đẫm không khí thiền tịnh.//Tham quan lâu đài Osaka, lâu đài Nagoya và thỏa sức mua sắm các mặt hàng nội địa Nhật Bản.', N'TỐI NGÀY KHỞI HÀNH: TP.HCM - TOKYO//
Tập trung tại Ga đi Quốc Tế - sân bay quốc tế Tân Sơn Nhất để làm thủ tục chuyến bay VN300 (00:25-07:45) đi Tokyo. Ăn nhẹ và nghỉ đêm trên máy bay.//

NGÀY 1: TOKYO (Ăn trưa, tối)//
07:45 sáng đến sân bay Narita. Tham quan (chụp hình) tại Công viên Ueno - với hơn 1.000 cây hoa anh đào dọc theo con đường trung tâm, đây là một trong những điểm phổ biến nhất dành cho du khách thưởng ngoạn hoa anh đào hằng năm. Tham quan và mua sắm tại Khu phố Ueno Ameyoko. Tham quan Chùa Quan Âm Asakusa - một trong những công trình cổ nhất và nổi tiếng tại Tokyo. Chụp hình (bên dưới) Tháp Tokyo Skytree. Tham quan và chụp hình (bên ngoài) Cung điện Hoàng Gia. Nghỉ đêm.//
NGÀY 2: TOKYO - HAKONE (Ăn sáng, trưa, tối)//
Trả phòng. Khởi hành lên lên trạm số 5 (tùy theo điều kiện thời tiết cho phép) tham quan và chụp hình với Núi Phú Sỹ (ngọn núi cao nhất Nhật Bản 3.776m và là biểu tượng của Nhật). Tham quan Vườn trái cây, thưởng thức và mua về làm quà cho người thân các loại trái cây theo mùa tại Vườn. Tham quan Làng cổ Oshino Hakkai với vẻ đẹp thanh bình, những món ăn địa phương lạ mắt và quý khách cũng có thể ngắm nhìn núi Phú Sỹ ngay từ trong làng. Tự do mua sắm tại Gotemba Premium Outlet. Nghỉ đêm.//
NGÀY 3: NÚI PHÚ SỸ - NAGOYA (Ăn sáng, trưa, tối)//
Trả phòng. Trải nghiệm tàu tốc hành Shinkansen. Tham quan Lâu đài Nagoya, một trong những địa điểm ngắm hoa anh đào nổi tiếng tại Nhật. Nếu kịp thời gian tự do mua sắm tại Aeon Mall. Nghỉ đêm.//
NGÀY 4: NAGOYA - OSAKA (Ăn sáng, trưa, tối)//
Trả phòng. Tham quan Cầu Togetsu dài 155m, cây cầu tồn tại như một biểu tượng của núi Arashiyama với cảnh sắc phong phú theo từng mùa. Tham quan rừng tre Sagano, thưởng thức vẻ đẹp thiên nhiên của rừng tre. Tham quan, ngắm cảnh đường phố Kyoto trong trang phục Kimono. Tham quan Chùa Kinkakuji nằm nổi bật trên mặt nền hồ nước trong xanh. Nghỉ đêm.//
NGÀY 5: OSAKA - NARA (Ăn sáng, trưa, tối)//
Trả phòng. Tham quan (bên ngoài) Lâu đài Osaka. Tự do mua sắm tại khu thương mại Shinsaibashi. Đi Nara, tham quan Công viên Nara - thưởng ngoạn quanh cảnh thiên nhiên, đặc biệt công viên còn có rất nhiều Hươu sinh sống tự do tại đây. Tham quan Đền Todaiji một trong những ngôi đền lâu đời và nổi tiếng bậc nhất tại Nhật Bản. Nghỉ đêm khách sạn 4 sao.//
NGÀY 6: OSAKA - TP.HCM (Ăn sáng)//
Trả phòng. Ra sân bay, làm thủ tục đáp chuyến bay VN321 (10:30-14:30) về Tp. HCM. Kết thúc chương trình du lịch Nhật Bản.', N'Hồ Chí Minh', CAST(N'2019-04-03 22:00:00.000' AS DateTime), CAST(N'2019-04-09 15:00:00.000' AS DateTime), N'6 ngày 5 đêm', N'Oshino-Hakkai_646775065.jpg;Sagano_763721149.jpg;Shinkansen_269298080.jpg;Todaiji_Nara_1089529325.jpg;Ueno_Park_268605965.jpg', 50290000, 39780000, 30, N'máy bay', N'tg008')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'ASIA4', N'ASIA', N'Malaysia - Singapore', N'Cơ hội làm quen với phương thức du lịch đặc biệt “Fly - Cruise” (Hàng không 5 sao Singapore kết hợp Du thuyền 5 sao Voyager Of The Seas). //Tận hưởng khoảnh khắc giải trí tuyệt vời cùng dịch vụ đẳng cấp, hiện đại, tiện nghi bậc nhất trên du thuyền. //Trải nghiệm khác biệt: vượt đại dương khám phá đảo quốc Sư tử Singapore, nền văn hóa đa dạng của thủ đô Kuala Lumpur- Malaysia, dạo bước tại thành phố cổ kính Malacca – Venice của Châu Á', N'Ngày 1: TP.HCM (VIỆT NAM) - SINGAPORE (Ăn tối)//
Tập trung tại cổng D2 ga đi quốc tế - sân bay Tân Sơn Nhất làm thủ tục trên chuyến bay SQ177 (12:30-15:30) đi Singapore. Ăn tối. Tự do khám phá Singapore về đêm. Nghỉ đêm tại khách sạn 4 sao tại Singapore.//

Ngày 2: SINGAPORE - VOYAGER OF THE SEAS (Ăn trưa và ăn tối trên du thuyền)//
Trả phòng, xe và hướng dẫn viên sẽ đưa đoàn tham quan một vòng thành phố Singapore. Du khách sẽ chiêm ngưỡng tượng Sư Tử Biển - biểu tượng của Singapore được đặt tại cửa sông (khánh thành ngày 15/09/1972), chụp hình lưu niệm với nhà hát “Victoria” và toà nhà Quốc Hội, Bồn nước phồn thịnh (Fountain of Wealth), tham quan và chụp hình tại Khu vườn năng lượng (Gardens by the Bay) - khu vườn sinh thái đặc biệt với các “siêu cây” năng lượng mặt trời ở phía nam Singapore với vẻ đẹp kỳ thú lạ thường. Quý khách sẽ được tham quan Flower Dome, một vườn hoa phong phú được trưng bày trong nhà kính theo phong cách hiện đại lạ mắt. Mua sắm tại Cửa hàng bán Dầu (đặc sản địa phương). Xe đưa đoàn ra bến tàu Mariner Bay Cruise Centre để làm thủ tục lên tàu trước 15:00 (giờ Singapore). Đúng 17:00 (giờ Singapore) tàu rời bến hướng đến Malaysia, bắt đầu chuyến hải trình 3 đêm trên du thuyền sang trọng Voyager of the Seas. Quý khách nhận phòng nghỉ tiện nghi và thưởng thức món ăn tại nhà hàng chính hoặc buffet tại Windjamer. Quý khách hãy bắt đầu làm quen và khám phá con tàu sang trọng này, thỏa sức chọn các hoạt động vui chơi giải trí phù hợp cho mình theo tờ lịch trình đã được chuẩn bị chu đáo và mang đến từng phòng.//
Ngày 3: SINGAPORE - KUALA LUMPUR (PORT KLANG) (Ăn trưa, Ăn sáng và tối trên du thuyền)//
Quý khách có thể dậy sớm để ngắm bình minh, hít thở không khí trong lành và thanh bình của đại dương từ tầng 12 của tàu, hoặc cho phép mình ngủ muộn hơn và thức dậy với bữa điểm tâm sáng tại nhà hàng Windjamer. 08:00 tàu cập cảng Port Klang - Malaysia. 08:30 khám phá thành phố Kuala Lumpur, cách Port Klang 45km. Kuala Lumpur vẫn ấn tượng với tháp đôi Petronas hiện đại và lộng lẫy; đầy hấp dẫn với khu mua sắm sầm uất Bukit Bintang; và hài hòa bởi phong vị của sự pha trộn lịch sử và kiến trúc với quảng trường Độc Lập, Tòa Thị Chính, Đài kỷ niệm quốc gia. Ăn trưa tại nhà hàng địa phương. Đoàn trở lại du thuyền trước 16:00.  Đúng 19:00 tàu rời cảng Port Klang tiếp tục hành trình. Tận hưởng hàng loạt các chương trình và tiện ích hấp dẫn trên tàu: xem phim, thưởng thức ca nhạc tại Savoy Theater, hoặc tham gia các màn trình diễn, hòa mình cùng các game show giao lưu với du khách trên tàu. Ăn tối và nghỉ đêm trên tàu.//
Ngày 4: KUALA LUMPUR (PORT KLANG) - MALACCA (Ăn trưa, Ăn sáng và tối trên du thuyền)//
8:00 tàu cập cảng Malacca-Malaysia. 08:30 xe đón đoàn bắt đầu chuyến hành trình khám phá thành phố cổ Malacca - nơi được mệnh danh là “Venice châu Á”. Tận hưởng bầu không khí yên bình tại Jonker Walk, chụp hình lưu niệm tại quảng trường Hà Lan - điểm nhấn của Malacca với những khối nhà nổi bật với gam màu cam đậm. Tham quan nhà thờ St. Paul’s, đền thờ của Khổng giáo Cheng Hoon Teng Temple , khu cảng biển Santa De Santiago - một trong những cảng lớn và giao lưu quan trọng của 3 nước Malaysia-Singapore-Indonesia. Sau bữa trưa, đoàn mua sắm tại Freeport A’Farmosa Outlet (nếu thời gian cho phép). Đoàn trở lại du thuyền trước 17:00.  Đúng 19:00 tàu rời cảng Malacca tiếp tục hành trình quay về Singapore. Quý khách hoàn toàn có thể tận hưởng những đêm nhạc hội hoành tráng được dàn dựng công phu với trải nghiệm cùng  Dreamworks. Hoặc cùng nhảy múa với Sherk, ăn tối với Kung Fu Panda hay chơi đùa cùng biệt đội Madagascar siêu đáng yêu sẽ giúp các bé có những trận cười sảng khoái và cảm xúc bùng nổ trong chuyến nghỉ mát của mình. Nghỉ đêm trên du thuyền//
Ngày 5: SINGAPORE (Ăn sáng)//
Quý khách dùng điểm tâm sáng trên tàu. 08:00 Tàu cập cảng Singapore, Quý khách làm thủ tục rời tàu và nhập cảnh Singapore. Ra sân bay Changi làm thủ tục đáp chuyến bay SQ184 (13:30-14:40) về Tp.HCM. Kết thúc chương trình', N'Hồ Chí Minh', CAST(N'2019-04-29 12:00:00.000' AS DateTime), CAST(N'2019-05-04 16:00:00.000' AS DateTime), N'5 ngày 4 đêm', N'Cheng-Hoon-Teng_174355091.jpg;Kuala-Lumpur-Petronas_549783202.jpg;Merlion-Park.jpg', 24990000, 22790000, 30, N'máy bay + du thuyền', N'tg006')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'ASIA5', N'ASIA', N'Hàn Quốc', N'Cảm nhận không gian thi vị của những công trình kiến trúc đẹp cổ kính như Cố cung, Dinh Tổng Thống tại Seoul hay thả hồn vào những tán cây ngân hạnh xanh mướt trên hòn đảo Nami xinh đẹp.
//Thưởng thức cảnh đẹp hùng vĩ của núi và biển tại Seongsan, nơi được Unesco công nhận là di sản thiên nhiên của Thế giới.', N'NGÀY 1: TP.HCM - SEOUL - ĐẢO JEJU (Ăn tối)//
Tập trung tại Ga đi quốc tế - sân bay Quốc tế Tân Sơn Nhất, làm thủ tục đáp chuyến bay KE686 (08:25 - 15:15) đi Seoul. Di chuyển sang sân bay nội địa Gimpo nối chuyến bay sang đảo Jeju, KE1231 (18:40 - 19:50). Nghỉ đêm tại Jeju.//

NGÀY 2:  ĐẢO JEJU - CHERRY BLOSSOM (Ăn sáng, trưa, tối)//
Ngắm cảnh trên đỉnh Seongsan nằm ở phía đông của đảo Jeju, được UNESCO công nhận là di sản thiên nhiên của thế giới. Tham quan Làng dân tộc Seongeup với rất nhiều văn hóa đặc trưng của Xứ sở Kim chi được lưu giữ và bảo tồn tại đây. Di chuyển đến điểm ngắm hoa anh đào (Cherry Blossom).Tham quan Con đường bí ẩn, Công viên Loveland. Nghỉ đêm tại Jeju.//
NGÀY 3:  ĐẢO JEJU - SEOUL (Ăn sáng, trưa, tối)//
Trả phòng. Tham quan Mỏm đá đầu rồng. Ra sân bay làm thủ tục đáp chuyến bay về Seoul.
Tham quan Cố Cung Gyeongbokgung được xây dựng vào cuối những năm 1300 và là cung điện nổi tiếng nhất tại Hàn Quốc, Bảo tàng dân tộc, dừng chân và chụp hình (bên ngoài) Dinh Tổng Thống (Blue House). Mua sắm tại Cửa hàng nhân sâm và Cửa hàng mỹ phẩm. Nghỉ đêm tại Seoul.//
NGÀY 4:  SEOUL - NAMI (Ăn sáng, trưa, tối)//
Tham quan Đảo Nami - nơi quay bộ phim nổi tiếng “Bản tình ca mùa Đông”, dạo chơi trong công viên rộng lớn trên đảo dưới những hàng cây thủy sam muôn màu muôn vẻ, cảm giác nhẹ nhàng và thơ mộng. Quý khách được hướng dẫn cách làm Kim chi và mặc trang phục truyền thống Hanbok. Tham quan Tháp N Seoul (quý khách tự túc vé lên tháp). Mua sắm tại Cửa hàng sâm tươi và Cửa hàng thảo dược. Nghỉ đêm tại Seoul.//
NGÀY 5: SEOUL - TP.HCM (Ăn sáng, trưa)//
Trả phòng. Tham quan Quãng trường Gwanghwamun và Suối nhân tạo Cheonggyecheon. Quý khách có cơ hội trải nghiệm các hoạt động trong chương trình truyền hình thực tế Running Man Experience của đài SBS. Mua sắm tại Cửa hàng miễn thuế và Siêu thị. Ra sân bay làm thủ tục đáp chuyến bay KE685 (19:05 - 22:45) về Tp.HCM. Kết thúc chương trình du lịch Hàn Quốc.

', N'Hồ Chí Minh', CAST(N'2019-03-28 18:00:00.000' AS DateTime), CAST(N'2019-04-02 17:30:00.000' AS DateTime), N'5 ngày 4 đêm', N'Gwanghwamun-square_679945114.jpg;Nami-island_189910265.jpg;Seongeup-Folk-Village_360518894.jpg;Yongduam-Rock-Dragon-Head-Rock-in-Jeju-island-Korea_542418949.jpg', 27990000, 20990000, 30, N'máy bay', N'tg007')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'AUS1', N'AUS', N'Úc', N'Cơ hội hưởng giá tour tiết kiệm đặc biệt tham quan xứ sở chuột túi, đảm bảo chất lượng dịch vụ theo tiêu chuẩn Saigontourist. 
//Du ngoạn ngắm nhìn các biểu tượng của nước Úc: Nhà hát con sò, cầu cảng Sydney … ngỡ ngàng trước bảo tàng Hải dương học Sydney.', N'NGÀY 1: TP.HCM - SYDNEY (Ăn nhẹ trên máy bay)//
Quý khách tập trung tại lầu 2 Ga đi quốc tế - sân bay quốc tế Tân Sơn Nhất, cùng hướng dẫn viên Saigontourist làm thủ tục đáp chuyến bay VN773 (21:20 – 09:50)+1 đi Sydney. Ăn nhẹ và nghỉ đêm trên máy bay.//

NGÀY 2: KHÁM PHÁ SYDNEY (Ăn trưa, tối)//
Khám phá Công viên Hyde Park, nhà thờ St Mary, Chiếc ghế của Bà Macquarie (Mrs. Macquarie''s Chair) - nơi ghi dấu quyền thống trị của nữ hoàng Elizabeth, chụp hình bên ngoài Trung tâm triển lãm nghệ thuật New South Wales. Buổi chiều, Quý khách tham quan dạo chơi tại Cảng Darling - "Bến cảng tình yêu" nổi tiếng dành cho các cặp tình nhân, ngắm nhìn và chụp hình với Nhà hát Con Sò trứ danh cùng Cầu cảng Sydney - tuyệt tác kĩ thuật băng ngang cảng. Nghỉ đêm tại Sydney.//
NGÀY 3: SYDNEY - BLUE MOUNTAINS - SYDNEY (Ăn sáng, trưa, tối)//
Tham quan Vườn quốc gia Blue Mountains - vùng đất trước kia thuộc các bộ tộc thổ dân Úc. Đi cáp treo qua thung lũng, ngắm những thác nước trắng xóa nổi bật trong sắc xanh thiên nhiên hùng vĩ và ngồi xe điện xuống thung lũng Jamison khám phá hệ thực vật còn nguyên sơ tại đây. Về lại Sydney nghỉ đêm.//
NGÀY 4: SYDNEY - VƯỜN TRÁI CÂY (Ăn sáng, trưa, tối)//
Đoàn di chuyển đến tham quan Vườn trái cây. Quý khách tự tay thu hoạch và thưởng thức trái cây tươi ngon theo mùa giữa thiên nhiên trong lành (chi phí tự túc). Xe đưa đoàn quay về Sydney tham quan Bảo tàng hải dương học - Sydney Aquarium một trong những bể cá nhân tạo lớn nhất thế giới và là nơi sinh sống của hơn 6.000 loài động vật biển đặc trưng của nước Úc. Tự do mua sắm tại trung tâm thương mại. Nghỉ đêm tại Sydney.//
NGÀY 5: SYDNEY TP.HCM (Ăn sáng, ăn nhẹ trên máy bay)//
Trả phòng. Ra sân bay, đáp chuyến bay VN772 (11:50-16:15) về Tp.HCM. Kết thúc chương trình tham quan du lịch nước Úc.
', N'Hồ Chí Minh', CAST(N'2019-06-06 21:00:00.000' AS DateTime), CAST(N'2019-06-11 13:15:00.000' AS DateTime), N'5 ngày 4 đêm', N'Blue-Mountains-National-Park_5327707.jpg;Hyde-Park-Sydney-Australia_607651664.jpg;Southern-Ocean-and-Antarctic-aquarium-in-central-Melbourne_321209363.jpg', 38000000, 28000000, 30, N'máy bay', N'tg002')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'AUS2', N'AUS', N'Úc', N'Khám phá vườn thực vật Fitzroy Garden quang cảnh nên thơ với nghệ thuật trồng hoa và làm vườn chuyên nghiệp
//Chiêm ngưỡng thủy cung Melbourne
//Tham quan biểu tượng của Sydney: Nhà hát Sydney Opera nổi tiếng với kiến trúc con sò
//Khám phá di sản thiên nhiên Blue mountain', N'Ngày 1: HÀ NỘI - MELBOURNE//
14h00: Đón Quý khách tại 55B Phan Chu Trinh đưa đoàn ra sân bay Nội Bài đáp chuyến bay VN259(17:00-19:20)//VN781(21:30- 08:35) đi Melbourne, quá cảnh tại sân bay Tân Sơn Nhất. Quý khách ăn tối và nghỉ đêm trên máy bay.//

Ngày 2: MELBOURNE (Ăn trưa, tối)//
Tham quan thành phố Melbourne: Nhà thờ thánh Patrick - ngôi nhà thờ cổ được xây dựng vào thế kỷ 19 với kiến trúc Gothic đặc trưng, đài tưởng niệm, tòa thị chính, thưởng thức cảnh đẹp của vườn hoa Fitzroy - Khu vườn có hồ nước trong xanh, những cửa hàng và quán cà phê xinh xắn, những ngôi nhà kính trồng cây độc đáo, đài phun nước, những tác phẩm điêu khắc ấn tượng… nhà của thuyền trưởng James Cook, tham quan Vườn Bách Thảo (Botanic Garden) - vườn thực vật được mở cửa từ năm 1816 với diện tích 30 hectares, tham quan Thủy Cung Melbourne được xây dựng vào tháng 2/1998 và hoàn thành vào 12/1999, được thiết kế có hình dạng như một cây cầu bởi kiến trúc sư Peddle Thorp. Tòa nhà này nằm dưới 7 m so với mực nước biển. Quý khách mua sắm tại các trung tâm thương mại lớn tại Melbourne. Nghỉ đêm tại khách sạn. //
Ngày 3: MELBOURNE - DANDENONG - YARRA VALLEY (Ăn sáng, trưa, tối)    //
Thăm khu rừng già nguyên sinh Dandenong với những cây cổ thụ hàng ngàn năm tuổi, tham gia các hoạt động thú vị. Trải nghiệm phong cảnh tuyệt đẹp trên tàu lửa hơi nước ray đơn Puffing Billy có từ đầu thế kỷ 20, Đoàn sẽ vượt qua chặng đường dài gần 6km từ ga Belgrave đến ga Menzies Creek, sống lại những năm tháng giao thương nông sản giữa những người dân ở Dandenong và Melbourne. Tham quan thung lũng Yarra, Quý khách có thể thưởng thức rượu nho nổi tiếng của Úc. Trở về Melbourne, tự do tham quan sòng bạc lớn nhất nước Úc Crown casino. Nghỉ đêm tại khách sạn.//
Ngày 4: MELBOURNE - SYDNEY (650 km) (Ăn sáng, trưa, tối) //
Khởi hành đi Sydney chuyến bay DỰ KIẾN VA827(09:00-10:25). Tham quan thành phố Sydney: Nhà hát Sydney opera - biểu tượng của Sydney, nổi tiếng với kiến trúc con sò, tháp truyền hình Sydney (bên ngoài), thăm vịnh tình yêu, ngắm cầu cảng Sydney - là một trong những biểu tượng của Úc, là một trong những cây cầu rộng nhất và đẹp nhất thế giới, nhà thờ St Mary, Mrs. Macquarie’s Chair - nơi ghi dấu quyền thống trị của nữ hoàng Elizabeth. Chiều đoàn lên du thuyền ngắm cảnh đẹp của thành phố Sydney. Mua sắm tại trung tâm thương mại. Nghỉ đêm tại khách sạn.//
Ngày 5: SYDNEY (Ăn sáng, trưa, tối)//
Thăm quan di sản thiên nhiên lớn nhất thế giới: Blue mountain - vùng đất trước kia thuộc các bộ tộc thổ dân Úc. Chiêm ngưỡng cảnh đẹp tự nhiên của núi đá Ba chị em. Quý khách sẽ đi cáp treo qua thung lũng, thưởng ngoạn thác nước và khung cảnh thiên nhiên hùng vĩ của ngọn núi xanh, ngồi xe điện xuống Thung lũng Jamison để khám phá hệ thực vật còn nguyên sơ tại đây, tham quan khu Công viên Wilflife Sydney nơi bảo tồn những loại động vật quý hiếm của Australia. Quý khách có thể ngắm nhìn cận cảnh những chú Kangaroos, đà điểu sa mạc úc, gấu Túi Koala...và chụp hình lưu niệm. Chiều thăm khu Cadramatta, nơi cộng đồng người Việt sinh sống đông nhất nước Úc. Nghỉ đêm tại khách sạn.//
Ngày 6: SYDNEY - HÀ NỘI (Ăn sáng)//
Ăn sáng tại khách sạn, đoàn tự do nghỉ ngơi. 11h00: Xe đón đoàn đưa ra  sân bay thẳng VN786(14:15-20:50) về Hà Nội. Về tới sân bay Nội Bài, xe đón đoàn đưa về Hà Nội, kết thúc chương trình.', N'Hà Nội', CAST(N'2019-08-13 14:00:00.000' AS DateTime), CAST(N'2019-08-19 15:45:00.000' AS DateTime), N'6 ngày 5 đêm', N'Captain-Cooks-Cottage-in-Fitzroy-Garden-Melbourne-Australia_562812586.jpg;Dandenong-Ranges_1007971966.jpg;Koala_229869328.jpg', 43900000, 35100000, 30, N'máy bay', N'tg003')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'EURO1', N'EURO', N'Ý - Thụy Sĩ - Pháp', N'Hành trình du lịch qua các thành phố danh tiếng của Châu Âu với Hàng không 5 sao và khách sạn 4 sao suốt tuyến.
//Chiêm ngưỡng tháp Montparnasse, Nhà Thờ Đức Bà, du thuyền sông Seine …(Pháp); ngỡ ngàng trước Tháp nghiêng Pisa…(Ý) và quốc gia quyền lực nhất thế giới - Vatican với Quảng trường và thánh đường Thánh Peter thiêng liêng . 
//Chinh phục những tầm cao mới từ đỉnh núi tuyết Jungfrau - “nóc nhà châu Âu”, khám phá “quê hương” của thương hiệu đồng hồ Thụy Sỹ nổi tiếng hay thành phố Lucern đẹp như tranh vẽ …
//Thỏa sức mua sắm hàng hiệu và đồ lưu niệm  tại Châu Âu', N'NGÀY 1: TP.HCM - DOHA (QATAR)//Quý khách tự túc tập trung tại Ga đi quốc tế sân bay Tân Sơn Nhất, cùng hướng dẫn viên đi Doha - Qatar. Làm thủ tục nối chuyến bay đi Rome. Ăn tối trên máy bay.//NGÀY 2: DOHA - ROME - VATICAN//Đến sân bay Doha, đoàn nối chuyến bay đi Rome. 7h sáng đến thành phố Rome cổ kính. Đến Vatican - một quốc gia độc lập ngay giữa thành Rome, là một trong những quốc gia có quyền lực nhất thế giới. Tham quan Quảng trường và Đại Thánh đường St. Peter tráng lệ và thiêng liêng bậc nhất. Buổi chiều, Quý khách ghé thăm Đấu trường La Mã Colosseum. Nhận phòng khách sạn và nghỉ đêm tại Rome.//NGÀY 3: ROME - FLORENCE//Dạo chơi trên Quảng trường Tây Ban Nha và Đài phun nước Trevi Fountain - với đáy hồ trong veo lấp lánh những đồng tiền xu được du khách quay lưng ném xuống với ước mong sẽ quay lại Rome lần nữa. Khởi hành đến thành phố Florence. Dừng chân chụp hình tại Thánh đường Duomo Santa Maria del Fiore và chiêm ngưỡng bản sao bức tượng Chàng David tại Quảng trường Piazzale Michelangelo; ngắm nhìn cây cầu Ponte Vecchio vắt ngang sông Arno. Nghỉ đêm tại Florence. //NGÀY 4: FLORENCE - PISA - VENICE//Di chuyển đến tham quan Tháp nghiêng Pisa - công trình kiến trúc độc đáo nằm trên Quảng trường Piazza del Miracoli. Khởi hành đến thành phố Venice. Nghỉ đêm tại Venice.//NGÀY 5: VENICE - MILAN//Khám phá Venice thơ mộng. Tự do dạo bước trên Quảng trường Saint Marco, dừng chân chụp ảnh tại Cung điện Tổng Trấn Doge’s Palace và Nhà thờ mái vòm San Marco, tham quan xưởng thủy tinh Murano. Trải nghiệm ngồi thuyền gỗ Gondola dập dìu trên kênh đào đưa du khách tham quan các ngõ ngách của Venice lãng mạn. Khởi hành đi Milan - kinh đô thời trang của nước Ý. Nhận phòng khách sạn và nghỉ đêm tại Milan.//NGÀY 6: MILAN - LUCERN//Khám phá Galleria Vittorio Emanuele - khu phố thương mại và triển lãm cổ rộng lớn đặt tên theo vị vua đầu tiên của Vương quốc Ý. Tham quan bên ngoài Thánh đường Duomo Milan và nhà hát opera La Scala. Di chuyển về thành phố Lucerne miền trung Thụy Sỹ. Tham quan Tượng đài Lion Monument, tản bộ trên cây Cầu gỗ Chapel - cây cầu có mái che cổ nhất ở châu Âu bắc qua dòng sông Reuss. Nghỉ đêm tại Lucerne.//NGÀY 7: LUCERNE - GRINDELWALD - JUNGFRAUJOCH - ZURICH)//Khởi hành đi Grindelwald. Tiếp tục chuyến du ngoạn hấp dẫn “Cuộc hành trình vượt lên đỉnh châu Âu - núi Jungfrau”. Xe đưa đoàn di chuyển tới Zurich - thủ đô văn hóa của Thụy Sỹ. Chụp hình bên ngoài Tòa Thị Chính Zurich, Giáo đường Saint Pierre, nhà thờ Fraumünster. Nghỉ đêm tại Zurich.//NGÀY 8: ZURICH - STRASBOURG - PARIS (Ăn sáng, trưa, tối)//Trả phòng. Di chuyển đến thành phố Strasbourg. Chiêm ngưỡng Nhà thờ Notre Dame nổi tiếng mang đậm kiến trúc Gothic với những khung cửa sổ lung linh sắc màu và những bức tranh kiếng. Dạo chơi khu phố cổ La Petite France. Đáp chuyến tàu tốc hành tới Paris. Nghỉ đêm tại Paris.//NGÀY 9: PARIS - BẢO TÀNG LOUVRE// Tham quan Bảo tàng Louvre - nổi tiếng với bức tranh nàng Mona Lisa của Leonardo da Vinci với nụ cười bí ẩn và tượng thần Vệ nữ thành Milo - biểu tượng của tình yêu và sắc đẹp của người Hy Lạp. Buổi chiều, Quý khách tự do dạo bộ trên Đại Lộ Thiên Đường (Champs Élysées) lộng lẫy bắt đầu từ Quảng trường Hòa Hợp (La Concorde) và kết thúc tại Khải Hoàn Môn (L’Arc de Triomphe) hùng tráng nằm giữa Quảng trường Étoile. Trải nghiệm du thuyền trên dòng sông Seine, khám phá vẻ đẹp hai bên bờ sông và những cây cầu cổ, tiêu biểu nhất là cầu Alexandre III và cầu Neuf . Tự do mua sắm tại các trung tâm thương mại lớn. Nghỉ đêm tại Paris.//Ngày 10: PARIS - DOHA//Tiếp tục hành trình khám phá Paris: Nhà thờ Đức Bà (Notre Dame de Paris) - công trình kiến trúc Gothic, Dừng chân chụp hình bên ngoài Tháp Eiffel - công trình kiến trúc bằng sắt sừng sững bên bờ sông Seine, biểu tượng và niềm tự hào của nước Pháp. Đoàn ghé thăm Montparnasse Tower - tòa tháp cao nhất Paris. Quý khách được lên tầng 56 của tòa tháp, ngắm nhìn toàn cảnh thành phố Paris. Ra sân bay, đi Doha.//NGÀY 11: DOHA - TP. HCM//Đến sân bay Doha, nối chuyến bay  về Tp. HCM.', N'Hồ Chí Minh', CAST(N'2019-04-25 19:00:00.000' AS DateTime), CAST(N'2019-06-06 12:00:00.000' AS DateTime), N'11 ngày 10 đêm', N'Cathedral-Duomo-di-Milano_662857045.jpg;david-by-michelangelo-florence-italy_306001280.jpg;Doges-Palace_591605735.jpg;Jungfrau-mountain_468204527.jpg;La-Petite-France_704449525.jpg;Louvre-museum_408957343.jpg;Notre-Dame-Cathedral-in-Paris-France_365622839.jpg;Pisa-Italy_476860744.jpg;Saint-Peters-Square-in-Vatican-and-aerial-view-of-Rome_404819830.jpg', 90990000, 72720000, 25, N'máy bay', N'tg008')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'EURO2', N'EURO', N'Nga', N'Ghé thăm 2 thành phố nổi tiếng bậc nhất thế giới về kiến trúc, thiên nhiên và vĩ đại bậc nhất thế giới về lịch sử, văn hoá: Saint Petersburg, Moscow.
//Tận kiến những kỳ quan kiến trúc nổi tiếng của xứ sở bạch dương, thế giới nghệ thuật trác tuyệt: Quảng trường Đỏ, Nhà thờ Saint Basil, Điện Kremlin, Bảo Tàng Hermitage, Cung Điện Mùa Hè… 
//Cảm nhận nước Nga - đất nước nắm giữ trái tim và ký ức đẹp của bao người Việt thế hệ 6X, 7X.', N'Ngày 1: TP. HCM – HÀ NỘI – MOSCOW (Ăn tối)//
Quý khách tự túc tập trung tại Ga đi nội địa - sân bay Tân Sơn Nhất, làm thủ tục đáp chuyến bay VN212 (06:30 – 08:35) đi Hà Nội. Đến sân bay Nội Bài, đoàn làm thủ tục xuất cảnh nối chuyến bay VN65 (10:35 – 17:00) đi Moscow. Đến sân bay Domodedovo, đoàn làm thủ tục nhập cảnh. Nhận phòng khách sạn và nghỉ đêm tại Moscow.//
NGÀY 2: MOSCOW (Ăn sáng, trưa, tối)//
Tham quan Quảng Trường Đỏ tuyệt đẹp - nơi tập trung của nhiều công trình huyền thoại gắn liền với lịch sử nước Nga. Chiêm ngưỡng bên ngoài Lăng Lenin và nhà thờ Saint Basil với kiến trúc đặc trưng của Chính Thống Giáo. Tự do mua sắm ở GUM Department Store với đa dạng hàng hóa. Tự do dạo chơi công viên Zaryadye rộng 130.000 m2, được xây dựng trên nền một khách sạn cũ đã bị đổ nát năm 2006 và được chia thành 4 vùng khí hậu: rừng, thảo nguyên, lãnh nguyên, và bãi ven sông. Một trong những điểm nổi bật của công viên là một động băng, nơi duy trì nhiệt độ dưới 0 độ C trong suốt cả năm và đây là thắng cảnh nhất định phải tới với du khách đến Nga. Buổi chiều, đoàn thưởng ngoạn quang cảnh Quảng trường bên trong điện Kremlin với hàng loạt kiến trúc nguyên bản thời trung cổ của các nhà thờ, tháp chuông từ thời Ivan Đại Đế. Quý khách cũng có cơ hội ngắm những cổ vật quý giá như khẩu thần công Vua, quả chuông Vua. Nghỉ đêm tại Moscow.//
NGÀY 3: MOSCOW - SAINT PETERSBURG (Ăn sáng, trưa, tối)//
Xe đưa đoàn ra ga đáp chuyến tàu tốc hành đi Saint Petersburg (hơn 4 tiếng). Đến Saint Petersburg, khởi hành tham quan Quảng Trường Cung Điện với cột trụ Alexander Column bằng đá granite đỏ cao 47,5m nặng 500 tấn; Tượng đài Peter Đại đế uy nghi - người có công tạo lập nên thành phố Saint Petersburg huy hoàng. Nghỉ đêm khách sạn 4 sao tại Saint Petersburg. //
NGÀY 4 : SAINT PETERSBURG (Ăn sáng, trưa, tối)//
Tiếp tục tham quan thiên đường nghệ thuật - Bảo Tàng Hermitage với trên 3 triệu kiệt tác nghệ thuật và là di sản của văn hóa thế giới. Đoàn khởi hành đến Petrodvorets, tham quan cung điện và tản bộ trong khuôn viên Cung Điện Mùa Hè (Peterhof) - quần thể kiến trúc tráng lệ bên vịnh Baltic, được mệnh danh là Điện Versailles của Nga bởi vẻ đẹp thơ mộng, xa hoa và cổ kính với công viên và các đài phun nước tuyệt đẹp bao quanh. Quý khách dùng tiệc tối theo kiểu truyền thống của Nga và thưởng thức chương trình văn nghệ dân tộc. Nghỉ đêm tại Saint Petersburg.//
NGÀY 5 : SAINT PETERSBURG – MOSCOW (Ăn sáng, trưa, tối)//
Đoàn lên cano đi dọc những kênh đào trong thành phố và ngắm St Petersburg yên bình. Xe đưa Quý khách ra sân bay đáp chuyến bay S7 (15:20 – 16:50) đi Moscow. Nhận phòng khách sạn và nghỉ đêm tại Moscow. //
NGÀY 6: MOSCOW – HÀ NỘI (Ăn sáng, trưa)//
Khởi hành tham quan đồi Chim Sẻ - địa điểm lý tưởng để vọng cảnh Moscow. Dạo quanh Công viên Chiến Thắng – địa danh ghi dấu sự quả cảm của người Nga trong cuộc chiến tranh vệ quốc vĩ đại. Buổi chiều, Quý khách có cơ hội trải nghiệm hệ thống ga tàu điện ngầm - được mệnh danh là những cung điện trong lòng đất và là hệ thống ga tàu điện ngầm đẹp nhất thế giới. Tự do dạo bộ và mua sắm trên phố cổ Arbat nổi tiếng, bày bán nhiều mặt hàng lưu niệm, các cửa hàng bánh ngọt, những quán café xinh lung linh. Xe đưa đoàn ra sân bay đáp chuyến bay VN64 (19:00 – 07:55) về Hà Nội. Ăn tối và nghỉ đêm trên máy bay.//
NGÀY 7: HÀ NỘI - TP.HCM//
 Đến sân bay Nội Bài, làm thủ tục nối chuyến bay VN227 (10:00 – 12:10) về Tp. HCM. Máy bay hạ cánh tại sân bay Tân Sơn Nhất lúc 12g00. Kết thúc chương trình du lịch Nga.

', N'Hồ Chí Minh', CAST(N'2019-05-23 06:15:00.000' AS DateTime), CAST(N'2019-05-30 08:45:00.000' AS DateTime), N'7 ngày 6 đêm', N'russia-vape.jpg;st-petersburg-russia-saint-isaac-cathedral.jpg', 60999000, 58980000, 25, N'máy bay', N'tg009')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'EURO3', N'EURO', N'CANADA [VANCOUVER - VICTORIA - WHISTLER VILLAGE]', N'Khám phá một Canada năng động và hiện đại vào bậc nhất thế giới với thành phố Vancouver, Victoria đa văn hóa, sắc tộc, nghệ thuật và thanh bình// 
Thư giãn dạo bước trong không khí trong lành của ở Công viên Stanley, chiêm ngưỡng những thảm hoa rực rỡ khoe sắc được chăm sóc bởi những người làm vườn tài hoa trong vườn Butchart//
Trải nghiệm đi qua cầu treo Capilano dành cho người đi bộ dài 137m, bắc ngang sông Capilano hay ngắm nhìn ngọn núi hùng vĩ Whistler Blackcomb trên cáp treo tại làng du lịch Whistler
', N'NGÀY 1: TP.HCM  - QUẢNG CHÂU - VANCOUVER (Ăn trưa, tối)//Tập trung tại lầu 2 - Ga đi quốc tế sân bay Tân Sơn Nhất, làm thủ tục đón chuyến bay CZ368 (08:00- 11:35) đi Quảng Châu. Đến sân bay Quảng Châu, chuyển tiếp chuyến bay CZ329 (14:00-11:05) đi Vancouver - thành phố yên bình và trù phú bên bờ Tây Canada. Hạ cánh tại sân bay quốc tế Vancouver lúc 11:05 (giờ địa phương). Khám phá Khu phố Gastown được thành lập từ năm 1867 vẫn còn giữ được nhiều nét đẹp cổ xưa đan xen với kiến trúc mới, thả bộ trên con đường lát đá với các tiệm cà phê thơ mộng, những hàng quán xinh xắn. Chiêm ngưỡng Tháp Đồng hồ chạy bằng hơi nước độc đáo. Tham quan Khu phố Người Hoa náo nhiệt với các hoạt động thương mại, ẩm thực và văn hóa mang sắc màu Á Đông. Chụp hình bến tàu (cruise ship terminal), mua sắm tại chợ Công cộng đảo Granville nổi tiếng với nông sản ôn đới và mặt hàng lưu niệm cho du khách. Nghỉ đêm tại Vancouver.//NGÀY 2: VANCOUVER - VICTORIA - VANCOUVER (Ăn sáng, trưa, tối)//Đến bến B.C ferry di chuyển sang Victoria - mệnh danh là thành phố hoa, thủ phủ của bang British Columbia. Tham quan vườn Butchart tuyệt mỹ. Thư giãn dạo bước và chiêm ngưỡng những hoa cỏ, cây cảnh tinh tế được chăm sóc bởi những người làm vườn tài hoa. Chụp hình bên ngoài Viện Bảo tàng Provincial Royal B.C. Trở lại Vancouver. Tự do giải trí và nghỉ đêm tại Vancouver.//NGÀY 3: VANCOUVER - WHISTLER VILLAGE - VANCOUVER (Ăn sáng, trưa, tối)//Khởi hành đến làng du lịch Whistler - một đô thị miền núi xinh đẹp cách Vancouver khoảng 125km. Trải nghiệm cáp treo (Whistler Peak to Peak Gondola) đầy lý tưởng và thú vị từ đỉnh núi này qua đỉnh núi khác, cơ hội ngắm nhìn ngọn núi hùng vĩ Whistler Blackcomb. Trở lại Vancouver nghỉ đêm.//NGÀY 4: VANCOUVER (Ăn sáng, trưa, tối)//Tản bộ trong không gian trong lành của Công viên Stanley nổi bật với khoảng xanh của rừng cây bá hương quý giá. Trải nghiệm đi qua cầu treo Capilano dành cho người đi bộ dài 137m, bắc ngang sông Capilano. Tham quan trang trại Salmon Hatchery, tìm hiểu về chu kỳ sống của cá hồi. Tự do mua sắm. Nghỉ đêm tại Vancouver.//NGÀY 5: VANCOUVER - QUẢNG CHÂU (Ăn sáng)//Ra sân bay làm thủ tục đón chuyến bay CZ330 (12 :50 – 16:55) về Quảng Châu. Ăn và nghỉ trên máy bay.//NGÀY 06: QUẢNG CHÂU - TP. HCM//Đến sân bay Quảng Châu, làm thủ tục nối chuyến bay CZ367 (20:05 - 21:50) về Tp.HCM. Máy bay đáp xuống sân bay Tân Sơn Nhất lúc 21:50 tối. Kết thúc chương trình tour du lịch Canada.//', N'Hồ Chí Minh', CAST(N'2019-04-10 00:00:00.000' AS DateTime), CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'6 ngày 5 đêm', N'Butchart-Gardens-Vancouver-Island_320965514.jpg;Capilano-Tree-Top-Suspension-Bridge_678527071.jpg;Clock-in-Gastown-Vancouver_737977453.jpg', 68000000, 63000000, 25, N'55', N'tg008')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'MVN1', N'MVN', N'Hồ Chí Minh - Đà Lạt', N'Tham quan thác Dambri - ngọn thác hùng vĩ tại cao nguyên Bảo Lộc//Tham quan Khu Du Lịch Trang Trại Rau và Hoa, nằm trải rộng cả một thung lũng với bốn bề là rau và hoa đẹp tuyệt vời //Viếng Linh Ẩn tự, ngôi chùa với tượng Phật Di Lặc lớn nhất tỉnh Lâm Đồng. //Tham quan nhà máy Trà Atiso& Rượu Vang Vĩnh Tiến.', N'NGÀY 1: TP.HCM - ĐÀ LẠT (Ăn sáng, trưa, chiều)//Đón quý khách văn phòng Saigontourist (lúc 06h00 sáng tại 01 Nguyễn Chí Thanh, F9,Q5 hoặc 06h30 sáng tại 102 Nguyễn Huệ, Q1) khởi hành đi Đà Lạt. Trên đường tham quan thác Dambri - ngọn thác hùng vĩ tại cao nguyên Bảo Lộc. Đến Đà Lạt tham quan Quảng trường Lâm Viên với không gian rộng lớn, thoáng mát hướng ra hồ Xuân Hương cùng công trình nghệ thuật khối bông hoa dã quỳ và khối nụ hoa Atiso khổng lồ được thiết kế bằng kính màu rất đẹp mắt. Nhận phòng và nghỉ đêm tại Đà Lạt.//NGÀY 2: THAM QUAN ĐÀ LẠT (Ăn sáng, trưa, chiều)//Buổi sáng tham quan Khu Du Lịch Trang Trại Rau và Hoa, nằm trải rộng cả một thung lũng với bốn bề là rau và hoa đẹp tuyệt vời. Tìm hiểu về mô hình sản xuất nông nghiệp công nghệ cao cũng như các sản phẩm nông nghiệp hiện đại như: Lavender, Nữ Hoàng xanh, Ngọc Thảo,Hồng Môn, Bí khổng lồ, Cà chua đen, Ớt chuông, Dâu Nhật & New Zealand…Tiếp theo, đoàn đến với Nhà máy Trà Atisô & Rượu vang Vĩnh Tiến, tham quan tìm hiểu quy trình sản xuất trà Atisô, trà thảo dược, rượu vang và Đông Trùng Hạ Thảo. Khám phá Đường hầm Rượu vang đặc sắc. Buổi chiều quý khách đến với Đường hầm điêu khắc đất đỏ (Đà Lạt Star) - tái hiện lịch sử Đà Lạt qua hơn 120 năm. Tham quan thác Datanla (tự túc chi phí tham gia trò chơi máng trượt). Nghỉ đêm tại Đà Lạt.//NGÀY 3: THAM QUAN ĐÀ LẠT  (Ăn sáng, trưa, chiều)//Buổi sáng, đến với khu du lịch Langbiang - tham quan đồi Mimosa, thung lũng Trăm Năm, chinh phục núi Langbiang (tự túc phí xe Jeep). Tiếp theo tham quan Phòng trưng bày hoa sấy nghệ thuật, Vườn hoa Thành phố. Buổi chiều viếng chùa Linh Phước. Mua sắm đặc sản tại chợ Đà Lạt. Buổi tối tự do dạo phố hoặc tự túc tham dự đêm giao lưu văn hóa cồng chiêng với người dân tộc Tây Nguyên, uống rượu cần (chi phí tự túc).//NGÀY 4: ĐÀ LẠT - TP.HCM (Ăn sáng, trưa)//Sau bữa sáng, quý khách trả phòng, khởi hành về TP.HCM. Ngang qua Làng hoa Vạn Thành, đi về hướng Tà Nung, quý khách dừng chân thưởng thức trà và cà phê (tư túc chi phí) tại café Mê Linh - quán cà phê chồn sở hữu cảnh quan thiên nhiên hùng vĩ hiếm có tại Đà Lạt. Ngắm nhìn không gian bạt ngàn rẫy cà phê. Tham quan chuồng trại nuôi chồn, xưởng sản xuất và tìm hiểu về cách thức để làm ra cà phê chồn đúng chất. Về đến thị trấn Nam Ban, đoàn viếng Linh Ẩn tự. Ngôi chùa tọa lạc yên bình trên ngọn đồi cao, phía sau được bao bọc bởi rừng thông bạt ngàn, xanh biếc, phía trước là thác Voi ngày đêm tuôn chảy tạo nên một vị thế đắc địa “ tọa sơn ngoạ thủy”. Quý khách chiêm bái tượng Phật Di Lặc lớn nhất tỉnh Lâm Đồng . Về tới TP.HCM, đưa quý khách về văn phòng Saigontourist. Kết thúc chương trình.//', N'Hồ Chí Minh', CAST(N'2019-03-17 07:00:00.000' AS DateTime), CAST(N'2019-02-25 09:35:00.000' AS DateTime), N'4 ngày 3 đêm', N'Langbiang-dalat-vietnam_519197881.jpg;thanh-pho-da-lat.jpg', 3179000, 1590000, 40, N'xe du lịch', N'tg010')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'MVN2', N'MVN', N'Hà Nội - Đà Lạt - Nha Trang', N'Tham quan tour Nha Trang - Đà Lạt với  Viện Hải Dương học, tắm khoáng tại Trung tâm suối khoáng nóng I resort Nha Trang  Du khách tự do thư giãn. Tham quan Khu vui chơi giải trí Vinpearl Land, chùa Tòng Lâm Lô Sơn, tham quan tượng phật A Di Đà cao 44 m (cao nhất Việt Nam), tháp Bà Ponagar //Ngắm thung Lũng Tình yêu, Nhà Thờ Domain De Marie. Xe theo cung đường Mang - Ling, ngang qua khu Vườn Hồng Cam Ly, tham quan khu dã ngoại núi Langbian, tham quan đồi Mimosa, Thung lũng Trăm Năm, chinh phục núi Langbian, Thiền Viện Trúc Lâm - ngắm toàn cảnh hồ Tuyền Lâm. ....', N'Ngày 01: HÀ NỘI – NHA TRANG (Ăn chiều)//10:45: Xe và HDV đón du khách tại văn phòng Saigontourist Hoàn Kiếm - 55B Phan Chu Trinh tiễn sân bay Nội Bài đáp chuyến bay  đi Nha Trang VN1563 (Dự kiến cất cánh 13:10).Đến Sân bay Cam Ranh, xe đón khách đưa du khách về khách sạn nhận phòng. Quý khách tự do tắm biển & khám phá thành phố biển Nha Trang. Ăn tối và nghỉ đêm tại Nha Trang.//Ngày 02: NHA TRANG - I RESORT NHA TRANG – KHU GIẢI TRÍ VINPEARLLAND (Ăn sáng, trưa)//Sau bữa sáng tại khách sạn, đoàn khởi hành đi thăm Viện Hải Dương học, tham quan và tắm khoáng tại Trung tâm suối khoáng nóng I resort Nha Trang (không bao gồm tắm bùn). Du khách tự do thư giãn. Ăn trưa tại nhà hàng. Buổi chiều: Quý khách tự do nghỉ ngơi hoặc có thể lựa chọn chương trình vào tham quan Khu vui chơi giải trí Vinpearl Land, xe và HDV đưa đi. (Chi phí vé cáp treo tự túc: 880.000đ) - Với quy mô và hiện đại, có thể sánh ngang với nhiều công viên giải trí hàng đầu trong khu vực, khám phá những công trình tiêu biểu như: Hệ thống cáp treo vượt biển dài nhất thế giới, Thủy cung lớn và hiện đại nhất Việt Nam, Khu trò chơi trong nhà,  Khu trò chơi ngoài trời và Công viên nước ngọt trên bãi biển đầu tiên & duy nhất tại Việt Nam. Phòng chiếu phim 4D , Chương trình biểu diễn nhạc nước(Du khách tự túc ăn tối ). Quay về đất liền. Nghỉ đêm tại Nha Trang.//Ngày 03: NHA TRANG - ĐÀ LẠT (Ăn sáng, trưa, chiều)//Sau bữa sáng tại khách sạn, Sau đó xe đưa đoàn đi thăm viếng chùa Tòng Lâm Lô Sơn, tham quan tượng phật A Di Đà cao 44 m (cao nhất Việt Nam), tháp Bà Ponagar . Ăn trưa, đoàn trả phòng, khởi hành đi Đà Lạt theo cung đường mới Diên Khánh - Khánh Vĩnh - Khánh Linh, cung đường du lịch nối biển và thành phố Hoa, với phong cảnh đẹp tựa chốn bồng lai. Tới nơi, đoàn nhận phòng khách sạn. Ăn tối & Nghỉ đêm tại Đà Lạt.//Ngày 04: THAM QUAN ĐÀ LẠT (Ăn sáng, trưa, chiều)//Sau bữa sáng tại khách sạn, xe đưa du khách tham quan Thung Lũng Tình yêu, Nhà Thờ Domain De Marie. Xe theo cung đường Mang - Ling, ngang qua khu Vườn Hồng Cam Ly, tham quan khu dã ngoại núi Langbian, tham quan đồi Mimosa, Thung lũng Trăm Năm, chinh phục núi Langbian (Không bao gồm phí xe Jeep), từ trên đỉnh núi ngắm toàn cảnh thành phố sương mù. Ăn trưa. Du khách về khách sạn nghỉ ngơi. Chiều xe đưa du khách tham quan Thiền Viện Trúc Lâm - ngắm toàn cảnh hồ Tuyền Lâm. Tối tự do đi dạo thành phố Đà Lạt về đêm. Ăn tối & Nghỉ đêm tại Đà Lạt.//Ngày 05: ĐÀ LẠT – HÀ NỘI (Ăn trưa)//Sau bữa sáng tại khách sạn, xe đưa du khách đến tham quan: Vườn hoa Thành Phố, Dinh Vua Bảo Đại - nơi Vị Vua cuối cùng của triều đại phong kiến Việt Nam từng sống và làm việc. Du khách ăn trưa tại nhà hàng. Sau đó, xe đưa Du khách ra sân bay Liên Khương đáp chuyến bay về Hà Nội, dự kiến chuyến bay VN1576 Cc 13:25. Về đến sân bay Nội Bài, xe và HDV đón Du khách trở về điểm hẹn ban đầu. Kêt thúc chương trình tham quan.', N'Hà Nội', CAST(N'2019-04-02 00:00:00.000' AS DateTime), CAST(N'2019-04-07 13:00:00.000' AS DateTime), N'5 ngày 4 đêm', N'nha-trang.jpg;thanh-pho-da-lat.jpg', 9862000, 5789000, 25, N'máy bay', N'tg001')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'MVN3', N'MVN', N'Hồ Chí Minh - Phan Thiết', N'Tham quan không gian trưng bày nghệ thuật “Làng chài xưa”//Chụp hình và thường thức rượu tại  Lâu Đài Rượu Vang//Xem show nhạc kịch nước Huyền Thoại Làng Chài', N'NGÀY 01 : TP. HCM - PHAN THIẾT – LÀNG CHÀI XƯA (Ăn sáng, trưa, chiều)//Đón quý khách tại văn phòng Saigontourist (lúc 06h00 sáng tại 01 Nguyễn Chí Thanh, F9, Q5 hoặc 06h30 sáng tại 102 Nguyễn Huệ, Q1), khởi hành đi Bình Thuận. Đến Phan Thiết quý khách tham quan không gian trưng bày nghệ thuật “Làng chài xưa”. Toàn bộ khu trưng bày có diện tích 1.600m² -  không gian trưng bày nghệ thuật và là bảo tàng thu nhỏ, tái hiện lại một phần làng chài xưa của Phan Thiết - Mũi Né cách đây hơn 300 năm. Du khách đến đây sẽ được tham quan làng chài dưới rặng dừa; phố cổ ven sông Cà Ty; nhà ở và nơi sản xuất nước mắm của hàm hộ Phan Thiết; con đường Phan Thiết - Mũi Né xưa; đắm mình vào biển Mũi Né 3D và mua sắm trong không gian chợ quê làng xưa… tận mắt được chứng kiến một làng chài xưa của xứ biển Phan Thiết được tái hiện một cách công phu.
Nhận phòng và tự do tắm biển tại resort. Nghỉ đêm tại Mũi Né.//NGÀY 02 : THAM QUAN MŨI NÉ - XEM NHẠC KỊCH FISHER MEN SHOW (Ăn sáng, trưa, chiều)//Buổi sáng quý khách nghĩ dưỡng trong resort. Buổi chiều, quý khách tham quan Lâu Đài Rượu Vang .Vào Hòn Rơm tham quan thắng cảnh đồi cát vàng.//Buổi tối, xe đưa quý khách đến xem show nhạc kịch nước Huyền Thoại Làng Chài - show giải trí đặc sắc và đậm nét văn hóa làng chài của Phan Thiết - Bình Thuận. Đây là show kịch múa được dàn dựng công phu trên sân khấu nhạc nước đầu tiên và duy nhất tại Việt Nam, áp dụng công nghệ 2D và 3D mới nhất hiện nay. Với thời lượng 1 tiếng cùng kịch bản được dày công biên soạn, sáng tác theo trường phái giả tưởng, dựa theo những truyền thuyết dân gian và huyền thoại về làng chài và biển cả, show trình diễn hứa hẹn mang lại nhiều cảm xúc đến khán giả với các cao trào và tình tiết của câu chuyện cùng những hiệu ứng đặc biệt từ sân khấu nhạc nước đầy mãn nhãn.//Nghỉ đêm tại Mũi Né.//NGÀY 03 : MŨI NÉ - PHAN THIẾT - TP. HCM (Ăn sáng, trưa)//Buổi sáng quý khách nghỉ dưỡng trong resort đến giờ trả phòng. Khởi hành về TP. HCM. Dừng chân mua sắm đặc sản Phan Thiết. Về đến TP.HCM, xe đưa quý khách về điểm đón ban đầu. Kết thúc chương trình.
', N'Hồ Chí Minh', CAST(N'2019-03-22 07:00:00.000' AS DateTime), CAST(N'2019-03-25 12:30:00.000' AS DateTime), N'3 ngày 2 đêm', N'phan-thiet.jpg;tf_170914115717_320156.jpg', 3339000, 1670000, 25, N'máy bay', N'tg002')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'NVN1', N'NVN', N'Hồ Chí Minh - Mộc Châu - Sơn La - Điện Biên - Lai Châu - Sa Pa - Lào Cai - Lũng Pô', N'Tham quan chụp hình tại đồi chè Mộc Châu//Ghé thăm cụm di tích lịch sử Điện Biên Phủ với một trang sử đầy hào hùng của dân tộc//Tham quan động Pu Sam Cáp hoang sơ và hùng vĩ của núi rừng phía Bắc.', N'NGÀY 01: TP. HỒ CHÍ MINH - HÀ NỘI - HÒA BÌNH - MỘC CHÂU (Ăn trưa, chiều)//Buổi sáng, quý khách tập trung tại Cổng D4 - Ga đi trong nước - Sân bay Tân Sơn Nhất. Khởi hành đi Hà Nội trên chuyến bay VJ176  lúc 6:00.  Đến sân bay Nội Bài, khởi hành đi Hòa Bình. Đoàn dừng chân tại Thung Khe - đèo Đá Trắng, đến Thung Nhuổi - ngắm nhìn toàn cảnh thung lũng Mai Châu từ trên cao. Đoàn đến thăm đồi chè Mộc Châu. Nghỉ đêm tại Mộc Châu.//NGÀY 02: MỘC CHÂU - SƠN LA - ĐIỆN BIÊN (Ăn sáng, trưa, chiều)//Trả phòng, xe đưa đoàn viếng thăm Di tích lịch sử lưu niệm Trung đoàn 52 Tây Tiến, tham quan thác Dải Yếm. Khởi hành đến Sơn La, ghé thăm Bảo tàng, nhà tù Sơn La. Chinh phục đèo Pha Đin - một trong những đường đèo dài và hiểm trở nhất Việt Nam, ranh giới 2 tỉnh Sơn La & Điện Biên. Buổi chiều, đoàn thăm Tượng đài chiến thắng Điện Biên Phủ (đồi D1). Tự do khám phá Điện Biên về đêm. Nghỉ đêm tại Điện Biên.//NGÀY 03: ĐIỆN BIÊN - LAI CHÂU (Ăn sáng, trưa, chiều)//Đoàn đến tham quan các di tích gắn liền với chiến thắng Điện Biên Phủ: bảo tàng chiến thắng Điện Biên Phủ, đồi A1, Hầm tướng De Castries. Khởi hành đi Lai Châu, đoàn sẽ đi ngang qua các địa danh: Mường Chà, Mường Lay, cầu Hang Tôm - ranh giới 2 tỉnh Điện Biên & Lai Châu, Phong Thổ,... Trên đường đi, đoàn có dịp chiêm ngưỡng khung cảnh hùng vĩ của núi rừng Tây Bắc. Nghỉ đêm tại Lai Châu.//NGÀY 04: LAI CHÂU - SAPA - LÀO CAI (Ăn sáng, trưa, chiều)//Trả phòng. Đoàn đến tham quan động Pu Sam Cáp. Xe đưa đoàn theo quốc lộ 4D, chinh phục dãy Hoàng Liên Sơn, chụp hình lưu niệm tại đỉnh đèo Ô Quy Hồ. Đến Sapa, đoàn tự do dạo chợ Sapa, thăm nhà thờ đá Sapa.
Lựa chọn (tự túc chi phí tham quan) Xe đưa quý khách đến nhà Ga tàu hỏa leo núi hoặc nhà Ga cáp treo. Đoàn tham quan khu du lịch cáp treo Fansipan với hệ thống cáp treo 3 dây hiện đại vừa khánh thành tháng 2/2016. Trải nghiệm cảm giác đi giữa biển mây. Viếng khu tâm linh Fanpsian, vượt gần 600 bậc thang, chinh phục “Nóc nhà Đông Dương” - đỉnh Fansipan 3,143m.
Xe đón và đưa cả đoàn trở về Lào Cai. Tự do khám phá TP. Lào Cai về đêm. Nghỉ đêm tại Lào Cai.//NGÀY 05: LÀO CAI - LŨNG PÔ - NỘI BÀI - HỒ CHÍ MINH (Ăn sáng, trưa, chiều)//Buổi sáng, xe đưa đoàn đi Bát Xát, thăm cột mốc 92 và cột cờ Lũng Pô, nơi con sông Hồng chảy vào đất Việt. Tham quan cửa khẩu quốc tế Lào Cai, viếng Đền Mẫu. Khởi hành ra sân bay Nội Bài, về TP. Hồ Chí Minh trên chuyến bay VJ173 lúc 21:35 hoặc 22:40 (tùy ngày)', N'Hồ Chí Minh', CAST(N'2019-03-06 05:05:00.000' AS DateTime), CAST(N'2019-03-11 10:00:00.000' AS DateTime), N'5 ngày 4 đêm', N'lungpo.jpg;Viet_Dung-185625015619-Lao Cai.jpg', 8629000, 5890000, 25, N'máy bay', N'tg006')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'NVN2', N'NVN', N'Quảng Ninh - Tây Bắc', N'Với không khí mát mẻ như đang ở Đà Lạt, thì Mộc Châu được mệnh danh là “Đà Lạt của miền Tây Bắc”. //Quý khách đến Mộc Châu sẽ tham quan và chụp ảnh vườn hoa Happy Land; thác Dải Yếm và trang trại du lịch bò sữa Dairy Farm.//Tham quan tiếp đồi chè thị trấn Nông Trường Mộc Châu và ruộng bậc thang hoa Tam Giác Mạch.', N'NGÀY 1: HẠ LONG - MỘC CHÂU (≈ 380 km) (Ăn  trưa, chiều)//05.00: Xe và hướng dẫn viên Saigontourist đón quý khách tại điểm đón Vincom (5.00) và Bến xe Bãi Cháy (05.20) khởi hành đi Mộc Châu. Ăn sáng tự túc tại điểm dừng chân 559 - Hải Dương. Đoàn tiếp tục khởi hành đi Mộc Châu. Ăn trưa tại Hòa Bình. Tiếp tục khởi hành, trên đường đoàn vượt Dốc Cun, ngắm Đèo Thung Khe. Tới Mộc Châu, đoàn đi thăm và chụp ảnh vườn hoa Happy Land và thác Dải Yếm. Đoàn tham quan trang trại du lịch bò sữa Dairy Farm. Đoàn tham gia các hoạt động://- Tham quan khu chăn nuôi bò sữa có thuyết minh viên giới thiệu.//- Trải nghiệm cho bò ăn xem vắt sữa bò.//- Chụp ảnh tại vườn hoa để chụp ảnh, chuồng thú nuôi các động vật hoang dã vùng Tây Bắc. Quý khách nhận phòng khách sạn. Đoàn ăn tối tại khách sạn. Buổi tối tự do khám phá thị trấn nông trường Mộc Châu. Nghỉ đêm tại khách sạn Mường Thanh Luxury Mộc Châu 5 sao.//NGÀY 2: KHÁM PHÁ MỘC CHÂU - HẠ LONG  (Ăn sáng, trưa, chiều)//Ăn sáng tại khách sạn. Quý khách tham quan chụp ảnh tại Đồi chè thị trấn Nông Trường Mộc Châu và ruộng bậc thang hoa Tam Giác Mạch. Xe đưa đoàn về chợ địa phương, mua sắm quà tặng, sản vật địa phương. Đoàn trả phòng, ăn trưa tại khách sạn Mường Thanh. Khởi hành về Hạ Long. Ăn tối tại Hải Dương. Về tới Hạ Long - trả khách tại điểm đón ban đầu. Kết thúc chương trình.', N'Quảng Ninh', CAST(N'2019-03-11 04:45:00.000' AS DateTime), CAST(N'2019-03-13 07:00:00.000' AS DateTime), N'2 ngày 1 đêm', N'1.jpg;kinh-nghiem-du-lich-phuot-quang-ninh.jpg', 4290000, 2830000, 30, N'xe du lịch', N'tg007')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'NVN3', N'NVN', N'Hồ Chí Minh - Hà Nội - Lào Cai - Sa Pa', N'Chinh phục núi Hàm Rồng, thưởng ngoạn vườn lan, vườn hoa ôn đới, vườn đào và khu vườn đá. //Viếng Lăng Bác, khu di tích Phủ Chủ Tịch.//Chinh phục “Nóc nhà Đông Dương” - đỉnh Fansipan 3,143m bằng hệ thống cáp treo.//Viếng khu di tích Đền Hùng - thăm đền Hạ, đền Trung, đền Thượng, lăng Vua Hùng', N'NGÀY 01: TP. HCM - HÀ NỘI - SAPA (Ăn trưa, chiều)//Buổi sáng, quý khách tập trung tại Cổng D4 - Ga đi trong nước - Sân bay Tân Sơn Nhất. Khởi hành ra Hà Nội trên chuyến bay VJ124 lúc 7:45. Đáp xuống sân bay Nội Bài, khởi hành đến Lào Cai theo tuyến đường cao tốc Nội Bài - Lào Cai hiện đại, ngang qua các tỉnh Vĩnh Phúc, Phú Thọ, Yên Bái. Đến Lào Cai tiếp tục lên Sapa. Chiêm ngưỡng dãy Hoàng Liên Sơn trên đường đi. Buổi tối tự do ngắm nhà thờ đá, dạo chợ Sapa. Nghỉ đêm tại Sapa.//NGÀY 02: SAPA - LÀO CAI (Ăn sáng, trưa, chiều)//Buổi sáng, chinh phục núi Hàm Rồng, thưởng ngoạn vườn lan, vườn hoa ôn đới, vườn đào và khu vườn đá, xem biểu diễn múa hát dân gian của các dân tộc thiểu số, ngắm toàn cảnh Sapa và “Nóc nhà Đông Dương” - đỉnh Fansipan tại sân mây.
Lựa chọn (tự túc chi phí tham quan) Xe đưa quý khách đến nhà Ga tàu hỏa leo núi hoặc nhà Ga cáp treo. Đoàn tham quan khu du lịch cáp treo Fansipan với hệ thống cáp treo 3 dây hiện đại vừa khánh thành tháng 2/2016. Trải nghiệm cảm giác đi giữa biển mây. Viếng khu tâm linh Fanpsian, vượt gần 600 bậc thang, chinh phục “Nóc nhà Đông Dương” - đỉnh Fansipan 3,143m.
Xe đón và đưa cả đoàn trở về Lào Cai. Tự do khám phá TP. Lào Cai về đêm. Nghỉ đêm tại Lào Cai.//NGÀY 03: LÀO CAI - ĐỀN HÙNG - HÀ NỘI (Ăn sáng, trưa, chiều)//Buổi sáng, quý khách trả phòng. Tham quan cửa khẩu Quốc tế Lào Cai. Dừng chân tại Phú Thọ, viếng khu di tích Đền Hùng - thăm đền Hạ, đền Trung, đền Thượng, lăng Vua Hùng. Khởi hành về Hà Nội. Buổi tối, tự do dạo bộ dọc theo “36 phố phường” - khu phố cổ với những ngành nghề đặc trưng và truyền thống của cư dân Thủ đô. Nghỉ đêm tại Hà Nội.//NGÀY 04: HÀ NỘI - TP. HCM (Ăn sáng, trưa, chiều)//Quý khách tự do tham quan, nghỉ ngơi tại khách sạn hoặc đến viếng Lăng Bác, khu di tích Phủ Chủ Tịch. Buổi chiều, đoàn tham quan Văn Miếu Quốc Tử Giám. Ngắm hồ Tây, viếng chùa Trấn Quốc - danh lam cổ tự được xây dựng từ thế kỷ VI;  Ra sân bay Nội Bài, Về TP. Hồ Chí Minh trên chuyến bay VJ185 lúc 21:15. Kết thúc chương trình (Quý khách tự túc phương tiện từ sân bay về nhà).', N'Hồ Chí Minh', CAST(N'2019-03-23 07:15:00.000' AS DateTime), CAST(N'2019-03-27 09:00:00.000' AS DateTime), N'4 ngày 3 đêm', N'tf_160709_kinh-nghiem-du-lich-lao-cai.jpg;tf_180129051725_438271.jpg', 7079000, 5115000, 30, N'máy bay', N'tg008')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'NVN4', N'NVN', N'Hồ Chí Minh - Hà Nội - Phú Thọ', N'Tham quan khu di tích Đền Hùng - một quần thể kiến trúc thâm nghiêm trên núi Nghĩa Lĩnh.//Thưởng thức chương trình biểu diễn Hát Xoan - Di sản văn hóa phi vật thể của nhân loại.//Tham quan vườn quốc gia Xuân Sơn.//Thăm làng cổ Đường Lâm - nơi vẫn giữ được hầu hết các đặc trưng cơ bản của một ngôi làng người Việt với cổng làng, cây đa, bến nước, sân đình, chùa, miếu, điếm canh, giếng nước, ruộng nước, gò đồi.//Viếng chùa Dâu - ngôi chùa cổ nhất Việt Nam', N'NGÀY 01: TP.HCM - NỘI BÀI - PHÚ THỌ (Ăn trưa, chiều)//Buổi sáng, quý khách tập trung tại Ga đi trong nước - Sân bay Tân Sơn Nhất. Khởi hành ra Hà Nội (chuyến sáng). Xe đón đoàn tại sân bay Nội Bài, khởi hành đến Phú Thọ. Đoàn tham quan khu di tích Đền Hùng, đền Lạc Long Quân, bảo tàng Hùng Vương. Buổi chiều, đoàn đến tham quan miếu Lãi Lèn, đình làng Hùng Lô - một trong những ngôi đình cổ nhất tỉnh Phú Thọ. Thưởng thức chương trình biểu diễn Hát Xoan - Di sản văn hóa phi vật thể của nhân loại. Nghỉ đêm tại KS Sài Gòn-Phú Thọ.//NGÀY 02: VQG XUÂN SƠN - ĐỒI CHÈ TÂN SƠN - ĐƯỜNG LÂM - HÀ NỘI (Ăn sáng, trưa, chiều)//Khởi hành đến tham quan vườn quốc gia Xuân Sơn, đoàn ngắm cảnh và chụp hình tại đồi chè Long Cốc (xã Tân Sơn). Đoàn theo quốc lộ 32, đến tham quan làng cổ Đường Lâm với cây đa, bến nước, đình làng Mông Phụ, chùa Mía, lăng Ngô Quyền... Tiếp tục về Hà Nội. Nghỉ đêm tại Hà Nội.//NGÀY 03: BẮC NINH “BÊN KIA SÔNG ĐUỐNG” - HÀ NỘI (Ăn sáng, trưa, chiều)//Đoàn đến Bắc Ninh viếng chùa Dâu - ngôi chùa cổ nhất Việt Nam, đền thờ Sỹ Nhiếp, chùa Bút Tháp với lịch sử lâu đời và kiến trúc độc đáo . Xe đưa đoàn men theo sông Đuống, đến thăm lăng Kinh Dương Vương, làng tranh Đông Hồ. Đoạn đường này sẽ trở nên đẹp hơn vào tháng 11, 12  khi những cánh đồng hoa cải vàng nở rực rỡ. Buổi chiều, đoàn qua cầu Hồ, viếng chùa Phật Tích - ngôi cổ tự có từ thời Lý với pho tượng Phật Di Đà được xem là bảo vật quốc gia. Trở về Hà Nội. Nghỉ đêm tại Hà Nội.//NGÀY 04: HÀ NỘI - TP.HCM (Ăn sáng, trưa)//Buổi sáng, tham quan Hoàng Thành Thăng Long, ngắm cột cờ Hà Nội. Đoàn tham quan phố cổ Hà Nội bằng xe điện, mua sắm tại chợ Đồng Xuân... Xe đưa đoàn ra sân bay Nội Bài, đáp chuyến bay về lại TP.HCM (chuyến chiều). Kết thúc chương trình (Quý khách tự túc phương tiện về lại nhà).

', N'Hồ Chí Minh', CAST(N'2019-03-31 07:15:00.000' AS DateTime), CAST(N'2019-04-04 18:00:00.000' AS DateTime), N'4 ngày 3 đêm', N'dia-diem-tham-quan-o-phu-tho-dip-gio-to-hung-vuong_1456849983_1-0926.jpg;hanoi-attractions.jpg;ho_guom-15_43_15_250.jpg', 6000000, 5280000, 30, N'máy bay', N'tg009')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'SVN1', N'SVN', N'Hồ Chí Minh - Phú Quốc', N'Viếng Thiền Viện Trúc Lâm Hộ Quốc ngôi chùa đẹp và lớn nhất đảo ngọc. Tắm biển Bãi Sao (hoặc bãi Ông Lang) - một trong những bãi biển đẹp nhất tại Phú Quốc', N'NGÀY 01: TP. H? CHÍ MINH - PHÚ QU?C (An chi?u)//Bu?i sáng, quý khách t?p trung t?i C?ng D4, Ga di trong nu?c, sân bay Tân Son Nh?t. Kh?i hành di Phú Qu?c  lúc 16h20. Xe và HDV dón khách t?i sân bay và dua v? khách  s?n ngh? ngoi. T?i t? do d?o ch? dêm Dinh C?u,sinh ho?t t? do.//NGÀY 02: THAM QUAN PHÚ QU?C (An sáng, trua, chi?u)//Sau b?a sáng, doàn tham quan trung tâm nuôi c?y ng?c trai Phú Qu?c, vi?ng Thiên Vi?n Trúc Lâm H? Qu?c ngôi chùa d?p và l?n nh?t d?o ng?c, doàn  ti?p t?c kh?i hành di t?m bi?n Bãi Sao (ho?c bãi Ông Lang tùy di?u ki?n th?i ti?t) - m?t trong nh?ng bãi bi?n d?p nhâ´t t?i Phú Qu?c.//Tham gia lo?i hình du l?ch m?i “Ði b? du?i dáy bi?n” t?i Bãi Sao: T?i dây du khách du?c nhân viên chuyên nghi?p hu?ng d?n và d?t b?n d?n v?i dáy d?i duong. B?n du?c d?o bu?c gi?a dòng d?i duong t?n m?t nhìn nh?ng r?n san hô d?p và r?t nhi?u loài cá quý t?i công viên b?o t?n san hô d?u tiên và duy nh?t t?i Phú Qu?c, du?c c?p phép b?i co quan b?o t?n bi?n Phú Qu?c. ( t? túc chi phí)//NGÀY 03: PHÚ QU?C - TP. H? CHÍ MINH (An sáng)//Quý khách t? do t?m bi?n t?i resort, tr? phòng. Xe dua quý khách xe và HDV dua quý khách di chuy?n ra sân bay Phú Qu?c bay v? Tp.H? Chí Minh lúc 10h40. K?t thúc chuong trình. (Quý khách t? túc phuong ti?n t? sân bay v? l?i nhà).', N'Hồ Chí Minh', CAST(N'2019-05-22 17:30:00.000' AS DateTime), CAST(N'2019-05-25 13:00:00.000' AS DateTime), N'3 ngày 2 đêm', N'phu-quoc.jpg;tf_160729_bien phu quoc.jpg', 6969000, 5061000, 30, N'máy bay', N'tg001')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'SVN2', N'SVN', N'Hồ Chí Minh - Cái Bè - Cần Thơ - Châu Đốc - Hà Tiên', N'Tham quan nhà xưa Nam bộ hơn trăm năm tuổi, theo lối kiến trúc Pháp - Việt (tùy theo thủy triều). Viếng Lăng Thoại Ngọc Hầu - danh nhân có công khai mở đất An Giang. Viếng Chùa Hang - ngôi chùa gắn liền với truyền thuyết 2 con rắn lớn biết nghe kinh Phật. Viếng lăng Mạc Cửu - người có công khai trấn đất Hà Tiên vào thế kỷ 18', N'NGÀY 1: TP. H? CHÍ MINH - CÁI BÈ - C?N THO  (An sáng, trua, chi?u)//Ðón quý khách t?i van phòng Saigontourist, kh?i hành di Cái Bè. Ð?n Cái Bè, lên thuy?n tham quan, tìm hi?u qui trình lò c?m, k?o d?a, nuôi ong và thu?ng th?c trà m?t ong. Lên cù lao An Bình tham quan nhà xua Nam b? hon tram nam tu?i, theo l?i ki?n trúc Pháp - Vi?t (tùy theo th?y tri?u). Tham quan vu?n uom cây gi?ng các lo?i cây an trái nhi?t d?i. Nh?n phòng và ngh? dêm t?i C?n Tho.//NGÀY 2 : C?N THO - CHÂU Ð?C  (An sáng, trua, chi?u)//Ðoàn d?n khu v?c c?u di b? C?n Tho (c?u Tình Yêu), ng?m c?nh Tây Ðô bên dòng sông H?u. Vi?ng Thi?n vi?n Trúc Lâm Phuong Nam - thi?n vi?n l?n nh?t mi?n Tây. Kh?i hành di Châu Ð?c. Bu?i chi?u vi?ng Mi?u Bà Chúa X?, Tây An c? t?, Lang Tho?i Ng?c H?u - danh nhân có công khai m? d?t An Giang, Chùa Hang - ngôi chùa g?n li?n v?i truy?n thuy?t 2 con r?n l?n bi?t nghe kinh Ph?t. Ngh? dêm t?i Châu Ð?c.//NGÀY 3: CHÂU Ð?C - HÀ TIÊN (An sáng, trua, chi?u)//Kh?i hành di Hà Tiên. Trên du?ng tham quan r?ng tràm Trà Su, theo nh?ng con r?ch xuyên qua Lung Sen và khu R?ng Gi?ng, lên tháp v?ng c?nh cao 23m nhìn toàn c?nh r?ng tràm. Ði Hà Tiên d?c kênh Vinh T?. Vi?ng lang M?c C?u; tham quan Th?ch Ð?ng, bãi bi?n Mui Nai.  Ngh? dêm t?i Hà Tiên.//NGÀY 4: HÀ TIÊN - TP. H? CHÍ MINH  (An sáng, trua)//Bu?i sáng kh?i hành v? TP. HCM. Ð?n TP.HCM, dua quý khách v? van phòng Saigontourist. K?t thúc chuong trình

', N'Hồ Chí Minh', CAST(N'2019-05-10 00:00:00.000' AS DateTime), CAST(N'2019-05-14 13:00:00.000' AS DateTime), N'4 ngày 3 đêm', N'ha-tien.jpg;mien-tay-01-1000x1000.png;tf_170216024107_375433.jpg', 4429000, 2215000, 40, N'xe du lịch', N'tg002')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'SVN3', N'SVN', N'Hà Nội - Côn Đảo', N'Tham quan Làng Cỏ Ống, Nghĩa địa Hàng Keo, Cảng Bến Đầm, Chuồng Cọp Pháp - Mỹ, hệ thống biệt giam đặc biệt tại Côn Đảo, Chuồng Bò, nơi tra tấn man rợ của nhà cầm quyền. Miếu bà Phi Yến, nơi thờ phượng bà Lê Thị Râm, thứ phi của chúa Nguyễn Ánh. Cầu Ma Thiên Lãnh, một cây cầu được làm dang dở nói lên mục đích của nhà cầm quyền là giết dần tù nhân bằng cách khiêng từng tảng đá để làm cây cầu nhưng không bao giờ hoàn thành. Tham quan thành phố Cần Thơ - ngắm nhìn những con đường với nhiều cửa hàng sống động và những toà nhà được xây dựng theo kiến trúc kết hợp giữa phương Đông và phương Tây, viếng Chùa Hoa - thờ Quan Thánh Đế, chùa Khmer Nam Bộ, Bảo tàng văn hoá Cần Thơ, đi Chợ Nổi Cái Răng...', N'Ngày 01: HÀ NỘI - CẦN THƠ - CÔN ĐẢO  (Ăn trưa, chiều)//04.00: Đón du khách tại văn phòng Saigontourist Hà Nội , đưa ra sân bay Nội Bài đáp chuyến bay VN1203 đi Cần Thơ (DKCC 06h30 – 08h40). Tới sân bay Cần Thơ, đoàn làm thủ tục nối chuyến VN8068 đi Côn Đảo (DKCC 09h50 – 10h45). Xe và HDV đón Quý khách tại sân bay Cỏ Ống đưa về trung tâm, trên đường đi sẽ qua các địa danh: Làng Cỏ Ống mang tên một loại cỏ hình ống, chiều cao từ nửa thước trở lên, Lò Vôi – được người Pháp xây nên nhằm sản xuất vôi và kết hợp một số phụ gia tạo thành chất kết dính thay cho xi măng. Du khách về khách sạn nhận phòng, nghỉ ngơi. Buổi chiều đoàn đi tham quan: Nghĩa địa Hàng Keo – nghĩa địa đầu tiên tại Côn Đảo, Cảng Bến Đầm, cảng lớn nhất tại Côn Đảo, là địa điểm hoạt động trung chuyển hàng hóa, hành khách, giao dịch, buôn bán thủy sản và cung ứng các dịch vụ hậu cần nghề biển. Mũi Cá Mập, mỏm núi vươn dài ra biển có hình tượng giống hàm cá mập. Đỉnh Tình Yêu là chóp núi có hình tượng của đôi trai gái đang tâm tình mà thiên nhiên đã ban tặng cho Côn Đảo. Bãi Nhát, một bãi tắm bị tác động của thuỷ triều, khi nước xuống sẽ lộ thiên một bãi tắm với cát trắng mịn, nước trong xanh. Ăn tối và nghỉ đêm tại Sài Gòn Côn Đảo Resort.//Ngày  02:  CÔN ĐẢO (Ăn sáng, trưa, chiều)//Sau bữa sáng, Xe và thuyết minh viên Bảo Tàng đưa đoàn tham quan Bảo Tàng Côn Đảo, nơi lưu giữ các tư liệu và hình ảnh của Côn Đảo từ thời Pháp thuộc đến những năm 2000. Trại Phú Hải, trại giam đầu tiên được xây dựng tại Côn Đảo, nơi có truyền thuyết về hầm Xay Lúa, Cầu tàu 914, Nơi đầu tiên được xây dựng trên đất Côn Đảo, với con số ước tính số tù nhân bị thiệt mạng là 914 người, Nghĩa trang Hàng Dương, nơi yên nghỉ của hàng vạn chiến sĩ Cách mạng và những người yêu nước Việt Nam qua nhiều thế hệ bị tù đày khổ sai và đặc biệt là mộ cô Võ Thị Sáu  rất linh thiêng. Chuồng Cọp Pháp - Mỹ, hệ thống biệt giam đặc biệt tại Côn Đảo, Chuồng Bò, nơi tra tấn man rợ của nhà cầm quyền. Miếu bà Phi Yến, nơi thờ phượng bà Lê Thị Râm, thứ phi của chúa Nguyễn Ánh. Cầu Ma Thiên Lãnh, một cây cầu được làm dang dở nói lên mục đích của nhà cầm quyền là giết dần tù nhân bằng cách khiêng từng tảng đá để làm cây cầu nhưng không bao giờ hoàn thành. Quay về resort nghỉ ngơi. Buổi chiều, Quý khách tự do thăm quan Côn Đảo. Ăn tối và nghỉ đêm tại Sài Gòn Côn Đảo Resort.//Ngày 03: CÔN ĐẢO - CẦN THƠ  (Ăn sáng, trưa, chiều)//Sau bữa sáng, đoàn làm thủ tục trả phòng, xe tiễn đoàn ra Sân bay Cỏ Ống làm thủ tục đáp chuyến VN8071 đi Cần Thơ (DKCC 09h20 - 11h40). Xe đón đoàn về nhận phòng khách sạn. Ăn trưa tại Nhà hàng. Chiều thăm quan Thành phố Cần Thơ, viếng Chùa Hoa - thờ Quan Thánh Đế, chùa Khmer Nam Bộ, Bảo tàng văn hoá Cần Thơ, tham quan và mua sắm tại chợ cổ Cần Thơ hoặc Trung tâm Thương Mại Cái Khế. Sau bữa tối, tự do dạo chơi Bến Ninh Kiều. Nghỉ đêm tại Cần Thơ.//Ngày 04: CẦN THƠ - HÀ NỘI  (Ăn sáng)//Sáng sớm, du khách xuống thuyền đi thăm quan Chợ Nổi Cái Răng (một trong những chợ nổi lớn nhất Đồng Bằng sông Cửu Long), theo các món hàng treo trên cây chèo bẻo, ở đầu ghe, Quay về khách sạn, đoàn dùng bữa sáng, trả phòng. Xe tiễn đoàn ra Sân bay Cần Thơ đáp chuyến bay VN1202 về Hà Nội (DKCC 09h20 - 11h25). Xe đón du khách tại sân bay Nội Bài  đưa về điểm đón ban đầu. Kết thúc chuyến tham quan.

', N'Hà Nội', CAST(N'2019-06-11 04:00:00.000' AS DateTime), CAST(N'2019-06-15 13:00:00.000' AS DateTime), N'4 ngày 3 đêm', N'c0dd2847a0924e02a9b56feda526cfdb.jpg;du-lich-mien-tay-con-dao-gia-tiet-kiem-2018_du-lich-viet-450x225.jpg', 6250000, 4570000, 40, N'xe du lịch', N'tg003')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'SVN4', N'SVN', N'Hồ Chí Minh - Hồ Tràm', N'Trải nghiệm dịch vụ 5 sao cao cấp tại The Grand Ho Tram Strip. Nghỉ ngơi thư giãn và tự do tắm biển tại bãi biển riêng của The Grand Ho Tram Strip', N'NGÀY 01: TP. HỒ CHÍ MINH - HỒ TRÀM (Ăn trưa, chiều)//09h00 : Quý khách tập trung tại một điểm đón duy nhất: văn phòng Saigontourist 01 Nguyễn Chí Thanh, Q.5. Khởi hành đi Hồ Tràm. Dừng chân viếng chùa Đại Tòng Lâm. Đến Hồ Tràm, quý khách nhận phòng tại The Grand Ho Tram Strip - khu phức hợp nghỉ dưỡng đạt tiêu chuẩn 5 sao cực kỳ sang trọng. Buổi chiều, quý khách nghỉ ngơi, tắm biển, tận hưởng các dịch vụ - tiện nghi cao cấp và sang trọng tại The Grand Ho Tram Strip. Quý khách có thể tham gia loại hình giải trí trò chơi có thưởng tại casino lớn nhất Việt Nam (chỉ áp dụng với khách có quốc tịch nước ngoài) Nghỉ đêm tại Hồ Tràm.//NGÀY 02: HỒ TRÀM - TP.HCM  (Ăn sáng, trưa)//Buổi sáng, quí khách tự do tắm biển, nghỉ ngơi đến giờ trả phòng. Khởi hành về TP. HCM, đưa quý khách về điểm đón ban đầu. Kết thúc chương trình.', N'Hồ Chí Minh', CAST(N'2019-06-11 04:00:00.000' AS DateTime), CAST(N'2019-06-13 14:00:00.000' AS DateTime), N'2 ngày 3 đêm', N'317166_636790956216747438.jpg;ho-tram-outside.jpg', 2000000, 1000000, 30, N'xe du lịch', N'tg004')
INSERT [dbo].[Tour] ([tourID], [tourCategoryID], [journey], [description], [agenda], [departure], [timeBegin], [timeEnd], [timeLiving], [picture], [priceForAdult], [priceForKid], [quantityPassenger], [vehicle], [tourGuideID]) VALUES (N'SVN5', N'SVN', N'Rạch Giá - Nam Du', N'Chiêm ngưỡng vẻ đẹp của quần đảo Nam Du với Bãi Ngự, Bãi Cây Mến, Hòn Hai Bờ Đập, Hòn Mấu… cùng non xanh, nước biếc, làm say lòng người lữ khách gần xa. Thỏa thích thưởng thức hải sản cháo Nhum, Cá Biển Nướng, Cầu Gai (Nhum) nướng mỡ hành và mua sắm sản vật trên đảo', N'NGÀY 1: RẠCH GIÁ - NAM DU (Ăn sáng, trưa, tối)//HDV Saigontourist đón quý khách tại bến tàu Rạch Giá. Dùng bánh mì làm điểm tâm.
Lên tàu Superdong khởi hành đi đảo Nam Du chuyến 06h15. Trên đường đi quý khách có thể ngắm nhìn những hòn đảo hoang sơ tuyệt đẹp như: Hòn Tre, Hòn Sơn... //Sau hành trình khoảng 2h30 lênh đênh trên vùng biển Tây Nam tổ quốc, Quý khách đến đảo Nam Du, một quần đảo nằm trong vịnh Thái Lan gồm 21 hòn đảo lớn nhỏ. Với cảnh sắc hoang sơ, nước biển trong vắt hứa hẹn sẽ là nơi nghỉ mát lý tưởng.
Đoàn sử dụng xe máy tham quan một vòng quanh đảo Nam Du. Ngắm toàn cảnh Bãi Ngự từ trên cao – là bãi tắm sạch đẹp vào mùa gió nam và có dấu ấn rất đặc biệt vì là nơi vua Gia Long đã từng ngự giá. Dùng cơm trưa. Đoàn nhận phòng nghỉ ngơi.//Đoàn tự do tắm biển và thưởng thức dừa Nam Du (chi phí tự túc) tại Bãi Cây Mến – một trong những bãi biển đẹp nhất tại đảo Nam Du.//Ăn tối với các món hải sản tươi ngon vùng biển Đảo.//Tự do khám phá đảo Nam Du về đêm, tìm hiểu cuộc sống của người dân nơi đây.//NGÀY 2: NAM DU – RẠCH GIÁ (Ăn sáng, trưa)// Ăn sáng.  Trả phòng.//Quý khách ra bến cảng, lên tàu chinh phục những hòn đảo hoang sơ xung quanh Nam Du. Đoàn đến bãi biển xanh trong của Hòn Hai Bờ Đập, quý khách tham gia câu cá, bắt Nhum (cầu Gai), lặn biển ngắm san hô và thưởng thức Cháo Nhum.//Quý khách đến với Hòn Mấu với bãi cát trắng tinh, nước trong vắt, từng hàng dừa soi bóng bên bãi biển vắng chân người. (Chi phí nước uống tự túc)//Quay về đất liền dùng cơm trưa. //Tự do đi dạo khám phá chợ trên đảo, mua hải sản, đặc sản địa phương về làm quà. 
Lên tàu Superdong chuyến 14h40 về lại Rạch Giá. //Tàu cập cảng Rạch Giá. HDV nói lời chào tạm biệt và hẹn gặp lại Quý khách.', N'Rạch Giá', CAST(N'2019-06-11 04:00:00.000' AS DateTime), CAST(N'2019-06-13 14:00:00.000' AS DateTime), N'2 ngày 3 đêm', N'300px-Nha_tho_GX_Rach_Gia.jpg;du-lich-dao-Nam-Du.jpg;du-lich-Rach-Gia-kinh-nghiem-va-thong-tin-huu-ich.jpg', 1600000, 890000, 30, N'tàu cao tốc', N'tg005')
INSERT [dbo].[TourCategory] ([categoryID], [name]) VALUES (N'AFR', N'Châu Phi')
INSERT [dbo].[TourCategory] ([categoryID], [name]) VALUES (N'AME', N'Châu Mỹ')
INSERT [dbo].[TourCategory] ([categoryID], [name]) VALUES (N'ASIA', N'Châu Á')
INSERT [dbo].[TourCategory] ([categoryID], [name]) VALUES (N'AUS', N'Châu Úc')
INSERT [dbo].[TourCategory] ([categoryID], [name]) VALUES (N'EURO', N'Châu Âu')
INSERT [dbo].[TourCategory] ([categoryID], [name]) VALUES (N'MVN', N'Miền Trung')
INSERT [dbo].[TourCategory] ([categoryID], [name]) VALUES (N'NVN', N'Miền Bắc')
INSERT [dbo].[TourCategory] ([categoryID], [name]) VALUES (N'SVN', N'Miền Nam')
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg001', N'Phạm Minh Mẫn', N'123 Huỳnh Khương An phường 05 Gò Vấp HCM', N'0931778893', N'tg001@gmail.com', CAST(N'1990-01-02' AS Date))
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg002', N'Trần Gia Bích', N'234 Ngô Quyền phường 07 quận 3 HCM', N'0995422139', N'tg002@gmail.com', CAST(N'1990-03-02' AS Date))
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg003', N'Lê Quỳnh', N'345 Tô Ký phường Tân Thới Hiệp quận 12 HCM', N'0981234567', N'tg003@gmail.com', CAST(N'1991-04-03' AS Date))
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg004', N'Phạm Quỳnh Trâm', N'Bình Định', N'0991213939', N'tg004@gmail.com', CAST(N'1991-05-04' AS Date))
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg005', N'Lê Anh Phan', N'Củ Chi', N'0978654312', N'tg005@gmail.com', CAST(N'1992-06-05' AS Date))
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg006', N'Nguyễn Bảo Trân', N'Long An', N'0998124568', N'tg006@gmail.com', CAST(N'1992-07-06' AS Date))
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg007', N'Trần Minh', N'Bến Tre', N'0972498225', N'tg007@gmail.com', CAST(N'1993-08-07' AS Date))
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg008', N'Trịnh Kim Chi', N'Gia Lai', N'0966452743', N'tg008@gmail.com', CAST(N'1993-09-08' AS Date))
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg009', N'Trần Nguyễn', N'456 Huỳnh Văn Bánh phường 14 quận Phú Nhuận TPHCM', N'0998724556', N'tg009@gmail.com', CAST(N'1994-10-09' AS Date))
INSERT [dbo].[TourGuide] ([tourGuideID], [fullname], [address], [phone], [email], [birthday]) VALUES (N'tg010', N'Ngô Giang', N'567 D2 phường 12 quận Bình Thạnh TPHCM', N'0972428556', N'tg010@gmail.com', CAST(N'1994-11-10' AS Date))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Customer] FOREIGN KEY([username])
REFERENCES [dbo].[Customer] ([username])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Customer]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Tour] FOREIGN KEY([tourID])
REFERENCES [dbo].[Tour] ([tourID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Tour]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([orderStatus])
REFERENCES [dbo].[OrderStatus] ([statusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Tour] FOREIGN KEY([tourID])
REFERENCES [dbo].[Tour] ([tourID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Tour]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_Order]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Account]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_TourCategory] FOREIGN KEY([tourCategoryID])
REFERENCES [dbo].[TourCategory] ([categoryID])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_TourCategory]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_TourGuide] FOREIGN KEY([tourGuideID])
REFERENCES [dbo].[TourGuide] ([tourGuideID])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_TourGuide]
GO
ALTER TABLE [dbo].[TourGuide]  WITH CHECK ADD  CONSTRAINT [FK_TourGuide_Account] FOREIGN KEY([tourGuideID])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[TourGuide] CHECK CONSTRAINT [FK_TourGuide_Account]
GO
USE [master]
GO
ALTER DATABASE [TourManagement] SET  READ_WRITE 
GO
