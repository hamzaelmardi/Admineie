

update reponse set description=N'<ul class="style_square"><li>Loi n� 12-03 Relative aux �tudes d''impact sur l''environnement ;</li>

<li>Loi n� 49-17 relative � l''evaluation environnementale ;</li>
	<li>D�cret n�2-04-563 relatif aux attributions et au fonctionnement du CNEE et des CREI ;</li>
	<li>D�cret n� 2-04-564 fixant les modalit�s d�organisation et de d�roulement de l�enqu�te publique.</li>

</ul>' where id_reponse=74


PRINT(N'Update rows in [dbo].[question]')
UPDATE [dbo].[question] SET [description]=N'Qu�est-ce que l�Evaluation Environnementale (A int�grer avant la d�finition de l�EIE)?' WHERE [id_question] = 49
UPDATE [dbo].[question] SET [description]=N'Qu�est-ce que la Notice d�Impact sur l�Environnement (NIE) ?' WHERE [id_question] = 50
UPDATE [dbo].[question] SET [description]=N'Qu�est-ce que l�Audit Environnemental (AE) ?' WHERE [id_question] = 51
UPDATE [dbo].[question] SET [description]=N'Quels sont les projets assujettis � la NIE?' WHERE [id_question] = 52






PRINT(N'Update rows in [dbo].[reponse]')
UPDATE [dbo].[reponse] SET [description]=N'L�Evaluation environnementale est une �tude int�grant les aspects environnementaux et sociaux d�un projet, plan, programme ou politique publique pour �valuer ses impacts pr�visibles et permet l�analyse et la justification des options acceptables. Elle comprend l��valuation strat�gique environnementale, l��tude d�impact sur l�environnement, la notice d�impact sur l�environnement et l�audit environnemental', [date_pub]=N'22-06-2021', [heur_pub]=N'11 : 32' WHERE [id_reponse] = 110
UPDATE [dbo].[reponse] SET [description]=N'La Notice d�Impact sur l�Environnement est une �tude concise �labor�e avant la r�alisation des projets non assujettis � l��tude d�impact sur l�environnement qui risquent d�avoir de faibles impacts n�gatifs sur l�environnement � cause de leur dur�e, leur nature, leur dimension et leur lieu d�implantation. Elle permet d��valuer ces impacts et de d�terminer les mesures ad�quates pour �viter, att�nuer ou compenser lesdits impacts.', [date_pub]=N'22-06-2021', [heur_pub]=N'11 : 32' WHERE [id_reponse] = 111
UPDATE [dbo].[reponse] SET [description]=N'L�Audit environnemental est une �tude qui permet l��valuation des impacts directs et indirects, temporaires ou permanents des unit�s industrielles ou activit�s existantes avant la date de publication de cette loi au bulletin officiel et qui sont incluses dans la liste des projets soumis � l��tude d�impact sur l�environnement afin de d�terminer les mesures n�cessaires � prendre pour se conformer aux lois et normes environnementales en vigueur ;', [date_pub]=N'22-06-2021', [heur_pub]=N'11 : 32' WHERE [id_reponse] = 112
UPDATE [dbo].[reponse] SET [description]=N'<img src="/assets/images/EIE_organigrame.png">' WHERE [id_reponse]=102
UPDATE [dbo].[reponse] SET [description]=N'Voir la liste d�assujettissement suivante' WHERE [id_reponse]=100
UPDATE [dbo].[reponse] SET [description]=N'Voir la liste d�assujettissement suivante' WHERE [id_reponse]=114
UPDATE [dbo].[reponse] SET [description]=N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu r�glementaire de l��IE
<img src="/assets/images/EIE_organigrame.png">
<p><h5 style="text-decoration: underline;display: inline;">cahier des charges :</h5> <a href="/assets/images/EIE_organigrame.png" download="doc.png" targer="_blank">Document t�l�chargeable.</a></p>' WHERE [id_reponse]=109


