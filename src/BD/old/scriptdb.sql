USE [master]
GO
/****** Object:  Database [seed]    Script Date: 12/02/2021 09:58:48 ******/
CREATE DATABASE [seed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'seed', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\seed.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'seed_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\seed_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [seed] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [seed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [seed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [seed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [seed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [seed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [seed] SET ARITHABORT OFF 
GO
ALTER DATABASE [seed] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [seed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [seed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [seed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [seed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [seed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [seed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [seed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [seed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [seed] SET  DISABLE_BROKER 
GO
ALTER DATABASE [seed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [seed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [seed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [seed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [seed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [seed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [seed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [seed] SET RECOVERY FULL 
GO
ALTER DATABASE [seed] SET  MULTI_USER 
GO
ALTER DATABASE [seed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [seed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [seed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [seed] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [seed] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [seed] SET QUERY_STORE = OFF
GO
USE [seed]
GO
USE [seed]
GO
/****** Object:  Sequence [dbo].[hibernate_sequence]    Script Date: 12/02/2021 09:58:49 ******/
CREATE SEQUENCE [dbo].[hibernate_sequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[autorisationparam]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autorisationparam](
	[id_autorisation] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_autorisation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caracteristiquephysique]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caracteristiquephysique](
	[id_classification] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_classification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorie]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorie](
	[id_categorie] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[motif_refus] [nvarchar](255) NULL,
	[operation] [nvarchar](255) NULL,
	[projet] [nvarchar](255) NULL,
	[quantite] [nvarchar](255) NULL,
	[site] [nvarchar](255) NULL,
	[structure] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classification]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classification](
	[id_classification] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_classification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[code]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[code](
	[id_code] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[operation] [nvarchar](255) NULL,
	[id_classification] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comite]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comite](
	[comite_id] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[email] [nvarchar](255) NULL,
	[nom_comite_ar] [nvarchar](255) NULL,
	[nom_comite_fr] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
	[type] [nvarchar](255) NULL,
	[id_region] [int] NULL,
	[adresse] [nvarchar](255) NULL,
	[permanent] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[comite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commune]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commune](
	[id_commune] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_commune] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commune_prefecture]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commune_prefecture](
	[id_prefecture] [int] NOT NULL,
	[id_commune] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compte]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compte](
	[compte_id] [int] IDENTITY(1,1) NOT NULL,
	[commission] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[deleted] [nvarchar](255) NULL,
	[depot] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[nom] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
	[profil_id] [int] NULL,
	[societes_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[compte_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact_message]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact_message](
	[id_message] [int] IDENTITY(1,1) NOT NULL,
	[date] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[heur] [nvarchar](255) NULL,
	[message] [nvarchar](255) NULL,
	[reponse] [nvarchar](255) NULL,
	[sujet] [nvarchar](255) NULL,
	[type_msg] [nvarchar](255) NULL,
	[compte_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_message] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[demande_infromation]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[demande_infromation](
	[id_demande_information] [int] IDENTITY(1,1) NOT NULL,
	[commentaire] [nvarchar](255) NULL,
	[commentaire_avis] [nvarchar](255) NULL,
	[contact] [nvarchar](255) NULL,
	[date_depot] [datetime2](7) NULL,
	[date_validation] [datetime2](7) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[effectif] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[fax] [nvarchar](255) NULL,
	[information_projet] [nvarchar](255) NULL,
	[intitule_projet] [nvarchar](255) NULL,
	[nbr_emploi] [nvarchar](255) NULL,
	[num_demande] [nvarchar](255) NULL,
	[petitionaire] [nvarchar](255) NULL,
	[raison_social] [nvarchar](255) NULL,
	[represantant] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
	[tronsfrontalier] [nvarchar](255) NULL,
	[url_enqu_ete_publique1] [nvarchar](255) NULL,
	[url_enqu_ete_publique2] [nvarchar](255) NULL,
	[url_avis] [nvarchar](255) NULL,
	[url_cachier] [nvarchar](255) NULL,
	[url_cachier_defenitive] [nvarchar](255) NULL,
	[url_enquette] [nvarchar](255) NULL,
	[url_enquette_defenitive] [nvarchar](255) NULL,
	[url_etude] [nvarchar](255) NULL,
	[url_presence] [nvarchar](255) NULL,
	[url_pv] [nvarchar](255) NULL,
	[id_categorie] [int] NULL,
	[id_compte] [int] NULL,
	[id_statut] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_demande_information] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doc_import]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doc_import](
	[id_doc_import] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[id_classification] [int] NULL,
	[typeaut] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_doc_import] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eiedre]    Script Date: 12/02/2021 09:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eiedre](
	[id_eiedre] [int] IDENTITY(1,1) NOT NULL,
	[date] [nvarchar](255) NULL,
	[decision] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[objet] [nvarchar](255) NULL,
	[petitionaire] [nvarchar](255) NULL,
	[id_region] [int] NULL,
	[consistance] [nvarchar](255) NULL,
	[montant] [nvarchar](255) NULL,
	[id_commune] [int] NULL,
	[id_prefecture] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_eiedre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eliminateur]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eliminateur](
	[id_eliminateur] [int] IDENTITY(1,1) NOT NULL,
	[adresse_ar] [nvarchar](255) NULL,
	[adresse_fr] [nvarchar](255) NULL,
	[contact_ar] [nvarchar](255) NULL,
	[contact_fr] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[fax] [nvarchar](255) NULL,
	[mail] [nvarchar](255) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
	[idf] [nvarchar](255) NULL,
	[pattente] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_eliminateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entreprise]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entreprise](
	[id_entreprise] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_entreprise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entreprise_val_ou_trait]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entreprise_val_ou_trait](
	[id] [int] NOT NULL,
	[adresse] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[fax] [varchar](255) NULL,
	[id_notification] [int] NULL,
	[nom_entreprise] [varchar](255) NULL,
	[nom_installation] [varchar](255) NULL,
	[num_patente] [varchar](255) NULL,
	[represent_entreprise] [varchar](255) NULL,
	[telephone] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluationparam]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluationparam](
	[id_evaluation] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_evaluation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_historique]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_historique](
	[id_historique] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NULL,
	[etat] [nvarchar](255) NULL,
	[id_notification] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_historique] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[importateurnotifiant]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[importateurnotifiant](
	[id_importateur_notifiant] [int] IDENTITY(1,1) NOT NULL,
	[adresse_ar] [nvarchar](255) NULL,
	[adresse_fr] [nvarchar](255) NULL,
	[contact_ar] [nvarchar](255) NULL,
	[contact_fr] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[fax] [nvarchar](255) NULL,
	[idf] [nvarchar](255) NULL,
	[mail] [nvarchar](255) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[notification_id] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_importateur_notifiant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[info_historique]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info_historique](
	[id_historique] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NULL,
	[etat] [nvarchar](255) NULL,
	[id_demande_info] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_historique] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lieu_elimination]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lieu_elimination](
	[id_lieu_elimination] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[id_classification] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lieu_elimination] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[list_doc_notif]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[list_doc_notif](
	[id_list_doc_notif] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[url] [nvarchar](255) NULL,
	[iddoc_import] [int] NULL,
	[id_notification] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_list_doc_notif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[moyen_transport]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[moyen_transport](
	[id_moyen_transport] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_moyen_transport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notif_tranport]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notif_tranport](
	[id_notification] [int] NOT NULL,
	[id_transporteur] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[id_notification] [int] IDENTITY(1,1) NOT NULL,
	[commentaire] [nvarchar](255) NULL,
	[dated] [nvarchar](255) NULL,
	[date_depot] [datetime2](7) NULL,
	[datef] [nvarchar](255) NULL,
	[date_validation] [datetime2](7) NULL,
	[date_reel] [datetime2](7) NULL,
	[dateaut1] [datetime2](7) NULL,
	[dateaut2] [datetime2](7) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[dernier] [nvarchar](255) NULL,
	[destination_final] [nvarchar](255) NULL,
	[expedition] [nvarchar](255) NULL,
	[lieu] [nvarchar](255) NULL,
	[manutention] [nvarchar](255) NULL,
	[nbr_colis] [nvarchar](255) NULL,
	[nbr_total] [nvarchar](255) NULL,
	[no] [int] NULL,
	[num_notification] [nvarchar](255) NULL,
	[operation] [nvarchar](255) NULL,
	[premier] [varchar](255) NULL,
	[producteur_text] [nvarchar](255) NULL,
	[quantite] [nvarchar](255) NULL,
	[quantite_reel] [nvarchar](255) NULL,
	[serie] [nvarchar](255) NULL,
	[statut] [nvarchar](255) NULL,
	[uniques] [nvarchar](255) NULL,
	[zf_et] [nvarchar](255) NULL,
	[idcaracteristque_physique] [int] NULL,
	[classification_id] [int] NULL,
	[code_id] [int] NULL,
	[compte_id] [int] NULL,
	[ideliminateur] [int] NULL,
	[idimportateur_notifiant] [int] NULL,
	[id_pays] [int] NULL,
	[idproducteur] [int] NULL,
	[transporteur_id] [int] NULL,
	[idtypeconditionnement] [int] NULL,
	[unite_id] [int] NULL,
	[idzonne_franche] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_notification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operation]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operation](
	[id_operation] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[type] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_operation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pays]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pays](
	[pays_id] [int] IDENTITY(1,1) NOT NULL,
	[code_iso] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[pays_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prefecture]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prefecture](
	[id_prefecture] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_prefecture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producteur]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producteur](
	[id_producteur] [int] IDENTITY(1,1) NOT NULL,
	[adresse_ar] [nvarchar](255) NULL,
	[adresse_fr] [nvarchar](255) NULL,
	[contact_ar] [nvarchar](255) NULL,
	[contact_fr] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[fax] [nvarchar](255) NULL,
	[lieu_ar] [nvarchar](255) NULL,
	[lieu_fr] [nvarchar](255) NULL,
	[mail] [nvarchar](255) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
	[idf] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profil]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profil](
	[profil_id] [int] IDENTITY(1,1) NOT NULL,
	[create_date_time] [datetime2](7) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom] [nvarchar](255) NULL,
	[update_date_time] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[profil_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profilerole]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profilerole](
	[profilrole_id] [int] IDENTITY(1,1) NOT NULL,
	[annuler] [nvarchar](255) NULL,
	[modifier] [nvarchar](255) NULL,
	[tous] [nvarchar](255) NULL,
	[valider] [nvarchar](255) NULL,
	[profil_id] [int] NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[profilrole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id_question] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[description] [nvarchar](255) NULL,
	[titre] [nvarchar](255) NULL,
	[compte_id] [int] NULL,
	[type] [nvarchar](255) NULL,
	[id_autorisation] [int] NULL,
	[id_evaluation] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_reponse]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_reponse](
	[id_question] [int] NOT NULL,
	[id_reponse] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region](
	[region_id] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region_demande]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region_demande](
	[id_demande_information] [int] NOT NULL,
	[id_region] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region_prefecture]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region_prefecture](
	[id_region] [int] NOT NULL,
	[id_prefecture] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reponse]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reponse](
	[id_reponse] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[description] [nvarchar](255) NULL,
	[compte_id] [int] NULL,
	[date_pub] [nvarchar](255) NULL,
	[heur_pub] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_reponse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reunion]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reunion](
	[id_reunion] [int] IDENTITY(1,1) NOT NULL,
	[date_reunion] [varchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[description] [nvarchar](255) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[reporte] [nvarchar](255) NULL,
	[demande_information_id] [int] NULL,
	[reunion_ids] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_reunion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[secteur]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secteur](
	[id_secteur] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_secteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[societe]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[societe](
	[societes_id] [int] IDENTITY(1,1) NOT NULL,
	[num_rc] [nvarchar](255) NULL,
	[adresse_ar] [nvarchar](255) NULL,
	[adresse_fr] [nvarchar](255) NULL,
	[captcha] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[deleted] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[etat] [nvarchar](255) NULL,
	[fax] [nvarchar](255) NULL,
	[name_ar] [nvarchar](255) NULL,
	[name_fr] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[raison_ar] [nvarchar](255) NULL,
	[raison_fr] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
	[url_certificat] [nvarchar](255) NULL,
	[url_registre] [nvarchar](255) NULL,
	[profil_id] [int] NULL,
	[idsecteur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[societes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statut_projet]    Script Date: 12/02/2021 09:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statut_projet](
	[id_statut_projet] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_statut_projet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transporteur]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transporteur](
	[id_transporteur] [int] IDENTITY(1,1) NOT NULL,
	[adresse_ar] [nvarchar](255) NULL,
	[adresse_fr] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[fax] [nvarchar](255) NULL,
	[mail] [nvarchar](255) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
	[id_moyen_transport] [int] NULL,
	[idf] [nvarchar](255) NULL,
	[etat] [nvarchar](255) NULL,
	[pattente] [nvarchar](255) NULL,
	[date_pris_charge] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_transporteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transporteur_param_code]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transporteur_param_code](
	[id_transporteur_param] [int] NOT NULL,
	[id_code] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transporteur_param_moyen_transport]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transporteur_param_moyen_transport](
	[id_transporteur_param] [int] NOT NULL,
	[id_moyen_transport] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transporteurparam]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transporteurparam](
	[id_transporteur_param] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[email] [nvarchar](255) NULL,
	[fax] [nvarchar](255) NULL,
	[identifiant] [nvarchar](255) NULL,
	[nom] [nvarchar](255) NULL,
	[tel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_transporteur_param] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[id_type] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[id_code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_conditionement]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_conditionement](
	[type_conditionement_id] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[type_conditionement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unite]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unite](
	[unite_id] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[unite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_normale_role]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_normale_role](
	[user_normale_id] [int] NOT NULL,
	[user_role_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[useradmin]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[useradmin](
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usernormale]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usernormale](
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userrole]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userrole](
	[user_role_id] [int] NOT NULL,
	[afficher] [varchar](255) NULL,
	[ajouter] [varchar](255) NULL,
	[modifier] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[supprimer] [varchar](255) NULL,
	[tous] [varchar](255) NULL,
	[role_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userroleexist]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userroleexist](
	[user_role_id] [int] NOT NULL,
	[afficher] [varchar](255) NULL,
	[ajouter] [varchar](255) NULL,
	[modifier] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[supprimer] [varchar](255) NULL,
	[tous] [varchar](255) NULL,
	[role_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[active] [nvarchar](255) NULL,
	[create_date_time] [datetime2](7) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[email] [nvarchar](255) NULL,
	[nom] [nvarchar](255) NULL,
	[nombre_visit] [int] NULL,
	[pass] [nvarchar](255) NULL,
	[poste] [nvarchar](255) NULL,
	[prenom] [nvarchar](255) NULL,
	[update_date_time] [datetime2](7) NULL,
	[username] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zonnefranche]    Script Date: 12/02/2021 09:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zonnefranche](
	[id_zonnefranche] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[code] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_zonnefranche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[autorisationparam] ON 

INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'Importation dechets (zone franche)')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'Collecte/transport des déchets dangereux')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'Importation des déchets non dangereux d’un pays étranger')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'Installation de traitement des déchets')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'Importation des déchets non dangereux d’une zone franche')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, NULL, N'Exportation des déchets dangereux ')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, NULL, N'Transit des Déchets ')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, NULL, N'Demande de  licence d’importation des déchets non ferreux')
SET IDENTITY_INSERT [dbo].[autorisationparam] OFF
SET IDENTITY_INSERT [dbo].[caracteristiquephysique] ON 

INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'Poudreux/pulvérulent', N'Poudreux/pulvérulent')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'Solide', N'Solide')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'Pâteux/sirupeux', N'Pâteux/sirupeux')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'Boueux', N'Boueux')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'Liquide', N'Liquide')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'Gazeux', N'Gazeux')
SET IDENTITY_INSERT [dbo].[caracteristiquephysique] OFF
SET IDENTITY_INSERT [dbo].[categorie] ON 

INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr], [description], [motif_refus], [operation], [projet], [quantite], [site], [structure]) VALUES (1, NULL, N'categorie1', N'cat1XCF', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr], [description], [motif_refus], [operation], [projet], [quantite], [site], [structure]) VALUES (2, NULL, N'categorie2', N'CAT2', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[categorie] OFF
SET IDENTITY_INSERT [dbo].[classification] ON 

INSERT [dbo].[classification] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'dangereux')
INSERT [dbo].[classification] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'non dangereux')
SET IDENTITY_INSERT [dbo].[classification] OFF
SET IDENTITY_INSERT [dbo].[code] ON 

INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (15, NULL, N'Déchets provenant de l''exploration et de l''exploitation des mines, et des carrières, et de la préparation et du traitement ultérieure de minerais', N'01', NULL, 2)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (16, NULL, N'Déchets provenant de l''extraction des minéraux', N'01 01', NULL, 2)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (17, NULL, N'déchets provenant de l''extraction des minéraux métallifères', N'01 01 01', NULL, 2)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (18, NULL, N'déchets provenant de l''extraction des minéraux non métallifères', N'01 01 02 ', NULL, 2)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (19, CAST(N'2021-01-27T13:41:38.7170000' AS DateTime2), N'sjj', N'shsh', NULL, NULL)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (20, CAST(N'2021-01-27T13:41:39.8790000' AS DateTime2), N'sjj', N'shsh', NULL, NULL)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (21, CAST(N'2021-01-27T13:41:41.5130000' AS DateTime2), N'hhAA', N'171717', NULL, 2)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (22, NULL, N'type de dechts', N'00010001', NULL, 1)
SET IDENTITY_INSERT [dbo].[code] OFF
SET IDENTITY_INSERT [dbo].[comite] ON 

INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (13, CAST(N'2021-01-26T16:14:35.6180000' AS DateTime2), N'dounia@gmail.com', N'twins en arabe', N'twins', N'0656544345', N'Regionale', 6, N'saada fes', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (14, CAST(N'2021-01-26T16:13:51.3650000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1014, CAST(N'2021-01-26T16:13:49.8890000' AS DateTime2), N'email', N'اللجنة', N'dd', N'01191', N'Nationale', 6, N'adresse', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1018, CAST(N'2021-01-26T16:11:39.6190000' AS DateTime2), N'', N'', N'ww', N'', N'Regionale', 6, N'', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1020, CAST(N'2021-01-26T16:14:34.5340000' AS DateTime2), N'email@gmail.com', N'اللجنة', N'comite', N'0676767678', N'Nationale', 6, N'', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1022, CAST(N'2021-01-27T08:17:07.6620000' AS DateTime2), N'', N'q', N'q', N'', N'Nationale', 6, N'', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1024, CAST(N'2021-01-27T08:17:09.6930000' AS DateTime2), N'', N'eeeee', N'comite', N'', N'Nationale', 6, N'', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1025, CAST(N'2021-01-27T08:17:10.7030000' AS DateTime2), N'emaik', N'اللجنة', N'comité', N'09199191', N'Nationale', 6, N'zzzzz', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1026, CAST(N'2021-01-27T08:33:45.7020000' AS DateTime2), N'email@gmail.com', N'اللجنة', N'achraf', N'081818817171', N'1', 6, N'adresse', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1027, CAST(N'2021-01-27T08:33:46.8720000' AS DateTime2), N'', N'اللجنة', N'comite', N'', N'2', NULL, N'', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1028, CAST(N'2021-01-27T08:33:47.9430000' AS DateTime2), N'', N's', N's', N'', N'2', NULL, N'', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1030, CAST(N'2021-01-27T08:33:49.1710000' AS DateTime2), N'', N'', N'qq', N'', N'1', 3, N'', NULL)
INSERT [dbo].[comite] ([comite_id], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [adresse], [permanent]) VALUES (1031, NULL, N'email@gmail.com', N'اللجنة', N'comité', N'10191', N'1', 3, N'adrese', NULL)
SET IDENTITY_INSERT [dbo].[comite] OFF
SET IDENTITY_INSERT [dbo].[commune] ON 

INSERT [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, CAST(N'2021-01-26T09:50:34.0760000' AS DateTime2), N'd', N'd')
INSERT [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'c', N'comune1')
INSERT [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'c', N'comune2')
INSERT [dbo].[commune] ([id_commune], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'c', N'comune3')
SET IDENTITY_INSERT [dbo].[commune] OFF
SET IDENTITY_INSERT [dbo].[compte] ON 

INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1, NULL, NULL, NULL, NULL, N'amal@gmail.com', NULL, N'$2a$10$fI5ip57rH8tG7/kr65.Gy.Yt.lt.uBNzNK9K/Zflt6oG4kB80lIcu', NULL, 1, NULL)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (2, NULL, NULL, NULL, NULL, N'central@mtpnet.gov.ma', NULL, N'$2a$10$fI5ip57rH8tG7/kr65.Gy.Yt.lt.uBNzNK9K/Zflt6oG4kB80lIcu', NULL, NULL, NULL)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (3, NULL, NULL, NULL, NULL, N'at@gmail.com', NULL, N'$2a$10$hp3rHANvyRP5glXjWY27BOarIlzqYgNkAMrNxCQnO4Pit38iAG.8G', NULL, NULL, NULL)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (4, NULL, NULL, NULL, NULL, N'ki@gmail.com', NULL, N'$2a$10$hpL/uXJFpjlwAfi/8sBVbeAt85rR4UEMP..F3NefEu/QjiWXINV36', NULL, NULL, NULL)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (5, NULL, NULL, NULL, NULL, N'hassaneddaoudi1990@gmail.com', NULL, N'$2a$10$fI5ip57rH8tG7/kr65.Gy.Yt.lt.uBNzNK9K/Zflt6oG4kB80lIcu', NULL, 1, 1)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (6, NULL, NULL, NULL, NULL, N'skimohp@gmail.com', NULL, N'$2a$10$5xS.6E.VSQ3TdnTgXBRAW.NaultkDD7zWGw/PQ5CRsKKJwHTdG.x.', NULL, NULL, 3)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (7, NULL, NULL, NULL, NULL, N'test@test.com', NULL, N'$2a$10$f6S3yIpaDqhAfjXBAUP/1ufkw1i7wiVPMi4axhamkRUYx2sWgQeFa', NULL, NULL, 4)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1006, NULL, NULL, NULL, NULL, N'test@test1.com', NULL, N'$2a$10$YhOcyqa3oKqPUj2Iiwm5jO/JRpcUzT84l.36jdmc1TTxv9HaBKRQ6', NULL, NULL, 1002)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1007, NULL, NULL, NULL, NULL, N'test@test2.com', NULL, N'$2a$10$gfBrzVLuIjahn4MovR0LAut/bwGakkrXbi1xG7qSnoAHhxRsErCzq', NULL, NULL, 1003)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1008, NULL, NULL, NULL, NULL, N'hassan@gmail.com', NULL, N'$2a$10$Reoop645IcWGVXSq0tnHU.cTRDlYOitFnxROdiPLcSV3jxONkeEBK', NULL, NULL, 1004)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1009, NULL, NULL, NULL, NULL, N'mazouzyassine05@gmail.com', NULL, N'$2a$10$GZlzhplwnVprdtIeZzcHjezeZKogQAgP55YCkeWFC2VCnS70lv006', NULL, NULL, 1005)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1010, NULL, NULL, NULL, NULL, N'Test2@t.t', NULL, N'$2a$10$475G6w3sFsbgZFmDoOMGxOC2dDJXj1K2sfo712rPk8V2hH7UX5PVe', NULL, NULL, 1006)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1011, NULL, NULL, NULL, NULL, N'dd@dd.d', NULL, N'$2a$10$QSs.zQ61nMcXqgysdx53qu0woJPlDicwXnlCuGlD6vw/rgCGHLSbC', NULL, NULL, 1007)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1012, NULL, NULL, NULL, NULL, N'eie1@gmail.com', NULL, N'$2a$10$Nr2uOPvRqZzhtN0zd6qLVOd5zlzlFGbXzT4YJeE.9kOoe4Hcz3RTW', NULL, NULL, 1008)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1013, NULL, NULL, NULL, NULL, N'eie11@gmail.com', NULL, N'$2a$10$SsV8.OTyZ5kPELJswvwZgOXDu211OhbYejYevqwBUVz3gPI546kfK', NULL, NULL, 1009)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1014, NULL, NULL, NULL, NULL, N'utilisateur@gmail.com', NULL, N'$2a$10$xqiOo4g4MO5WX/JiPZRJVebC1aj8DySYOnAx5IFDKnYsKMML7rBa6', NULL, NULL, 1010)
SET IDENTITY_INSERT [dbo].[compte] OFF
SET IDENTITY_INSERT [dbo].[contact_message] ON 

