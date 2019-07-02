USE [ACS_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oleksii Rud
-- Create date: 16/01/2019
-- Description:	Selective Achiving Audit Collector services database
-- =============================================
CREATE PROCEDURE sp_ImportACSRecords
AS
BEGIN

	SET NOCOUNT ON;
declare @sqlcommand nvarchar(MAX)
declare @ACSDB nvarchar(50)
declare @PartitionID nchar(36)

-- Get Operations Manager Audit Collector Services Database Name
Select @ACSDB = OptValue from Config where Scope = 'Global' and OptName = 'database'

--Merge data from Permanent tables:
--  dtCategory
print 'Import Categories'
Set @sqlcommand = '
	MERGE INTO [dtCategory] AS tgt
    USING '+@ACSDB+'.[dbo].[dtCategory] AS src
      ON tgt.[Id] = src.[Id]
    WHEN MATCHED THEN
        UPDATE
        SET tgt.[Description] = src.[Description]
    WHEN NOT MATCHED THEN
        INSERT ([Id], [Description]) VALUES (src.[Id], src.[Description]);'

Exec sp_executesql @sqlcommand;

--  dtMachine
print 'Import Machines'
Set @sqlcommand = '
	MERGE INTO [dtMachine] AS tgt
    USING '+@ACSDB+'.[dbo].[dtMachine] AS src
      ON tgt.[Id] = src.[Id]
    WHEN MATCHED THEN
        UPDATE
        SET tgt.[CreationTime] = src.[CreationTime],
			tgt.[Sid] = src.[Sid],
			tgt.[Description] = src.[Description],
			tgt.[DistinguishedName] = src.[DistinguishedName]
    WHEN NOT MATCHED THEN
        INSERT ([Id], [CreationTime], [Sid], [Description], [DistinguishedName]) VALUES (src.[Id], src.[CreationTime], src.[Sid], src.[Description], src.[DistinguishedName]);'

Exec sp_executesql @sqlcommand;

-- dtSource
print 'Import Event Sources'
Set @sqlcommand = '
	MERGE INTO [dtSource] AS tgt
    USING '+@ACSDB+'.[dbo].[dtSource] AS src
      ON tgt.[Id] = src.[Id]
    WHEN MATCHED THEN
        UPDATE
        SET tgt.[SourceName] = src.[SourceName],
			tgt.[LogName] = src.[LogName]
    WHEN NOT MATCHED THEN
        INSERT ([Id], [SourceName], [LogName]) VALUES (src.[Id], src.[SourceName], src.[LogName]);'

Exec sp_executesql @sqlcommand;

-- dtType
print 'Import Types'
Set @sqlcommand = '
	MERGE INTO [dtType] AS tgt
    USING '+@ACSDB+'.[dbo].[dtType] AS src
      ON tgt.[Id] = src.[Id]
    WHEN MATCHED THEN
        UPDATE
        SET tgt.[Description] = src.[Description]
    WHEN NOT MATCHED THEN
        INSERT ([Id], [Description]) VALUES (src.[Id], src.[Description]);'

Exec sp_executesql @sqlcommand;

print 'Creating List of partitions to Import'

IF OBJECT_ID('tempdb.dbo.#partitions', 'U') IS NOT NULL DROP TABLE #partitions;
CREATE TABLE #partitions (PartitionID nchar(36));

Set @sqlcommand = '
	INSERT INTO #partitions
	SELECT PartitionID
	FROM '+@ACSDB+'.dbo.dtPartition p
	WHERE Status = 2 and p.PartitionId not in (Select [PartitionID] from [dbo].[ImportedPartitions])'
Exec sp_executesql @sqlcommand

DECLARE partition_cursor CURSOR FOR SELECT PartitionID from #partitions
OPEN partition_cursor
FETCH NEXT from partition_cursor INTO @PartitionID
WHILE @@FETCH_STATUS = 0
BEGIN
Print 'Procesing Partition ' + @PartitionID
BEGIN TRANSACTION @PartitionID
--Get Event IDs to import (internal table IDs, not Windows EventIDs)
IF OBJECT_ID('tempdb.dbo.#EventIDs', 'U') IS NOT NULL DROP TABLE #EventIDs;
CREATE TABLE #EventIDs (Id bigint)
Set @sqlcommand = '
	INSERT INTO #EventIDs
	Select e.id from 
	'+@ACSDB+'.[dbo].[dtEvent_'+@PartitionID+'] e 
	join dtCategory c on e.CategoryNo = c.Id
	join [ArchiveItemsFilter] af on (c.Description = af.FilterValue and af.FilterType = ''CategoryName'') OR (af.FilterType = ''EventId'' and cast(e.EventNo as nvarchar(10)) = af.FilterValue)
	'
Exec sp_executesql @sqlcommand

-- Import Events Table
print 'Import Events'
Set @sqlcommand = '
Insert Into [dbo].[dtEvent]
SELECT e.[Id], '''+@PartitionID+''' as [PartitionId], [EventNo], [SequenceNo], [TypeNo], [CategoryNo], [CreationTime], [CollectionTime], [AgentMachineId], [EventMachineId], [SourceId], [UserId], [PrimaryUserId], [PrimaryUserLogonId], [ClientUserId], [ClientUserLogonId], [TargetUserId], [StringId01], [StringId02], [StringId03], [StringId04], [StringId05], [StringId06], [StringId07], [StringId08], [StringId09], [StringId10], [StringId11], [StringId12], [StringId13], [StringId14], [StringId15], [StringId16], [StringId17], [StringId18], [StringId19], [StringId20], [StringId21], [StringId22]
  FROM '+@ACSDB+'.[dbo].[dtEvent_'+@PartitionID+'] e join #EventIDs eid on e.id = eid.id'
Exec sp_executesql @sqlcommand

-- Import EventData table 
print 'Import Event Data'
Set @sqlcommand = '
Insert Into [dbo].[dtEventData]
SELECT ed.[EventId], '''+@PartitionID+''' as [PartitionId], [EventData]
  FROM '+@ACSDB+'.[dbo].[dtEventData_'+@PartitionID+'] ed join #EventIDs eid on ed.EventId = eid.id'
Exec sp_executesql @sqlcommand

-- Import Strings
print 'Import Event Strings'
Set @sqlcommand = '
	INSERT INTO dtString
	select s.Id, '''+@PartitionID+''' as PartitionId, s.TypeId, s.DescHash, s.Description
	from '+@ACSDB+'.[dbo].dtString_'+@PartitionID+' s where s.id in(select stringid from (
	Select EventMachineId, [StringId01], [StringId02],[StringId03],[StringId04],[StringId05],[StringId06],[StringId07],[StringId08],[StringId09],[StringId10],[StringId11],[StringId12],[StringId13],[StringId14],[StringId15],[StringId16],[StringId17],[StringId18],[StringId19],[StringId20],[StringId21],[StringId22] from 
	'+@ACSDB+'.[dbo].[dtEvent_'+@PartitionID+'] e join #EventIDs eid on e.id = eid.Id
	) a unpivot(
		StringId for StringNum in (EventMachineId, [StringId01], [StringId02],[StringId03],[StringId04],[StringId05],[StringId06],[StringId07],[StringId08],[StringId09],[StringId10],[StringId11],[StringId12],[StringId13],[StringId14],[StringId15],[StringId16],[StringId17],[StringId18],[StringId19],[StringId20],[StringId21],[StringId22])
		) b )'
Exec sp_executesql @sqlcommand

-- Import Principals
print 'Import Security Principals'
Set @sqlcommand = '
	INSERT INTO dtPrincipal
	select p.Id, '''+@PartitionID+''' as PartitionId, p.[strSid], p.[strUser], p.[strDomain]
	from '+@ACSDB+'.[dbo].dtPrincipal_'+@PartitionID+' p where p.id in (
		select Principalid from (
			Select UserId, PrimaryUserId, ClientUserId, TargetUserId from 
			'+@ACSDB+'.[dbo].[dtEvent_'+@PartitionID+'] e join #EventIDs eid on e.id = eid.Id
		) a unpivot(
			Principalid for PrinciaplName in ( UserId, PrimaryUserId, ClientUserId, TargetUserId)
		) b )'
Exec sp_executesql @sqlcommand

Drop table #EventIDs

-- Add info about imported partition
Set @sqlcommand = 'INSERT INTO [dbo].[ImportedPartitions]
SELECT [PartitionId], [PartitionStartTime], [PartitionCloseTime], [FirstCreationTime], [LastCreationTime], [FirstCollectionTime], [LastCollectionTime]
FROM '+@ACSDB+'.[dbo].[dtPartition] where [PartitionId] = '''+@PartitionID+''''
Exec sp_executesql @sqlcommand

COMMIT TRANSACTION @PartitionID
FETCH NEXT from partition_cursor INTO @PartitionID
END
CLOSE partition_cursor
DEALLOCATE partition_cursor
END
GO
