/*
Run this script on:

(local)\SQLEXPRESS01.seed    -  This database will be modified

to synchronize it with:

(local)\SQLEXPRESS01.seed2

You are recommended to back up your database before running this script

Script created by SQL Data Compare version 11.6.11 from Red Gate Software Ltd at 04/03/2021 16:03:39

*/
		
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)

PRINT(N'Drop constraints from [dbo].[list_doc_notif]')
ALTER TABLE [dbo].[list_doc_notif] NOCHECK CONSTRAINT [FK79di5doh4qo30afqnwe95qgwb]
ALTER TABLE [dbo].[list_doc_notif] NOCHECK CONSTRAINT [FKhd6hv61axryymmj2veefjvv5s]
ALTER TABLE [dbo].[list_doc_notif] NOCHECK CONSTRAINT [FKpyknndgqias1nuk8komnu7uou]
ALTER TABLE [dbo].[list_doc_notif] NOCHECK CONSTRAINT [FKq07wvt9wm2xydh6xd7jn32hu0]

PRINT(N'Drop constraints from [dbo].[import_historique]')
ALTER TABLE [dbo].[import_historique] NOCHECK CONSTRAINT [FK27ev6hpjmgmh6cxed16tktp7h]
ALTER TABLE [dbo].[import_historique] NOCHECK CONSTRAINT [FK43xvwbhvqw1f4xk5xm135tpfm]
ALTER TABLE [dbo].[import_historique] NOCHECK CONSTRAINT [FKpw9jd009w5l0vt5fx2cq2onhq]

PRINT(N'Drop constraints from [dbo].[reponse]')
ALTER TABLE [dbo].[reponse] NOCHECK CONSTRAINT [FK219wm9jpvu005i135ahy95so]

PRINT(N'Drop constraints from [dbo].[question]')
ALTER TABLE [dbo].[question] NOCHECK CONSTRAINT [FK738osswfjfwybg1ha0axsgq2u]
ALTER TABLE [dbo].[question] NOCHECK CONSTRAINT [FK7mn5f3ojmbndecpshsyow24xe]
ALTER TABLE [dbo].[question] NOCHECK CONSTRAINT [FKoiv9j2i9hgr3xay4uylicagb9]

PRINT(N'Drop constraints from [dbo].[installation]')
ALTER TABLE [dbo].[installation] NOCHECK CONSTRAINT [FK2u84rh4dgej5nxnkosl0ui3qk]
ALTER TABLE [dbo].[installation] NOCHECK CONSTRAINT [FK6evlor0wjs62vicd0ldel8469]
ALTER TABLE [dbo].[installation] NOCHECK CONSTRAINT [FKbeov4j4amk8msrdwsk8w0riu9]
ALTER TABLE [dbo].[installation] NOCHECK CONSTRAINT [FKn0m2ge9p4rt9et2bfueke3r4w]
ALTER TABLE [dbo].[installation] NOCHECK CONSTRAINT [FKs9e1p2w1g53x0e0hps1epw6b2]
ALTER TABLE [dbo].[installation] NOCHECK CONSTRAINT [FKta19nursu6xa6gl8px1lsbk5g]

PRINT(N'Drop constraints from [dbo].[compte]')
ALTER TABLE [dbo].[compte] NOCHECK CONSTRAINT [FKjgjfwpm83x17wxj6usdxsj15h]
ALTER TABLE [dbo].[compte] NOCHECK CONSTRAINT [FKr1m349w78hwtvjjdd4m1gkhj0]

PRINT(N'Drop constraint FKegso9yihi9ouwdvjy832oad3l from [dbo].[collectetransporteur]')
ALTER TABLE [dbo].[collectetransporteur] NOCHECK CONSTRAINT [FKegso9yihi9ouwdvjy832oad3l]

PRINT(N'Drop constraint FK55lfo6o8ceiwauh2jsqdn2pyf from [dbo].[contact_message]')
ALTER TABLE [dbo].[contact_message] NOCHECK CONSTRAINT [FK55lfo6o8ceiwauh2jsqdn2pyf]

PRINT(N'Drop constraint FKde5fyw6lkffg4fuq7j8u7xgsn from [dbo].[demande_infromation]')
ALTER TABLE [dbo].[demande_infromation] NOCHECK CONSTRAINT [FKde5fyw6lkffg4fuq7j8u7xgsn]

PRINT(N'Drop constraint FKka4t03egekfkb15nq0v2d8n8k from [dbo].[notification]')
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [FKka4t03egekfkb15nq0v2d8n8k]

PRINT(N'Drop constraints from [dbo].[societe]')
ALTER TABLE [dbo].[societe] NOCHECK CONSTRAINT [FK47h4ylpa98xx6gwccesjgl84w]
ALTER TABLE [dbo].[societe] NOCHECK CONSTRAINT [FK6n17fb2hn2hl1dj5xbx64erqy]

PRINT(N'Drop constraints from [dbo].[profilerole]')
ALTER TABLE [dbo].[profilerole] NOCHECK CONSTRAINT [FKd0u09busp4elueh2uulxujbfe]
ALTER TABLE [dbo].[profilerole] NOCHECK CONSTRAINT [FKfj60458p77xri6jue5vr9dj7r]

PRINT(N'Drop constraints from [dbo].[lieu_elimination]')
ALTER TABLE [dbo].[lieu_elimination] NOCHECK CONSTRAINT [FKa2khculffrrs5n8rry5g6x2gr]

PRINT(N'Drop constraints from [dbo].[doc_import]')
ALTER TABLE [dbo].[doc_import] NOCHECK CONSTRAINT [FK6prqh7r9ygyllg64bgyverxcp]

PRINT(N'Drop constraints from [dbo].[code]')
ALTER TABLE [dbo].[code] NOCHECK CONSTRAINT [FK1912gg6ioe9dx7buwdxm32mrj]

PRINT(N'Drop constraint FK1g78xf2o41wjvlmyl33wnvwue from [dbo].[collectetransporteur]')
ALTER TABLE [dbo].[collectetransporteur] NOCHECK CONSTRAINT [FK1g78xf2o41wjvlmyl33wnvwue]

PRINT(N'Drop constraint FK5o20wot2hw76xm7ixbxmhklog from [dbo].[notification]')
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [FK5o20wot2hw76xm7ixbxmhklog]

PRINT(N'Drop constraint FK6re19t10b7j49t91cdfsud4gx from [dbo].[type]')
ALTER TABLE [dbo].[type] NOCHECK CONSTRAINT [FK6re19t10b7j49t91cdfsud4gx]

PRINT(N'Drop constraint FKm8vr8n7dmim212hpfhwa3pivk from [dbo].[notification]')
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [FKm8vr8n7dmim212hpfhwa3pivk]

PRINT(N'Drop constraint FKlrywo63o90330eo0bushqa8qg from [dbo].[notification]')
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [FKlrywo63o90330eo0bushqa8qg]

PRINT(N'Drop constraint FKe2m8ovnm5xpd6gmp0iualscst from [dbo].[collectetransporteur]')
ALTER TABLE [dbo].[collectetransporteur] NOCHECK CONSTRAINT [FKe2m8ovnm5xpd6gmp0iualscst]

PRINT(N'Drop constraint FKluuhsc66vp3mx90eb64qyaohh from [dbo].[collectetransporteur]')
ALTER TABLE [dbo].[collectetransporteur] NOCHECK CONSTRAINT [FKluuhsc66vp3mx90eb64qyaohh]

PRINT(N'Drop constraint FKe2nwbswtyxw1qsldt7bggh4b2 from [dbo].[demande_infromation]')
ALTER TABLE [dbo].[demande_infromation] NOCHECK CONSTRAINT [FKe2nwbswtyxw1qsldt7bggh4b2]

PRINT(N'Drop constraint FK5286lo4nlnmcqdw2n46iw9a9f from [dbo].[demande_infromation]')
ALTER TABLE [dbo].[demande_infromation] NOCHECK CONSTRAINT [FK5286lo4nlnmcqdw2n46iw9a9f]

PRINT(N'Drop constraint FKpakj0ig6tiq41n1k4kwxr98e8 from [dbo].[collectetransporteur]')
ALTER TABLE [dbo].[collectetransporteur] NOCHECK CONSTRAINT [FKpakj0ig6tiq41n1k4kwxr98e8]

PRINT(N'Drop constraint FKf9a7cojfuvf40x6co16kxa1jb from [dbo].[userrole]')
ALTER TABLE [dbo].[userrole] NOCHECK CONSTRAINT [FKf9a7cojfuvf40x6co16kxa1jb]

PRINT(N'Drop constraint FK7fsa73b9gr5hfedox47wy08a3 from [dbo].[userroleexist]')
ALTER TABLE [dbo].[userroleexist] NOCHECK CONSTRAINT [FK7fsa73b9gr5hfedox47wy08a3]

PRINT(N'Drop constraint FKao63rrnrfswts88rv5pdt0c82 from [dbo].[comite]')
ALTER TABLE [dbo].[comite] NOCHECK CONSTRAINT [FKao63rrnrfswts88rv5pdt0c82]

PRINT(N'Drop constraint FK1rdauhpwr4tic3kckeutelji7 from [dbo].[eiedre]')
ALTER TABLE [dbo].[eiedre] NOCHECK CONSTRAINT [FK1rdauhpwr4tic3kckeutelji7]

PRINT(N'Drop constraint FKbkkbv1wf1m466x6ugkfgaoukw from [dbo].[eiedre]')
ALTER TABLE [dbo].[eiedre] NOCHECK CONSTRAINT [FKbkkbv1wf1m466x6ugkfgaoukw]

PRINT(N'Drop constraint FKli4t5o7sx594dxyr690x8ic3y from [dbo].[notification]')
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [FKli4t5o7sx594dxyr690x8ic3y]

PRINT(N'Drop constraint FKqgnkm8r8fmyjj0hoohjhelu66 from [dbo].[transporteur]')
ALTER TABLE [dbo].[transporteur] NOCHECK CONSTRAINT [FKqgnkm8r8fmyjj0hoohjhelu66]

PRINT(N'Drop constraint FKqb6wjsxh30uwvcgntr2ggcwxb from [dbo].[vehicules]')
ALTER TABLE [dbo].[vehicules] NOCHECK CONSTRAINT [FKqb6wjsxh30uwvcgntr2ggcwxb]

PRINT(N'Drop constraint FKtd6ykxkn3arln8hr35u9vuxvt from [dbo].[eiedre]')
ALTER TABLE [dbo].[eiedre] NOCHECK CONSTRAINT [FKtd6ykxkn3arln8hr35u9vuxvt]

PRINT(N'Drop constraint FK2xyl9kka6h2w34f4d6lg1j4ha from [dbo].[notification]')
ALTER TABLE [dbo].[notification] NOCHECK CONSTRAINT [FK2xyl9kka6h2w34f4d6lg1j4ha]

PRINT(N'Drop constraint FK460fk34axjhpe3dvpl9nnocei from [dbo].[demande_infromation]')
ALTER TABLE [dbo].[demande_infromation] NOCHECK CONSTRAINT [FK460fk34axjhpe3dvpl9nnocei]

PRINT(N'Add 8 rows to [dbo].[autorisationparam]')
SET IDENTITY_INSERT [dbo].[autorisationparam] ON
INSERT INTO [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'استيراد المخلفات (منطقة حرة)', N'Importation dechets (zone franche)')
INSERT INTO [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'جمع / نقل النفايات الخطرة', N'Collecte/transport des déchets dangereux')
INSERT INTO [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'استيراد مخلفات غير خطرة من دولة أجنبية', N'Importation des déchets non dangereux d’un pays étranger')
INSERT INTO [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'مرفق معالجة النفايات', N'Installation de traitement des déchets')
INSERT INTO [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'استيراد المخلفات غير الخطرة من المنطقة الحرة', N'Importation des déchets non dangereux d’une zone franche')
INSERT INTO [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'تصدير المخلفات الخطرة', N'Exportation des déchets dangereux ')
INSERT INTO [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'عبور النفايات', N'Transit des Déchets ')
INSERT INTO [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'طلب ترخيص استيراد نفايات غير حديدية ', N'Demande de  licence d’importation des déchets non ferreux')
SET IDENTITY_INSERT [dbo].[autorisationparam] OFF

PRINT(N'Add 2 rows to [dbo].[categorie]')
SET IDENTITY_INSERT [dbo].[categorie] ON
INSERT INTO [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'الفئة', N'Catégorie 1')
INSERT INTO [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'الفئة 2', N'Catégorie 2')
SET IDENTITY_INSERT [dbo].[categorie] OFF

PRINT(N'Add 2 rows to [dbo].[classification]')
SET IDENTITY_INSERT [dbo].[classification] ON
INSERT INTO [dbo].[classification] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'الخطرة ', N'dangereux')
INSERT INTO [dbo].[classification] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'غير الخطرة ', N'non dangereux')
SET IDENTITY_INSERT [dbo].[classification] OFF

PRINT(N'Add 19 rows to [dbo].[commune]')
SET IDENTITY_INSERT [dbo].[commune] ON
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'بنسودة', N'Bensouda')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'حي المسيرة', N'Hay Massira')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'باب فتوح', N'Bab Fetouh')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'الاطلس', N'Atlas')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'بني بوفراح', N'Bni Boufrah')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'سنادة', N'Senada')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (11, NULL, N'المنزلة', N'Al Manzla')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (12, NULL, N'سبت الزينات', N'Sebt Azzinate')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (13, NULL, N'عين الحسن', N'Ain Lahsan')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (14, NULL, N'ازلا', N'Azla')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (15, NULL, N'اغبال', N'Aghbal')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (16, NULL, N'سيدي بوحرية', N'Sidi Bouhria')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (17, NULL, N'افسو', N'Afsou')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (18, NULL, N'تيزتوتين', N'Tiztoutine')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (19, NULL, N'اهل انغاد', N'Ahl Angad')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (20, NULL, N'سيدي بولنوار', N'Sidi Boulenouar')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (21, NULL, N'بن منصور', N'Ben Mansour')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (22, NULL, N'سيدي الطايبي', N'Sidi Taibi')
INSERT INTO [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (23, NULL, N'امور', N'Ameur')
SET IDENTITY_INSERT [dbo].[commune] OFF

PRINT(N'Add 7 rows to [dbo].[equipement_securite]')
SET IDENTITY_INSERT [dbo].[equipement_securite] ON
INSERT INTO [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'Vêtement  fluorescent')
INSERT INTO [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'Triangles  réfléchissants ')
INSERT INTO [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'Lampe  de  poche')
INSERT INTO [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'Extincteurs  2  kg  poudre')
INSERT INTO [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'Extincteurs  6  kg  poudre')
INSERT INTO [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, NULL, N'émetteurs VHF')
INSERT INTO [dbo].[equipement_securite] ([id_equipement], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, NULL, N'Masques')
SET IDENTITY_INSERT [dbo].[equipement_securite] OFF

PRINT(N'Add 4 rows to [dbo].[evaluationparam]')
SET IDENTITY_INSERT [dbo].[evaluationparam] ON
INSERT INTO [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'التقييم البيئي الاستراتيجي', N'Évaluation environnementale stratégique (EES)')
INSERT INTO [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'التدقيق البيئي', N'Audit environnementale')
INSERT INTO [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'إشعار الأثر', N'Notice d’impact')
INSERT INTO [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'دراسة الأثر البيئي ', N'Etude d’impact environnementale')
SET IDENTITY_INSERT [dbo].[evaluationparam] OFF

PRINT(N'Add 4 rows to [dbo].[moyen_transport]')
SET IDENTITY_INSERT [dbo].[moyen_transport] ON
INSERT INTO [dbo].[moyen_transport] ([id_moyen_transport], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'Bateau', N'Bateau')
INSERT INTO [dbo].[moyen_transport] ([id_moyen_transport], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'Train', N'Train')
INSERT INTO [dbo].[moyen_transport] ([id_moyen_transport], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'avion', N'Avion')
INSERT INTO [dbo].[moyen_transport] ([id_moyen_transport], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'Camion', N'Camion')
SET IDENTITY_INSERT [dbo].[moyen_transport] OFF

PRINT(N'Add 2 rows to [dbo].[nature_activite]')
SET IDENTITY_INSERT [dbo].[nature_activite] ON
INSERT INTO [dbo].[nature_activite] ([id_nature_activite], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'النشاط 1', N'Nature Activité 1')
INSERT INTO [dbo].[nature_activite] ([id_nature_activite], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'النشاط 2', N'Nature Activité 2')
SET IDENTITY_INSERT [dbo].[nature_activite] OFF

PRINT(N'Add 29 rows to [dbo].[pays]')
SET IDENTITY_INSERT [dbo].[pays] ON
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, N'504', NULL, N'المغرب', N'maroc')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, N'250', NULL, N'فرنسا', N'France')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, N'Us', '2021-02-18 10:09:22.1320000', N'الولايات المتحدة', N'United States')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, N'Us', '2021-02-18 10:09:24.1200000', N'الولايات المتحدة', N'United States')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, N'Us', '2021-02-18 10:09:23.3870000', N'الولايات المتحدة', N'United States')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, N'Us', '2021-02-18 10:09:43.2000000', N'الولايات المتحدة', N'United States')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, N'Us', '2021-02-18 10:09:24.6380000', N'الولايات المتحدة', N'United States')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, N'Us', '2021-02-18 10:09:29.4940000', N'الولايات المتحدة', N'United States')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, N'Us', '2021-02-18 10:09:25.2800000', N'الولايات المتحدة', N'Usa')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, N'Us', '2021-02-18 10:09:27.9480000', N'الولايات المتحدة', N'Usa')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (11, N'Us', '2021-02-18 10:09:34.4700000', N'الولايات المتحدة', N'Usa')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (12, N'Usa', '2021-02-18 10:09:39.7380000', N'امريكا', N'United States ')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (13, N'Usa', '2021-02-18 10:09:41.1330000', N'امريكا', N'United States ')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (14, N'Usa', '2021-02-18 10:09:40.2470000', N'امريكا', N'United States ')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (15, N'Usa', '2021-02-18 10:09:45.9210000', N'امريكا', N'United States ')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (16, N'Usa', '2021-02-18 10:09:37.7650000', N'امريكا', N'United States ')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (17, N'840', NULL, N'امريكا', N'United States ')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (18, N'724', NULL, N'اسبانيا', N'Espagne')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (19, N'276', NULL, N'المانيا', N'Germany')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (20, N'112', NULL, N'بلجيكا', N'Belguim')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (21, N'380', NULL, N'ايطاليا', N' Italy')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (22, N'528', NULL, N'هولندا', N'Netherlands')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (23, N'620', NULL, N'البرتغال', N'Portugal')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (24, N'788', NULL, N'تونس', N'Tunisia')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (25, N'784', NULL, N'الامارات', N'United Arab Emirates')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (26, N'012', NULL, N'الجزائر', N'Algeria')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (27, N'124', NULL, N'كندا', N'Canada')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (28, N'756', NULL, N'سويسرا', N'Switzerland')
INSERT INTO [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (29, N'826', NULL, N'المملكة المتحدة', N'United Kingdom')
SET IDENTITY_INSERT [dbo].[pays] OFF

PRINT(N'Add 25 rows to [dbo].[prefecture]')
SET IDENTITY_INSERT [dbo].[prefecture] ON
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'فاس', N'Fès')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'مكناس', N'Meknes')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (11, NULL, N'طنجة', N'Tanger')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (12, NULL, N'تطوان', N'Tetouan')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (13, NULL, N'الدار البيضاء', N'Casablanca')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (14, NULL, N'الرباط', N'Rabat')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (15, NULL, N'سلا', N'Sale')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (16, NULL, N'اغادير', N'Agadir')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (17, NULL, N'وجدة', N'Oujda')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (18, NULL, N'الناظور', N'Nador')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (19, NULL, N'الحسيمة', N'Hoceima')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (20, NULL, N'قنيطرة', N'Kenitra')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (21, NULL, N'العيون', N'Laayoune')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (22, NULL, N'الجديدة', N'Jadida')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (23, NULL, N'خريبكة', N'Kheribga')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (24, NULL, N'بركان', N'Berkane')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (25, NULL, N'مراكش', N'Marrakech')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (26, NULL, N'تادلة', N'Tadla')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (27, NULL, N'ازيلال', N'Azilal')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (28, NULL, N'الكويرة', N'Lagouira')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (29, NULL, N'الصويرة', N'Essouira')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (30, NULL, N'الحاجب', N'El Hajeb')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (31, NULL, N'افران', N'Ifrane')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (32, NULL, N'تازة', N'Taza')
INSERT INTO [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (33, '2021-03-02 14:31:46.7170000', NULL, N'Ifrane')
SET IDENTITY_INSERT [dbo].[prefecture] OFF

PRINT(N'Add 1 row to [dbo].[profil]')
SET IDENTITY_INSERT [dbo].[profil] ON
INSERT INTO [dbo].[profil] ([profil_id], [create_date_time], [delete_date_time], [nom], [update_date_time]) VALUES (1, NULL, NULL, N'admin', NULL)
SET IDENTITY_INSERT [dbo].[profil] OFF

PRINT(N'Add 14 rows to [dbo].[region]')
SET IDENTITY_INSERT [dbo].[region] ON
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1013, NULL, NULL, N'دكالة عبدة ', N'Dakala Abda')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1014, NULL, NULL, N'جهة سوس  ', N'Souss-Massa')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1015, NULL, '2021-03-02 14:28:15.4260000', N'جهة مراكش آسفي', N'Marrakech-Tensift-Al Haouz ')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1016, NULL, NULL, N'جهة الدار البيضاء سطات', N'Casablanca - Settat')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1017, NULL, NULL, N'جهة الشرق ', N'Oriental')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1018, NULL, NULL, N'طنجة - تطوان  - الحسيمة 	', N'Tanger - Tetouan - Hoceima')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1019, NULL, NULL, N'جهة فاس -  مكناس', N'Fès- Meknés')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1020, NULL, '2021-03-02 14:26:10.4920000', N'', N'')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1021, NULL, NULL, N'العيون- الساقية الحمرا', N'Laâyoune-Sakia el Hamra')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1022, NULL, '2021-03-02 14:26:08.9920000', N'', N'')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1023, NULL, NULL, N'مراكش - اسفي', N'Marrakech - Safi')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1024, NULL, NULL, N'الرباط - سلا - القنيطرة', N'Rabat-Salé-Kénitra')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1025, NULL, NULL, N'درعة - تافيلالت', N'Drâa-Tafilalet')
INSERT INTO [dbo].[region] ([region_id], [dater], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1026, NULL, NULL, N'الداخلة واذي الذهب', N'Dakhla-Oued Ed-Dahab')
SET IDENTITY_INSERT [dbo].[region] OFF

