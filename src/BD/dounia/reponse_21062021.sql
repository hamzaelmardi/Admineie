

update reponse set description=N'<ul class="style_square"><li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>

<li>Loi n° 49-17 relative à l''evaluation environnementale ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>

</ul>' where id_reponse=74


PRINT(N'Update rows in [dbo].[question]')
UPDATE [dbo].[question] SET [description]=N'Qu’est-ce que l’Evaluation Environnementale (A intégrer avant la définition de l’EIE)?' WHERE [id_question] = 49
UPDATE [dbo].[question] SET [description]=N'Qu’est-ce que la Notice d’Impact sur l’Environnement (NIE) ?' WHERE [id_question] = 50
UPDATE [dbo].[question] SET [description]=N'Qu’est-ce que l’Audit Environnemental (AE) ?' WHERE [id_question] = 51
UPDATE [dbo].[question] SET [description]=N'Quels sont les projets assujettis à la NIE?' WHERE [id_question] = 52






PRINT(N'Update rows in [dbo].[reponse]')
UPDATE [dbo].[reponse] SET [description]=N'L’Evaluation environnementale est une étude intégrant les aspects environnementaux et sociaux d’un projet, plan, programme ou politique publique pour évaluer ses impacts prévisibles et permet l’analyse et la justification des options acceptables. Elle comprend l’évaluation stratégique environnementale, l’étude d’impact sur l’environnement, la notice d’impact sur l’environnement et l’audit environnemental', [date_pub]=N'22-06-2021', [heur_pub]=N'11 : 32' WHERE [id_reponse] = 110
UPDATE [dbo].[reponse] SET [description]=N'La Notice d’Impact sur l’Environnement est une étude concise élaborée avant la réalisation des projets non assujettis à l’étude d’impact sur l’environnement qui risquent d’avoir de faibles impacts négatifs sur l’environnement à cause de leur durée, leur nature, leur dimension et leur lieu d’implantation. Elle permet d’évaluer ces impacts et de déterminer les mesures adéquates pour éviter, atténuer ou compenser lesdits impacts.', [date_pub]=N'22-06-2021', [heur_pub]=N'11 : 32' WHERE [id_reponse] = 111
UPDATE [dbo].[reponse] SET [description]=N'L’Audit environnemental est une étude qui permet l’évaluation des impacts directs et indirects, temporaires ou permanents des unités industrielles ou activités existantes avant la date de publication de cette loi au bulletin officiel et qui sont incluses dans la liste des projets soumis à l’étude d’impact sur l’environnement afin de déterminer les mesures nécessaires à prendre pour se conformer aux lois et normes environnementales en vigueur ;', [date_pub]=N'22-06-2021', [heur_pub]=N'11 : 32' WHERE [id_reponse] = 112
UPDATE [dbo].[reponse] SET [description]=N'<img src="/assets/images/EIE_organigrame.png">' WHERE [id_reponse]=102
UPDATE [dbo].[reponse] SET [description]=N'Voir la liste d’assujettissement suivante' WHERE [id_reponse]=100
UPDATE [dbo].[reponse] SET [description]=N'Voir la liste d’assujettissement suivante' WHERE [id_reponse]=114
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/EIE_organigrame.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/EIE_organigrame.png" download="doc.png" targer="_blank">Document téléchargeable.</a></p>' WHERE [id_reponse]=109


