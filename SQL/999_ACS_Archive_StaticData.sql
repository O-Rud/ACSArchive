USE [ACS_Archive]
GO
SET IDENTITY_INSERT [dbo].[ArchiveItemsFilter] ON 

INSERT [dbo].[ArchiveItemsFilter] ([id], [FilterType], [FilterValue]) VALUES (1, N'CategoryName', N'Account Management')
INSERT [dbo].[ArchiveItemsFilter] ([id], [FilterType], [FilterValue]) VALUES (2, N'CategoryName', N'ACCOUNTMANAGEMENT_USERACCOUNT')
INSERT [dbo].[ArchiveItemsFilter] ([id], [FilterType], [FilterValue]) VALUES (3, N'CategoryName', N'ACCOUNTMANAGEMENT_COMPUTERACCOUNT')
INSERT [dbo].[ArchiveItemsFilter] ([id], [FilterType], [FilterValue]) VALUES (4, N'CategoryName', N'ACCOUNTMANAGEMENT_SECURITYGROUP')
INSERT [dbo].[ArchiveItemsFilter] ([id], [FilterType], [FilterValue]) VALUES (5, N'CategoryName', N'ACCOUNTMANAGEMENT_DISTRIBUTIONGROUP')
INSERT [dbo].[ArchiveItemsFilter] ([id], [FilterType], [FilterValue]) VALUES (6, N'CategoryName', N'ACCOUNTMANAGEMENT_APPLICATIONGROUP')
INSERT [dbo].[ArchiveItemsFilter] ([id], [FilterType], [FilterValue]) VALUES (7, N'CategoryName', N'ACCOUNTMANAGEMENT_OTHERS
')
SET IDENTITY_INSERT [dbo].[ArchiveItemsFilter] OFF
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (1, N'Global', N'Database', N'OperationsManagerAC')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (2, N'Global', N'Server', N'DS-SQL-01')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (3, N'Tables', N'Permanent', N'dtCategory')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (5, N'Tables', N'Permanent', N'dtMachine')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (6, N'Tables', N'Permanent', N'dtSource')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (7, N'Tables', N'Permanent', N'dtType')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (9, N'Tables', N'Partitioned', N'dtClaimString')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (10, N'Tables', N'Partitioned', N'dtDeviceClaim')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (11, N'Tables', N'Partitioned', N'dtEvent')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (12, N'Tables', N'Partitioned', N'dtEventData')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (13, N'Tables', N'Partitioned', N'dtNewResourceAttribute')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (14, N'Tables', N'Partitioned', N'dtOldResourceAttribute')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (15, N'Tables', N'Partitioned', N'dtPrincipal')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (16, N'Tables', N'Partitioned', N'dtString')
INSERT [dbo].[Config] ([id], [Scope], [OptName], [OptValue]) VALUES (17, N'Tables', N'Partitioned', N'dtUserClaim')
SET IDENTITY_INSERT [dbo].[Config] OFF
