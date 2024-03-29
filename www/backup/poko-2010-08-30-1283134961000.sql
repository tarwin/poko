#META_COMMENT=Poko CMS & Example Data
#META_DB_HOST=192.168.1.80
#META_DB_NAME=poko
#META_TABLES=_definitions,_pages,_settings,_users,_users_groups,example_categories,example_images,example_news,example_projects,example_projects_services,example_services

DROP TABLE IF EXISTS _definitions;

CREATE TABLE `_definitions` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `isPage` tinyint(1) NOT NULL DEFAULT '0',
  `table` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `showFiltering` tinyint(1) NOT NULL DEFAULT '0',
  `showOrdering` tinyint(1) NOT NULL DEFAULT '0',
  `showInMenu` tinyint(1) NOT NULL DEFAULT '0',
  `elements` text COLLATE latin1_general_ci,
  `order` float DEFAULT NULL,
  `indents` tinyint(4) NOT NULL DEFAULT '0',
  `postCreateSql` text COLLATE latin1_general_ci NOT NULL,
  `postEditSql` text COLLATE latin1_general_ci NOT NULL,
  `postDeleteSql` text COLLATE latin1_general_ci NOT NULL,
  `postProcedure` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `help` text COLLATE latin1_general_ci NOT NULL,
  `help_list` text COLLATE latin1_general_ci NOT NULL,
  `autoOrdering` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `allowCsv` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO _definitions VALUES ("58","example_projects","","0","example_projects","0","0","1","acy37:site.cms.common.DefinitionElementMetay4:namey6:link_1y4:typey11:linkdisplayy6:dbtypeny5:labely6:Imagesy10:propertiesoR3R4R1R2R6R7y5:tabley14:example_imagesgy5:orderny10:showInListny15:showInFilteringny14:showInOrderingngcR0R1y2:idR3y9:read-onlyR5nR6y2:IDR8oR3R16R1R15R6R17y11:descriptiony0:R12i1R13zR14zgR11nR12i1R13zR14zgcR0R1y8:categoryR3y11:associationR5nR6y8:CategoryR8oR3R21R1R20R6R22R18R19R12i1R13zR14zR9y18:example_categoriesy5:fieldR15y10:fieldLabelR20y8:fieldSqlR19y11:showAsLabely1:0gR11nR12i1R13zR14zgcR0R1R1R3y4:textR5nR6y4:NameR8oR3R29R1R1R6R30R18R19R12i1R13zR14zy11:isMultilineR28y5:widthy3:300y6:heightR19y8:minCharsR19y8:maxCharsR19y9:charsListR19y4:modey5:ALLOWy5:regexR19y10:regexErrorR19y16:regexDescriptionR19y20:regexCaseInsensitiveR28y8:requiredR28y9:formatterR19gR11nR12i1R13zR14zgcR0R1y9:heroimageR3y10:image-fileR5nR6y12:Hero%20ImageR8oR3R47R1R46R6R48R18R19R12i1R13zR14zR44R28y7:isImagey1:1y7:extListR19y7:extModeR39y7:minSizeR19y7:maxSizeR19y10:uploadTypeR50y17:showOnlyLibrariesR19y11:libraryViewR28gR11nR12i1R13zR14zgcR0R1y3:pdfR3R29R5nR6y3:PDFR8oR3R29R1R58R6R59R18R19R12i1R13zR14zR31R28R32R33R34R19R35R19R36R19R37R19R38R39R40R19R41R19R42R19R43R28R44R28R45R19gR11nR12i1R13zR14zgcR0R1R18R3y12:richtext-wymR5nR6y11:DescriptionR8oR3R60R1R18R6R61R18R19R12i1R13zR14zR32y3:400R34y3:200R44R28y11:allowTablesR28y11:allowImagesR50y12:editorStylesR19y15:containersItemsy234:%7B%27name%27%3A%20%27P%27%2C%20%27title%27%3A%20%27Paragraph%27%2C%20%27css%27%3A%20%27wym_containers_p%27%7D%2C%20%0D%0A%7B%27name%27%3A%20%27H1%27%2C%20%27title%27%3A%20%27Heading_1%27%2C%20%27css%27%3A%20%27wym_containers_h1%27%7Dy12:classesItemsR19gR11nR12i1R13zR14zgcR0R1y7:visibleR3y4:boolR5nR6y12:Is%20VisibleR8oR3R71R1R70R6R72R18R19R12i1R13zR14zy9:labelTruey3:Yesy10:labelFalsey2:Noy12:defaultValueR28y14:showHideFieldsR19y13:showHideValueR28gR11nR12i1R13zR14zgh","4","0","","","","","","","|ASC","1");
