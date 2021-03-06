USE [seed]
GO
/****** Object:  Table [dbo].[doc_import]    Script Date: 28/06/2021 09:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doc_import](
	[id_doc_import] [int] IDENTITY(1,1) NOT NULL,
	[cocher] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[nom_ar] [nvarchar](255) NULL,
	[nom_fr] [nvarchar](255) NULL,
	[typeaut] [nvarchar](255) NULL,
	[uri] [nvarchar](255) NULL,
	[id_classification] [int] NULL,
	[description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_doc_import] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 28/06/2021 09:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id_question] [int] IDENTITY(1,1) NOT NULL,
	[delete_date_time] [datetime2](7) NULL,
	[description] [nvarchar](255) NULL,
	[description_ar] [nvarchar](255) NULL,
	[type] [nvarchar](255) NULL,
	[id_autorisation] [int] NULL,
	[compte_id] [int] NULL,
	[id_evaluation] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_reponse]    Script Date: 28/06/2021 09:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_reponse](
	[id_question] [int] NOT NULL,
	[id_reponse] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reponse]    Script Date: 28/06/2021 09:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reponse](
	[id_reponse] [int] IDENTITY(1,1) NOT NULL,
	[date_pub] [nvarchar](255) NULL,
	[delete_date_time] [datetime2](7) NULL,
	[description] [ntext] NULL,
	[heur_pub] [nvarchar](255) NULL,
	[compte_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_reponse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[doc_import]  WITH CHECK ADD  CONSTRAINT [FK6prqh7r9ygyllg64bgyverxcp] FOREIGN KEY([id_classification])
REFERENCES [dbo].[classification] ([id_classification])
GO
ALTER TABLE [dbo].[doc_import] CHECK CONSTRAINT [FK6prqh7r9ygyllg64bgyverxcp]
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
ALTER TABLE [dbo].[reponse]  WITH CHECK ADD  CONSTRAINT [FK219wm9jpvu005i135ahy95so] FOREIGN KEY([compte_id])
REFERENCES [dbo].[compte] ([compte_id])
GO
ALTER TABLE [dbo].[reponse] CHECK CONSTRAINT [FK219wm9jpvu005i135ahy95so]
GO
