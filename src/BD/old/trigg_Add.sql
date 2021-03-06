USE [seed]
GO
/****** Object:  Trigger [dbo].[trigg_Add_notification]    Script Date: 12/03/2021 15:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE TRIGGER [dbo].[trigg_Add_notification]
ON [dbo].[notification]
AFTER INSERT
AS 
BEGIN   
    SET NOCOUNT ON;
	declare @an varchar(5),@num varchar(500),@zonn varchar(10),@id int,@No int,@idzonne_franche int,@id_pays int,@zf_et varchar(10);
	select  @id =id_notification FROM Inserted ;
	SELECT @an =DATEPART(year, GETDATE());
	select @idzonne_franche=idzonne_franche from notification where id_notification = @id;
	select @id_pays=id_pays from notification where id_notification = @id;
	if(@idzonne_franche is not null)
	begin
		select @zonn = code from zonnefranche where id_zonnefranche =@idzonne_franche;
		set @zf_et='ZF';
	end
	if(@id_pays is not null)
	begin
		select @zonn = code_iso from pays where pays_id =@id_pays;
		set @zf_et ='ET';
	end
	if(@zonn is  null)
	begin
		set @zonn = 'TW';
	end
	SELECT @No=ISNULL(Max(no),0)+1 FROM notification Where YEAR(date_depot)=YEAR(GetDate());
	set @num=@zonn+'-'+@an+'-'+CONVERT(varchar(10),@No)
    update notification set num_notification =@num ,date_depot =GETDATE(),no=@No ,id_statut=29,zf_et=@zf_et
    WHERE notification.id_notification = @id
END
GO
USE [seed]
GO
/****** Object:  Trigger [dbo].[trigg_Add_installation]    Script Date: 12/03/2021 15:28:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigg_Add_installation]
ON [dbo].[installation]
AFTER INSERT
AS
BEGIN  
  SET NOCOUNT ON;
declare @an varchar(5),@num varchar(500),@id int,@No int;
select  @id =id_installation FROM Inserted ;
SELECT @an =DATEPART(year, GETDATE());

SELECT @No=ISNULL(Max(no),0)+1 FROM installation Where YEAR(date_depot)=YEAR(GetDate());
set @num='IT-'+@an+'-'+CONVERT(varchar(10),@No)
  update installation set num_demande =@num ,date_depot =GETDATE(),no=@No ,id_statut=14
  WHERE installation.id_installation = @id
END


GO

USE [seed]
GO
/****** Object:  Trigger [dbo].[trigg_Add_collectetransporteur]    Script Date: 12/03/2021 15:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[trigg_Add_collectetransporteur]
ON [dbo].[collectetransporteur]
AFTER INSERT
AS 
BEGIN   
    SET NOCOUNT ON;
	declare @an varchar(5),@num varchar(500),@id int,@No int;
	select  @id =id_collecte FROM Inserted ;
	SELECT @an =DATEPART(year, GETDATE());
	
	SELECT @No=ISNULL(Max(no),0)+1 FROM collectetransporteur Where YEAR(date_depot)=YEAR(GetDate());
	set @num='CT-'+@an+'-'+CONVERT(varchar(10),@No)
    update collectetransporteur set num_demande =@num ,date_depot =GETDATE(),no=@No 
    WHERE collectetransporteur.id_collecte = @id
END

