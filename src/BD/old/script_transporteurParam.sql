USE [seed]
GO
/****** Object:  Table [dbo].[transporteurparam]    Script Date: 24/05/2021 16:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transporteurparam](
	[id_transporteur_param] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[fax] [nvarchar](255) NULL,
	[identifiant] [nvarchar](255) NULL,
	[nom] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
	[numero_autorisation] [nvarchar](255) NULL,
	[adresse] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_transporteur_param] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[transporteurparam] ON 

INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (6, NULL, N' 06 60 71 27 75', N'', N'Eco Laber Services ', N'05 22 35 11 30', N'', N'23 BD MLY slimane 1er étageAin Sebaa –Casablanca')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (7, NULL, N'05 37 82 29 84', NULL, N'COMAGAL', N' 05 37 80 06 96', NULL, N'Zerdal Gharbia sect.2
N° 1812 Bouknadel Salé')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (8, NULL, N'05 28 82 69 83', NULL, N'Ecosynergie', N'05 28 82 01 94', NULL, N'27 rue Alwahda Alwatania
Agadir')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (9, NULL, NULL, NULL, N'GRIA sarl', N'06 00 36 97 87', NULL, N'N° 5 zone industrielle
khouribga')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (10, NULL, N'05 37 37 92 33', NULL, N'CHEMIREC Maroc', N'05 37 37 11 26/
 06 61 30 32 02', NULL, N'1,rue El jadida QIM Kénitra')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (11, NULL, NULL, NULL, N'COVED SERVICES', N'06 63 45 71 07', NULL, N'Hay El Oulfa, res.Areda
GH4B , IMM.26 n° 11
Casablanca')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (12, NULL, N'05 22 54 92 57', NULL, N'LYDEC', N'05 22 54 90 54/
 05 22 54 92 50', NULL, N'48, rue Mohamed Diouri/BP
16048')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (13, NULL, N'05 23 32 86 98', NULL, N'MAMA MARINE', N'05 23 30 55 10/
 05 23 32 86 97
 06 30 92 90 64
 06 61 160184', NULL, N'Rue Ahmed El Hansali.
18561/Mohammedia')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (14, NULL, NULL, NULL, N'Souss Daraa Business', NULL, NULL, NULL)
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (15, NULL, NULL, NULL, N'transporteur 1', NULL, NULL, NULL)
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (16, CAST(N'2021-05-24T15:53:35.9720000' AS DateTime2), N'0535353535', N'123', N'Transporteur 2', N'0675757575', NULL, NULL)
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (17, CAST(N'2021-05-24T15:50:47.1840000' AS DateTime2), N'02785858', N'02232222', N'sagem', N'0666666666', NULL, NULL)
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (18, CAST(N'2021-05-24T15:23:42.2010000' AS DateTime2), N'd', N'123', N'Raison sociale :', N'd', NULL, NULL)
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (19, CAST(N'2021-05-24T15:23:26.5760000' AS DateTime2), NULL, N'IF', N'Raison Social', NULL, NULL, NULL)
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (20, CAST(N'2021-05-24T15:23:18.1870000' AS DateTime2), N'Fax ', N'cccc', N'ccc', N'0656565655', N'ccc', N'cccc')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (21, CAST(N'2021-05-24T15:23:23.3340000' AS DateTime2), N'Fax xxxxxxxxx', N'sss', N'sss', N'0656565655', N'sss', N'ssss')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (22, CAST(N'2021-05-24T15:23:47.6450000' AS DateTime2), N'dd', N'dd', N'dd', N'dd', N'ddd', N'dd')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse]) VALUES (23, CAST(N'2021-05-24T16:53:45.6000000' AS DateTime2), N'xxx', N'xxxdddd', N'xxxx', N'xxxx', N'xxxxx', N'xxxx')
SET IDENTITY_INSERT [dbo].[transporteurparam] OFF
