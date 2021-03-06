USE [seed]
GO
SET IDENTITY_INSERT [dbo].[equipement_securite] ON 

INSERT [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'Vêtement  fluorescent')
INSERT [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'Triangles  réfléchissants ')
INSERT [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'Lampe  de  poche')
INSERT [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'Extincteurs  2  kg  poudre')
INSERT [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'Extincteurs  6  kg  poudre')
INSERT [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, NULL, N'émetteurs VHF')
INSERT [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, NULL, N'Masques')
SET IDENTITY_INSERT [dbo].[equipement_securite] OFF
GO
SET IDENTITY_INSERT [dbo].[statut_collecte_transport] ON 

INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'En cours ')
INSERT [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'Accepter')
SET IDENTITY_INSERT [dbo].[statut_collecte_transport] OFF
GO
SET IDENTITY_INSERT [dbo].[typeconteneurs] ON 

INSERT [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'citernes')
INSERT [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'semi-remorques   citernes')
INSERT [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N' conteneurs-citernes')
INSERT [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'semi-remorques')
INSERT [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'remorques')
SET IDENTITY_INSERT [dbo].[typeconteneurs] OFF
GO
SET IDENTITY_INSERT [dbo].[typevehicule] ON 

INSERT [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'wagon')
INSERT [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'avion')
INSERT [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'bateau')
INSERT [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'camion')
INSERT [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'tracteur')
SET IDENTITY_INSERT [dbo].[typevehicule] OFF
GO
