USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[dvNewResourceAttributes]
as
select
    nra.EventId as EventId,
    nra.CreationTime as CreationTime,
    ncs.strClaimId as NewClaimId,
    ncs.strClaimDisplayName as NewClaimDisplayName,
    ncs.strClaimValue as NewClaimValue,
    ncs.strClaimValueDisplayName as NewClaimValueDisplayName
FROM
    dtNewResourceAttribute as nra
    inner join dtClaimString ncs on ncs.Id = nra.ClaimId and  ncs.PartitionId = nra.PartitionId

GO
