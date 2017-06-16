USE [master]
GO
/****** Object:  Database [SmvDb]    Script Date: 6/14/2017 12:45:36 PM ******/
CREATE DATABASE [SmvDb]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmvDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmvDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmvDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmvDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmvDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmvDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmvDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmvDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmvDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmvDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmvDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmvDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmvDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmvDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmvDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmvDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SmvDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmvDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmvDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmvDb] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [SmvDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmvDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SmvDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmvDb] SET RECOVERY FULL 
GO
ALTER DATABASE [SmvDb] SET  MULTI_USER 
GO
ALTER DATABASE [SmvDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmvDb] SET DB_CHAINING OFF 
GO
USE [SmvDb]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modules](
	[ModuleID] [varchar](50) NOT NULL,
	[ModulePath] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plugins]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plugins](
	[PluginID] [varchar](50) NOT NULL,
	[PluginName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Plugins] PRIMARY KEY CLUSTERED 
(
	[PluginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RollUpTable]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RollUpTable](
	[SessionId] [varchar](50) NOT NULL,
	[TaskId] [varchar](50) NOT NULL,
	[ModulePath] [varchar](max) NOT NULL,
	[PluginName] [varchar](50) NOT NULL,
	[Bugs] [varchar](max) NULL,
	[ActionSuccessCount] [int] NOT NULL,
	[ActionFailureCount] [int] NOT NULL,
	[Command] [varchar](max) NOT NULL,
	[Arguments] [varchar](max) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionID] [varchar](50) NOT NULL,
	[StartTimestamp] [varchar](50) NOT NULL,
	[EndTimestamp] [varchar](50) NOT NULL,
	[User] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SessionTasks]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionTasks](
	[SessionID] [varchar](50) NOT NULL,
	[TaskID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SessionTasks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [nvarchar](128) NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
 CONSTRAINT [PK_sysdiagrams] PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskActions]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskActions](
	[ActionID] [varchar](50) NOT NULL,
	[TaskID] [varchar](50) NOT NULL,
	[ActionName] [varchar](50) NOT NULL,
	[WorkingDirectory] [varchar](max) NOT NULL,
	[ActionTime] [varchar](50) NOT NULL,
	[Success] [char](10) NOT NULL,
 CONSTRAINT [PK_TaskActions] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskModules]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskModules](
	[TaskID] [varchar](50) NOT NULL,
	[ModuleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TaskModules] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskPlugins]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskPlugins](
	[TaskID] [varchar](50) NOT NULL,
	[PluginID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TaskPlugins] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [varchar](50) NOT NULL,
	[Log] [varchar](max) NOT NULL,
	[Command] [varchar](max) NOT NULL,
	[Arguments] [varchar](max) NULL,
	[Bugs] [varchar](max) NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [nci_wi_TaskActions_C4D3D88CAACA24E601F9F43BA2AB8AF9]    Script Date: 6/14/2017 12:45:36 PM ******/
CREATE NONCLUSTERED INDEX [nci_wi_TaskActions_C4D3D88CAACA24E601F9F43BA2AB8AF9] ON [dbo].[TaskActions]
(
	[TaskID] ASC
)
INCLUDE ( 	[Success]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  StoredProcedure [dbo].[ActionDiffBetweenTwoSessions]    Script Date: 6/14/2017 12:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActionDiffBetweenTwoSessions]
	-- Add the parameters for the stored procedure here
		@FirstSession varchar(50) = NULL, 
	@SecondSession varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT FirstSession.ModulePath, FirstSession.PluginName, FirstSession.Bugs, FirstSession.ActionSuccessCount, FirstSession.ActionFailureCount
		FROM
		(SELECT ModulePath, PluginName, Bugs, ActionSuccessCount, ActionFailureCount
		FROM RollUpTable
		WHERE SessionId=@firstSession)
		AS FirstSession
		EXCEPT
		(SELECT ModulePath, PluginName, Bugs, ActionSuccessCount, ActionFailureCount
		FROM RollUpTable
		WHERE SessionId=@secondSession)


END

GO
/****** Object:  StoredProcedure [dbo].[InsertDataToRollUpTable]    Script Date: 6/14/2017 12:45:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertDataToRollUpTable] 
	-- Add the parameters for the stored procedure here
	@taskId varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO RollUpTable
	SELECT SessionId, TaskModules.TaskId, Modules.ModulePath, 
		Plugins.PluginName, 
		Bugs,
		COUNT(CASE WHEN TaskActions.Success = 0 THEN 1 END) AS ActionSuccessCount, 
		COUNT(CASE WHEN TaskActions.Success>0 THEN 1 END) AS ActionFailureCount,
		Tasks.Command,
		Tasks.Arguments
	FROM TaskModules
	inner join sessiontasks
	ON TaskModules.TaskID = SESSIONTASKS.TASKID
	INNER JOIN Modules
	ON TaskModules.ModuleID = Modules.ModuleID
	INNER JOIN TaskPlugins
	ON taskmodules.TaskID = TaskPlugins.TaskID
	INNER JOIN Plugins
	ON TaskPlugins.PluginID = Plugins.PluginID
	INNER JOIN TaskActions
	ON taskmodules.TaskID = TaskActions.TaskID
	INNER JOIN Tasks
	ON taskmodules.TaskID = Tasks.TaskID
	WHERE taskmodules.TaskID=@taskId
	GROUP BY SessionId, TaskModules.TaskId, Bugs, Modules.ModulePath, Plugins.PluginName, Tasks.Command, Tasks.Arguments
END

GO
/****** Object:  StoredProcedure [dbo].[ModuleDiffBetweenTwoSessions]    Script Date: 6/14/2017 12:45:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ModuleDiffBetweenTwoSessions] 
	-- Add the parameters for the stored procedure here
	@FirstSession varchar(50) = NULL, 
	@SecondSession varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/
		SELECT FirstSession.ModuleName FROM
		(SELECT DISTINCT Modules.ModuleName FROM SessionTasks 
		INNER JOIN TaskModules
		ON SessionTasks.TaskID = TaskModules.TaskId
		INNER JOIN Modules
		ON TaskModules.ModuleID = Modules.ModuleID
		WHERE SessionID = @FirstSession)
		AS FirstSession
		WHERE FirstSession.ModuleName NOT IN
		(SELECT DISTINCT Modules.ModuleName FROM SessionTasks
		INNER JOIN TaskModules
		ON SessionTasks.TaskID = TaskModules.TaskId
		INNER JOIN Modules
		ON TaskModules.ModuleID = Modules.ModuleID
		WHERE SessionID = @SecondSession)

END

GO
/****** Object:  StoredProcedure [dbo].[ModuleOverview]    Script Date: 6/14/2017 12:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ModuleOverview] 
	-- Add the parameters for the stored procedure here
	@moduleId varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Sessions.SessionID, 		
				COUNT(DISTINCT TaskPlugins.PluginID) AS NumberOfPlugins,
				COUNT(CASE WHEN TaskActions.Success = 0 THEN 1 END) AS ActionSuccessCount, 
				COUNT(CASE WHEN TaskActions.Success != 0 THEN 1 END) AS ActionFailureCount 
				FROM Sessions
	INNER JOIN SessionTasks
	ON Sessions.SessionID = SessionTasks.SessionID
	INNER JOIN TaskPlugins
	ON SessionTasks.TaskID = TaskPlugins.TaskID
	INNER JOIN TaskModules
	ON SessionTasks.TaskID = TaskModules.TaskID
	INNER JOIN TaskActions
	ON TaskPlugins.TaskID = TaskActions.TaskId 
	WHERE TaskModules.ModuleID = @moduleId
	GROUP BY Sessions.SessionID
END

GO
/****** Object:  StoredProcedure [dbo].[ModuleOverviewByPath]    Script Date: 6/14/2017 12:45:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ModuleOverviewByPath] 
	-- Add the parameters for the stored procedure here
	@modulePath varchar(MAX) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT Sessions.SessionID, 		
				Plugins.PluginName,
				COUNT(CASE WHEN TaskActions.Success = 0 THEN 1 END) AS ActionSuccessCount, 
				COUNT(CASE WHEN TaskActions.Success != 0 THEN 1 END) AS ActionFailureCount 
				FROM Sessions
		INNER JOIN SessionTasks
		ON Sessions.SessionID = SessionTasks.SessionID
		INNER JOIN TaskPlugins
		ON SessionTasks.TaskID = TaskPlugins.TaskID
		INNER JOIN Plugins
		ON TaskPlugins.PluginID = Plugins.PluginID
		INNER JOIN TaskModules
		ON SessionTasks.TaskID = TaskModules.TaskID
		INNER JOIN TaskActions
		ON TaskPlugins.TaskID = TaskActions.TaskId 
		INNER JOIN Modules
		ON TaskModules.ModuleID = Modules.ModuleID
		WHERE Modules.ModulePath = @modulePath
		GROUP BY Sessions.SessionID, Plugins.PluginName
end

GO
/****** Object:  StoredProcedure [dbo].[PluginDiffBetweenTwoSessions]    Script Date: 6/14/2017 12:45:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PluginDiffBetweenTwoSessions] 
	-- Add the parameters for the stored procedure here
		@FirstSession varchar(50) = NULL, 
	@SecondSession varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/
		SELECT FirstSession.PluginName FROM
		(SELECT DISTINCT Plugins.PluginName FROM SessionTasks
		INNER JOIN TaskPlugins
		ON SessionTasks.TaskID = TaskPlugins.TaskId
		INNER JOIN Plugins
		ON TaskPlugins.PluginID = Plugins.PluginID
		WHERE SessionID = @FirstSession)
		AS FirstSession
		WHERE FirstSession.PluginName NOT IN
		(SELECT DISTINCT Plugins.PluginName FROM SessionTasks
		INNER JOIN TaskPlugins
		ON SessionTasks.TaskID = TaskPlugins.TaskId
		INNER JOIN Plugins
		ON TaskPlugins.PluginID = Plugins.PluginID
		WHERE SessionID = @SecondSession)

END

GO
/****** Object:  StoredProcedure [dbo].[PluginOverview]    Script Date: 6/14/2017 12:45:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PluginOverview]
	-- Add the parameters for the stored procedure here
	@pluginId varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SessionTasks.SessionID, 		
				COUNT(DISTINCT TaskModules.ModuleID) AS NumberOfModules,
				COUNT(CASE WHEN TaskActions.Success = 0 THEN 1 END) AS ActionSuccessCount, 
				COUNT(CASE WHEN TaskActions.Success != 0 THEN 1 END) AS ActionFailureCount 
				FROM SessionTasks
	INNER JOIN TaskPlugins
	ON SessionTasks.TaskID = TaskPlugins.TaskID
	INNER JOIN TaskModules
	ON SessionTasks.TaskID = TaskModules.TaskID
	INNER JOIN TaskActions
	ON TaskPlugins.TaskID = TaskActions.TaskId 
	WHERE TaskPlugins.PluginID = @pluginId
	GROUP BY SessionTasks.SessionID
END

GO
/****** Object:  StoredProcedure [dbo].[SessionActionFailureDetails]    Script Date: 6/14/2017 12:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SessionActionFailureDetails]
	-- Add the parameters for the stored procedure here
	@sessionId varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
  SELECT WorkingDirectory, ActionName, Success
  FROM [dbo].[SessionTasks]
  INNER JOIN TaskActions
  ON SessionTasks.TaskID = TaskActions.TaskId
  where sessionid=@sessionId and Success!=0

END

GO
/****** Object:  StoredProcedure [dbo].[SessionActionFailureSummary]    Script Date: 6/14/2017 12:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SessionActionFailureSummary]
	-- Add the parameters for the stored procedure here
	@sessionId varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT ActionName, COUNT(ActionName) AS Count
	FROM [dbo].[SessionTasks]
	INNER JOIN TaskActions
	ON SessionTasks.TaskID = TaskActions.TaskId
	where sessionid=@sessionId and Success!=0
	GROUP BY ActionName

END

GO
/****** Object:  StoredProcedure [dbo].[SessionBugDetails]    Script Date: 6/14/2017 12:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SessionBugDetails]
	-- Add the parameters for the stored procedure here
	@sessionId varchar(MAX) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  SessionTasks.SessionID, ModulePath, PluginName, Tasks.Command, Tasks.Arguments, Bugs
	FROM [dbo].[SessionTasks]
	INNER JOIN Tasks
	ON SessionTasks.TaskID = Tasks.TaskID
	INNER JOIN TaskModules
	ON Tasks.TaskID = TaskModules.TaskID
	INNER JOIN Modules
	ON TaskModules.ModuleID = Modules.ModuleID
	INNER JOIN TaskPlugins 
	ON Tasks.TaskID = TaskPlugins.TaskID
	INNER JOIN Plugins
	ON TaskPlugins.PluginID = Plugins.PluginID
	where sessionid=@sessionId AND Bugs>0
END

GO
/****** Object:  StoredProcedure [dbo].[SummaryTableForSession]    Script Date: 6/14/2017 12:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SummaryTableForSession] 
	-- Add the parameters for the stored procedure here
	@sessionId varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM RollUpTable
	WHERE SessionId=@sessionId
END

GO
/****** Object:  StoredProcedure [dbo].[taskDetailsParameter]    Script Date: 6/14/2017 12:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[taskDetailsParameter] 
	-- Add the parameters for the stored procedure here
	@sessionIdParameter varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT Modules.ModulePath, Plugins.PluginName, TaskActions.ActionName, TaskActions.WorkingDirectory, TaskActions.ActionTime, TaskActions.Success FROM SessionTasks 
		INNER JOIN TaskModules
		ON taskmodules.taskid = sessiontasks.taskid 
		INNER JOIN Modules
		ON TaskModules.ModuleID = Modules.ModuleID
		INNER JOIN TaskPlugins
		ON SessionTasks.TaskID = TaskPlugins.TaskID
		INNER JOIN Plugins
		ON TaskPlugins.PluginID = Plugins.PluginID
		INNER JOIN TaskActions
		ON SessionTasks.TaskID = TaskActions.TaskID
		WHERE SessionID=@sessionIdParameter
END

GO
USE [master]
GO
ALTER DATABASE [SmvDb] SET  READ_WRITE 
GO
