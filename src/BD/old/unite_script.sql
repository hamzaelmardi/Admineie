USE [seed]
GO
delete [unite]
SET IDENTITY_INSERT [dbo].[unite] ON 

INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'لتر', N'L')
INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'كغ', N'Kg')
INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'طن', N'Tonnes')
INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'م³', N'm³')
SET IDENTITY_INSERT [dbo].[unite] OFF
GO
