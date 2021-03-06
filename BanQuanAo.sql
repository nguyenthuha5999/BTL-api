USE [BanQuanAo]
GO
/****** Object:  Database [BanQuanAo]    Script Date: 10/27/2020 11:35:33 PM ******/
CREATE DATABASE [BanQuanAo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanQuanAo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BanQuanAo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanQuanAo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BanQuanAo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BanQuanAo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanQuanAo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanQuanAo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanQuanAo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanQuanAo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanQuanAo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanQuanAo] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanQuanAo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanQuanAo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanQuanAo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanQuanAo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanQuanAo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanQuanAo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanQuanAo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanQuanAo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanQuanAo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanQuanAo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BanQuanAo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanQuanAo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanQuanAo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanQuanAo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanQuanAo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanQuanAo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanQuanAo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanQuanAo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanQuanAo] SET  MULTI_USER 
GO
ALTER DATABASE [BanQuanAo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanQuanAo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanQuanAo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanQuanAo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanQuanAo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanQuanAo] SET QUERY_STORE = OFF
GO
USE [BanQuanAo]
GO
/****** Object:  Table [dbo].[chi_tiet_hoa_don]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_hoa_don](
	[ma_chi_tiet] [varchar](50) NOT NULL,
	[ma_hoa_don] [varchar](50) NULL,
	[item_id] [varchar](50) NULL,
	[so_luong] [int] NULL,
 CONSTRAINT [PK_chi_tiet_hoa_don] PRIMARY KEY CLUSTERED 
(
	[ma_chi_tiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_email] [varchar](100) NOT NULL,
	[customer_password] [varchar](150) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customer_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[ma_hoa_don] [varchar](50) NOT NULL,
	[ho_ten] [nvarchar](150) NULL,
	[dia_chi] [nvarchar](250) NULL,
 CONSTRAINT [PK_hoa_don] PRIMARY KEY CLUSTERED 
(
	[ma_hoa_don] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[item_id] [varchar](50) NOT NULL,
	[item_group_id] [varchar](50) NULL,
	[item_name] [nvarchar](150) NULL,
	[item_image] [varchar](250) NULL,
	[item_price] [float] NULL,
	[item_description] [nvarchar](max) NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item_group]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_group](
	[parent_item_group_id] [varchar](50) NULL,
	[item_group_id] [varchar](50) NOT NULL,
	[item_group_name] [nvarchar](250) NULL,
	[seq_num] [smallint] NULL,
	[url] [varchar](150) NULL,
 CONSTRAINT [PK_item_group] PRIMARY KEY CLUSTERED 
(
	[item_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [varchar](50) NOT NULL,
	[hoten] [nvarchar](150) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](250) NULL,
	[gioitinh] [nvarchar](30) NULL,
	[email] [varchar](150) NULL,
	[taikhoan] [varchar](30) NULL,
	[matkhau] [varchar](60) NULL,
	[role] [varchar](30) NULL,
	[image_url] [varchar](300) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'219189f0-7e15-4aa7-8dba-52a9316de1e3', N'4847a2ee-dbc5-42cb-a756-a9c7a70014a7', N'80537b17-305e-4081-96e8-f135156f6e90', 1)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'39a3ef99-4159-41c8-a346-c23d0984298c', N'c7251ccd-440d-4248-8bcd-d43967d9af84', N'63fd9596-4de4-45bb-b565-1bbdeb3fe2e5', 1)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'4682f185-73e5-414a-8311-2835c722b992', N'26d1800b-784c-4236-b8ad-3a23d433245b', N'4a9ab711-6053-43ee-bbeb-1ee5444fab88', 6)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'5183b6f9-58ef-461f-b67e-18f7d6131543', N'54741a30-5328-476e-af90-b66afc0325ec', N'63fd9596-4de4-45bb-b565-1bbdeb3fe2e5', 1)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'65fd88f6-cf4a-4462-8832-4db1e34224ce', N'4847a2ee-dbc5-42cb-a756-a9c7a70014a7', N'0b5b23f7-80c7-4c13-90c4-4b54fec7d434', 13)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'684b2dc3-50a6-4b1a-8337-25e353921181', N'26d1800b-784c-4236-b8ad-3a23d433245b', N'ec1f6c94-fa10-496f-a8a0-4c73ac1acaf9', 2)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'69cbfb10-265b-4a46-8dbb-f8fc4c2757ac', N'048f8037-dacc-4f80-a6b7-d68562b86471', N'a660345f-0330-4581-a3bd-30fbde34813f', 1)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'799bf080-0170-41b5-9bdc-7799ee7c37fa', N'831e8950-71dd-4763-8693-6c9e1557f801', N'4a9ab711-6053-43ee-bbeb-1ee5444fab88', 7)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'92696a6a-c339-4ead-9921-a5b46a314d08', N'a567d523-9f9a-48d1-aad5-0407e3b328f2', N'ec1f6c94-fa10-496f-a8a0-4c73ac1acaf9', 2)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'987f3142-229b-400b-a977-541480bc2ccf', N'343c71df-e4c1-42ba-9990-0275249cdc01', N'4a9ab711-6053-43ee-bbeb-1ee5444fab88', 10)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'a1c0c30f-d840-48c2-9439-5ea2ab2215de', N'a620ac12-4ac0-4544-9525-6dfbf12499eb', N'63fd9596-4de4-45bb-b565-1bbdeb3fe2e5', 1)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'a7dc3f57-bad9-47cb-bf9f-1cece55430ca', N'a567d523-9f9a-48d1-aad5-0407e3b328f2', N'4a9ab711-6053-43ee-bbeb-1ee5444fab88', 6)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'b47b1609-9940-4136-8461-6d75744efdbe', N'54741a30-5328-476e-af90-b66afc0325ec', N'4b4625ea-69ea-4ece-b378-e76eb941a954', 1)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'c4541761-01de-43d6-91d0-98be8a07f242', N'c7251ccd-440d-4248-8bcd-d43967d9af84', N'4b4625ea-69ea-4ece-b378-e76eb941a954', 1)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'c81de479-da62-436a-99be-87029ca51a87', N'343c71df-e4c1-42ba-9990-0275249cdc01', N'63fd9596-4de4-45bb-b565-1bbdeb3fe2e5', 1)
INSERT [dbo].[chi_tiet_hoa_don] ([ma_chi_tiet], [ma_hoa_don], [item_id], [so_luong]) VALUES (N'd01554a9-9ff2-4619-b4af-7efc18efe2bc', N'a620ac12-4ac0-4544-9525-6dfbf12499eb', N'4a9ab711-6053-43ee-bbeb-1ee5444fab88', 10)
GO
INSERT [dbo].[customer] ([customer_email], [customer_password]) VALUES (N'2222222@gamil.com', N'123456')
INSERT [dbo].[customer] ([customer_email], [customer_password]) VALUES (N'dong333nh@gmail.com', N'123456')
INSERT [dbo].[customer] ([customer_email], [customer_password]) VALUES (N'dongn2h@34343', N'123456')
INSERT [dbo].[customer] ([customer_email], [customer_password]) VALUES (N'dongn2h@g', N'123456')
INSERT [dbo].[customer] ([customer_email], [customer_password]) VALUES (N'dongnh@gmail.com', N'123456')
GO
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ho_ten], [dia_chi]) VALUES (N'048f8037-dacc-4f80-a6b7-d68562b86471', N'', N'')
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ho_ten], [dia_chi]) VALUES (N'26d1800b-784c-4236-b8ad-3a23d433245b', N'LinhCntt', N'Mê Linh - Hà Nội')
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ho_ten], [dia_chi]) VALUES (N'343c71df-e4c1-42ba-9990-0275249cdc01', N'Nguyễn Văn Anh', N'Hưng Yên')
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ho_ten], [dia_chi]) VALUES (N'4847a2ee-dbc5-42cb-a756-a9c7a70014a7', N'4444444444', N'2222222222222')
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ho_ten], [dia_chi]) VALUES (N'54741a30-5328-476e-af90-b66afc0325ec', N'linh', N'Mê Linh - Hà Nội')
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ho_ten], [dia_chi]) VALUES (N'831e8950-71dd-4763-8693-6c9e1557f801', N'23123', N'222222222222222222222')
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ho_ten], [dia_chi]) VALUES (N'a567d523-9f9a-48d1-aad5-0407e3b328f2', N'Nguyễn Linh', N'Mê Linh - Hà Nội')
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ho_ten], [dia_chi]) VALUES (N'a620ac12-4ac0-4544-9525-6dfbf12499eb', N'Nguyễn Văn Anh', N'Hưng Yên')
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ho_ten], [dia_chi]) VALUES (N'c7251ccd-440d-4248-8bcd-d43967d9af84', N'linh', N'ha noi')
GO
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (N'0b5b23f7-80c7-4c13-90c4-4b54fec7d434', N'1b2f3b32-d006-4ed8-ab0c-099fd86aa6dd', N'Quần tây', N'assets/images/product-01.jpg', 960000, N'Áo vest nữ công sở là mẫu áo khoác của các chị em phụ nữ luôn đồng hành không thể xa rời chúng ta mỗi khi đi làm việc hoặc gặp gỡ đối tác. Kiểu dáng của các mẫu áo vest nữ công sở khá dễ mặc, toát lên vẻ đẹp thanh lịch, hiện đại.

Màu sắc ngày càng phong phú hơn thay vì màu đen, trắng thì giờ đây các màu xám, xanh, hồng, vàng... cũng đã xuất hiện nhiều hơn giúp các chị em có thể dễ dàng lựa chọn.

Nếu như trước đây, những mẫu áo khoác công sở thường bị gắn liền với những cụm từ đơn điệu, nhàm chán thì ngày nay, các nhà thiết kế đã “thổi hồn” giúp Style thời trang này trở thành món đồ trẻ trung, phong cách và thời thượng.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (N'4a9ab711-6053-43ee-bbeb-1ee5444fab88', NULL, N'Áo sơ mii', NULL, 1100000, N'Áo vest nữ công sở là mẫu áo khoác của các chị em phụ nữ luôn đồng hành không thể xa rời chúng ta mỗi khi đi làm việc hoặc gặp gỡ đối tác. Kiểu dáng của các mẫu áo vest nữ công sở khá dễ mặc, toát lên vẻ đẹp thanh lịch, hiện đại.

Màu sắc ngày càng phong phú hơn thay vì màu đen, trắng thì giờ đây các màu xám, xanh, hồng, vàng... cũng đã xuất hiện nhiều hơn giúp các chị em có thể dễ dàng lựa chọn.

Nếu như trước đây, những mẫu áo khoác công sở thường bị gắn liền với những cụm từ đơn điệu, nhàm chán thì ngày nay, các nhà thiết kế đã “thổi hồn” giúp Style thời trang này trở thành món đồ trẻ trung, phong cách và thời thượng.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (N'4b4625ea-69ea-4ece-b378-e76eb941a954', NULL, N'Chân váy', NULL, 990000, N'Áo vest nữ công sở là mẫu áo khoác của các chị em phụ nữ luôn đồng hành không thể xa rời chúng ta mỗi khi đi làm việc hoặc gặp gỡ đối tác. Kiểu dáng của các mẫu áo vest nữ công sở khá dễ mặc, toát lên vẻ đẹp thanh lịch, hiện đại.

Màu sắc ngày càng phong phú hơn thay vì màu đen, trắng thì giờ đây các màu xám, xanh, hồng, vàng... cũng đã xuất hiện nhiều hơn giúp các chị em có thể dễ dàng lựa chọn.

Nếu như trước đây, những mẫu áo khoác công sở thường bị gắn liền với những cụm từ đơn điệu, nhàm chán thì ngày nay, các nhà thiết kế đã “thổi hồn” giúp Style thời trang này trở thành món đồ trẻ trung, phong cách và thời thượng.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (N'80537b17-305e-4081-96e8-f135156f6e90', N'1b2f3b32-d006-4ed8-ab0c-099fd86aa6dd', N'Váy công sở', N'assets/images/product-06.jpg', 1650000, N'Áo vest nữ công sở là mẫu áo khoác của các chị em phụ nữ luôn đồng hành không thể xa rời chúng ta mỗi khi đi làm việc hoặc gặp gỡ đối tác. Kiểu dáng của các mẫu áo vest nữ công sở khá dễ mặc, toát lên vẻ đẹp thanh lịch, hiện đại.

Màu sắc ngày càng phong phú hơn thay vì màu đen, trắng thì giờ đây các màu xám, xanh, hồng, vàng... cũng đã xuất hiện nhiều hơn giúp các chị em có thể dễ dàng lựa chọn.

Nếu như trước đây, những mẫu áo khoác công sở thường bị gắn liền với những cụm từ đơn điệu, nhàm chán thì ngày nay, các nhà thiết kế đã “thổi hồn” giúp Style thời trang này trở thành món đồ trẻ trung, phong cách và thời thượng.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (N'de193ee7-94d9-41c0-8673-ddb89ce2ae53', NULL, N'Quần jeannn', NULL, 980000, N'Áo vest nữ công sở là mẫu áo khoác của các chị em phụ nữ luôn đồng hành không thể xa rời chúng ta mỗi khi đi làm việc hoặc gặp gỡ đối tác. Kiểu dáng của các mẫu áo vest nữ công sở khá dễ mặc, toát lên vẻ đẹp thanh lịch, hiện đại.

Màu sắc ngày càng phong phú hơn thay vì màu đen, trắng thì giờ đây các màu xám, xanh, hồng, vàng... cũng đã xuất hiện nhiều hơn giúp các chị em có thể dễ dàng lựa chọn.

Nếu như trước đây, những mẫu áo khoác công sở thường bị gắn liền với những cụm từ đơn điệu, nhàm chán thì ngày nay, các nhà thiết kế đã “thổi hồn” giúp Style thời trang này trở thành món đồ trẻ trung, phong cách và thời thượng.')
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price], [item_description]) VALUES (N'ec1f6c94-fa10-496f-a8a0-4c73ac1acaf9', NULL, N'Phụ kiện1', NULL, 2990000, N'Áo vest nữ công sở là mẫu áo khoác của các chị em phụ nữ luôn đồng hành không thể xa rời chúng ta mỗi khi đi làm việc hoặc gặp gỡ đối tác. Kiểu dáng của các mẫu áo vest nữ công sở khá dễ mặc, toát lên vẻ đẹp thanh lịch, hiện đại.

Màu sắc ngày càng phong phú hơn thay vì màu đen, trắng thì giờ đây các màu xám, xanh, hồng, vàng... cũng đã xuất hiện nhiều hơn giúp các chị em có thể dễ dàng lựa chọn.

Nếu như trước đây, những mẫu áo khoác công sở thường bị gắn liền với những cụm từ đơn điệu, nhàm chán thì ngày nay, các nhà thiết kế đã “thổi hồn” giúp Style thời trang này trở thành món đồ trẻ trung, phong cách và thời thượng.')
GO
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (N'b1e07672-95c7-4f64-abaa-43fb85657db2', N'1765fb7d-da43-4d3c-b8f0-070f84228e0c', N'Quần tây', 12, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (N'b1e07672-95c7-4f64-abaa-43fb85657db2', N'1b2f3b32-d006-4ed8-ab0c-099fd86aa6dd', N'Áo sơ mi', 11, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (NULL, N'4a12aa7a-8604-4ce3-a223-35f729b2ceec', N'Phụ kiện', 2, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (NULL, N'728a4f13-18ae-4d82-bd08-ec34deb36ef4', N'Contact', 3, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (N'4a12aa7a-8604-4ce3-a223-35f729b2ceec', N'98cd5a4a-2610-4c4e-9e1e-3f767fbc74cf', N'Đồng hồ', 21, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (NULL, N'b1e07672-95c7-4f64-abaa-43fb85657db2', N'Shop', 1, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (N'b1e07672-95c7-4f64-abaa-43fb85657db2', N'bbc3c5a5-a45b-4879-8e70-9cb0ea1dae92', N'Áo khoác nữ', 13, NULL)
GO
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'14ff5489-9b84-4bd4-801d-55374bdbe15b', N'Nguyễn Minh Khôi', CAST(N'2020-10-10' AS Date), N'Hưng Yên', N'Nam', N'khoi@gmail.com', N'khoi', N'123@123', N'Admin', NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'3d5111a9-6ff0-45c7-89c6-cbc68c7f8744', N'Trần Thị Hoa66668888', CAST(N'2020-10-10' AS Date), N'Hà Nội888', N'Nam', N'hoa@gmail.com', N'hoa', N'hoa@123', N'Admin', NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'531ecaad-c81d-4407-ae8f-e01efb36d2b5', N'Nguyễn Thanh Huệ', CAST(N'2020-10-12' AS Date), N'hưng yên', N'Nam', N'hue@gmail.com', N'huentt', N'123@123', N'User', NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'5be2f5ce-8c04-491c-916e-8b3eb5c14d29', N'Nguyễn Thị Linh', CAST(N'1999-07-28' AS Date), N'Hà Nội', N'Nữ', N'nguyenthilinh02081999@gmail.com', N'02081999', N'linhcntt02081999@', N'User', NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'82bd035e-2772-4f96-aab9-3ddb050817eb', N'Nguyễn Hữu Đông', CAST(N'1969-12-29' AS Date), N'Hưng Yên', N'Nữ', N'dong@gmail.com', N'dongnh', N'123@123', N'User', NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'885f03ad-46dc-442a-be3a-29f264496409', N'Nguyễn Hữu Hùng', CAST(N'2020-10-11' AS Date), N'Hà Nội', N'Nam', N'hung@gamil.com', N'hung', N'123@123', N'Admin', NULL)
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'c5799c78-3f78-4e40-b2fc-23ec8073ddfd', N'Nguyễn Thị Mai', CAST(N'2020-10-13' AS Date), N'Hải Phòng', N'Nam', N'mai@gmail.com', N'mai', N'mai@123', N'Admin', N'assets/images/Screenshot (4).png')
INSERT [dbo].[user] ([user_id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [image_url]) VALUES (N'cc49bfa6-ebde-484b-abad-5ae180a64567', N'Admin', CAST(N'1977-01-08' AS Date), N'Hưng Yên', N'Nam', N'admin@gmail.com', N'admin', N'admin', N'Admin', NULL)
GO
/****** Object:  StoredProcedure [dbo].[sp_customer_create]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[sp_customer_create]
(@customer_email              VARCHAR(100), 
 @customer_password          VARCHAR(150)  
)
AS
    BEGIN
      INSERT INTO customer
                (customer_email, 
                 customer_password)
                VALUES
                (@customer_email, 
                 @customer_password);
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_hoa_don_create]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_hoa_don_create]
(@ma_hoa_don              VARCHAR(50), 
 @ho_ten          NVARCHAR(150), 
 @dia_chi          NVARCHAR(250),  
 @listjson_chitiet NVARCHAR(MAX)
)
AS
    BEGIN
        INSERT INTO hoa_don
                (ma_hoa_don, 
                 ho_ten, 
                 dia_chi               
                )
                VALUES
                (@ma_hoa_don, 
                 @ho_ten, 
                 @dia_chi
                );
                IF(@listjson_chitiet IS NOT NULL)
                    BEGIN
                        INSERT INTO chi_tiet_hoa_don
                        (ma_chi_tiet, 
                         ma_hoa_don, 
                         item_id, 
                         so_luong                       
                        )
                               SELECT JSON_VALUE(p.value, '$.ma_chi_tiet'), 
                                      @ma_hoa_don, 
                                      JSON_VALUE(p.value, '$.item_id'), 
                                      JSON_VALUE(p.value, '$.so_luong')    
                               FROM OPENJSON(@listjson_chitiet) AS p;
                END;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_all]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_item_all]
AS
    BEGIN
        SELECT item.item_id, 
               item.item_group_id, 
               item.item_image, 
			   item.item_name, 
			   item.item_price,
			   item.item_description
        FROM item 
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_create]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_item_create]
(@item_id             VARCHAR(50), 
 @item_group_id       VARCHAR(50), 
 @item_image          VARCHAR(250), 
 @item_name           NVARCHAR(150), 
 @item_price          float,
 @item_description    Nvarchar(Max)
)
AS
    BEGIN
      INSERT INTO item
                (item_id, 
                 item_group_id, 
                 item_image, 
                 item_name, 
                 item_price,
				 item_description				 
                )
                VALUES
                (@item_id, 
                 @item_group_id, 
                 @item_image, 
                 @item_name, 
                 @item_price,
				 @item_description
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_delete]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_item_delete]
(@item_id              varchar(50) 
)
AS
    BEGIN
		delete from [item] where item_id = @item_id;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_get_by_id]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_item_get_by_id](@item_id VARCHAR(50))
AS
    BEGIN
        SELECT item.item_id, 
               item.item_group_id, 
               item.item_image, 
			   item.item_name, 
			   item.item_price, 
			   item.item_description
        FROM item
      where  item.item_id = @item_id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_group_get_data]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_item_group_get_data]
AS
    BEGIN
        SELECT item_group.parent_item_group_id, 
               item_group.item_group_id, 
               item_group.item_group_name, 
               item_group.seq_num,
			   item_group.url
        FROM item_group
        ORDER BY item_group.seq_num;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_same_type]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_item_same_type] (@item_group_id varchar(50))
AS
    BEGIN
        SELECT item.item_id, 
               item.item_group_id, 
               item.item_image, 
			   item.item_name, 
			   item.item_price,
			   item.item_description
        FROM item 
		where item.item_group_id=@item_group_id
    END;

GO
/****** Object:  StoredProcedure [dbo].[sp_item_search]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROCEDURE [dbo].[sp_item_search] (@page_index  INT, 
                                       @page_size   INT,
									   @item_group_id Nvarchar(50))
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY item_name ASC)) AS RowNumber, 
                              i.item_id, 
                              i.item_group_id, 
                              i.item_name , 
                              i.item_image, 
                              i.item_price
                        INTO #Results1
                        FROM [item] AS i
					    WHERE i.item_group_id = @item_group_id;                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                               ORDER BY item_name ASC)) AS RowNumber, 
							   i.item_id, 
                              i.item_group_id, 
                              i.item_name , 
                              i.item_image, 
                              i.item_price
                         INTO #Results2
                        FROM [item] AS i
						WHERE i.item_group_id = @item_group_id;  
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_search_2]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_item_search_2] (@page_index  INT, 
                                       @page_size   INT,
									   @search nvarchar(255))
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY item_name ASC)) AS RowNumber, 
                              i.item_id,
							  i.item_group_id,
							  i.item_name,
							  i.item_image,
                              i.item_price,
							  i.item_description                           
                        INTO #Results1
                        FROM [item] AS i
					    WHERE i.item_name like '%'+@search+'%';                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                               ORDER BY item_id ASC)) AS RowNumber, 
                              i.item_id,
							  i.item_group_id,
							  i.item_name,
							  i.item_image,							
                              i.item_price,
							  i.item_description  
                              
                              
                        INTO #Results2
                        FROM [item] AS i
						WHERE i.item_name like '%'+@search+'%';  
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;

	Exec [dbo].[sp_item_search_2] 1,5, quần
GO
/****** Object:  StoredProcedure [dbo].[sp_item_searchadmin]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROCEDURE [dbo].[sp_item_searchadmin] (@page_index  int, 
                                       @page_size   int,
									   @item_name nvarchar(50))
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY item_name ASC)) AS RowNumber, 
                              i.item_id, 
                              i.item_group_id, 
                              i.item_name , 
                              i.item_image, 
                              i.item_price
                        INTO #Results1
                        FROM [item] AS i
					    WHERE (@item_name = '') or (i.item_name LIKE '%' + @item_name + '%')            
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                               ORDER BY item_name ASC)) AS RowNumber, 
                              i.item_id, 
                              i.item_group_id, 
                              i.item_name , 
                              i.item_image, 
                              i.item_price
                        INTO #Results2
                        FROM [item] AS i
						WHERE(@item_name = '') OR (i.item_name LIKE '%' + @item_name + '%') 
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_update]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_item_update]
(@item_id            varchar(50), 
 @item_group_id      varchar(50) ,
 @item_name       nvarchar(150)  ,
 @item_image       varchar(250)  ,
 @item_price        float  ,
 @item_description   nvarchar(max)
 
)
AS
    BEGIN
   update [item] set 
				item_group_id= @item_group_id,
				item_name= @item_name          ,
				item_image= @item_image           ,
				item_price= @item_price  ,
				item_description = @item_description
				
				where item_id = @item_id;
			 
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_create]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_create]
(@user_id              varchar(50), 
 @hoten          nvarchar(150) ,
 @ngaysinh         date  ,
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(30)  ,
 @email          varchar(150) ,
 @taikhoan         varchar(30) ,
 @matkhau         varchar(60)  ,
 @role          varchar(30) ,
 @image_url varchar(300) 
)
AS
    BEGIN
      INSERT INTO [user]
                (
				 	 [user_id]               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 role    ,
					 image_url
				)
                VALUES
                (
				 @user_id               , 
				 @hoten           ,
				 @ngaysinh          ,
				 @diachi           ,
				 @gioitinh           ,
				 @email           ,
				 @taikhoan         ,
				 @matkhau           ,
				 @role ,
				 @image_url
				);
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_delete]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_user_delete]
(@user_id              varchar(50) 
)
AS
    BEGIN
		delete from [user] where user_id = @user_id;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_id]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_get_by_id](@user_id VARCHAR(50))
AS
    BEGIN
        SELECT  [user_id]               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 role      ,
					 image_url  
        FROM [user]
      where  [user_id] = @user_id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_username_password]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_get_by_username_password](@taikhoan varchar(30), @matkhau varchar(60))
AS
    BEGIN
        SELECT  [user_id]               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 role      ,
					 image_url  
        FROM [user]
      where  taikhoan = @taikhoan and matkhau = @matkhau ;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_search]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_search] (@page_index  INT, 
                                       @page_size   INT,
									   @hoten nvarchar(150),
									    @taikhoan varchar(30)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.user_id              , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.role  ,
							 u.image_url  
                        INTO #Results1
                        FROM [user] AS u
						WHERE (u.taikhoan <> 'Admin') and ((@hoten = '') OR (u.hoten LIKE '%' + @hoten + '%')) and  ((@taikhoan = '') OR (u.taikhoan = @taikhoan));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.user_id              , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.role     ,
							 u.image_url  
                        INTO #Results2
                        FROM [user] AS u
						WHERE (u.taikhoan <> 'Admin') and ((@hoten = '') OR (u.hoten LIKE '%' + @hoten + '%')) and  ((@taikhoan = '') OR (u.taikhoan = @taikhoan));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_update]    Script Date: 10/27/2020 11:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_update]
(@user_id              varchar(50), 
 @hoten          nvarchar(150) ,
 @ngaysinh         date  ,
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(30)  ,
 @email          varchar(150) ,
 @taikhoan         varchar(30) ,
 @matkhau         varchar(60)  ,
 @role          varchar(30),
 @image_url         varchar(300)
)
AS
    BEGIN
   update [user] set 
				hoten= @hoten           ,
				ngaysinh= @ngaysinh          ,
				diachi= @diachi           ,
				gioitinh= @gioitinh           ,
				email= @email           ,
				matkhau = @matkhau           ,
				role= @role ,
				image_url = @image_url 
				where user_id = @user_id;
			 
        SELECT '';
    END;
GO
USE [master]
GO
ALTER DATABASE [BanQuanAo] SET  READ_WRITE 
GO
