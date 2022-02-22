USE [seed]
GO

INSERT [dbo].[caracteristiquephysique] ([nom_ar], [nom_fr]) VALUES ('boueux','boueux')
INSERT [dbo].[caracteristiquephysique] ([nom_ar], [nom_fr]) VALUES ('pâteuses','pâteuses')

update caracteristiquephysique set nom_ar=N'boueux', nom_fr=N'boueux' where id_classification=3
update caracteristiquephysique set nom_ar=N'pâteuses', nom_fr=N'pâteuses' where id_classification=4
update caracteristiquephysique set nom_ar=N'autre', nom_fr=N'autre' where id_classification=5