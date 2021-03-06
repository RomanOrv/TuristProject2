USE [turist2]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 1/20/2019 10:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] NOT NULL,
	[CompanyNumber] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuristData]    Script Date: 1/20/2019 10:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuristData](
	[TuristDataId] [int] IDENTITY(1,1) NOT NULL,
	[TuristDataType] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Residence] [decimal](19, 4) NOT NULL,
	[Food] [decimal](19, 4) NOT NULL,
	[Transportation] [decimal](19, 4) NOT NULL,
	[Excursion] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_TuristData] PRIMARY KEY CLUSTERED 
(
	[TuristDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuristType]    Script Date: 1/20/2019 10:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuristType](
	[TuristTypeId] [int] NOT NULL,
	[TuristTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TuristType] PRIMARY KEY CLUSTERED 
(
	[TuristTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuristTypeCompany]    Script Date: 1/20/2019 10:07:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuristTypeCompany](
	[TuristTypeCompanyId] [int] IDENTITY(1,1) NOT NULL,
	[TuristTypeId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_TuristTypeTuristData] PRIMARY KEY CLUSTERED 
(
	[TuristTypeCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (1, 1, NULL)
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (2, 2, NULL)
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (3, 3, NULL)
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (4, 4, NULL)
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (5, 5, NULL)
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (6, 6, NULL)
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (7, 7, NULL)
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (8, 8, NULL)
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (9, 9, NULL)
INSERT [dbo].[Company] ([CompanyId], [CompanyNumber], [Name]) VALUES (10, 10, NULL)
SET IDENTITY_INSERT [dbo].[TuristData] ON 

INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (1, 1, 1, CAST(0.8500 AS Decimal(19, 4)), CAST(0.9300 AS Decimal(19, 4)), CAST(0.6000 AS Decimal(19, 4)), CAST(0.4700 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (2, 1, 2, CAST(0.5700 AS Decimal(19, 4)), CAST(0.6200 AS Decimal(19, 4)), CAST(0.8900 AS Decimal(19, 4)), CAST(0.9300 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (3, 1, 3, CAST(0.9200 AS Decimal(19, 4)), CAST(0.8200 AS Decimal(19, 4)), CAST(0.4400 AS Decimal(19, 4)), CAST(0.6200 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (5, 1, 4, CAST(0.9400 AS Decimal(19, 4)), CAST(0.8200 AS Decimal(19, 4)), CAST(0.4500 AS Decimal(19, 4)), CAST(0.2900 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (6, 1, 5, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0500 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (7, 1, 6, CAST(0.8500 AS Decimal(19, 4)), CAST(0.7300 AS Decimal(19, 4)), CAST(0.3000 AS Decimal(19, 4)), CAST(0.2100 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (8, 1, 7, CAST(0.7900 AS Decimal(19, 4)), CAST(0.7700 AS Decimal(19, 4)), CAST(0.5800 AS Decimal(19, 4)), CAST(0.5300 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (9, 1, 8, CAST(0.6900 AS Decimal(19, 4)), CAST(0.8100 AS Decimal(19, 4)), CAST(0.6800 AS Decimal(19, 4)), CAST(0.7400 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (10, 1, 9, CAST(0.3800 AS Decimal(19, 4)), CAST(0.3000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.2600 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (11, 1, 10, CAST(0.6800 AS Decimal(19, 4)), CAST(0.5800 AS Decimal(19, 4)), CAST(0.9400 AS Decimal(19, 4)), CAST(0.9100 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (12, 2, 1, CAST(1.0000 AS Decimal(19, 4)), CAST(0.4700 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(0.6600 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (13, 2, 2, CAST(0.8100 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(0.5800 AS Decimal(19, 4)), CAST(0.3200 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (14, 2, 3, CAST(0.9100 AS Decimal(19, 4)), CAST(0.7000 AS Decimal(19, 4)), CAST(0.4500 AS Decimal(19, 4)), CAST(0.7200 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (15, 2, 4, CAST(0.9200 AS Decimal(19, 4)), CAST(0.7100 AS Decimal(19, 4)), CAST(0.7200 AS Decimal(19, 4)), CAST(0.4400 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (16, 2, 5, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (17, 2, 6, CAST(0.7700 AS Decimal(19, 4)), CAST(0.5700 AS Decimal(19, 4)), CAST(0.7600 AS Decimal(19, 4)), CAST(0.2900 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (18, 2, 7, CAST(0.6500 AS Decimal(19, 4)), CAST(0.5700 AS Decimal(19, 4)), CAST(0.7000 AS Decimal(19, 4)), CAST(0.6400 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (19, 2, 8, CAST(0.8800 AS Decimal(19, 4)), CAST(0.5100 AS Decimal(19, 4)), CAST(0.7400 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (20, 2, 9, CAST(0.2400 AS Decimal(19, 4)), CAST(0.4100 AS Decimal(19, 4)), CAST(0.3400 AS Decimal(19, 4)), CAST(0.1000 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (21, 2, 10, CAST(0.7700 AS Decimal(19, 4)), CAST(0.7600 AS Decimal(19, 4)), CAST(0.7300 AS Decimal(19, 4)), CAST(0.4700 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (22, 3, 1, CAST(0.6800 AS Decimal(19, 4)), CAST(0.7600 AS Decimal(19, 4)), CAST(0.5400 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (23, 3, 2, CAST(0.4200 AS Decimal(19, 4)), CAST(0.7000 AS Decimal(19, 4)), CAST(0.3800 AS Decimal(19, 4)), CAST(0.9300 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (24, 3, 3, CAST(0.9400 AS Decimal(19, 4)), CAST(0.7600 AS Decimal(19, 4)), CAST(0.4000 AS Decimal(19, 4)), CAST(0.5700 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (25, 3, 4, CAST(0.8900 AS Decimal(19, 4)), CAST(0.9000 AS Decimal(19, 4)), CAST(0.8100 AS Decimal(19, 4)), CAST(0.3300 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (26, 3, 5, CAST(0.0040 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0680 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (27, 3, 6, CAST(0.8000 AS Decimal(19, 4)), CAST(0.8000 AS Decimal(19, 4)), CAST(0.8200 AS Decimal(19, 4)), CAST(0.2700 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (28, 3, 7, CAST(0.8500 AS Decimal(19, 4)), CAST(0.6900 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(0.5500 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (30, 3, 8, CAST(0.5500 AS Decimal(19, 4)), CAST(0.9100 AS Decimal(19, 4)), CAST(0.8100 AS Decimal(19, 4)), CAST(0.8800 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (32, 3, 9, CAST(0.0710 AS Decimal(19, 4)), CAST(0.2200 AS Decimal(19, 4)), CAST(0.2200 AS Decimal(19, 4)), CAST(0.0320 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (34, 3, 10, CAST(0.4500 AS Decimal(19, 4)), CAST(0.4800 AS Decimal(19, 4)), CAST(0.8100 AS Decimal(19, 4)), CAST(0.6700 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (35, 4, 1, CAST(0.8800 AS Decimal(19, 4)), CAST(0.9200 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)), CAST(1.0000 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (36, 4, 2, CAST(0.9400 AS Decimal(19, 4)), CAST(0.8200 AS Decimal(19, 4)), CAST(0.4600 AS Decimal(19, 4)), CAST(0.7100 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (38, 4, 3, CAST(0.7700 AS Decimal(19, 4)), CAST(0.9100 AS Decimal(19, 4)), CAST(0.5500 AS Decimal(19, 4)), CAST(0.5500 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (39, 4, 4, CAST(0.7000 AS Decimal(19, 4)), CAST(0.9200 AS Decimal(19, 4)), CAST(0.5600 AS Decimal(19, 4)), CAST(0.3000 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (40, 4, 5, CAST(0.0110 AS Decimal(19, 4)), CAST(0.0330 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0780 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (41, 4, 6, CAST(0.6000 AS Decimal(19, 4)), CAST(0.8400 AS Decimal(19, 4)), CAST(0.4900 AS Decimal(19, 4)), CAST(0.2100 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (42, 4, 7, CAST(0.5000 AS Decimal(19, 4)), CAST(0.7300 AS Decimal(19, 4)), CAST(0.5100 AS Decimal(19, 4)), CAST(0.4800 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (43, 4, 8, CAST(0.7900 AS Decimal(19, 4)), CAST(0.8400 AS Decimal(19, 4)), CAST(0.8100 AS Decimal(19, 4)), CAST(0.7500 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (44, 4, 9, CAST(0.0970 AS Decimal(19, 4)), CAST(0.0800 AS Decimal(19, 4)), CAST(0.1400 AS Decimal(19, 4)), CAST(0.0620 AS Decimal(19, 4)))
INSERT [dbo].[TuristData] ([TuristDataId], [TuristDataType], [CompanyId], [Residence], [Food], [Transportation], [Excursion]) VALUES (45, 4, 10, CAST(0.8200 AS Decimal(19, 4)), CAST(0.7100 AS Decimal(19, 4)), CAST(0.6000 AS Decimal(19, 4)), CAST(0.6300 AS Decimal(19, 4)))
SET IDENTITY_INSERT [dbo].[TuristData] OFF
INSERT [dbo].[TuristType] ([TuristTypeId], [TuristTypeName]) VALUES (1, N'Туристи з дітьми')
INSERT [dbo].[TuristType] ([TuristTypeId], [TuristTypeName]) VALUES (2, N'Молодь')
INSERT [dbo].[TuristType] ([TuristTypeId], [TuristTypeName]) VALUES (3, N'Середній вік')
INSERT [dbo].[TuristType] ([TuristTypeId], [TuristTypeName]) VALUES (4, N'Третій вік')
SET IDENTITY_INSERT [dbo].[TuristTypeCompany] ON 

INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (5, 1, 1)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (6, 1, 8)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (7, 1, 4)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (8, 2, 1)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (9, 2, 6)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (10, 2, 8)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (11, 3, 2)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (12, 3, 3)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (13, 3, 8)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (14, 4, 1)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (15, 4, 7)
INSERT [dbo].[TuristTypeCompany] ([TuristTypeCompanyId], [TuristTypeId], [CompanyId]) VALUES (16, 4, 10)
SET IDENTITY_INSERT [dbo].[TuristTypeCompany] OFF
ALTER TABLE [dbo].[TuristData]  WITH CHECK ADD  CONSTRAINT [FK_TuristData_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[TuristData] CHECK CONSTRAINT [FK_TuristData_Company]
GO
ALTER TABLE [dbo].[TuristTypeCompany]  WITH CHECK ADD  CONSTRAINT [FK_TuristTypeCompany_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[TuristTypeCompany] CHECK CONSTRAINT [FK_TuristTypeCompany_Company]
GO
ALTER TABLE [dbo].[TuristTypeCompany]  WITH CHECK ADD  CONSTRAINT [FK_TuristTypeCompany_TuristType] FOREIGN KEY([TuristTypeId])
REFERENCES [dbo].[TuristType] ([TuristTypeId])
GO
ALTER TABLE [dbo].[TuristTypeCompany] CHECK CONSTRAINT [FK_TuristTypeCompany_TuristType]
GO
