USE [seed]
GO


SET IDENTITY_INSERT [dbo].[autorisationparam] ON 


INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'استيراد المخلفات (منطقة حرة)', N'Importation dechets (zone franche)')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'جمع / نقل النفايات الخطرة', N'Collecte/transport des déchets dangereux')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'استيراد مخلفات غير خطرة من دولة أجنبية', N'Importation des déchets non dangereux d’un pays étranger')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'مرفق معالجة النفايات', N'Installation de traitement des déchets')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'استيراد المخلفات غير الخطرة من المنطقة الحرة', N'Importation des déchets non dangereux d’une zone franche')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'تصدير المخلفات الخطرة', N'Exportation des déchets dangereux ')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'عبور النفايات', N'Transit des Déchets ')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'طلب ترخيص استيراد نفايات غير حديدية ', N'Demande de  licence d’importation des déchets non ferreux')
SET IDENTITY_INSERT [dbo].[autorisationparam] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluationparam] ON 

INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'التقييم البيئي الاستراتيجي', N'Évaluation environnementale stratégique (EES)')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'التدقيق البيئي', N'Audit environnementale')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'إشعار الأثر', N'Notice d’impact')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'دراسة الأثر البيئي ', N'Etude d’impact environnementale')
SET IDENTITY_INSERT [dbo].[evaluationparam] OFF
GO



go