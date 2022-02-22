use seed

alter table [dbo].[collectetransporteur]
alter column [commentaire] nvarchar(MAX) 

alter table [dbo].[documentsae]
alter column [commentaire] nvarchar(MAX) 

alter table [dbo].[demande_infromation]
alter column [commentaire_avis] nvarchar(MAX) 

alter table [dbo].[demande_infromation]
alter column  [commentaire_url_file_ae] nvarchar(MAX) 

alter table [dbo].[demande_infromation]
alter column [commentaire] nvarchar(MAX) 

alter table [dbo].[installation]
alter column [commentaire] nvarchar(MAX) 

alter table [dbo].[notification]
alter column [commentaire] nvarchar(MAX) 

alter table [dbo].[reunion]
alter column [commentaire] nvarchar(MAX) 

alter table  [dbo].[installation]
alter column [adresse] nvarchar(MAX)

alter table  [dbo].[installation]
alter column [description] nvarchar(MAX)

alter table  [dbo].[doc_import]
alter column [description] nvarchar(MAX)

alter table  [dbo].[question]
alter column [description] nvarchar(MAX)

alter table  [dbo].[question]
alter column [description_ar] nvarchar(MAX)

alter table  [dbo].[reponse]
alter column [description] nvarchar(MAX)

alter table  [dbo].[reunion]
alter column [description] nvarchar(MAX)

alter table  [dbo].[transporteur_etranger]
alter column [adresse] nvarchar(MAX)

alter table  [dbo].[autorite]
alter column [adresse] nvarchar(MAX)

alter table  [dbo].[notification]
alter column [adresse] nvarchar(MAX)

alter table  [dbo].[demande_infromation]
alter column [adresse] nvarchar(MAX)

alter table  [dbo].[comite]
alter column [adresse] nvarchar(MAX)

alter table  [dbo].[transporteurparam]
alter column [adresse] nvarchar(MAX)

alter table  [dbo].[installation]
alter column [adresse] nvarchar(MAX)

alter table  [dbo].[transporteur]
alter column [adresse_ar] nvarchar(MAX)

alter table  [dbo].[transporteur]
alter column [adresse_fr] nvarchar(MAX)

alter table [dbo].[eliminateur]
alter column [adresse_ar] nvarchar(MAX)

alter table [dbo].[eliminateur]
alter column [adresse_fr] nvarchar(MAX)

alter table [dbo].[importateurnotifiant]
alter column [adresse_ar] nvarchar(MAX)

alter table [dbo].[importateurnotifiant]
alter column [adresse_fr] nvarchar(MAX)

alter table [dbo].[producteur]
alter column [adresse_ar] nvarchar(MAX)

alter table [dbo].[producteur]
alter column [adresse_fr] nvarchar(MAX)

alter table [dbo].[societe]
alter column [adresse_ar] nvarchar(MAX)

alter table [dbo].[societe]
alter column [adresse_fr] nvarchar(MAX)

alter table [dbo].[collectetransporteur]
alter column [demandeur_adresse] nvarchar(MAX)

