USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dtDeviceClaim](
	[EventId] [bigint] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[ClaimId] [int] NOT NULL,
	[PartitionId] [nchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dtDeviceClaim]  WITH CHECK ADD  CONSTRAINT [fkDeviceClaimClaimId] FOREIGN KEY([ClaimId], [PartitionId])
REFERENCES [dbo].[dtClaimString] ([Id], [PartitionId])
GO
ALTER TABLE [dbo].[dtDeviceClaim] CHECK CONSTRAINT [fkDeviceClaimClaimId]
GO
