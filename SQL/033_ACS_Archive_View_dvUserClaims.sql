USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[dvUserClaims]
as
select
    uc.EventId as EventId,
    uc.CreationTime as CreationTime,
    ucs.strClaimId as UserClaimId,
    ucs.strClaimDisplayName as UserClaimDisplayName,
    ucs.strClaimValue as UserClaimValue,
    ucs.strClaimValueDisplayName as UserClaimValueDisplayName
FROM
    dtUserClaim as uc
    inner join dtClaimString ucs on ucs.Id = uc.ClaimId and ucs.PartitionId = uc.PartitionId

GO
