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
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="${pageContext.request.contextPath}/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental. 

	</p>
' WHERE [id_reponse] = 44
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental. 

	</p>' WHERE [id_reponse] = 45
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental.
	</p>' WHERE [id_reponse] = 46
UPDATE [dbo].[reponse] SET [description]=N'<ol>
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>' WHERE [id_reponse] = 47
UPDATE [dbo].[reponse] SET [description]=N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>' WHERE [id_reponse] = 48
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>

<h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> Document téléchargeable.' WHERE [id_reponse] = 52
UPDATE [dbo].[reponse] SET [description]=N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>' WHERE [id_reponse] = 74
UPDATE [dbo].[reponse] SET [description]=N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>' WHERE [id_reponse] = 76
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> Document téléchargeable.' WHERE [id_reponse] = 83
UPDATE [dbo].[reponse] SET [description]=N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>' WHERE [id_reponse] = 101
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEE</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>cahier des charges/CC</b> : Cahier des Charges Environnemental.
	</p>' WHERE [id_reponse] = 102
UPDATE [dbo].[reponse] SET [description]=N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Cahier des Charges nvironnementales. </li>
	</ol>' WHERE [id_reponse] = 103
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> Document téléchargeable.' WHERE [id_reponse] = 104
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>' WHERE [id_reponse] = 107
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>' WHERE [id_reponse] = 108
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank">Document téléchargeable.</a></p>' WHERE [id_reponse] = 109
PRINT(N'Operation applied to 16 rows out of 16')

PRINT(N'Add constraints to [dbo].[reponse]')
ALTER TABLE [dbo].[reponse] WITH CHECK CHECK CONSTRAINT [FK219wm9jpvu005i135ahy95so]
COMMIT TRANSACTION
GO
