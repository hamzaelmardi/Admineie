USE [seed]
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (42, NULL, N'VII.	Quel est le coût de la procédure ?', NULL, 1, N'2', NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (43, NULL, N'VI.	Quelles sont les étapes d’obtention d’une Décision d’Acceptabilité Environnementale ?', NULL, 1, N'2', NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (44, NULL, N'V.	Quelles sont les pièces nécessaires à la constitution du dossier d’EIE ?', NULL, 1, N'2', NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (45, NULL, N'IV.	Quel est le contenu du rapport d’Etude d’Impact sur l’Environnement (EIE) et du Programme de Surveillance et de Suivi Environnemental (PSSE) ?', NULL, 1, N'2', NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (46, NULL, N'III. Quels sont les projets assujettis à l’EIE ?', NULL, 1, N'2', NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (47, NULL, N'II. Quel est le référentiel juridique ? (Documents téléchargeables)', NULL, 1, N'2', NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (48, NULL, N'I. Qu’est-ce que l’Etude d’Impact sur l’Environnement ?', NULL, 1, N'2', NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (49, NULL, N'question test 3', NULL, 1, N'1', 1, NULL)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (50, NULL, N'quest test 2', NULL, 1, N'2', NULL, 3)
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[reponse] ON 

INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (43, NULL, 1, N'15-02-2021', N'10 : 19', N'Il n’y a pas de frais exigés par l’administration pour l’instruction d’un dossier EIE. Cependant les documents de l’EIE et les frais de l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge du pétitionnaire selon le Décret n° 2-04-564 du 5 kaada 1429 (4 novembre 2008) fixant les modalités d''organisation et de déroulement de l''enquête publique relative aux projets soumis aux études d''impact sur l''environnement.')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (44, NULL, 1, N'15-02-2021', N'10 : 31', N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="${pageContext.request.contextPath}/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental. 

	</p>
')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (45, NULL, 1, N'15-02-2021', N'10 : 35', N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental. 

	</p>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (46, NULL, 1, N'15-02-2021', N'10 : 47', N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental.
	</p>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (47, NULL, 1, N'15-02-2021', N'10 : 49', N'<ol>
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (48, NULL, 1, N'15-02-2021', N'10 : 50', N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (49, NULL, 1, N'15-02-2021', N'10 : 56', N'<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (50, NULL, 1, N'15-02-2021', N'10 : 58', N'<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (51, NULL, 1, N'15-02-2021', N'10 : 59', N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (52, NULL, 1, N'15-02-2021', N'11 : 0', N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
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

<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (53, NULL, 1, N'15-02-2021', N'11 : 8', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:  </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (54, NULL, 1, N'15-02-2021', N'11 : 14', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:  </li>
		<p>
			<ol class="style_number">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (55, NULL, 1, N'15-02-2021', N'11 : 15', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		<p>
			<ol class="style_number">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (56, NULL, 1, N'15-02-2021', N'11 : 20', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		<p>
			<ol class="style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (57, NULL, 1, N'15-02-2021', N'11 : 23', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		<p>
			<ol class="style_number style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (58, NULL, 1, N'15-02-2021', N'11 : 26', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (59, NULL, 1, N'15-02-2021', N'11 : 28', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol start="3 style_number_sub">
				<li>
					<ol class="">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (60, NULL, 1, N'15-02-2021', N'11 : 30', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol start="3" class="style_number_sub">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (61, NULL, 1, N'15-02-2021', N'11 : 32', N'<ol class="style_number style_number_sub">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ol>
			</li>
				
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (62, NULL, 1, N'15-02-2021', N'11 : 34', N'<ol class="style_number style_number_sub">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number_sub" start="3">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (63, NULL, 1, N'15-02-2021', N'11 : 35', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number_sub" start="3">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (64, NULL, 1, N'15-02-2021', N'11 : 36', N'	<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number_sub" start="3">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (65, NULL, 1, N'15-02-2021', N'11 : 39', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number" >
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (66, NULL, 1, N'15-02-2021', N'11 : 41', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			
			<ol class="">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ol>
				
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (67, NULL, 1, N'15-02-2021', N'11 : 43', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number style_number_sub" start="3">
				<li>
					<ol class=" style_number style_number_sub" start="3">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (68, NULL, 1, N'15-02-2021', N'11 : 44', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		
			<ol class="style_number style_number_sub">
				<li>
					<ol class=" style_number style_number_sub" start="3">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (69, NULL, 1, N'15-02-2021', N'11 : 44', N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		
			<ol class="style_number style_number_sub" start="3">
				<li>
					<ol class=" style_number style_number_sub" start="1">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (70, NULL, 1, N'15-02-2021', N'11 : 51', N'<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p>3.1 - Industrie extractive </p>
        <p>3.2 - Industrie de l''énergie : </p>
        <p>3.3 - Industrie chimique  </p>
        <p>3.4 - Traitement des métaux :  </p>
        <p>3.5 - Industrie des produits alimentaires :  </p>
        <p>3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <p>3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (71, NULL, 1, N'15-02-2021', N'11 : 58', N'<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p>3.1 - Industrie extractive </p>
        <ul class="style_square">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p>3.2 - Industrie de l''énergie : </p>
        <ul class="style_square">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p>3.3 - Industrie chimique  </p>
        <ul class="style_square">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''amiante </li>
        </ul>
        <p>3.4 - Traitement des métaux :  </p>
        <ul class="style_square">
            <li> Usines sidérurgiques </li>
            <li> Traitement de surface et revêtement des métaux </li>
            <li> Chaudronnerie et appareils métalliques </li>
        </ul>
        <p>3.5 - Industrie des produits alimentaires :  </p>
        <ul class="style_square">
            <li>Conserverie de produits animal et végétal ; </li>
            <li>Fabrication de produits laitiers ; </li>
            <li>Fabrication de confiseries et de boissons ; </li>
            <li>Usines de farine de poisson et d''huile de poisson ; </li>
            <li>Féculerie industrielle ;</li>
            <li>Sucreries et transformation de mélasses ; </li>
            <li>Minoteries et semouleries ; </li>
            <li>Huileries. </li>
        </ul>
        <p>3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <ul class="style_square">
            <li>Fabrication de pâte à papier, de papier et de carton ; </li>
            <li>Tanneries et mégisserie ; </li>
            <li>Production et traitement de cellulose ; </li>
            <li>Teinturerie de fibres ; </li>
            <li>Fabrication de panneaux de fibres, de particules et de contre-plaqués ; </li>
            <li>Industrie de textile et teintureries ; </li>
            <li>Poterie. </li>
        </ul>
        <p>3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <p>
        <ul class="style_square">
            <li>Projets de remembrement rural ; </li>
            <li>Projets de reboisement d''une superficie supérieur à 100 hectares ; </li>
            <li>Projets d''affectation de terre inculte ou d''étendue semi-naturelle à l''exploitation agricole intensive. </li>
        </ul>
    </p>
    
    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (72, NULL, 1, N'15-02-2021', N'12 : 1', N'<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p class="pb-1">3.1 - Industrie extractive </p>
        <ul class="style_square ml-5">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p class="pb-1">3.2 - Industrie de l''énergie : </p>
        <ul class="style_square ml-5">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p class="pb-1">3.3 - Industrie chimique  </p>
        <ul class="style_square ml-5">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''amiante </li>
        </ul>
        <p class="pb-1">3.4 - Traitement des métaux :  </p>
        <ul class="style_square ml-5">
            <li> Usines sidérurgiques </li>
            <li> Traitement de surface et revêtement des métaux </li>
            <li> Chaudronnerie et appareils métalliques </li>
        </ul>
        <p class="pb-1">3.5 - Industrie des produits alimentaires :  </p>
        <ul class="style_square ml-5">
            <li>Conserverie de produits animal et végétal ; </li>
            <li>Fabrication de produits laitiers ; </li>
            <li>Fabrication de confiseries et de boissons ; </li>
            <li>Usines de farine de poisson et d''huile de poisson ; </li>
            <li>Féculerie industrielle ;</li>
            <li>Sucreries et transformation de mélasses ; </li>
            <li>Minoteries et semouleries ; </li>
            <li>Huileries. </li>
        </ul>
        <p class="pb-1">3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <ul class="style_square ml-5">
            <li>Fabrication de pâte à papier, de papier et de carton ; </li>
            <li>Tanneries et mégisserie ; </li>
            <li>Production et traitement de cellulose ; </li>
            <li>Teinturerie de fibres ; </li>
            <li>Fabrication de panneaux de fibres, de particules et de contre-plaqués ; </li>
            <li>Industrie de textile et teintureries ; </li>
            <li>Poterie. </li>
        </ul>
        <p class="pb-1">3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <p>
        <ul class="style_square">
            <li>Projets de remembrement rural ; </li>
            <li>Projets de reboisement d''une superficie supérieur à 100 hectares ; </li>
            <li>Projets d''affectation de terre inculte ou d''étendue semi-naturelle à l''exploitation agricole intensive. </li>
        </ul>
    </p>

    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (73, NULL, 1, N'15-02-2021', N'12 : 3', N'<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p class="pb-1mb-1">3.1 - Industrie extractive </p>
        <ul class="style_square ml-5">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p class="mb-1">3.2 - Industrie de l''énergie : </p>
        <ul class="style_square ml-5">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p class="mb-1">3.3 - Industrie chimique  </p>
        <ul class="style_square ml-5">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''amiante </li>
        </ul>
        <p class="mb-1">3.4 - Traitement des métaux :  </p>
        <ul class="style_square ml-5">
            <li> Usines sidérurgiques </li>
            <li> Traitement de surface et revêtement des métaux </li>
            <li> Chaudronnerie et appareils métalliques </li>
        </ul>
        <p class="mb-1">3.5 - Industrie des produits alimentaires :  </p>
        <ul class="style_square ml-5">
            <li>Conserverie de produits animal et végétal ; </li>
            <li>Fabrication de produits laitiers ; </li>
            <li>Fabrication de confiseries et de boissons ; </li>
            <li>Usines de farine de poisson et d''huile de poisson ; </li>
            <li>Féculerie industrielle ;</li>
            <li>Sucreries et transformation de mélasses ; </li>
            <li>Minoteries et semouleries ; </li>
            <li>Huileries. </li>
        </ul>
        <p class="mb-1">3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <ul class="style_square ml-5">
            <li>Fabrication de pâte à papier, de papier et de carton ; </li>
            <li>Tanneries et mégisserie ; </li>
            <li>Production et traitement de cellulose ; </li>
            <li>Teinturerie de fibres ; </li>
            <li>Fabrication de panneaux de fibres, de particules et de contre-plaqués ; </li>
            <li>Industrie de textile et teintureries ; </li>
            <li>Poterie. </li>
        </ul>
        <p class="mb-1">3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <p>
        <ul class="style_square">
            <li>Projets de remembrement rural ; </li>
            <li>Projets de reboisement d''une superficie supérieur à 100 hectares ; </li>
            <li>Projets d''affectation de terre inculte ou d''étendue semi-naturelle à l''exploitation agricole intensive. </li>
        </ul>
    </p>

    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (74, NULL, 1, N'15-02-2021', N'12 : 5', N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEI et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (75, NULL, 1, N'15-02-2021', N'12 : 5', N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement »')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (76, NULL, 1, N'15-02-2021', N'12 : 6', N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (77, NULL, 1, N'15-02-2021', N'12 : 27', N'reponse 3')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [compte_id], [date_pub], [heur_pub], [description]) VALUES (78, NULL, 1, N'15-02-2021', N'12 : 28', N'reponse 2')
SET IDENTITY_INSERT [dbo].[reponse] OFF
GO
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (42, 43)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (43, 46)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (46, 73)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (47, 74)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (48, 75)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (49, 77)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (50, 78)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (44, 76)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (45, 52)
GO
