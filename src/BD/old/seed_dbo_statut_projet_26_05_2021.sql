create table statut_projet
(
    id_statut_projet int identity
        primary key,
    delete_date_time datetime2,
    nom_ar           nvarchar(255),
    nom_fr           nvarchar(255),
    type             nvarchar(255)
)
go
SET IDENTITY_INSERT [dbo].[doc_import] ON

INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (1, null, N'en attente', N'en attente', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (2, null, N'réunion planifier', N'réunion planifier', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (3, null, N'Non Acceptable', N'Non Acceptable', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (4, null, N'Quorum no atteint', N'Quorum no atteint', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (5, null, N'Attente Signature', N'Attente Signature', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (6, null, N'Signé', N'Signé', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (7, null, N'attente documents définitive', N'attente documents définitive', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (8, null, N'arrete d''examen', N'arrete d''examen', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (9, null, N'Documment definitive attaché', N'Documment definitive attaché', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (10, null, N'Document à amélioré', N'Document à amélioré', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (11, null, N'Rensignement', N'Rensignement', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (12, null, N'Conforme', N'Conforme', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (13, null, N'Avis de projet', N'Avis de projet', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (14, null, N'en attente', N'en attente', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (15, null, N'Incomplet', N'Incomplet', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (16, null, N'visite planifié', N'visite planifié', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (17, null, N'favorable', N'favorable', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (18, null, N'non favorable', N'non favorable', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (19, null, N'en attente', N'en attente', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (20, null, N'Incomplet', N'Incomplet', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (21, null, N'contrôle préliminaire', N'contrôle préliminaire', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (22, null, N'attente d''avis d''AGCDD', N'attente d''avis d''AGCDD', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (23, null, N'attente d''avis de commission', N'attente d''avis de commission', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (24, null, N'refus', N'refus', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (25, null, N'favorable', N'favorable', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (26, null, N'non favorable', N'non favorable', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (27, null, N'attente d''avis de departement concerné', N' attente d''avis de departement concerné', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (28, null, N'attente de signature', N'attente de signature', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (29, null, N'Demande_Num', N'Demande_Num', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (33, null, N'en attente', N'en attente', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (37, null, N'Incomplet', N'Incomplet', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (38, null, N'valide', N'valide', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (39, null, N'avis de departement concerné', N'avis de departement concerné', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (40, null, N'non favorable', N'non favorable', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (41, null, N'Favorable sous reserve', N'Favorable sous reserve', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (42, null, N'demande de complément', N'demande de complément', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (43, null, N'Favorable (commission)', N'Favorable (commission)', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (44, null, N'Non Favorable (commission)', N'Non Favorable (commission)', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (45, null, N'Attente de validation de departement concerné', N'Attente de validation de departement concerné', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (46, null, N'non favorable (comité)', N'non favorable (comité)', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (47, null, N'Brouillon', N'Brouillon', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (48, null, N'Brouillon', N'Brouillon', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (49, null, N'Brouillon', N'Brouillon', N'ET');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (50, null, N'Brouillon', N'Brouillon', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (51, null, N'Brouillon', N'Brouillon', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (52, null, N'Brouillon', N'Brouillon', N'XD');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (53, null, N'Brouillon', N'Brouillon', N'TR');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (54, null, N'Signé', N'Signé', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (55, null, N'Signé', N'Signé', N'ET');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (56, null, N'Signé', N'Signé', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (57, null, N'Signé', N'Signé', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (58, null, N'Document valide', N'Document valide', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (59, null, N'Document incomplet', N'Document incomplet', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (60, null, N'Document incomplet (Réunion)', N'Document incomplet (Réunion)', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (61, null, N'Documents Attachés (Réunion)', N'Documents Attachés (Réunion)', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (62, null, N'في إنتظار برمجة المعاينة', N'attente de programmer une visite', N'IT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (63, null, N'Attente de validation du certificat', N'Attente de validation du certificat', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (64, null, N'certificat valide', N'certificat valide', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (65, null, N'certificat invalide', N'certificat invalide', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (66, null, N'Attente de validation du Transporteur', N'Attente de validation du Transporteur', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (67, null, N'Transporteur valide', N'Transporteur valide', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (68, null, N'Transporteur invalide', N'Transporteur invalide', N'ZF');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (69, null, N'Visite planifiée', N'Visite planifiée', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (70, null, N'Complément attachée', N'Complément attachée', N'CT');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (71, null, N'Attente du Rapport d''audit', N'Attente du Rapport d''audit', N'EV');
INSERT INTO seed.dbo.statut_projet (id_statut_projet, delete_date_time, nom_ar, nom_fr, type) VALUES (72, null, N'Complément attachés', N'Complément attachés', N'EV');
SET IDENTITY_INSERT [dbo].[doc_import] OFF