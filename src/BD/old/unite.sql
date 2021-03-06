USE [seed]
GO
/****** Object:  Table [dbo].[unite]    Script Date: 26/05/2021 15:38:37 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[unite] ON 

INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'لتر', N'L')
INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'كلغ', N'Kg')
INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'طن', N'Tonnes')
INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'م³', N'm³')
SET IDENTITY_INSERT [dbo].[unite] OFF
