USE [GeoStoreDB]
GO
/****** Object:  ForeignKey [FK_cellLocation_entry]    Script Date: 06/06/2011 11:24:59 ******/
ALTER TABLE [dbo].[cellLocation] DROP CONSTRAINT [FK_cellLocation_entry]
GO
/****** Object:  ForeignKey [FK_DataConnection_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[dataConnection] DROP CONSTRAINT [FK_DataConnection_entry]
GO
/****** Object:  ForeignKey [FK_location_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[location] DROP CONSTRAINT [FK_location_entry]
GO
/****** Object:  ForeignKey [FK_neighboringCell_cellLocation]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[neighboringCell] DROP CONSTRAINT [FK_neighboringCell_cellLocation]
GO
/****** Object:  ForeignKey [FK_ServiceState_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[serviceState] DROP CONSTRAINT [FK_ServiceState_entry]
GO
/****** Object:  ForeignKey [FK_signalStrength_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[signalStrength] DROP CONSTRAINT [FK_signalStrength_entry]
GO
/****** Object:  ForeignKey [FK_wifi_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[wifi] DROP CONSTRAINT [FK_wifi_entry]
GO
/****** Object:  Table [dbo].[neighboringCell]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[neighboringCell] DROP CONSTRAINT [FK_neighboringCell_cellLocation]
GO
DROP TABLE [dbo].[neighboringCell]
GO
/****** Object:  Table [dbo].[serviceState]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[serviceState] DROP CONSTRAINT [FK_ServiceState_entry]
GO
DROP TABLE [dbo].[serviceState]
GO
/****** Object:  Table [dbo].[signalStrength]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[signalStrength] DROP CONSTRAINT [FK_signalStrength_entry]
GO
DROP TABLE [dbo].[signalStrength]
GO
/****** Object:  Table [dbo].[location]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[location] DROP CONSTRAINT [FK_location_entry]
GO
DROP TABLE [dbo].[location]
GO
/****** Object:  Table [dbo].[wifi]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[wifi] DROP CONSTRAINT [FK_wifi_entry]
GO
DROP TABLE [dbo].[wifi]
GO
/****** Object:  Table [dbo].[cellLocation]    Script Date: 06/06/2011 11:24:59 ******/
ALTER TABLE [dbo].[cellLocation] DROP CONSTRAINT [FK_cellLocation_entry]
GO
DROP TABLE [dbo].[cellLocation]
GO
/****** Object:  Table [dbo].[dataConnection]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[dataConnection] DROP CONSTRAINT [FK_DataConnection_entry]
GO
DROP TABLE [dbo].[dataConnection]
GO
/****** Object:  Table [dbo].[entry]    Script Date: 06/06/2011 11:25:00 ******/
DROP TABLE [dbo].[entry]
GO
/****** Object:  Table [dbo].[user]    Script Date: 06/06/2011 11:25:00 ******/
DROP TABLE [dbo].[user]
GO
/****** Object:  Table [dbo].[user]    Script Date: 06/06/2011 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[jabber_id] [varchar](256) NULL,
	[name] [varchar](255) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[entry]    Script Date: 06/06/2011 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[entry](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[deviceId] [varchar](255) NOT NULL,
	[externalTimestamp] [bigint] NOT NULL,
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_entry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dataConnection]    Script Date: 06/06/2011 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[dataConnection](
	[state] [varchar] (255) NULL,
	[networkType] [varchar](255) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entryId] [bigint] NOT NULL,
 CONSTRAINT [PK_DataConnection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cellLocation]    Script Date: 06/06/2011 11:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[cellLocation](
	[type] [varchar](255) NULL,
	[cid] [int] NULL,
	[lac] [int] NULL,
	[baseStationId] [int] NULL,
	[baseStationLatitude] [int] NULL,
	[baseStationLongitude] [int] NULL,
	[networkId] [int] NULL,
	[systemId] [int] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[entryId] [bigint] NOT NULL,
 CONSTRAINT [PK_cellLocation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[wifi]    Script Date: 06/06/2011 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wifi](
	[ssid] [varchar](32) NULL,
	[capabilities] [varchar](255) NULL,
	[frequency] [int] NULL,
	[level] [int] NULL,
	[bssid] [varchar](255) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[entryID] [bigint] NOT NULL,
 CONSTRAINT [PK_wifi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[location]    Script Date: 06/06/2011 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[location](
	[accuracy] [float] NULL,
	[altitude] [float] NULL,
	[bearing] [float] NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[geoPosition] [geography] NOT NULL,
	[provider] [varchar](255) NULL,
	[speed] [float] NULL,
	[extras] [varchar](255) NULL,
	[measurementTime] [datetime2](7) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[entryID] [bigint] NOT NULL,
	[processingMethod] [varchar](50) NULL,
	[deviceType] [varchar](50) NULL,
	[deviceId] [varchar](50) NULL,
	[sensorType] [varchar](50) NULL,
	[sensorModel] [varchar](50) NULL,
	[IntersensorAgreement] [bit] NULL,
	[solutionConfidence] [float] NULL,
 CONSTRAINT [PK_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[signalStrength]    Script Date: 06/06/2011 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[signalStrength](
	[cdmaDbm] [int] NULL,
	[cdmaEcio] [int] NULL,
	[evdoDbm] [int] NULL,
	[evdoEcio] [int] NULL,
	[evdoSnr] [int] NULL,
	[gsmBitErrorRate] [int] NULL,
	[gsmSingalStrength] [int] NULL,
	[isGsm] [bit] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[entryId] [bigint] NOT NULL,
 CONSTRAINT [PK_signalStrength] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[serviceState]    Script Date: 06/06/2011 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[serviceState](
	[isManualSelection] [bit] NULL,
	[operatorAlphaLong] [nchar](16) NULL,
	[operatorAlphaShort] [nchar](8) NULL,
	[operatorNumeric] [nchar](6) NULL,
	[roaming] [bit] NULL,
	[state] [varchar](255) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[entryID] [bigint] NOT NULL,
 CONSTRAINT [PK_ServiceState] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[neighboringCell]    Script Date: 06/06/2011 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[neighboringCell](
	[cid] [int] NULL,
	[lac] [int] NULL,
	[psc] [int] NULL,
	[rssi] [int] NULL,
	[networkType] [varchar](255) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[cellLocationId] [bigint] NOT NULL,
	[entryId] [bigint] NOT NULL,
 CONSTRAINT [PK_neighboringCell] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_cellLocation_entry]    Script Date: 06/06/2011 11:24:59 ******/