INSERT [dbo].[contact_message] ([id_message], [date], [delete_date_time], [heur], [message], [reponse], [sujet], [type_msg], [compte_id]) VALUES (1, N'03/02/2021', NULL, N'08 : 07', N'message', NULL, N'object', N'1', 5)
SET IDENTITY_INSERT [dbo].[contact_message] OFF
SET IDENTITY_INSERT [dbo].[demande_infromation] ON 

INSERT [dbo].[demande_infromation] ([id_demande_information], [commentaire], [commentaire_avis], [contact], [date_depot], [date_validation], [delete_date_time], [effectif], [email], [fax], [information_projet], [intitule_projet], [nbr_emploi], [num_demande], [petitionaire], [raison_social], [represantant], [tel], [tronsfrontalier], [url_enqu_ete_publique1], [url_enqu_ete_publique2], [url_avis], [url_cachier], [url_cachier_defenitive], [url_enquette], [url_enquette_defenitive], [url_etude], [url_presence], [url_pv], [id_categorie], [id_compte], [id_statut]) VALUES (1, NULL, N'iuiuiu', N'Raison social', CAST(N'2021-01-27T15:46:43.8470000' AS DateTime2), NULL, NULL, N'12', N'Raison social', N'Raison social', N'sur ', N'Intitulé de projet', N'2', N'N-0', NULL, N'Raison social', NULL, N'Raison social', N'non', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 12)
INSERT [dbo].[demande_infromation] ([id_demande_information], [commentaire], [commentaire_avis], [contact], [date_depot], [date_validation], [delete_date_time], [effectif], [email], [fax], [information_projet], [intitule_projet], [nbr_emploi], [num_demande], [petitionaire], [raison_social], [represantant], [tel], [tronsfrontalier], [url_enqu_ete_publique1], [url_enqu_ete_publique2], [url_avis], [url_cachier], [url_cachier_defenitive], [url_enquette], [url_enquette_defenitive], [url_etude], [url_presence], [url_pv], [id_categorie], [id_compte], [id_statut]) VALUES (2, N'', N'COMMENTAIRE', N'', CAST(N'2021-01-28T08:42:34.0130000' AS DateTime2), CAST(N'2021-01-28T08:43:09.2910000' AS DateTime2), NULL, N'123', N'', N'', N'1', N'A', N'145', N'N-1', NULL, N'AA', NULL, N'A', N'non', N'dossier de configuration.docx', N'Numéro de notification.docx', NULL, N'/assets/myFile/file1062.pdf', N'/assets/myFile/file573.docx', N'/assets/myFile/file860.pdf', N'/assets/myFile/file863.docx', N'/assets/myFile/file643.pdf', N'/assets/myFile/file1148.docx', N'/assets/myFile/file611.docx', 1, 5, 2)
INSERT [dbo].[demande_infromation] ([id_demande_information], [commentaire], [commentaire_avis], [contact], [date_depot], [date_validation], [delete_date_time], [effectif], [email], [fax], [information_projet], [intitule_projet], [nbr_emploi], [num_demande], [petitionaire], [raison_social], [represantant], [tel], [tronsfrontalier], [url_enqu_ete_publique1], [url_enqu_ete_publique2], [url_avis], [url_cachier], [url_cachier_defenitive], [url_enquette], [url_enquette_defenitive], [url_etude], [url_presence], [url_pv], [id_categorie], [id_compte], [id_statut]) VALUES (3, N'commentaire', N'param', N'Représentant', CAST(N'2021-01-28T09:34:48.0190000' AS DateTime2), CAST(N'2021-01-28T09:35:31.3860000' AS DateTime2), NULL, N'45', N'amal@gmail.com', N'0565656565', N'INFORMATION', N'Intitulé de projet', N'23', N'N-2', NULL, N'raison social', NULL, N'0645454545', N'non', N'Structure de l.docx', N'final.docx', NULL, N'/assets/myFile/file1052.pdf', N'/assets/myFile/file1398.docx', N'/assets/myFile/file1010.pdf', N'/assets/myFile/file727.docx', N'/assets/myFile/file810.pdf', N'/assets/myFile/file802.docx', N'/assets/myFile/file525.docx', 1, 5, 5)
INSERT [dbo].[demande_infromation] ([id_demande_information], [commentaire], [commentaire_avis], [contact], [date_depot], [date_validation], [delete_date_time], [effectif], [email], [fax], [information_projet], [intitule_projet], [nbr_emploi], [num_demande], [petitionaire], [raison_social], [represantant], [tel], [tronsfrontalier], [url_enqu_ete_publique1], [url_enqu_ete_publique2], [url_avis], [url_cachier], [url_cachier_defenitive], [url_enquette], [url_enquette_defenitive], [url_etude], [url_presence], [url_pv], [id_categorie], [id_compte], [id_statut]) VALUES (1002, NULL, NULL, N'Représentant', CAST(N'2021-02-02T09:13:27.0540000' AS DateTime2), NULL, NULL, NULL, N'email@gmail.com', N'05454545454', N'', N'Intitulé de projet', N'12', N'N-5', NULL, N'raison social', NULL, N'0678787878', N'non', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 11)
INSERT [dbo].[demande_infromation] ([id_demande_information], [commentaire], [commentaire_avis], [contact], [date_depot], [date_validation], [delete_date_time], [effectif], [email], [fax], [information_projet], [intitule_projet], [nbr_emploi], [num_demande], [petitionaire], [raison_social], [represantant], [tel], [tronsfrontalier], [url_enqu_ete_publique1], [url_enqu_ete_publique2], [url_avis], [url_cachier], [url_cachier_defenitive], [url_enquette], [url_enquette_defenitive], [url_etude], [url_presence], [url_pv], [id_categorie], [id_compte], [id_statut]) VALUES (1003, NULL, NULL, N'Représentant', CAST(N'2021-02-03T10:56:52.3770000' AS DateTime2), NULL, NULL, NULL, N'email@gmail.com', N'05454545454', N's', N'Intitulé de projet', N'12', N'N-4', NULL, N'raison social', NULL, N'0678787878', N'non', N'CPS N° 14-2019-DSI (1).pdf', N'', NULL, N'/assets/myFile/file1435.pdf', NULL, N'/assets/myFile/file1356.pdf', NULL, N'/assets/myFile/file1411.pdf', NULL, NULL, 1, 5, 1)
SET IDENTITY_INSERT [dbo].[demande_infromation] OFF
SET IDENTITY_INSERT [dbo].[doc_import] ON 

INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (1, NULL, N'Contrat', N'Contrat', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (2, NULL, N'doc notification', N'doc notification', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (3, NULL, N'doc mouvement', N'doc mouvement', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (4, NULL, N'doc installation', N'doc installation', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (5, NULL, N'Garantie Financière', N'Garantie Financière', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (6, NULL, N'Analyses/Fiche d’identification DD', N'Analyses/Fiche d’identification DD', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (7, NULL, N' Autorisation d’exploitation l’installation', N' Autorisation d’exploitation l’installation', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (8, NULL, N'Assurance Responsabilité Civile', N'Assurance Responsabilité Civile', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (9, NULL, N'Déclaration l’honneur l’exactitude', N'Déclaration l’honneur l’exactitude', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (11, NULL, N'Déclaration l’honneur l’exactitude', N'Déclaration l’honneur l’exactitude', 2, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (12, NULL, N'Déclaration l’honneur l’exactitude', N'Déclaration l’honneur l’exactitude', 1, N'ZF')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (1011, NULL, N'Demande de l''autorité nationale de l''Etat d''exploitation', N'Demande de l''autorité nationale de l''Etat d''exploitation', 2, N'ET')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (1012, NULL, N'', N'Document de transport', 2, N'ET')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (1013, NULL, N'', N' Garantie financière', 2, N'ET')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (1014, NULL, N'Copie du contrat conclu entre l"exportateur et l''importateur', N'Copie du contrat conclu entre l"exportateur et l''importateur', 2, N'ET')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (1015, NULL, N'Document des analyses physico-chimiques des déchets', N'Document des analyses physico-chimiques des déchets', 2, N'ET')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (1016, NULL, N'Cahier des charges', N'Cahier des charges', 2, N'ET')
SET IDENTITY_INSERT [dbo].[doc_import] OFF
SET IDENTITY_INSERT [dbo].[eliminateur] ON 

INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [idf], [pattente]) VALUES (1, N'adress ar ', N'adress fr', N'co', N'cont fr', NULL, N'0535353535', N'test@gmail.com', N'nomar', N'nom fr', N'0675757575', N'125', N'252')
INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [idf], [pattente]) VALUES (2, NULL, N'adress fr', NULL, N'cont fr', NULL, N'0535353535', N'test@gmail.com', N'nomar', N'nom fr', N'0675757575', N'125', NULL)
INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [idf], [pattente]) VALUES (3, NULL, N'adress fr', NULL, N'cont fr', NULL, N'0535353535', N'test@gmail.com', N'nomar', N'nom fr', N'0675757575', N'125', NULL)
INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [idf], [pattente]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'A', N'A', NULL, NULL, NULL)
INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [idf], [pattente]) VALUES (5, NULL, N'Fes', NULL, N'DK', NULL, N'0545343434', N'email@gmail.com', N'QQ', N'DK', N'0656544345', N'ER45', NULL)
INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [idf], [pattente]) VALUES (6, NULL, N'A', NULL, N'A', NULL, N'A', N'A', N'A', N'A', N'A', N'AA', NULL)
INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [idf], [pattente]) VALUES (1005, NULL, N'ss', NULL, N's', NULL, N's', N's', N's', N's', N's', N's', NULL)
INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [idf], [pattente]) VALUES (1006, NULL, N'5', NULL, N'5', NULL, N'5', N'5', N'66666', N'2', N'5', N'5', NULL)
SET IDENTITY_INSERT [dbo].[eliminateur] OFF
SET IDENTITY_INSERT [dbo].[evaluationparam] ON 

INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'Évaluation environnementale stratégique (EES)')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'Audit environnementale')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'Notice d’impact')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'Etude d’impact environnementale')
SET IDENTITY_INSERT [dbo].[evaluationparam] OFF
SET IDENTITY_INSERT [dbo].[import_historique] ON 

INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification]) VALUES (1, CAST(N'2021-02-10T17:05:58.0970000' AS DateTime2), N'en attente', 3)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification]) VALUES (2, CAST(N'2021-02-10T17:06:02.3160000' AS DateTime2), N'en attente', 3)
SET IDENTITY_INSERT [dbo].[import_historique] OFF
SET IDENTITY_INSERT [dbo].[importateurnotifiant] ON 

INSERT [dbo].[importateurnotifiant] ([id_importateur_notifiant], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [mail], [nom_ar], [nom_fr], [notification_id], [tel]) VALUES (1, NULL, N'33', NULL, N'33', NULL, N'33', N'33', N'33', N'22', N'22', N'1', N'33')
INSERT [dbo].[importateurnotifiant] ([id_importateur_notifiant], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [mail], [nom_ar], [nom_fr], [notification_id], [tel]) VALUES (2, NULL, N'33', NULL, N'33', NULL, N'33', N'33', N'33', N'33', N'33', N'2', N'33')
INSERT [dbo].[importateurnotifiant] ([id_importateur_notifiant], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [mail], [nom_ar], [nom_fr], [notification_id], [tel]) VALUES (3, NULL, N'6', NULL, N'6', NULL, N'6', N'6', N'6', N'6', N'2', N'3', N'66')
SET IDENTITY_INSERT [dbo].[importateurnotifiant] OFF
SET IDENTITY_INSERT [dbo].[list_doc_notif] ON 

INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification]) VALUES (1, NULL, NULL, N'  kkkk', N'/assets/myFile/file948.pdf', 1016, 3)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification]) VALUES (2, NULL, NULL, NULL, N'/assets/myFile/file1311.pdf', 1015, 3)
SET IDENTITY_INSERT [dbo].[list_doc_notif] OFF
SET IDENTITY_INSERT [dbo].[moyen_transport] ON 

INSERT [dbo].[moyen_transport] ([id_moyen_transport], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'Route', N'Route')
INSERT [dbo].[moyen_transport] ([id_moyen_transport], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'Train/Rail', N'Train/Rail')
SET IDENTITY_INSERT [dbo].[moyen_transport] OFF
SET IDENTITY_INSERT [dbo].[notification] ON 

