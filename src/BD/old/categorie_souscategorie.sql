
delete categoires_demande
delete souscategoires_demande
delete [categorie_souscategorie]
delete [souscategorie]
delete [categorie]
go
SET IDENTITY_INSERT [dbo].[categorie] ON 

INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'INDUSTRIE
EXTRACTIVE
', N'INDUSTRIE
EXTRACTIVE
')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'INDUSTRIE
DE L’ENERGIE
', N'INDUSTRIE
DE L’ENERGIE
')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'INDUSTRIE
METALLURGIQUE ET DE TRAVAIL DES METAUX
', N'INDUSTRIE
METALLURGIQUE ET DE TRAVAIL DES METAUX
')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'INDUSTRIE
MINERALE
', N'INDUSTRIE
MINERALE
')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'INDUSTRIE
CHIMIQUE
', N'INDUSTRIE
CHIMIQUE
')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'INDUSTRIE
MANUFACTURIERE
', N'INDUSTRIE
MANUFACTURIERE
')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'INDUSTRIE
ALIMENTAIRE
', N'INDUSTRIE
ALIMENTAIRE
')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'INFRASTRUCTURES', N'INFRASTRUCTURES')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'AGRICULTURE ET DEVELOPPEMENT RURAL', N'AGRICULTURE ET DEVELOPPEMENT RURAL')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (11, NULL, N'TRAITEMENT ET APPROVISIONNEMENT EN EAU', N'TRAITEMENT ET APPROVISIONNEMENT EN EAU')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (12, NULL, N'DEVELOPPEMENT URBAIN ET TOURISTIQUE', N'DEVELOPPEMENT URBAIN ET TOURISTIQUE')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (13, NULL, N'MODIFICATION OU EXTENSION DES PROJETS

', N'MODIFICATION OU EXTENSION DES PROJETS

')
SET IDENTITY_INSERT [dbo].[categorie] OFF
go

SET IDENTITY_INSERT [dbo].[souscategorie] ON 

INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'Travaux d’exploration minière', N'Travaux d’exploration minière')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'Installations d’oléoducs ', N'Installations d’oléoducs ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'Carrières ', N'Carrières ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'Extractions de matériaux par dragage fluvial', N'Extractions de matériaux par dragage fluvial')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'Sites de stockage géologique de CO2 et installations destinées au captage des flux de CO2 en vue du stockage géologique', N'Sites de stockage géologique de CO2 et installations destinées au captage des flux de CO2 en vue du stockage géologique')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'Centrales thermiques et autres installations de combustion', N'Centrales thermiques et autres installations de combustion')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'Installations destinées à l’exploitation de l’énergie éolienne', N'Installations destinées à l’exploitation de l’énergie éolienne')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'Installations destinées à la production d’énergie hydroélectrique', N'Installations destinées à la production d’énergie hydroélectrique')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'Installations de production d’électricité à partir de l’énergie solaire', N'Installations de production d’électricité à partir de l’énergie solaire')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'Construction de lignes aériennes de transport d’énergie électrique ', N'Construction de lignes aériennes de transport d’énergie électrique ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (11, NULL, N'Stockage aérien de gaz naturel', N'Stockage aérien de gaz naturel')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (12, NULL, N'Canalisations de transport de vapeur, d’eau chaude ou de fluides caloriporteurs', N'Canalisations de transport de vapeur, d’eau chaude ou de fluides caloriporteurs')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (13, NULL, N'Fonderies industrielles de métaux ferreux et non ferreux', N'Fonderies industrielles de métaux ferreux et non ferreux')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (14, NULL, N'Installations destinées à la transformation des métaux ferreux: ', N'Installations destinées à la transformation des métaux ferreux: ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (15, NULL, N'Installations de fusion, à l’exclusion des métaux précieux ', N'Installations de fusion, à l’exclusion des métaux précieux ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (16, NULL, N'Installations de traitement de surface de métaux et matières plastiques ', N'Installations de traitement de surface de métaux et matières plastiques ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (17, NULL, N'Installations destinées à la production de ciment et de plâtre', N'Installations destinées à la production de ciment et de plâtre')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (18, NULL, N'Installations destinées à la production de chaux', N'Installations destinées à la production de chaux')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (19, NULL, N'Fabrication de verres et d’articles en verre', N'Fabrication de verres et d’articles en verre')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (20, NULL, N'Fabrication de fibres de verre', N'Fabrication de fibres de verre')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (21, NULL, N'Fabrication de produits céramiques ou de fibres céramiques', N'Fabrication de produits céramiques ou de fibres céramiques')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (22, NULL, N'Fabrication de produits en terres cuites', N'Fabrication de produits en terres cuites')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (23, NULL, N'Installations de stockage de pétrole, de produits pétrochimiques et chimiques', N'Installations de stockage de pétrole, de produits pétrochimiques et chimiques')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (24, NULL, N'Usines destinées au prétraitement (opérations de lavage, de blanchiment, de mercerisation) ou à la teinture de fibres ou de textiles', N'Usines destinées au prétraitement (opérations de lavage, de blanchiment, de mercerisation) ou à la teinture de fibres ou de textiles')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (25, NULL, N'Tanneries et mégisseries', N'Tanneries et mégisseries')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (26, NULL, N'Fabrication de pâte à papier, papier et carton', N'Fabrication de pâte à papier, papier et carton')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (27, NULL, N'Chantiers navals', N'Chantiers navals')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (28, NULL, N'Autres industries manufacturières', N'Autres industries manufacturières')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (29, NULL, N'Installations destinées à l’abattage d’animaux', N'Installations destinées à l’abattage d’animaux')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (30, NULL, N'Usines de produits laitiers (production du lait et de produits laitiers)', N'Usines de produits laitiers (production du lait et de produits laitiers)')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (31, NULL, N'Fabrications industrielles de produits alimentaires ou d''aliments pour animaux', N'Fabrications industrielles de produits alimentaires ou d''aliments pour animaux')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (32, NULL, N'Fabrication de boissons contenant de l’alcool, production et conditionnement des eaux minérales', N'Fabrication de boissons contenant de l’alcool, production et conditionnement des eaux minérales')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (33, NULL, N'Aérodromes / Héliport', N'Aérodromes / Héliport')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (34, NULL, N'Infrastructures portuaires, maritimes et fluviales', N'Infrastructures portuaires, maritimes et fluviales')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (35, NULL, N'Infrastructures routières (les ponts, tunnels et tranchées couvertes supportant des infrastructures routières)', N'Infrastructures routières (les ponts, tunnels et tranchées couvertes supportant des infrastructures routières)')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (36, NULL, N'Pistes permanentes de course et d’essais pour véhicules motorisés', N'Pistes permanentes de course et d’essais pour véhicules motorisés')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (37, NULL, N'Infrastructures ferroviaires (ponts, tunnels et tranchées couvertes supportant des infrastructures ferroviaires)', N'Infrastructures ferroviaires (ponts, tunnels et tranchées couvertes supportant des infrastructures ferroviaires)')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (38, NULL, N'Tramways, métros aériens et souterrains, lignes suspendues ou lignes analogues de type particulier servant exclusivement ou principalement au transport des personnes', N'Tramways, métros aériens et souterrains, lignes suspendues ou lignes analogues de type particulier servant exclusivement ou principalement au transport des personnes')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (39, NULL, N'Travaux, ouvrages et aménagements en zone côtière', N'Travaux, ouvrages et aménagements en zone côtière')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (40, NULL, N'Création de récifs artificiels', N'Création de récifs artificiels')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (41, NULL, N'Récupération de territoires sur la mer', N'Récupération de territoires sur la mer')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (42, NULL, N'Installations destinées à l’aquaculture et à la pisciculture ', N'Installations destinées à l’aquaculture et à la pisciculture ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (43, NULL, N'Installations destinées à l’élevage de moyenne envergure de volailles', N'Installations destinées à l’élevage de moyenne envergure de volailles')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (44, NULL, N'Installations destinées à l’élevage de moyenne envergure (bovins, chevaux, moutons etc.) ', N'Installations destinées à l’élevage de moyenne envergure (bovins, chevaux, moutons etc.) ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (45, NULL, N'Boisement et déboisement en vue de la reconversion des sols ', N'Boisement et déboisement en vue de la reconversion des sols ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (46, NULL, N'Projets d''affectation de terres incultes ou d''étendues semi-naturelles à l''exploitation agricole.', N'Projets d''affectation de terres incultes ou d''étendues semi-naturelles à l''exploitation agricole.')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (47, NULL, N'Hydraulique agricole, y compris les projets d’irrigation et de drainage de terres', N'Hydraulique agricole, y compris les projets d’irrigation et de drainage de terres')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (48, NULL, N'Barrages et autres installations destinées à retenir et à stocker les eaux d’une manière permanente', N'Barrages et autres installations destinées à retenir et à stocker les eaux d’une manière permanente')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (49, NULL, N'Dispositifs de captage des eaux (de surface, souterraines, de mer)', N'Dispositifs de captage des eaux (de surface, souterraines, de mer)')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (50, NULL, N'Forages en profondeur pour l’approvisionnement en eau', N'Forages en profondeur pour l’approvisionnement en eau')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (51, NULL, N'Dispositifs de recharge artificielle des eaux souterraines', N'Dispositifs de recharge artificielle des eaux souterraines')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (52, NULL, N'Ouvrages servant au transvasement des ressources hydrauliques entre bassins fluviaux (à l’exception des transvasements d’eau potable amenée par canalisation) :', N'Ouvrages servant au transvasement des ressources hydrauliques entre bassins fluviaux (à l’exception des transvasements d’eau potable amenée par canalisation) :')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (53, NULL, N'Installation d''aqueducs sur de longues distances', N'Installation d''aqueducs sur de longues distances')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (54, NULL, N'Stations d''épuration des eaux usées domestiques, industrielles et ouvrages annexes', N'Stations d''épuration des eaux usées domestiques, industrielles et ouvrages annexes')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (55, NULL, N'Aménagement des zones industrielles et des zones d’activités économiques', N'Aménagement des zones industrielles et des zones d’activités économiques')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (56, NULL, N'Travaux et constructions (lotissements, complexes résidentiels, hospitaliers, touristiques, sportifs, commerciales, universitaires ou scientifiques…)', N'Travaux et constructions (lotissements, complexes résidentiels, hospitaliers, touristiques, sportifs, commerciales, universitaires ou scientifiques…)')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (57, NULL, N'Équipements sportifs, culturels ou de loisirs et aménagements associés', N'Équipements sportifs, culturels ou de loisirs et aménagements associés')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (58, NULL, N'Terrains de camping et caravaning ', N'Terrains de camping et caravaning ')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (59, NULL, N'Pistes de ski, remontées mécaniques et téléphériques et aménagements associés', N'Pistes de ski, remontées mécaniques et téléphériques et aménagements associés')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (60, NULL, N'Crématoriums', N'Crématoriums')
INSERT [dbo].[souscategorie] ([id_souscategorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (61, NULL, N'Toute modification ou extension des projets énumérés dans la présente annexe qui répond en elle-même aux seuils éventuels, qui y sont énoncés', N'Toute modification ou extension des projets énumérés dans la présente annexe qui répond en elle-même aux seuils éventuels, qui y sont énoncés')
SET IDENTITY_INSERT [dbo].[souscategorie] OFF
GO

INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (1, 1)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (1, 2)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (1, 3)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (1, 4)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (1, 5)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (2, 6)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (2, 7)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (2, 8)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (2, 9)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (2, 10)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (2, 11)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (2, 12)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (3, 13)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (3, 14)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (3, 15)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (3, 16)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (4, 17)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (4, 18)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (4, 19)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (4, 20)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (4, 21)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (4, 22)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (5, 23)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (7, 24)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (7, 25)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (7, 26)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (7, 27)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (7, 28)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (8, 29)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (8, 30)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (8, 31)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (8, 32)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (9, 33)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (9, 34)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (9, 35)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (9, 36)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (9, 37)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (9, 38)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (9, 39)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (9, 40)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (9, 41)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (10, 42)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (10, 43)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (10, 44)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (10, 45)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (10, 46)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (10, 47)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (11, 48)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (11, 49)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (11, 50)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (11, 51)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (11, 52)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (11, 53)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (11, 54)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (12, 55)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (12, 56)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (12, 57)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (12, 58)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (12, 59)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (12, 60)
INSERT [dbo].[categorie_souscategorie] ([id_cat], [id_souscat]) VALUES (13, 61)
GO