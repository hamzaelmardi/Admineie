

PRINT(N'Update rows in [dbo].[statut_projet]')
UPDATE [dbo].[statut_projet] SET [nom_ar]=N'en attente d''avis de pays destinataire', [nom_fr]=N'en attente d''avis de pays destinataire', type=N'XD' WHERE [id_statut_projet] = 83
UPDATE [dbo].[statut_projet] SET [nom_fr]=N'Sign�e', [nom_ar]=N'Sign�e', type=N'XD' WHERE [id_statut_projet] = 84
UPDATE [dbo].[statut_projet] SET [nom_ar]=N'conforme', [nom_fr]=N'conforme', type=N'XD' WHERE [id_statut_projet] = 85
UPDATE [dbo].[statut_projet] SET [nom_ar]=N'non conforme', [nom_fr]=N'non conforme', type=N'XD' WHERE [id_statut_projet] = 86

