/*
Run this script on:

DESKTOP-86LFOG7.seed_oldd    -  This database will be modified

to synchronize it with:

DESKTOP-86LFOG7.seed

You are recommended to back up your database before running this script

Script created by SQL Data Compare version 11.6.11 from Red Gate Software Ltd at 06/10/2021 14:59:32

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

PRINT(N'Drop constraint FKeew52tkli76d2jgxglmxcn164 from [dbo].[declaration_transporteur]')
ALTER TABLE [dbo].[declaration_transporteur] NOCHECK CONSTRAINT [FKeew52tkli76d2jgxglmxcn164]

PRINT(N'Update rows in [dbo].[transporteurparam]')
UPDATE [dbo].[transporteurparam] SET [fax]=N'', [nom]=N'ECO LABER SERVICES', [adresse]=N'23 BD MLY slimane 1er étage Ain Sebaa –Casablanca', [date_fin]='2026-01-19 01:00:00.0000000' WHERE [id_transporteur_param] = 6
UPDATE [dbo].[transporteurparam] SET [date_fin]='2026-01-19 01:00:00.0000000' WHERE [id_transporteur_param] = 7
UPDATE [dbo].[transporteurparam] SET [date_fin]='2026-01-19 01:00:00.0000000' WHERE [id_transporteur_param] = 8
UPDATE [dbo].[transporteurparam] SET [date_fin]='2026-01-19 01:00:00.0000000' WHERE [id_transporteur_param] = 9
UPDATE [dbo].[transporteurparam] SET [nom]=N'CHIMIREC Maroc', [date_fin]='2025-01-03 01:00:00.0000000' WHERE [id_transporteur_param] = 10
UPDATE [dbo].[transporteurparam] SET [date_fin]='2025-01-03 01:00:00.0000000' WHERE [id_transporteur_param] = 11
UPDATE [dbo].[transporteurparam] SET [tel]=N'05 22 54 90 54 / 05 22 54 92 50', [date_fin]='2025-01-03 01:00:00.0000000' WHERE [id_transporteur_param] = 12
UPDATE [dbo].[transporteurparam] SET [tel]=N'05 23 30 55 10/05 23 32 86 97/06 30 92 90 64/06 61 16 01 84', [date_fin]='2025-02-05 01:00:00.0000000' WHERE [id_transporteur_param] = 13
UPDATE [dbo].[transporteurparam] SET [tel]=N'05 28 23 23 39 / 06 61 38 22 37', [adresse]=N'Bureau N° 4, 2éme Etage BD prince Abdelkader N° 78 Hay Almassira Agadir', [date_fin]='2025-07-28 01:00:00.0000000' WHERE [id_transporteur_param] = 14
UPDATE [dbo].[transporteurparam] SET [tel]=N'', [adresse]=N'Douar Tlalsa Zaouiat Ain Chekaf FES', [date_fin]='2022-06-21 01:00:00.0000000' WHERE [id_transporteur_param] = 19
UPDATE [dbo].[transporteurparam] SET [tel]=N'06 61 28 99 90 / 06 56 56 25 62', [date_fin]='2022-06-21 01:00:00.0000000' WHERE [id_transporteur_param] = 20
UPDATE [dbo].[transporteurparam] SET [date_fin]='2022-06-21 01:00:00.0000000' WHERE [id_transporteur_param] = 21
UPDATE [dbo].[transporteurparam] SET [date_fin]='2022-06-12 01:00:00.0000000' WHERE [id_transporteur_param] = 22
UPDATE [dbo].[transporteurparam] SET [adresse]=N'Ain harrouda. Route 107 Km résidence Rania Immeuble C 2éme étage appt : n°7 MOHAMMEDIA', [date_fin]='2022-11-28 01:00:00.0000000' WHERE [id_transporteur_param] = 23
UPDATE [dbo].[transporteurparam] SET [nom]=N'Société Techni Polymers shore ', [date_fin]='2022-12-28 01:00:00.0000000' WHERE [id_transporteur_param] = 24
UPDATE [dbo].[transporteurparam] SET [date_fin]='2022-12-28 01:00:00.0000000' WHERE [id_transporteur_param] = 25
UPDATE [dbo].[transporteurparam] SET [date_fin]='2022-06-21 01:00:00.0000000' WHERE [id_transporteur_param] = 26
UPDATE [dbo].[transporteurparam] SET [nom]=N'Kanban Entreprise', [adresse]=N'37 quartier beau site – Centre al Hadika- route de Rabat- ain Sebaâ- Casablanca', [date_fin]='2023-12-31 01:00:00.0000000' WHERE [id_transporteur_param] = 27
UPDATE [dbo].[transporteurparam] SET [tel]=N'05 37 37 38 49', [date_fin]='2023-10-31 01:00:00.0000000' WHERE [id_transporteur_param] = 28
UPDATE [dbo].[transporteurparam] SET [date_fin]='2023-10-31 01:00:00.0000000' WHERE [id_transporteur_param] = 29
UPDATE [dbo].[transporteurparam] SET [date_fin]='2023-12-31 01:00:00.0000000' WHERE [id_transporteur_param] = 30
UPDATE [dbo].[transporteurparam] SET [nom]=N'FARROUK TRANS SARL', [tel]=N'06 66 29 26 71', [adresse]=N'Res alhouda res al iatimad bd mohamed balafrej imm 166 sidi moumen casablanca', [date_fin]='2023-12-31 01:00:00.0000000' WHERE [id_transporteur_param] = 31
UPDATE [dbo].[transporteurparam] SET [date_fin]='2023-10-31 01:00:00.0000000' WHERE [id_transporteur_param] = 32
UPDATE [dbo].[transporteurparam] SET [delete_date_time]='2021-10-06 11:58:37.7560000' WHERE [id_transporteur_param] = 1033
UPDATE [dbo].[transporteurparam] SET [delete_date_time]='2021-10-06 12:00:33.4320000' WHERE [id_transporteur_param] = 1034
UPDATE [dbo].[transporteurparam] SET [delete_date_time]='2021-10-06 12:01:28.5030000' WHERE [id_transporteur_param] = 1036
UPDATE [dbo].[transporteurparam] SET [delete_date_time]='2021-10-06 12:01:37.9990000' WHERE [id_transporteur_param] = 1037
UPDATE [dbo].[transporteurparam] SET [date_fin]='2026-01-19 01:00:00.0000000' WHERE [id_transporteur_param] = 1039
UPDATE [dbo].[transporteurparam] SET [tel]=N'', [date_fin]='2026-01-19 01:00:00.0000000' WHERE [id_transporteur_param] = 1041
UPDATE [dbo].[transporteurparam] SET [date_fin]='2026-04-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1042
UPDATE [dbo].[transporteurparam] SET [fax]=N'05 28 82 69 83 /  05 28 82 25 22', [nom]=N'AQUAFLORE PROTECT', [date_fin]='2026-04-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1043
UPDATE [dbo].[transporteurparam] SET [nom]=N'SELSAFAA S.A.R.L ', [date_fin]='2026-04-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1044
UPDATE [dbo].[transporteurparam] SET [fax]=N'05 28 84 74 39 / 05 28 84 41 80', [tel]=N'05 28 84 21 44', [date_fin]='2026-03-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1045
UPDATE [dbo].[transporteurparam] SET [fax]=N'05 39 68 68 64', [nom]=N'BIO HYGIENE', [tel]=N'05 39 68 68 64', [adresse]=N'Et, Oumkltoum 67Av.Kenya 93150, lot. Oumkltoum Centre de Martil Tétouan', [date_fin]='2026-03-16 00:00:00.0000000' WHERE [id_transporteur_param] = 1046
UPDATE [dbo].[transporteurparam] SET [tel]=N'05 22 51 51 41', [adresse]=N'12 rue Sabri Boujamâa, 1er étage, apt 06  Casablanca.', [date_fin]='2026-03-16 00:00:00.0000000' WHERE [id_transporteur_param] = 1047
UPDATE [dbo].[transporteurparam] SET [fax]=N'05 29 02 42 99', [tel]=N'05 29 02 42 97/98', [adresse]=N'RN 9 PK 42+900 route Berrechid commune Jakma BP 13030 casa principal Casablanca', [date_fin]='2026-03-16 00:00:00.0000000' WHERE [id_transporteur_param] = 1048
UPDATE [dbo].[transporteurparam] SET [nom]=N'INDUSTRIEL GENEVE ASSAINISSEMENT', [tel]=N'05 22 75 71 68 / 06 61 97 39 79', [adresse]=N'INDUSTRIELLE G.A.I Environnement  CASABLANCA', [date_fin]='2026-03-16 00:00:00.0000000' WHERE [id_transporteur_param] = 1049
UPDATE [dbo].[transporteurparam] SET [tel]=N'06 61 92 27 75', [adresse]=N'Angle avenue imam Ali et rue ibn khaldoun bureau n°2 Kenitra', [date_fin]='2026-03-16 00:00:00.0000000' WHERE [id_transporteur_param] = 1050
UPDATE [dbo].[transporteurparam] SET [fax]=N'05 37 65 55 66', [tel]=N'05 37 63 32 90', [adresse]=N'Avenue Mehdi Benbarka, lot Soumia, lot N°5, Souissi-Rabat- RC VILLE 88705.', [date_fin]='2026-04-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1051
UPDATE [dbo].[transporteurparam] SET [tel]=N'06 63 45 71 07/ 06 61 59 93 09', [adresse]=N'5 avenue ibn tachfine Tanger', [date_fin]='2026-04-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1052
UPDATE [dbo].[transporteurparam] SET [fax]=N'05 37 60 13 56', [tel]=N'05 37 60 22 15', [adresse]=N'37 lot vita avenue Hasan-Rabat.', [date_fin]='2026-04-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1053
UPDATE [dbo].[transporteurparam] SET [adresse]=N'N°26205 Douar Ouled Amer Ain Atiq  Temara', [date_fin]='2026-04-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1054
UPDATE [dbo].[transporteurparam] SET [date_fin]='2023-01-25 01:00:00.0000000' WHERE [id_transporteur_param] = 1055
UPDATE [dbo].[transporteurparam] SET [nom]=N'TAFROUAT ASSAINISSEMENT  SARL', [tel]=N'05 22 27 36 54 /  06 61 68 59 04', [adresse]=N'13, rue Ahmed El Majjati Res les alpes 1 er étage Apt 8 Casablanca. 361543', [date_fin]='2026-04-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1056
UPDATE [dbo].[transporteurparam] SET [nom]=N'k2j ENVIRONNEMENT Al', [adresse]=N'Baraka 23 frac N31 5 éme étage imm 780 Massira 2A Marrakech.', [date_fin]='2026-04-29 01:00:00.0000000' WHERE [id_transporteur_param] = 1057
PRINT(N'Operation applied to 45 rows out of 45')

PRINT(N'Add rows to [dbo].[transporteurparam]')
SET IDENTITY_INSERT [dbo].[transporteurparam] ON
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1068, NULL, NULL, N'05 22 73 66 52', N'', N'MME', N'05 22 73 47 98 / 06 61 42 07 32', N'', N'Local n°5, Route 109 Bousekkoura Centre Quartier industriel de Bousekkoura', '2026-04-29 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1069, NULL, NULL, N'05 22 98 73 27', N'', N'LOGIPRO', N'05 22 98 71 75', N'', N'17 , Rue Ishak ibnou Hanine Appt n° 6 4EME Etage Boulevard Yacoub el Mansour Maarif Extension Casablanca ', '2026-01-01 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1070, NULL, NULL, N'05 22 43 69 98', N'', N'SITA MAROC RECYCLING', N'05 22 32 09 51', N'', N'lot 40 A zone d’exploitation Tanger free zone Maroc', '2016-04-05 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1071, NULL, NULL, N'', N'', N'DACHSER', N'05 22 67 58 50', N'', N'Rue Aboubakr bnou koutia Ain Sebaa  Casablanca', '2016-03-15 00:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1072, NULL, NULL, N'05 22 30 94 87 / 05 22 31 73 58', N'', N'ECONORME', N'05 22 30 58 11 /  05 22 30 96 35', N'', N'61, Boulevard de la Resistance 20300 Casablanca', '2016-05-25 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1073, NULL, NULL, N'05 39 39 56 47', N'', N'ECORECYCLAGE', N'05 39 39 56 47 / 06 19 50 55 48', N'', N'Lot 38, B Bureau 11 zone logistique de la zone franche d’exportation de Tanger.', '2026-04-29 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1074, NULL, NULL, N'05 22 24 82 33', N'', N'POLLUCLEAN', N'05 22 24 82 32', N'', N'353, Boulevard Med V 20300 Casablanca', '2026-04-29 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1075, NULL, NULL, N'05 22 01 41 42', N'', N'NITAN-', N'05 22 01 41 41', N'', N'Zone Industrielle Sapino à Nouaceur  Boite Postale 125 Casablanca ', '2016-05-25 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1076, NULL, NULL, N'05 22 31 50 55', N'', N'VACUM-', N'05 22 54 30 54/53', N'', N'12, Rue N’ chakra Rahal Casablanca', '2016-06-16 00:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1077, NULL, NULL, N'05 22 44 85 36', N'', N'POMPAGE ET RAFFINAGE DU MAROC- -', N'06 61 23 87 88', N'', N'Cité Al Amal n°65 RTS Ain Harrouda Mohammedia', '2016-06-16 00:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1078, NULL, NULL, N'05 22 24 95 85/88', N'', N'TRANSIT JALAL-', N'05 22 24 95 62 / 66 / 77', N'', N'Boulevard ibnou  tachfine  201  1 ère étage  Ain Berja  20310   Casablanca', '2026-04-29 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1079, NULL, NULL, N'05 22 43 69 98', N'', N'SITA MAROC', N'05 22 32 09 51', N'', N'20, Bd Rachidi 20070 Casablanca', '2021-08-05 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1080, NULL, NULL, N'05 22 67 21 10', N'', N'CGA SARL', N'', N'', N'Route Zenata R.S 111 km 12 n° ZT Polygone', '2021-11-17 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1081, NULL, NULL, N'05 22 44 85 36', N'', N'SOFAMAS', N'06 00 17 89 17', N'', N'N° 52 LOT ZAITOUNE JNANE ILLANE', '2021-11-04 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1082, NULL, NULL, N'05 23 34 53 34', N'', N'COJOSEM', N'05 23 34 54 63', N'', N'N° 2489 Douar Oulad Brahim Cercle Moulay Abdallah  El Jadida', '2021-11-04 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1083, NULL, NULL, N'05 34 90 87 28', N'', N'MARRU DECHETS', N'05 34 90 87 28', N'', N'Place Dcheeira  Imm  Alghilani 1er Etage BP/ 1266 LAAYOUNE', '2021-11-04 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1084, NULL, NULL, N'05 39 39 52 64', N'', N'Refai Net Solution', N'05 39 39 52 64', N'', N'TFZ1, bureau N°9 gzenaya Zone franche Tanger', '2023-01-25 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1085, NULL, NULL, N'05 22 51 08 83', N'', N'Logic Transport', N'05 22 33 10 78', N'', N'Route 0170 Douar Ould Sidi Abou Tit Mellil', '2023-08-06 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1086, NULL, NULL, N'05 22 01 45 93', N'', N'ALMABAT.', N'05 22 01 40 90  /  05 22 01 40 91', N'', N'559 parcs industriels Sapino 26200 Casablanca.', '2023-06-26 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1087, NULL, NULL, N'', N'', N'R.T.G Recyclage Trans Rita', N'06 04 38 11 41  /  05 22 33 85 90', N'', N'4 rue de Hollande Im Venezuela N° 5 Tanger', '2023-06-26 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1088, NULL, NULL, N'05 22 34 13 40', N'', N'Redepa', N'05 22 34 13 40', N'', N'Oukacha rue Farissia Hay Mohammadi-Ain Sebaa Casablanca', '2023-06-26 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1089, NULL, NULL, N'05 2291 51 59', N'', N'Artis Environnement Centre.', N'05 22 91 37 38', N'', N'248 bis lot Nassim lissasfa Casablanca.', '2023-08-06 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1090, NULL, NULL, N'05 22 27 31 78', N'', N'Environnement Service Recyclage et Prestation  (Ste ERP recyclage)', N'05 22 22 02 00', N'', N'5, rue Oued Tensift', '2023-08-06 01:00:00.0000000')
INSERT INTO [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel], [numero_autorisation], [adresse], [date_fin]) VALUES (1091, NULL, NULL, N'', N'', N'First huile S.A.R.L', N'06 73 19 00 02', N'', N'N° 12, rue Sabri Boujemaa 1 er Etage Appt 6 Casablanca-Maroc', '2026-04-29 01:00:00.0000000')
SET IDENTITY_INSERT [dbo].[transporteurparam] OFF
PRINT(N'Operation applied to 24 rows out of 25')
ALTER TABLE [dbo].[declaration_transporteur] WITH CHECK CHECK CONSTRAINT [FKeew52tkli76d2jgxglmxcn164]
COMMIT TRANSACTION
GO