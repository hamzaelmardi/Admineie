USE [seed]
GO
/****** Object:  Table [dbo].[pays]    Script Date: 22/09/2021 18:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pays](
	[pays_id] [int] IDENTITY(1,1) NOT NULL,
	[code_iso] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[pays_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[pays] ON 

INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, N'MA', CAST(N'2021-06-21T15:27:01.2733333' AS DateTime2), N'المغرب', N'maroc')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, N'250', NULL, N'فرنسا', N'France')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (17, N'840', NULL, N'امريكا', N'États-Unis')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (18, N'724', NULL, N'اسبانيا', N'Espagne')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (19, N'276', NULL, N'المانيا', N'Allemagne')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (20, N'112', NULL, N'بلجيكا', N'Belgique')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (21, N'380', NULL, N'ايطاليا', N'Italie')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (22, N'528', NULL, N'هولندا', N'Hollande')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (23, N'620', NULL, N'البرتغال', N'Portugal')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (24, N'788', NULL, N'تونس', N'Tunisia')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (25, N'784', NULL, N'الامارات', N'Emirats Arabes Unis')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (26, N'012', NULL, N'الجزائر', N'Algeria')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (27, N'124', NULL, N'كندا', N'Canada')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (28, N'756', NULL, N'سويسرا', N'Suisse')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (29, N'826', NULL, N'المملكة المتحدة', N'Royaume-Uni')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (30, NULL, NULL, N'ليبيا', N'Libye')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (31, NULL, NULL, N'إفريقيا الجنوبية', N'Afrique du Sud')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (32, NULL, NULL, N'ألمانيا', N'Allemagne')
INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (33, NULL, NULL, N'موريتانيا', N'Mauritanie')
SET IDENTITY_INSERT [dbo].[pays] OFF
