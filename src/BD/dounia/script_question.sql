/*
Run this script on:

(local).seedserveur    -  This database will be modified

to synchronize it with:

(local).seed

You are recommended to back up your database before running this script

Script created by SQL Data Compare version 11.6.11 from Red Gate Software Ltd at 03/06/2021 12:26:07

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

PRINT(N'Drop constraints from [dbo].[question]')
ALTER TABLE [dbo].[question] NOCHECK CONSTRAINT [FK738osswfjfwybg1ha0axsgq2u]
ALTER TABLE [dbo].[question] NOCHECK CONSTRAINT [FK7mn5f3ojmbndecpshsyow24xe]
ALTER TABLE [dbo].[question] NOCHECK CONSTRAINT [FKoiv9j2i9hgr3xay4uylicagb9]

PRINT(N'Update row in [dbo].[question]')
UPDATE [dbo].[question] SET [description]=N'Quel est le contenu du rapport d’Etude d’Impact sur l’Environnement (EIE) et du cahier des charges ?' WHERE [id_question] = 45

PRINT(N'Add constraints to [dbo].[question]')
ALTER TABLE [dbo].[question] WITH CHECK CHECK CONSTRAINT [FK738osswfjfwybg1ha0axsgq2u]
ALTER TABLE [dbo].[question] WITH CHECK CHECK CONSTRAINT [FK7mn5f3ojmbndecpshsyow24xe]
ALTER TABLE [dbo].[question] WITH CHECK CHECK CONSTRAINT [FKoiv9j2i9hgr3xay4uylicagb9]
COMMIT TRANSACTION
GO
