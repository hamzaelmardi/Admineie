USE [seed]
GO
/****** Object:  Table [dbo].[role]    Script Date: 10/03/2021 12:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (1, N'ROLE_ADMIN', N'ROLE_ADMIN')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (2, N'Accueil', N'ROLE_Accueil')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (3, N'Importation Des Déchets En Zonne Franche', N'ROLE_ImportationDesDéchetsEnZonneFranche')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (4, N'Importation Des Déchets Non Dangereux d''un Pays Etranger', N'ROLE_ImportationDesDéchetsNonDangereuxDunPaysEtranger')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (5, N'Collecte/Transport Des Déchets', N'ROLE_CollecteTransportDesDéchets')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (6, N'Installation De Traitement Des Déchets', N'ROLE_InstallationDeTraitementDesDechets')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (7, N'Exportation Des Déchets Dangereux', N'ROLE_ExportationDesDéchetDangereux')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (8, N'Transit Des Déchets', N'ROLE_TransitDesDéchets')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (9, N'Etude d''Impact Envirennementale (EIE)', N'ROLE_EtudeImpactEnvironnementaleEIE')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (10, N'Etude d''Impact Envirennementale (DRE)', N'ROLE_EtudeImpactEnvironnementaleDRE')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (11, N'Etude Environnementale Stratégique', N'ROLE_EtudeEnvironnementaleStrategique')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (12, N'Audit Environnementale', N'ROLE_AuditEnvironnementale')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (13, N'Notice d''Impact', N'ROLE_NoticeImpact')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (14, N'Renseignement Préalable', N'ROLE_RenseignementPrealable')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (15, N'Paramétre', N'ROLE_Parametre')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (16, N'Statistique', N'ROLE_Statistique')
INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (17, N'Audit', N'ROLE_Audit')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
