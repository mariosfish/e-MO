USE [master]
GO
/****** Object:  Database [Misthodosia_Opliton]    Script Date: 1/7/2015 10:35:00  ******/
CREATE DATABASE [Misthodosia_Opliton]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Misthodosia_Opliton', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Misthodosia_Opliton.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Misthodosia_Opliton_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Misthodosia_Opliton_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Misthodosia_Opliton] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Misthodosia_Opliton].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Misthodosia_Opliton] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET ARITHABORT OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Misthodosia_Opliton] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Misthodosia_Opliton] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Misthodosia_Opliton] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Misthodosia_Opliton] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Misthodosia_Opliton] SET  MULTI_USER 
GO
ALTER DATABASE [Misthodosia_Opliton] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Misthodosia_Opliton] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Misthodosia_Opliton] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Misthodosia_Opliton] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Misthodosia_Opliton] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Misthodosia_Opliton]
GO
/****** Object:  Schema [misthodosia_opliton]    Script Date: 1/7/2015 10:35:00  ******/
CREATE SCHEMA [misthodosia_opliton]
GO
/****** Object:  Table [dbo].[change]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[change](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_date] [date] NULL,
	[kat_id_old] [int] NULL,
	[c_opid] [int] NULL,
	[c_isxys_date] [date] NULL,
 CONSTRAINT [PK_change] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[diagrammenos_oplitis]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagrammenos_oplitis](
	[do_id] [int] IDENTITY(1,1) NOT NULL,
	[do_onoma] [nvarchar](20) NULL,
	[do_eponymo] [nvarchar](30) NULL,
	[do_asm] [int] NULL,
	[do_loxos] [nvarchar](10) NULL,
	[do_rid] [int] NULL,
	[do_katid] [int] NULL,
	[do_eggrafi] [nvarchar](10) NULL,
	[do_diagrafi] [nvarchar](10) NULL,
 CONSTRAINT [PK_diagrammenos_oplitis] PRIMARY KEY CLUSTERED 
(
	[do_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dikaiologitika]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dikaiologitika](
	[d_id] [int] NOT NULL,
	[d_perigrafi] [nvarchar](120) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[d_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dikaiologitika_katigoria]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dikaiologitika_katigoria](
	[dk_id] [int] IDENTITY(1,1) NOT NULL,
	[dk_katid] [int] NOT NULL,
	[dk_did] [int] NOT NULL,
 CONSTRAINT [PK__dikaiolo__A6931174B1948001] PRIMARY KEY CLUSTERED 
(
	[dk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[katigories]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[katigories](
	[kat_id] [int] NOT NULL,
	[kat_name] [nvarchar](80) NULL,
	[kat_katalogisteo] [decimal](5, 2) NULL,
	[kat_kratiseis] [decimal](5, 2) NULL,
	[kat_pliroteo] [decimal](5, 2) NULL,
	[kat_dx] [decimal](5, 2) NULL,
	[kat_dp] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[kat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[misthodosia]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[misthodosia](
	[m_id] [int] NOT NULL,
	[m_perigrafi] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[m_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oplitis]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oplitis](
	[op_id] [int] IDENTITY(1,1) NOT NULL,
	[op_asm] [int] NULL,
	[op_onoma] [nvarchar](20) NULL,
	[op_eponymo] [nvarchar](30) NULL,
	[op_loxos] [nvarchar](10) NULL,
	[op_eggrafi] [date] NULL,
	[op_paratiriseis] [text] NULL,
	[op_katid] [int] NULL,
	[op_rid] [int] NULL,
 CONSTRAINT [PK__oplitis__A26AE2CE9B0A8661] PRIMARY KEY CLUSTERED 
(
	[op_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pliromi]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pliromi](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[p_date] [date] NULL,
	[p_mid] [int] NULL,
	[p_paid] [bit] NULL,
	[p_opid] [int] NULL,
	[p_posoPliromis] [decimal](5, 2) NULL,
 CONSTRAINT [PK__pliromi__82E06B91C53D2E26] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pliromi_diagrammenou_opliti]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pliromi_diagrammenou_opliti](
	[pdo_id] [int] IDENTITY(1,1) NOT NULL,
	[pdo_payDay] [date] NULL,
	[pdo_pmid] [int] NULL,
	[pdo_posoPliromis] [decimal](5, 2) NULL,
	[pdo_doid] [int] NOT NULL,
 CONSTRAINT [PK_pliromi_diagrammenou_opliti] PRIMARY KEY CLUSTERED 
(
	[pdo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rank]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rank](
	[r_id] [int] NOT NULL,
	[r_perigrafi] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp](
	[temp_id] [int] IDENTITY(0,1) NOT NULL,
	[temp_sel_dikaiologitiko_val] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](15) NULL,
	[pass] [nvarchar](500) NULL,
	[u_bathmos] [nvarchar](20) NULL,
	[u_onoma] [nvarchar](20) NULL,
	[u_eponymo] [nvarchar](30) NULL,
	[u_monada] [nvarchar](20) NULL,
 CONSTRAINT [PK__users__3213E83F86F4B91C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[sunolikos]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[sunolikos]
AS
SELECT        dbo.rank.r_perigrafi, dbo.oplitis.op_onoma, dbo.oplitis.op_eponymo, dbo.katigories.kat_name, dbo.katigories.kat_katalogisteo, dbo.katigories.kat_kratiseis, 
                         dbo.katigories.kat_pliroteo, dbo.pliromi.p_paid, dbo.pliromi.p_date, dbo.pliromi.p_posoPliromis, dbo.oplitis.op_id, dbo.katigories.kat_dx, dbo.katigories.kat_dp, 
                         dbo.oplitis.op_asm
FROM            dbo.oplitis INNER JOIN
                         dbo.pliromi ON dbo.oplitis.op_id = dbo.pliromi.p_opid INNER JOIN
                         dbo.rank ON dbo.oplitis.op_rid = dbo.rank.r_id INNER JOIN
                         dbo.katigories ON dbo.oplitis.op_katid = dbo.katigories.kat_id

GO
ALTER TABLE [dbo].[change]  WITH CHECK ADD  CONSTRAINT [kat_id_old] FOREIGN KEY([kat_id_old])
REFERENCES [dbo].[katigories] ([kat_id])
GO
ALTER TABLE [dbo].[change] CHECK CONSTRAINT [kat_id_old]
GO
ALTER TABLE [dbo].[diagrammenos_oplitis]  WITH CHECK ADD  CONSTRAINT [do_katid] FOREIGN KEY([do_katid])
REFERENCES [dbo].[katigories] ([kat_id])
GO
ALTER TABLE [dbo].[diagrammenos_oplitis] CHECK CONSTRAINT [do_katid]
GO
ALTER TABLE [dbo].[diagrammenos_oplitis]  WITH CHECK ADD  CONSTRAINT [do_rid] FOREIGN KEY([do_rid])
REFERENCES [dbo].[rank] ([r_id])
GO
ALTER TABLE [dbo].[diagrammenos_oplitis] CHECK CONSTRAINT [do_rid]
GO
ALTER TABLE [dbo].[dikaiologitika_katigoria]  WITH CHECK ADD  CONSTRAINT [dk_did] FOREIGN KEY([dk_did])
REFERENCES [dbo].[dikaiologitika] ([d_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dikaiologitika_katigoria] CHECK CONSTRAINT [dk_did]
GO
ALTER TABLE [dbo].[dikaiologitika_katigoria]  WITH CHECK ADD  CONSTRAINT [dk_katid] FOREIGN KEY([dk_katid])
REFERENCES [dbo].[katigories] ([kat_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dikaiologitika_katigoria] CHECK CONSTRAINT [dk_katid]
GO
ALTER TABLE [dbo].[oplitis]  WITH CHECK ADD  CONSTRAINT [op_katid] FOREIGN KEY([op_katid])
REFERENCES [dbo].[katigories] ([kat_id])
GO
ALTER TABLE [dbo].[oplitis] CHECK CONSTRAINT [op_katid]
GO
ALTER TABLE [dbo].[oplitis]  WITH CHECK ADD  CONSTRAINT [op_rid] FOREIGN KEY([op_rid])
REFERENCES [dbo].[rank] ([r_id])
GO
ALTER TABLE [dbo].[oplitis] CHECK CONSTRAINT [op_rid]
GO
ALTER TABLE [dbo].[pliromi]  WITH CHECK ADD  CONSTRAINT [p_mid] FOREIGN KEY([p_mid])
REFERENCES [dbo].[misthodosia] ([m_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pliromi] CHECK CONSTRAINT [p_mid]
GO
ALTER TABLE [dbo].[pliromi]  WITH CHECK ADD  CONSTRAINT [p_opid] FOREIGN KEY([p_opid])
REFERENCES [dbo].[oplitis] ([op_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pliromi] CHECK CONSTRAINT [p_opid]
GO
ALTER TABLE [dbo].[pliromi_diagrammenou_opliti]  WITH CHECK ADD  CONSTRAINT [pdo_doid] FOREIGN KEY([pdo_doid])
REFERENCES [dbo].[diagrammenos_oplitis] ([do_id])
GO
ALTER TABLE [dbo].[pliromi_diagrammenou_opliti] CHECK CONSTRAINT [pdo_doid]
GO
ALTER TABLE [dbo].[pliromi_diagrammenou_opliti]  WITH CHECK ADD  CONSTRAINT [pdo_mid] FOREIGN KEY([pdo_pmid])
REFERENCES [dbo].[misthodosia] ([m_id])
GO
ALTER TABLE [dbo].[pliromi_diagrammenou_opliti] CHECK CONSTRAINT [pdo_mid]
GO
/****** Object:  StoredProcedure [dbo].[add_oplitis]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_oplitis] 
	-- Add the parameters for the stored procedure here
	@asm int=0,
	@onoma nvarchar(20),
	@eponymo nvarchar(20),
	@eggrafi date,
	@paratiriseis text,
	@bathmos nvarchar(10),
	@loxos nvarchar(10),
	@lastPayDay date,
	@katigoria nvarchar(100),
	@katigoriaFDM int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE 
	@rid INT,
	@opid int,
	@opkatid int,
	@poso decimal(5,2);
	select @rid = (select r_id from rank where r_perigrafi = @bathmos);
	select @opid = (select top 1 op_id from oplitis order by op_id desc);
	select @opkatid = (select kat_id from katigories where kat_name=@katigoria);
	select @poso = (select kat_pliroteo from katigories where kat_id= @katigoriaFDM);
	    -- Insert statements for procedure here

	insert into  oplitis (op_asm, op_eggrafi, op_onoma, op_eponymo, op_loxos, op_paratiriseis, op_rid,op_katid) values (@asm,  @eggrafi, @onoma, @eponymo, @loxos, @paratiriseis,@rid,@opkatid); --eisagogi opliti

	set @opid = (select top 1 op_id from oplitis order by op_id desc);

	insert into pliromi (p_date,p_mid,p_paid,p_opid,p_posoPliromis) values (@lastPayDay,1,1,@opid,@poso);--pliromi an exei ferei FDMT
	
	END
GO
/****** Object:  StoredProcedure [dbo].[add_pliromi]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_pliromi] 
	-- Add the parameters for the stored procedure here
	@payDate date,
	@payType int,
	@poso decimal(5,2),
	@paid bit,
	@opid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into pliromi (p_date,p_mid,p_paid,p_opid,p_posoPliromis) values (@payDate,@payType,@paid,@opid,@poso);
END

GO
/****** Object:  StoredProcedure [dbo].[delete_oplitis]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_oplitis] 
	-- Add the parameters for the stored procedure here
	@opid int,
	@dateDiagrafis date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare 
	@doid int;
    -- Insert statements for procedure here

	insert into diagrammenos_oplitis (do_onoma, do_eponymo, do_asm, do_loxos, do_rid, do_katid, do_eggrafi, do_diagrafi) select op_onoma,op_eponymo, op_asm, op_loxos, op_rid, op_katid, op_eggrafi, @dateDiagrafis FROM dbo.oplitis where op_id =@opid; --einai sosto

	set @doid = (select top 1 do_id from diagrammenos_oplitis order by do_id desc);

	insert into pliromi_diagrammenou_opliti (pdo_payDay, pdo_pmid, pdo_posoPliromis, pdo_doid)
select p_date, p_mid, p_posoPliromis, @doid as pdo_doid from pliromi where p_opid = @opid; --einai sosto   		   
	
	delete from oplitis where op_id = @opid;

	delete from pliromi where p_opid = @opid;

	delete from change where c_opid = @opid;

END
GO
/****** Object:  StoredProcedure [dbo].[fermena_dikaiologitika]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[fermena_dikaiologitika] 
	-- Add the parameters for the stored procedure here
	
	@dikid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into temp values (@dikid);
END

GO
/****** Object:  StoredProcedure [dbo].[get_biblio_pliromon]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_biblio_pliromon] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select r_perigrafi,op_eponymo,op_onoma,op_asm,kat_name,kat_katalogisteo,kat_kratiseis,kat_pliroteo,kat_dx,kat_dp,Year(p_date) Year,
isnull(sum(case when month(p_date) = 1 then p_posoPliromis end), 0) Jan,
isnull(sum(case when month(p_date) = 2 then p_posoPliromis end), 0) Feb 
  ,isnull(sum(case when month(p_date) = 3 then p_posoPliromis end), 0) Mar
  ,isnull(sum(case when month(p_date) = 4 then p_posoPliromis end), 0) Apr
  ,isnull(sum(case when month(p_date) = 5 then p_posoPliromis end), 0) May
  ,isnull(sum(case when month(p_date) = 6 then p_posoPliromis end), 0) Jun
  ,isnull(sum(case when month(p_date) = 7 then p_posoPliromis end), 0) Jul
  ,isnull(sum(case when month(p_date) = 8 then p_posoPliromis end), 0) Aug
  ,isnull(sum(case when month(p_date) = 9 then p_posoPliromis end), 0) Sep
  ,isnull(sum(case when month(p_date) = 10 then p_posoPliromis end), 0) Oct
  ,isnull(sum(case when month(p_date) = 11 then p_posoPliromis end), 0) Nov
  ,isnull(sum(case when month(p_date) = 12 then p_posoPliromis end), 0) Dec from [dbo].[sunolikos]group by r_perigrafi,op_eponymo,op_onoma,op_asm,kat_name,kat_katalogisteo,kat_kratiseis,kat_pliroteo,kat_dx,kat_dp,Year(p_date);
END

GO
/****** Object:  StoredProcedure [dbo].[get_change_by_id]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_change_by_id] 
	-- Add the parameters for the stored procedure here
	@opid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 c_id,c_date,kat_id_old,c_opid,c_isxys_date as c_isxysDate from change where c_opid = @opid order by c_date desc, c_id desc ;
END

GO
/****** Object:  StoredProcedure [dbo].[get_diafora_posou]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_diafora_posou] 
	-- Add the parameters for the stored procedure here
	@opid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare 
	@new_katid int,
	@old_katid int;

	set @new_katid = (select op_katid from oplitis where op_id=@opid);
	set @old_katid = (select top 1 kat_id_old from change where c_opid=@opid order by c_date desc);

    -- Insert statements for procedure here
	select t1.kat_id as katid_old,t1.kat_name as katName_old, t1.kat_pliroteo as katPliroteo_old,t2.kat_id as katid_new,t2.kat_name as katName_new, t2.kat_pliroteo as katPliroteo_new,t2.kat_pliroteo-t1.kat_pliroteo as diafora from katigories as t1, katigories as t2 where t1.kat_id=@old_katid and t2.kat_id=@new_katid;
END

GO
/****** Object:  StoredProcedure [dbo].[get_diagrammenos_oplitis]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_diagrammenos_oplitis]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.rank.r_perigrafi, dbo.diagrammenos_oplitis.do_onoma, dbo.diagrammenos_oplitis.do_eponymo, dbo.diagrammenos_oplitis.do_asm, 
                         dbo.diagrammenos_oplitis.do_loxos, dbo.katigories.kat_name, dbo.diagrammenos_oplitis.do_eggrafi, dbo.diagrammenos_oplitis.do_diagrafi,do_id
FROM            dbo.diagrammenos_oplitis INNER JOIN
                         dbo.rank ON dbo.diagrammenos_oplitis.do_rid = dbo.rank.r_id INNER JOIN
                         dbo.katigories ON dbo.diagrammenos_oplitis.do_katid = dbo.katigories.kat_id
END

GO
/****** Object:  StoredProcedure [dbo].[get_dik_pou_exei_proskomisei]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_dik_pou_exei_proskomisei] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare 
	@opid int;
	set @opid =(select top 1 op_id from oplitis order by op_id desc);
    -- Insert statements for procedure here
	select dbo.dikaiologitika.d_perigrafi FROM dbo.dikaiologitika INNER JOIN dbo.dikaiologitika_katigoria ON dbo.dikaiologitika.d_id = dbo.dikaiologitika_katigoria.dk_did INNER JOIN dbo.katigories ON dbo.dikaiologitika_katigoria.dk_katid = dbo.katigories.kat_id INNER JOIN dbo.oplitis ON dbo.katigories.kat_id = dbo.oplitis.op_katid
WHERE        (dbo.oplitis.op_id = @opid);
END

GO
/****** Object:  StoredProcedure [dbo].[get_dik_pou_exei_proskomisei_by_id]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_dik_pou_exei_proskomisei_by_id] 
	-- Add the parameters for the stored procedure here
	@opid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select dbo.dikaiologitika.d_perigrafi FROM dbo.dikaiologitika INNER JOIN dbo.dikaiologitika_katigoria ON dbo.dikaiologitika.d_id = dbo.dikaiologitika_katigoria.dk_did INNER JOIN dbo.katigories ON dbo.dikaiologitika_katigoria.dk_katid = dbo.katigories.kat_id INNER JOIN dbo.oplitis ON dbo.katigories.kat_id = dbo.oplitis.op_katid
WHERE        (dbo.oplitis.op_id = @opid);
END

GO
/****** Object:  StoredProcedure [dbo].[get_dikaiologitika]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_dikaiologitika]
	
AS
	SELECT * from dikaiologitika;
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[get_katigoria]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_katigoria] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from katigories;
END

GO
/****** Object:  StoredProcedure [dbo].[get_katigoria_by_oplitis_id]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_katigoria_by_oplitis_id] 
	-- Add the parameters for the stored procedure here
	@opid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select dbo.rank.r_perigrafi, dbo.oplitis.op_eponymo, dbo.oplitis.op_onoma, dbo.oplitis.op_asm, dbo.oplitis.op_loxos, dbo.katigories.kat_name, dbo.oplitis.op_eggrafi, dbo.oplitis.op_id,op_paratiriseis,kat_katalogisteo,kat_kratiseis,kat_pliroteo, kat_dx, kat_dp from dbo.oplitis INNER JOIN dbo.rank ON dbo.oplitis.op_rid = dbo.rank.r_id INNER JOIN dbo.katigories ON dbo.oplitis.op_katid = dbo.katigories.kat_id where op_id=@opid;
END

GO
/****** Object:  StoredProcedure [dbo].[get_katigoria_from_change]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_katigoria_from_change]
	@opid int 
	
	AS
	SET NOCOUNT ON;

	declare  @katid_current int, @katid_old int;
	set @katid_current = (SELECT change.kat_id_curr from change where change.c_opid = @opid);
	set @katid_old = (SELECT change.kat_id_old from change where change.c_opid = @opid);

	select @katid_current as kat_id_curr,@katid_old as kat_id_old;
	
GO
/****** Object:  StoredProcedure [dbo].[get_katigoria_from_dikaiologitika]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_katigoria_from_dikaiologitika] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @num int, @total int,@plithos1 int, @plithos2 int,@a int,@b int, @c int;
	set @plithos1 = (select count(*) from temp);
	set @total = (select max(dk_katid) from dikaiologitika_katigoria);
	
create table squence (id int);
set @c=1;
	while (@total>0) 
	begin
	insert into squence select dk_did from dikaiologitika_katigoria where dk_katid = @total order by dk_id;
	--select @total, id from squence;
	set @plithos2 = (select count(*) from squence);
	if (@plithos1=@plithos2) 
	begin
	
	--select id,temp_sel_dikaiologitiko_val,(id-temp_sel_dikaiologitiko_val) as result from squence left join temp on id =temp_sel_dikaiologitiko_val; 
	
	set @a = (select count(id) from squence, temp where id =temp_sel_dikaiologitiko_val);
	if (@plithos1=@a)
	begin
		--select @total;
		break;
	end
	end ;



	set @total=@total-1;
	delete from squence;
	end

	drop table squence;
	delete from temp;


	
	
    -- Insert statements for procedure here
	 select kat_name,kat_katalogisteo,kat_kratiseis,kat_pliroteo,kat_dx,kat_dp from katigories where kat_id=@total;
END

GO
/****** Object:  StoredProcedure [dbo].[get_last_inserted_oplitis]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_last_inserted_oplitis] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare 
	@asm int,
	@lastPayDay date,
	@id int;
	select @id = (select top 1 op_id from oplitis order by op_id desc);
	select @lastPayDay =(select top 1 p_date from pliromi where p_opid=@id order by p_date desc);

    -- Insert statements for procedure here
	SELECT top 1 dbo.rank.r_perigrafi, dbo.oplitis.op_eponymo, dbo.oplitis.op_onoma, dbo.oplitis.op_asm, dbo.oplitis.op_loxos, dbo.oplitis.op_eggrafi, dbo.oplitis.op_paratiriseis, dbo.oplitis.op_id, dbo.pliromi.p_date, dbo.katigories.kat_katalogisteo, dbo.katigories.kat_kratiseis, dbo.katigories.kat_pliroteo, dbo.katigories.kat_name,kat_dx, kat_dp, @lastPayDay as fdmDate FROM dbo.katigories INNER JOIN
                         dbo.oplitis ON dbo.katigories.kat_id = dbo.oplitis.op_katid INNER JOIN
                         dbo.rank ON dbo.oplitis.op_rid = dbo.rank.r_id INNER JOIN
                         dbo.pliromi ON dbo.oplitis.op_id = dbo.pliromi.p_opid where p_opid=@id order by op_id desc;
END

GO
/****** Object:  StoredProcedure [dbo].[get_last_pliromi]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_last_pliromi] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare
	@pid int;
	set @pid = (select top 1 p_id from pliromi order by p_id desc);

    -- Insert statements for procedure here
	SELECT op_id, p_posoPliromis, dbo.pliromi.p_id, dbo.pliromi.p_date, dbo.oplitis.op_asm, dbo.rank.r_perigrafi, dbo.oplitis.op_onoma, dbo.oplitis.op_eponymo, dbo.oplitis.op_loxos, dbo.katigories.kat_name, dbo.katigories.kat_katalogisteo, dbo.katigories.kat_kratiseis, dbo.katigories.kat_pliroteo, dbo.misthodosia.m_perigrafi FROM dbo.oplitis INNER JOIN         dbo.pliromi ON dbo.oplitis.op_id = dbo.pliromi.p_opid INNER JOIN dbo.rank ON dbo.oplitis.op_rid = dbo.rank.r_id INNER JOIN dbo.katigories ON dbo.oplitis.op_katid = dbo.katigories.kat_id INNER JOIN dbo.misthodosia ON dbo.pliromi.p_mid = dbo.misthodosia.m_id where p_id=@pid;
END

GO
/****** Object:  StoredProcedure [dbo].[get_last_pliromi_by_id]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_last_pliromi_by_id]
	-- Add the parameters for the stored procedure here
	@pid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 op_id,dbo.pliromi.p_id, dbo.pliromi.p_date, dbo.oplitis.op_asm, dbo.rank.r_perigrafi, dbo.oplitis.op_onoma, dbo.oplitis.op_eponymo, dbo.oplitis.op_loxos, dbo.katigories.kat_name, dbo.katigories.kat_katalogisteo, dbo.katigories.kat_kratiseis, dbo.katigories.kat_pliroteo, dbo.misthodosia.m_perigrafi,p_posoPliromis FROM dbo.oplitis INNER JOIN         dbo.pliromi ON dbo.oplitis.op_id = dbo.pliromi.p_opid INNER JOIN dbo.rank ON dbo.oplitis.op_rid = dbo.rank.r_id INNER JOIN dbo.katigories ON dbo.oplitis.op_katid = dbo.katigories.kat_id INNER JOIN dbo.misthodosia ON dbo.pliromi.p_mid = dbo.misthodosia.m_id where p_id=@pid;
END

GO
/****** Object:  StoredProcedure [dbo].[get_last_pliromi_by_opid]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_last_pliromi_by_opid]
	-- Add the parameters for the stored procedure here
	@opid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 op_id,dbo.pliromi.p_id, dbo.pliromi.p_date, dbo.oplitis.op_asm,p_posoPliromis, dbo.rank.r_perigrafi, dbo.oplitis.op_onoma, dbo.oplitis.op_eponymo, dbo.oplitis.op_loxos, dbo.katigories.kat_name, dbo.katigories.kat_katalogisteo, dbo.katigories.kat_kratiseis, dbo.katigories.kat_pliroteo, dbo.misthodosia.m_perigrafi FROM dbo.oplitis INNER JOIN         dbo.pliromi ON dbo.oplitis.op_id = dbo.pliromi.p_opid INNER JOIN dbo.rank ON dbo.oplitis.op_rid = dbo.rank.r_id INNER JOIN dbo.katigories ON dbo.oplitis.op_katid = dbo.katigories.kat_id INNER JOIN dbo.misthodosia ON dbo.pliromi.p_mid = dbo.misthodosia.m_id where op_id=@opid order by p_date desc,p_id desc;
END

GO
/****** Object:  StoredProcedure [dbo].[get_last_updated_oplitis]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_last_updated_oplitis] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare 
@opid int,
@katid_old int, 
@kat_perigrafi_old nvarchar(80),
@isxysDate date,
@metaboli date;

select @opid = (select top 1 c_opid from change order by c_date desc,c_id desc);
set @katid_old = (select top 1 kat_id_old from change where c_opid = @opid order by c_id desc);
set @kat_perigrafi_old = (SELECT kat_name from katigories where kat_id=@katid_old);
set @metaboli = (select top 1 c_date from change where c_opid=@opid order by c_id desc);
set @isxysDate = (select top 1 c_isxys_date from change where c_opid=@opid order by c_id desc)
    -- Insert statements for procedure here
	

	select dbo.rank.r_perigrafi, @isxysDate as c_isxys_date, dbo.oplitis.op_eponymo, dbo.oplitis.op_onoma, op_paratiriseis, dbo.oplitis.op_asm, dbo.oplitis.op_loxos, dbo.katigories.kat_name,kat_katalogisteo, kat_kratiseis,kat_pliroteo,kat_dp,kat_dx, @metaboli as op_metaboli,  dbo.oplitis.op_id from dbo.oplitis INNER JOIN dbo.rank ON dbo.oplitis.op_rid = dbo.rank.r_id INNER JOIN dbo.katigories ON dbo.oplitis.op_katid = dbo.katigories.kat_id where op_id=@opid;
END

GO
/****** Object:  StoredProcedure [dbo].[get_last_updated_oplitis_dik]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_last_updated_oplitis_dik]
	-- Add the parameters for the stored procedure here
	@opid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select dbo.dikaiologitika.d_perigrafi FROM dbo.dikaiologitika INNER JOIN dbo.dikaiologitika_katigoria ON dbo.dikaiologitika.d_id = dbo.dikaiologitika_katigoria.dk_did INNER JOIN dbo.katigories ON dbo.dikaiologitika_katigoria.dk_katid = dbo.katigories.kat_id INNER JOIN dbo.oplitis ON dbo.katigories.kat_id = dbo.oplitis.op_katid
WHERE        (dbo.oplitis.op_id = @opid);
END

GO
/****** Object:  StoredProcedure [dbo].[get_misthodosia]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_misthodosia] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT m_id,m_perigrafi from misthodosia;
END

GO
/****** Object:  StoredProcedure [dbo].[get_money]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_money]

	
	AS
	
	SELECT * from katigories;
GO
/****** Object:  StoredProcedure [dbo].[get_oplitis]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_oplitis]
AS
	SET NOCOUNT ON;

select dbo.rank.r_perigrafi, dbo.oplitis.op_eponymo , dbo.oplitis.op_onoma, dbo.oplitis.op_asm, dbo.oplitis.op_loxos, dbo.katigories.kat_name, dbo.oplitis.op_eggrafi, dbo.oplitis.op_id,op_paratiriseis from dbo.oplitis INNER JOIN dbo.rank ON dbo.oplitis.op_rid = dbo.rank.r_id INNER JOIN dbo.katigories ON dbo.oplitis.op_katid = dbo.katigories.kat_id;--auto einai sosto
GO
/****** Object:  StoredProcedure [dbo].[get_pliromi_diagrammenou_by_id_diagrammenou]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_pliromi_diagrammenou_by_id_diagrammenou]

	-- Add the parameters for the stored procedure here
	@doid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.rank.r_perigrafi, dbo.diagrammenos_oplitis.do_eponymo, dbo.diagrammenos_oplitis.do_onoma, dbo.misthodosia.m_perigrafi, 
                         dbo.pliromi_diagrammenou_opliti.pdo_payDay, dbo.pliromi_diagrammenou_opliti.pdo_posoPliromis
FROM            dbo.diagrammenos_oplitis INNER JOIN
                         dbo.rank ON dbo.diagrammenos_oplitis.do_rid = dbo.rank.r_id INNER JOIN
                         dbo.katigories ON dbo.diagrammenos_oplitis.do_katid = dbo.katigories.kat_id INNER JOIN
                         dbo.pliromi_diagrammenou_opliti ON dbo.diagrammenos_oplitis.do_id = dbo.pliromi_diagrammenou_opliti.pdo_doid INNER JOIN
                         dbo.misthodosia ON dbo.pliromi_diagrammenou_opliti.pdo_pmid = dbo.misthodosia.m_id where pdo_doid=@doid;
END

GO
/****** Object:  StoredProcedure [dbo].[get_rank]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_rank] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from rank;
END
GO
/****** Object:  StoredProcedure [dbo].[get_rank_by_id]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_rank_by_id] 
	-- Add the parameters for the stored procedure here
	@opid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT op_rid from oplitis where op_id = @opid;
END

GO
/****** Object:  StoredProcedure [dbo].[get_xrimatikos_logismos]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_xrimatikos_logismos]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select kat_name as 'ΚΑΤΗΓΟΡΙΑ', count(op_id) as 'ΑΡ. ΟΠΛΙΤΩΝ ΑΝΑ ΚΑΤΗΓΟΡΙΑ', (kat_katalogisteo*count(op_id)) as 'ΣΥΝ. ΚΑΤΑΛΟΓΙΣΤΕΟ ΑΝΑ ΚΑΤΗΓΟΡΙΑ', (kat_kratiseis*count(op_id)) as 'ΣΥΝ. ΚΡΑΤΗΣΕΙΣ ΑΝΑ ΚΑΤΗΓΟΡΙΑ' from oplitis, katigories where op_katid=kat_id group by op_katid,kat_name,kat_katalogisteo,kat_kratiseis;
END

GO
/****** Object:  StoredProcedure [dbo].[katigoria_selection]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[katigoria_selection]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select temp_sel_dikaiologitiko_val  from temp order by temp_sel_dikaiologitiko_val asc;
	select count(temp_sel_dikaiologitiko_val) from temp;
	select temp_sel_dikaiologitiko_val, checksum(temp_sel_dikaiologitiko_val) as chksum from temp;

	select dk_katid, dk_did from dikaiologitika_katigoria group by dk_katid, dk_did;
	select dk_katid, dk_did, CHECKSUM(dk_did) as chksum from dikaiologitika_katigoria group by dk_katid, dk_did;
	select dk_katid, count(dk_id) as arithmos_dikaiologitikon from dikaiologitika_katigoria group by dk_katid;

END

GO
/****** Object:  StoredProcedure [dbo].[last_payments]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[last_payments]
	@opid int
AS	
begin
	set nocount on;

	SELECT       r_perigrafi,op_eponymo ,op_onoma , dbo.pliromi.p_id , dbo.pliromi.p_date , dbo.misthodosia.m_perigrafi , dbo.pliromi.p_posoPliromis, p_id
FROM            dbo.misthodosia INNER JOIN
                         dbo.pliromi ON dbo.misthodosia.m_id = dbo.pliromi.p_mid INNER JOIN
                         dbo.oplitis ON dbo.pliromi.p_opid = dbo.oplitis.op_id inner join rank on op_rid=r_id
WHERE        (dbo.oplitis.op_id = @opid) order by p_date desc
	end
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[login] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(50),
	@password nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare 
	@count int;
    -- Insert statements for procedure here
	select @count = (select count(username) from users where username=@username and pass=@password);

	if (@count=1) 
	begin
	select 1 as ReturnCode;
	end
	else
	begin
	select -1 as ReturnCode;
	end
END

GO
/****** Object:  StoredProcedure [dbo].[register]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[register] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(50),
	@password nvarchar(100),
	@bathmos nvarchar(20),
	@onoma nvarchar(20),
	@eponymo nvarchar(30),
	@monada nvarchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare
	@count int,
	@ReturnCode int;
	    -- Insert statements for procedure here
		select @count = (select count(username) from users where username=@username);

		if @count>0
		begin 
		set @ReturnCode= -1;
		end 
		else 
		begin
		set @ReturnCode= 1;
		insert into users (username,pass,u_onoma,u_bathmos,u_eponymo,u_monada) values (@username,@password,@onoma,@bathmos,@eponymo,@monada);
		end
		select @ReturnCode as ReturnValue;

END

GO
/****** Object:  StoredProcedure [dbo].[update_oplitis]    Script Date: 1/7/2015 10:35:00  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_oplitis] 
	-- Add the parameters for the stored procedure here
	@id int=0,
	@asm int=0,
	@onoma nvarchar(20),
	@eponymo nvarchar(20),
	@metaboli date,
	@bathmos nvarchar(20),
	@katigoria nvarchar(80),
	@loxos nvarchar(10),
	@paratiriseis text,
	@isxysDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @rid INT, @katid_new int, @katid_old int;
	set @rid = (select r_id from rank where r_perigrafi = @bathmos);
	set @katid_new = (select kat_id from katigories where kat_name = @katigoria);
	set @katid_old =(select op_katid from oplitis where op_id=@id);
    -- Insert statements for procedure here

	insert into change (c_date,kat_id_old,c_opid,c_isxys_date) values (@metaboli,@katid_old,@id,@isxysDate);

	update oplitis set op_asm=@asm, op_onoma=@onoma, op_eponymo=@eponymo, op_loxos=@loxos,op_paratiriseis=@paratiriseis, op_rid=@rid, op_katid=@katid_new where op_id=@id; 

	
	END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[38] 2[37] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "oplitis"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pliromi"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rank"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 101
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "katigories"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 135
               Right = 836
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sunolikos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'50
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sunolikos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sunolikos'
GO
USE [master]
GO
ALTER DATABASE [Misthodosia_Opliton] SET  READ_WRITE 
GO
