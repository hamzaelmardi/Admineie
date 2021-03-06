
delete question_reponse
DELETE question


USE [seed]
GO
/****** Object:  Table [dbo].[question]    Script Date: 09/08/2021 10:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id_question] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[description] [nvarchar](255) NULL,
	[description_ar] [nvarchar](255) NULL,
	[type] [nvarchar](255) NULL,
	[id_autorisation] [int] NULL,
	[compte_id] [int] NULL,
	[id_evaluation] [int] NULL,
	[nbr] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (42, NULL, N'Quel est le coût de la procédure de l’EIE ?', N'', N'2', NULL, 1, 4, 2)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (43, NULL, N'Quelles sont les étapes d’obtention de la Décision d’Acceptabilité Environnementale ?', N'', N'2', NULL, 2, 4, 32)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (44, NULL, N'Quels sont les documents nécessaires à l’obtention de l’acceptabilité environnementale des projets soumis à l’EIE ?', N'', N'2', NULL, 1, 4, 3)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (45, NULL, N'Quel est le contenu du rapport d’Etude d’Impact sur l’Environnement (EIE) et du cahier des charges ?', N'', N'2', NULL, 1, 4, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (46, NULL, N'Quels sont les projets assujettis à l’EIE ?', N'', N'2', NULL, 1, 4, 6)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (47, NULL, N'Quel est le cadre juridique et les documents de référence des EIE ?', N'', N'2', NULL, 1, 4, 5)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (48, NULL, N'Qu’est-ce que l’Etude d’Impact sur l’Environnement ?', N'', N'2', NULL, 1, 4, 8)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (49, CAST(N'2021-02-19T15:54:03.7600000' AS DateTime2), N'Qu’est-ce que l’Evaluation Environnementale (A intégrer avant la définition de l’EIE)?', NULL, N'1', 1, 1, NULL, 7)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (50, CAST(N'2021-02-19T15:53:59.4880000' AS DateTime2), N'Qu’est-ce que la Notice d’Impact sur l’Environnement (NIE) ?', NULL, N'2', NULL, 1, 3, 10)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (51, NULL, N'Qu’est-ce que l’Audit Environnemental (AE) ?', N'ما هي مراحل مسطرة دراسة التأثير على البيئة؟', N'2', NULL, 1, 4, 9)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (52, CAST(N'2021-02-19T17:29:04.5310000' AS DateTime2), N'Quels sont les projets assujettis à la NIE?', N'ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟', N'1', NULL, 1, NULL, 12)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (53, NULL, N'', N'ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟', N'2', NULL, 1, 4, 11)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (54, NULL, N'', N' ما هو مضمون دراسة التأثير على البيئة و برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي؟', N'2', NULL, 1, 4, 13)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (55, NULL, N'', N'ما هي المشاريع الخاضعة لدراسة التأثير على البيئة؟', N'2', NULL, 1, 4, 15)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (56, NULL, N'', N'ما هو المرجع القانوني لهذه المسطرة؟', N'2', NULL, 1, 4, 14)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (57, NULL, N'', N'ما هي دراسة التأثير على البيئة؟', N'2', NULL, 1, 4, 16)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (58, CAST(N'2021-02-22T09:06:44.5010000' AS DateTime2), N'ppp', N'', N'1', 1, 1, NULL, 17)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (59, NULL, N'Qu’est-ce que l’Evaluation Environnementale ?', N'', N'2', NULL, 1, 1, 20)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (60, NULL, N'Qu’est-ce que la Notice d’Impact sur l’Environnement (NIE) ?', N'', N'2', NULL, 1, 3, 18)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (61, NULL, N'Qu’est-ce que l’Audit Environnemental (AE) ?', N'', N'2', NULL, 1, 2, 19)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (66, NULL, N'Quel est le cadre juridique de l’Evaluation Environnementale ?', N'', N'2', NULL, 1, 1, 21)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (67, NULL, N'Quel est le cadre juridique de la NIE ?', N'', N'2', NULL, 1, 3, 23)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (68, NULL, N'Quels sont les projets assujettis à la NIE ?', N'', N'2', NULL, 1, 3, 22)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (69, NULL, N'Quel est le document nécessaire à l’obtention de l’acceptabilité environnementale des projets soumis à la NIE ?', N'', N'2', NULL, 1, 3, 24)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (70, NULL, N'Quelles sont les étapes d’obtention de la Décision d’Acceptabilité Environnementale ?', N'', N'2', NULL, 1, 3, 26)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (71, NULL, N'Quel est le coût de la procédure de la NIE ?', N'', N'2', NULL, 1, 3, 30)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (72, NULL, N'Quel est le cadre juridique de l’AE ?', N'', N'2', NULL, 1, 2, 25)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (73, NULL, N'- Quelles sont les étapes d’obtention du Certificat de conformité Environnementale ?', N'', N'2', NULL, 1, 2, 27)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (74, NULL, N'Quelles sont les documents nécessaires à l’obtention du Certificat de conformité Environnementale ?', N'', N'2', NULL, 1, 2, 29)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (75, NULL, N'Quel est le coût de la procédure de l’AE?', N'', N'2', NULL, 1, 2, 28)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (76, NULL, N'Question', N'السؤال', N'1', 1, 2, NULL, 31)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation], [nbr]) VALUES (77, NULL, N'Installation', N'السؤال', N'1', 4, 2, NULL, 1)
SET IDENTITY_INSERT [dbo].[question] OFF
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
