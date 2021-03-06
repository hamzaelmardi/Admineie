USE [seed]
GO
SET IDENTITY_INSERT [dbo].[statut_collecte_transport] ON 

INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'en attente', N'en attente')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'non conforme', N'non conforme')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'favorable', N'favorable')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'non favorable', N'non favorable')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'attente d''avis de commission', N'attente d''avis de commission')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'refus', N'refus')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'favorable (commission)', N'favorable (commission)')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'non favorable (commission)', N'non favorable (commission)')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'favorable sous réserve', N'favorable sous réserve')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'demande de complément', N'demande de complément')
SET IDENTITY_INSERT [dbo].[statut_collecte_transport] OFF
GO
