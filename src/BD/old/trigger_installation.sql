USE [seed]
GO
/****** Object:  Trigger [dbo].[trigg_Add_installation]    Script Date: 26/05/2021 17:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trigg_Add_installation]
ON [dbo].[installation]
AFTER INSERT
AS
BEGIN  
  SET NOCOUNT ON;
declare @an varchar(5),@num varchar(500),@id int,@No int;
select  @id =id_installation FROM Inserted ;
SELECT @an =DATEPART(year, GETDATE());

SELECT @No=ISNULL(Max(no),0)+1 FROM installation Where YEAR(date_depot)=YEAR(GetDate());
set @num='INST.T'+@an+'-'+CONVERT(varchar(10),@No)
  update installation set num_demande =@num ,date_depot =GETDATE(),no=@No --,id_statut=14
  WHERE installation.id_installation = @id
END


