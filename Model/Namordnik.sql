DROP DATABASE IF EXISTS [Namordnik]
GO
CREATE DATABASE [Namordnik]
GO
USE [Namordnik]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 15.12.2021 9:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (1, N'Вата серый 1x1', 7, N' м', 191, 34, NULL, CAST(6009.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (2, N'Ткань белый 2x2', 10, N' м', 713, 18, NULL, CAST(13742.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (3, N'Металлический стержень белый 0x2', 9, N' кг', 280, 12, NULL, CAST(10633.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (4, N'Силикон серый 1x1', 2, N' м', 981, 12, NULL, CAST(2343.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (5, N'Силикон белый 0x3', 8, N' кг', 307, 17, NULL, CAST(12097.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (6, N'Силикон белый 1x3', 4, N' кг', 345, 46, NULL, CAST(13550.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (7, N'Ткань серый 0x3', 10, N' м', 965, 17, NULL, CAST(15210.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (8, N'Резинка зеленый 1x0', 8, N' кг', 256, 9, NULL, CAST(32616.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (9, N'Металлический стержень белый 2x2', 9, N' м', 65, 36, NULL, CAST(36753.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (10, N'Ткань синий 3x3', 5, N' м', 387, 39, NULL, CAST(32910.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (11, N'Ткань белый 3x2', 9, N' м', 398, 25, NULL, CAST(782.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (12, N'Вата розовый 1x0', 3, N' м', 589, 32, NULL, CAST(35776.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (13, N'Вата серый 3x2', 5, N' кг', 471, 40, NULL, CAST(20453.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (14, N'Ткань розовый 0x0', 3, N' м', 654, 29, NULL, CAST(41101.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (15, N'Металлический стержень цветной 3x1', 4, N' м', 988, 49, NULL, CAST(55742.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (16, N'Резинка синий 1x0', 3, N' кг', 191, 11, NULL, CAST(1407.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (17, N'Металлический стержень цветной 1x2', 8, N' м', 173, 26, NULL, CAST(26137.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (18, N'Ткань цветной 2x1', 2, N' м', 993, 34, NULL, CAST(15628.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (19, N'Силикон белый 2x0', 10, N' м', 851, 38, NULL, CAST(22538.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (20, N'Силикон зеленый 3x1', 2, N' м', 776, 46, NULL, CAST(17312.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (21, N'Вата серый 3x3', 1, N' кг', 237, 12, NULL, CAST(19528.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (22, N'Вата белый 2x0', 8, N' кг', 983, 49, NULL, CAST(38432.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (23, N'Вата розовый 3x1', 3, N' кг', 246, 41, NULL, CAST(44015.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (24, N'Ткань синий 2x0', 4, N' м', 146, 16, NULL, CAST(19507.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (25, N'Металлический стержень зеленый 2x2', 4, N' м', 478, 34, NULL, CAST(32205.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (26, N'Резинка зеленый 0x0', 7, N' м', 594, 19, NULL, CAST(42640.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (27, N'Ткань синий 0x2', 8, N' кг', 841, 21, NULL, CAST(27338.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (28, N'Ткань зеленый 2x2', 4, N' м', 692, 7, NULL, CAST(55083.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (29, N'Металлический стержень синий 0x1', 9, N' м', 259, 20, NULL, CAST(19715.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (30, N'Резинка белый 3x3', 1, N' м', 586, 26, NULL, CAST(35230.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (31, N'Резинка зеленый 3x0', 10, N' кг', 976, 40, NULL, CAST(41227.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (32, N'Ткань белый 1x3', 8, N' м', 492, 9, NULL, CAST(38232.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (33, N'Силикон цветной 1x0', 10, N' м', 843, 28, NULL, CAST(34664.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (34, N'Силикон зеленый 0x3', 9, N' кг', 124, 35, NULL, CAST(24117.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (35, N'Вата серый 0x1', 8, N' м', 25, 38, NULL, CAST(42948.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (36, N'Металлический стержень белый 3x1', 9, N' м', 749, 30, NULL, CAST(9136.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (37, N'Резинка синий 3x1', 4, N' кг', 232, 36, NULL, CAST(36016.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (38, N'Металлический стержень синий 3x1', 6, N' м', 336, 24, NULL, CAST(26976.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (39, N'Силикон белый 1x2', 2, N' м', 793, 30, NULL, CAST(33801.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (40, N'Резинка цветной 1x1', 8, N' м', 347, 13, NULL, CAST(26244.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (41, N'Силикон розовый 1x3', 9, N' м', 997, 25, NULL, CAST(33874.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (42, N'Резинка синий 3x2', 5, N' м', 284, 31, NULL, CAST(44031.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (43, N'Резинка розовый 1x0', 1, N' м', 265, 21, NULL, CAST(36574.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (44, N'Резинка зеленый 0x3', 8, N' кг', 856, 17, NULL, CAST(45349.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (45, N'Резинка цветной 0x1', 8, N' м', 290, 32, NULL, CAST(47198.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (46, N'Вата розовый 3x3', 10, N' м', 536, 31, NULL, CAST(2517.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (47, N'Резинка цветной 0x2', 10, N' м', 189, 31, NULL, CAST(55495.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (48, N'Вата серый 3x0', 8, N' кг', 48, 32, NULL, CAST(49181.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (49, N'Резинка серый 3x3', 4, N' м', 373, 8, NULL, CAST(51550.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (50, N'Резинка серый 0x0', 7, N' м', 395, 20, NULL, CAST(43414.00 AS Decimal(10, 2)), NULL, 5)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (1, N' Вата', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (2, N' Ткань', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (3, N' Стержень', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (4, N' Силикон', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (5, N' Резинка', NULL)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (1, N'Полумаска "Moon" (Элипс) P3', 1, N'59922', NULL, N'\products\5fb128cd1e2b9.jpg', 5, 4, CAST(2690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Повязка санитарно–гигиеническая многоразовая с логотипом СОЮЗСПЕЦОДЕЖДА', 2, N'5028556', NULL, NULL, 5, 9, CAST(49.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Повязка санитарно–гигиеническая многоразовая черная', 2, N'5028272', NULL, NULL, 4, 4, CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Маска одноразовая трехслойная из нетканого материала, нестерильная', 2, N'5028247', NULL, N'\products\5fb128cc69235.jpg', 3, 2, CAST(6.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Повязка санитарно–гигиеническая многоразовая с принтом', 2, N'5028229', NULL, NULL, 2, 10, CAST(49.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Маска из нетканого материала KN95', 3, N'5030981', NULL, N'\products\5fb128cc719a6.jpg', 3, 5, CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Маска из нетканого материала с клапаном KN95', 3, N'5029784', NULL, N'\products\5fb128cc753e3.jpg', 3, 4, CAST(79.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Респиратор У-2К', 3, N'58953', NULL, N'\products\5fb128cc7941f.jpg', 2, 6, CAST(95.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Респиратор 9101 FFP1', 4, N'5026662', NULL, N'\products\5fb128cc7d798.jpg', 5, 8, CAST(189.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Респиратор противоаэрозольный 9312', 4, N'59043', NULL, N'\products\5fb128cc80a10.jpg', 4, 7, CAST(399.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Респиратор 3M 8112 противоаэрозольный с клапаном выдоха', 4, N'58376', NULL, N'\products\5fb128cc84474.jpg', 3, 1, CAST(299.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Респиратор 3M 8101 противоаэрозольный', 4, N'58375', NULL, N'\products\5fb128cc87b90.jpg', 1, 4, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Респиратор "Алина" 110', 4, N'59324', NULL, N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Респиратор "Алина" 100', 4, N'58827', NULL, N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Респиратор "Нева" 109', 4, N'59898', NULL, N'\products\5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Респиратор "Юлия" 109', 4, N'59474', NULL, N'\products\5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Респиратор "Юлия" 119', 4, N'59472', NULL, N'\products\5fb128cc9bd36.jpg', 3, 7, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Респиратор 3M с клапаном 9162', 4, N'5033136', NULL, N'\products\5fb128cc9f069.jpg', 2, 9, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Респиратор 3M 9152 FFP2', 4, N'5028048', NULL, N'\products\5fb128cca31d9.jpg', 2, 8, CAST(390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Респиратор противоаэрозольный 9322', 4, N'58796', NULL, N'\products\5fb128cca6910.jpg', 4, 4, CAST(449.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Респиратор с клапаном 9926', 4, N'58568', NULL, N'\products\5fb128cca9d9b.jpg', 3, 5, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Респиратор 3M 8102 противоаэрозольный', 4, N'58466', NULL, N'\products\5fb128ccae21a.jpg', 3, 9, CAST(199.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Респиратор 3M 8122', 4, N'58445', NULL, N'\products\5fb128ccb1958.jpg', 3, 6, CAST(299.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', 4, N'5031919', NULL, N'\products\5fb128ccb4e8c.jpg', 2, 8, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Респиратор RK6021', 4, N'5030026', NULL, N'\products\5fb128ccb97a0.jpg', 5, 8, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Респиратор RK6020', 4, N'5030020', NULL, N'\products\5fb128ccbd227.jpg', 3, 5, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Респиратор Алина 210', 4, N'5030072', NULL, N'\products\5fb128ccc1592.jpg', 1, 5, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Респиратор Алина 211', 4, N'5030062', NULL, N'\products\5fb128ccc4a86.jpg', 1, 6, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Респиратор "Алина" 200', 4, N'58826', NULL, N'\products\5fb128ccc9a9e.jpg', 4, 5, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Респиратор "Алина" П', 4, N'58825', NULL, N'\products\5fb128cccdbee.jpg', 4, 5, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Респиратор "Алина" АВ', 4, N'58584', NULL, N'\products\5fb128ccd133c.jpg', 2, 5, CAST(249.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Респиратор "Нева" 210', 4, N'59736', NULL, N'\products\5fb128ccd5dc2.jpg', 1, 3, CAST(109.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Респиратор "Нева" 200', 4, N'59735', NULL, N'\products\5fb128ccd8ff6.jpg', 2, 3, CAST(79.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Респиратор полумаска НРЗ-0102 FFP2 NR D', 4, N'5027238', NULL, N'\products\5fb128ccdca1e.jpg', 4, 4, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Респиратор "Юлия" 219', 4, N'59475', NULL, N'\products\5fb128cce0042.jpg', 4, 8, CAST(249.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Респиратор "Юлия" 215', 4, N'59473', NULL, N'\products\5fb128cce39fa.jpg', 3, 4, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Респиратор "Юлия" 209', 4, N'59470', NULL, N'\products\5fb128cce7971.jpg', 2, 8, CAST(179.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', 4, N'5031924', NULL, N'\products\5fb128cceae7c.jpg', 5, 2, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Респиратор RK6030', 4, N'5030022', NULL, N'\products\5fb128ccef256.jpg', 3, 6, CAST(390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Респиратор "Алина" 310', 4, N'58850', NULL, N'\products\5fb128ccf3dd2.jpg', 5, 6, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Респиратор "Нева" 310', 4, N'59739', NULL, N'\products\5fb128cd0544b.jpg', 4, 3, CAST(289.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Респиратор "Юлия" 319', 4, N'59471', NULL, N'\products\5fb128cd08e3f.jpg', 4, 8, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Полумаска "Elipse" (Элипс) ABEK1P3', 4, N'5027980', NULL, N'\products\5fb128cd0d0b1.jpg', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Полумаска "Elipse" (Элипс) A2P3', 1, N'5027965', NULL, N'\products\5fb128cd10ec2.jpg', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Полумаска "Elipse" (Элипс) А1', 1, N'5027958', NULL, N'\products\5fb128cd157f9.jpg', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Полумаска "Elipse" (Элипс) P3 (анти-запах)', 1, N'59923', NULL, N'\products\5fb128cd19baa.jpg', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Полумаска "Elipse" (Элипс) P3', 1, N'59922', NULL, N'\products\5fb128cd1e2b9.jpg', 5, 4, CAST(2690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Полумаска "Elipse" (Элипс) A1P3', 1, N'59921', NULL, N'\products\5fb128cd2215f.jpg', 3, 9, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Полумаска "Elipse" (Элипс) ABEK1', 1, N'59920', NULL, N'\products\5fb128cd268bf.jpg', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Респиратор-полумаска "3М" серия 6000', 1, N'58974', NULL, N'\products\5fb128cd2ab69.jpg', 5, 9, CAST(3490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (51, N'Респиратор-полумаска Исток 300/400', 1, N'59334', NULL, N'\products\5fb128cd2ef7a.jpg', 4, 7, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (52, N'Комплект для защиты дыхания J-SET 6500 JETA', 1, N'4969295', NULL, N'\products\5fb128cd331c4.jpg', 4, 4, CAST(2490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (53, N'Лицевая маска Elipse Integra А1P3', 1, N'5029610', NULL, N'\products\5fb128cd3674d.jpg', 2, 10, CAST(9890.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (54, N'Лицевая маска Elipse Integra P3', 5, N'5029091', NULL, N'\products\5fb128cd3af5c.jpg', 5, 9, CAST(7490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (55, N'Лицевая маска Elipse Integra (Элипс интегра) P3 (анти-запах)', 5, N'60360', NULL, N'\products\5fb128cd3e7e4.jpg', 2, 4, CAST(7590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (56, N'Полнолицевая маска 5950 JETA', 5, N'4958042', NULL, N'\products\5fb128cd41ece.jpg', 1, 5, CAST(11490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (57, N'Сменный патрон с фильтром 6054 для масок и полумасок "3М" серии 6000', 6, N'59271', NULL, N'\products\5fb128cd4672c.jpg', 4, 2, CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (58, N'Сменный патрон с фильтром 6059 для масок и полумасок "3М" серии 6000', 7, N'59253', NULL, N'\products\5fb128cd4c99d.jpg', 2, 9, CAST(2290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (59, N'Сменный фильтр 6510 A1 JETA', 7, N'5028197', NULL, N'\products\5fb128cd50a70.jpg', 5, 9, CAST(990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (60, N'Запасные фильтры к полумаске Elipse ABEK1P3', 7, N'5027978', NULL, N'\products\5fb128cd5433e.jpg', 3, 6, CAST(2990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (61, N'Запасные фильтры к полумаске Elipse A2P3', 8, N'5027961', NULL, N'\products\5fb128cd5838d.jpg', 2, 9, CAST(2590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (62, N'Запасные фильтры к полумаске Elipse (Элипс) А1', 8, N'5027921', NULL, N'\products\5fb128cd5bb7d.jpg', 3, 4, CAST(1290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (63, N'Сменный фильтр 6541 ABEK1 JETA', 7, N'4958040', NULL, N'\products\5fb128cd5ff78.jpg', 4, 6, CAST(1290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (64, N'Запасные фильтры к полумаске "Elipse" (Элипс) P3 (анти-запах)', 8, N'59919', NULL, N'\products\5fb128cd63666.jpg', 4, 4, CAST(1690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (65, N'Запасные фильтры к полумаске "Elipse" (Элипс) P3', 8, N'59918', NULL, N'\products\5fb128cd66df6.jpg', 4, 7, CAST(1390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (66, N'Запасные фильтры к полумаске "Elipse" (Элипс) A1P3', 8, N'59917', NULL, N'\products\5fb128cd6a2b6.jpg', 1, 3, CAST(2190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (67, N'Запасные фильтры к полумаске "Elipse" (Элипс) ABEK1', 8, N'59916', NULL, N'\products\5fb128cd6e4ee.jpg', 3, 10, CAST(2590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (68, N'Запасные фильтры (пара) АВЕ1 к полумаскам "Адвантейдж"', 8, N'59708', NULL, N'\products\5fb128cd71db3.jpg', 2, 3, CAST(1490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (69, N'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка В', 8, N'67661', NULL, N'\products\5fb128cd7518c.jpg', 5, 9, CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (70, N'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка А', 8, N'67660', NULL, N'\products\5fb128cd78fce.jpg', 3, 1, CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (71, N'Держатель предфильтра 5101 JETA', 8, N'4958041', NULL, N'\products\5fb128cd7d2cd.jpg', 1, 7, CAST(199.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (72, N'Держатели предфильтра для масок и полумасок "3М" серии 6000', 9, N'58431', NULL, N'\products\5fb128cd80a06.jpg', 1, 4, CAST(264.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (73, N'Предфильтр Р2 (4 шт) 6020 JETA', 9, N'4958039', NULL, N'\products\5fb128cd8417e.jpg', 1, 7, CAST(380.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (74, N'Предфильтры для масок и полумасок "3М" серии 6000', 10, N'58917', NULL, N'\products\5fb128cd8818d.jpg', 5, 3, CAST(409.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (75, N'Респиратор "Мадонна" 110', 4, N'59324', NULL, N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (76, N'Респиратор "Витязь" 100', 4, N'58827', NULL, N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (77, N'Респиратор "Серёга" 109', 4, N'59898', NULL, N'\products\5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (78, N'Респиратор "Амперметр" 109', 4, N'59474', NULL, N'\products\5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (79, N'Респиратор "Фирюза" 110', 4, N'59324', NULL, N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (80, N'Респиратор "Красный" 100', 4, N'58827', NULL, N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (81, N'Респиратор "Волга" 109', 4, N'59898', NULL, N'\products\5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (82, N'Респиратор "Мадонна" 220', 4, N'59474', NULL, N'\products\5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (83, N'Респиратор "Витязь" 220', 4, N'59324', NULL, N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (84, N'Респиратор "Серёга" 220', 4, N'58827', NULL, N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (85, N'Респиратор "Амперметр" 220', 4, N'59898', NULL, N'\products\5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (86, N'Респиратор "Фирюза" 220', 4, N'59474', NULL, N'\products\5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (87, N'Респиратор "Красный" 220', 4, N'59324', NULL, N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (88, N'Респиратор "Волга" 220', 4, N'58827', NULL, N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (89, N'Полумаска "Sunset" ABEK1P3', 4, N'5027980', NULL, N'\products\5fb128cd0d0b1.jpg', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (90, N'Полумаска "Sunset" A2P3', 1, N'5027965', NULL, N'\products\5fb128cd10ec2.jpg', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (91, N'Полумаска "Sunset" А1', 1, N'5027958', NULL, N'\products\5fb128cd157f9.jpg', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (92, N'Полумаска "Sunset" P3 (анти-запах)', 1, N'59923', NULL, N'\products\5fb128cd19baa.jpg', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (93, N'Полумаска "Sunset" (Элипс) P3', 1, N'59922', NULL, N'\products\5fb128cd1e2b9.jpg', 5, 4, CAST(2690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (94, N'Полумаска "Sunset" A1P3', 1, N'59921', NULL, N'\products\5fb128cd2215f.jpg', 3, 9, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (95, N'Полумаска "Sunset" ABEK1', 1, N'59920', NULL, N'\products\5fb128cd268bf.jpg', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (96, N'Полумаска "Moon" ABEK1', 1, N'59920', NULL, N'\products\5fb128cd268bf.jpg', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (97, N'Полумаска "Moon" ABEK1P3', 4, N'5027980', NULL, N'\products\5fb128cd0d0b1.jpg', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (98, N'Полумаска "Moon" A2P3', 1, N'5027965', NULL, N'\products\5fb128cd10ec2.jpg', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (99, N'Полумаска "Moon" А1', 1, N'5027958', NULL, N'\products\5fb128cd157f9.jpg', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (100, N'Полумаска "Moon" P3 (анти-запах)', 1, N'59923', NULL, N'\products\5fb128cd19baa.jpg', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 3, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 36, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 6, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 50, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 16, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 29, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 32, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 33, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (4, 30, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (4, 35, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 14, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 21, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 25, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 31, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 45, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 11, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 20, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 21, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (8, 50, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (9, 8, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (9, 45, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 3, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 4, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 7, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 27, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (11, 49, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (12, 7, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (12, 27, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (12, 37, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (13, 6, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (13, 29, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (15, 2, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (15, 34, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (16, 8, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (16, 44, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (17, 9, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (18, 45, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (20, 36, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (21, 6, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 3, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 24, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 31, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 7, 7)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 11, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 23, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 38, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (24, 16, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (24, 36, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (24, 38, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 3, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 14, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 28, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (26, 47, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (27, 36, 7)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (28, 26, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 14, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 29, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 43, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 14, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 17, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 41, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 43, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (31, 14, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (32, 42, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 12, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 49, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 1, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 6, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 46, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (36, 11, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (36, 32, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (36, 35, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 20, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 23, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 29, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 15, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 29, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 42, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (39, 7, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (39, 47, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (40, 2, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (40, 13, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (40, 31, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 19, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 31, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (42, 20, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (43, 6, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (44, 15, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (44, 16, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (44, 41, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (45, 48, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (46, 30, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (48, 7, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (48, 22, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (48, 33, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (49, 20, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (49, 27, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (49, 37, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (50, 26, 19)
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Полумаски', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Повязки', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Маски', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N'Респираторы', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (5, N'На лицо', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (6, N'Полнолицевые', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (7, N'Сменные части', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (8, N'Запасные части', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (9, N'Держители', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (10, N'Предфильтры', NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
