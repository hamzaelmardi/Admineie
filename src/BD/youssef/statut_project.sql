USE [seed]
GO
SET IDENTITY_INSERT [dbo].[statut_projet] ON 
GO
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (89, NULL, N'Documents Attachés (description)', N'Documents Attachés (description)', N'EV')
GO
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (90, NULL, N'Document Incomplet 2', N'Document Incomplet 2', N'EV')
GO
SET IDENTITY_INSERT [dbo].[statut_projet] OFF
GO