INSERT INTO _definitions VALUES ("59","example_projects_services","","0","example_projects_services","0","0","1","acy37:site.cms.common.DefinitionElementMetay4:namey2:idy4:typey9:read-onlyy6:dbtypeny5:labely2:IDy10:propertiesoR3R4R1R2R6R7y11:descriptiony0:y10:showInListi1y15:showInFilteringzy14:showInOrderingzgy5:ordernR11i1R12zR13zgcR0R1y9:projectIdR3y11:associationR5nR6y12:Project%20IDR8oR3R16R1R15R6R17R9R10R11i1R12zR13zy5:tabley16:example_projectsy5:fieldR2y10:fieldLabelR1y8:fieldSqlR10y11:showAsLabely1:0gR14nR11i1R12zR13zgcR0R1y9:serviceIdR3R16R5nR6y12:Service%20IDR8oR3R16R1R25R6R26R9R10R11i1R12zR13zR18y16:example_servicesR20R2R21R1R22R10R23R24gR14nR11i1R12zR13zgh","5","0","","","","","","","|ASC","0");
INSERT INTO _definitions VALUES ("60","example_services","","0","example_services","0","0","1","ah","6","0","","","","","","","|ASC","0");
INSERT INTO _definitions VALUES ("54","Test Page","","1","","0","0","0","acy37:site.cms.common.DefinitionElementMetay4:namey5:imagey4:typey10:image-filey6:dbtypeny5:labely5:Imagey10:propertiesoR3R4R1R2R6R7y11:descriptiony0:y10:showInListi1y15:showInFilteringzy14:showInOrderingzy8:requiredy1:0y7:isImagey1:1y7:extListR10y7:extModey5:ALLOWy7:minSizeR10y7:maxSizeR10y10:uploadTypeR17y17:showOnlyLibrariesR10y11:libraryViewR15gy5:orderd1R11i1R12zR13zgcR0R1y7:headingR3y4:textR5nR6y7:HeadingR8oR3R28R1R27R6R29R9R10R11i1R12zR13zy11:isMultilineR15y5:widthy3:300y6:heightR10y8:minCharsR10y8:maxCharsR10y9:charsListR10y4:modeR20y5:regexR10y10:regexErrorR10y16:regexDescriptionR10y20:regexCaseInsensitiveR15R14R15y9:formatterR10gR26d2R11i1R12zR13zgcR0R1y7:contentR3y12:richtext-wymR5nR6y7:ContentR8oR3R44R1R43R6R45R9R10R11i1R12zR13zR31y3:400R33y3:200R14R15y11:allowTablesR15y11:allowImagesR17y12:editorStylesR10y15:containersItemsy234:%7B%27name%27%3A%20%27P%27%2C%20%27title%27%3A%20%27Paragraph%27%2C%20%27css%27%3A%20%27wym_containers_p%27%7D%2C%20%0D%0A%7B%27name%27%3A%20%27H1%27%2C%20%27title%27%3A%20%27Heading_1%27%2C%20%27css%27%3A%20%27wym_containers_h1%27%7Dy12:classesItemsR10gR26d3R11i1R12zR13zgh","1","0","","","","","","","|ASC","0");
INSERT INTO _definitions VALUES ("55","example_categories","","0","example_categories","0","0","1","acy37:site.cms.common.DefinitionElementMetay4:namey2:idy4:typey9:read-onlyy6:dbtypeny5:labely2:IDy10:propertiesoR3R4R1R2R6R7y11:descriptiony0:y10:showInListi1y15:showInFilteringzy14:showInOrderingzgy5:ordernR11i1R12zR13zgcR0R1R9R3y4:textR5nR6y11:DescriptionR8oR3R15R1R9R6R16R9R10R11i1R12zR13zy11:isMultiliney1:0y5:widthy3:300y6:heightR10y8:minCharsR10y8:maxCharsR10y9:charsListR10y4:modey5:ALLOWy5:regexR10y10:regexErrorR10y16:regexDescriptionR10y20:regexCaseInsensitiveR18y8:requiredR18y9:formatterR10gR14nR11i1R12zR13zgcR0R1y8:categoryR3R15R5nR6y8:CategoryR8oR3R15R1R33R6R34R9R10R11i1R12zR13zR17R18R19R20R21R10R22R10R23R10R24R10R25R26R27R10R28R10R29R10R30R18R31R18R32R10gR14nR11i1R12zR13zgh","1","0","","","","","","","|ASC","0");
INSERT INTO _definitions VALUES ("56","example_images","","0","example_images","0","0","1","acy37:site.cms.common.DefinitionElementMetay4:namey2:idy4:typey9:read-onlyy6:dbtypeny5:labely2:IDy10:propertiesoR3R4R1R2R6R7y11:descriptiony0:y10:showInListi1y15:showInFilteringzy14:showInOrderingzgy5:orderd1R11i1R12zR13zgcR0R1y5:imageR3y10:image-fileR5nR6y5:ImageR8oR3R16R1R15R6R17R9R10R11i1R12zR13zy8:requiredy1:0y7:isImagey1:1y7:extListR10y7:extModey5:ALLOWy7:minSizeR10y7:maxSizeR10y10:uploadTypeR21y17:showOnlyLibrariesR10y11:libraryViewR19gR14d2R11i1R12zR13zgcR0R1y7:link_toR3y7:link-toR5nR6R10R8oR3R31R1R30R6R10R9R10R11i1R12zR13zgR14nR11i1R12zR13zgcR0R1y10:link_valueR3y10:link-valueR5nR6R10R8oR3R33R1R32R6R10R9R10R11i1R12zR13zgR14nR11i1R12zR13zgh","2","0","","","","","","","|ASC","0");
INSERT INTO _definitions VALUES ("57","example_news","","0","example_news","0","0","1","acy37:site.cms.common.DefinitionElementMetay4:namey2:idy4:typey9:read-onlyy6:dbtypeny5:labely2:IDy10:propertiesoR3R4R1R2R6R7y11:descriptiony0:y10:showInListi1y15:showInFilteringzy14:showInOrderingzgy5:ordernR11i1R12zR13zgcR0R1y5:titleR3y4:textR5nR6y5:TitleR8oR3R16R1R15R6R17R9R10R11i1R12zR13zy11:isMultiliney1:0y5:widthy3:300y6:heightR10y8:minCharsR10y8:maxCharsR10y9:charsListR10y4:modey5:ALLOWy5:regexR10y10:regexErrorR10y16:regexDescriptionR10y20:regexCaseInsensitiveR19y8:requiredR19y9:formatterR10gR14nR11i1R12zR13zgcR0R1y4:dateR3R34R5nR6y4:DateR8oR3R34R1R34R6R35R9R10R11i1R12zR13zy12:currentOnAddR19y11:restrictMinR19y9:minOffsetR10y11:restrictMaxR19y9:maxOffsetR10R32R19R26y4:DATEgR14nR11i1R12zR13zgcR0R1y7:contentR3y12:richtext-wymR5nR6y7:ContentR8oR3R43R1R42R6R44R9R10R11i1R12zR13zR20y3:400R22y3:200R32R19y11:allowTablesR19y11:allowImagesy1:1y12:editorStylesR10y15:containersItemsy234:%7B%27name%27%3A%20%27P%27%2C%20%27title%27%3A%20%27Paragraph%27%2C%20%27css%27%3A%20%27wym_containers_p%27%7D%2C%20%0D%0A%7B%27name%27%3A%20%27H1%27%2C%20%27title%27%3A%20%27Heading_1%27%2C%20%27css%27%3A%20%27wym_containers_h1%27%7Dy12:classesItemsR10gR14nR11i1R12zR13zgcR0R1R14R3y6:numberR5nR6y5:OrderR8oR3R54R1R14R6R55R9R10R11i1R12zR13zy3:minR10y3:maxR10y5:isInty5:FloatR32R19gR14nR11i1R12zR13zgcR0R1y9:timestampR3R34R5nR6y9:TimestampR8oR3R34R1R60R6R61R9R10R11i1R12zR13zR36R19R37R19R38R10R39R19R40R10R32R19R26y8:DATETIMEgR14nR11i1R12zR13zgh","3","0","","","","","","","|ASC","0");



