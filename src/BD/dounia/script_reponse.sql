/*
Run this script on:

(local).seedserveur    -  This database will be modified

to synchronize it with:

(local).seed

You are recommended to back up your database before running this script

Script created by SQL Data Compare version 11.6.11 from Red Gate Software Ltd at 03/06/2021 12:25:08

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

PRINT(N'Drop constraints from [dbo].[reponse]')
ALTER TABLE [dbo].[reponse] NOCHECK CONSTRAINT [FK219wm9jpvu005i135ahy95so]

PRINT(N'Update rows in [dbo].[reponse]')
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;">Sch�ma simplifi� de la proc�dure des EIE</h5>
	<img src="${pageContext.request.contextPath}/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comit� national des �IE
		<b>CRUI</b> : Commission R�gionale Unifi�e d�Investissement
		<b>EIE</b> : Etude d�Impact sur l�Environnement
		<b>EP</b> : Enqu�te publique
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental. 

	</p>
' WHERE [id_reponse] = 44
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;">Sch�ma simplifi� de la proc�dure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comit� national des �IE
		<b>CRUI</b> : Commission R�gionale Unifi�e d�Investissement
		<b>EIE</b> : Etude d�Impact sur l�Environnement
		<b>EP</b> : Enqu�te publique
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental. 

	</p>' WHERE [id_reponse] = 45
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;">Sch�ma simplifi� de la proc�dure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comit� national des �IE<br>
		<b>CRUI</b> : Commission R�gionale Unifi�e d�Investissement<br>
		<b>EIE</b> : Etude d�Impact sur l�Environnement<br>
		<b>EP</b> : Enqu�te publique<br>
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental.
	</p>' WHERE [id_reponse] = 46
UPDATE [dbo].[reponse] SET [description]=N'<ol>
		<li>Conclusions de l�enqu�te publique ;</li>
		<li>Rapport de l�EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>' WHERE [id_reponse] = 47
UPDATE [dbo].[reponse] SET [description]=N'<ol class="style_number">
		<li>Conclusions de l�enqu�te publique ;</li>
		<li>Rapport de l�EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>' WHERE [id_reponse] = 48
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''�tat initial du site susceptible d''�tre affect� par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caract�ristiques et �tapes de r�alisation du projet y compris les proc�d�s de fabrication, la nature et les quantit�s de mati�res premi�res et les ressources d''�nergie utilis�es, les rejets liquides, gazeux et solides ainsi que les d�chets engendr�s par la r�alisation ou l''exploitation du projet ; </li>
		<li> Une �valuation des impacts positifs, n�gatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant �tre affect� durant les phases de r�alisation, d''exploitation ou de son d�veloppement sur la base des termes de r�f�rences et des directives pr�vues � cet effet ;  </li>
		<li> Les mesures envisag�es par le p�titionnaire pour supprimer, r�duire ou compenser les cons�quences dommageables du projet sur l''environnement ainsi que les mesures visant � mettre en valeur et � am�liorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisag�es en mati�re de formation, de communication et de gestion en vue d''assurer l''ex�cution, l''exploitation et le d�veloppement conform�ment aux prescriptions techniques et aux exigences environnementales adopt�es par l��tude ;  </li>
		<li> Une pr�sentation concise portant sur le cadre juridique et institutionnel aff�rent au projet et � l''immeuble dans lequel sera ex�cut� et exploit� ainsi que les co�ts pr�visionnels du projet ; </li>
		<li> Une note de synth�se r�capitulant le contenu et les conclusions de l��tude ; </li>
		<li> Un r�sum� simplifi� des informations et des principales donn�es contenues dans l''�tude destin� au public. </li>
		
	</ol>

<h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> Document t�l�chargeable.' WHERE [id_reponse] = 52
UPDATE [dbo].[reponse] SET [description]=N'<ul class="style_square">	
	<li>Loi n� 12-03 Relative aux �tudes d''impact sur l''environnement ;</li>
	<li>D�cret n�2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI ;</li>
	<li>D�cret n� 2-04-564 fixant les modalit�s d�organisation et de d�roulement de l�enqu�te publique.</li>
</ul>' WHERE [id_reponse] = 74
UPDATE [dbo].[reponse] SET [description]=N'<ol class="style_number">
		<li>Conclusions de l�enqu�te publique ;</li>
		<li>Rapport de l�EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>' WHERE [id_reponse] = 76
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu r�glementaire de l��IE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> Document t�l�chargeable.' WHERE [id_reponse] = 83
UPDATE [dbo].[reponse] SET [description]=N'<ul class="style_square">	
	<li>Loi n� 12-03 Relative aux �tudes d''impact sur l''environnement ;</li>
	<li>D�cret n�2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI ;</li>
	<li>D�cret n� 2-04-564 fixant les modalit�s d�organisation et de d�roulement de l�enqu�te publique.</li>
</ul>' WHERE [id_reponse] = 101
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;">Sch�ma simplifi� de la proc�dure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comit� national des �IE<br>
		<b>CRUI</b> : Commission R�gionale Unifi�e d�Investissement<br>
		<b>EIE</b> : Etude d�Impact sur l�Environnement<br>
		<b>EP</b> : Enqu�te publique<br>
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental.
	</p>' WHERE [id_reponse] = 102
UPDATE [dbo].[reponse] SET [description]=N'<ol class="style_number">
		<li>Conclusions de l�enqu�te publique ;</li>
		<li>Rapport de l�EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>' WHERE [id_reponse] = 103
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu r�glementaire de l��IE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> Document t�l�chargeable.' WHERE [id_reponse] = 104
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu r�glementaire de l��IE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document t�l�chargeable.</p>' WHERE [id_reponse] = 107
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu r�glementaire de l��IE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document t�l�chargeable.</p>' WHERE [id_reponse] = 108
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu r�glementaire de l��IE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank">Document t�l�chargeable.</a></p>' WHERE [id_reponse] = 109
PRINT(N'Operation applied to 16 rows out of 16')

PRINT(N'Add constraints to [dbo].[reponse]')
ALTER TABLE [dbo].[reponse] WITH CHECK CHECK CONSTRAINT [FK219wm9jpvu005i135ahy95so]
COMMIT TRANSACTION
GO
