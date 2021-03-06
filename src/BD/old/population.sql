USE [seed]
GO
/****** Object:  Table [dbo].[population]    Script Date: 12/05/2021 13:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[population](
	[id_population] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_population] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[population] ON 

INSERT [dbo].[population] ([id_population], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'الحيوانات البرية', N'faune')
INSERT [dbo].[population] ([id_population], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'النباتات
', N'flore')
INSERT [dbo].[population] ([id_population], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'الارض', N'sol')
INSERT [dbo].[population] ([id_population], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'الماء', N'eau')
INSERT [dbo].[population] ([id_population], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'الهواء', N'air')
INSERT [dbo].[population] ([id_population], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'ممتلكات مادية', N'biens matériels')
INSERT [dbo].[population] ([id_population], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'التراث المعماري
', N'patrimoine architectural')
INSERT [dbo].[population] ([id_population], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'التراث البيئي
', N'patrimoine écologique')
INSERT [dbo].[population] ([id_population], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'التراث الأثري', N'patrimoine archéologique')
SET IDENTITY_INSERT [dbo].[population] OFF
