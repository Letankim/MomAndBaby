USE [database_mom_baby]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[email] [varchar](1000) NOT NULL,
	[phone] [varchar](1000) NOT NULL,
	[status] [tinyint] NOT NULL,
	[fullname] [nvarchar](200) NULL,
	[date] [datetime] NOT NULL,
	[role] [int] NOT NULL,
	[avatar] [nchar](1000) NULL,
 CONSTRAINT [PK__User__3214EC271AACD699] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[img] [varchar](500) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[status] [tinyint] NOT NULL,
	[datePost] [datetime] NOT NULL,
	[dateUpdate] [datetime] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[email] [varchar](1000) NOT NULL,
	[customerName] [nvarchar](100) NOT NULL,
	[phone] [varchar](100) NOT NULL,
	[address] [nvarchar](1000) NOT NULL,
	[detailAddress] [nvarchar](1000) NULL,
	[total] [float] NOT NULL,
	[status] [tinyint] NOT NULL,
	[payment] [tinyint] NOT NULL,
	[dateOrder] [datetime] NOT NULL,
	[dateUpdate] [datetime] NULL,
	[transactionCode] [nvarchar](50) NULL,
	[voucherID] [int] NULL,
 CONSTRAINT [PK__Bill__3214EC273703A317] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[billID] [int] NOT NULL,
	[imgProduct] [varchar](2000) NOT NULL,
	[numberOfProduct] [int] NOT NULL,
	[priceProduct] [float] NOT NULL,
	[nameProduct] [nvarchar](1000) NOT NULL,
	[size] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](500) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[image] [nvarchar](200) NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[view] [bigint] NOT NULL,
	[categoryID] [int] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[img] [varchar](500) NOT NULL,
	[datePost] [datetime] NOT NULL,
	[dateUpdate] [datetime] NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[totalPrice] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[productID] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NOT NULL,
	[datePost] [datetime] NOT NULL,
	[dateUpdate] [datetime] NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK__Category__3214EC2763872BFD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[district_id] [int] NOT NULL,
	[province_id] [int] NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[feedback] [nvarchar](1000) NOT NULL,
	[star] [int] NOT NULL,
	[status] [tinyint] NOT NULL,
	[datePost] [datetime] NOT NULL,
	[dateUpdate] [datetime] NULL,
 CONSTRAINT [PK__Comment__3214EC27AE11BE00] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgDescription]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgDescription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[imgUrl] [varchar](1000) NOT NULL,
	[productID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NOT NULL,
	[datePost] [datetime] NOT NULL,
	[dateUpdate] [datetime] NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK__Producer__3214EC27087E67DC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NOT NULL,
	[oldPrice] [float] NOT NULL,
	[newPrice] [float] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[datePost] [datetime] NOT NULL,
	[dateUpdate] [datetime] NULL,
	[mainImg] [varchar](2000) NOT NULL,
	[status] [tinyint] NOT NULL,
	[quantity] [int] NOT NULL,
	[sold] [int] NULL,
	[model] [varchar](100) NOT NULL,
	[priority] [tinyint] NOT NULL,
	[categoryID] [int] NOT NULL,
	[producerID] [int] NOT NULL,
	[brandID] [int] NOT NULL,
 CONSTRAINT [PK__Product__3214EC27D5ABB81D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[province_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[type] [tinyint] NOT NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[used]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[used](
	[accountID] [int] NOT NULL,
	[voucherID] [int] NOT NULL,
	[dateUse] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC,
	[voucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[code] [nvarchar](50) NULL,
	[value] [float] NOT NULL,
	[start] [date] NOT NULL,
	[end] [date] NOT NULL,
	[status] [tinyint] NOT NULL,
	[limit] [float] NULL,
	[used] [varchar](max) NULL,
 CONSTRAINT [PK_voucher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wards]    Script Date: 5/21/2024 11:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wards](
	[wards_id] [int] NOT NULL,
	[district_id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[wards_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [username], [password], [email], [phone], [status], [fullname], [date], [role], [avatar]) VALUES (1, N'Letankim2003', N'123456789', N'letankim2003@gmail.com', N'0865341744', 1, N'Lê Tấn Kim', CAST(N'2024-05-17T11:26:13.943' AS DateTime), 1, N'./uploads/account/051724015123_icon-cursor.png                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ')
INSERT [dbo].[Account] ([ID], [username], [password], [email], [phone], [status], [fullname], [date], [role], [avatar]) VALUES (8, N'tankim2810', N'123456789', N'KimLTCE170469@fpt.edu.vn', N'0865341745', 1, N'Đặng Phước Ân', CAST(N'2024-05-17T14:46:31.113' AS DateTime), 1, N'./admin/assets/images/default_avatar.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[Account] ([ID], [username], [password], [email], [phone], [status], [fullname], [date], [role], [avatar]) VALUES (9, N'tankim2003', N'123456789', N'letankim2810@gmail.com', N'0865341745', 1, N'Le Tan Kim', CAST(N'2024-05-17T15:18:53.433' AS DateTime), 3, N'./admin/assets/images/default_avatar.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[Account] ([ID], [username], [password], [email], [phone], [status], [fullname], [date], [role], [avatar]) VALUES (11, N'tankim2003user', N'123456789', N'cuong1952k3@gmail.com', N'0865341745', 1, N'Le Tan Kim', CAST(N'2024-05-17T15:55:49.737' AS DateTime), 2, N'./static-admin/assets/images/default_avatar.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[Account] ([ID], [username], [password], [email], [phone], [status], [fullname], [date], [role], [avatar]) VALUES (15, N'tankim2k3', N'123456789', N'letankim2k3@gmail.com', N'0865341745', 1, N'Lê Tấn Kim', CAST(N'2024-05-20T12:46:39.630' AS DateTime), 2, N'./static-admin/assets/images/default_avatar.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([ID], [img], [name], [status], [datePost], [dateUpdate]) VALUES (4, N'./uploads/banner/051824095231_slide1.png', N'Slide 1', 1, CAST(N'2024-05-18T21:52:31.737' AS DateTime), NULL)
INSERT [dbo].[Banner] ([ID], [img], [name], [status], [datePost], [dateUpdate]) VALUES (5, N'./uploads/banner/051824095239_slide2.png', N'Slide 2', 1, CAST(N'2024-05-18T21:52:39.167' AS DateTime), NULL)
INSERT [dbo].[Banner] ([ID], [img], [name], [status], [datePost], [dateUpdate]) VALUES (6, N'./uploads/banner/051824095246_slide3.png', N'Slide 3', 1, CAST(N'2024-05-18T21:52:46.037' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [name], [img], [datePost], [dateUpdate], [status]) VALUES (3, N'HP', N'./uploads/brand/051724113834_logo.png', CAST(N'2024-05-17T23:38:34.220' AS DateTime), NULL, 1)
INSERT [dbo].[Brand] ([ID], [name], [img], [datePost], [dateUpdate], [status]) VALUES (4, N'Veritas', N'./uploads/brand/051924015815_vertitas.png', CAST(N'2024-05-19T01:58:15.110' AS DateTime), NULL, 1)
INSERT [dbo].[Brand] ([ID], [name], [img], [datePost], [dateUpdate], [status]) VALUES (5, N'Vinamilk', N'./uploads/brand/052124105148_ide.png', CAST(N'2024-05-21T22:51:48.290' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([ID], [accountID], [totalPrice], [quantity], [productID]) VALUES (21, 15, 300, 3, 6)
INSERT [dbo].[Cart] ([ID], [accountID], [totalPrice], [quantity], [productID]) VALUES (22, 15, 120, 2, 9)
INSERT [dbo].[Cart] ([ID], [accountID], [totalPrice], [quantity], [productID]) VALUES (23, 15, 240, 2, 8)
INSERT [dbo].[Cart] ([ID], [accountID], [totalPrice], [quantity], [productID]) VALUES (24, 15, 80, 1, 10)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [name], [datePost], [dateUpdate], [status]) VALUES (4, N'Milk', CAST(N'2024-05-17T23:38:43.077' AS DateTime), CAST(N'2024-05-20T21:30:50.583' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[ImgDescription] ON 

INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (1, N'./uploads/descriptions/051824123315_banner1.jpg', 9)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (2, N'./uploads/descriptions/051824123315_banner2.jpg', 9)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (3, N'./uploads/descriptions/051824123315_banner4.jpg', 9)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (4, N'./uploads/descriptions/051824125338_banner1.jpg', 7)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (5, N'./uploads/descriptions/051824125338_banner2.jpg', 7)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (6, N'./uploads/descriptions/051824125338_banner4.jpg', 7)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (13, N'./uploads/descriptions/051824125648_11.png', 6)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (14, N'./uploads/descriptions/051824125648_19.png', 6)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (15, N'./uploads/descriptions/051824125648_20.png', 6)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (19, N'./uploads/descriptions/052124105328_arrow_drop_down.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (20, N'./uploads/descriptions/052124105328_arrow-right.svg', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (21, N'./uploads/descriptions/052124105328_avatar-default.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (22, N'./uploads/descriptions/052124105328_background.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (23, N'./uploads/descriptions/052124105328_bar.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (24, N'./uploads/descriptions/052124105328_cisco.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (25, N'./uploads/descriptions/052124105328_facebook.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (26, N'./uploads/descriptions/052124105328_hp.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (27, N'./uploads/descriptions/052124105328_instagram.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (28, N'./uploads/descriptions/052124105328_lenovo.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (29, N'./uploads/descriptions/052124105328_logo.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (30, N'./uploads/descriptions/052124105328_microsoft.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (31, N'./uploads/descriptions/052124105328_neuro.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (32, N'./uploads/descriptions/052124105328_remove.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (33, N'./uploads/descriptions/052124105328_Screenshot 2024-05-21 103504.png', 10)
INSERT [dbo].[ImgDescription] ([ID], [imgUrl], [productID]) VALUES (34, N'./uploads/descriptions/052124105328_tw.png', 10)
SET IDENTITY_INSERT [dbo].[ImgDescription] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([ID], [name], [datePost], [dateUpdate], [status]) VALUES (4, N'Lê Tấn Kim', CAST(N'2024-05-17T23:38:19.137' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [name], [oldPrice], [newPrice], [description], [datePost], [dateUpdate], [mainImg], [status], [quantity], [sold], [model], [priority], [categoryID], [producerID], [brandID]) VALUES (6, N'Lê Tấn Kim', 120, 100, N'<p>Sản phẩm tốt</p>
', CAST(N'2024-05-18T00:30:41.053' AS DateTime), CAST(N'2024-05-20T15:13:52.990' AS DateTime), N'./uploads/product/051824123041_2023.jpg', 1, 5, 0, N'K456', 1, 4, 4, 3)
INSERT [dbo].[Product] ([ID], [name], [oldPrice], [newPrice], [description], [datePost], [dateUpdate], [mainImg], [status], [quantity], [sold], [model], [priority], [categoryID], [producerID], [brandID]) VALUES (7, N'Tả cho em bé sơ sinh', 120, 100, N'<p>Sản phẩm tốt</p>
', CAST(N'2024-05-18T00:31:27.790' AS DateTime), CAST(N'2024-05-19T00:43:54.243' AS DateTime), N'./uploads/product/051824123127_2023.jpg', 1, -1, 0, N'K456', 1, 4, 4, 3)
INSERT [dbo].[Product] ([ID], [name], [oldPrice], [newPrice], [description], [datePost], [dateUpdate], [mainImg], [status], [quantity], [sold], [model], [priority], [categoryID], [producerID], [brandID]) VALUES (8, N'Combo đồ ăn cho trẻ', 120, 0, N'<p>ac</p>
', CAST(N'2024-05-18T00:32:32.750' AS DateTime), CAST(N'2024-05-20T10:54:07.550' AS DateTime), N'./uploads/product/051824123232_banner1.jpg', 1, 2, 0, N'iPhone 15 Pro Max 256GB', 1, 4, 4, 3)
INSERT [dbo].[Product] ([ID], [name], [oldPrice], [newPrice], [description], [datePost], [dateUpdate], [mainImg], [status], [quantity], [sold], [model], [priority], [categoryID], [producerID], [brandID]) VALUES (9, N'Sữa cho trẻ em', 120, 0, N'<table border="1">
	<tbody>
		<tr>
			<td>T&ecirc;n sản phẩm</td>
			<td>Sữa d&ecirc; Kabrita Số 3 800g (từ 2 tuổi)</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Kabrita</td>
		</tr>
		<tr>
			<td>Sản xuất tại</td>
			<td>H&agrave; Lan</td>
		</tr>
		<tr>
			<td>Trọng lượng sản phẩm</td>
			<td>0.8</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất</td>
			<td>Ausnutria Nutrition B.V</td>
		</tr>
		<tr>
			<td>Độ tuổi ph&ugrave; hợp</td>
			<td>Tr&ecirc;n 2 tuổi</td>
		</tr>
		<tr>
			<td>Hướng dẫn sử dụng</td>
			<td>.Pha sản phẩm kh&ocirc;ng qu&aacute; 1 giờ trước khi cho trẻ b&uacute;.<br />
			.Rửa tay thật sạch trước khi pha sản phẩm.<br />
			.Khử tr&ugrave;ng c&aacute;c dụng cụ pha sản phẩm theo hướng dẫn của nh&agrave; sản xuất dụng cụ.<br />
			.Cho v&agrave;o b&igrave;nh đ&uacute;ng lượng nước đun s&ocirc;i, để nguội xuống c&ograve;n 40&deg;C trong thời gian kh&ocirc;ng qu&aacute; 30 ph&uacute;t.<br />
			.Cho lượng sản phẩm đ&atilde; được chỉ định v&agrave;o lượng nước tương ứng.<br />
			.Đậy nắp b&igrave;nh v&agrave; lắc đều cho đến khi bột tan hết. Kiểm tra nhiệt độ ở mặt trong cổ tay của bạn.</td>
		</tr>
		<tr>
			<td>Hướng dẫn bảo quản</td>
			<td>.Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.<br />
			.Đậy k&iacute;n nắp sau khi sử dụng.<br />
			.Sử dụng hết trong v&ograve;ng 4 tuần từ khi mở nắp.</td>
		</tr>
	</tbody>
</table>

<p dir="ltr"><strong>﻿﻿Sữa d&ecirc; Kabrita Số 2</strong>&nbsp;l&agrave; d&ograve;ng sữa dinh dưỡng d&agrave;nh cho b&eacute; từ 2 tuổi, bổ sung đầy đủ chất dinh dưỡng gi&uacute;p b&eacute; ph&aacute;t triển khỏe mạnh, cao lớn v&agrave; th&ocirc;ng minh.&nbsp;</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><img src="https://cdn1.concung.com/storage/2022/09/1663839131.webp" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><strong>Ưu điểm nổi bật&nbsp;</strong></p>

<p dir="ltr">. Hương vị thơm ngon;</p>

<p dir="ltr">. Th&agrave;nh phần độc quyền chuẩn ch&acirc;u &Acirc;u, l&agrave;nh t&iacute;nh với trẻ nhỏ;</p>

<p dir="ltr">. Chứa c&aacute;c th&agrave;nh phần gi&agrave;u đạm: A2 &szlig;-casein, whey:casein;</p>

<p dir="ltr">. Chất xơ h&ograve;a tan GOS tốt cho hệ ti&ecirc;u h&oacute;a;</p>

<p dir="ltr">. Hoạt chất hMOs c&oacute; lợi cho hệ miễn dịch v&agrave; hệ vi sinh đường ruột;</p>

<p dir="ltr">. C&aacute;c th&agrave;nh phần c&oacute; lợi cho n&atilde;o bộ v&agrave; thị gi&aacute;c: DHA, ARA;</p>

<p dir="ltr">. 22 kho&aacute;ng chất v&agrave; Vitamin thiết yếu cho b&eacute;.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><strong>Tỷ lệ pha gợi &yacute;</strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><img src="https://cdn1.concung.com/storage/2022/09/1663839161.webp" /></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><strong>Th&agrave;nh phần</strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Lactose (sữa) 34,6%, sữa d&ecirc; t&aacute;ch b&eacute;o 31,4%, bột sữa d&ecirc; nguy&ecirc;n kem 15%, Galacto-oligosaccharides (sữa) 4,3%, dầu thực vật (dầu dừa, dầu cải, dầu hướng dương), 1,3-Dioleoyl 2-palmitoy triglycerid, kho&aacute;ng chất (Tricalcium dicitrate, Tricalcium diphosphate, Calcium carbonate, Magnesium carbonate, Trisodium citrate, Ferrous sulphate, Zinc sulphate, Calcium chloride, Magnesium chloride, Manganese(II) sulphate, Copper sulphate, potassium iodate, Sodium selenate),&nbsp; dầu c&aacute; (c&oacute; chứa DHA), dầu arachidonic acid, Choline bitartrate, vitamins (Sodium L-ascorbate, L-Ascorbic acid, DL-alpha-Tocopheryl acetate, Nicotinic acid amide (Nicotinamide), Calcium-D-pantothenate, Thiaminchloride hydrochloride, Riboflavin, Pyridoxine hydrochloride, Retinyl acetate, Folic acid (N-Pteroyl-L-glutamic acid), Phylloquinone (2-Methyl-3-phytyl-1,4- naphthoquinone/ Phylloquinone/ Phytonadione), Vitamin D3 = Cholecalciferol, D-Biotin, Cyanocobalamin), Taurine, L-Carnitine, Myo-Inositol (=meso-Inositol).﻿</p>
', CAST(N'2024-05-18T00:33:14.990' AS DateTime), CAST(N'2024-05-20T14:57:17.003' AS DateTime), N'./uploads/product/051824123314_banner1.jpg', 1, 2, 0, N'iPhone 15 Pro Max 256GB', 2, 4, 4, 4)
INSERT [dbo].[Product] ([ID], [name], [oldPrice], [newPrice], [description], [datePost], [dateUpdate], [mainImg], [status], [quantity], [sold], [model], [priority], [categoryID], [producerID], [brandID]) VALUES (10, N'Abc', 100, 80, N'<p>Vinamilk</p>
', CAST(N'2024-05-21T22:53:28.473' AS DateTime), NULL, N'./uploads/product/052124105328_hp.png', 1, 10, 0, N'Z123', 1, 4, 4, 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [name], [type], [status]) VALUES (1, N'admin', 1, 1)
INSERT [dbo].[Role] ([ID], [name], [type], [status]) VALUES (2, N'user', 0, 1)
INSERT [dbo].[Role] ([ID], [name], [type], [status]) VALUES (3, N'staff', 2, 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[voucher] ON 

INSERT [dbo].[voucher] ([ID], [name], [code], [value], [start], [end], [status], [limit], [used]) VALUES (3, N'Lê Tấn Kim', N'H3ALB', 200000, CAST(N'2024-05-20' AS Date), CAST(N'2024-05-22' AS Date), 1, 1000000, N'0')
SET IDENTITY_INSERT [dbo].[voucher] OFF
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__User__status__35BCFE0A]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_customerID]  DEFAULT (NULL) FOR [accountID]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Bill__status__398D8EEE]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__status__24927208]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF__Comment__status__412EB0B6]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Producer] ADD  CONSTRAINT [DF__Producer__status__276EDEB3]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__status__2A4B4B5E]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_sold]  DEFAULT ((0)) FOR [sold]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__priorit__2B3F6F97]  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__customerID__38996AB5] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__customerID__38996AB5]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_voucher] FOREIGN KEY([voucherID])
REFERENCES [dbo].[voucher] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_voucher]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK__BillDetai__billI__3C69FB99] FOREIGN KEY([billID])
REFERENCES [dbo].[Bill] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK__BillDetai__billI__3C69FB99]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Category]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[district]  WITH CHECK ADD  CONSTRAINT [FK_district_province] FOREIGN KEY([province_id])
REFERENCES [dbo].[province] ([province_id])
GO
ALTER TABLE [dbo].[district] CHECK CONSTRAINT [FK_district_province]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Comment__userID__3F466844] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Comment__userID__3F466844]
GO
ALTER TABLE [dbo].[ImgDescription]  WITH CHECK ADD  CONSTRAINT [FK__ImgDescri__produ__300424B4] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImgDescription] CHECK CONSTRAINT [FK__ImgDescri__produ__300424B4]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__2C3393D0] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__2C3393D0]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__produce__2D27B809] FOREIGN KEY([producerID])
REFERENCES [dbo].[Producer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__produce__2D27B809]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[used]  WITH CHECK ADD  CONSTRAINT [FK_used_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[used] CHECK CONSTRAINT [FK_used_Account]
GO
ALTER TABLE [dbo].[used]  WITH CHECK ADD  CONSTRAINT [FK_used_voucher] FOREIGN KEY([voucherID])
REFERENCES [dbo].[voucher] ([ID])
GO
ALTER TABLE [dbo].[used] CHECK CONSTRAINT [FK_used_voucher]
GO
ALTER TABLE [dbo].[wards]  WITH CHECK ADD  CONSTRAINT [FK_wards_district] FOREIGN KEY([district_id])
REFERENCES [dbo].[district] ([district_id])
GO
ALTER TABLE [dbo].[wards] CHECK CONSTRAINT [FK_wards_district]
GO
