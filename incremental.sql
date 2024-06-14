
IF NOT EXISTS (select * from sys.objects where OBJECT_ID = OBJECT_ID(N'[dbo].[Emails]') and type in (N'U'))
CREATE TABLE [dbo].[Emails](
	[id] int NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	Email [varchar](50) NULL,
	[Gender] char(1) NULL,
) ON [PRIMARY]
GO

IF NOT EXISTS (select * from sys.objects where OBJECT_ID = OBJECT_ID(N'[dbo].[Emails_Updated]') and type in (N'U'))
CREATE TABLE [dbo].[Emails_Updated](
	[id] int NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	Email [varchar](50) NULL,
	[Gender] char(1) NULL,
) ON [PRIMARY]
GO




IF NOT EXISTS (select * from sys.objects where OBJECT_ID = OBJECT_ID(N'[dbo].[audit_logs]') and type in (N'U'))
CREATE TABLE [dbo].[audit_logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	PackageName [varchar](100) NULL,
	TableName [varchar](200) NULL,
	[RecordsInserted] [int] NULL,
	[RecordsUpdated] [int] NULL,
	[Dated] [datetime] NULL
) ON [PRIMARY]
GO

DECLARE @updated int 
UPDATE  a
   SET 
      a.[first_name] = b.first_name,
      a.[last_name] = b.last_name,
      a.[Email] = b.Email,
      a.[Gender] = b.Gender
 from Emails a inner join [Emails_Updated] as b
 on a.Id = b.Id

set @updated = @@ROWCOUNT
insert into [audit_logs] 
select 'Incremental.dtsx', 'Emails', 0, @updated, getdate()