ALTER TABLE [dbo].[cellLocation]  WITH CHECK ADD  CONSTRAINT [FK_cellLocation_entry] FOREIGN KEY([entryId])
REFERENCES [dbo].[entry] ([id])
GO
ALTER TABLE [dbo].[cellLocation] CHECK CONSTRAINT [FK_cellLocation_entry]
GO
/****** Object:  ForeignKey [FK_DataConnection_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[dataConnection]  WITH CHECK ADD  CONSTRAINT [FK_DataConnection_entry] FOREIGN KEY([entryId])
REFERENCES [dbo].[entry] ([id])
GO
ALTER TABLE [dbo].[dataConnection] CHECK CONSTRAINT [FK_DataConnection_entry]
GO
/****** Object:  ForeignKey [FK_location_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[location]  WITH CHECK ADD  CONSTRAINT [FK_location_entry] FOREIGN KEY([entryID])
REFERENCES [dbo].[entry] ([id])
GO
ALTER TABLE [dbo].[location] CHECK CONSTRAINT [FK_location_entry]
GO
/****** Object:  ForeignKey [FK_neighboringCell_cellLocation]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[neighboringCell]  WITH CHECK ADD  CONSTRAINT [FK_neighboringCell_cellLocation] FOREIGN KEY([cellLocationId])
REFERENCES [dbo].[cellLocation] ([id])
GO
ALTER TABLE [dbo].[neighboringCell] CHECK CONSTRAINT [FK_neighboringCell_cellLocation]
GO
/****** Object:  ForeignKey [FK_ServiceState_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[serviceState]  WITH CHECK ADD  CONSTRAINT [FK_ServiceState_entry] FOREIGN KEY([entryID])
REFERENCES [dbo].[entry] ([id])
GO
ALTER TABLE [dbo].[serviceState] CHECK CONSTRAINT [FK_ServiceState_entry]
GO
/****** Object:  ForeignKey [FK_signalStrength_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[signalStrength]  WITH CHECK ADD  CONSTRAINT [FK_signalStrength_entry] FOREIGN KEY([entryId])
REFERENCES [dbo].[entry] ([id])
GO
ALTER TABLE [dbo].[signalStrength] CHECK CONSTRAINT [FK_signalStrength_entry]
GO
/****** Object:  ForeignKey [FK_wifi_entry]    Script Date: 06/06/2011 11:25:00 ******/
ALTER TABLE [dbo].[wifi]  WITH CHECK ADD  CONSTRAINT [FK_wifi_entry] FOREIGN KEY([entryID])
REFERENCES [dbo].[entry] ([id])
GO
ALTER TABLE [dbo].[wifi] CHECK CONSTRAINT [FK_wifi_entry]
GO
