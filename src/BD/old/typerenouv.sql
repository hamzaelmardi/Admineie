USE [seed]
GO
SET IDENTITY_INSERT [dbo].[type_renouvellement] ON 

INSERT [dbo].[type_renouvellement] ([id_type_renouvellement], [delete_date_time], [nom_ar], [nom_fr], [code_name]) VALUES (1, NULL, N'Nouveaux', N'Nouveaux', N'N')
INSERT [dbo].[type_renouvellement] ([id_type_renouvellement], [delete_date_time], [nom_ar], [nom_fr], [code_name]) VALUES (2, NULL, N'Renouvellement', N'Renouvellement', N'R')
SET IDENTITY_INSERT [dbo].[type_renouvellement] OFF
GO
