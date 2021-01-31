CREATE TABLE [dbo].[AuditLog](
	[AuditLogID] [int] IDENTITY(1,1) NOT NULL,
	[ActionTypeID] [int] NULL,
	[EntityTypeID] [int] NULL,
	[EntityID] [int] NULL,
	[ParentEntityTypeID] [int] NULL,
	[ParentEntityId] [int] NULL,
	[Timestamp] [datetime2](3) NOT NULL,
	[UserID] [varchar](100) NULL,
	[ChangeSummary] [nvarchar](max) NULL,
	[CurrentRecordValues] [nvarchar](max) NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_AuditLog] PRIMARY KEY CLUSTERED 
(
	[AuditLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[AuditLog]  WITH CHECK ADD  CONSTRAINT [FK_AuditLog_ActionType] FOREIGN KEY([ActionTypeID])
REFERENCES [dbo].[ReferenceData] ([ID])
GO

ALTER TABLE [dbo].[AuditLog] CHECK CONSTRAINT [FK_AuditLog_ActionType]
GO

ALTER TABLE [dbo].[AuditLog]  WITH CHECK ADD  CONSTRAINT [FK_AuditLog_EntityType] FOREIGN KEY([EntityTypeID])
REFERENCES [dbo].[ReferenceData] ([ID])
GO

ALTER TABLE [dbo].[AuditLog] CHECK CONSTRAINT [FK_AuditLog_EntityType]
GO

ALTER TABLE [dbo].[AuditLog]  WITH CHECK ADD  CONSTRAINT [FK_AuditLog_ParentEntityType] FOREIGN KEY([ParentEntityTypeID])
REFERENCES [dbo].[ReferenceData] ([ID])
GO

ALTER TABLE [dbo].[AuditLog] CHECK CONSTRAINT [FK_AuditLog_ParentEntityType]
GO

INSERT INTO [dbo].[ReferenceDataType]
           ([TypeCode]
           ,[TypeName]
           ,[Description]
           ,[CreatedDate]
           ,[CreatedBy]
           ,[UpdatedDate]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('ActionType'
           ,'Action Type'
           ,'Used in capturing audit log user action'
           ,GETDATE()
           ,0
           ,null
           ,0
           ,1)
GO
INSERT INTO [dbo].[ReferenceDataType]
           ([TypeCode]
           ,[TypeName]
           ,[Description]
           ,[CreatedDate]
           ,[CreatedBy]
           ,[UpdatedDate]
           ,[UpdatedBy]
           ,[IsActive])
     VALUES
           ('EntityType'
           ,'Entity Type'
           ,'Used in capturing audit log for Domain Entity'
           ,GETDATE()
           ,0
           ,null
           ,0
           ,1)
GO