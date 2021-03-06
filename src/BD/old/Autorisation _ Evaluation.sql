USE [seed]
GO
/****** Object:  Table [dbo].[autorisationparam]    Script Date: 05/02/2021 09:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autorisationparam](
	[id_autorisation] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_autorisation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluationparam]    Script Date: 05/02/2021 09:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluationparam](
	[id_evaluation] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_evaluation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[autorisationparam] ON 

INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'Importation dechets (zone franche)')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'Collecte/transport des déchets dangereux')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'Importation des déchets non dangereux d’un pays étranger')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'Installation de traitement des déchets')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'Importation des déchets non dangereux d’une zone franche')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, NULL, N'Exportation des déchets dangereux ')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, NULL, N'Transit des Déchets ')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, NULL, N'Demande de  licence d’importation des déchets non ferreux')
SET IDENTITY_INSERT [dbo].[autorisationparam] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluationparam] ON 

INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'Évaluation environnementale stratégique (EES)')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'Audit environnementale')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'Notice d’impact')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'Etude d’impact environnementale')
SET IDENTITY_INSERT [dbo].[evaluationparam] OFF
GO
