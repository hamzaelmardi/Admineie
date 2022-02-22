USE [seed]
GO

/****** Object:  Trigger [dbo].[trigg_update_installation]    Script Date: 20/11/2021 03:29:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create TRIGGER [dbo].[trigg_update_installation]
ON [dbo].[installation]
AFTER update
AS 
BEGIN   
    SET NOCOUNT ON;
	declare @an varchar(5),@num varchar(500),@id int,@No int,@id_statut int;
	select  @id =id_installation FROM Inserted ;
	select  @id_statut =id_statut FROM Inserted ;
	SELECT @an =DATEPART(year, GETDATE());
	if @id_statut=17 
	BEGIN
		SELECT @No=ISNULL(Max(n_pdf),0)+1 FROM installation Where YEAR(date_depot)=YEAR(GetDate());
		set @num=@an+'/'+CONVERT(varchar(10),@No)
		update installation set numero_demande_pdf = @num,n_pdf=@No 
		from installation c  INNER JOIN Inserted I 
		on c.id_installation = i.id_installation
	END
END

GO

ALTER TABLE [dbo].[installation] ENABLE TRIGGER [trigg_update_installation]
GO


USE [seed]
GO

/****** Object:  Trigger [dbo].[trigg_update_collectetransporteur]    Script Date: 20/11/2021 03:29:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create TRIGGER [dbo].[trigg_update_collectetransporteur]
ON [dbo].[collectetransporteur]
AFTER update
AS 
BEGIN   
    SET NOCOUNT ON;
	declare @an varchar(5),@num varchar(500),@id int,@No int,@id_statut int;
	select  @id =id_collecte FROM Inserted ;
	select  @id_statut =id_statut FROM Inserted ;
	SELECT @an =DATEPART(year, GETDATE());
	if @id_statut=28 
	BEGIN
		SELECT @No=ISNULL(Max(n_pdf),0)+1 FROM collectetransporteur Where YEAR(date_depot)=YEAR(GetDate());
		set @num=@an+'/'+CONVERT(varchar(10),@No)
		update collectetransporteur set numero_demande_pdf = @num,n_pdf=@No 
		from collectetransporteur c  INNER JOIN Inserted I 
		on c.id_collecte = i.id_collecte
	END
END
GO

ALTER TABLE [dbo].[collectetransporteur] ENABLE TRIGGER [trigg_update_collectetransporteur]
GO


