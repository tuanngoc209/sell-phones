
create database ShoppingDB
Go
USE [ShoppingDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/04/2019 15:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[user_mail] [varchar](100) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[account_role] [int] NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_address] [nvarchar](255) NULL,
	[user_phone] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_mail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/04/2019 15:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[product_des] [nvarchar](255) NULL,
	[product_price] [float] NOT NULL,
	[product_img_source] [varchar](255) NULL,
	[product_type] [varchar](100) NULL,
	[product_brand] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/04/2019 15:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[user_mail] [varchar](100) NULL,
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_status] [int] NULL,
	[order_date] [date] NOT NULL,
	[order_discount_code] [varchar](8) NULL,
	[order_address] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetProductsType]    Script Date: 12/04/2019 15:03:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetProductsType]
@u int,
@v int,
@b varchar(50)
as
begin
 SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as row 
  FROM Products p where p.product_type = @b
 ) p WHERE p.row >= @u and p.row <= @v
end

GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 12/04/2019 15:03:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetProducts]
@u int,
@v int
as
begin
 SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as row 
  FROM Products p
 ) p WHERE p.row >= @u and p.row <= @v
end
GO
/****** Object:  Table [dbo].[Orders_detail]    Script Date: 12/04/2019 15:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount_product] [int] NULL,
	[price_product] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__Orders__order_da__1273C1CD]    Script Date: 12/04/2019 15:03:35 ******/
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
/****** Object:  ForeignKey [FK__Orders_de__order__182C9B23]    Script Date: 12/04/2019 15:03:35 ******/
ALTER TABLE [dbo].[Orders_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
/****** Object:  ForeignKey [FK__Orders_de__produ__1920BF5C]    Script Date: 12/04/2019 15:03:35 ******/
ALTER TABLE [dbo].[Orders_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
--adding data to product table
insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 11 Pro Max 512GB',N'Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',43.990,'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 11 Pro Max 256GB',N'Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',37.990,'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xs Max 256GB',N'Màn hình: 6.5", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',32.990,'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone X 256GB',N'Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',27.990,'https://cdn.tgdd.vn/Products/Images/42/190324/iphone-xs-256gb-white-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xs 64GB',N'Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',24.990,'https://cdn.tgdd.vn/Products/Images/42/190321/iphone-xs-max-gold-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xr 128GB',N'Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone Xr 128GB',N'Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 8 Plus 64GB',N'Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',16.590,'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-hh-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 7 Plus 32GB',N'Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 3 GB, ROM: 32 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',12.490,'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-32gb-gold-600x600.jpg','cellphone',
'apple')

insert into Products(product_name,product_des,product_price,product_img_source,product_type,product_brand)
values('iPhone 7 32GB',N'Màn hình: 4.7", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 2 GB, ROM: 32 GB
Camera: 12 MP, Selfie: 7 MP',10.490,'https://cdn.tgdd.vn/Products/Images/42/74110/iphone-7-gold-600x600.jpg','cellphone',
'apple')

--account table
INSERT [dbo].[Account] ([user_mail], [password], [account_role], [user_name], [user_address], [user_phone]) 
VALUES (N'duongdt@fpt.com.vn', N'123', 1, N'Đinh Tùng Dương', N'Đại học FPT', N'0765870407')
--customer
INSERT [dbo].[Account] ([user_mail], [password], [account_role], [user_name], [user_address], [user_phone]) 
VALUES (N'duydt@fpt.com.vn', N'123', 1, N'Dao Trong Duy', N'Đại học FPT', N'1234567')
ShoppingDB.sql
Đang hiển thị ShoppingDB.sql.