USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[dvAll5]
as
select
          e.Id,
          e.EventNo         as EventId,
          e.SequenceNo      as SequenceNo,
        'S/F' =
            case e.TypeNo
            when 8  then 'S'
            when 16 then 'F'
            else '?'
            end,
          c.Description     as Category,
          e.CreationTime    as CreationTime,
          e.CollectionTime  as CollectionTime,
          m.Description     as AgentMachine,
         sm.Description     as EventMachine,
          s.SourceName      as Source,
         p1.strSid          as HeaderSid,
         p1.strUser         as HeaderUser,
         p1.strDomain       as HeaderDomain,
         p2.strSid          as PrimarySid,
         p2.strUser         as PrimaryUser,
         p2.strDomain       as PrimaryDomain,
          e.PrimaryUserLogonId as PrimaryLogonId,
         p3.strSid          as ClientSid,
         p3.strUser         as ClientUser,
         p3.strDomain       as ClientDomain,
          e.ClientUserLogonId as ClientLogonId,
         p4.strSid          as TargetSid,
         p4.strUser         as TargetUser,
         p4.strDomain       as TargetDomain,
        s01.Description     as String01,
        s02.Description     as String02,
        s03.Description     as String03,
        s04.Description     as String04,
        s05.Description     as String05
    from
        dtEvent e
        left outer join dtCategory c on e.CategoryNo = c.Id
        left outer join dtMachine m on e.AgentMachineId = m.Id
        left outer join dtString sm on e.EventMachineId = sm.Id and e.PartitionId = sm.PartitionId
        left outer join dtSource s on e.SourceId = s.Id
        left outer join dtPrincipal p1 on e.UserId = p1.Id and e.PartitionId = p1.PartitionId
        left outer join dtPrincipal p2 on e.PrimaryUserId = p2.Id and e.PartitionId = p2.PartitionId
        left outer join dtPrincipal p3 on e.ClientUserId = p3.Id and e.PartitionId = p3.PartitionId
        left outer join dtPrincipal p4 on e.TargetUserId = p4.Id and e.PartitionId = p4.PartitionId
        left outer join dtString s01 on e.StringId01 = s01.Id and e.PartitionId = s01.PartitionId
        left outer join dtString s02 on e.StringId02 = s02.Id and e.PartitionId = s02.PartitionId
        left outer join dtString s03 on e.StringId03 = s03.Id and e.PartitionId = s03.PartitionId
        left outer join dtString s04 on e.StringId04 = s04.Id and e.PartitionId = s04.PartitionId
        left outer join dtString s05 on e.StringId05 = s05.Id and e.PartitionId = s05.PartitionId

GO
