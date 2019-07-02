﻿USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dtEventData](
	[EventId] [bigint] NOT NULL,
	[PartitionId] [nchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EventData] [image] NOT NULL,
 CONSTRAINT [pkEventData] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC,
	[PartitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