PRINT(N'Add 1 row to [dbo].[role]')
SET IDENTITY_INSERT [dbo].[role] ON
INSERT INTO [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (1, N'ROLE_ADMIN', N'ROLE_ADMIN')
SET IDENTITY_INSERT [dbo].[role] OFF

PRINT(N'Add 2 rows to [dbo].[secteur]')
SET IDENTITY_INSERT [dbo].[secteur] ON
INSERT INTO [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'Agroalimentaire', N'Agroalimentaire')
INSERT INTO [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'Assurance', N'Assurance')
SET IDENTITY_INSERT [dbo].[secteur] OFF

PRINT(N'Add 10 rows to [dbo].[statut_collecte_transport]')
SET IDENTITY_INSERT [dbo].[statut_collecte_transport] ON
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'en attente', N'en attente')
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'non conforme', N'non conforme')
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'contrôle préliminaire', N'contrôle préliminaire')
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'attente d''avis d''AGCDD', N'attente d''avis d''AGCDD')
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'attente d''avis de commission', N'attente d''avis de commission')
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'refus', N'refus')
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'favorable', N'favorable')
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'non favorable', N'non favorable')
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'attente d''avis de Comission', N'attente d''avis de Comission')
INSERT INTO [dbo].[statut_collecte_transport] ([id_statut_collecte], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'attente de signature', N'attente de signature')
SET IDENTITY_INSERT [dbo].[statut_collecte_transport] OFF

PRINT(N'Add 5 rows to [dbo].[statut_installation]')
SET IDENTITY_INSERT [dbo].[statut_installation] ON
INSERT INTO [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'en attente', N'en attente')
INSERT INTO [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'non conforme', N'non conforme')
INSERT INTO [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'visite planifié', N'visite planifié')
INSERT INTO [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'favorable', N'favorable')
INSERT INTO [dbo].[statut_installation] ([id_statut_installation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'non favorable', N'non favorable')
SET IDENTITY_INSERT [dbo].[statut_installation] OFF

PRINT(N'Add 13 rows to [dbo].[statut_projet]')
SET IDENTITY_INSERT [dbo].[statut_projet] ON
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'en attente', N'en attente')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'réunion planifier', N'réunion planifier')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'Non Acceptable', N'Non Acceptable')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'Quorum no atteint', N'Quorum no atteint')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'Attente Signature', N'Attente Signature')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'Signé', N'Signé')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'attente documents définitive', N'attente documents définitive')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'arrete d''examen', N'arrete d''examen')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'Documment definitive attaché', N'Documment definitive attaché')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'Document à amélioré', N'Document à amélioré')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (11, NULL, N'Rensignement', N'Rensignement')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (12, NULL, N'Conforme', N'Conforme')
INSERT INTO [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (13, NULL, N'Avis de projet', N'Avis de projet')
SET IDENTITY_INSERT [dbo].[statut_projet] OFF

PRINT(N'Add 4 rows to [dbo].[transporteurparam]')
SET IDENTITY_INSERT [dbo].[transporteurparam] ON
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel]) VALUES (1, NULL, N'AQUAFLORE@gmail.com', N'0575757575', N'12', N'AQUAFLORE', N'0675757575')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel]) VALUES (2, NULL, N'PROTECT@gmail.com', N'0575757575', N'12', N'PROTECT', N'0614629664')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel]) VALUES (3, NULL, N'LOGIPRO@GMAIL.COM', N'0575757575', N'123', N'LOGIPRO', N'0675757575')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel]) VALUES (4, NULL, N'MEGATRATEMENT@GMAIL.COM', N'0575757575', N'123', N'MEGATRATEMENT', N'0614629664')
SET IDENTITY_INSERT [dbo].[transporteurparam] OFF

