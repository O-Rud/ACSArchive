USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedPartitions](
	[PartitionID] [nchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PartitionStartTime] [datetime] NOT NULL,
	[PartitionCloseTime] [datetime] NOT NULL,
	[FirstCreationTime] [datetime] NOT NULL,
	[LastCreationTime] [datetime] NOT NULL,
	[FirstCollectionTime] [datetime] NOT NULL,
	[LastCollectionTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ImportedPartitions_1] PRIMARY KEY CLUSTERED 
(
	[PartitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
