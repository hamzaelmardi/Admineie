USE [seed]
GO
SET IDENTITY_INSERT [dbo].[poste] ON 

INSERT [dbo].[poste] ([id_poste], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'كادر', N'Cadre')
INSERT [dbo].[poste] ([id_poste], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'مدير', N'Directeur')
INSERT [dbo].[poste] ([id_poste], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'رئيس مصلحة', N'Chef de service')
INSERT [dbo].[poste] ([id_poste], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'رئيس قسم', N'Chef de division')
SET IDENTITY_INSERT [dbo].[poste] OFF
GO