PRINT(N'Add 5 rows to [dbo].[typeconteneurs]')
SET IDENTITY_INSERT [dbo].[typeconteneurs] ON
INSERT INTO [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'citernes')
INSERT INTO [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'semi-remorques   citernes')
INSERT INTO [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N' conteneurs-citernes')
INSERT INTO [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'semi-remorques')
INSERT INTO [dbo].[typeconteneurs] ([id_type_conteneur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'remorques')
SET IDENTITY_INSERT [dbo].[typeconteneurs] OFF

PRINT(N'Add 5 rows to [dbo].[typevehicule]')
SET IDENTITY_INSERT [dbo].[typevehicule] ON
INSERT INTO [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'wagon')
INSERT INTO [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'avion')
INSERT INTO [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'bateau')
INSERT INTO [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'camion')
INSERT INTO [dbo].[typevehicule] ([id_type_vehicule], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'tracteur')
SET IDENTITY_INSERT [dbo].[typevehicule] OFF

PRINT(N'Add 2 rows to [dbo].[unite]')
SET IDENTITY_INSERT [dbo].[unite] ON
INSERT INTO [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'L', N'L')
INSERT INTO [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'Kg', N'Kg')
SET IDENTITY_INSERT [dbo].[unite] OFF

PRINT(N'Add 2 rows to [dbo].[visite_installation]')
SET IDENTITY_INSERT [dbo].[visite_installation] ON
INSERT INTO [dbo].[visite_installation] ([id_visite_installation], [conclusion], [date_transmission], [date_visite], [delete_date_time], [nomsite_ar], [nomsite_fr], [object], [resultat]) VALUES (1, N'Conclusions', NULL, '2021-01-29 02:03:00.0000000', NULL, NULL, N'Site', N'Objet', N'Résultats')
INSERT INTO [dbo].[visite_installation] ([id_visite_installation], [conclusion], [date_transmission], [date_visite], [delete_date_time], [nomsite_ar], [nomsite_fr], [object], [resultat]) VALUES (2, N'Conclusions', NULL, '2021-01-10 02:03:00.0000000', NULL, NULL, N'Site', N'Objet', N'Résultats')
SET IDENTITY_INSERT [dbo].[visite_installation] OFF

PRINT(N'Add 2 rows to [dbo].[zonnefranche]')
SET IDENTITY_INSERT [dbo].[zonnefranche] ON
INSERT INTO [dbo].[zonnefranche] ([id_zonnefranche], [code], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'tanger', N'Tanger')
INSERT INTO [dbo].[zonnefranche] ([id_zonnefranche], [code], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'khenitra', N'khenitra')
SET IDENTITY_INSERT [dbo].[zonnefranche] OFF

PRINT(N'Add 838 rows to [dbo].[code]')
SET IDENTITY_INSERT [dbo].[code] ON
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (3, NULL, N'déchets provenant de l''extraction des minéraux métallifères', N'01 01 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (4, NULL, N'déchets provenant de l''extraction des minéraux non métallifères', N'01 01 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (6, NULL, N'stériles acidogènes provenant de la transformation du sulfure', N'01 03 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (7, NULL, N'autres stériles contenant des substances dangereuses', N'01 03 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (8, NULL, N'stériles autres que ceux visés aux rubriques 01 03 04 et 01 03 05', N'01 03 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (9, NULL, N'autres déchets contenant des substances dangereuses provenant de la transformation physique et chimique des minéraux métallifères', N'01 03 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (10, NULL, N'déchets de poussières et de poudres autres que ceux visés à la rubrique 01 03 07', N'01 03 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (11, NULL, N'boues rouges issues de la production d''alumine autres que celles visées à la rubrique 01 03 07', N'01 03 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (12, NULL, N'déchets non spécifiés ailleurs', N'01 03 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (14, NULL, N'déchets contenant des substances dangereuses provenant de la transformation physique et chimique des minéraux non métallifères', N'01 04 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (15, NULL, N'déchets de graviers et débris de pierres autres que ceux visés à la rubrique 01 04 07', N'01 04 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (16, NULL, N'déchets de sable et d''argile', N'01 04 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (17, NULL, N'déchets de poussières et de poudres autres que ceux visés à la rubrique 01 04 07', N'01 04 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (18, NULL, N'déchets de la transformation de la potasse et des sels minéraux autres que ceux visés à la rubrique 01 04 07', N'01 04 11', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (19, NULL, N'stériles et autres déchets provenant du lavage et du nettoyage des minéraux autres que ceux visés aux rubriques 01 04 07 et 01 04 11', N'01 04 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (20, NULL, N'déchets provenant de la taille et du sciage des pierres autres que ceux visés à la rubrique 01 04 07', N'01 04 13', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (21, NULL, N'déchets non spécifiés ailleurs', N'01 04 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (23, NULL, N'boues et autres déchets de forage contenant de l''eau douce', N'01 05 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (24, NULL, N'boues et autres déchets de forage contenant des hydrocarbures', N'01 05 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (25, NULL, N'boues et autres déchets de forage contenant des substances dangereuses', N'01 05 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (26, NULL, N'boues et autres déchets de forage contenant des sels de baryum autres que ceux visés aux rubriques 01 05 05 et 01 05 06', N'01 05 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (27, NULL, N'boues et autres déchets de forage contenant des chlorures autres que ceux visés aux rubriques 01 05 05 et 01 05 06', N'01 05 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (28, NULL, N'déchets non spécifiés ailleurs', N'01 05 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (31, NULL, N'boues provenant du lavage et du nettoyage', N'02 01 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (32, NULL, N'déchets de tissus animaux', N'02 01 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (33, NULL, N'déchets de tissus végétaux', N'02 01 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (34, NULL, N'déchets de matières plastiques (à l''exclusion des emballages)', N'02 01 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (35, NULL, N'fèces, urine et fumier (y compris paille souillée), effluents collectés séparément et traités hors site', N'02 01 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (36, NULL, N'déchets provenant de la sylviculture', N'02 01 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (37, NULL, N'déchets agrochimiques contenant des substances dangereuses', N'02 01 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (38, NULL, N'Déchets agrochimiques autres que ceux visés à la rubrique 02 01 08', N'02 01 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (39, NULL, N'Déchets métalliques', N'02 01 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (40, NULL, N'déchets non spécifiés ailleurs', N'02 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (42, NULL, N'boues provenant du lavage et du nettoyage', N'02 02 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (43, NULL, N'déchets de tissus animaux', N'02 02 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (44, NULL, N'matières impropres à la consommation ou à la transformation', N'02 02 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (45, NULL, N'boues provenant du traitement in situ des effluents', N'02 02 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (46, NULL, N'déchets non spécifiés ailleurs', N'02 02 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (48, NULL, N'boues provenant du lavage, du nettoyage, de l''épluchage, de la centrifugation et de la séparation', N'02 03 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (49, NULL, N'déchets d''agents de conservation', N'02 03 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (50, NULL, N'déchets de l''extraction aux solvants', N'02 03 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (51, NULL, N'matières impropres à la consommation ou à la transformation', N'02 03 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (52, NULL, N'boues provenant du traitement in situ des effluents', N'02 03 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (53, NULL, N'déchets non spécifiés ailleurs', N'02 03 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (55, NULL, N'terre provenant du lavage et du nettoyage des betteraves', N'02 04 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (56, NULL, N'carbonate de calcium déclassé', N'02 04 02 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (57, NULL, N'boues provenant du traitement in situ des effluents', N'02 04 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (58, NULL, N'déchets non spécifiés ailleurs', N'02 04 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (60, NULL, N'matières impropres à la consommation ou à la transformation', N'02 05 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (61, NULL, N'boues provenant du traitement in situ des effluents', N'02 05 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (62, NULL, N'déchets non spécifiés ailleurs', N'02 05 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (64, NULL, N'matières impropres à la consommation ou à la transformation', N'02 06 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (65, NULL, N'déchets d''agents de conservation', N'02 06 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (66, NULL, N'boues provenant du traitement in situ des effluents', N'02 06 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (67, NULL, N'déchets non spécifiés ailleurs', N'02 06 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (69, NULL, N'déchets provenant du lavage, du nettoyage et de la réduction mécanique des matières premières', N'02 07 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (70, NULL, N'déchets de la distillation de l''alcool', N'02 07 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (71, NULL, N'déchets de traitements chimiques', N'02 07 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (72, NULL, N'matières impropres à la consommation ou à la transformation', N'02 07 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (73, NULL, N'boues provenant du traitement in situ des effluents', N'02 07 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (74, NULL, N'déchets non spécifiés ailleurs', N'02 07 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (77, NULL, N'déchets d''écorce et de liège', N'03 01 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (78, NULL, N'sciure de bois, copeaux, chutes, bois, panneaux de particules et placages contenant des substances dangereuses', N'03 01 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (79, NULL, N'sciure de bois, copeaux, chutes, bois, panneaux de particules et placages autres que ceux visés à la rubrique 03 01 04', N'03 01 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (80, NULL, N'déchets non spécifiés ailleurs', N'03 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (82, NULL, N'composés organiques non halogénés de protection du bois', N'03 02 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (83, NULL, N'composés organochlorés de protection du bois', N'03 02 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (84, NULL, N'composés organométalliques de protection du bois', N'03 02 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (85, NULL, N'composés inorganiques de protection du bois ', N'03 02 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (86, NULL, N'autres produits de protection du bois contenant des substances dangereuses', N'03 02 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (87, NULL, N'Produits de protection du bois non spécifiés ailleurs', N'03 02 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (89, NULL, N'Déchets d''écorce et de bois', N'03 03 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (90, NULL, N'liqueurs vertes (provenant de la récupération de liqueur de cuisson)', N'03 03 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (91, NULL, N'boues de désencrage provenant du recyclage du papier', N'03 03 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (92, NULL, N'refus séparés mécaniquement provenant du broyage de déchets de papier et de carton', N'03 03 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (93, NULL, N'déchets provenant du tri de papier et de carton destinés au recyclage', N'03 03 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (94, NULL, N'déchets de boues résiduaires de chaux', N'03 03 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (95, NULL, N'refus fibreux, boues de fibres, de charge et de couchage provenant d''une séparation mécanique', N'03 03 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (96, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 03 03 10', N'03 03 11', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (97, NULL, N'déchets non spécifiés ailleurs', N'03 03 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (100, NULL, N'déchets d''écharnage et refentes', N'04 01 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (101, NULL, N'résidus de pelanage', N'04 01 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (102, NULL, N'déchets de dégraissage contenant des solvants sans phase liquide', N'04 01 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (103, NULL, N'liqueur de tannage contenant du chrome', N'04 01 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (104, NULL, N'liqueur de tannage sans chrome', N'04 01 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (105, NULL, N'boues notamment provenant du traitement in situ des effluents, contenant du chrome', N'04 01 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (106, NULL, N'boues, notamment provenant du traitement in situ des effluents, sans chrome', N'04 01 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (107, NULL, N'déchets de cuir tanné (refentes sur bleu, dérayures, échantillonnages, poussières de ponçage) contenant du chrome', N'04 01 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (108, NULL, N'déchets provenant de l''habillage et des finitions', N'04 01 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (109, NULL, N'déchets non spécifiés ailleurs', N'04 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (111, NULL, N'matériaux composites (textile imprégné, élastomère, plastomère)', N'04 02 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (112, NULL, N'matière organique issue de produits naturels (par exemple graisse, cire)', N'04 02 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (113, NULL, N'déchets provenant des finitions contenant des solvants organiques', N'04 02 14', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (114, NULL, N'déchets provenant des finitions autres que ceux visés à la rubrique 04 02 14', N'04 02 15', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (115, NULL, N'teintures et pigments contenant des substances dangereuses', N'04 02 16', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (116, NULL, N'teintures et pigments autres que ceux visés à la rubrique 04 02 16', N'04 02 17', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (117, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'04 02 19', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (118, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 04 02 19', N'04 02 20', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (119, NULL, N'fibres textiles non ouvrées', N'04 02 21', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (120, NULL, N'fibres textiles ouvrées', N'04 02 22', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (121, NULL, N'déchets non spécifiés ailleurs', N'04 02 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (124, NULL, N'boues de dessalage ', N'05 01 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (125, NULL, N'boues de fond de cuves', N'05 01 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (126, NULL, N'boues d''alkyles acides', N'05 01 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (127, NULL, N'hydrocarbures accidentellement répandus', N'05 01 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (128, NULL, N'boues contenant des hydrocarbures provenant des opérations de maintenance de l''installation ou des équipements ', N'05 01 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (129, NULL, N'goudrons acides ', N'05 01 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (130, NULL, N'autres goudrons et bitumes', N'05 01 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (131, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'05 01 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (132, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 05 01 09', N'05 01 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (133, NULL, N'déchets provenant du nettoyage d''hydrocarbures avec des bases', N'05 01 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (134, NULL, N'hydrocarbures contenant des acides', N'05 01 12', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (135, NULL, N'boues du traitement de l''eau d''alimentation des chaudières', N'05 01 13', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (136, NULL, N'déchets provenant des colonnes de refroidissement', N'05 01 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (137, NULL, N'argiles de filtration usées', N'05 01 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (138, NULL, N'déchets contenant du soufre provenant de la désulfuration du pétrole', N'05 01 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (139, NULL, N'mélanges bitumineux', N'05 01 17', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (140, NULL, N'déchets non spécifiés ailleurs', N'05 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (142, NULL, N'goudrons acides', N'05 06 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (143, NULL, N'autres goudrons', N'05 06 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (144, NULL, N'déchets provenant des colonnes de refroidissement', N'05 06 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (145, NULL, N'déchets non spécifiés ailleurs', N'05 06 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (147, NULL, N'boues contenant du mercure', N'05 07 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (148, NULL, N'déchets contenant du soufre', N'05 07 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (149, NULL, N'déchets non spécifiés ailleurs', N'05 07 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (152, NULL, N'acide sulfurique et acide sulfureux ', N'06 01 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (153, NULL, N'acide chlorhydrique ', N'06 01 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (154, NULL, N'acide fluorhydrique ', N'06 01 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (155, NULL, N'acide phosphorique et acide phosphoreux ', N'06 01 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (156, NULL, N'acide nitrique et acide nitreux ', N'06 01 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (157, NULL, N'autres acides ', N'06 01 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (158, NULL, N'déchets non spécifiés ailleurs ', N'06 01 99', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (160, NULL, N'hydroxyde de calcium', N'06 02 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (161, NULL, N'hydroxyde d''ammoniaque', N'06 02 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (162, NULL, N'hydroxyde de sodium et hydroxyde de potassium', N'06 02 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (163, NULL, N'autres bases', N'06 02 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (164, NULL, N'déchets non spécifiés ailleurs', N'06 02 99', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (166, NULL, N'sels solides et solutions contenant des cyanures', N'06 03 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (167, NULL, N'sels solides et solutions contenant des métaux lourds', N'06 03 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (168, NULL, N'sels solides et solutions autres que ceux visés aux rubriques 06 03 11 et 06 03 13', N'06 03 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (169, NULL, N'oxydes métalliques contenant des métaux lourds', N'06 03 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (170, NULL, N'oxydes métalliques autres que ceux visés à la rubrique 06 03 15', N'06 03 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (171, NULL, N'déchets non spécifiés ailleurs', N'06 03 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (173, NULL, N'déchets contenant de l''arsenic', N'06 04 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (174, NULL, N'déchets contenant du mercure', N'06 04 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (175, NULL, N'déchets contenant d''autres métaux lourds', N'06 04 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (176, NULL, N'déchets non spécifiés ailleurs', N'06 04 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (178, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'06 05 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (179, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 06 05 02', N'06 05 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (181, NULL, N'déchets contenant des sulfures dangereux', N'06 06 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (182, NULL, N'déchets contenant des sulfures autres que ceux visés à la rubrique 06 06 02', N'06 06 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (183, NULL, N'déchets non spécifiés ailleurs', N'06 06 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (185, NULL, N'déchets contenant de l''amiante provenant de l''électrolyse', N'06 07 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (186, NULL, N'déchets de charbon actif utilisé pour la production du chlore', N'06 07 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (187, NULL, N'boues de sulfate de baryum contenant du mercure', N'06 07 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (188, NULL, N'solutions et acides, par exemple, acide de contact', N'06 07 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (189, NULL, N'déchets non spécifiés ailleurs', N'06 07 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (191, NULL, N'déchets contenant des chlorosilanes', N'06 08 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (192, NULL, N'déchets non spécifiés ailleurs', N'06 08 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (194, NULL, N'scories phosphoriques', N'06 09 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (195, NULL, N'déchets de réactions basées sur le calcium contenant des substances dangereuses ou contaminées par de telles substances', N'06 04 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (196, NULL, N'déchets de réactions basées sur le calcium autres que ceux visés à la rubrique 06 09 03', N'06 09 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (197, NULL, N'déchets non spécifiés ailleurs', N'06 09 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (199, NULL, N'déchets contenant des substances dangereuses', N'06 10 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (200, NULL, N'déchets non spécifiés ailleurs', N'06 10 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (202, NULL, N'Déchets de réactions basés sur le calcium provenant de la production de dioxyde de titane', N'06 11 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (203, NULL, N'déchets non spécifiés ailleurs', N'06 11 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (205, NULL, N'produits phytosanitaires inorganiques, agents de protection du bois et autres biocides', N'06 13 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (206, NULL, N'charbon actif usé (sauf rubrique 06 07 02)', N'06 13 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (207, NULL, N'noir de carbone', N'06 13 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (208, NULL, N'déchets provenant de la transformation de l''amiante', N'06 13 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (209, NULL, N'suies', N'06 13 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (210, NULL, N'déchets non spécifiés ailleurs', N'06 13 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (213, NULL, N'eaux de lavage et liqueurs mères aqueuses', N'07 01 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (214, NULL, N'solvants, liquides de lavage et liqueurs mères organiques halogénés', N'07 01 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (215, NULL, N'autres solvants, liquides de lavage et liqueurs mères organiques', N'07 01 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (216, NULL, N'résidus de réaction et résidus de distillation halogénés', N'07 01 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (217, NULL, N'autres résidus de réaction et résidus de distillation', N'07 01 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (218, NULL, N'gâteaux de filtration et absorbants usés halogénés', N'07 01 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (219, NULL, N'autres gâteaux de filtration et absorbants usés', N'07 01 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (220, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'07 01 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (221, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 07 01 11', N'07 01 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (222, NULL, N'déchets non spécifiés ailleurs', N'07 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (224, NULL, N'eaux de lavage et liqueurs mères aqueuses', N'07 02 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (225, NULL, N'solvants, liquides de lavage et liqueurs mères organiques halogénés', N'07 02 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (226, NULL, N'autres solvants, liquides de lavage et liqueurs mères organiques', N'07 02 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (227, NULL, N'résidus de réaction et résidus de distillation halogénés', N'07 02 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (228, NULL, N'autres résidus de réaction et résidus de distillation', N'07 02 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (229, NULL, N'gâteaux de filtration et absorbants usés halogénés', N'07 02 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (230, NULL, N'autres gâteaux de filtration et absorbants usés', N'07 02 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (231, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'07 02 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (232, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 07 02 11', N'07 02 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (233, NULL, N'déchets plastiques', N'07 02 13', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (234, NULL, N'déchets provenant d''additifs contenant des substances dangereuses', N'07 02 14', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (235, NULL, N'déchets provenant d''additifs autres que ceux visés à la rubrique 07 02 14', N'07 02 15', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (236, NULL, N'déchets contenant des silicones', N'07 02 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (237, NULL, N'déchets non spécifiés ailleurs', N'07 02 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (239, NULL, N'eaux de lavage et liqueurs mères aqueuses', N'07 03 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (240, NULL, N'solvants, liquides de lavage et liqueurs mères organiques halogénés', N'07 03 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (241, NULL, N'autres solvants, liquides de lavage et liqueurs mères organiques', N'07 03 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (242, NULL, N'résidus de réaction et résidus de distillation halogénés', N'07 03 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (243, NULL, N'autres résidus de réaction et résidus de distillation', N'07 03 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (244, NULL, N'gâteaux de filtration et absorbants usés halogénés', N'07 03 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (245, NULL, N'autres gâteaux de filtration et absorbants usés', N'07 03 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (246, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'07 03 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (247, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 07 03 11', N'07 03 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (248, NULL, N'déchets non spécifiés ailleurs', N'01 03 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (250, NULL, N'eaux de lavage et liqueurs mères aqueuses', N'07 04 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (251, NULL, N'solvants, liquides de lavage et liqueurs mères organiques halogénés', N'07 04 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (252, NULL, N'autres solvants, liquides de lavage et liqueurs mères organiques', N'07 04 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (253, NULL, N'résidus de réaction et résidus de distillation halogénés', N'07 04 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (254, NULL, N'autres résidus de réaction et résidus de distillation', N'07 04 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (255, NULL, N'gâteaux de filtration et absorbants usés halogénés', N'07 04 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (256, NULL, N'autres gâteaux de filtration et absorbants usés', N'07 04 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (257, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'07 04 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (258, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 07 04 11', N'07 04 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (259, NULL, N'déchets solides contenant des substances dangereuses', N'07 04 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (260, NULL, N'déchets non spécifiés ailleurs', N'07 04 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (262, NULL, N'eaux de lavage et liqueurs mères aqueuses', N'07 05 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (263, NULL, N'solvants, liquides de lavage et liqueurs mères organiques halogénés', N'07 05 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (264, NULL, N'autres solvants, liquides de lavage et liqueurs mères organiques', N'07 05 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (265, NULL, N'résidus de réaction et résidus de distillation halogénés', N'07 05 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (266, NULL, N'autres résidus de réaction et résidus de distillation', N'07 05 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (267, NULL, N'gâteaux de filtration et absorbants usés halogénés', N'07 05 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (268, NULL, N'autres gâteaux de filtration et absorbants usés', N'07 05 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (269, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'07 05 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (270, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 07 05 11', N'07 05 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (271, NULL, N'déchets solides contenant des substances dangereuses', N'07 05 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (272, NULL, N'déchets solides autres que ceux visés à la rubrique 07 05 13', N'07 05 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (273, NULL, N'déchets non spécifiés ailleurs', N'07 05 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (275, NULL, N'eaux de lavage et liqueurs mères aqueuses', N'07 06 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (276, NULL, N'solvants, liquides de lavage et liqueurs mères organiques halogénés', N'07 06 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (277, NULL, N'autres solvants, liquides de lavage et liqueurs mères organiques', N'07 06 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (278, NULL, N'résidus de réaction et résidus de distillation halogénés', N'07 06 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (279, NULL, N'autres résidus de réaction et résidus de distillation', N'07 06 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (280, NULL, N'gâteaux de filtration et absorbants usés halogénés', N'07 06 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (281, NULL, N'autres gâteaux de filtration et absorbants usés', N'07 06 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (282, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'07 06 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (283, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 07 06 11', N'07 06 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (284, NULL, N'déchets non spécifiés ailleurs', N'07 06 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (286, NULL, N'eaux de lavage et liqueurs mères aqueuses', N'07 07 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (287, NULL, N'solvants, liquides de lavage et liqueurs mères organiques halogénés', N'07 07 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (288, NULL, N'autres solvants, liquides de lavage et liqueurs mères organiques', N'07 07 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (289, NULL, N'résidus de réaction et résidus de distillation halogénés', N'07 07 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (290, NULL, N'autres résidus de réaction et résidus de distillation', N'07 07 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (291, NULL, N'gâteaux de filtration et absorbants usés halogénés', N'07 07 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (292, NULL, N'autres gâteaux de filtration et absorbants usés', N'07 07 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (293, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'07 07 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (294, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 07 07 11', N'07 07 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (295, NULL, N'déchets non spécifiés ailleurs', N'07 07 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (297, NULL, N'déchets de peintures et vernis contenant des solvants organiques ou d''autres substances dangereuses', N'08 01 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (298, NULL, N'déchets de peintures ou vernis autres que ceux visés à la rubrique 08 01 11', N'08 01 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (299, NULL, N'boues provenant de peintures ou vernis contenant des solvants organiques ou autres substances dangereuses', N'08 01 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (300, NULL, N'boues provenant de peintures ou vernis autres que celles visées à la rubrique 08 01 13', N'08 01 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (301, NULL, N'boues aqueuses contenant de la peinture ou du vernis contenant des solvants organiques ou autres substances dangereuses', N'08 01 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (302, NULL, N'boues aqueuses contenant de la peinture ou du vernis autres que celles visées à la rubrique 08 01 15', N'08 01 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (303, NULL, N'déchets provenant du décapage de peintures ou vernis contenant des solvants organiques ou autres substances dangereuses', N'08 01 17', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (304, NULL, N'déchets provenant du décapage de peintures ou vernis autres que ceux visés à la rubrique 08 01 17', N'08 01 18', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (305, NULL, N'suspensions aqueuses contenant de la peinture ou du vernis contenant des solvants organiques ou autres substances dangereuses', N'08 01 19', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (306, NULL, N'suspensions aqueuses contenant de la peinture ou du vernis autres que celles visées à la rubrique 08 01 19', N'08 01 20', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (307, NULL, N'Déchets de décapants  de peintures ou vernis', N'08 01 21', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (308, NULL, N'déchets non spécifiés ailleurs', N'08 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (310, NULL, N'déchets de produits de revêtement en poudre', N'08 02 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (311, NULL, N'boues aqueuses contenant des matériaux céramiques', N'08 02 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (312, NULL, N'suspensions aqueuses contenant des matériaux céramiques', N'08 02 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (313, NULL, N'déchets non spécifiés ailleurs', N'08 02 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (315, NULL, N'boues aqueuses contenant de l''encre', N'08 03 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (316, NULL, N'déchet liquide aqueux contenant de l''encre', N'08 03 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (317, NULL, N'déchets d''encres contenant des substances dangereuses', N'08 03 12', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (318, NULL, N'déchets d''encres autres que ceux visés à la rubrique 08 03 12', N'08 03 13', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (319, NULL, N'boues d''encre contenant des substances dangereuses', N'08 03 14', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (320, NULL, N'boues d''encre autres que celles visées à la rubrique 08 03 14', N'08 03 15', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (321, NULL, N'déchets de solutions de morsure', N'08 03 16', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (322, NULL, N'déchets de toner d''impression contenant des substances dangereuses', N'08 03 17', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (323, NULL, N'déchets de toner d''impression autres que ceux visés à la rubrique 08 03 17', N'08 03 18', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (324, NULL, N'huiles dispersées', N'08 03 19', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (325, NULL, N'déchets non spécifiés ailleurs', N'08 03 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (327, NULL, N'déchets de colles et mastics contenant des solvants organiques ou d''autres substances dangereuses', N'08 04 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (328, NULL, N'déchets de colles et mastics autres que ceux visés à la rubrique 08 04 09', N'08 04 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (329, NULL, N'boues de colles et mastics contenant des solvants organiques ou d''autres substances dangereuses', N'08 04 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (330, NULL, N'boues de colles et mastics autres que celles visées à la rubrique 08 04 11', N'08 04 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (331, NULL, N'boues aqueuses contenant des colles ou mastics contenant des solvants organiques ou d''autres substances dangereuses', N'08 04 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (332, NULL, N'boues aqueuses contenant des colles et mastics autres que celles visées à la rubrique 08 04 13', N'08 04 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (333, NULL, N'déchets liquides aqueux contenant des colles ou mastics contenant des solvants organiques ou d''autres substances dangereuses', N'08 04 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (334, NULL, N'déchets liquides aqueux contenant des colles ou mastics autres que ceux visés à la rubrique 08 04 15', N'08 04 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (335, NULL, N'huile de résine', N'08 04 17', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (336, NULL, N'déchets non spécifiés ailleurs', N'08 04 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (338, NULL, N'déchets d''isocyanates', N'08 05 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (341, NULL, N'bains de développement aqueux contenant un activateur', N'09 01 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (342, NULL, N'bains de développement aqueux pour plaques offset', N'09 01 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (343, NULL, N'bains de développement contenant des solvants', N'09 01 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (344, NULL, N'bains de fixation', N'09 01 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (345, NULL, N'bains de blanchiment et bains de blanchiment/fixation', N'09 01 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (346, NULL, N'déchets contenant de l''argent provenant du traitement in situ des déchets photographiques', N'09 01 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (347, NULL, N'pellicules et papiers photographiques contenant de l''argent ou des composés de l''argent', N'09 01 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (348, NULL, N'pellicules et papiers photographiques sans argent ni composés de l''argent', N'09 01 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (349, NULL, N'appareils photographiques à usage unique sans piles', N'09 01 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (350, NULL, N'appareils photographiques à usage unique contenant des piles visées aux rubriques 16 06 01, 16 06 02 ou 16 06 03', N'09 01 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (351, NULL, N'appareils photographiques à usage unique contenant des piles autres ceux visés à là rubrique 09 01 11', N'09 01 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (352, NULL, N'déchets liquides aqueux provenant de la récupération in situ de l''argent autres que ceux visés à la rubrique 09 01 06', N'09 01 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (353, NULL, N'déchets non spécifiés ailleurs', N'09 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (356, NULL, N'Mâchefers, scories et cendres sous chaudière (sauf cendres sous chaudière visées à la rubrique 10 01 04)', N'10 01 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (357, NULL, N'cendres volantes de charbon', N'10 01 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (358, NULL, N'cendres volantes de tourbe et de bois non traité', N'10 01 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (359, NULL, N'cendres volantes et cendres sous chaudière d''hydrocarbures', N'10 01 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (360, NULL, N'déchets solides de réactions basées sur le calcium, provenant de la désulfuration des gaz de fumée', N'10 01 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (361, NULL, N'boues de réactions basées sur le calcium, provenant de la désulfuration des gaz de fumée', N'10 01 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (362, NULL, N'acide sulfurique', N'10 01 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (363, NULL, N'cendres volantes provenant d''hydrocarbures émulsifiés employés comme combustibles', N'10 01 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (364, NULL, N'mâchefers, scories et cendres sous chaudière provenant de la coïncinération contenant des substances dangereuses', N'10 01 14', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (365, NULL, N'mâchefers, scories et cendres sous chaudière provenant de la coïncinération autres que ceux visés à la rubrique 10 01 14', N'10 01 15', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (366, NULL, N'cendres volantes provenant de la coïncinération contenant des substances dangereuses', N'10 01 16', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (367, NULL, N'cendres volantes provenant de la coïncinération autres que celles visées à la rubrique 10 01 16', N'10 01 17', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (368, NULL, N'déchets provenant de l''épuration des gaz contenant des substances dangereuses', N'10 01 18', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (369, NULL, N'déchets provenant de l''épuration des gaz autres que ceux visés aux rubriques 10 01 05, 10 01 07 et 10 01 18', N'10 01 19', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (370, NULL, N'boues provenant du traitement in situ des effluents contenant des substances dangereuses', N'10 01 20', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (371, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 10 01 20', N'10 01 21', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (372, NULL, N'boues aqueuses provenant du nettoyage des chaudières contenant des substances dangereuses', N'10 01 22', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (373, NULL, N'boues aqueuses provenant du nettoyage des chaudières autres que celles visées à la rubrique 10 01 22', N'10 01 23', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (374, NULL, N'sables provenant lits fluidisés', N'10 01 24', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (375, NULL, N'déchets provenant du stockage et de la préparation des combustibles des centrales à charbon', N'10 01 25', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (376, NULL, N'déchets provenant de l''épuration des eaux de refroidissement', N'10 01 26', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (377, NULL, N'déchets non spécifiés ailleurs', N'10 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (379, NULL, N'déchets de laitiers de hauts fourneaux et d''aciéries ', N'10 02 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (380, NULL, N'laitiers non traités', N'10 02 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (381, NULL, N'déchets solides provenant de l''épuration des fumées contenant des substances dangereuses', N'10 02 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (382, NULL, N'déchets solides provenant de l''épuration des fumées autres que ceux visés à la rubrique 10 02 07', N'10 02 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (383, NULL, N'battitures de laminoir', N'10 02 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (384, NULL, N'déchets provenant de l''épuration des eaux de refroidissement contenant des hydrocarbures', N'10 02 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (385, NULL, N'déchets provenant de l''épuration des eaux de refroidissement autres que ceux visés à la rubrique 10 02 11', N'10 02 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (386, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées contenant des substances dangereuses', N'10 02 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (387, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées autres que ceux visés à la rubrique 10 02 13', N'10 02 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (388, NULL, N'autres boues et gâteaux de filtration', N'10 02 15', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (389, NULL, N'déchets non spécifiés ailleurs', N'10 02 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (391, NULL, N'déchets d''anodes', N'10 03 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (392, NULL, N'scories provenant de la production primaire', N'10 03 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (393, NULL, N'déchets d''alumine', N'10 03 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (394, NULL, N'scories salées de production secondaire', N'10 03 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (395, NULL, N'crasses noires de production secondaire', N'10 03 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (396, NULL, N'écumes inflammables ou émettant, au contact de l''eau, des gaz inflammables en quantités dangereuses', N'10 03 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (397, NULL, N'écumes autres que celles visées à la rubrique 10 03 15', N'10 03 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (398, NULL, N'déchets goudronnés provenant de la fabrication des anodes', N'10 03 17', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (399, NULL, N'déchets carbonés provenant de la fabrication des anodes autres que ceux visés à la rubrique 10 03 17', N'10 03 18', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (400, NULL, N'poussières de filtration des fumées contenant des substances dangereuses', N'10 03 19', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (401, NULL, N'poussières de filtration des fumées autres que celles visées à la rubrique 10 03 19', N'10 03 20', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (402, NULL, N'autres fines et poussières (y compris fines de broyage de crasses) contenant des substances dangereuses', N'10 03 21', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (403, NULL, N'autres fines et poussières (y compris fines de broyage de crasses) autres que celles visées à la rubrique 10 03 21', N'10 03 22', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (404, NULL, N'déchets solides provenant de l''épuration des fumées contenant des substances dangereuses', N'10 03 23', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (405, NULL, N'déchets solides provenant de l''épuration des fumées autres que ceux visés à la rubrique 10 03 23', N'10 03 24', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (406, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées contenant des substances dangereuses', N'10 03 25', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (407, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées autres que ceux visés à la rubrique 10 03 25', N'10 03 26', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (408, NULL, N'déchets provenant de l''épuration des eaux de refroidissement contenant des hydrocarbures', N'10 03 27', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (409, NULL, N'déchets provenant de l''épuration des eaux de refroidissement autres que ceux visés à la rubrique 10 03 27', N'10 03 28', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (410, NULL, N'déchets provenant du traitement des scories salées et du traitement des crasses noires contenant des substances dangereuses', N'10 03 29', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (411, NULL, N'déchets provenant du traitement des scories salées et du traitement des crasses noires autres que ceux visés à la rubrique 10 03 29', N'10 03 30', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (412, NULL, N'déchets non spécifiés ailleurs', N'10 03 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (414, NULL, N'scories provenant de la production primaire et secondaire', N'10 04 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (415, NULL, N'crasses et écumes provenant de la production primaire et secondaire', N'10 04 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (416, NULL, N'arséniate de calcium', N'10 04 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (417, NULL, N'poussières de filtration des fumées', N'10 04 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (418, NULL, N'autres fines et poussières', N'10 04 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (419, NULL, N'déchets solides provenant de l''épuration des fumées', N'10 04 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (420, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées', N'10 04 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (421, NULL, N'déchets provenant de l''épuration des eaux de refroidissement contenant des hydrocarbures', N'10 04 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (422, NULL, N'déchets provenant de l''épuration des eaux de refroidissement autres que ceux visés à la rubrique 10 04 09', N'10 04 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (423, NULL, N'déchets non spécifiés ailleurs', N'10 04 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (425, NULL, N'scories provenant de la production primaire et secondaire', N'10 05 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (426, NULL, N'poussières de filtration des fumées', N'10 05 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (427, NULL, N'autres fines et poussières', N'10 05 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (428, NULL, N'déchets solides provenant de l''épuration des fumées', N'10 05 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (429, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées', N'10 05 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (430, NULL, N'déchets provenant de l''épuration des eaux de refroidissement contenant des hydrocarbures', N'10 05 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (431, NULL, N'déchets provenant de l''épuration des eaux de refroidissement autres que ceux visés à la rubrique 10 05 08', N'10 05 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (432, NULL, N'crasses et écumes inflammables ou émettant, au contact de l''eau, des gaz inflammables en quantités dangereuses', N'10 05 10 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (433, NULL, N'crasses et écumes autres que celles visées à la rubrique 10 05 10', N'10 05 11', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (434, NULL, N'déchets non spécifiés ailleurs', N'10 05 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (436, NULL, N'scories provenant de la production primaire et secondaire', N'10 06 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (437, NULL, N'crasses et écumes provenant de la production primaire et secondaire', N'10 06 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (438, NULL, N'poussières de filtration des fumées', N'10 06 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (439, NULL, N'autres fines et poussières', N'10 06 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (440, NULL, N'déchets solides provenant de l''épuration des fumées', N'10 06 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (441, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées ', N'10 06 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (442, NULL, N'déchets provenant de l''épuration des eaux de refroidissement contenant des hydrocarbures', N'10 06 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (443, NULL, N'déchets provenant de l''épuration des eaux de refroidissement autres que ceux visés à la rubrique 10 06 09', N'10 06 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (444, NULL, N'déchets non spécifiés ailleurs', N'10 06 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (446, NULL, N'scories provenant de la production primaire et secondaire', N'10 07 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (447, NULL, N'crasses et écumes provenant de la production primaire et secondaire', N'10 07 02 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (448, NULL, N'déchets solides provenant de l''épuration des fumées', N'10 07 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (449, NULL, N'autres fines et poussières', N'10 07 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (450, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées', N'10 07 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (451, NULL, N'déchets provenant de l''épuration des eaux de refroidissement contenant des hydrocarbures', N'10 07 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (452, NULL, N'déchets provenant de l''épuration des eaux de refroidissement autres que ceux visés à la rubrique 10 07 07', N'10 07 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (453, NULL, N'déchets non spécifiés ailleurs', N'10 07 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (455, NULL, N'fines et poussières', N'10 08 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (456, NULL, N'scories salées provenant de la production primaire et secondaire ', N'10 08 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (457, NULL, N'autres scories', N'10 08 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (458, NULL, N'crasses et écumes inflammables ou émettant, au contact de l''eau, des gaz inflammables en quantités dangereuses ', N'10 08 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (459, NULL, N'crasses et écumes autres que celles visées à la rubrique 10 08 10', N'10 08 11', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (460, NULL, N'déchets goudronnés provenant de la fabrication des anodes', N'10 08 12', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (461, NULL, N'déchets carbonés provenant de la fabrication des anodes autres que ceux visés à la rubrique 10 08 12', N'10 08 13', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (462, NULL, N'déchets d''anodes', N'10 08 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (463, NULL, N'poussières de filtration des fumées contenant des substances dangereuses', N'10 08 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (464, NULL, N'poussières de filtration des fumées autres que celles visées à la rubrique 10 08 15', N'10 08 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (465, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées contenant des substances dangereuses', N'10 08 17', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (466, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées autres que ceux visés à la rubrique 10 08 17', N'10 08 18', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (467, NULL, N'déchets provenant de l''épuration des eaux de refroidissement contenant des hydrocarbures ', N'10 08 19', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (468, NULL, N'déchets provenant de l''épuration des eaux de refroidissement autres que ceux visés à la rubrique 10 08 19', N'10 08 20', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (469, NULL, N'déchets non spécifiés ailleurs', N'10 08 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (471, NULL, N'laitiers de four de fonderie', N'10 09 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (472, NULL, N'noyaux et moules de fonderie n''ayant pas subi la coulée contenant des substances dangereuses', N'10 09 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (473, NULL, N'noyaux et moules de fonderie n''ayant pas subi la coulée autres que ceux visés à la rubrique 10 09 05', N'10 09 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (474, NULL, N'noyaux et moules de fonderie ayant subi la coulée contenant des substances dangereuses', N'10 09 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (475, NULL, N'noyaux et moules de fonderie ayant subi la coulée autres que ceux visés à la rubrique 10 09 07', N'10 09 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (476, NULL, N'poussières de filtration des fumées contenant des substances dangereuses', N'10 09 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (477, NULL, N'poussières de filtration des fumées autres que celles visées à la rubrique 10 09 09', N'10 09 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (478, NULL, N'autres fines contenant des substances dangereuses', N'10 09 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (479, NULL, N'autres fines non visées à la rubrique 10 09 11', N'10 09 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (480, NULL, N'déchets de liants contenant des substances dangereuses', N'10 09 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (481, NULL, N'déchets de liants autres que ceux visés à la rubrique 10 09 13 ', N'10 09 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (482, NULL, N'révélateur de criques usagé contenant des substances dangereuses', N'10 09 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (483, NULL, N'révélateur de criques usagé autre que celui visé à la rubrique 10 09 15', N'10 09 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (484, NULL, N'déchets non spécifiés ailleurs', N'10 09 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (486, NULL, N'laitiers de four de fonderie', N'10 10 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (487, NULL, N'noyaux et moules de fonderie n''ayant pas subi la coulée contenant des substances dangereuses', N'10 10 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (488, NULL, N'noyaux et moules de fonderie n''ayant pas subi la coulée autres que ceux visés à la rubrique 10 10 05', N'10 10 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (489, NULL, N'noyaux et moules de fonderie ayant subi la coulée contenant des substances dangereuses ', N'10 10 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (490, NULL, N'noyaux et moules de fonderie ayant subi la coulée autres que ceux visés à la rubrique 10 10 07', N'10 10 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (491, NULL, N'poussières de filtration des fumées contenant des substances dangereuses', N'10 10 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (492, NULL, N'poussières de filtration des fumées autres que celles visées à la rubrique 10 10 09', N'10 10 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (493, NULL, N'autres fines contenant des substances dangereuses', N'10 10 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (494, NULL, N'autres fines non visées à la rubrique 10 10 11', N'10 10 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (495, NULL, N'déchets de liants contenant des substances dangereuses', N'10 10 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (496, NULL, N'déchets de liants autres que ceux visés à la rubrique 10 10 13', N'10 10 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (497, NULL, N'révélateur de criques usagé contenant des substances dangereuses', N'10 10 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (498, NULL, N'révélateur de criques usagé autre que celui visé à la rubrique 10 10 15', N'10 10 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (499, NULL, N'déchets non spécifiés ailleurs', N'10 10 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (501, NULL, N'déchets de matériaux à base de fibre de verre ', N'10 11 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (502, NULL, N'fines et poussières', N'10 11 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (503, NULL, N'déchets de préparation avant cuisson contenant des substances dangereuses', N'10 11 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (504, NULL, N'déchets de préparation avant cuisson autres que ceux visés à la rubrique 10 11 09', N'10 11 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (505, NULL, N'petites particules de déchets de verre et poudre de verre contenant des métaux lourds (par exemple, tubes cathodiques)', N'10 11 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (506, NULL, N'déchets de verre autres que ceux visés à la rubrique 10 11 11', N'10 11 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (507, NULL, N'boues de polissage et de meulage du verre contenant des substances dangereuses ', N'10 11 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (508, NULL, N'boues de polissage et de meulage du verre autres que celles visées à la rubrique 10 11 13', N'10 11 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (509, NULL, N'déchets solides provenant de l''épuration des fumées contenant des substances dangereuses', N'10 11 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (510, NULL, N'déchets solides provenant de l''épuration des fumées autres que ceux visés à la rubrique 10 11 15', N'10 11 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (511, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées contenant des substances dangereuses ', N'10 11 17', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (512, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées autres que ceux visés à la rubrique 10 11 17', N'10 11 18', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (513, NULL, N'déchets solides provenant du traitement in situ des effluents contenant des substances dangereuses ', N'10 11 19', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (514, NULL, N'déchets solides provenant du traitement in situ des effluents autres que ceux visés à la rubrique 10 11 19', N'10 11 20', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (515, NULL, N'déchets non spécifiés ailleurs', N'10 11 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (517, NULL, N'déchets de préparation avant cuisson', N'10 12 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (518, NULL, N'fines et poussières', N'10 12 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (519, NULL, N'boues et gâteaux de filtration provenant de l''épuration des fumées', N'10 12 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (520, NULL, N'moules déclassés', N'10 12 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (521, NULL, N'déchets de produits en céramique, briques, carrelage et matériaux de construction (après cuisson)', N'10 12 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (522, NULL, N'déchets solides provenant de l''épuration des fumées contenant des substances dangereuses ', N'10 12 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (523, NULL, N'déchets solides provenant de l''épuration des fumées autres que ceux visés à la rubrique 10 12 09', N'10 12 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (524, NULL, N'déchets de glaçure contenant des métaux lourds ', N'10 12 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (525, NULL, N'déchets de glaçure autres que ceux visés à la rubrique 10 12 11', N'10 12 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (526, NULL, N'boues provenant du traitement in situ des effluents', N'10 12 13', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (527, NULL, N'déchets non spécifiés ailleurs', N'10 12 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (529, NULL, N'déchets de préparation avant cuisson', N'10 13 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (530, NULL, N'déchets de calcination et d''hydratation de la chaux', N'10 13 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (531, NULL, N'fines et poussières (sauf rubriques 10 13 12 et 10 13 13)', N'10 13 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (532, NULL, N'Boues et gâteaux de filtration provenant de l''épuration des fumées', N'10 13 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (533, NULL, N'déchets provenant de la fabrication d''amiante-ciment contenant de l''amiante', N'10 13 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (534, NULL, N'déchets provenant de la fabrication d''amiante-ciment autres que ceux visés à la rubrique 10 13 09', N'10 13 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (535, NULL, N'déchets provenant de la fabrication de matériaux composites à base de ciment autres que ceux visés aux rubriques 10 13 09 et 10 13 10', N'10 13 11', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (536, NULL, N'déchets solides provenant de l''épuration des fumées contenant des substances dangereuses ', N'10 13 12', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (537, NULL, N'déchets solides provenant de l''épuration des fumées autres que ceux visés à la rubrique 10 13 12', N'10 13 13', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (538, NULL, N'déchets et boues de béton', N'10 13 14 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (539, NULL, N'déchets non spécifiés ailleurs', N'10 13 99 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (541, NULL, N'déchets provenant de l''épuration des fumées contenant du mercure ', N'10 14 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (544, NULL, N'acides de décapage', N'11 01 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (545, NULL, N'acides non spécifiés ailleurs', N'11 01 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (546, NULL, N'bases de décapage', N'11 01 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (547, NULL, N'boues de phosphatation', N'11 01 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (548, NULL, N'boues et gâteaux de filtration contenant des substances dangereuses ', N'11 01 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (549, NULL, N'boues et gâteaux de filtration autres que ceux visés à la rubrique 11 01 09', N'11 01 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (550, NULL, N'liquides aqueux de rinçage contenant des substances dangereuses ', N'11 01 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (551, NULL, N'liquides aqueux de rinçage autres que ceux visés à la rubrique 11 01 11', N'11 01 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (552, NULL, N'déchets de dégraissage contenant des substances dangereuses', N'11 01 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (553, NULL, N'déchets de dégraissage autres que ceux visés, à la rubrique 11 01 13', N'11 01 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (554, NULL, N'éluats et boues provenant des systèmes à membrane et des systèmes d''échange d''ions contenant des substances dangereuses', N'11 01 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (555, NULL, N'résines échangeuses d''ions saturées ou usées', N'11 01 16', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (556, NULL, N'autres déchets contenant des substances dangereuses', N'11 01 98', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (557, NULL, N'déchets non spécifiés ailleurs', N'11 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (559, NULL, N'boues provenant de l''hydrométallurgies du zinc (y compris jarosite et goethite)', N'11 02 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (560, NULL, N'déchets provenant de la production d''anodes pour les procédés d''électrolyse aqueuse', N'11 02 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (561, NULL, N'déchets provenant des procédés hydrométallurgiques du cuivre contenant des substances dangereuses ', N'11 02 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (562, NULL, N'déchets provenant des procédés hydrométallurgiques du cuivre autres que ceux visés à la rubrique 11 02 05', N'11 02 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (563, NULL, N'autres déchets contenant des substances dangereuses ', N'11 02 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (564, NULL, N'déchets non spécifiés ailleurs', N'11 02 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (566, NULL, N'déchets cyanurés', N'11 03 01 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (567, NULL, N'autres déchets', N'11 03 02 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (569, NULL, N'mattes', N'11 05 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (570, NULL, N'cendres de zinc ', N'11 05 02 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (571, NULL, N'déchets solides provenant de l''épuration des fumées', N'11 05 03 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (572, NULL, N'flux utilisé', N'11 05 04 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (573, NULL, N'déchets non spécifiés ailleurs', N'11 05 09 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (576, NULL, N'limaille et chutes de métaux ferreux', N'12 01 01 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (577, NULL, N'fines et poussières de métaux ferreux', N'12 01 02 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (578, NULL, N'limailles et chutes de métaux non ferreux', N'12 01 03 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (579, NULL, N'fines et poussières de métaux non ferreux', N'12 01 04 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (580, NULL, N'particules de matières plastiques d''ébarbage et de tournage', N'12 01 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (581, NULL, N'huiles d''usinage à base minérale contenant des halogènes (pas sous forme d''émulsion) ', N'12 01 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (582, NULL, N'huiles d''usinage à base minérale sans halogènes (pas sous forme d''émulsion ou de solutions) ', N'12 01 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (583, NULL, N'émulsions et solutions d''usinage contenant des halogènes ', N'12 01 08 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (584, NULL, N'émulsions et solutions d''usinage sans halogènes', N'12 01 09 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (585, NULL, N'huiles d''usinage de synthèse', N'12 01 10 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (586, NULL, N'déchets de cires et graisses', N'12 01 12 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (587, NULL, N'Déchets de soudure', N'12 01 13 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (588, NULL, N'boues d''usinage contenant des substances dangereuses', N'12 01 14 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (589, NULL, N'boues d''usinage autres que celles visées à la rubrique 12 01 14', N'12 01 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (590, NULL, N'déchets de grenaillage contenant des substances dangereuses', N'12 01 16 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (591, NULL, N'déchets de grenaillage autres que ceux visés à la rubrique 12 01 16', N'12 01 17', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (592, NULL, N'boues métalliques (provenant du meulage et de l''affûtage) contenant des hydrocarbures ', N'12 01 18', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (593, NULL, N'huiles d''usinage facilement biodégradables', N'12 01 19 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (594, NULL, N'déchets de meulage et matériaux de meulage contenant des substances dangereuses ', N'12 01 20', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (595, NULL, N'déchets de meulage et matériaux de meulage autres que ceux visés à la rubrique 12 01 20', N'12 01 21', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (596, NULL, N'déchets non spécifiés ailleurs', N'12 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (598, NULL, N'liquides aqueux de nettoyage', N'12 03 01 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (599, NULL, N'déchets du dégraissage à la vapeur', N'12 03 02 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (602, NULL, N'huiles hydrauliques contenant des PCB (1)', N'13 01 01 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (603, NULL, N'autres huiles hydrauliques chlorées (émulsions)', N'13 01 04 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (604, NULL, N'huiles hydrauliques non chlorées (émulsions)', N'13 01 05 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (606, NULL, N'huiles hydrauliques chlorées à base minérale', N'13 01 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (607, NULL, N'huiles hydrauliques non chlorées à base minérale', N'13 01 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (608, NULL, N'huiles hydrauliques synthétiques', N'13 01 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (609, NULL, N'huiles hydrauliques facilement biodégradables', N'13 01 12', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (610, NULL, N'autres huiles hydrauliques', N'13 01 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (612, NULL, N'huiles moteur, de boîte de vitesses et de lubrification chlorées à base minérale', N'13 02 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (613, NULL, N'huiles moteur, de boîte de vitesses et de lubrification non chlorées à base minérale ', N'13 02 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (614, NULL, N'huiles moteur, de boîte de vitesses et de lubrification synthétiques', N'13 02 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (615, NULL, N'huiles moteur, de boîte de vitesses et de lubrification facilement biodégradables ', N'13 02 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (616, NULL, N'autres huiles moteur, de boîte de vitesses et de lubrification', N'13 02 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (618, NULL, N'huiles isolantes et fluides caloporteurs contenant des PCB', N'13 03 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (619, NULL, N'huiles isolantes et fluides caloporteurs chlorés à base minérale autres que ceux visés à la rubrique 13 03 01', N'13 03 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (620, NULL, N'huiles isolantes et fluides caloporteurs non chlorés à base minérale ', N'13 03 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (621, NULL, N'huiles isolantes et fluides caloporteurs synthétiques', N'13 03 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (622, NULL, N'huiles isolantes et fluides caloporteurs facilement biodégradables', N'13 03 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (623, NULL, N'autres huiles isolantes et fluides caloporteurs', N'13 03 10 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (625, NULL, N'hydrocarbures de fond de cale provenant de navigation fluviale', N'13 04 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (626, NULL, N'hydrocarbures de fond de cale provenant de canalisations de môles ', N'13 04 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (627, NULL, N'hydrocarbures de fond de cale provenant d''un autre type de navigation ', N'13 04 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (629, NULL, N'déchets solides provenant de dessableurs et de séparateurs eau-hydrocarbures ', N'13 05 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (630, NULL, N'boues provenant de séparateurs eau/hydrocarbures', N'13 05 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (631, NULL, N'boues provenant de déshuileurs', N'13 05 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (632, NULL, N'hydrocarbures provenant de séparateurs eau/hydrocarbures', N'13 05 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (633, NULL, N'eau mélangée à des hydrocarbures provenant de séparateurs eau/hydrocarbures', N'13 05 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (634, NULL, N'mélanges de déchets provenant de dessableurs et de séparateurs eau/hydrocarbures', N'13 05 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (636, NULL, N'fuel oil et diesel', N'13 07 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (637, NULL, N'essence', N'13 07 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (638, NULL, N'autres combustibles (y compris mélanges)', N'13 07 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (640, NULL, N'boues ou émulsions de dessalage', N'13 08 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (641, NULL, N'autres émulsions', N'13 08 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (642, NULL, N'déchets non spécifiés ailleurs', N'13 08 99', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (645, NULL, N'chlorofluorocarbones, HCFC, HFC', N'14 06 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (646, NULL, N'autres solvants et mélanges de solvants halogénés', N'14 06 02 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (647, NULL, N'autres solvants et mélanges de solvants ', N'14 06 03 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (648, NULL, N'boues ou déchets solides contenant des solvants halogénés', N'14 06 04 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (649, NULL, N'boues ou déchets solides contenant d''autres solvants', N'14 06 05 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (652, NULL, N'emballages en papier/carton', N'15 01 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (653, NULL, N'emballages en matières plastiques', N'15 01 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (654, NULL, N'emballages en bois', N'15 01 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (655, NULL, N'emballages métalliques', N'15 01 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (656, NULL, N'emballages composites', N'15 01 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (657, NULL, N'emballages en mélange', N'15 01 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (658, NULL, N'emballages en verre', N'15 01 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (659, NULL, N'emballages textiles', N'15 01 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (660, NULL, N'emballages contenant des résidus de substances dangereuses ou contaminés par de tels résidus', N'15 01 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (661, NULL, N'emballages métalliques contenant une matrice poreuse solide dangereuse (par exemple, amiante), y compris des conteneurs à pression vides', N'15 01 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (663, NULL, N'absorbants, matériaux filtrants (y compris les filtres à huile non spécifiés ailleurs), chiffons d''essuyage et vêtements de protection contaminés par des substances dangereuses', N'15 02 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (664, NULL, N'absorbants, matériaux filtrants, chiffons d''essuyage et vêtements de protection autres que ceux visés à la rubrique 15 02 02', N'15 02 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (667, NULL, N'pneus hors d''usage', N'16 01 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (668, NULL, N'véhicules hors d''usage', N'16 01 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (669, NULL, N'véhicules hors d''usage ne contenant ni liquides ni autres composants dangereux', N'16 01 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (670, NULL, N'filtres à huile ', N'16 01 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (671, NULL, N'composants contenant du mercure ', N'16 01 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (672, NULL, N'composants contenant des PCB', N'16 01 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (673, NULL, N'composants explosifs (par exemple, coussins gonflables de sécurité)', N'16 01 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (674, NULL, N'patins de freins contenant de l''amiante', N'16 01 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (675, NULL, N'patins de freins autres que ceux visés à la rubrique 16 01 11', N'16 01 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (676, NULL, N'liquides de freins', N'16 01 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (677, NULL, N'antigels contenant des substances dangereuses', N'16 01 14', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (678, NULL, N'antigels autres que ceux visés à la rubrique 16 01 14', N'16 01 15', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (679, NULL, N'réservoirs de gaz liquéfié', N'16 01 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (680, NULL, N'métaux ferreux', N'16 01 17', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (681, NULL, N'métaux non ferreux', N'16 01 18', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (682, NULL, N'matières plastiques', N'16 01 19', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (683, NULL, N'Verre', N'16 01 20', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (684, NULL, N'composants dangereux autres que ceux visés aux rubriques 16 01 07 à 16 01 11, 16 01 13 et 16 01 14', N'16 01 21', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (685, NULL, N'composants non spécifiés ailleurs', N'16 01 22', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (686, NULL, N'déchets non spécifiés ailleurs', N'16 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (688, NULL, N'transformateurs et accumulateurs contenant des PCB', N'16 02 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (689, NULL, N'équipements mis au rebut contenant des PCB ou contaminés par de telles substances autres que ceux visés à la rubrique 16 02 09', N'16 02 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (690, NULL, N'équipements mis au rebut contenant des chlorofluorocarbones, des HCFC ou des HFC', N'16 02 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (691, NULL, N'équipements mis au rebut contenant de l''amiante libre', N'16 02 12', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (692, NULL, N'équipements mis au rebut contenant des composants dangereux (1) autres que ceux visés aux rubriques 16 02 09 à 16 02 12', N'16 02 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (693, NULL, N'équipements mis au rebut autres que ceux visés aux rubriques 16 02 09 à 16 02 13', N'16 02 14 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (694, NULL, N'composants dangereux retirés des équipements mis au rebut', N'16 02 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (695, NULL, N'composants retirés des équipements mis au rebut autres que ceux visés à la rubrique 16 02 15', N'16 02 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (697, NULL, N'déchets d''origine minérale contenant des substances dangereuses', N'16 03 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (698, NULL, N'déchets d''origine minérale autres que ceux visés à la rubrique 16 03 03', N'16 03 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (699, NULL, N'déchets d''origine organique contenant des substances dangereuses', N'16 03 05 ', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (700, NULL, N'déchets d''origine organique autres que ceux visés à la rubrique 16 03 05', N'16 03 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (702, NULL, N'déchets de munitions', N'16 04 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (703, NULL, N'déchets de feux d''artifice', N'16 04 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (704, NULL, N'autres déchets d''explosifs', N'16 04 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (706, NULL, N'gaz en récipients à pression (y compris les halons) contenant des substances dangereuses', N'16 05 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (707, NULL, N'gaz en récipients à pression autres que ceux visés à la rubrique 16 05 04 ', N'16 05 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (708, NULL, N'produits chimiques de laboratoire à base de ou contenant des substances dangereuses, y compris les mélanges de produits chimiques de laboratoire', N'16 05 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (709, NULL, N'produits chimiques d''origine minérale à base de ou contenant des substances dangereuses, mis au rebut', N'16 05 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (710, NULL, N'produits chimiques d''origine organique à base de ou contenant des substances dangereuses, mis au rebut', N'16 05 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (711, NULL, N'produits chimiques mis au rebut autres que ceux visés aux rubriques 16 05 06, 16 05 07 ou 16 05 08', N'16 05 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (713, NULL, N'accumulateurs au plomb', N'16 06 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (714, NULL, N'accumulateurs Ni-Cd', N'16 06 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (715, NULL, N'piles contenant du mercure', N'16 06 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (716, NULL, N'piles alcalines (sauf rubrique 16 06 03)', N'16 06 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (717, NULL, N'autres piles et accumulateurs', N'16 06 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (718, NULL, N'électrolyte de piles et accumulateurs collectés séparément', N'16 06 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (720, NULL, N'déchets contenant des hydrocarbures', N'16 07 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (721, NULL, N'déchets contenant d''autres substances dangereuses', N'16 07 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (722, NULL, N'déchets non spécifiés ailleurs', N'16 07 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (724, NULL, N'catalyseurs usés contenant de l''or, de l''argent, du rhénium, du rhodium, du palladium, de l''iridium ou du platine (sauf rubrique 16 08 07)', N'16 08 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (725, NULL, N'catalyseurs usés contenant des métaux ou composés de métaux de transition (2) dangereux', N'16 08 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (726, NULL, N'catalyseurs usés contenant des métaux ou composés de métaux de transition non spécifiés ailleurs', N'16 08 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (727, NULL, N'catalyseurs usés de craquage catalytique sur lit fluide (sauf rubrique 16 08 07)', N'16 08 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (728, NULL, N'catalyseurs usés contenant de l''acide phosphorique', N'16 08 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (729, NULL, N'liquides usés employés comme catalyseurs', N'16 08 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (730, NULL, N'catalyseurs usés contaminés par des substances dangereuses', N'16 08 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (732, NULL, N'permanganates, par exemple, permanganate de potassium', N'16 09 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (733, NULL, N'chromates, par exemple, chromate de potassium, dichromate de sodium ou de potassium', N'16 09 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (734, NULL, N'peroxydes, par exemple, peroxyde d''hydrogène', N'16 09 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (735, NULL, N'substances oxydantes non spécifiées ailleurs', N'16 09 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (737, NULL, N'déchets liquides aqueux contenant des substances dangereuses ', N'16 10 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (738, NULL, N'déchets liquides aqueux autres que ceux visés à la rubrique 16 10 01', N'16 10 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (739, NULL, N'concentrés aqueux contenant des substances dangereuses', N'16 10 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (740, NULL, N'concentrés aqueux autres que ceux visés à la rubrique 16 10 03', N'16 10 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (742, NULL, N'revêtements de fours et réfractaires à base de carbone provenant de procédés métallurgiques contenant des substances dangereuses', N'16 11 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (743, NULL, N'revêtements de fours et réfractaires à base de carbone provenant de procédés métallurgiques autres que ceux visés à la rubrique 16 11 01', N'16 11 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (744, NULL, N'autres revêtements de fours et réfractaires provenant de procédés métallurgiques contenant des substances dangereuses', N'16 11 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (745, NULL, N'autres revêtements de fours et réfractaires provenant de procédés métallurgiques non visés à la rubrique 16 11 03', N'16 11 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (746, NULL, N'revêtements de fours et réfractaires provenant de procédés non métallurgiques contenant des substances dangereuses', N'16 11 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (747, NULL, N'revêtements de fours et réfractaires provenant de procédés non métallurgiques autres que ceux visés à la rubrique 16 11 05', N'16 11 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (750, NULL, N'béton', N'17 01 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (751, NULL, N'briques', N'17 01 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (752, NULL, N'tuiles et céramiques', N'17 01 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (753, NULL, N'mélanges ou fractions séparées de béton, brique, tuiles et céramiques contenant des substances dangereuses', N'17 01 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (754, NULL, N'mélanges de béton, briques, tuiles et céramiques autres que ceux visés à la rubrique 17 01 06', N'17 01 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (756, NULL, N'bois', N'17 02 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (757, NULL, N'verre', N'17 02 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (758, NULL, N'matières plastiques', N'17 02 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (759, NULL, N'bois, verre et matières plastiques contenant des substances dangereuses ou contaminés par de telles substances', N'17 02 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (761, NULL, N'mélanges bitumineux contenant du goudron', N'17 03 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (762, NULL, N'mélanges bitumineux autres que ceux visés à la rubrique 17 03 01', N'17 03 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (763, NULL, N'goudron et produits goudronnés', N'17 03 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (765, NULL, N'cuivre, bonze, laiton', N'17 04 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (766, NULL, N'aluminium', N'17 04 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (767, NULL, N'plomb', N'17 04 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (768, NULL, N'zinc', N'17 04 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (769, NULL, N'fer et acier', N'17 04 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (770, NULL, N'étain', N'17 04 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (771, NULL, N'métaux en mélange ', N'17 04 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (772, NULL, N'déchets métalliques contaminés par des substances dangereuses ', N'17 04 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (773, NULL, N'câbles contenant des hydrocarbures, du goudron ou d''autres substances dangereuses', N'17 04 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (774, NULL, N'câbles autres que ceux visés à la rubrique 17 04 10', N'17 04 11', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (776, NULL, N'terres et cailloux contenant des substances dangereuses', N'17 05 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (777, NULL, N'terres et cailloux autres que ceux visés à la rubrique 17 05 03', N'17 05 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (778, NULL, N'boues de dragage contenant des substances dangereuses', N'17 05 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (779, NULL, N'boues de dragage autres que celles visées à la rubrique 17 05 05', N'17 05 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (780, NULL, N'ballast de voie contenant des substances dangereuses ', N'17 05 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (781, NULL, N'ballast de voie autre que celui visé à la rubrique 17 05 07', N'17 05 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (783, NULL, N'matériaux d''isolation contenant de l''amiante ', N'17 06 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (784, NULL, N'autres matériaux d''isolation à base de ou contenant des substances dangereuses', N'17 06 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (785, NULL, N'matériaux d''isolation autres que ceux visés aux rubriques 17 06 01 et 17 06 03', N'17 06 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (786, NULL, N'matériaux de construction contenant de l''amiante', N'17 06 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (788, NULL, N'matériaux de construction à base de gypse contaminés par des substances dangereuses', N'17 08 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (789, NULL, N'matériaux de construction à base de gypse autres que ceux visés à la rubrique 17 08 01', N'17 08 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (791, NULL, N'déchets de construction et de démolition contenant du mercure', N'17 09 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (792, NULL, N'déchets de construction et de démolition contenant des PCB (par exemple, mastics, sols à base de résines, double vitrage, condensateurs, contenant des PCB)', N'17 09 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (793, NULL, N'autres déchets de construction et de démolition (y compris en mélange) contenant des substances dangereuses', N'17 09 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (794, NULL, N'déchets de construction et de démolition en mélange autres que ceux visés aux rubriques 17 09 01, 17 09 02 et 17 09 03', N'17 09 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (797, NULL, N'objets piquants et coupants (sauf rubrique 18 01 03)', N'18 01 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (798, NULL, N'déchets anatomiques et organique, y compris sacs de sang et réserves de sang (sauf rubrique 18 01 03)', N'18 01 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (799, NULL, N'autres déchets dont la collecte et l''élimination font l''objet des prescriptions particulières vis-à-vis des risques d''infection ', N'18 01 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (800, NULL, N'déchets dont la collecte et l''élimination ne font pas l''objet de prescriptions particulières vis-à-vis des risques d''infection (par exemple vêtements, plâtres, draps, vêtements jetables, langes)', N'18 01 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (801, NULL, N'produits chimiques à base de ou contenant des substances dangereuses', N'18 01 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (802, NULL, N'produits chimiques autres que ceux visés à la rubrique 18 01 06', N'18 01 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (803, NULL, N'médicaments cytotoxiques et cytostatiques ', N'18 01 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (804, NULL, N'médicaments autres que ceux visés à la rubrique 18 01 08 ', N'18 01 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (805, NULL, N'déchets d''amalgame dentaire', N'18 01 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (807, NULL, N'objets piquants et coupants (sauf rubrique 18 02 02)', N'18 02 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (808, NULL, N'déchets dont la collecte et l''élimination font l''objet de des prescriptions particulières vis-à-vis des risques d''infection', N'18 02 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (809, NULL, N'déchets dont la collecte et l''élimination ne font pas l''objet de prescriptions particulières vis-à-vis des risques d''infection', N'18 02 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (810, NULL, N'produits chimiques à base de ou contenant des substances dangereuses', N'18 02 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (811, NULL, N'produits chimiques autres que ceux visés à la rubrique 18 02 05', N'18 02 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (812, NULL, N'médicaments cytotoxiques et cytostatiques ', N'18 02 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (813, NULL, N'médicaments autres que ceux visés à la rubrique 18 02 07', N'18 02 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (816, NULL, N'déchets de déferraillage des mâchefers', N'19 01 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (817, NULL, N'gâteau de filtration provenant de l''épuration des fumées', N'19 01 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (818, NULL, N'déchets liquides aqueux de l''épuration des fumées et autres déchets liquides aqueux', N'19 01 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (819, NULL, N'déchets secs de l''épuration des fumées', N'19 01 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (820, NULL, N'charbon actif usé provenant de l''épuration des gaz de fumées', N'19 01 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (821, NULL, N'mâchefers contenant des substances dangereuses', N'19 01 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (822, NULL, N'mâchefers autres que ceux visés à la rubrique 19 01 11', N'19 01 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (823, NULL, N'cendres volantes contenant des substances dangereuses', N'19 01 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (824, NULL, N'cendres volantes autres que celles visées à la rubrique 19 01 13', N'19 01 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (825, NULL, N'cendres sous chaudière contenant des substances dangereuses', N'19 01 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (826, NULL, N'cendres sous chaudière autres que celles visées à la rubrique 19 01 15', N'19 01 16', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (827, NULL, N'déchets de pyrolyse contenant des substances dangereuses', N'19 01 17', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (828, NULL, N'déchets de pyrolyse autres que ceux visés à la rubrique 19 01 17', N'19 01 18', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (829, NULL, N'sables provenant de lits fluidisés', N'19 01 19', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (830, NULL, N'déchets non spécifiés ailleurs ', N'19 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (832, NULL, N'déchets prémélangés composés seulement de déchets non dangereux', N'19 02 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (833, NULL, N'déchets prémélangés contenant au moins un déchet dangereux', N'19 02 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (834, NULL, N'boues provenant des traitements physico-chimiques contenant des substances dangereuses', N'19 02 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (835, NULL, N'boues provenant des traitements physico-chimiques autres que celles visées à la rubrique 19 02 05', N'19 02 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (836, NULL, N'hydrocarbures et concentrés provenant d''une séparation', N'19 02 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (837, NULL, N'déchets combustibles liquides contenant des substances dangereuses', N'19 02 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (838, NULL, N'déchets combustibles solides contenant des substances dangereuses', N'19 02 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (839, NULL, N'déchets combustibles autres que ceux visés aux rubriques 19 02 08 et 19 02 09', N'19 02 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (840, NULL, N'autres déchets contenant des substances dangereuses', N'19 02 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (841, NULL, N'déchets non spécifiés ailleurs', N'19 02 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (843, NULL, N'déchets catalogués comme dangereux, partiellement (4) stabilisés', N'19 03 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (844, NULL, N'déchets stabilisés autres que ceux visés à la rubrique 19 03 04', N'19 03 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (845, NULL, N'déchets catalogués comme dangereux, solidifiés', N'19 03 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (846, NULL, N'déchets solidifiés autres que ceux visés à la rubrique 19 03 06', N'19 03 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (848, NULL, N'déchets vitrifiés', N'19 04 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (849, NULL, N'cendres volantes et autres déchets de traitement des gaz de fumée', N'19 04 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (850, NULL, N'phase solide non vitrifiée', N'19 04 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (851, NULL, N'déchets liquides aqueux provenant de la tempe des déchets vitrifiés', N'19 04 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (853, NULL, N'fraction non compostée des déchets municipaux et assimilés', N'19 05 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (854, NULL, N'fraction non compostée des déchets animaux et végétaux', N'19 05 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (855, NULL, N'compost déclassé', N'19 05 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (856, NULL, N'déchets non spécifiés ailleurs', N'19 05 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (858, NULL, N'liqueurs provenant du traitement anaérobie des déchets municipaux', N'19 06 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (859, NULL, N'digestats provenant du traitement anaérobie des déchets municipaux ', N'19 06 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (860, NULL, N'liqueurs provenant du traitement anaérobie des déchets animaux et végétaux', N'19 06 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (861, NULL, N'digestats provenant du traitement anaérobie des déchets animaux et végétaux', N'19 06 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (862, NULL, N'déchets non spécifiés ailleurs', N'19 06 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (864, NULL, N'lixiviats de décharges contenant des substances dangereuses', N'19 07 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (865, NULL, N'lixiviats de décharges autres que ceux visés à la rubrique 19 07 02', N'19 07 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (867, NULL, N'déchets de dégrillage', N'19 08 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (868, NULL, N'déchets de dessablage', N'19 08 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (869, NULL, N'boues provenant du traitement des eaux usées urbaines', N'19 08 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (870, NULL, N'résines échangeuses d''ions saturées ou usées', N'19 08 06', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (871, NULL, N'solutions et boues provenant de la régénération des échangeurs d''ions', N'19 08 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (872, NULL, N'déchets provenant des systèmes à membrane contenant des métaux lourds', N'19 08 08', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (873, NULL, N'mélanges de graisse et d''huile provenant de la séparation huile/eaux usées contenant des huiles et graisses alimentaires', N'19 08 09', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (874, NULL, N'mélanges de graisse et d''huile provenant de la séparation huile/eaux usées autres que ceux visés à la rubrique 19 08 09', N'19 08 10', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (875, NULL, N'boues contenant des substances dangereuses provenant du traitement biologique des eaux usées industrielles', N'19 08 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (876, NULL, N'boues provenant du traitement biologique des eaux usées industrielles autres que celles visées à la rubrique 19 08 11', N'19 08 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (877, NULL, N'boues contenant des substances dangereuses provenant d''autres traitements des eaux usées industrielles', N'19 08 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (878, NULL, N'boues provenant d''autres traitements des eaux usées industrielles autres que celles visées à la rubrique 19 08 13', N'19 08 14', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (879, NULL, N'déchets non spécifiés ailleurs', N'19 08 99 ', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (881, NULL, N'déchets solides de première filtration et de dégrillage', N'19 09 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (882, NULL, N'boues de clarifications d''eau', N'19 09 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (883, NULL, N'boues de décarbonatation', N'19 09 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (884, NULL, N'charbon actif usé', N'19 09 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (885, NULL, N'résines échangeuses d''ions saturées ou usées', N'19 09 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (886, NULL, N'solutions et boues provenant de la régénération des échangeuses d''ions', N'19 09 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (887, NULL, N'déchets non spécifiés ailleurs', N'19 09 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (889, NULL, N'déchets de fer ou d''acier', N'19 10 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (890, NULL, N'déchets de métaux non ferreux', N'19 10 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (891, NULL, N'fraction légère des résidus de broyage et poussières contenant des substances dangereuses', N'19 10 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (892, NULL, N'fraction légère des résidus de broyage et poussières autres que celles visées à la rubrique 19 10 03', N'19 10 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (893, NULL, N'autres fractions contenant des substances dangereuses ', N'19 10 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (894, NULL, N'autres fractions autres que celles visées à la rubrique 19 10 05', N'19 10 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (896, NULL, N'argiles de filtration usées', N'19 11 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (897, NULL, N'goudrons acides', N'19 11 02', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (898, NULL, N'déchets liquides aqueux', N'19 11 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (899, NULL, N'déchets provenant du nettoyage d''hydrocarbures avec des bases ', N'19 11 04', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (900, NULL, N'Boues provenant du traitement in situ des effluents contenant des substances dangereuses ', N'19 11 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (901, NULL, N'boues provenant du traitement in situ des effluents autres que celles visées à la rubrique 19 11 05 ', N'19 11 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (902, NULL, N'Déchets provenant de l''épuration des gaz de combustion', N'19 11 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (903, NULL, N'déchets non spécifiés ailleurs', N'19 11 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (905, NULL, N'papier et carton', N'19 12 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (906, NULL, N'métaux ferreux', N'19 12 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (907, NULL, N'métaux non ferreux', N'19 12 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (908, NULL, N'matières plastiques et caoutchouc', N'19 12 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (909, NULL, N'verre', N'19 12 05', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (910, NULL, N'bois contenant des substances dangereuses', N'19 12 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (911, NULL, N'bois autres que ceux visés à la rubrique 19 12 06', N'19 12 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (912, NULL, N'textiles', N'19 12 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (913, NULL, N'minéraux (par exemple, sable, cailloux)', N'19 12 09', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (914, NULL, N'déchets combustibles (combustible issu de déchets)', N'19 12 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (915, NULL, N'autres déchets (y compris mélanges) provenant du traitement mécanique des déchets contenant des substances dangereuses', N'19 12 11', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (916, NULL, N'autres déchets (y compris mélanges) provenant du traitement mécanique des déchets autres que ceux visés à la rubrique 19 12 11', N'19 12 12', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (918, NULL, N'déchets solides provenant de la décontamination des sols contenant des substances dangereuses ', N'19 13 01', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (919, NULL, N'déchets solides provenant de la décontamination des sols autres que ceux visés à la rubrique 19 13 01 ', N'19 13 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (920, NULL, N'Boues provenant de la décontamination des sols contenant des substances dangereuses ', N'19 13 03', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (921, NULL, N'Boues provenant de la décontamination des sols autres que celles visées à la rubrique 19 13 03 ', N'19 13 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (922, NULL, N'Boues provenant de la décontamination des eaux souterraines contenant des substances dangereuses ', N'19 13 05', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (923, NULL, N'Boues provenant de la décontamination des eaux souterraines autres que celles visées à la rubrique 19 13 05 ', N'19 13 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (924, NULL, N'Déchets liquides aqueux et concentrés aqueux provenant de la décontamination des eaux souterraines contenant des substances dangereuses', N'19 13 07', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (925, NULL, N'déchets liquides aqueux et concentrés aqueux provenant de la décontamination des eaux souterraines autres que ceux visés à la rubrique 19 13 07', N'19 13 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (928, NULL, N'papier carton ', N'20 01 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (929, NULL, N'verre', N'20 01 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (930, NULL, N'déchets de cuisines et de cantine biodégradables ', N'20 01 08', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (931, NULL, N'vêtements', N'20 01 10', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (932, NULL, N'textiles', N'20 01 11', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (933, NULL, N'solvants ', N'20 01 13', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (934, NULL, N'Acides', N'20 01 14', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (935, NULL, N'Déchets basiques', N'20 01 15', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (936, NULL, N'produits chimiques de la photographie', N'20 01 17', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (937, NULL, N'pesticides', N'20 01 19', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (938, NULL, N'tubes fluorescents et autres déchets contenant du mercure', N'20 01 21', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (939, NULL, N'Equipement mis au rebut contenant des chlorofluorocarbones', N'20 01 23', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (940, NULL, N'Huiles et matières grasses alimentaires', N'20 01 25', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (941, NULL, N'Huiles et matières grasses autres que celles visées à la rubrique 20 01 25', N'20 01 26', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (942, NULL, N'Peinture, encres, colles et résines contenant des substances dangereuses', N'20 01 27', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (943, NULL, N'Peinture, encres, colles et résines autres que celles visées à la rubrique 20 01 27', N'20 01 28', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (944, NULL, N'Détergents contenant des substances dangereuses', N'20 01 29', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (945, NULL, N'Détergents autres que ceux visés à la rubrique 20 01 29 ', N'20 01 30', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (946, NULL, N'Médicaments cytotoxiques et cytostatiques', N'20 01 31', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (947, NULL, N'Médicaments autres que ceux visés à la rubrique 20 01 31', N'20 01 32', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (948, NULL, N'Piles et accumulateurs visés aux rubriques 16 06 01, 16 06 02 ou 16 06 03 et piles et accumulateurs non triés contenant ces piles', N'20 01 33', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (949, NULL, N'Piles et accumulateurs autres que ceux visés à la rubrique 20 01 33', N'20 01 34', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (950, NULL, N'Equipement électriques et électroniques mis au rebut contenant des composants dangereux (5), autres que ceux visés aux rubriques 20 01 21 et 20 01 23', N'20 01 35', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (951, NULL, N'Equipement électriques et électroniques mis au rebut autres que ceux visés aux rubriques 20 01 21, 20 01 23 et 20 01 35', N'20 01 36', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (952, NULL, N'bois contenant des substances dangereuses', N'20 01 37', NULL, 1)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (953, NULL, N'Bois autres que ceux visés à la rubrique 20 01 37', N'20 01 38', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (954, NULL, N'Matières plastiques', N'20 01 39', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (955, NULL, N'métaux', N'20 01 40', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (956, NULL, N'Déchets provenant du ramonage de cheminée ', N'20 01 41', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (957, NULL, N'Autres fractions non spécifiées ailleurs', N'20 01 99', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (959, NULL, N'Déchets biodégradables', N'20 02 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (960, NULL, N'terre et pierres ', N'20 02 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (961, NULL, N'autres déchets non biodégradables', N'20 02 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (963, NULL, N'déchets municipaux en mélange ', N'20 03 01', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (964, NULL, N'déchets de marchés ', N'20 03 02', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (965, NULL, N'déchets de nettoyage des rues ', N'20 03 03', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (966, NULL, N'boues de fosses septiques', N'20 03 04', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (967, NULL, N'Déchets provenant du nettoyage des égouts', N'20 03 06', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (968, NULL, N'Déchets encombrants ', N'20 03 07', NULL, 2)
INSERT INTO [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (969, NULL, N'Déchets municipaux non spécifiés ailleurs', N'20 03 99', NULL, 2)
SET IDENTITY_INSERT [dbo].[code] OFF

PRINT(N'Add 120 rows to [dbo].[doc_import]')
SET IDENTITY_INSERT [dbo].[doc_import] ON
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1017, NULL, N'إشعار الوثيقة ', N'DOC Notification ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1018, NULL, N' وثيقة الحركة ', N'DOC Mouvement ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1019, NULL, N'ضمان مالي', N'Garantie Financiére ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1020, NULL, N'اتفافية', N' Contrat ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1021, NULL, N'ورقة التحليلات / التعريف ', N'Analyses/Fiche déidentification DD ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1022, NULL, N' تصريح بتشغيل المنشأة ', N' Autorisation déexploitation de léinstallation ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1023, '2021-03-02 10:41:25.5160000', N' إذن التثبيت ', N' Autorisation de léinstallation ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1024, NULL, N' إذن التثبيت ', N' Autorisation de léinstallation ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1025, NULL, N' تأمين المسؤولية المدنية للتركيب ', N' Assurance de la Responsabilité Civile de léinstallation ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1026, NULL, N' إذن الجمع والنقل ', N' Autorisation de Collecte et transport ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1027, NULL, N' إقرار شرف على صحة المعلومات المقدمة', N' Déclaration sur léhonneur sur léexactitude des informations présentées ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1028, NULL, N' دفتر الشروط ', N' Cahier de charge ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1029, NULL, N' إشعار الوثيقة ', N' DOC Notification ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1030, NULL, N' وثيقة الحركة ', N' DOC Mouvement ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1031, NULL, N' ضمان مالي ', N' Garantie Financiére ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1032, NULL, N' اتفافية ', N'Contrat ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1033, NULL, N' ورقة التحليلات / التعريف ', N' Analyses/Fiche déidentification DN', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1034, NULL, N'كاب', N' CAP ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1035, NULL, N' تصريح بتشغيل المنشأة ', N' Autorisation déexploitation de léinstallation ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1036, NULL, N' إذن التثبيت ', N' Autorisation de léinstallation ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1037, NULL, N' تأمين المسؤولية المدنية للتركيب ', N' Assurance de la Responsabilité Civile de léinstallation ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1038, NULL, N' إذن الجمع والنقل ', N' Autorisation de Collecte et transport ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1039, NULL, N' إقرار شرف على صحة المعلومات المقدمة', N' Déclaration sur léhonneur sur léexactitude des informations présentées ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1040, NULL, N' دفتر الشروط ', N' Cahier de charge ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1041, NULL, N' تفاصيل الاتصال لمقدم الطلب ', N' Coordonées du Demandeur ', N'CT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1042, NULL, N' إعلان جمع ونقل النفايات الخطرة ', N' Déclaration Déchets dangereux é collecter et transporter ', N'CT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1043, '2021-03-02 11:01:26.2480000', N' نسخة من بطاقة الوطنية ', N' Copie de la carte nationale d''identité ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1044, NULL, N' نسخة من بطاقة الوطنية ', N' Copie de la carte nationale d''identité ', N'ZF', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1045, NULL, N' تأمين المسؤولية ', N' Assurance responsabilité civile ', N'CT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1046, NULL, N' شهادة تأمين متعدد المخاطر', N' Attestation assurance multirisque', N'CT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1047, NULL, N' نشاط الحارس والمولد ', N' Activité du détenteur, générateur ', N'CT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1048, NULL, N' الالتزام بالقيام بأنشطة الجمع والنقل ', N' Engagement déexercer les activités de collecte et de transport ', N'CT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1049, NULL, N' وثيقة الإجراءات الوقائية والصحية ', N' Document des mesures préventives et sanitaires ', N'CT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1050, NULL, N' مستند يبرر القدرة المالية', N' Piece justifiant la capacit financiére', N'CT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1051, NULL, N' تفاصيل الاتصال لمقدم الطلب ', N' Coordonées du Demandeur ', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1052, NULL, N' إعلان جمع ونقل النفايات الغير الخطرة ', N' Déclaration Déchets non dangereux é collecter et transporter ', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1053, NULL, N' نسخة من بطاقة الوطنية ', N' Copie de la carte nationale d''identité ', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1054, NULL, N' تأمين المسؤولية ', N' Assurance responsabilité civile ', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1055, NULL, N' شهادة تأمين متعدد المخاطر', N' Attestation assurance multirisque', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1056, NULL, N' نشاط الحارس والمولد ', N' Activité du détenteur, générateur ', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1057, '2021-03-02 11:10:19.4160000', N' الالتزام بالقيام بأنشطة الجمع والنقل ', N' Engagement d''exercer les activités de collecte et de transport ', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1058, NULL, N' الالتزام بالقيام بأنشطة الجمع والنقل ', N' Engagement d''exercer les activités de collecte et de transport ', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1059, NULL, N' وثيقة الإجراءات الوقائية والصحية ', N' Document des mesures préventives et sanitaires ', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1060, NULL, N' مستند يبرر القدرة المالية', N' Piece justifiant la capacit financiére', N'CT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1061, NULL, N' طلب على شكل إستمارة ', N' Demande sous forme de formulaire ', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1062, '2021-03-02 11:16:46.5540000', N' معلومات عن التثبيت المخطط وموقعه ', N' Informations sur l''installation projetée et leur site ', N'ZF', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1063, NULL, N' معلومات عن التثبيت المخطط وموقعه ', N' Informations sur l''installation projetée et leur site ', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1064, NULL, N' طبيعة الأنشطة التي يتعين القيام بها وأنواع وكميات النفايات ', N' Nature des activités à exercer et les types et quantités des déchets ', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1065, NULL, N' الوصفات التقنية وطرق العلاج ', N' Prescriptions techniques et les modes de traitement ', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1066, NULL, N' احتياطات لضمان شروط السلامة ', N' Précautions pour garantir les conditions de sécurité ', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1067, NULL, N' مخطط الموقع بما في ذلك المباني والمرافق', N' Plan de terrain comportant les bâtiments et les installations', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1068, NULL, N' مخطط موقع التثبيت مع تخصيص دقيق للمناطق المختلفة المذكورة ', N' Plan de site de l''installation avec la précision de l''affectation des différentes zones de ladite ', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1069, NULL, N' وصف التثبيت', N' Description de l''installation', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1070, NULL, N' وصف عمليات ومعدات المعالجة ', N' Description de procédés de traitement et d''équipements ', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1071, NULL, N' خطة التحكم الذاتي لإدارة التثبيت ', N' Plan d''autocontrôle de gestion de l''installation ', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1072, NULL, N' نسخة من قرار القبول البيئي ', N' Copie de la décision d''acceptabilité environnementale ', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1073, NULL, N' صورة من الضمان المالي المشار إليه بالفصل 58 من القانون السالف الذكر عدد 00- 28', N' Copie de la garantie financière visée à l''article 58 de la loi n° 28-00 précitée', N'IT', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1074, NULL, N' طلب على شكل إستمارة ', N' Demande sous forme de formulaire ', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1075, NULL, N' معلومات عن التثبيت المخطط وموقعه ', N' Informations sur l''installation projetée et leur site ', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1076, NULL, N' طبيعة الأنشطة التي يتعين القيام بها وأنواع وكميات النفايات ', N' Nature des activités à exercer et les types et quantités des déchets ', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1077, NULL, N' الوصفات التقنية وطرق العلاج ', N' Prescriptions techniques et les modes de traitement ', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1078, NULL, N' احتياطات لضمان شروط السلامة ', N' Précautions pour garantir les conditions de sécurité ', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1079, NULL, N' مخطط الموقع بما في ذلك المباني والمرافق', N' Plan de terrain comportant les bâtiments et les installations', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1080, NULL, N' مخطط موقع التثبيت مع تخصيص دقيق للمناطق المختلفة المذكورة ', N' Plan de site de l''installation avec la précision de l''affectation des différentes zones de ladite ', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1081, NULL, N' وصف التثبيت', N' Description de l''installation', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1082, NULL, N' وصف عمليات ومعدات المعالجة ', N' Description de procédés de traitement et d''équipements ', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1083, NULL, N' خطة التحكم الذاتي لإدارة التثبيت ', N' Plan d''autocontrôle de gestion de l''installation ', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1084, NULL, N' نسخة من قرار القبول البيئي ', N' Copie de la décision d''acceptabilité environnementale ', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1085, NULL, N' صورة من الضمان المالي المشار إليه بالفصل 58 من القانون السالف الذكر عدد 00- 28', N' Copie de la garantie financière visée à l''article 58 de la loi n° 28-00 précitée', N'IT', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1086, NULL, N' طلب من السلطة الوطنية للدولة المشغلة ', N' Demande de l''autorité nationale de l''Etat d''exploitation ', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1087, NULL, N' وثيقة الاشعار', N' Document de notification', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1088, NULL, N' وثيقة النقل ', N' Document de transport ', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1089, NULL, N' ضمان مالي', N' Garantie Financiére', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1090, NULL, N' نسخة من العقد المبرم بين المصدر والمستورد', N' Copie du contrat conclu entre l"exportateur et l''importateur', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1091, NULL, N' وثيقة التحليلات الفيزيائية والكيميائية للنفايات', N' Document des analyses physico-chimiques des déchets', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1092, NULL, N' دفتر الشروط', N' Cahier de charge', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1093, NULL, N' تصريح التشغيل لوحدات الإنتاج', N' Autorisation d''exploitation des unités de production', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1094, NULL, N' تأمين المسؤولية المدنية للتركيب', N' Assurance de la Responsabilité Civile de léinstallation', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1095, NULL, N' قائمة الجهات المختصة', N' Liste des autorités compétentes', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1096, NULL, N' التكلفة وحساب مبلغ الضمان المالي ', N' Céut et calcul du montant de la garantie financiére ', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1097, NULL, N' مسار الشحن', N' Parcours de la charge', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1098, NULL, N' طرق استعادة النفايات', N' Modes de valorisfaation des déchets', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1099, NULL, N' أسباب الاستيراد', N' Causes de l''importation', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1100, NULL, N' إقرار بشرف مصداقية المعلومة المعلنة والغياب موقع وموافق عليه', N' Déclaration sur l''honneur de la fiabilité des informations déclarées et d''absence, signée et conforme', N'ET', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1101, NULL, N' وثيقة الاشعار ', N' Document de notification ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1102, NULL, N' وثيقة النقل ', N' Document de transport ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1103, NULL, N' أسباب التصدير ', N' Motifs d’exportation ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1104, NULL, N' نسخة من رخصة التشغيل الخاصة بالتثبيت', N' Copie de l’autorisation d’exploitation de l’installation ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1105, NULL, N' نسخة من العقد بين مصدر النفايات والمستورد', N' Copie du contrat entre l’exportateur des déchets et l’importateur', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1106, NULL, N' التصديق على الاتفاق المسبق ', N' Attestation de l’accord préalable ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1107, NULL, N' خصائص النفايات ', N' Caractéristiques des déchets ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1108, NULL, N' وصف طرق إنتاج النفايات ', N' Description des modalités de production des déchets ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1109, NULL, N' ضمان مالي ', N' Garantie Financiére ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1110, NULL, N' قائمة الناقلين ', N' Liste des transporteurs ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1111, NULL, N' مسار الشحن ', N' Parcours de la charge ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1112, NULL, N' إقرار الشرف بصحة المعلومات المقدمة والموقعة والمصدق عليها ', N'Déclaration sur l’honneur sur l’exactitude des informations présentées, signée et légalisée ', N'TR', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1113, NULL, N' وثيقة الاشعار ', N' Document de notification ', N'XD', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1114, NULL, N' وثيقة النقل ', N' Document de transport ', N'XD', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1115, NULL, N'يمكن تقديم تقدير عن طريق وسيلة النقل لتبرير الأسعار. ', N' Un devis par mode de transport peut étre fourni pour justifier les prix', N'XD', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1116, NULL, N' احتساب الضمان المالي', N' Calcul de la garantie financière ', N'XD', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1117, NULL, N' التحليلات ', N' Analyses ', N'XD', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1118, NULL, N' مسارات الرحلة', N'Itinéraires', N'XD', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1119, NULL, N' قائمة سلطات العبور', N' Liste des autorités de transit', N'XD', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1120, NULL, N' قائمة سلطات العبور', N' Liste des autorités de transit', N'XD', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1121, NULL, N' مسارات الرحلة', N'Itinéraires', N'XD', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1122, NULL, N'التحليلات', N'Analyses ', N'XD', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1123, NULL, N' احتساب الضمان المالي', N' Calcul de la garantie financière ', N'XD', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1124, NULL, N'يمكن تقديم تقدير عن طريق وسيلة النقل لتبرير الأسعار', N'Un devis par mode de transport peut étre fourni pour justifier les prix. ', N'XD', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1125, NULL, N'وثيقة النقل ', N'Document de transport ', N'XD', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1126, NULL, N'وثيقة الاشعار ', N'Document de notification ', N'XD', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1127, NULL, N' كتاب من وزارة التجارة والصناعة ', N' Lettre du Ministère du commerce et de l’Industrie ', N'DL', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1128, NULL, N' رخصة استيراد ', N' Licence d’importation ', N'DL', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1129, NULL, N' فاتورة التشكيل ', N' Facture Préforme ', N'DL', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1130, NULL, N' شهادة عدم نشاط إشعاعي للمعادن الحديدية وغير الحديدية ', N'Certificat de non radioactivité pour les métaux ferreux et non ferreux ', N'DL', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1131, NULL, N' الالتزام بشرف موقع ومصدق ', N' Engagement sur l’honneur signé et légalisé ', N'DL', 2)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1132, NULL, N' الالتزام بشرف موقع ومصدق ', N' Engagement sur l’honneur signé et légalisé ', N'DL', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1133, NULL, N' شهادة عدم نشاط إشعاعي للمعادن الحديدية وغير الحديدية ', N'Certificat de non radioactivité pour les métaux ferreux et non ferreux ', N'DL', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1134, NULL, N' فاتورة التشكيل ', N' Facture Préforme ', N'DL', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1135, NULL, N' رخصة استيراد ', N' Licence d’importation ', N'DL', 1)
INSERT INTO [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [typeaut], [id_classification]) VALUES (1136, NULL, N' كتاب من وزارة التجارة والصناعة ', N' Lettre du Ministère du commerce et de l’Industrie ', N'DL', 1)
SET IDENTITY_INSERT [dbo].[doc_import] OFF

PRINT(N'Add 2 rows to [dbo].[lieu_elimination]')
SET IDENTITY_INSERT [dbo].[lieu_elimination] ON
INSERT INTO [dbo].[lieu_elimination] ([id_lieu_elimination], [delete_date_time], [nom_ar], [nom_fr], [id_classification]) VALUES (1, NULL, N'FES', N'FES', 2)
INSERT INTO [dbo].[lieu_elimination] ([id_lieu_elimination], [delete_date_time], [nom_ar], [nom_fr], [id_classification]) VALUES (2, NULL, N'CASA', N'CASA', 1)
SET IDENTITY_INSERT [dbo].[lieu_elimination] OFF

PRINT(N'Add 1 row to [dbo].[profilerole]')
SET IDENTITY_INSERT [dbo].[profilerole] ON
INSERT INTO [dbo].[profilerole] ([profilrole_id], [annuler], [modifier], [tous], [valider], [profil_id], [role_id]) VALUES (1, N'OUI', N'OUI', N'OUI', N'OUI', 1, 1)
SET IDENTITY_INSERT [dbo].[profilerole] OFF

PRINT(N'Add 1 row to [dbo].[societe]')
SET IDENTITY_INSERT [dbo].[societe] ON
INSERT INTO [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [type], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1, NULL, N'000', N'000', N'85826', NULL, NULL, N'hassaneddaoudi1990@gmail.com', N'0', N'0575757575', NULL, N'hassan', N'$2a$10$pVxr/MwZF8YGOCFb20.26erBNHivqVdbm4uVUzKjJ3T6T0canWotG', N'test', N'test', N'0614629664', N'choisir', NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[societe] OFF

PRINT(N'Add 3 rows to [dbo].[compte]')
SET IDENTITY_INSERT [dbo].[compte] ON
INSERT INTO [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1, NULL, NULL, NULL, NULL, N'amal@gmail.com', N'amal', N'$2a$10$ttgK0gl8snxCUefu8P9speFxhcJnjqWGXonsgjWbhGYPRNDqsKDku', NULL, 1, NULL)
INSERT INTO [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (2, NULL, NULL, NULL, NULL, N'autorisation@environnement.gov.ma', N'autorisation@environnement', N'$2a$10$ttgK0gl8snxCUefu8P9speFxhcJnjqWGXonsgjWbhGYPRNDqsKDku', NULL, 1, NULL)
INSERT INTO [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (3, NULL, NULL, NULL, NULL, N'hassaneddaoudi1990@gmail.com', NULL, N'$2a$10$Y07JpYlbPfiiGZSUJKOjwOmFFWEpdX2ZrwHR65JCG4R3r3YMGDsIK', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[compte] OFF

PRINT(N'Add 2 rows to [dbo].[installation]')
SET IDENTITY_INSERT [dbo].[installation] ON
INSERT INTO [dbo].[installation] ([id_installation], [adresse], [date_depot], [date_validation], [delete_date_time], [description], [document_attache], [email], [fax], [formation], [horaire_exploitation], [horaire_exploitation_fin], [ife], [motif_refus], [nbr_equipe_travail], [no], [num_demande], [operation], [projet], [qualification], [quantite], [raison], [site], [structure], [tel], [type_appareil], [id_code], [id_compte], [id_activite], [id_statut_installation], [id_unite], [id_visite_installation]) VALUES (1, N'Adresse ', NULL, '2021-03-02 21:13:01.4730000', NULL, N'description d''installation:', N'/assets/myFile/file570.pdf', N'test@gmail.com', N'0535353535', N'formation', N'10:00', N'18:00', N'12', NULL, N'30', 0, NULL, N'valorisation', NULL, N'qualification ', N'100', N'Raison social:', N'Site:', N'struture d''installation:', N'0675757575', N'type d''appareil:', 6, 3, 1, 4, 2, 1)
INSERT INTO [dbo].[installation] ([id_installation], [adresse], [date_depot], [date_validation], [delete_date_time], [description], [document_attache], [email], [fax], [formation], [horaire_exploitation], [horaire_exploitation_fin], [ife], [motif_refus], [nbr_equipe_travail], [no], [num_demande], [operation], [projet], [qualification], [quantite], [raison], [site], [structure], [tel], [type_appareil], [id_code], [id_compte], [id_activite], [id_statut_installation], [id_unite], [id_visite_installation]) VALUES (2, N'Adresse ', '2021-03-02 21:28:03.7466667', '2021-03-02 21:30:50.5340000', NULL, N'description d''installation:', N'/assets/myFile/file756.pdf', N'Email ', N'Fax', N'formation', N'10', N'20', N'132', NULL, N'10', 1, N'N-2021-1', N'valorisation', NULL, N'qualification ', N'10', N'Raison ', N'Site', N'struture d''installation:', N'Téléphone ', N'type d''appareil:', 6, 3, 1, 4, 1, 2)
SET IDENTITY_INSERT [dbo].[installation] OFF

PRINT(N'Add 17 rows to [dbo].[question]')
SET IDENTITY_INSERT [dbo].[question] ON
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (42, NULL, N'Quel est le coût de la procédure ?', N'', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (43, NULL, N'Quelles sont les étapes d’obtention d’une Décision d’Acceptabilité Environnementale ?', N'', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (44, NULL, N'Quelles sont les pièces nécessaires à la constitution du dossier d’EIE ?', N'', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (45, NULL, N'Quel est le contenu du rapport d’Etude d’Impact sur l’Environnement (EIE) et du Programme de Surveillance et de Suivi Environnemental (PSSE) ?', N'', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (46, NULL, N'Quels sont les projets assujettis à l’EIE ?', N'', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (47, NULL, N'Quel est le référentiel juridique ? (Documents téléchargeables)', N'', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (48, NULL, N'Qu’est-ce que l’Etude d’Impact sur l’Environnement ?', N'', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (49, '2021-02-19 15:54:03.7600000', N'question test 3', NULL, N'1', 1, 1, NULL)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (50, '2021-02-19 15:53:59.4880000', N'quest test 2', NULL, N'2', NULL, 1, 3)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (51, NULL, N'', N'ما هي مراحل مسطرة دراسة التأثير على البيئة؟', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (52, '2021-02-19 17:29:04.5310000', N'', N'ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟', N'1', NULL, 1, NULL)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (53, NULL, N'', N'ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (54, NULL, N'', N' ما هو مضمون دراسة التأثير على البيئة و برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي؟', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (55, NULL, N'', N'ما هي المشاريع الخاضعة لدراسة التأثير على البيئة؟', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (56, NULL, N'', N'ما هو المرجع القانوني لهذه المسطرة؟', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (57, NULL, N'', N'ما هي دراسة التأثير على البيئة؟', N'2', NULL, 1, 4)
INSERT INTO [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (58, '2021-02-22 09:06:44.5010000', N'ppp', N'', N'1', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[question] OFF

PRINT(N'Add 67 rows to [dbo].[reponse]')
SET IDENTITY_INSERT [dbo].[reponse] ON
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (43, N'15-02-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction d’un dossier EIE. Cependant les documents de l’EIE et les frais de l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge du pétitionnaire selon le Décret n° 2-04-564 du 5 kaada 1429 (4 novembre 2008) fixant les modalités d''organisation et de déroulement de l''enquête publique relative aux projets soumis aux études d''impact sur l''environnement.', N'10 : 19', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (44, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="${pageContext.request.contextPath}/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental. 

	</p>
', N'10 : 31', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (45, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental. 

	</p>', N'10 : 35', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (46, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental.
	</p>', N'10 : 47', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (47, N'15-02-2021', NULL, N'<ol>
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 49', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (48, N'15-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 50', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (49, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>', N'10 : 56', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (50, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>', N'10 : 58', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (51, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>', N'10 : 59', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (52, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>

<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.', N'11 : 0', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (53, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:  </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 8', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (54, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:  </li>
		<p>
			<ol class="style_number">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 14', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (55, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		<p>
			<ol class="style_number">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 15', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (56, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		<p>
			<ol class="style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 20', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (57, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		<p>
			<ol class="style_number style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 23', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (58, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 26', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (59, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol start="3 style_number_sub">
				<li>
					<ol class="">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 28', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (60, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol start="3" class="style_number_sub">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 30', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (61, N'15-02-2021', NULL, N'<ol class="style_number style_number_sub">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ol>
			</li>
				
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 32', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (62, N'15-02-2021', NULL, N'<ol class="style_number style_number_sub">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number_sub" start="3">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 34', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (63, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number_sub" start="3">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 35', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (64, N'15-02-2021', NULL, N'	<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number_sub" start="3">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 36', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (65, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number" >
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 39', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (66, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			
			<ol class="">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ol>
				
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 41', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (67, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number style_number_sub" start="3">
				<li>
					<ol class=" style_number style_number_sub" start="3">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 43', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (68, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		
			<ol class="style_number style_number_sub">
				<li>
					<ol class=" style_number style_number_sub" start="3">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 44', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (69, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		
			<ol class="style_number style_number_sub" start="3">
				<li>
					<ol class=" style_number style_number_sub" start="1">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 44', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (70, N'15-02-2021', NULL, N'<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p>3.1 - Industrie extractive </p>
        <p>3.2 - Industrie de l''énergie : </p>
        <p>3.3 - Industrie chimique  </p>
        <p>3.4 - Traitement des métaux :  </p>
        <p>3.5 - Industrie des produits alimentaires :  </p>
        <p>3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <p>3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>', N'11 : 51', 1)
EXEC(N'INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (71, N''15-02-2021'', NULL, N''<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p>3.1 - Industrie extractive </p>
        <ul class="style_square">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p>3.2 - Industrie de l''''énergie : </p>
        <ul class="style_square">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p>3.3 - Industrie chimique  </p>
        <ul class="style_square">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''''amiante </li>
        </ul>
        <p>3.4 - Traitement des métaux :  </p>
        <ul class="style_square">
            <li> Usines sidérurgiques </li>
            <li> Traitement de surface et revêtement des métaux </li>
            <li> Chaudronnerie et appareils métalliques </li>
        </ul>
        <p>3.5 - Industrie des produits alimentaires :  </p>
        <ul class="style_square">
            <li>Conserverie de produits animal et végétal ; </li>
            <li>Fabrication de produits laitiers ; </li>
            <li>Fabrication de confiseries et de boissons ; </li>
            <li>Usines de farine de poisson et d''''huile de poisson ; </li>
            <li>Féculerie industrielle ;</li>
            <li>Sucreries et transformation de mélasses ; </li>
            <li>Minoteries et semouleries ; </li>
            <li>Huileries. </li>
        </ul>
        <p>3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <ul class="style_square">
            <li>Fabrication de pâte à papier, de papier et de carton ; </li>
            <li>Tanneries et mégisserie ; </li>
            <li>Production et traitement de cellulose ; </li>
            <li>Teinturerie de fibres ; </li>
            <li>Fabrication de panneaux de fibres, de particules et de contre-plaqués ; </li>
            <li>Industrie de textile et teintureries ; </li>
            <li>Poterie. </li>
        </ul>
        <p>3.7 - Industrie de c'', N''11 : 58'', 1)')
SELECT @pv=TEXTPTR([description]) FROM [dbo].[reponse] WHERE [id_reponse] = 71
UPDATETEXT [dbo].[reponse].[description] @pv NULL NULL N'aoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <p>
        <ul class="style_square">
            <li>Projets de remembrement rural ; </li>
            <li>Projets de reboisement d''une superficie supérieur à 100 hectares ; </li>
            <li>Projets d''affectation de terre inculte ou d''étendue semi-naturelle à l''exploitation agricole intensive. </li>
        </ul>
    </p>
    
    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>'
EXEC(N'INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (72, N''15-02-2021'', NULL, N''<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p class="pb-1">3.1 - Industrie extractive </p>
        <ul class="style_square ml-5">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p class="pb-1">3.2 - Industrie de l''''énergie : </p>
        <ul class="style_square ml-5">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p class="pb-1">3.3 - Industrie chimique  </p>
        <ul class="style_square ml-5">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''''amiante </li>
        </ul>
        <p class="pb-1">3.4 - Traitement des métaux :  </p>
        <ul class="style_square ml-5">
            <li> Usines sidérurgiques </li>
            <li> Traitement de surface et revêtement des métaux </li>
            <li> Chaudronnerie et appareils métalliques </li>
        </ul>
        <p class="pb-1">3.5 - Industrie des produits alimentaires :  </p>
        <ul class="style_square ml-5">
            <li>Conserverie de produits animal et végétal ; </li>
            <li>Fabrication de produits laitiers ; </li>
            <li>Fabrication de confiseries et de boissons ; </li>
            <li>Usines de farine de poisson et d''''huile de poisson ; </li>
            <li>Féculerie industrielle ;</li>
            <li>Sucreries et transformation de mélasses ; </li>
            <li>Minoteries et semouleries ; </li>
            <li>Huileries. </li>
        </ul>
        <p class="pb-1">3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <ul class="style_square ml-5">
            <li>Fabrication de pâte à papier, de papier et de carton ; </li>
            <li>Tanneries et mégisserie ; </li>
            <li>Production et traitement de cellulose ; </li>
            <li>Teinturerie de fibres ; </li>
            <li>Fabrication de panneaux de fibres, de particules et de contre-plaqués ; </li>
            <li>Industrie de tex'', N''12 : 1'', 1)')
SELECT @pv=TEXTPTR([description]) FROM [dbo].[reponse] WHERE [id_reponse] = 72
UPDATETEXT [dbo].[reponse].[description] @pv NULL NULL N'tile et teintureries ; </li>
            <li>Poterie. </li>
        </ul>
        <p class="pb-1">3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <p>
        <ul class="style_square">
            <li>Projets de remembrement rural ; </li>
            <li>Projets de reboisement d''une superficie supérieur à 100 hectares ; </li>
            <li>Projets d''affectation de terre inculte ou d''étendue semi-naturelle à l''exploitation agricole intensive. </li>
        </ul>
    </p>

    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>'
EXEC(N'INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (73, N''15-02-2021'', NULL, N''<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p class="pb-1mb-1">3.1 - Industrie extractive </p>
        <ul class="style_square ml-5">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p class="mb-1">3.2 - Industrie de l''''énergie : </p>
        <ul class="style_square ml-5">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p class="mb-1">3.3 - Industrie chimique  </p>
        <ul class="style_square ml-5">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''''amiante </li>
        </ul>
        <p class="mb-1">3.4 - Traitement des métaux :  </p>
        <ul class="style_square ml-5">
            <li> Usines sidérurgiques </li>
            <li> Traitement de surface et revêtement des métaux </li>
            <li> Chaudronnerie et appareils métalliques </li>
        </ul>
        <p class="mb-1">3.5 - Industrie des produits alimentaires :  </p>
        <ul class="style_square ml-5">
            <li>Conserverie de produits animal et végétal ; </li>
            <li>Fabrication de produits laitiers ; </li>
            <li>Fabrication de confiseries et de boissons ; </li>
            <li>Usines de farine de poisson et d''''huile de poisson ; </li>
            <li>Féculerie industrielle ;</li>
            <li>Sucreries et transformation de mélasses ; </li>
            <li>Minoteries et semouleries ; </li>
            <li>Huileries. </li>
        </ul>
        <p class="mb-1">3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <ul class="style_square ml-5">
            <li>Fabrication de pâte à papier, de papier et de carton ; </li>
            <li>Tanneries et mégisserie ; </li>
            <li>Production et traitement de cellulose ; </li>
            <li>Teinturerie de fibres ; </li>
            <li>Fabrication de panneaux de fibres, de particules et de contre-plaqués ; </li>
            <li>Industrie de'', N''12 : 3'', 1)')
SELECT @pv=TEXTPTR([description]) FROM [dbo].[reponse] WHERE [id_reponse] = 73
UPDATETEXT [dbo].[reponse].[description] @pv NULL NULL N' textile et teintureries ; </li>
            <li>Poterie. </li>
        </ul>
        <p class="mb-1">3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <p>
        <ul class="style_square">
            <li>Projets de remembrement rural ; </li>
            <li>Projets de reboisement d''une superficie supérieur à 100 hectares ; </li>
            <li>Projets d''affectation de terre inculte ou d''étendue semi-naturelle à l''exploitation agricole intensive. </li>
        </ul>
    </p>

    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>'
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (74, N'15-02-2021', NULL, N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEI et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>', N'12 : 5', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (75, N'15-02-2021', NULL, N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement »', N'12 : 5', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (76, N'15-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'12 : 6', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (77, N'15-02-2021', NULL, N'reponse 3', N'12 : 27', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (78, N'15-02-2021', NULL, N'reponse 2', N'12 : 28', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (79, N'19-02-2021', NULL, N' <img src="/assets/images/arab_6.png">', N'16 : 20', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (80, N'19-02-2021', NULL, N'<div>
    <ol>
        <li> استمارة الإشعار بالمشروع: أنظر النموذج على الموقع.</li>
        <li> البحث العمومي: انظر ظهير رقم 2-04-564   ل 5 دي القعدة 1429 الموافق 4 نونبر 2008 الدي ينظم ويحدد شروط البحث العموم الخاص للمشاريع المعنية   بدراسة التأثير على البيئة.</li>
        <li> دراسة التأثير على البيئة.</li>
        <li>برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي. </li>
    </ol>
</div>', N'17 : 30', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (81, N'19-02-2021', NULL, N'	 <img src="/assets/images/arab_5.png">
', N'17 : 42', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (82, N'19-02-2021', NULL, N'
	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'17 : 48', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (83, N'19-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.', N'17 : 56', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (84, N'19-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'17 : 57', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (85, N'19-02-2021', NULL, N'Voir la liste d’assujettissement annexée à la loi n°12-03 relative aux études d''impact sur l''environnement.', N'17 : 58', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (86, N'19-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'18 : 2', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (87, N'19-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'18 : 3', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (88, N'19-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'18 : 32', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (89, N'19-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'18 : 32', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (90, N'19-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'18 : 32', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (91, N'19-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'18 : 32', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (92, N'20-02-2021', NULL, N'poipoio', N'17 : 45', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (93, N'22-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'10 : 57', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (94, N'22-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'10 : 57', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (95, N'22-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'10 : 57', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (96, N'22-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'10 : 58', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (97, N'22-02-2021', NULL, N'<div>
    <ol>
        <li> استمارة الإشعار بالمشروع: أنظر النموذج على الموقع.</li>
        <li> البحث العمومي: انظر ظهير رقم 2-04-564   ل 5 دي القعدة 1429 الموافق 4 نونبر 2008 الدي ينظم ويحدد شروط البحث العموم الخاص للمشاريع المعنية   بدراسة التأثير على البيئة.</li>
        <li> دراسة التأثير على البيئة.</li>
        <li>برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي. </li>
    </ol>
</div>', N'10 : 58', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (98, N'22-02-2021', NULL, N' <img src="/assets/images/arab_6.png">', N'10 : 58', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (99, N'22-02-2021', NULL, N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement »', N'10 : 58', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (100, N'22-02-2021', NULL, N'Voir la liste d’assujettissement annexée à la loi n°12-03 relative aux études d''impact sur l''environnement.', N'10 : 58', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (101, N'22-02-2021', NULL, N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEI et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>', N'10 : 59', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (102, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental.
	</p>', N'10 : 59', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (103, N'22-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 59', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (104, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.', N'10 : 59', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (105, N'22-02-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction d’un dossier EIE. Cependant les documents de l’EIE et les frais de l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge du pétitionnaire selon le Décret n° 2-04-564 du 5 kaada 1429 (4 novembre 2008) fixant les modalités d''organisation et de déroulement de l''enquête publique relative aux projets soumis aux études d''impact sur l''environnement.', N'11 : 0', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (106, N'22-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
   <li class="text-underline" > <a href="/assets/images/arab_5.png" download="doc.png" target="_blank">برنامج المراقبة والتتبع البيئي</a> </li>
</ol>
', N'11 : 2', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (107, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">PSSE :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>', N'11 : 30', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (108, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">PSSE :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>', N'11 : 30', 1)
INSERT INTO [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (109, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">PSSE :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank">Document téléchargeable.</a></p>', N'11 : 32', 1)
SET IDENTITY_INSERT [dbo].[reponse] OFF

PRINT(N'Add 3 rows to [dbo].[import_historique]')
SET IDENTITY_INSERT [dbo].[import_historique] ON
INSERT INTO [dbo].[import_historique] ([id_historique], [date], [etat], [id_collecte], [id_installation], [id_notification]) VALUES (1, '2021-03-02 21:11:04.6070000', N'non conforme', NULL, 1, NULL)
INSERT INTO [dbo].[import_historique] ([id_historique], [date], [etat], [id_collecte], [id_installation], [id_notification]) VALUES (2, '2021-03-02 21:12:00.8330000', N'non conforme', NULL, 1, NULL)
INSERT INTO [dbo].[import_historique] ([id_historique], [date], [etat], [id_collecte], [id_installation], [id_notification]) VALUES (3, '2021-03-02 21:29:51.6240000', N'non conforme', NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[import_historique] OFF

PRINT(N'Add 24 rows to [dbo].[list_doc_notif]')
SET IDENTITY_INSERT [dbo].[list_doc_notif] ON
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (1, NULL, N'oui', NULL, N'/assets/myFile/file1281.pdf', NULL, 1085, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (2, NULL, N'oui', NULL, N'/assets/myFile/file971.pdf', NULL, 1084, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (3, NULL, N'oui', NULL, N'/assets/myFile/file1252.pdf', NULL, 1083, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (4, NULL, N'oui', NULL, N'/assets/myFile/file1383.pdf', NULL, 1082, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (5, NULL, N'oui', NULL, N'/assets/myFile/file1237.pdf', NULL, 1081, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (6, NULL, N'oui', NULL, N'/assets/myFile/file1370.pdf', NULL, 1080, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (7, NULL, N'oui', NULL, N'/assets/myFile/file697.pdf', NULL, 1079, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (8, NULL, N'oui', NULL, N'/assets/myFile/file1108.pdf', NULL, 1078, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (9, NULL, N'oui', NULL, N'/assets/myFile/file848.pdf', NULL, 1077, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (10, NULL, N'oui', NULL, N'/assets/myFile/file707.pdf', NULL, 1076, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (11, NULL, N'oui', NULL, N'/assets/myFile/file643.pdf', NULL, 1075, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (12, NULL, N'oui', N'  Non conforme', N'/assets/myFile/file746.pdf', NULL, 1074, 1, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (13, NULL, N'oui', NULL, N'/assets/myFile/file742.pdf', NULL, 1085, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (14, NULL, N'oui', NULL, N'/assets/myFile/file1260.pdf', NULL, 1084, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (15, NULL, N'oui', NULL, N'/assets/myFile/file860.pdf', NULL, 1083, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (16, NULL, N'oui', NULL, N'/assets/myFile/file713.pdf', NULL, 1082, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (17, NULL, N'oui', NULL, N'/assets/myFile/file580.pdf', NULL, 1081, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (18, NULL, N'oui', NULL, N'/assets/myFile/file1062.pdf', NULL, 1080, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (19, NULL, N'oui', NULL, N'/assets/myFile/file1081.pdf', NULL, 1078, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (20, NULL, N'oui', NULL, N'/assets/myFile/file1158.pdf', NULL, 1079, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (21, NULL, N'oui', NULL, N'/assets/myFile/file1011.pdf', NULL, 1077, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (22, NULL, N'oui', NULL, N'/assets/myFile/file585.pdf', NULL, 1076, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (23, NULL, N'oui', NULL, N'/assets/myFile/file1066.pdf', NULL, 1075, 2, NULL)
INSERT INTO [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [id_collecte], [iddoc_import], [id_installation], [id_notification]) VALUES (24, NULL, N'oui', NULL, N'/assets/myFile/file1101.pdf', NULL, 1074, 2, NULL)
SET IDENTITY_INSERT [dbo].[list_doc_notif] OFF

PRINT(N'Add constraints to [dbo].[list_doc_notif]')
ALTER TABLE [dbo].[list_doc_notif] WITH CHECK CHECK CONSTRAINT [FK79di5doh4qo30afqnwe95qgwb]
ALTER TABLE [dbo].[list_doc_notif] WITH CHECK CHECK CONSTRAINT [FKhd6hv61axryymmj2veefjvv5s]
ALTER TABLE [dbo].[list_doc_notif] WITH CHECK CHECK CONSTRAINT [FKpyknndgqias1nuk8komnu7uou]
ALTER TABLE [dbo].[list_doc_notif] WITH CHECK CHECK CONSTRAINT [FKq07wvt9wm2xydh6xd7jn32hu0]

PRINT(N'Add constraints to [dbo].[import_historique]')
ALTER TABLE [dbo].[import_historique] WITH CHECK CHECK CONSTRAINT [FK27ev6hpjmgmh6cxed16tktp7h]
ALTER TABLE [dbo].[import_historique] WITH CHECK CHECK CONSTRAINT [FK43xvwbhvqw1f4xk5xm135tpfm]
ALTER TABLE [dbo].[import_historique] WITH CHECK CHECK CONSTRAINT [FKpw9jd009w5l0vt5fx2cq2onhq]

PRINT(N'Add constraints to [dbo].[reponse]')
ALTER TABLE [dbo].[reponse] WITH CHECK CHECK CONSTRAINT [FK219wm9jpvu005i135ahy95so]

PRINT(N'Add constraints to [dbo].[question]')
ALTER TABLE [dbo].[question] WITH CHECK CHECK CONSTRAINT [FK738osswfjfwybg1ha0axsgq2u]
ALTER TABLE [dbo].[question] WITH CHECK CHECK CONSTRAINT [FK7mn5f3ojmbndecpshsyow24xe]
ALTER TABLE [dbo].[question] WITH CHECK CHECK CONSTRAINT [FKoiv9j2i9hgr3xay4uylicagb9]

PRINT(N'Add constraints to [dbo].[installation]')
ALTER TABLE [dbo].[installation] WITH CHECK CHECK CONSTRAINT [FK2u84rh4dgej5nxnkosl0ui3qk]
ALTER TABLE [dbo].[installation] WITH CHECK CHECK CONSTRAINT [FK6evlor0wjs62vicd0ldel8469]
ALTER TABLE [dbo].[installation] WITH CHECK CHECK CONSTRAINT [FKbeov4j4amk8msrdwsk8w0riu9]
ALTER TABLE [dbo].[installation] WITH CHECK CHECK CONSTRAINT [FKn0m2ge9p4rt9et2bfueke3r4w]
ALTER TABLE [dbo].[installation] WITH CHECK CHECK CONSTRAINT [FKs9e1p2w1g53x0e0hps1epw6b2]
ALTER TABLE [dbo].[installation] WITH CHECK CHECK CONSTRAINT [FKta19nursu6xa6gl8px1lsbk5g]

PRINT(N'Add constraints to [dbo].[compte]')
ALTER TABLE [dbo].[compte] WITH CHECK CHECK CONSTRAINT [FKjgjfwpm83x17wxj6usdxsj15h]
ALTER TABLE [dbo].[compte] WITH CHECK CHECK CONSTRAINT [FKr1m349w78hwtvjjdd4m1gkhj0]
ALTER TABLE [dbo].[collectetransporteur] WITH CHECK CHECK CONSTRAINT [FKegso9yihi9ouwdvjy832oad3l]
ALTER TABLE [dbo].[contact_message] WITH CHECK CHECK CONSTRAINT [FK55lfo6o8ceiwauh2jsqdn2pyf]
ALTER TABLE [dbo].[demande_infromation] WITH CHECK CHECK CONSTRAINT [FKde5fyw6lkffg4fuq7j8u7xgsn]
ALTER TABLE [dbo].[notification] WITH CHECK CHECK CONSTRAINT [FKka4t03egekfkb15nq0v2d8n8k]

PRINT(N'Add constraints to [dbo].[societe]')
ALTER TABLE [dbo].[societe] WITH CHECK CHECK CONSTRAINT [FK47h4ylpa98xx6gwccesjgl84w]
ALTER TABLE [dbo].[societe] WITH CHECK CHECK CONSTRAINT [FK6n17fb2hn2hl1dj5xbx64erqy]

PRINT(N'Add constraints to [dbo].[profilerole]')
ALTER TABLE [dbo].[profilerole] WITH CHECK CHECK CONSTRAINT [FKd0u09busp4elueh2uulxujbfe]
ALTER TABLE [dbo].[profilerole] WITH CHECK CHECK CONSTRAINT [FKfj60458p77xri6jue5vr9dj7r]

PRINT(N'Add constraints to [dbo].[lieu_elimination]')
ALTER TABLE [dbo].[lieu_elimination] WITH CHECK CHECK CONSTRAINT [FKa2khculffrrs5n8rry5g6x2gr]

PRINT(N'Add constraints to [dbo].[doc_import]')
ALTER TABLE [dbo].[doc_import] WITH CHECK CHECK CONSTRAINT [FK6prqh7r9ygyllg64bgyverxcp]

PRINT(N'Add constraints to [dbo].[code]')
ALTER TABLE [dbo].[code] WITH CHECK CHECK CONSTRAINT [FK1912gg6ioe9dx7buwdxm32mrj]
ALTER TABLE [dbo].[collectetransporteur] WITH CHECK CHECK CONSTRAINT [FK1g78xf2o41wjvlmyl33wnvwue]
ALTER TABLE [dbo].[notification] WITH CHECK CHECK CONSTRAINT [FK5o20wot2hw76xm7ixbxmhklog]
ALTER TABLE [dbo].[type] WITH CHECK CHECK CONSTRAINT [FK6re19t10b7j49t91cdfsud4gx]
ALTER TABLE [dbo].[notification] WITH CHECK CHECK CONSTRAINT [FKm8vr8n7dmim212hpfhwa3pivk]
ALTER TABLE [dbo].[notification] WITH CHECK CHECK CONSTRAINT [FKlrywo63o90330eo0bushqa8qg]
ALTER TABLE [dbo].[collectetransporteur] WITH CHECK CHECK CONSTRAINT [FKe2m8ovnm5xpd6gmp0iualscst]
ALTER TABLE [dbo].[collectetransporteur] WITH CHECK CHECK CONSTRAINT [FKluuhsc66vp3mx90eb64qyaohh]
ALTER TABLE [dbo].[demande_infromation] WITH CHECK CHECK CONSTRAINT [FKe2nwbswtyxw1qsldt7bggh4b2]
ALTER TABLE [dbo].[demande_infromation] WITH CHECK CHECK CONSTRAINT [FK5286lo4nlnmcqdw2n46iw9a9f]
ALTER TABLE [dbo].[collectetransporteur] WITH CHECK CHECK CONSTRAINT [FKpakj0ig6tiq41n1k4kwxr98e8]
ALTER TABLE [dbo].[userrole] WITH CHECK CHECK CONSTRAINT [FKf9a7cojfuvf40x6co16kxa1jb]
ALTER TABLE [dbo].[userroleexist] WITH CHECK CHECK CONSTRAINT [FK7fsa73b9gr5hfedox47wy08a3]
ALTER TABLE [dbo].[comite] WITH CHECK CHECK CONSTRAINT [FKao63rrnrfswts88rv5pdt0c82]
ALTER TABLE [dbo].[eiedre] WITH CHECK CHECK CONSTRAINT [FK1rdauhpwr4tic3kckeutelji7]
ALTER TABLE [dbo].[eiedre] WITH CHECK CHECK CONSTRAINT [FKbkkbv1wf1m466x6ugkfgaoukw]
ALTER TABLE [dbo].[notification] WITH CHECK CHECK CONSTRAINT [FKli4t5o7sx594dxyr690x8ic3y]
ALTER TABLE [dbo].[transporteur] WITH CHECK CHECK CONSTRAINT [FKqgnkm8r8fmyjj0hoohjhelu66]
ALTER TABLE [dbo].[vehicules] WITH CHECK CHECK CONSTRAINT [FKqb6wjsxh30uwvcgntr2ggcwxb]
ALTER TABLE [dbo].[eiedre] WITH CHECK CHECK CONSTRAINT [FKtd6ykxkn3arln8hr35u9vuxvt]
ALTER TABLE [dbo].[notification] WITH CHECK CHECK CONSTRAINT [FK2xyl9kka6h2w34f4d6lg1j4ha]
ALTER TABLE [dbo].[demande_infromation] WITH CHECK CHECK CONSTRAINT [FK460fk34axjhpe3dvpl9nnocei]
COMMIT TRANSACTION
GO
