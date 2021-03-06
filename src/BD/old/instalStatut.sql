USE [seed]
GO
/****** Object:  Table [dbo].[statut_installation]    Script Date: 12/02/2021 12:22:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statut_installation](
	[id_statut_installation] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_statut_installation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[statut_installation] ON 

INSERT [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'en attente', N'en attente')
INSERT [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'non conforme', N'non conforme')
INSERT [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'visite planifié', N'visite planifié')
INSERT [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'favorable', N'favorable')
INSERT [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'non favorable', N'non favorable')
SET IDENTITY_INSERT [dbo].[statut_installation] OFF
