USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dtEvent](
	[Id] [bigint] NOT NULL,
	[PartitionId] [nchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EventNo] [int] NOT NULL,
	[SequenceNo] [int] NOT NULL,
	[TypeNo] [int] NOT NULL,
	[CategoryNo] [int] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[CollectionTime] [datetime] NOT NULL,
	[AgentMachineId] [int] NOT NULL,
	[EventMachineId] [int] NOT NULL,
	[SourceId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PrimaryUserId] [int] NOT NULL,
	[PrimaryUserLogonId] [bigint] NOT NULL,
	[ClientUserId] [int] NOT NULL,
	[ClientUserLogonId] [bigint] NOT NULL,
	[TargetUserId] [int] NOT NULL,
	[StringId01] [int] NOT NULL,
	[StringId02] [int] NOT NULL,
	[StringId03] [int] NOT NULL,
	[StringId04] [int] NOT NULL,
	[StringId05] [int] NOT NULL,
	[StringId06] [int] NOT NULL,
	[StringId07] [int] NOT NULL,
	[StringId08] [int] NOT NULL,
	[StringId09] [int] NOT NULL,
	[StringId10] [int] NOT NULL,
	[StringId11] [int] NOT NULL,
	[StringId12] [int] NOT NULL,
	[StringId13] [int] NOT NULL,
	[StringId14] [int] NOT NULL,
	[StringId15] [int] NOT NULL,
	[StringId16] [int] NOT NULL,
	[StringId17] [int] NOT NULL,
	[StringId18] [int] NOT NULL,
	[StringId19] [int] NOT NULL,
	[StringId20] [int] NOT NULL,
	[StringId21] [int] NOT NULL,
	[StringId22] [int] NOT NULL,
 CONSTRAINT [pkEvent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[PartitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