INSERT [dbo].[notification] ([id_notification], [commentaire], [dated], [date_depot], [datef], [date_validation], [date_reel], [dateaut1], [dateaut2], [delete_date_time], [dernier], [destination_final], [expedition], [lieu], [manutention], [nbr_colis], [nbr_total], [no], [num_notification], [operation], [premier], [producteur_text], [quantite], [quantite_reel], [serie], [statut], [uniques], [zf_et], [idcaracteristque_physique], [classification_id], [code_id], [compte_id], [ideliminateur], [idimportateur_notifiant], [id_pays], [idproducteur], [transporteur_id], [idtypeconditionnement], [unite_id], [idzonne_franche]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'valorisation', NULL, N'22', N'22', NULL, NULL, NULL, NULL, NULL, NULL, 2, 17, 5, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[notification] ([id_notification], [commentaire], [dated], [date_depot], [datef], [date_validation], [date_reel], [dateaut1], [dateaut2], [delete_date_time], [dernier], [destination_final], [expedition], [lieu], [manutention], [nbr_colis], [nbr_total], [no], [num_notification], [operation], [premier], [producteur_text], [quantite], [quantite_reel], [serie], [statut], [uniques], [zf_et], [idcaracteristque_physique], [classification_id], [code_id], [compte_id], [ideliminateur], [idimportateur_notifiant], [id_pays], [idproducteur], [transporteur_id], [idtypeconditionnement], [unite_id], [idzonne_franche]) VALUES (2, NULL, NULL, CAST(N'2021-02-10T15:00:57.5833333' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'TW-2021-1', N'valorisation', NULL, N'22', N'222', NULL, NULL, N'Demande_Num', NULL, N'ET', NULL, 2, 17, 5, NULL, 2, 1, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[notification] ([id_notification], [commentaire], [dated], [date_depot], [datef], [date_validation], [date_reel], [dateaut1], [dateaut2], [delete_date_time], [dernier], [destination_final], [expedition], [lieu], [manutention], [nbr_colis], [nbr_total], [no], [num_notification], [operation], [premier], [producteur_text], [quantite], [quantite_reel], [serie], [statut], [uniques], [zf_et], [idcaracteristque_physique], [classification_id], [code_id], [compte_id], [ideliminateur], [idimportateur_notifiant], [id_pays], [idproducteur], [transporteur_id], [idtypeconditionnement], [unite_id], [idzonne_franche]) VALUES (3, NULL, NULL, CAST(N'2021-02-10T18:03:46.9000000' AS DateTime2), NULL, CAST(N'2021-02-10T17:06:02.2550000' AS DateTime2), NULL, NULL, NULL, NULL, N'2021-02-25', NULL, N'12', NULL, NULL, NULL, NULL, 2, N'MR-2021-2', N'valorisation', N'2021-02-26', N'ss', N'12', NULL, NULL, N'en attente', N'Expédition unique ', N'ET', NULL, 2, 17, 5, 1006, 3, 1, 1012, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[notification] OFF
SET IDENTITY_INSERT [dbo].[operation] ON 

INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (1, N'D1', NULL, NULL, N'Dépôt sur ou dans le sol (par ex., mise en décharge, etc.)', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (2, N'D2', NULL, NULL, N'Traitement en milieu terrestre (par ex., biodégradation de déchets liquides ou de boues dans les sols, etc.)', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (3, N'D3', NULL, NULL, N'Injection en profondeur (par ex., injection des déchets pompables dans des puits, des dômes de sel ou des failles géologiques naturelles, etc.)', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (4, N'D4', NULL, NULL, N'Lagunage (par ex., déversement de déchets liquides ou de boues dans des puits, des étangs ou des bassins, etc.) ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (5, N'D5', NULL, NULL, N'Mise en décharge spécialement aménagée (par ex., placement dans des alvéoles étanches séparées, recouvertes et isolées les unes des autres et de l''environnement, etc.)', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (6, N'D6', NULL, NULL, N'Rejet dans le milieu aquatique excepté les mers ou océans', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (7, N'D7', NULL, NULL, N'Rejet dans les mers ou océans, y compris enfouissement dans le sous-sol marin ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (8, N'D8', NULL, NULL, N'Traitement biologique non spécifié ailleurs dans cette liste, aboutissant à des composés ou à des mélanges qui sont éliminés selon l''un des procédés de cette liste ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (9, N'D9', NULL, NULL, N'Traitement physico-chimique non spécifié ailleurs dans cette liste, aboutissant à des composés ou à des mélanges qui sont éliminés selon l''un des procédés de cette liste (par ex., évaporation, séchage, calcination, etc.) ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (10, N'D10', NULL, NULL, N'Incinération à terre ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (11, N'D11', NULL, NULL, N'Incinération en mer', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (12, N'D12', NULL, NULL, N'Stockage permanent (par ex., placement de conteneurs dans une mine, etc.) ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (13, N'D13', NULL, NULL, N'Mélange ou regroupement préalablement à l''une des opérations de cette liste ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (14, N'D14', NULL, NULL, N'Reconditionnement préalablement à l''une des opérations de cette liste ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (15, N'D15', NULL, NULL, N'Stockage préalablement à l''une des opérations de cette liste', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (16, N'R1', NULL, NULL, N'Utilisation comme combustible (autrement qu''en incinération directe) ou autre moyen de produire de l''énergie/utilisé principalement comme combustible ou autre moyen de produire de l’énergie', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (17, N'R2', NULL, NULL, N'Récupération ou régénération des solvants', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (18, N'R3', NULL, NULL, N'Recyclage ou récupération des substances organiques qui ne sont pas utilisées comme solvants', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (19, N'R4', NULL, NULL, N'Recyclage ou récupération des métaux ou des composés métalliques', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (20, N'R5', NULL, NULL, N'Recyclage ou récupération d''autres matières inorganiques', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (21, N'R6', NULL, NULL, N'Régénération des acides ou des bases', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (22, N'R7', NULL, NULL, N'Récupération des produits servant à capter les polluants', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (23, N'R8', NULL, NULL, N'Récupération des produits provenant des catalyseurs', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (24, N'R9', NULL, NULL, N'Régénération ou autres réemplois des huiles usées', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (25, N'R10', NULL, NULL, N'Épandage sur le sol au profit de l''agriculture ou de l''écologie', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (26, N'R11', NULL, NULL, N'Utilisation de matériaux résiduels obtenus à partir de l''une des opérations numérotées de R1 à R10', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (27, N'R12', NULL, NULL, N'Échange de déchets en vue de les soumettre à l''une quelconque des opérations numérotées de R1 à R1 1', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (28, N'R13', NULL, NULL, N'Stockage de matériaux en vue de les soumettre à l''une des opérations de cette liste.', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (29, N'Hl', NULL, NULL, N'Matières explosives', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (30, N'H3', NULL, NULL, N'Matières liquides inflammables', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (31, N'H4.1', NULL, NULL, N'Matières solides inflammables', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (32, N'H4.2', NULL, NULL, N'Matières spontanément inflammables', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (33, N'H4.3', NULL, NULL, N'Matières qui, au contact de l''eau, émettent des gaz inflammables', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (34, N'H5.1', NULL, NULL, N'Matières comburantes', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (35, N'H5.2', NULL, NULL, N'Peroxydes organiques', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (36, N'H6.1', NULL, NULL, N'Matières toxiques (aiguës)', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (37, N'H6.2', NULL, NULL, N'Matières infectieuses', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (38, N'H8', NULL, NULL, N'Matières corrosives', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (39, N'H10', NULL, NULL, N'Matières libérant des gaz toxiques au contact de l''air ou de l''eau', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (40, N'H11', NULL, NULL, N'Matières toxiques (effets différés ou chroniques)', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (41, N'H12', NULL, NULL, N'Matières écotoxiques', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (42, N'H13', NULL, NULL, N'Matières susceptibles après élimination de donner lieu, par quelque moyen que ce soit, à une autre substance, par ex. un produit de lixiviation, qui possède l''une des caractéristiques énumérées ci-dessus', N'Code_H')
SET IDENTITY_INSERT [dbo].[operation] OFF
SET IDENTITY_INSERT [dbo].[pays] ON 

INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, N'MR', NULL, N'المغرب', N'maroc')
SET IDENTITY_INSERT [dbo].[pays] OFF
SET IDENTITY_INSERT [dbo].[prefecture] ON 

INSERT [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, CAST(N'2021-01-26T09:43:22.0270000' AS DateTime2), N'prefe', N'tanger')
INSERT [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, CAST(N'2021-01-26T15:54:42.5670000' AS DateTime2), N'd', N'd')
INSERT [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, CAST(N'2021-01-26T15:54:41.5200000' AS DateTime2), N'slsk', N'skksl')
INSERT [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, CAST(N'2021-01-26T15:54:39.8910000' AS DateTime2), N'slsk', N'skksllokkk')
INSERT [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'slsk', N'tanger')
INSERT [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'slsk', N'fes')
INSERT [dbo].[prefecture] ([id_prefecture], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N's', N'tetouane')
SET IDENTITY_INSERT [dbo].[prefecture] OFF
SET IDENTITY_INSERT [dbo].[producteur] ON 

INSERT [dbo].[producteur] ([id_producteur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [lieu_ar], [lieu_fr], [mail], [nom_ar], [nom_fr], [tel], [idf]) VALUES (8, NULL, N'N°13 rue Balad oulid, Merinides  L''Erac – FES', NULL, N'hassan', NULL, N'0575757575', NULL, NULL, N'hassaneddaoudi1990@gmail.com', N'Hassan ed-daoudi', N'Hassan ed-daoudi', N'0614629664', N'123')
INSERT [dbo].[producteur] ([id_producteur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [lieu_ar], [lieu_fr], [mail], [nom_ar], [nom_fr], [tel], [idf]) VALUES (9, NULL, N'ADRESSE', NULL, N'personne', NULL, N'0667676767', NULL, NULL, N'54545454', N'amal', N'amal', N'07878787', N'1414')
INSERT [dbo].[producteur] ([id_producteur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [lieu_ar], [lieu_fr], [mail], [nom_ar], [nom_fr], [tel], [idf]) VALUES (10, NULL, N'Fes', NULL, N'DK', NULL, N'0545343434', NULL, NULL, N'email@gmail.com', N'DK', N'DK', N'0656544345', N'ER45')
INSERT [dbo].[producteur] ([id_producteur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [lieu_ar], [lieu_fr], [mail], [nom_ar], [nom_fr], [tel], [idf]) VALUES (11, NULL, N'A', NULL, N'A', NULL, N'A', NULL, NULL, N'A', N'A', N'A', N'A', N'AA')
INSERT [dbo].[producteur] ([id_producteur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [lieu_ar], [lieu_fr], [mail], [nom_ar], [nom_fr], [tel], [idf]) VALUES (1010, NULL, N'ADRESSE', NULL, N'PERSOONE', NULL, N'065656565', NULL, NULL, N'email@gmail.com', N'         Producteur(s)des déchets Nom : Nom ', N'Nom ', N'088787878677', N'123')
INSERT [dbo].[producteur] ([id_producteur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [lieu_ar], [lieu_fr], [mail], [nom_ar], [nom_fr], [tel], [idf]) VALUES (1011, NULL, N's', NULL, N's', NULL, N's', NULL, NULL, N's', N's', N's', N's', N's')
INSERT [dbo].[producteur] ([id_producteur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [lieu_ar], [lieu_fr], [mail], [nom_ar], [nom_fr], [tel], [idf]) VALUES (1012, NULL, N'4', NULL, N'4', NULL, N'4', NULL, NULL, N'4', N'4', N'4', N'4', N'4')
SET IDENTITY_INSERT [dbo].[producteur] OFF
SET IDENTITY_INSERT [dbo].[profil] ON 

INSERT [dbo].[profil] ([profil_id], [create_date_time], [delete_date_time], [nom], [update_date_time]) VALUES (1, NULL, NULL, N'ADMIN', NULL)
SET IDENTITY_INSERT [dbo].[profil] OFF
SET IDENTITY_INSERT [dbo].[profilerole] ON 

INSERT [dbo].[profilerole] ([profilrole_id], [annuler], [modifier], [tous], [valider], [profil_id], [role_id]) VALUES (1, N'oui', N'oui', N'oui', N'oui', 1, 1)
SET IDENTITY_INSERT [dbo].[profilerole] OFF
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (1, CAST(N'2021-02-05T08:41:18.6410000' AS DateTime2), N'DERIPTIONk', N'TITRE', 5, NULL, NULL, NULL)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (2, NULL, N'question1', NULL, 1, N'1', 1, NULL)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (3, NULL, N'QUESTION2', NULL, 1, N'2', NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [titre], [compte_id], [type], [id_autorisation], [id_evaluation]) VALUES (4, NULL, N'questions123', NULL, 1, N'1', 1, NULL)
SET IDENTITY_INSERT [dbo].[question] OFF
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (2, 4)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (3, 5)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (4, 6)
SET IDENTITY_INSERT [dbo].[region] ON 

INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'جهة طنجة تطوان الحسيمة', N'Tanger')
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'جهة الشرق', N'Oriental')
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'جهة فاس مكناس', N'Fès-Boulemane')
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'جهة الدار البيضاء سطات', N'Grand Casablanca')
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'جهة مراكش آسفي', N'Marrakech-Tensift-Al Haouz ')
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'جهة سوس ماسة', N'Souss-Massa-Drâa ')
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, CAST(N'2021-01-26T09:11:42.4240000' AS DateTime2), N'hh', N'hh')
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, CAST(N'2021-01-26T09:11:45.0050000' AS DateTime2), NULL, N'jjjjjjjj')
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1010, CAST(N'2021-01-27T13:37:17.1250000' AS DateTime2), N'S', N'S')
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1011, CAST(N'2021-01-27T13:37:17.1250000' AS DateTime2), N'S', N'SS')
SET IDENTITY_INSERT [dbo].[region] OFF
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (1, 3)
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (2, 2)
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (2, 3)
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (3, 2)
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (3, 3)
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (1002, 4)
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (1003, 4)
INSERT [dbo].[region_prefecture] ([id_region], [id_prefecture]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[reponse] ON 

INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [description], [compte_id], [date_pub], [heur_pub]) VALUES (1, NULL, N'OUI BIEN SUR', 5, N'3-02-2021', N'8 : 8')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [description], [compte_id], [date_pub], [heur_pub]) VALUES (2, NULL, N'il faut dposer votre demande', 5, N'3-02-2021', N'8 : 9')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [description], [compte_id], [date_pub], [heur_pub]) VALUES (3, NULL, N'reponse', 1, N'5-02-2021', N'8 : 46')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [description], [compte_id], [date_pub], [heur_pub]) VALUES (4, NULL, N'reponse1', 1, N'5-02-2021', N'8 : 46')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [description], [compte_id], [date_pub], [heur_pub]) VALUES (5, NULL, N'REPONSE2', 1, N'5-02-2021', N'8 : 49')
INSERT [dbo].[reponse] ([id_reponse], [delete_date_time], [description], [compte_id], [date_pub], [heur_pub]) VALUES (6, NULL, N'reposnseee121213', 1, N'5-02-2021', N'9 : 43')
SET IDENTITY_INSERT [dbo].[reponse] OFF
SET IDENTITY_INSERT [dbo].[reunion] ON 

INSERT [dbo].[reunion] ([id_reunion], [date_reunion], [delete_date_time], [description], [nom_ar], [nom_fr], [reporte], [demande_information_id], [reunion_ids]) VALUES (1, N'2021-01-21', NULL, NULL, NULL, N'REUNION', N'oui', 2, NULL)
INSERT [dbo].[reunion] ([id_reunion], [date_reunion], [delete_date_time], [description], [nom_ar], [nom_fr], [reporte], [demande_information_id], [reunion_ids]) VALUES (2, N'2021-01-15', NULL, NULL, NULL, N'reunion2', NULL, 3, NULL)
INSERT [dbo].[reunion] ([id_reunion], [date_reunion], [delete_date_time], [description], [nom_ar], [nom_fr], [reporte], [demande_information_id], [reunion_ids]) VALUES (3, N'2021-01-29', NULL, NULL, NULL, N'REUNION', NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[reunion] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (1, N'ADMIN', N'ROLE_ADMIN')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[secteur] ON 

INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'AGRICULTURE, SYLVICULTURE ET PÒCHE', N'AGRICULTURE, SYLVICULTURE ET PÒCHE')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'INDUSTRIES EXTRACTIVES', N'INDUSTRIES EXTRACTIVES')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'INDUSTRIE MANUFACTURIÔRE', N'INDUSTRIE MANUFACTURIÔRE')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'CONSTRUCTION', N'CONSTRUCTION')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'TRANSPORTS ET ENTREPOSAGE', N'TRANSPORTS ET ENTREPOSAGE')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1002, CAST(N'2021-01-21T16:57:43.8890000' AS DateTime2), N'secetru', N'secetru')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1003, CAST(N'2021-01-21T16:57:42.4040000' AS DateTime2), N'secteur', N'secteur')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1004, CAST(N'2021-01-21T16:57:41.1520000' AS DateTime2), N'q', N'qllooooolo')
SET IDENTITY_INSERT [dbo].[secteur] OFF
SET IDENTITY_INSERT [dbo].[societe] ON 

INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, N'hassaneddaoudi1990@gmail.com', NULL, NULL, N'hassan', N'hassan', N'$2a$10$fI5ip57rH8tG7/kr65.Gy.Yt.lt.uBNzNK9K/Zflt6oG4kB80lIcu', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (3, NULL, N'DSFSF', N'SFS', N'38657', NULL, NULL, N'skimohp@gmail.com', N'1', N'0636662288', NULL, N'yassinemz', N'$2a$10$fI5ip57rH8tG7/kr65.Gy.Yt.lt.uBNzNK9K/Zflt6oG4kB80lIcu', N'EFESF', N'SDFSD', N'0625143455', NULL, NULL, NULL, 3)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (4, NULL, N'gg', N'hh', N'89761', NULL, NULL, N'test@test.com', N'1', N'0575757575', NULL, N'test', N'$2a$10$fI5ip57rH8tG7/kr65.Gy.Yt.lt.uBNzNK9K/Zflt6oG4kB80lIcu', N'ismcharika', N'akakka', N'0614629664', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1002, NULL, N'000', N'000', N'75112', NULL, NULL, N'test@test1.com', N'0', N'0575757575', NULL, N'hassaneddaoudi1990@gmail.com', N'$2a$10$8dU4AwEfconcy/inrIqjEeq9fsYiTwLtT3sLfQs7Yr5zX67DrjUDS', N'raison sco', N'', N'0000000000', NULL, NULL, NULL, 2)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1003, NULL, N'000', N'000', N'62512', NULL, NULL, N'test@test2.com', N'0', N'0575757575', NULL, N'hassaneddaoudi1990@gmail.com', N'$2a$10$AmviAe3Z1CzsY8W0Ttsqq..1cosypm7Ap9y/1x7tzds5vcUIEiM9O', N'twins', N'twins2', N'0000000000', NULL, NULL, NULL, 2)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1004, NULL, N'000', N'000', N'48352', NULL, NULL, N'hassan@gmail.com', N'0', N'0575757575', NULL, N'hassaneddaoudi1990@gmail.com', N'$2a$10$CFW.UVdX2vpgRZf0CU1bS.TCkcLDMQat89GuRRLQFtVMR8tjPjBRm', N'raison sco', N'twins2', N'0000000000', NULL, NULL, NULL, 2)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1005, NULL, N'QSDSF', N'QSFDSQF', N'52614', NULL, NULL, N'mazouzyassine05@gmail.com', N'1', N'0627273748', NULL, N'yassinemz', N'$2a$10$GOh98DPC/4ioikWLJ18Ao.ApQtNBYh5jBHF/W2cSzkKHjpg2JENMK', N'QSFSQF', N'QSDS', N'0636363633', NULL, NULL, NULL, 3)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1006, NULL, N'000', N'000', N'34461', NULL, NULL, N'Test2@t.t', N'0', N'0575757575', NULL, N'hassaneddaoudi1990@gmail.com', N'$2a$10$t8DFEj4b/2EDoRv.C9HKlun97pBTagicmSB7.fPMFUGUDB.iztubW', N'twins', N'twins2', N'0000000000', NULL, NULL, NULL, 3)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1007, NULL, N'dd', N'dd', N'72332', NULL, NULL, N'dd@dd.d', N'0', N'0575757575', NULL, N'hassaneddaoudi1990@gmail.com', N'$2a$10$7T3LklDSZEAP8KvTfGJqMOR0LM9HgT2LCQW13HIBv8Clk16.MHbgG', N'twins', N'twins', N'0614629664', NULL, NULL, NULL, 2)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1008, NULL, N'', N'', N'', NULL, NULL, N'eie11@gmail.com', N'0', N'0788888899', NULL, N'amola', N'$2a$10$4LHU98P4x3rsN3LJaKSBkOzNkQufkFWsspKMY/hmHMKDi3bQcj3tK', N'amola', N'rais', N'0676767670', NULL, NULL, NULL, 2)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1009, NULL, N'', N'', N'18172', NULL, NULL, N'eie1@gmail.com', N'0', N'0788888899', NULL, N'amola', N'$2a$10$mjbgkoSBo8TVxJEPa21rK.OuT9VczdJJLk1cXiMOzi9D1rO6xEhqe', N'amola', N'rais', N'0676767670', NULL, NULL, NULL, 2)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1010, NULL, N'adresse', N'adresse', N'73251', NULL, NULL, N'utilisateur@gmail.com', N'0', N'0545454545', NULL, N'nom ', N'$2a$10$AZgcmh3i.4y7oFdrEe5AR..rODwEWX5GbHb9rLaM0Rw2lpuvk4iXi', N'societe', N'societ', N'0656565656', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[societe] OFF
SET IDENTITY_INSERT [dbo].[statut_projet] ON 

INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'en attente', N'en attente')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'réunion planifier', N'réunion planifier')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'Non Acceptable', N'Non Acceptable')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'Quorum no atteint', N'Quorum no atteint')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'Attente Signature', N'Attente Signature')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'Signé', N'Signé')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'attente documents définitive', N'attente documents définitive')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'arrete d''examen', N'arrete d''examen')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'Documment definitive attaché', N'Documment definitive attaché')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'Document à amélioré', N'Document à amélioré')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (11, NULL, N'Rensignement', N'Rensignement')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (12, NULL, N'Conforme', N'Conforme')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (13, NULL, N'Avis de projet', N'Avis de projet')
SET IDENTITY_INSERT [dbo].[statut_projet] OFF
SET IDENTITY_INSERT [dbo].[transporteur] ON 

INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, N'AQUAFLORE PROTECT', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, N'LOGIPRO', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, N'SITA MAROC RECYCLING ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, N'DACHSER', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, N'SELSAFAA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, N'ECONORME', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, N'ECORECYCLAGE', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, N'POLLUCLEAN', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, N'NITAN-', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (13, NULL, NULL, NULL, NULL, NULL, NULL, N'VACUM-', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, N'POMPAGE ET RAFFINAGE DU MAROC', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, N'LUBO ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, N'TRANSIT JALAL- ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, N'MEGATRATEMENT', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, N'Mama Marine', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[transporteur] OFF
INSERT [dbo].[transporteur_param_code] ([id_transporteur_param], [id_code]) VALUES (1, 18)
INSERT [dbo].[transporteur_param_code] ([id_transporteur_param], [id_code]) VALUES (1, 17)
INSERT [dbo].[transporteur_param_code] ([id_transporteur_param], [id_code]) VALUES (1, 16)
INSERT [dbo].[transporteur_param_code] ([id_transporteur_param], [id_code]) VALUES (2, 18)
INSERT [dbo].[transporteur_param_moyen_transport] ([id_transporteur_param], [id_moyen_transport]) VALUES (1, 2)
INSERT [dbo].[transporteur_param_moyen_transport] ([id_transporteur_param], [id_moyen_transport]) VALUES (1, 1)
INSERT [dbo].[transporteur_param_moyen_transport] ([id_transporteur_param], [id_moyen_transport]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[transporteurparam] ON 

INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel]) VALUES (1, NULL, N'EMAIL', N'33', N'23', N'Transporteur CR', N'AJAJ')
INSERT [dbo].[transporteurparam] ([id_transporteur_param], [delete_date_time], [email], [fax], [identifiant], [nom], [tel]) VALUES (2, NULL, N'eaol', N'22', N'23', N'transporteur xx', N'1911')
SET IDENTITY_INSERT [dbo].[transporteurparam] OFF
SET IDENTITY_INSERT [dbo].[type_conditionement] ON 

INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'Fût métallique')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'Tonneau en bois')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'Bidon (jerricane)')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'Caisse')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'Sac')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, NULL, N'Emballage composite')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, NULL, N'Récipient à pression')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, NULL, N'Récipient pour vrac')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, NULL, N'Autre (préciser)')
SET IDENTITY_INSERT [dbo].[type_conditionement] OFF
SET IDENTITY_INSERT [dbo].[unite] ON 

INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'kg', N'kg')
INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'm', N'm')
SET IDENTITY_INSERT [dbo].[unite] OFF
SET IDENTITY_INSERT [dbo].[zonnefranche] ON 

INSERT [dbo].[zonnefranche] ([id_zonnefranche], [delete_date_time], [nom_ar], [nom_fr], [code]) VALUES (2, NULL, N'TANGER', N'TANGER', N'ZT')
INSERT [dbo].[zonnefranche] ([id_zonnefranche], [delete_date_time], [nom_ar], [nom_fr], [code]) VALUES (3, NULL, N'KHENITRA', N'KHENITRA', N'ZK')
SET IDENTITY_INSERT [dbo].[zonnefranche] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_r43af9ap4edm43mmtq01oddj6]    Script Date: 12/02/2021 09:58:51 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UK_r43af9ap4edm43mmtq01oddj6] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[notification] ADD  DEFAULT ((0)) FOR [no]
GO
ALTER TABLE [dbo].[code]  WITH CHECK ADD  CONSTRAINT [FK1912gg6ioe9dx7buwdxm32mrj] FOREIGN KEY([id_classification])
REFERENCES [dbo].[classification] ([id_classification])
GO
ALTER TABLE [dbo].[code] CHECK CONSTRAINT [FK1912gg6ioe9dx7buwdxm32mrj]
GO
ALTER TABLE [dbo].[comite]  WITH CHECK ADD  CONSTRAINT [FKao63rrnrfswts88rv5pdt0c82] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([region_id])
GO
ALTER TABLE [dbo].[comite] CHECK CONSTRAINT [FKao63rrnrfswts88rv5pdt0c82]
GO
ALTER TABLE [dbo].[commune_prefecture]  WITH CHECK ADD  CONSTRAINT [FKj0mkb6wr874gk11m08llbotdi] FOREIGN KEY([id_prefecture])
REFERENCES [dbo].[prefecture] ([id_prefecture])
GO
ALTER TABLE [dbo].[commune_prefecture] CHECK CONSTRAINT [FKj0mkb6wr874gk11m08llbotdi]
GO
ALTER TABLE [dbo].[commune_prefecture]  WITH CHECK ADD  CONSTRAINT [FKlyoog3cfl2ue2r73ss8akdk23] FOREIGN KEY([id_commune])
REFERENCES [dbo].[commune] ([id_commune])
GO
ALTER TABLE [dbo].[commune_prefecture] CHECK CONSTRAINT [FKlyoog3cfl2ue2r73ss8akdk23]
GO
ALTER TABLE [dbo].[commune_prefecture]  WITH CHECK ADD  CONSTRAINT [FKtb4nl65vbfm7a2kbhkk378ax5] FOREIGN KEY([id_prefecture])
REFERENCES [dbo].[region] ([region_id])
GO
ALTER TABLE [dbo].[commune_prefecture] CHECK CONSTRAINT [FKtb4nl65vbfm7a2kbhkk378ax5]
GO
ALTER TABLE [dbo].[compte]  WITH CHECK ADD  CONSTRAINT [FKjgjfwpm83x17wxj6usdxsj15h] FOREIGN KEY([societes_id])
REFERENCES [dbo].[societe] ([societes_id])
GO
ALTER TABLE [dbo].[compte] CHECK CONSTRAINT [FKjgjfwpm83x17wxj6usdxsj15h]
GO
ALTER TABLE [dbo].[compte]  WITH CHECK ADD  CONSTRAINT [FKr1m349w78hwtvjjdd4m1gkhj0] FOREIGN KEY([profil_id])
REFERENCES [dbo].[profil] ([profil_id])
GO
ALTER TABLE [dbo].[compte] CHECK CONSTRAINT [FKr1m349w78hwtvjjdd4m1gkhj0]
GO
ALTER TABLE [dbo].[contact_message]  WITH CHECK ADD  CONSTRAINT [FK55lfo6o8ceiwauh2jsqdn2pyf] FOREIGN KEY([compte_id])
REFERENCES [dbo].[compte] ([compte_id])
GO
ALTER TABLE [dbo].[contact_message] CHECK CONSTRAINT [FK55lfo6o8ceiwauh2jsqdn2pyf]
GO
ALTER TABLE [dbo].[demande_infromation]  WITH CHECK ADD  CONSTRAINT [FK460fk34axjhpe3dvpl9nnocei] FOREIGN KEY([id_categorie])
REFERENCES [dbo].[categorie] ([id_categorie])
GO
ALTER TABLE [dbo].[demande_infromation] CHECK CONSTRAINT [FK460fk34axjhpe3dvpl9nnocei]
GO
ALTER TABLE [dbo].[demande_infromation]  WITH CHECK ADD  CONSTRAINT [FKde5fyw6lkffg4fuq7j8u7xgsn] FOREIGN KEY([id_compte])
REFERENCES [dbo].[compte] ([compte_id])
GO
ALTER TABLE [dbo].[demande_infromation] CHECK CONSTRAINT [FKde5fyw6lkffg4fuq7j8u7xgsn]
GO
ALTER TABLE [dbo].[demande_infromation]  WITH CHECK ADD  CONSTRAINT [FKe2nwbswtyxw1qsldt7bggh4b2] FOREIGN KEY([id_statut])
REFERENCES [dbo].[statut_projet] ([id_statut_projet])
GO
ALTER TABLE [dbo].[demande_infromation] CHECK CONSTRAINT [FKe2nwbswtyxw1qsldt7bggh4b2]
GO
ALTER TABLE [dbo].[doc_import]  WITH CHECK ADD  CONSTRAINT [FK6prqh7r9ygyllg64bgyverxcp] FOREIGN KEY([id_classification])
REFERENCES [dbo].[classification] ([id_classification])
GO
ALTER TABLE [dbo].[doc_import] CHECK CONSTRAINT [FK6prqh7r9ygyllg64bgyverxcp]
GO
ALTER TABLE [dbo].[eiedre]  WITH CHECK ADD  CONSTRAINT [FK1rdauhpwr4tic3kckeutelji7] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([region_id])
GO
ALTER TABLE [dbo].[eiedre] CHECK CONSTRAINT [FK1rdauhpwr4tic3kckeutelji7]
GO
ALTER TABLE [dbo].[eiedre]  WITH CHECK ADD  CONSTRAINT [FKbkkbv1wf1m466x6ugkfgaoukw] FOREIGN KEY([id_prefecture])
REFERENCES [dbo].[prefecture] ([id_prefecture])
GO
ALTER TABLE [dbo].[eiedre] CHECK CONSTRAINT [FKbkkbv1wf1m466x6ugkfgaoukw]
GO
ALTER TABLE [dbo].[eiedre]  WITH CHECK ADD  CONSTRAINT [FKtd6ykxkn3arln8hr35u9vuxvt] FOREIGN KEY([id_commune])
REFERENCES [dbo].[commune] ([id_commune])
GO
ALTER TABLE [dbo].[eiedre] CHECK CONSTRAINT [FKtd6ykxkn3arln8hr35u9vuxvt]
GO
ALTER TABLE [dbo].[import_historique]  WITH CHECK ADD  CONSTRAINT [FK43xvwbhvqw1f4xk5xm135tpfm] FOREIGN KEY([id_notification])
REFERENCES [dbo].[notification] ([id_notification])
GO
ALTER TABLE [dbo].[import_historique] CHECK CONSTRAINT [FK43xvwbhvqw1f4xk5xm135tpfm]
GO
ALTER TABLE [dbo].[info_historique]  WITH CHECK ADD  CONSTRAINT [FKfnhxkk1b9clafautxdspg735m] FOREIGN KEY([id_demande_info])
REFERENCES [dbo].[demande_infromation] ([id_demande_information])
GO
ALTER TABLE [dbo].[info_historique] CHECK CONSTRAINT [FKfnhxkk1b9clafautxdspg735m]
GO
ALTER TABLE [dbo].[lieu_elimination]  WITH CHECK ADD  CONSTRAINT [FKa2khculffrrs5n8rry5g6x2gr] FOREIGN KEY([id_classification])
REFERENCES [dbo].[classification] ([id_classification])
GO
ALTER TABLE [dbo].[lieu_elimination] CHECK CONSTRAINT [FKa2khculffrrs5n8rry5g6x2gr]
GO
ALTER TABLE [dbo].[list_doc_notif]  WITH CHECK ADD  CONSTRAINT [FK79di5doh4qo30afqnwe95qgwb] FOREIGN KEY([iddoc_import])
REFERENCES [dbo].[doc_import] ([id_doc_import])
GO
ALTER TABLE [dbo].[list_doc_notif] CHECK CONSTRAINT [FK79di5doh4qo30afqnwe95qgwb]
GO
ALTER TABLE [dbo].[list_doc_notif]  WITH CHECK ADD  CONSTRAINT [FKpyknndgqias1nuk8komnu7uou] FOREIGN KEY([id_notification])
REFERENCES [dbo].[notification] ([id_notification])
GO
ALTER TABLE [dbo].[list_doc_notif] CHECK CONSTRAINT [FKpyknndgqias1nuk8komnu7uou]
GO
ALTER TABLE [dbo].[notif_tranport]  WITH CHECK ADD  CONSTRAINT [FK8iujuoi83uhmd5eo3l2syhoyf] FOREIGN KEY([id_notification])
REFERENCES [dbo].[notification] ([id_notification])
GO
ALTER TABLE [dbo].[notif_tranport] CHECK CONSTRAINT [FK8iujuoi83uhmd5eo3l2syhoyf]
GO
ALTER TABLE [dbo].[notif_tranport]  WITH CHECK ADD  CONSTRAINT [FKcc0hsc5x63n12qxquhkhi6agc] FOREIGN KEY([id_transporteur])
REFERENCES [dbo].[transporteurparam] ([id_transporteur_param])
GO
ALTER TABLE [dbo].[notif_tranport] CHECK CONSTRAINT [FKcc0hsc5x63n12qxquhkhi6agc]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK2xyl9kka6h2w34f4d6lg1j4ha] FOREIGN KEY([classification_id])
REFERENCES [dbo].[classification] ([id_classification])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK2xyl9kka6h2w34f4d6lg1j4ha]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK5o20wot2hw76xm7ixbxmhklog] FOREIGN KEY([code_id])
REFERENCES [dbo].[code] ([id_code])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK5o20wot2hw76xm7ixbxmhklog]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK77vyoiapq5yhb6909qcep4yte] FOREIGN KEY([ideliminateur])
REFERENCES [dbo].[eliminateur] ([id_eliminateur])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK77vyoiapq5yhb6909qcep4yte]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKhko90o1gyhm3xo8y3vhi33ob9] FOREIGN KEY([idproducteur])
REFERENCES [dbo].[producteur] ([id_producteur])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKhko90o1gyhm3xo8y3vhi33ob9]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKjpi6xskp475ytmj5wdm23b3ox] FOREIGN KEY([idtypeconditionnement])
REFERENCES [dbo].[type_conditionement] ([type_conditionement_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKjpi6xskp475ytmj5wdm23b3ox]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKka4t03egekfkb15nq0v2d8n8k] FOREIGN KEY([compte_id])
REFERENCES [dbo].[compte] ([compte_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKka4t03egekfkb15nq0v2d8n8k]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKli4t5o7sx594dxyr690x8ic3y] FOREIGN KEY([id_pays])
REFERENCES [dbo].[pays] ([pays_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKli4t5o7sx594dxyr690x8ic3y]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKljsbh0unon1keiqjfde9g0vy7] FOREIGN KEY([idcaracteristque_physique])
REFERENCES [dbo].[caracteristiquephysique] ([id_classification])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKljsbh0unon1keiqjfde9g0vy7]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKlrywo63o90330eo0bushqa8qg] FOREIGN KEY([unite_id])
REFERENCES [dbo].[unite] ([unite_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKlrywo63o90330eo0bushqa8qg]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKm8vr8n7dmim212hpfhwa3pivk] FOREIGN KEY([idzonne_franche])
REFERENCES [dbo].[zonnefranche] ([id_zonnefranche])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKm8vr8n7dmim212hpfhwa3pivk]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKocktywnwuux2qk27uld7916j5] FOREIGN KEY([idimportateur_notifiant])
REFERENCES [dbo].[importateurnotifiant] ([id_importateur_notifiant])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKocktywnwuux2qk27uld7916j5]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKtn5r985cj93keaahqign7nrgu] FOREIGN KEY([transporteur_id])
REFERENCES [dbo].[transporteur] ([id_transporteur])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKtn5r985cj93keaahqign7nrgu]
GO
ALTER TABLE [dbo].[profilerole]  WITH CHECK ADD  CONSTRAINT [FKd0u09busp4elueh2uulxujbfe] FOREIGN KEY([profil_id])
REFERENCES [dbo].[profil] ([profil_id])
GO
ALTER TABLE [dbo].[profilerole] CHECK CONSTRAINT [FKd0u09busp4elueh2uulxujbfe]
GO
ALTER TABLE [dbo].[profilerole]  WITH CHECK ADD  CONSTRAINT [FKfj60458p77xri6jue5vr9dj7r] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[profilerole] CHECK CONSTRAINT [FKfj60458p77xri6jue5vr9dj7r]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK738osswfjfwybg1ha0axsgq2u] FOREIGN KEY([id_evaluation])
REFERENCES [dbo].[evaluationparam] ([id_evaluation])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK738osswfjfwybg1ha0axsgq2u]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK7mn5f3ojmbndecpshsyow24xe] FOREIGN KEY([compte_id])
REFERENCES [dbo].[compte] ([compte_id])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK7mn5f3ojmbndecpshsyow24xe]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FKoiv9j2i9hgr3xay4uylicagb9] FOREIGN KEY([id_autorisation])
REFERENCES [dbo].[autorisationparam] ([id_autorisation])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FKoiv9j2i9hgr3xay4uylicagb9]
GO
ALTER TABLE [dbo].[question_reponse]  WITH CHECK ADD  CONSTRAINT [FKgcn0svt95hwd9g3w73n2ussos] FOREIGN KEY([id_question])
REFERENCES [dbo].[question] ([id_question])
GO
ALTER TABLE [dbo].[question_reponse] CHECK CONSTRAINT [FKgcn0svt95hwd9g3w73n2ussos]
GO
ALTER TABLE [dbo].[question_reponse]  WITH CHECK ADD  CONSTRAINT [FKny7t02pun0x8mbc9mvy6e0nvi] FOREIGN KEY([id_reponse])
REFERENCES [dbo].[reponse] ([id_reponse])
GO
ALTER TABLE [dbo].[question_reponse] CHECK CONSTRAINT [FKny7t02pun0x8mbc9mvy6e0nvi]
GO
ALTER TABLE [dbo].[region_demande]  WITH CHECK ADD  CONSTRAINT [FKgcxs8watcln9b0far009n30ay] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([region_id])
GO
ALTER TABLE [dbo].[region_demande] CHECK CONSTRAINT [FKgcxs8watcln9b0far009n30ay]
GO
ALTER TABLE [dbo].[region_demande]  WITH CHECK ADD  CONSTRAINT [FKsp2c9bvnryugkeou7yof54nub] FOREIGN KEY([id_demande_information])
REFERENCES [dbo].[demande_infromation] ([id_demande_information])
GO
ALTER TABLE [dbo].[region_demande] CHECK CONSTRAINT [FKsp2c9bvnryugkeou7yof54nub]
GO
ALTER TABLE [dbo].[region_prefecture]  WITH CHECK ADD  CONSTRAINT [FKh5vdl6e6fpvsg5cgoihidkn8l] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([region_id])
GO
ALTER TABLE [dbo].[region_prefecture] CHECK CONSTRAINT [FKh5vdl6e6fpvsg5cgoihidkn8l]
GO
ALTER TABLE [dbo].[region_prefecture]  WITH CHECK ADD  CONSTRAINT [FKtfd3fgjd4bmspdgkclr51b538] FOREIGN KEY([id_prefecture])
REFERENCES [dbo].[prefecture] ([id_prefecture])
GO
ALTER TABLE [dbo].[region_prefecture] CHECK CONSTRAINT [FKtfd3fgjd4bmspdgkclr51b538]
GO
ALTER TABLE [dbo].[reponse]  WITH CHECK ADD  CONSTRAINT [FK219wm9jpvu005i135ahy95so] FOREIGN KEY([compte_id])
REFERENCES [dbo].[compte] ([compte_id])
GO
ALTER TABLE [dbo].[reponse] CHECK CONSTRAINT [FK219wm9jpvu005i135ahy95so]
GO
ALTER TABLE [dbo].[reunion]  WITH CHECK ADD  CONSTRAINT [FK5xxr3jga10b5dt4gdjl0ybptu] FOREIGN KEY([demande_information_id])
REFERENCES [dbo].[demande_infromation] ([id_demande_information])
GO
ALTER TABLE [dbo].[reunion] CHECK CONSTRAINT [FK5xxr3jga10b5dt4gdjl0ybptu]
GO
ALTER TABLE [dbo].[reunion]  WITH CHECK ADD  CONSTRAINT [FK8oailtpmq7cqmf5skyfycirlq] FOREIGN KEY([reunion_ids])
REFERENCES [dbo].[reunion] ([id_reunion])
GO
ALTER TABLE [dbo].[reunion] CHECK CONSTRAINT [FK8oailtpmq7cqmf5skyfycirlq]
GO
ALTER TABLE [dbo].[societe]  WITH CHECK ADD  CONSTRAINT [FK47h4ylpa98xx6gwccesjgl84w] FOREIGN KEY([profil_id])
REFERENCES [dbo].[profil] ([profil_id])
GO
ALTER TABLE [dbo].[societe] CHECK CONSTRAINT [FK47h4ylpa98xx6gwccesjgl84w]
GO
ALTER TABLE [dbo].[societe]  WITH CHECK ADD  CONSTRAINT [FK6n17fb2hn2hl1dj5xbx64erqy] FOREIGN KEY([idsecteur])
REFERENCES [dbo].[secteur] ([id_secteur])
GO
ALTER TABLE [dbo].[societe] CHECK CONSTRAINT [FK6n17fb2hn2hl1dj5xbx64erqy]
GO
ALTER TABLE [dbo].[transporteur]  WITH CHECK ADD  CONSTRAINT [FKqgnkm8r8fmyjj0hoohjhelu66] FOREIGN KEY([id_moyen_transport])
REFERENCES [dbo].[moyen_transport] ([id_moyen_transport])
GO
ALTER TABLE [dbo].[transporteur] CHECK CONSTRAINT [FKqgnkm8r8fmyjj0hoohjhelu66]
GO
ALTER TABLE [dbo].[transporteur_param_code]  WITH CHECK ADD  CONSTRAINT [FKdv3a4d165gvj8cb4elcfdcf11] FOREIGN KEY([id_code])
REFERENCES [dbo].[code] ([id_code])
GO
ALTER TABLE [dbo].[transporteur_param_code] CHECK CONSTRAINT [FKdv3a4d165gvj8cb4elcfdcf11]
GO
ALTER TABLE [dbo].[transporteur_param_code]  WITH CHECK ADD  CONSTRAINT [FKqsfidldakuw9i3bjnlyqyqygh] FOREIGN KEY([id_transporteur_param])
REFERENCES [dbo].[transporteurparam] ([id_transporteur_param])
GO
ALTER TABLE [dbo].[transporteur_param_code] CHECK CONSTRAINT [FKqsfidldakuw9i3bjnlyqyqygh]
GO
ALTER TABLE [dbo].[transporteur_param_moyen_transport]  WITH CHECK ADD  CONSTRAINT [FK2nkidq0avtx9qa76gllq3pil3] FOREIGN KEY([id_moyen_transport])
REFERENCES [dbo].[moyen_transport] ([id_moyen_transport])
GO
ALTER TABLE [dbo].[transporteur_param_moyen_transport] CHECK CONSTRAINT [FK2nkidq0avtx9qa76gllq3pil3]
GO
ALTER TABLE [dbo].[transporteur_param_moyen_transport]  WITH CHECK ADD  CONSTRAINT [FKpi0nvfvpg0wm4cthd1alj206q] FOREIGN KEY([id_transporteur_param])
REFERENCES [dbo].[transporteurparam] ([id_transporteur_param])
GO
ALTER TABLE [dbo].[transporteur_param_moyen_transport] CHECK CONSTRAINT [FKpi0nvfvpg0wm4cthd1alj206q]
GO
ALTER TABLE [dbo].[type]  WITH CHECK ADD  CONSTRAINT [FK6re19t10b7j49t91cdfsud4gx] FOREIGN KEY([id_code])
REFERENCES [dbo].[code] ([id_code])
GO
ALTER TABLE [dbo].[type] CHECK CONSTRAINT [FK6re19t10b7j49t91cdfsud4gx]
GO
ALTER TABLE [dbo].[user_normale_role]  WITH CHECK ADD  CONSTRAINT [FKldyv1ytl99lfahiiqdl9b4e9f] FOREIGN KEY([user_role_id])
REFERENCES [dbo].[userrole] ([user_role_id])
GO
ALTER TABLE [dbo].[user_normale_role] CHECK CONSTRAINT [FKldyv1ytl99lfahiiqdl9b4e9f]
GO
ALTER TABLE [dbo].[user_normale_role]  WITH CHECK ADD  CONSTRAINT [FKrp75sy4srkistsw6x7356au73] FOREIGN KEY([user_normale_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_normale_role] CHECK CONSTRAINT [FKrp75sy4srkistsw6x7356au73]
GO
ALTER TABLE [dbo].[useradmin]  WITH CHECK ADD  CONSTRAINT [FKn34k8fn5lghilc60jdemabdsa] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[useradmin] CHECK CONSTRAINT [FKn34k8fn5lghilc60jdemabdsa]
GO
ALTER TABLE [dbo].[usernormale]  WITH CHECK ADD  CONSTRAINT [FKelm8d82jcrlqleved0s4j3hch] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[usernormale] CHECK CONSTRAINT [FKelm8d82jcrlqleved0s4j3hch]
GO
ALTER TABLE [dbo].[userrole]  WITH CHECK ADD  CONSTRAINT [FKf9a7cojfuvf40x6co16kxa1jb] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[userrole] CHECK CONSTRAINT [FKf9a7cojfuvf40x6co16kxa1jb]
GO
ALTER TABLE [dbo].[userrole]  WITH CHECK ADD  CONSTRAINT [FKgphvxy57wlxf4mppbn57woq1h] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[userrole] CHECK CONSTRAINT [FKgphvxy57wlxf4mppbn57woq1h]
GO
ALTER TABLE [dbo].[userroleexist]  WITH CHECK ADD  CONSTRAINT [FK3dpd8dnk3tsk4dg5gxxtll6fg] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[userroleexist] CHECK CONSTRAINT [FK3dpd8dnk3tsk4dg5gxxtll6fg]
GO
ALTER TABLE [dbo].[userroleexist]  WITH CHECK ADD  CONSTRAINT [FK7fsa73b9gr5hfedox47wy08a3] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[userroleexist] CHECK CONSTRAINT [FK7fsa73b9gr5hfedox47wy08a3]
GO
USE [master]
GO
ALTER DATABASE [seed] SET  READ_WRITE 
GO
