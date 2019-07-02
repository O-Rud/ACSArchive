USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[dvAll]
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
        s05.Description     as String05,
        s06.Description     as String06,
        s07.Description     as String07,
        s08.Description     as String08,
        s09.Description     as String09,
        s10.Description     as String10,
        s11.Description     as String11,
        s12.Description     as String12,
        s13.Description     as String13,
        s14.Description     as String14,
        s15.Description     as String15,
        s16.Description     as String16,
        s17.Description     as String17,
        s18.Description     as String18,
        s19.Description     as String19,
        s20.Description     as String20,
        s21.Description     as String21,
        s22.Description     as String22
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
        left outer join dtString s06 on e.StringId06 = s06.Id and e.PartitionId = s06.PartitionId
        left outer join dtString s07 on e.StringId07 = s07.Id and e.PartitionId = s07.PartitionId
        left outer join dtString s08 on e.StringId08 = s08.Id and e.PartitionId = s08.PartitionId
        left outer join dtString s09 on e.StringId09 = s09.Id and e.PartitionId = s09.PartitionId
        left outer join dtString s10 on e.StringId10 = s10.Id and e.PartitionId = s10.PartitionId
        left outer join dtString s11 on e.StringId11 = s11.Id and e.PartitionId = s11.PartitionId
        left outer join dtString s12 on e.StringId12 = s12.Id and e.PartitionId = s12.PartitionId
        left outer join dtString s13 on e.StringId13 = s13.Id and e.PartitionId = s13.PartitionId
        left outer join dtString s14 on e.StringId14 = s14.Id and e.PartitionId = s14.PartitionId
        left outer join dtString s15 on e.StringId15 = s15.Id and e.PartitionId = s15.PartitionId
        left outer join dtString s16 on e.StringId16 = s16.Id and e.PartitionId = s16.PartitionId
        left outer join dtString s17 on e.StringId17 = s17.Id and e.PartitionId = s17.PartitionId
        left outer join dtString s18 on e.StringId18 = s18.Id and e.PartitionId = s18.PartitionId
        left outer join dtString s19 on e.StringId19 = s19.Id and e.PartitionId = s19.PartitionId
        left outer join dtString s20 on e.StringId20 = s20.Id and e.PartitionId = s20.PartitionId
        left outer join dtString s21 on e.StringId21 = s21.Id and e.PartitionId = s21.PartitionId
        left outer join dtString s22 on e.StringId22 = s22.Id and e.PartitionId = s22.PartitionId

GO
