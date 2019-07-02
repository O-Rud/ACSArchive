USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[dvDeviceClaims]
as
select
    dc.EventId as EventId,
    dc.CreationTime as CreationTime,
    dcs.strClaimId as DeviceClaimId,
    dcs.strClaimDisplayName as DeviceClaimDisplayName,
    dcs.strClaimValue as DeviceClaimValue,
    dcs.strClaimValueDisplayName as DeviceClaimValueDisplayName
FROM
    dtDeviceClaim as dc
    inner join dtClaimString dcs on dcs.Id = dc.ClaimId and dcs.PartitionId = dc.PartitionId

GO
