USE [seed]
GO
/****** Object:  Table [dbo].[question]    Script Date: 12/10/2021 14:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id_question] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[description] [nvarchar](max) NULL,
	[description_ar] [nvarchar](max) NULL,
	[type] [nvarchar](255) NULL,
	[id_autorisation] [int] NULL,
	[compte_id] [int] NULL,
	[id_evaluation] [int] NULL,
	[nbr] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_reponse]    Script Date: 12/10/2021 14:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_reponse](
	[id_question] [int] NOT NULL,
	[id_reponse] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reponse]    Script Date: 12/10/2021 14:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reponse](
	[id_reponse] [int] IDENTITY(1,1) NOT NULL,
	[date_pub] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[description] [nvarchar](max) NULL,
	[heur_pub] [nvarchar](255) NULL,
	[compte_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_reponse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (42, NULL, N'Quel est le coût de la procédure de l’EIE ?', N'', N'2', NULL, 1, 4, 1)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (43, NULL, N'Quelles sont les étapes d’obtention de la Décision d’Acceptabilité Environnementale ?', N'', N'2', NULL, 1, 4, 2)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (44, NULL, N'Quels sont les documents nécessaires à l’obtention de l’acceptabilité environnementale des projets soumis à l’EIE ?', N'', N'2', NULL, 1, 4, 3)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (45, NULL, N'Quel est le contenu du rapport d’Etude d’Impact sur l’Environnement (EIE) et du cahier des charges ?', N'', N'2', NULL, 1, 4, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (46, NULL, N'Quels sont les projets assujettis à l’EIE ?', N'', N'2', NULL, 1, 4, 5)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (47, NULL, N'Quel est le cadre juridique et les documents de référence des EIE ?', N'', N'2', NULL, 1, 4, 6)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (48, NULL, N'Qu’est-ce que l’Etude d’Impact sur l’Environnement ?', N'', N'2', NULL, 1, 4, 7)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (49, CAST(N'2021-02-19T15:54:03.7600000' AS DateTime2), N'Qu’est-ce que l’Evaluation Environnementale (A intégrer avant la définition de l’EIE)?', NULL, N'1', 1, 1, NULL, 8)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (50, CAST(N'2021-02-19T15:53:59.4880000' AS DateTime2), N'Qu’est-ce que la Notice d’Impact sur l’Environnement (NIE) ?', NULL, N'2', NULL, 1, 3, 9)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (51, NULL, N'Qu’est-ce que l’Audit Environnemental (AE) ?', N'ما هي مراحل مسطرة دراسة التأثير على البيئة؟', N'2', NULL, 1, 4, 10)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (52, CAST(N'2021-02-19T17:29:04.5310000' AS DateTime2), N'Quels sont les projets assujettis à la NIE?', N'ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟', N'1', NULL, 1, NULL, 11)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (53, NULL, N'', N'ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟', N'2', NULL, 1, 4, 12)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (54, NULL, N'', N' ما هو مضمون دراسة التأثير على البيئة و برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي؟', N'2', NULL, 1, 4, 13)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (55, NULL, N'', N'ما هي المشاريع الخاضعة لدراسة التأثير على البيئة؟', N'2', NULL, 1, 4, 14)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (56, NULL, N'', N'ما هو المرجع القانوني لهذه المسطرة؟', N'2', NULL, 1, 4, 15)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (57, NULL, N'', N'ما هي دراسة التأثير على البيئة؟', N'2', NULL, 1, 4, 16)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (58, CAST(N'2021-02-22T09:06:44.5010000' AS DateTime2), N'ppp', N'', N'1', 1, 1, NULL, 17)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (59, NULL, N'Qu’est-ce que l’Evaluation Environnementale ?', N'', N'2', NULL, 1, 1, 18)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (60, NULL, N'Qu’est-ce que la Notice d’Impact sur l’Environnement (NIE) ?', N'', N'2', NULL, 1, 3, 19)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (61, NULL, N'Qu’est-ce que l’Audit Environnemental (AE) ?', N'', N'2', NULL, 1, 2, 20)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (66, NULL, N'Quel est le cadre juridique de l’Evaluation Environnementale ?', N'', N'2', NULL, 1, 1, 21)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (67, NULL, N'Quel est le cadre juridique de la NIE ?', N'', N'2', NULL, 1, 3, 22)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (68, NULL, N'Quels sont les projets assujettis à la NIE ?', N'', N'2', NULL, 1, 3, 23)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (69, NULL, N'Quel est le document nécessaire à l’obtention de l’acceptabilité environnementale des projets soumis à la NIE ?', N'', N'2', NULL, 1, 3, 24)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (70, NULL, N'Quelles sont les étapes d’obtention de la Décision d’Acceptabilité Environnementale ?', N'', N'2', NULL, 1, 3, 25)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (71, NULL, N'Quel est le coût de la procédure de la NIE ?', N'', N'2', NULL, 1, 3, 26)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (72, NULL, N'Quel est le cadre juridique de l’AE ?', N'', N'2', NULL, 1, 2, 27)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (73, NULL, N'- Quelles sont les étapes d’obtention du Certificat de conformité Environnementale ?', N'', N'2', NULL, 1, 2, 28)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (74, NULL, N'Quelles sont les documents nécessaires à l’obtention du Certificat de conformité Environnementale ?', N'', N'2', NULL, 1, 2, 29)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (75, NULL, N'Quel est le coût de la procédure de l’AE?', N'', N'2', NULL, 1, 2, 30)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (76, NULL, N'', N'ما هي أنواع النفايات المعنية برخصة استيراد النفايات من المنطقة الحرة؟', N'1', 1, 1, NULL, 31)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (77, NULL, N'', N' ما هو الإطار القانوني لاستيراد النفايات من المنطقة الحرة؟', N'1', 1, 1, NULL, 32)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (78, NULL, N'', N'ما هي الوثائق الضرورية للحصول على رخصة استيراد النفايات بالمنطقة الحرة؟', N'1', 1, 1, NULL, 33)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (79, NULL, N'', N'ما هي مراحل الحصول على رخصة استيراد النفايات بالمنطقة الحرة؟', N'1', 1, 1, NULL, 34)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (80, NULL, N'', N'ما هي مدة صلاحية رخصة استيراد النفايات بالمنطقة الحرة؟', N'1', 1, 1, NULL, 35)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (81, NULL, N'', N'ما هي أنواع النفايات المعنية برخصة استيراد النفايات من بلد أجنبي؟', N'1', 3, 1, NULL, 36)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (82, NULL, N'', N'ما هو الإطار القانوني لاستيراد النفايات من بلد أجنبي؟', N'1', 3, 1, NULL, 37)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (83, NULL, N'', N'ما هي الوثائق الضرورية للحصول على رخصة استيراد النفايات من بلد أجنبي؟', N'1', 3, 1, NULL, 38)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (84, NULL, N'', N'ما هي مراحل الحصول على رخصة استيراد النفايات من بلد أجنبي؟', N'1', 3, 1, NULL, 39)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (85, NULL, N'', N' ما هي مدة صلاحية رخصة استيراد النفايات من بلد أجنبي؟', N'1', 3, 1, NULL, 41)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (86, NULL, N'', N'ما هي أنواع النفايات المعنية برخصة تصدير النفايات؟', N'1', 6, 1, NULL, 42)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (87, NULL, N'', N'ما هو الإطار القانوني لتصدير النفايات؟', N'1', 6, 1, NULL, 43)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (88, NULL, N'', N'ما هي الوثائق الضرورية للحصول على رخصة تصدير النفايات؟', N'1', 6, 1, NULL, 44)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (89, NULL, N'', N'ما هي مراحل الحصول على رخصة تصدير النفايات؟', N'1', 6, 1, NULL, 45)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (90, NULL, N'', N'ما هي مدة صلاحية رخصة تصدير النفايات؟', N'1', 6, 1, NULL, 46)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (91, NULL, N'', N'ما هو الإطار القانوني لعبور النفايات؟', N'1', 7, 1, NULL, 47)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (92, NULL, N'', N' ما هي الوثائق الضرورية للحصول على رخصة عبور النفايات؟', N'1', 7, 1, NULL, 48)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (93, NULL, N'', N'ما هي مراحل الحصول على رخصة عبور النفايات؟', N'1', 7, 1, NULL, 49)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (94, NULL, N'', N'ما هي مدة صلاحية رخصة عبور النفايات؟', N'1', 7, 1, NULL, 50)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (95, NULL, N'', N'ما هي أنواع النفايات المعنية برخصة جمع ونقل النفايات؟', N'1', 2, 1, NULL, 51)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (96, NULL, N'', N'ما هو الإطار القانوني لجمع ونقل النفايات؟', N'1', 2, 1, NULL, 52)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (97, NULL, N'', N'ما هي الوثائق الضرورية للحصول على رخصة جمع ونقل النفايات؟', N'1', 2, 1, NULL, 53)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (98, NULL, N'', N'ما هي مراحل الحصول على رخصة جمع ونقل النفايات؟', N'1', 2, 1, NULL, 54)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (99, NULL, N'', N'ما هي مدة صلاحية رخصة جمع ونقل النفايات؟', N'1', 2, 1, NULL, 55)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (100, NULL, N'', N'ما هي أنواع النفايات المعنية برخصة منشأة معالجة النفايات الخطرة؟', N'1', 4, 1, NULL, 56)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (101, NULL, N'', N'ما هو الإطار القانوني لمنشأة معالجة النفايات الخطرة؟', N'1', 4, 1, NULL, 57)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (102, NULL, N'', N'ما هي الوثائق الضرورية للحصول على رخصة منشأة معالجة النفايات الخطرة؟', N'1', 4, 1, NULL, 58)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (103, NULL, N'', N'ما هي مراحل الحصول على رخصة منشأة معالجة النفايات الخطرة؟', N'1', 4, 1, NULL, 59)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (104, NULL, N'', N'ما هي مدة صلاحية رخصة منشأة معالجة النفايات الخطرة؟', N'1', 4, 1, NULL, 60)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (105, NULL, N'', N'ما هو محتوى دفتر التحملات؟ ', N'3', NULL, 1, NULL, 61)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (106, NULL, N'', N'ما هي تكلفة مختلف المساطير؟', N'3', NULL, 1, NULL, 62)
SET IDENTITY_INSERT [dbo].[question] OFF
GO
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (42, 126)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (43, 125)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (59, 119)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (66, 120)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (48, 121)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (47, 122)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (46, 123)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (44, 124)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (60, 128)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (67, 130)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (68, 131)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (69, 132)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (71, 134)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (61, 135)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (72, 137)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (73, 138)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (74, 139)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (75, 140)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (76, 172)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (77, 173)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (78, 220)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (79, 221)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (80, 176)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (81, 177)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (82, 178)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (91, 187)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (94, 190)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (95, 191)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (96, 192)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (99, 195)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (100, 196)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (101, 197)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (104, 200)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (105, 209)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (106, 208)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (85, 181)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (86, 182)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (87, 183)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (90, 186)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (70, 133)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (45, 109)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (49, 110)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (50, 111)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (51, 112)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (53, 97)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (54, 106)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (55, 95)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (56, 94)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (57, 93)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (58, 92)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (83, 222)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (84, 223)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (88, 224)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (89, 225)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (92, 226)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (93, 227)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (97, 228)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (98, 229)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (102, 230)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (103, 231)
GO
SET IDENTITY_INSERT [dbo].[reponse] ON 

INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (43, N'15-02-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction d’un dossier EIE. Cependant les documents de l’EIE et les frais de l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge du pétitionnaire selon le Décret n° 2-04-564 du 5 kaada 1429 (4 novembre 2008) fixant les modalités d''organisation et de déroulement de l''enquête publique relative aux projets soumis aux études d''impact sur l''environnement.', N'10 : 19', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (44, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="${pageContext.request.contextPath}/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental. 

	</p>
', N'10 : 31', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (45, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental. 

	</p>', N'10 : 35', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (46, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental.
	</p>', N'10 : 47', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (47, N'15-02-2021', NULL, N'<ol>
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 49', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (48, N'15-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 50', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (49, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (50, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (51, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (52, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
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

<h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> Document téléchargeable.', N'11 : 0', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (53, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (54, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (55, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (56, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (57, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (58, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (59, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (60, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (61, N'15-02-2021', NULL, N'<ol class="style_number style_number_sub">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (62, N'15-02-2021', NULL, N'<ol class="style_number style_number_sub">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (63, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (64, N'15-02-2021', NULL, N'	<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (65, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (66, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (67, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (68, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (69, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (70, N'15-02-2021', NULL, N'<ol class="style_number">
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
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (71, N'15-02-2021', NULL, N'<ol class="style_number">
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
        <ul class="style_square">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p>3.2 - Industrie de l''énergie : </p>
        <ul class="style_square">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p>3.3 - Industrie chimique  </p>
        <ul class="style_square">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''amiante </li>
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
            <li>Usines de farine de poisson et d''huile de poisson ; </li>
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
        <p>3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
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
</ol>', N'11 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (72, N'15-02-2021', NULL, N'<ol class="style_number">
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
        <p class="pb-1">3.1 - Industrie extractive </p>
        <ul class="style_square ml-5">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p class="pb-1">3.2 - Industrie de l''énergie : </p>
        <ul class="style_square ml-5">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p class="pb-1">3.3 - Industrie chimique  </p>
        <ul class="style_square ml-5">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''amiante </li>
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
            <li>Usines de farine de poisson et d''huile de poisson ; </li>
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
            <li>Industrie de textile et teintureries ; </li>
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
</ol>', N'12 : 1', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (73, N'15-02-2021', NULL, N'<ol class="style_number">
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
        <p class="pb-1mb-1">3.1 - Industrie extractive </p>
        <ul class="style_square ml-5">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p class="mb-1">3.2 - Industrie de l''énergie : </p>
        <ul class="style_square ml-5">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p class="mb-1">3.3 - Industrie chimique  </p>
        <ul class="style_square ml-5">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''amiante </li>
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
            <li>Usines de farine de poisson et d''huile de poisson ; </li>
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
            <li>Industrie de textile et teintureries ; </li>
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
</ol>', N'12 : 3', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (74, N'15-02-2021', NULL, N'<ul class="style_square"><li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>

<li>Loi n° 49-17 relative à l''evaluation environnementale ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>

</ul>', N'12 : 5', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (75, N'15-02-2021', NULL, N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement »', N'12 : 5', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (76, N'15-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>', N'12 : 6', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (77, N'15-02-2021', NULL, N'reponse 3', N'12 : 27', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (78, N'15-02-2021', NULL, N'reponse 2', N'12 : 28', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (79, N'19-02-2021', NULL, N' <img src="/assets/images/arab_6.png">', N'16 : 20', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (80, N'19-02-2021', NULL, N'<div>
    <ol>
        <li> استمارة الإشعار بالمشروع: أنظر النموذج على الموقع.</li>
        <li> البحث العمومي: انظر ظهير رقم 2-04-564   ل 5 دي القعدة 1429 الموافق 4 نونبر 2008 الدي ينظم ويحدد شروط البحث العموم الخاص للمشاريع المعنية   بدراسة التأثير على البيئة.</li>
        <li> دراسة التأثير على البيئة.</li>
        <li>برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي. </li>
    </ol>
</div>', N'17 : 30', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (81, N'19-02-2021', NULL, N'	 <img src="/assets/images/arab_5.png">
', N'17 : 42', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (82, N'19-02-2021', NULL, N'
	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'17 : 48', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (83, N'19-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> Document téléchargeable.', N'17 : 56', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (84, N'19-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'17 : 57', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (85, N'19-02-2021', NULL, N'Voir la liste d’assujettissement annexée à la loi n°12-03 relative aux études d''impact sur l''environnement.', N'17 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (86, N'19-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'18 : 2', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (87, N'19-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'18 : 3', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (88, N'19-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'18 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (89, N'19-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'18 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (90, N'19-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'18 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (91, N'19-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'18 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (92, N'20-02-2021', NULL, N'poipoio', N'17 : 45', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (93, N'22-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'10 : 57', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (94, N'22-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'10 : 57', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (95, N'22-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'10 : 57', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (96, N'22-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (97, N'22-02-2021', NULL, N'<div>
    <ol>
        <li> استمارة الإشعار بالمشروع: أنظر النموذج على الموقع.</li>
        <li> البحث العمومي: انظر ظهير رقم 2-04-564   ل 5 دي القعدة 1429 الموافق 4 نونبر 2008 الدي ينظم ويحدد شروط البحث العموم الخاص للمشاريع المعنية   بدراسة التأثير على البيئة.</li>
        <li> دراسة التأثير على البيئة.</li>
        <li>برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي. </li>
    </ol>
</div>', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (98, N'22-02-2021', NULL, N' <img src="/assets/images/arab_6.png">', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (99, N'22-02-2021', NULL, N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement »', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (100, N'22-02-2021', NULL, N'Voir la liste d’assujettissement suivante', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (101, N'22-02-2021', NULL, N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>', N'10 : 59', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (102, N'22-02-2021', NULL, N'<img src="/assets/images/EIE_organigrame.png">', N'10 : 59', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (103, N'22-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 59', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (104, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> Document téléchargeable.', N'10 : 59', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (105, N'22-02-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction d’un dossier EIE. Cependant les documents de l’EIE et les frais de l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge du pétitionnaire selon le Décret n° 2-04-564 du 5 kaada 1429 (4 novembre 2008) fixant les modalités d''organisation et de déroulement de l''enquête publique relative aux projets soumis aux études d''impact sur l''environnement.', N'11 : 0', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (106, N'22-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
   <li class="text-underline" > <a href="/assets/images/arab_5.png" download="doc.png" target="_blank">برنامج المراقبة والتتبع البيئي</a> </li>
</ol>
', N'11 : 2', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (107, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>', N'11 : 30', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (108, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>', N'11 : 30', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (109, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/EIE_organigrame.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/EIE_organigrame.png" download="doc.png" targer="_blank">Document téléchargeable.</a></p>', N'11 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (110, N'22-06-2021', NULL, N'L’Evaluation environnementale est une étude intégrant les aspects environnementaux et sociaux d’un projet, plan, programme ou politique publique pour évaluer ses impacts prévisibles et permet l’analyse et la justification des options acceptables. Elle comprend l’évaluation stratégique environnementale, l’étude d’impact sur l’environnement, la notice d’impact sur l’environnement et l’audit environnemental', N'11 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (111, N'22-06-2021', NULL, N'La Notice d’Impact sur l’Environnement est une étude concise élaborée avant la réalisation des projets non assujettis à l’étude d’impact sur l’environnement qui risquent d’avoir de faibles impacts négatifs sur l’environnement à cause de leur durée, leur nature, leur dimension et leur lieu d’implantation. Elle permet d’évaluer ces impacts et de déterminer les mesures adéquates pour éviter, atténuer ou compenser lesdits impacts.', N'11 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (112, N'22-06-2021', NULL, N'L’Audit environnemental est une étude qui permet l’évaluation des impacts directs et indirects, temporaires ou permanents des unités industrielles ou activités existantes avant la date de publication de cette loi au bulletin officiel et qui sont incluses dans la liste des projets soumis à l’étude d’impact sur l’environnement afin de déterminer les mesures nécessaires à prendre pour se conformer aux lois et normes environnementales en vigueur ;', N'11 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (113, N'28-06-2021', NULL, N'L’Evaluation environnementale est une étude intégrant les aspects environnementaux et sociaux d’un projet, plan, programme
ou politique publique pour évaluer ses impacts prévisibles et permet l’analyse et la justification des options acceptables. Elle
comprend l’évaluation stratégique environnementale, l’étude d’impact sur l’environnement, la notice d’impact sur
l’environnement et l’audit environnemental', N'17 : 13', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (114, N'28-06-2021', NULL, N'Loi n°49-17 relative à l’Evaluation environnementale
    <a target="_blank"  href="/assets/file/Lois_N49_17.pdf">
        <img src="/assets/images/file_PDF.png" width="40px">
    </a>
', N'17 : 17', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (115, N'28-06-2021', NULL, N'Loi n°49-17 relative à l’Evaluation environnementale
    <a target="_blank"  href="/assets/file/Lois_N49_17.pdf">
        <img src="/assets/images/file_PDF.png" width="40px">
    </a>', N'17 : 17', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (116, N'28-06-2021', NULL, N'Loi n°49-17 relative à l’Evaluation environnementale
    <a target="_blank"  href="/assets/file/Lois_N49_17.pdf">
        <img src="/assets/images/file_PDF.png" width="40px">
    </a>', N'17 : 18', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (117, N'28-06-2021', NULL, N'Loi n°49-17 relative à l’Evaluation environnementale
    <a target="_blank"  href="/assets/file/Lois_N49_17.pdf">
        <img src="/assets/images/file_PDF.png" width="40px">
    </a>', N'17 : 18', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (118, N'28-06-2021', NULL, N'Loi n°49-17 relative à l’Evaluation environnementale
    <a target="_blank"  href="/assets/file/Lois_N49_17.pdf">
        <img src="/assets/images/file_PDF.png" width="40px">
    </a>', N'17 : 25', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (119, N'28-06-2021', NULL, N'L’Evaluation environnementale est une étude intégrant les aspects environnementaux et sociaux d’un projet, plan, programme
ou politique publique pour évaluer ses impacts prévisibles et permet l’analyse et la justification des options acceptables. Elle
comprend l’évaluation stratégique environnementale, l’étude d’impact sur l’environnement, la notice d’impact sur
l’environnement et l’audit environnemental', N'17 : 26', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (120, N'28-06-2021', NULL, N'Loi n°49-17 relative à l’Evaluation environnementale
    <a target="_blank"  href="/assets/file/Lois_N49_17.pdf">
        <img src="/assets/images/file_PDF.png" width="40px">
    </a>', N'17 : 28', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (121, N'28-06-2021', NULL, N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de
l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement ».', N'17 : 33', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (122, N'28-06-2021', NULL, N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>', N'17 : 38', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (123, N'28-06-2021', NULL, N'Voir la liste d’assujettissement <a download target="_blank" href="/assets/file/doc_assuj.docx">« suivante »</a>.', N'17 : 41', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (124, N'28-06-2021', NULL, N'1-Formulaire renseigné de la demande de l’enquête publique <a href="/assets/file/frm_ep.doc" download target="_blank">(télécharger)</a><br>
2-Rapport de l’EIE ;<br>
3-Cahier des charges environnementales <a href="/assets/file/cdc.docx" download target="_blank">(télécharger)</a>', N'17 : 46', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (125, N'28-06-2021', NULL, N'<img src="/assets/images/EIE_organigrame.png">', N'17 : 51', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (126, N'28-06-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction du dossier. Cependant les documents de l’EIE et les frais de
l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge
du pétitionnaire.', N'17 : 52', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (127, N'28-06-2021', NULL, N'Qu’est-ce que la Notice d’Impact sur l’Environnement (NIE) ?', N'17 : 53', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (128, N'28-06-2021', NULL, N'La Notice d’Impact sur l’Environnement est une étude concise élaborée avant la réalisation des projets non assujettis à l’étude
d’impact sur l’environnement qui risquent d’avoir de faibles impacts négatifs sur l’environnement à cause de leur durée, leur
nature, leur dimension et leur lieu d’implantation. Elle permet d’évaluer ces impacts et de déterminer les mesures adéquates
pour éviter, atténuer ou compenser lesdits impacts.', N'17 : 54', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (129, N'28-06-2021', NULL, N'dddd', N'17 : 55', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (130, N'28-06-2021', NULL, N'Loi n°49-17 relative à l’Evaluation environnementale
    <a target="_blank"  href="/assets/file/Lois_N49_17.pdf">
        <img src="/assets/images/file_PDF.png" width="40px">
    </a>', N'17 : 55', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (131, N'28-06-2021', NULL, N'Voir la liste d’assujettissement <a download target="_blank" href="/assets/file/doc_assujNotice.docx">« suivante »</a>.', N'17 : 57', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (132, N'28-06-2021', NULL, N'Rapport de la NIE', N'17 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (133, N'28-06-2021', NULL, N'<img src="/assets/images/notice_logigrame.PNG">', N'18 : 0', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (134, N'28-06-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction du dossier de la NIE', N'18 : 1', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (135, N'28-06-2021', NULL, N'L’Audit environnemental est une étude qui permet l’évaluation des impacts directs et indirects, temporaires ou permanents
des unités industrielles ou activités existantes avant la date de publication de cette loi au bulletin officiel et qui sont incluses
dans la liste des projets soumis à l’étude d’impact sur l’environnement afin de déterminer les mesures nécessaires à prendre
pour se conformer aux lois et normes environnementales en vigueur ;', N'18 : 2', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (136, N'28-06-2021', NULL, N'Loi n°49-17 relative à l’Evaluation environnementale
    <a target="_blank"  href="/assets/file/Lois_N49_17.pdf">
        <img src="/assets/images/file_PDF.png" width="40px">
    </a>', N'18 : 3', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (137, N'28-06-2021', NULL, N'Loi n°49-17 relative à l’Evaluation environnementale
    <a target="_blank"  href="/assets/file/Lois_N49_17.pdf">
        <img src="/assets/images/file_PDF.png" width="40px">
    </a>', N'18 : 4', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (138, N'28-06-2021', NULL, N'<img src="/assets/images/audit_organigrame.png">
', N'18 : 5', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (139, N'28-06-2021', NULL, N'1-Demande et dossier d’obtention du Certificat de conformité Environnementale<a href="/assets/file/frm_conforme.docx" download target="_blank">(télécharger)</a><br>
2-Rapport de l’EIE ;<br>
3-Cahier des charges environnementales <a href="/assets/file/cdc.docx" download target="_blank">(télécharger)</a>', N'18 : 10', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (140, N'28-06-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction du dossier de l’AE.', N'18 : 10', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (141, N'06-10-2021', NULL, N'جميع أنواع النفايات الخطرة والغير خطرة (المصنف المغربي للنفايات).', NULL, NULL)
GO
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (142, N'06-10-2021', NULL, N'<ul class="style_square">
    <li>  القانون 28.00 المتعلق بدبير النفايات والتخلص منها. </li>
    <li>  مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة </li>
    <li> مرسوم رقم 2.17.587 صادر في 10 دجنبر 2018 لتحديد شروط وكيفيات استيراد تصدير وعبور النفايات (باب 2). </li>
    <li> قرار وزارة الطاقة والمعادن والبيئة رقم 1339 صادر في 14 يوليوز 2020 تحدد لائحة النفايات غير الخطرة الممكن الترخيص باستيرادها. </li>
    <li> قرار وزارة الطاقة والمعادن والبيئة رقم1340 صادر في 14 يوليوز2020 تحدد شروط وكيفيات استيراد تصدير وعبور النفايات. </li>
</ul>', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (143, N'06-10-2021', NULL, N'
        <li>يرجى الاطلاع على قسم إعداد النهج(الرابط) .</li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (144, N'06-10-2021', NULL, N'يرجى الاطلاع على قسم إعداد النهج (الرابط).', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (145, N'06-10-2021', NULL, N'  مدة صلاحية رخصة استيراد النفايات بالمنطقة الحرة هي شهران.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (146, N'06-10-2021', NULL, N'فقط النفايات غير الخطرة.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (147, N'06-10-2021', NULL, N'<ul class="style_square">
    <li>   القانون 28.00 المتعلق بدبير النفايات والتخلص منها  </li>
    <li>  مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة      </li>
    <li>  مرسوم رقم 2.17.587 صادر في 10 دجنبر 2018 لتحديد شروط وكيفيات استيراد تصدير وعبور النفايات (باب 2) </li>
    <li>قرار وزارة الطاقة والمعادن والبيئة رقم 1339 صادر في 14 يوليوز 2020 تحدد لائحة النفايات غير الخطرة الممكن الترخيص باستيرادها</li>
    <li>قرار وزارة الطاقة والمعادن والبيئة رقم1340 صادر في 14 يوليوز2020 تحدد شروط وكيفيات استيراد تصدير وعبور النفايات </li>
</ul>

', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (148, N'06-10-2021', NULL, N' <li>يرجى الاطلاع على قسم إعداد النهج(الرابط) .</li>
        <li>طلب من السلطة المختصة المعنية في دولة التصدير في حالة استيراد نفايات غير خطرة من بلد أجنبي</li>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل</li>
    <li> نسخة من الضمانة المالية   </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف </li>
<li>دفتر التحملات </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين</li>
<li>لائحة السلطات المختصة </li>
<li>سعر وحساب مبلغ الضمانة المالية </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات أو التخلص منها</li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة</li>
</ul>', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (149, N'06-10-2021', NULL, N'يرجى الاطلاع على قسم اعداد النهج (الرابط).', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (150, N'06-10-2021', NULL, N' مدة صلاحية رخصة استيراد النفايات من بلد أجنبي هي سنة', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (151, N'06-10-2021', NULL, N'   النفايات الخطرة حسب المصنف المغربي للنفايات التي لا يمكن معالجتها بالمنشآت المتواجدة بالمغرب.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (152, N'06-10-2021', NULL, N'<ul class="style_square">
    <li>  القانون 28.00 المتعلق بدبير النفايات والتخلص منها   </li>
    <li>  مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة</li>
    <li>  مرسوم رقم 2.17.587 صادر في 10 دجنبر 2018 لتحديد شروط وكيفيات استيراد تصدير وعبور النفايات (باب 2) </li>
    <li>  قرار وزارة الطاقة والمعادن والبيئة رقم 1339 صادر في 14 يوليوز 2020 تحدد لائحة النفايات غير الخطرة الممكن الترخيص باستيرادها   </li>
    <li>  قرار وزارة الطاقة والمعادن والبيئة رقم1340 صادر في 14 يوليوز2020 تحدد شروط وكيفيات استيراد تصدير وعبور النفايات   </li>
</lu>', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (153, N'06-10-2021', NULL, N'<li>  يرجى الاطلاع على قسم إعداد النهج (الرابط).   </li>

<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل</li>
    <li>  أسباب التصدير </li>
    <li> نسخة من العقد المبرم بين مصدر النفايات والمستورد او مستغل منشاة التخلص من النفايات الخطرة او تثمينها الموجهة اليها النفايات المذكورة   </li>
    <li>  شهادة الموافقة المبدئية  </li>
<li>  خصائص النفايات </li>
<li> وصف كيفيات انتاج النفايات   </li>
<li>  الضمانة المالية     </li>
<li>  لائحة الناقلين   </li>
<li>  مسار النفايات  </li>
<li>  تامين عن المسؤولية المدنية للناقلين   </li>
<li>  تامين عن المسؤولية المدنية للشركة المغربية    </li>
<li>  تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة    </li>
</lu>', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (154, N'06-10-2021', NULL, N'يرجى الاطلاع على قسم إعداد النهج (الرابط).', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (155, N'06-10-2021', NULL, N'مدة صلاحية رخصة تصدير النفايات هي سنة.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (156, N'06-10-2021', NULL, N'مرسوم رقم 2.17.587 صادر في 10 دجنبر 2018 لتحديد شروط وكيفيات استيراد تصدير وعبور النفايات (باب 6).', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (157, N'06-10-2021', NULL, N'<li>  يرجى الاطلاع على قسم إعداد النهج (الرابط).   </li>

<ul class="style_square">
    <li>  طلب الترخيص بالعبور (شهادة الموافقة على النفايات من طرف شركة المعالجة او التخلص)  </li>
    <li> موافقة البلد المستورد</li>
    <li>  موافقة البلد المصدر </li>
    <li>وثيقة الاخطار    </li>
    <li>  وثيقة النقل  </li>
<li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة </li>
<li>وثيقة التعريف بالنفايات    </li>
<li>  سعر وحساب مبلغ الضمانة المالية    </li>
<li>  مسار النفايات   </li>
<li>  موانئ العبور   </li>
<li>  السلطات المعنية   </li>
<li> لائحة الناقلين عن طريق البحر    </li>
<li> تأمين الناقلين عن طريق البحر    </li>
<li> تأمين الناقلين عن طريق البحرتأمين عن المسؤولية المدنية للشركة المغربية     </li>
</lu>', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (158, N'06-10-2021', NULL, N' يرجى الاطلاع على قسم إعداد النهج (الرابط).', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (159, N'06-10-2021', NULL, N'مدة صلاحية رخصة تصدير النفايات هي سنة.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (160, N'06-10-2021', NULL, N'النفايات الخطرة المذكورة بالمصنف المغربي للنفايات.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (161, N'06-10-2021', NULL, N'<ul class="style_square">
    <li>  القانون 28.00 المتعلق بدبير النفايات والتخلص منها  </li>
    <li> مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة</li>
    <li>  مرسوم رقم 2.14.85 صادر في 20 يناير2015 المتعلق بتدبير النفايات الخطرة (باب 3) </li>
    <li>قرار رقم 3184 صادر في 23 شتنبر 2015   </li>
</ul>
', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (162, N'06-10-2021', NULL, N'
<li>  يرجى الاطلاع على قسم إعداد النهج (الرابط).  </li>
<ul class="style_square">
    <li>  نسخة من بطاقة التعريف الوطنية  </li>
    <li> نوع المركبات والحاويات المستعملة لنقل النفايات الخطرة      </li>
    <li>  عدد المركبات والحاويات (مرفقة بصور) </li>
    <li>رقم تسجيل المركبة ورقم الهيكل </li>
    <li>الوزن الاجمالي للحمولة والوزن الصافي لكل مركبة  </li>
<li>سعة الحاويات والمركبات بالكتلة في حالة نفايات صلبة وبالحجم في الحالات الأخرى</li>
<li>المواد المكونة للحاويات وكل جزء من المركبات المستعملة للنقل وتشمل مواد التغطية </li>
<li>مكان إيداع المركبات (معلل بعقد و/أو سند ملكية الأرض)</li>
<li>تصريح عن طبيعة النفايات الخطرة من طرف صاحب الطلب </li>
<li>الالتزام بمزاولة أنشطة النفايات الخطرة ونقلها كنشاط رئيسي</li>
<li>وثيقة تحدد التدابير الوقائية</li>
<li>وثائق تثبت التأهيل وتكوين المستخدمين</li>
<li>نسخة من التأمين على المسؤولية المهنية للجامع الناقل</li>
<li>وثيقة تدل على القدرة المالية لمزاولة النشاط</li>
</ul>


', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (163, N'06-10-2021', NULL, N'  يرجى الاطلاع على قسم إعداد النهج (الرابط).', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (164, N'06-10-2021', NULL, N' مدة صلاحية رخصة جمع ونقل النفايات هي خمس سنوات.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (165, N'06-10-2021', NULL, N'   النفايات الخطيرة المذكورة بالمصنف المغربي للنفايات.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (166, N'06-10-2021', NULL, N'
<ul class="style_square">
    <li>   القانون 28.00 المتعلق بدبير النفايات والتخلص منها  </li>
    <li> نوع المركبات والحاويات المستعملة لنقل النفايات الخطرة      </li>
    <li>  مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة   </li>
    <li>  مرسوم رقم 2.14.85 صادر في 20 يناير2015 المتعلق بتدبير النفايات الخطرة (باب 4)  </li>
    <li>  قرار رقم3184 صادر في 23 شتنبر 2015  </li>
</ul>', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (167, N'06-10-2021', NULL, N'<li> يرجى الاطلاع على قسم إعداد النهج (الرابط).</li>
<ul class="style_square">
    
    <li> معلومات حول صاحب الطلب  </li>
    <li>  معلومات حول المنشاة ومكانها  </li>
    <li>طبيعة الأنشطة المراد مزاولتها وأنواع وكميات النفايات    </li>
    <li>  وثائق تثبت احترام المواصفات التقنية وكيفيات معالجة تخلص وتثمين النفايات المنصوص عليها في المادة 29 من المرسوم سالف الذكر (رخصة استغلال الوحدة المنتجة والمتخلصة من النفايات).  </li>
<li>  دراسة التأثير البيئية  </li>
<li>نسخة من قرار الموافقة البيئية  </li>
<li>  مخطط لموقع المنشأة مع بيان تخصيص مختلف مناطقها لا سيما الدرج والمنصات ومنافذ الإغاثة    </li>
<li>  وصف المنشأة وهيكلتها وطريقة عملها  </li>
<li>  وصف طرق المعالجة والتجهيزات المتعلقة ب :  </li>
</lu>
<ol>
<li>      -  القدرة على المعالجة والخدمات المقدمة من قبل المنشأة   </li>
<li>     -  نوع الأجهزة والاليات المستعملة في المنشاة  </li>
<li>     - أوقات الاستغلال وعدد فرق العمل ومؤهلاتهم وتكوينهم في مجال معالجة النفايات الخطرة      </li>
</ol>
<ul class="style_square">
    
    <li>مخطط المراقبة الذاتية لتدبير المنشأة وكذا وسائل تنفيذ هذا المخطط   </li>
    <li>  نسخة من الضمانة المالية   </li>
    <li>وثيقة تبين أن صاحب الموقع على علم بطبيعة الأنشطة المراد مزاولتها في حالة كراء      </li>
</lu>
', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (168, N'06-10-2021', NULL, N'   يرجى الاطلاع على قسم إعداد النهج (الرابط).', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (169, N'06-10-2021', NULL, N'  مدة صلاحية رخصة جمع ونقل النفايات هي خمس سنوات. ', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (170, N'06-10-2021', NULL, N'تحميل مثال دفتر التحملات.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (171, N'06-10-2021', NULL, N'ليس هناك تكاليف تفرض من طرف الإدارة للحصول على مختلف الرخص، جميع الرخص الممنوحة من طرف قطاع البيئة مجانية.', NULL, NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (172, N'7-10-2021', NULL, N'جميع أنواع النفايات الخطرة والغير خطرة (المصنف المغربي للنفايات).', N'15 : 7', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (173, N'7-10-2021', NULL, N'<ul class="style_square">
    <li>  القانون 28.00 المتعلق بدبير النفايات والتخلص منها. </li>
    <li>  مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة </li>
    <li> مرسوم رقم 2.17.587 صادر في 10 دجنبر 2018 لتحديد شروط وكيفيات استيراد تصدير وعبور النفايات (باب 2). </li>
    <li> قرار وزارة الطاقة والمعادن والبيئة رقم 1339 صادر في 14 يوليوز 2020 تحدد لائحة النفايات غير الخطرة الممكن الترخيص باستيرادها. </li>
    <li> قرار وزارة الطاقة والمعادن والبيئة رقم1340 صادر في 14 يوليوز2020 تحدد شروط وكيفيات استيراد تصدير وعبور النفايات. </li>
</ul>', N'15 : 8', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (174, N'7-10-2021', NULL, N'        <li>يرجى الاطلاع على قسم إعداد النهج(الرابط) .</li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'15 : 11', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (175, N'7-10-2021', NULL, N'يرجى الاطلاع على قسم إعداد النهج (الرابط).', N'15 : 12', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (176, N'7-10-2021', NULL, N'  مدة صلاحية رخصة استيراد النفايات بالمنطقة الحرة هي شهران.', N'15 : 12', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (177, N'7-10-2021', NULL, N'فقط النفايات غير الخطرة.', N'15 : 12', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (178, N'7-10-2021', NULL, N'<ul class="style_square">
    <li>   القانون 28.00 المتعلق بدبير النفايات والتخلص منها  </li>
    <li>  مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة      </li>
    <li>  مرسوم رقم 2.17.587 صادر في 10 دجنبر 2018 لتحديد شروط وكيفيات استيراد تصدير وعبور النفايات (باب 2) </li>
    <li>قرار وزارة الطاقة والمعادن والبيئة رقم 1339 صادر في 14 يوليوز 2020 تحدد لائحة النفايات غير الخطرة الممكن الترخيص باستيرادها</li>
    <li>قرار وزارة الطاقة والمعادن والبيئة رقم1340 صادر في 14 يوليوز2020 تحدد شروط وكيفيات استيراد تصدير وعبور النفايات </li>
</ul>

', N'15 : 13', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (179, N'7-10-2021', NULL, N' <li>يرجى الاطلاع على قسم إعداد النهج(الرابط) .</li>
        <li>طلب من السلطة المختصة المعنية في دولة التصدير في حالة استيراد نفايات غير خطرة من بلد أجنبي</li>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل</li>
    <li> نسخة من الضمانة المالية   </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف </li>
<li>دفتر التحملات </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين</li>
<li>لائحة السلطات المختصة </li>
<li>سعر وحساب مبلغ الضمانة المالية </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات أو التخلص منها</li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة</li>
</ul>', N'15 : 13', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (180, N'7-10-2021', NULL, N'يرجى الاطلاع على قسم اعداد النهج (الرابط).', N'15 : 14', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (181, N'7-10-2021', NULL, N' مدة صلاحية رخصة استيراد النفايات من بلد أجنبي هي سنة', N'15 : 14', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (182, N'7-10-2021', NULL, N'   النفايات الخطرة حسب المصنف المغربي للنفايات التي لا يمكن معالجتها بالمنشآت المتواجدة بالمغرب.', N'15 : 15', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (183, N'7-10-2021', NULL, N'<ul class="style_square">
    <li>  القانون 28.00 المتعلق بدبير النفايات والتخلص منها   </li>
    <li>  مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة</li>
    <li>  مرسوم رقم 2.17.587 صادر في 10 دجنبر 2018 لتحديد شروط وكيفيات استيراد تصدير وعبور النفايات (باب 2) </li>
    <li>  قرار وزارة الطاقة والمعادن والبيئة رقم 1339 صادر في 14 يوليوز 2020 تحدد لائحة النفايات غير الخطرة الممكن الترخيص باستيرادها   </li>
    <li>  قرار وزارة الطاقة والمعادن والبيئة رقم1340 صادر في 14 يوليوز2020 تحدد شروط وكيفيات استيراد تصدير وعبور النفايات   </li>
</lu>', N'15 : 15', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (184, N'7-10-2021', NULL, N'<li>  يرجى الاطلاع على قسم إعداد النهج (الرابط).   </li>

<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل</li>
    <li>  أسباب التصدير </li>
    <li> نسخة من العقد المبرم بين مصدر النفايات والمستورد او مستغل منشاة التخلص من النفايات الخطرة او تثمينها الموجهة اليها النفايات المذكورة   </li>
    <li>  شهادة الموافقة المبدئية  </li>
<li>  خصائص النفايات </li>
<li> وصف كيفيات انتاج النفايات   </li>
<li>  الضمانة المالية     </li>
<li>  لائحة الناقلين   </li>
<li>  مسار النفايات  </li>
<li>  تامين عن المسؤولية المدنية للناقلين   </li>
<li>  تامين عن المسؤولية المدنية للشركة المغربية    </li>
<li>  تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة    </li>
</lu>', N'15 : 16', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (185, N'7-10-2021', NULL, N'يرجى الاطلاع على قسم إعداد النهج (الرابط).', N'15 : 16', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (186, N'7-10-2021', NULL, N'مدة صلاحية رخصة تصدير النفايات هي سنة.', N'15 : 16', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (187, N'7-10-2021', NULL, N'مرسوم رقم 2.17.587 صادر في 10 دجنبر 2018 لتحديد شروط وكيفيات استيراد تصدير وعبور النفايات (باب 6).', N'15 : 17', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (188, N'7-10-2021', NULL, N'<li>  يرجى الاطلاع على قسم إعداد النهج (الرابط).   </li>

<ul class="style_square">
    <li>  طلب الترخيص بالعبور (شهادة الموافقة على النفايات من طرف شركة المعالجة او التخلص)  </li>
    <li> موافقة البلد المستورد</li>
    <li>  موافقة البلد المصدر </li>
    <li>وثيقة الاخطار    </li>
    <li>  وثيقة النقل  </li>
<li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة </li>
<li>وثيقة التعريف بالنفايات    </li>
<li>  سعر وحساب مبلغ الضمانة المالية    </li>
<li>  مسار النفايات   </li>
<li>  موانئ العبور   </li>
<li>  السلطات المعنية   </li>
<li> لائحة الناقلين عن طريق البحر    </li>
<li> تأمين الناقلين عن طريق البحر    </li>
<li> تأمين الناقلين عن طريق البحرتأمين عن المسؤولية المدنية للشركة المغربية     </li>
</lu>', N'15 : 17', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (189, N'7-10-2021', NULL, N' يرجى الاطلاع على قسم إعداد النهج (الرابط).', N'15 : 17', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (190, N'7-10-2021', NULL, N'مدة صلاحية رخصة تصدير النفايات هي سنة.', N'15 : 18', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (191, N'7-10-2021', NULL, N'النفايات الخطرة المذكورة بالمصنف المغربي للنفايات.', N'15 : 18', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (192, N'7-10-2021', NULL, N'<ul class="style_square">
    <li>  القانون 28.00 المتعلق بدبير النفايات والتخلص منها  </li>
    <li> مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة</li>
    <li>  مرسوم رقم 2.14.85 صادر في 20 يناير2015 المتعلق بتدبير النفايات الخطرة (باب 3) </li>
    <li>قرار رقم 3184 صادر في 23 شتنبر 2015   </li>
</ul>
', N'15 : 19', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (193, N'7-10-2021', NULL, N'<li>  يرجى الاطلاع على قسم إعداد النهج (الرابط).  </li>
<ul class="style_square">
    <li>  نسخة من بطاقة التعريف الوطنية  </li>
    <li> نوع المركبات والحاويات المستعملة لنقل النفايات الخطرة      </li>
    <li>  عدد المركبات والحاويات (مرفقة بصور) </li>
    <li>رقم تسجيل المركبة ورقم الهيكل </li>
    <li>الوزن الاجمالي للحمولة والوزن الصافي لكل مركبة  </li>
<li>سعة الحاويات والمركبات بالكتلة في حالة نفايات صلبة وبالحجم في الحالات الأخرى</li>
<li>المواد المكونة للحاويات وكل جزء من المركبات المستعملة للنقل وتشمل مواد التغطية </li>
<li>مكان إيداع المركبات (معلل بعقد و/أو سند ملكية الأرض)</li>
<li>تصريح عن طبيعة النفايات الخطرة من طرف صاحب الطلب </li>
<li>الالتزام بمزاولة أنشطة النفايات الخطرة ونقلها كنشاط رئيسي</li>
<li>وثيقة تحدد التدابير الوقائية</li>
<li>وثائق تثبت التأهيل وتكوين المستخدمين</li>
<li>نسخة من التأمين على المسؤولية المهنية للجامع الناقل</li>
<li>وثيقة تدل على القدرة المالية لمزاولة النشاط</li>
</ul>


', N'15 : 19', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (194, N'7-10-2021', NULL, N'  يرجى الاطلاع على قسم إعداد النهج (الرابط).', N'15 : 19', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (195, N'7-10-2021', NULL, N' مدة صلاحية رخصة جمع ونقل النفايات هي خمس سنوات.', N'15 : 20', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (196, N'7-10-2021', NULL, N'   النفايات الخطيرة المذكورة بالمصنف المغربي للنفايات.', N'15 : 22', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (197, N'7-10-2021', NULL, N'<ul class="style_square">
    <li>   القانون 28.00 المتعلق بدبير النفايات والتخلص منها  </li>
    <li> نوع المركبات والحاويات المستعملة لنقل النفايات الخطرة      </li>
    <li>  مرسوم رقم 2.07.253 يتعلق بتصنيف النفايات وتحديد لائحة النفايات الخطرة   </li>
    <li>  مرسوم رقم 2.14.85 صادر في 20 يناير2015 المتعلق بتدبير النفايات الخطرة (باب 4)  </li>
    <li>  قرار رقم3184 صادر في 23 شتنبر 2015  </li>
</ul>', N'15 : 22', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (198, N'7-10-2021', NULL, N'<li> يرجى الاطلاع على قسم إعداد النهج (الرابط).</li>
<ul class="style_square">
    
    <li> معلومات حول صاحب الطلب  </li>
    <li>  معلومات حول المنشاة ومكانها  </li>
    <li>طبيعة الأنشطة المراد مزاولتها وأنواع وكميات النفايات    </li>
    <li>  وثائق تثبت احترام المواصفات التقنية وكيفيات معالجة تخلص وتثمين النفايات المنصوص عليها في المادة 29 من المرسوم سالف الذكر (رخصة استغلال الوحدة المنتجة والمتخلصة من النفايات).  </li>
<li>  دراسة التأثير البيئية  </li>
<li>نسخة من قرار الموافقة البيئية  </li>
<li>  مخطط لموقع المنشأة مع بيان تخصيص مختلف مناطقها لا سيما الدرج والمنصات ومنافذ الإغاثة    </li>
<li>  وصف المنشأة وهيكلتها وطريقة عملها  </li>
<li>  وصف طرق المعالجة والتجهيزات المتعلقة ب :  </li>
</lu>
<ol>
<li>      -  القدرة على المعالجة والخدمات المقدمة من قبل المنشأة   </li>
<li>     -  نوع الأجهزة والاليات المستعملة في المنشاة  </li>
<li>     - أوقات الاستغلال وعدد فرق العمل ومؤهلاتهم وتكوينهم في مجال معالجة النفايات الخطرة      </li>
</ol>
<ul class="style_square">
    
    <li>مخطط المراقبة الذاتية لتدبير المنشأة وكذا وسائل تنفيذ هذا المخطط   </li>
    <li>  نسخة من الضمانة المالية   </li>
    <li>وثيقة تبين أن صاحب الموقع على علم بطبيعة الأنشطة المراد مزاولتها في حالة كراء      </li>
</lu>
', N'15 : 23', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (199, N'7-10-2021', NULL, N'   يرجى الاطلاع على قسم إعداد النهج (الرابط).', N'15 : 23', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (200, N'7-10-2021', NULL, N'  مدة صلاحية رخصة جمع ونقل النفايات هي خمس سنوات. ', N'15 : 23', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (201, N'7-10-2021', NULL, N'تحميل مثال دفتر التحملات.', N'15 : 24', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (202, N'7-10-2021', NULL, N'ليس هناك تكاليف تفرض من طرف الإدارة للحصول على مختلف الرخص، جميع الرخص الممنوحة من طرف قطاع البيئة مجانية.', N'15 : 24', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (203, N'7-10-2021', NULL, N'تحميل مثال دفتر التحملات.', N'15 : 27', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (204, N'7-10-2021', NULL, N'تحميل مثال دفتر التحملات.', N'15 : 27', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (205, N'7-10-2021', NULL, N'تحميل مثال دفتر التحملات.', N'15 : 29', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (206, N'7-10-2021', NULL, N'ليس هناك تكاليف تفرض من طرف الإدارة للحصول على مختلف الرخص، جميع الرخص الممنوحة من طرف قطاع البيئة مجانية.', N'15 : 29', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (207, N'7-10-2021', NULL, N'تحميل مثال دفتر التحملات.', N'15 : 29', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (208, N'7-10-2021', NULL, N'ليس هناك تكاليف تفرض من طرف الإدارة للحصول على مختلف الرخص، جميع الرخص الممنوحة من طرف قطاع البيئة مجانية.', N'15 : 30', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (209, N'7-10-2021', NULL, N'تحميل مثال دفتر التحملات.', N'15 : 45', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (210, N'7-10-2021', NULL, N'        <li class="text-underline" > <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a> </li> <li>يرجى الاطلاع على قسم إعداد النهج .</li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 11', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (211, N'7-10-2021', NULL, N'        <ol>
   <li class="text-underline" > <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a> </li>
</ol><li>يرجى الاطلاع على قسم إعداد النهج .</li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 17', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (212, N'7-10-2021', NULL, N'<li><liclass="text-underline" > <a href="/Preparezvotredemarche" target="_blank">(الرابط)</li>يرجى الاطلاع على قسم إعداد النهج .</li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 20', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (213, N'7-10-2021', NULL, N'</li>يرجى الاطلاع على قسم إعداد النهج .</li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 22', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (214, N'7-10-2021', NULL, N'<li>يرجى الاطلاع على قسم إعداد النهج .</li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 23', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (215, N'7-10-2021', NULL, N'<li><li class="text-underline" > <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a> </li>يرجى الاطلاع على قسم إعداد النهج .</li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 23', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (216, N'7-10-2021', NULL, N'<li>يرجى الاطلاع على قسم إعداد النهج .<li class="text-underline" > <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a> </li></li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 25', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (217, N'7-10-2021', NULL, N'<li>يرجى الاطلاع على قسم إعداد النهج .<ol class="text-underline" > <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a> </ol></li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 27', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (218, N'7-10-2021', NULL, N'<li>يرجى الاطلاع على قسم إعداد النهج .<h6 class="text-underline" > <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a> </h6></li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 27', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (219, N'7-10-2021', NULL, N'<li>يرجى الاطلاع على قسم إعداد النهج .</li><h6 class="text-underline" > <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a> </h6>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 30', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (220, N'7-10-2021', NULL, N'<li>يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.</li>
<h5 style=font-weight: bolder">بالنسبة للنفايات الخطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> الضمانة المالية </li>
    <li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات الخطرة المذكورة</li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف</li>
    <li>شهادة الموافقة منشاة التثمين على النفايات  </li>
<li>رخصة استغلال المنشأة </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين  </li>
<li>رخصة جمع ونقل النفايات الخطرة</li>
<li>دفتر التحملات  </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة  </li>
</ul>
<h5 style=font-weight: bolder">بالنسبة للنفايات الغير خطرة</h5>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل </li>
    <li> الضمانة المالية </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف   </li>
<li>دفتر التحملات  </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشاة التثمين </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات والتخلص منها </li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة  </li>
</ul>


', N'16 : 39', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (221, N'7-10-2021', NULL, N'<li>يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.</li>', N'16 : 41', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (222, N'7-10-2021', NULL, N' <li>يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.</li>
        <li>طلب من السلطة المختصة المعنية في دولة التصدير في حالة استيراد نفايات غير خطرة من بلد أجنبي</li>
<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل</li>
    <li> نسخة من الضمانة المالية   </li>
    <li>نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة  </li>
    <li>وثيقة التحاليل الفيزيائية والكيميائية للنفايات المعنية أو ورقة التعريف </li>
<li>دفتر التحملات </li>
<li>رخصة استغلال الوحدة المنتجة للنفايات والمعالجة لها   </li>
<li>تأمين عن المسؤولية المدنية لمنشأة التثمين</li>
<li>لائحة السلطات المختصة </li>
<li>سعر وحساب مبلغ الضمانة المالية </li>
<li>مسار النفايات  </li>
<li>طرق تثمين النفايات أو التخلص منها</li>
<li>سبب الاستيراد </li>
<li>تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة</li>
</ul>', N'16 : 42', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (223, N'7-10-2021', NULL, N'<li>يرجى الاطلاع على قسم اعداد النهج.<a href="/Preparezvotredemarche" target="_blank">(الرابط)</a></li>', N'16 : 44', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (224, N'7-10-2021', NULL, N'<li>  يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.   </li>

<ul class="style_square">
    <li>  وثيقة الاخطار    </li>
    <li> وثيقة النقل</li>
    <li>  أسباب التصدير </li>
    <li> نسخة من العقد المبرم بين مصدر النفايات والمستورد او مستغل منشاة التخلص من النفايات الخطرة او تثمينها الموجهة اليها النفايات المذكورة   </li>
    <li>  شهادة الموافقة المبدئية  </li>
<li>  خصائص النفايات </li>
<li> وصف كيفيات انتاج النفايات   </li>
<li>  الضمانة المالية     </li>
<li>  لائحة الناقلين   </li>
<li>  مسار النفايات  </li>
<li>  تامين عن المسؤولية المدنية للناقلين   </li>
<li>  تامين عن المسؤولية المدنية للشركة المغربية    </li>
<li>  تصريح موقع ومختوم بصحة المعلومات المقدمة وغياب المواد الخطرة بالنفايات المستوردة    </li>
</lu>', N'16 : 45', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (225, N'7-10-2021', NULL, N'<li>يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.</li>', N'16 : 46', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (226, N'7-10-2021', NULL, N'<li>  يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.   </li>

<ul class="style_square">
    <li>  طلب الترخيص بالعبور (شهادة الموافقة على النفايات من طرف شركة المعالجة او التخلص)  </li>
    <li> موافقة البلد المستورد</li>
    <li>  موافقة البلد المصدر </li>
    <li>وثيقة الاخطار    </li>
    <li>  وثيقة النقل  </li>
<li>  نسخة من العقد المبرم بين مصدر النفايات والمستورد أو مستغل منشاة التخلص من النفايات الخطرة أو تثمينها الموجهة إليها النفايات المذكورة </li>
<li>وثيقة التعريف بالنفايات    </li>
<li>  سعر وحساب مبلغ الضمانة المالية    </li>
<li>  مسار النفايات   </li>
<li>  موانئ العبور   </li>
<li>  السلطات المعنية   </li>
<li> لائحة الناقلين عن طريق البحر    </li>
<li> تأمين الناقلين عن طريق البحر    </li>
<li> تأمين الناقلين عن طريق البحرتأمين عن المسؤولية المدنية للشركة المغربية     </li>
</lu>', N'16 : 47', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (227, N'7-10-2021', NULL, N' <li>يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.</li>', N'16 : 49', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (228, N'7-10-2021', NULL, N'<li>  يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.  </li>
<ul class="style_square">
    <li>  نسخة من بطاقة التعريف الوطنية  </li>
    <li> نوع المركبات والحاويات المستعملة لنقل النفايات الخطرة      </li>
    <li>  عدد المركبات والحاويات (مرفقة بصور) </li>
    <li>رقم تسجيل المركبة ورقم الهيكل </li>
    <li>الوزن الاجمالي للحمولة والوزن الصافي لكل مركبة  </li>
<li>سعة الحاويات والمركبات بالكتلة في حالة نفايات صلبة وبالحجم في الحالات الأخرى</li>
<li>المواد المكونة للحاويات وكل جزء من المركبات المستعملة للنقل وتشمل مواد التغطية </li>
<li>مكان إيداع المركبات (معلل بعقد و/أو سند ملكية الأرض)</li>
<li>تصريح عن طبيعة النفايات الخطرة من طرف صاحب الطلب </li>
<li>الالتزام بمزاولة أنشطة النفايات الخطرة ونقلها كنشاط رئيسي</li>
<li>وثيقة تحدد التدابير الوقائية</li>
<li>وثائق تثبت التأهيل وتكوين المستخدمين</li>
<li>نسخة من التأمين على المسؤولية المهنية للجامع الناقل</li>
<li>وثيقة تدل على القدرة المالية لمزاولة النشاط</li>
</ul>


', N'16 : 50', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (229, N'7-10-2021', NULL, N'  <li>يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.</li>', N'16 : 51', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (230, N'7-10-2021', NULL, N'<li> يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.</li>
<ul class="style_square">
    
    <li> معلومات حول صاحب الطلب  </li>
    <li>  معلومات حول المنشاة ومكانها  </li>
    <li>طبيعة الأنشطة المراد مزاولتها وأنواع وكميات النفايات    </li>
    <li>  وثائق تثبت احترام المواصفات التقنية وكيفيات معالجة تخلص وتثمين النفايات المنصوص عليها في المادة 29 من المرسوم سالف الذكر (رخصة استغلال الوحدة المنتجة والمتخلصة من النفايات).  </li>
<li>  دراسة التأثير البيئية  </li>
<li>نسخة من قرار الموافقة البيئية  </li>
<li>  مخطط لموقع المنشأة مع بيان تخصيص مختلف مناطقها لا سيما الدرج والمنصات ومنافذ الإغاثة    </li>
<li>  وصف المنشأة وهيكلتها وطريقة عملها  </li>
<li>  وصف طرق المعالجة والتجهيزات المتعلقة ب :  </li>
</lu>
<ol>
<li>      -  القدرة على المعالجة والخدمات المقدمة من قبل المنشأة   </li>
<li>     -  نوع الأجهزة والاليات المستعملة في المنشاة  </li>
<li>     - أوقات الاستغلال وعدد فرق العمل ومؤهلاتهم وتكوينهم في مجال معالجة النفايات الخطرة      </li>
</ol>
<ul class="style_square">
    
    <li>مخطط المراقبة الذاتية لتدبير المنشأة وكذا وسائل تنفيذ هذا المخطط   </li>
    <li>  نسخة من الضمانة المالية   </li>
    <li>وثيقة تبين أن صاحب الموقع على علم بطبيعة الأنشطة المراد مزاولتها في حالة كراء      </li>
</lu>
', N'16 : 52', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (231, N'7-10-2021', NULL, N'  <li> يرجى الاطلاع على قسم إعداد النهج <a href="/Preparezvotredemarche" target="_blank">(الرابط)</a>.</li>', N'16 : 53', 1)
SET IDENTITY_INSERT [dbo].[reponse] OFF
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK738osswfjfwybg1ha0axsgq2u] FOREIGN KEY([id_evaluation])
REFERENCES [dbo].[evaluationparam] ([id_evaluation])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK738osswfjfwybg1ha0axsgq2u]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK7mn5f3ojmbndecpshsyow24xe] FOREIGN KEY([compte_id])
REFERENCES [dbo].[compte] ([compte_id])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK7mn5f3ojmbndecpshsyow24xe]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FKoiv9j2i9hgr3xay4uylicagb9] FOREIGN KEY([id_autorisation])
REFERENCES [dbo].[autorisationparam] ([id_autorisation])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FKoiv9j2i9hgr3xay4uylicagb9]
GO
ALTER TABLE [dbo].[question_reponse]  WITH CHECK ADD  CONSTRAINT [FKgcn0svt95hwd9g3w73n2ussos] FOREIGN KEY([id_question])
REFERENCES [dbo].[question] ([id_question])
GO
ALTER TABLE [dbo].[question_reponse] CHECK CONSTRAINT [FKgcn0svt95hwd9g3w73n2ussos]
GO
ALTER TABLE [dbo].[question_reponse]  WITH CHECK ADD  CONSTRAINT [FKny7t02pun0x8mbc9mvy6e0nvi] FOREIGN KEY([id_reponse])
REFERENCES [dbo].[reponse] ([id_reponse])
GO
ALTER TABLE [dbo].[question_reponse] CHECK CONSTRAINT [FKny7t02pun0x8mbc9mvy6e0nvi]
GO
ALTER TABLE [dbo].[reponse]  WITH CHECK ADD  CONSTRAINT [FK219wm9jpvu005i135ahy95so] FOREIGN KEY([compte_id])
REFERENCES [dbo].[compte] ([compte_id])
GO
ALTER TABLE [dbo].[reponse] CHECK CONSTRAINT [FK219wm9jpvu005i135ahy95so]
GO
