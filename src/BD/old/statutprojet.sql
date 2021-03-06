USE [seed]
GO
/****** Object:  Table [dbo].[statut_projet]    Script Date: 05/02/2021 12:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statut_projet](
	[id_statut_projet] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_statut_projet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[statut_projet] ON 

INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'en attente', N'en attente')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'réunion planifier', N'réunion planifier')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'Non Acceptable', N'Non Acceptable')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'Quorum no atteint', N'Quorum no atteint')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'Attente Signature', N'Attente Signature')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'Signé', N'Signé')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'attente documents définitive', N'attente documents définitive')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'arrete d''examen', N'arrete d''examen')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'Documment definitive attaché', N'Documment definitive attaché')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'Document à amélioré', N'Document à amélioré')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (11, NULL, N'Rensignement', N'Rensignement')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (12, NULL, N'Conforme', N'Conforme')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (13, NULL, N'Avis de projet', N'Avis de projet')
SET IDENTITY_INSERT [dbo].[statut_projet] OFF
