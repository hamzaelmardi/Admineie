

USE [seed]
delete [dbo].[document_dechetnd] 
SET IDENTITY_INSERT [dbo].[document_dechetnd] ON 

INSERT [dbo].[document_dechetnd] ([dnd], [adresse], [code], [comment], [email], [ila], [logo], [mo3alaja], [nom], [nom_societe], [nomtr], [numero], [p1], [p10], [p3], [p6], [p8], [pattente], [quantite], [signe], [source], [st_accepte], [st_refuse], [tatmin], [tel], [temps], [title], [titre], [type]) VALUES (1, N'Adresse ', N'Code (catalogue marocain des déchets)  ', N'Motifs du refus ', N'Adresse électronique ', N'au', N'/word_header.png', N'Traitement ', N'Nom de l’installation ', N'Raison sociale ', N'اسم الشركة المكلفة بالنقل', N'', N'Informations sur la société', N'Décision d’autorisation  ', N'Informations sur les déchets importés', N'Informations sur l’installation de valorisation ou de traitement des déchets', N'المعلومات الخاصة بمنشأة تثمين او معالجة النفايات', N'رقم الرخصة ', N'Quantité ', N'Signature', N'Notification n° ', N'L’autorisation d’importation des déchets objet de la Notification ', N'Refus de l’autorisation d’importation des déchets ', N'Valorisation  ', N'Téléphone/fax ', N'Durée de validité de l’autorisation : du ', N'Autorisation d’importation des déchets non dangereux', N'Informations sur l’installation de valorisation ou de traitement des déchets', N'Type ')
SET IDENTITY_INSERT [dbo].[document_dechetnd] OFF
GO
