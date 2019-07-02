USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArchiveItemsFilter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FilterType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FilterValue] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_ArchiveItemsFilter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArchiveItemsFilter] ADD  CONSTRAINT [DF_ArchiveItemsFilter_SelectorType]  DEFAULT (N'CategoryName') FOR [FilterType]
GO
ALTER TABLE [dbo].[ArchiveItemsFilter]  WITH CHECK ADD  CONSTRAINT [CK_ArchiveItemsFilter] CHECK  (([Filtertype]='EventID' OR [Filtertype]='CategoryName'))
GO
ALTER TABLE [dbo].[ArchiveItemsFilter] CHECK CONSTRAINT [CK_ArchiveItemsFilter]
GO
