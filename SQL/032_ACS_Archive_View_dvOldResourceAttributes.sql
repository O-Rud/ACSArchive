USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[dvOldResourceAttributes]
as
select
    nra.EventId as EventId,
    nra.CreationTime as CreationTime,
    ncs.strClaimId as OldClaimId,
    ncs.strClaimDisplayName as OldClaimDisplayName,
    ncs.strClaimValue as OldClaimValue,
    ncs.strClaimValueDisplayName as OldClaimValueDisplayName
FROM
    dtOldResourceAttribute as nra
    inner join dtClaimString ncs on ncs.Id = nra.ClaimId and  ncs.PartitionId = nra.PartitionId

GO
