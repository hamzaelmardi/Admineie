orts  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> InstUSE [seed]
GO
SET IDENTITY_INSERT [dbo].[question] ON

INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (42, NULL, N''Quel est le coût de la procédure ?'', N'''', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (43, NULL, N''Quelles sont les étapes d’obtention d’une Décision d’Acceptabilité Environnementale ?'', N'''', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (44, NULL, N''Quelles sont les pièces nécessaires à la constitution du dossier d’EIE ?'', N'''', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (45, NULL, N''Quel est le contenu du rapport d’Etude d’Impact sur l’Environnement (EIE) et du Programme de Surveillance et de Suivi Environnemental (PSSE) ?'', N'''', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (46, NULL, N''Quels sont les projets assujettis à l’EIE ?'', N'''', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (47, NULL, N''Quel est le référentiel juridique ? (Documents téléchargeables)'', N'''', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (48, NULL, N''Qu’est-ce que l’Etude d’Impact sur l’Environnement ?'', N'''', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (49, CAST(N''2021-02-19T15:54:03.7600000'' AS DateTime2), N''question test 3'', NULL, N''1'', 1, 1, NULL)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (50, CAST(N''2021-02-19T15:53:59.4880000'' AS DateTime2), N''quest test 2'', NULL, N''2'', NULL, 1, 3)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (51, NULL, N'''', N''ما هي مراحل مسطرة دراسة التأثير على البيئة؟'', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (52, CAST(N''2021-02-19T17:29:04.5310000'' AS DateTime2), N'''', N''ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟'', N''1'', NULL, 1, NULL)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (53, NULL, N'''', N''ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟'', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (54, NULL, N'''', N'' ما هو مضمون دراسة التأثير على البيئة و برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي؟'', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (55, NULL, N'''', N''ما هي المشاريع الخاضعة لدراسة التأثير على البيئة؟'', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (56, NULL, N'''', N''ما هو المرجع القانوني لهذه المسطرة؟'', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (57, NULL, N'''', N''ما هي دراسة التأثير على البيئة؟'', N''2'', NULL, 1, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (58, CAST(N''2021-02-22T09:06:44.5010000'' AS DateTime2), N''ppp'', N'''', N''1'', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[reponse] ON

INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (43, N''15-02-2021'', NULL, N''Il n’y a pas de frais exigés par l’administration pour l’instruction d’un dossier EIE. Cependant les documents de l’EIE et les frais de l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge du pétitionnaire selon le Décret n° 2-04-564 du 5 kaada 1429 (4 novembre 2008) fixant les modalités d''''organisation et de déroulement de l''''enquête publique relative aux projets soumis aux études d''''impact sur l''''environnement.'', N''10 : 19'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (44, N''15-02-2021'', NULL, N''<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="${pageContext.request.contextPath}/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental.

	</p>
'', N''10 : 31'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (45, N''15-02-2021'', NULL, N''<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental.

	</p>'', N''10 : 35'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (46, N''15-02-2021'', NULL, N''<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental.
	</p>'', N''10 : 47'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (47, N''15-02-2021'', NULL, N''<ol>
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>'', N''10 : 49'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (48, N''15-02-2021'', NULL, N''<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>'', N''10 : 50'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (49, N''15-02-2021'', NULL, N''<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''''état initial du site susceptible d''''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''''assurer l''''exécution, l''''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''''étude destiné au public. </li>

	</ol>'', N''10 : 56'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (50, N''15-02-2021'', NULL, N''<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''''état initial du site susceptible d''''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''''assurer l''''exécution, l''''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''''étude destiné au public. </li>

	</ol>'', N''10 : 58'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (51, N''15-02-2021'', NULL, N''<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''''état initial du site susceptible d''''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''''assurer l''''exécution, l''''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''''étude destiné au public. </li>

	</ol>'', N''10 : 59'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (52, N''15-02-2021'', NULL, N''<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''''état initial du site susceptible d''''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''''assurer l''''exécution, l''''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''''étude destiné au public. </li>

	</ol>

<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.'', N''11 : 0'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (53, N''15-02-2021'', NULL, N''<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:  </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''''aquaculture et de pisciculture. </li>
	</ol>'', N''11 : 8'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (54, N''15-02-2021'', NULL, N''<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:  </li>
		<p>
			<ol class="style_number">
				<li> Industrie extractive  </li>
				<li> Industrie de l''''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''''élastomères </li>
			</ul>
		</p>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''''aquaculture et de pisciculture. </li>
	</ol>
'', N''11 : 14'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (55, N''15-02-2021'', NULL, N''<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:
		<p>
			<ol class="style_number">
				<li> Industrie extractive  </li>
				<li> Industrie de l''''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''''aquaculture et de pisciculture. </li>
	</ol>'', N''11 : 15'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (56, N''15-02-2021'', NULL, N''<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:
		<p>
			<ol class="style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''''aquaculture et de pisciculture. </li>
	</ol>'', N''11 : 20'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (57, N''15-02-2021'', NULL, N''<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:
		<p>
			<ol class="style_number style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''''aquaculture et de pisciculture. </li>
	</ol>'', N''11 : 23'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (58, N''15-02-2021'', NULL, N''<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''''élastomères </li>
			</ul>
		</p>

		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''''aquaculture et de pisciculture. </li>
	</ol>'', N''11 : 26'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (59, N''15-02-2021'', NULL, N''<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol start="3 style_number_sub">
				<li>
					<ol class="">
						<li> Industrie extractive  </li>
						<li> Industrie de l''''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>

		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''''aquaculture et de pisciculture. </li>
	</ol>
'', N''11 : 28'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (60, N''15-02-2021'', NULL, N''<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol start="3" class="style_number_sub">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>

		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''''aquaculture et de pisciculture. </li>
	</ol>'', N''11 : 30'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (61, N''15-02-2021'', NULL, N''<ol class="style_number style_number_sub">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:

			<ol class="style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''''élastomères </li>
			</ol>
			</li>

		</p>

		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''''aquaculture et de pisciculture. </li>
	</ol>
'', N''11 : 32'', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (62, N''15-02-2021'', NULL, N''<ol class="style_number style_number_sub">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéropallations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
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
', N'11 : 34', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (63, N'15-02-2021', NULL, N'<ol class="style_number">
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
	</ol>', N'11 : 35', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (64, N'15-02-2021', NULL, N'	<ol class="style_number">
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
	</ol>', N'11 : 36', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (65, N'15-02-2021', NULL, N'<ol class="style_number">
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
', N'11 : 39', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (66, N'15-02-2021', NULL, N'<ol class="style_number">
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
	</ol>', N'11 : 41', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (67, N'15-02-2021', NULL, N'<ol class="style_number">
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
', N'11 : 43', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (68, N'15-02-2021', NULL, N'<ol class="style_number">
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
', N'11 : 44', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (69, N'15-02-2021', NULL, N'<ol class="style_number">
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
	</ol>', N'11 : 44', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (70, N'15-02-2021', NULL, N'<ol class="style_number">
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
</ol>', N'11 : 51', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (71, N'15-02-2021', NULL, N'<ol class="style_number">
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
</ol>', N'11 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (72, N'15-02-2021', NULL, N'<ol class="style_number">
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
</ol>', N'12 : 1', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (73, N'15-02-2021', NULL, N'<ol class="style_number">
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
</ol>', N'12 : 3', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (74, N'15-02-2021', NULL, N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEI et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>', N'12 : 5', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (75, N'15-02-2021', NULL, N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement »', N'12 : 5', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (76, N'15-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'12 : 6', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (77, N'15-02-2021', NULL, N'reponse 3', N'12 : 27', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (78, N'15-02-2021', NULL, N'reponse 2', N'12 : 28', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (79, N'19-02-2021', NULL, N' <img src="/assets/images/arab_6.png">', N'16 : 20', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (80, N'19-02-2021', NULL, N'<div>
    <ol>
        <li> استمارة الإشعار بالمشروع: أنظر النموذج على الموقع.</li>
        <li> البحث العمومي: انظر ظهير رقم 2-04-564   ل 5 دي القعدة 1429 الموافق 4 نونبر 2008 الدي ينظم ويحدد شروط البحث العموم الخاص للمشاريع المعنية   بدراسة التأثير على البيئة.</li>
        <li> دراسة التأثير على البيئة.</li>
        <li>برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي. </li>
    </ol>
</div>', N'17 : 30', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (81, N'19-02-2021', NULL, N'	 <img src="/assets/images/arab_5.png">
', N'17 : 42', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (82, N'19-02-2021', NULL, N'
	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'17 : 48', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (83, N'19-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.', N'17 : 56', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (84, N'19-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'17 : 57', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (85, N'19-02-2021', NULL, N'Voir la liste d’assujettissement annexée à la loi n°12-03 relative aux études d''impact sur l''environnement.', N'17 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (86, N'19-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'18 : 2', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (87, N'19-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'18 : 3', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (88, N'19-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'18 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (89, N'19-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'18 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (90, N'19-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'18 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (91, N'19-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'18 : 32', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (92, N'20-02-2021', NULL, N'poipoio', N'17 : 45', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (93, N'22-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'10 : 57', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (94, N'22-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'10 : 57', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (95, N'22-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'10 : 57', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (96, N'22-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (97, N'22-02-2021', NULL, N'<div>
    <ol>
        <li> استمارة الإشعار بالمشروع: أنظر النموذج على الموقع.</li>
        <li> البحث العمومي: انظر ظهير رقم 2-04-564   ل 5 دي القعدة 1429 الموافق 4 نونبر 2008 الدي ينظم ويحدد شروط البحث العموم الخاص للمشاريع المعنية   بدراسة التأثير على البيئة.</li>
        <li> دراسة التأثير على البيئة.</li>
        <li>برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي. </li>
    </ol>
</div>', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (98, N'22-02-2021', NULL, N' <img src="/assets/images/arab_6.png">', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (99, N'22-02-2021', NULL, N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement »', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (100, N'22-02-2021', NULL, N'Voir la liste d’assujettissement annexée à la loi n°12-03 relative aux études d''impact sur l''environnement.', N'10 : 58', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (101, N'22-02-2021', NULL, N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEI et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>', N'10 : 59', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (102, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental.
	</p>', N'10 : 59', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (103, N'22-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 59', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (104, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.', N'10 : 59', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (105, N'22-02-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction d’un dossier EIE. Cependant les documents de l’EIE et les frais de l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge du pétitionnaire selon le Décret n° 2-04-564 du 5 kaada 1429 (4 novembre 2008) fixant les modalités d''organisation et de déroulement de l''enquête publique relative aux projets soumis aux études d''impact sur l''environnement.', N'11 : 0', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (106, N'22-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
   <li class="text-underline" > <a href="/assets/images/arab_5.png" download="doc.png" target="_blank">برنامج المراقبة والتتبع البيئي</a> </li>
</ol>
', N'11 : 2', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (107, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">PSSE :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>', N'11 : 30', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (108, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">PSSE :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>', N'11 : 30', 1)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (109, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">PSSE :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank">Document téléchargeable.</a></p>', N'11 : 32', 1)
SET IDENTITY_INSERT [dbo].[reponse] OFF
GO
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (42, 105)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (43, 102)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (46, 100)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (47, 101)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (48, 99)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (49, 77)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (50, 78)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (51, 98)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (44, 103)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (45, 109)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (53, 97)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (54, 106)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (55, 95)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (56, 94)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (57, 93)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (58, 92)
GO