DROP TABLE IF EXISTS _pages;

CREATE TABLE `_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definitionId` int(22) NOT NULL,
  `data` text COLLATE latin1_general_ci,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO _pages VALUES ("45","54","oy8:__actiony4:edity5:imagey42:c9052c452547b530796144907f38e7ecDesert.jpgy7:headingy24:Test%20Page%20Heading%21y7:contenty146:%3Cp%3EHere%20is%20some%20content%20from%20the%20%3Cstrong%3EWYM%3C%2Fstrong%3E%20%3Cem%3E%28What%20You%20Mean%29%3C%2Fem%3E%20editor%21%3C%2Fp%3Ey8:__submity6:Submitg","2010-08-23 15:26:43");



DROP TABLE IF EXISTS _settings;

CREATE TABLE `_settings` (
  `key` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `value` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO _settings VALUES ("siteView","cy36:site.cms.modules.base.helper.MenuDefy8:headingsaoy4:namey4:Sitey11:isSeperatorfghy5:itemsaoy2:idi38y4:typewy41:site.cms.modules.base.helper.MenuItemTypey4:PAGE:0R2y5:Abouty7:headingR3y6:indentzy12:listChildrenny9:linkChildngoR6i39R7wR8R9:0R2y14:Get%20InvolvedR11R3R12zR13nR14ngoR6i47R7wR8y7:DATASET:0R2y8:ProjectsR11R3R12zR13nR14nghy18:numberOfSeperatorszg");
INSERT INTO _settings VALUES ("googleMapsApiKey","ABQIAAAAPEZwP3fTiAxipcxtf7x-gxT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRPwWSQQtyYryiI5S6KBZMsOwuCsw");
INSERT INTO _settings VALUES ("cms","");
INSERT INTO _settings VALUES ("themeCurrent","default");
INSERT INTO _settings VALUES ("cmsTitle","Poko CMS");
INSERT INTO _settings VALUES ("cmsLogo","cmsLogo.png");
INSERT INTO _settings VALUES ("themeStyle","oy15:colorLinkOnDarky9:%2323A2C5y16:colorLinkOnLightR1y23:colorNavigationLinkBgUpR1y25:colorNavigationLinkBgOverR1y24:colorNavigationLinkColory6:%23fffg");
INSERT INTO _settings VALUES ("live","1");
INSERT INTO _settings VALUES ("nonLiveAddress","./coming_soon/");
INSERT INTO _settings VALUES ("emailSettings","");



DROP TABLE IF EXISTS _users;

CREATE TABLE `_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `groups` text COLLATE latin1_general_ci,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO _users VALUES ("36","tmp","b951e7c61b078198f5a2a5b07c6aafb6","Tarwin","email@email.com","cms_editor,cms_manager,cms_admin","2009-03-30 19:00:19","2009-03-30 18:58:40");
INSERT INTO _users VALUES ("39","user","1a1dc91c907325c69271ddf0c944bc72","user","pass","cms_editor","2010-07-23 11:10:35","2010-07-23 01:08:34");
INSERT INTO _users VALUES ("40","admin","1a1dc91c907325c69271ddf0c944bc72","Admin","admin","cms_editor,cms_manager,cms_admin","2010-08-30 11:39:29","2010-08-30 11:42:22");



DROP TABLE IF EXISTS _users_groups;

CREATE TABLE `_users_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `isSuper` tinyint(1) NOT NULL DEFAULT '0',
  `stub` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `description` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO _users_groups VALUES ("1","0","0","cms_editor","CMS Editor","Can edit CMS content.");
INSERT INTO _users_groups VALUES ("2","1","0","cms_manager","CMS Manager","Can edit CMS content as well as adding / removing CMS editors.");
INSERT INTO _users_groups VALUES ("3","1","1","cms_admin","CMS Admin","Can manage Managers. Can edit definitions.");



DROP TABLE IF EXISTS example_categories;

CREATE TABLE `example_categories` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO example_categories VALUES ("1","Web Projects","Various web projects we have worked on");
INSERT INTO example_categories VALUES ("2","Games","Our games!");
INSERT INTO example_categories VALUES ("5","Something Else","Yet another category!");



DROP TABLE IF EXISTS example_images;

CREATE TABLE `example_images` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `link_to` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `link_value` int(22) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO example_images VALUES ("5","c9052c452547b530796144907f38e7ecDesert.jpg","example_projects","5");
INSERT INTO example_images VALUES ("4","8e8e0527daf5ebde07b139068a1f5e6fChrysanthemum.jpg","example_projects","5");



DROP TABLE IF EXISTS example_news;

CREATE TABLE `example_news` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `date` date NOT NULL,
  `content` text COLLATE latin1_general_ci NOT NULL,
  `order` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO example_news VALUES ("2","helloz","2009-05-14 00:00:00","<p>\"Good Guys &amp; Bad Guys\" Toy Mini Series by Play Imagination in stores late 2009</p>\n<p>&nbsp;</p>","5","2009-06-22 15:14:06");
INSERT INTO example_news VALUES ("4","hello","2009-01-01 00:00:00","<p>this is a test</p>","4","2009-06-19 14:45:05");
INSERT INTO example_news VALUES ("8","Game release ","2009-01-01 00:00:00","<p>this is a test</p>","2","2009-06-19 14:45:53");
INSERT INTO example_news VALUES ("9","test again","2009-01-01 00:00:00","<p><img src=\"../../../../../res/media/galleries/scottys%20images/DSC_4408-2.jpg\" height=\"221\" width=\"333\" /></p><p>dfdsfsdfsdf</p><p>asdfasdf</p><p>adfadsfadsf asdfasdf<br />asdfasdfasdf<br />asdfasdf</p>","1","2009-10-21 19:56:26");
INSERT INTO example_news VALUES ("13","helloz","2009-05-14 00:00:00","<p>\"Good Guys &amp; Bad Guys\" Toy Mini Series by Play Imagination in stores late 2009</p>\n<p>&nbsp;</p>","5","2009-06-22 15:14:06");
INSERT INTO example_news VALUES ("12","fbdf","2009-01-01 00:00:00","<p>dfbdfbdfbfdb</p>","3","2009-06-19 14:45:05");
INSERT INTO example_news VALUES ("14","test againasdfsdfasdf","2009-01-01 00:00:00","<p>sdg</p>","1","2009-07-28 16:00:06");
INSERT INTO example_news VALUES ("15","test again123","2009-01-01 00:00:00","<p>sdg</p>","1","2009-07-28 16:00:53");
INSERT INTO example_news VALUES ("16","test again123asdfasdf","2009-01-01 00:00:00","<p>sdg</p>","1","2009-07-28 16:01:00");



DROP TABLE IF EXISTS example_projects;

CREATE TABLE `example_projects` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `category` int(22) NOT NULL,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `heroimage` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `pdf` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO example_projects VALUES ("5","1","My Websites","0341de70b8f4e8bc8bb57e1a4ee5b70cTulips.jpg","a6b5374d8fe5f1eea88f89883e9fbb86test_pdf.pdf","<p>This is an example projects... This is an example projects... This is an example projects... This is an example projects... <strong>This is an example projects</strong>... This is an example projects... This is an example projects... This is an example projects... This is an example projects... This is an example projects... This is an example projects... <strong><em>This is an example projects</span></em>.</strong>..</p><p>This is an example projects...</p>","1");
INSERT INTO example_projects VALUES ("19","2","Scarygirl","8e8e0527daf5ebde07b139068a1f5e6fChrysanthemum.jpg","6fe03133dc42b88dc2f7f1d58e6273bcDSC_4408-2.jpg","<p>This is a brief project description using the <em>What You Mean Editor!</em></p>","1");



DROP TABLE IF EXISTS example_projects_services;

CREATE TABLE `example_projects_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL,
  `serviceId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO example_projects_services VALUES ("11","12","2");
INSERT INTO example_projects_services VALUES ("248","19","2");
INSERT INTO example_projects_services VALUES ("14","13","1");
INSERT INTO example_projects_services VALUES ("15","13","2");
INSERT INTO example_projects_services VALUES ("17","14","1");
INSERT INTO example_projects_services VALUES ("151","15","1");
INSERT INTO example_projects_services VALUES ("118","16","1");
INSERT INTO example_projects_services VALUES ("37","17","1");
INSERT INTO example_projects_services VALUES ("156","18","1");
INSERT INTO example_projects_services VALUES ("224","20","2");
INSERT INTO example_projects_services VALUES ("223","20","1");
INSERT INTO example_projects_services VALUES ("234","54","1");
INSERT INTO example_projects_services VALUES ("235","55","2");
INSERT INTO example_projects_services VALUES ("236","56","2");
INSERT INTO example_projects_services VALUES ("237","57","2");
INSERT INTO example_projects_services VALUES ("238","58","2");
INSERT INTO example_projects_services VALUES ("239","59","2");
INSERT INTO example_projects_services VALUES ("241","60","2");
INSERT INTO example_projects_services VALUES ("243","61","2");
INSERT INTO example_projects_services VALUES ("244","62","2");
INSERT INTO example_projects_services VALUES ("247","71","2");



DROP TABLE IF EXISTS example_services;

CREATE TABLE `example_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO example_services VALUES ("1","design","<p>good design</p>");
INSERT INTO example_services VALUES ("2","washing","<p>we can wash too</p>");



