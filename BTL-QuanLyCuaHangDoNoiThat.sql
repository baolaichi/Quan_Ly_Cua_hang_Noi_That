USE [Quan Ly Cua hang do go noi that]
GO
/****** Object:  UserDefinedTableType [dbo].[ChiTietDonHangType]    Script Date: 6/16/2024 11:40:18 AM ******/
CREATE TYPE [dbo].[ChiTietDonHangType] AS TABLE(
	[SanPhamID] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [decimal](18, 2) NULL
)
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[DonHangID] [int] IDENTITY(1,1) NOT NULL,
	[KhachHangID] [int] NOT NULL,
	[NgayDatHang] [date] NOT NULL,
	[TongTien] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DonHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[ChiTietDonHangID] [int] IDENTITY(1,1) NOT NULL,
	[DonHangID] [int] NOT NULL,
	[SanPhamID] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaBan] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ChiTietDonHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_DoanhSoThang]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_DoanhSoThang] AS
SELECT YEAR(dh.NgayDatHang) AS Nam, MONTH(dh.NgayDatHang) AS Thang, SUM(ct.GiaBan * ct.SoLuong) AS TongDoanhSo
FROM DonHang dh
JOIN ChiTietDonHang ct ON dh.DonHangID = ct.DonHangID
GROUP BY YEAR(dh.NgayDatHang), MONTH(dh.NgayDatHang);
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[KhachHangID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[KhachHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[SanPhamID] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[Gia] [decimal](18, 2) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaGoc] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([ChiTietDonHangID], [DonHangID], [SanPhamID], [SoLuong], [GiaBan]) VALUES (8, 2, 1, 2, CAST(17000000.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonHang] ([ChiTietDonHangID], [DonHangID], [SanPhamID], [SoLuong], [GiaBan]) VALUES (9, 3, 3, 5, CAST(3000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([DonHangID], [KhachHangID], [NgayDatHang], [TongTien]) VALUES (2, 1, CAST(N'2024-12-05' AS Date), CAST(20000000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHang] ([DonHangID], [KhachHangID], [NgayDatHang], [TongTien]) VALUES (3, 2, CAST(N'2024-11-06' AS Date), CAST(13000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([KhachHangID], [HoTen], [DiaChi], [SoDienThoai]) VALUES (1, N'Nguyễn Văn Anh', N'Thái Nguyên', N'098776654')
INSERT [dbo].[KhachHang] ([KhachHangID], [HoTen], [DiaChi], [SoDienThoai]) VALUES (2, N'Lò Thị Như', N'Thái Nguyên', N'078833456')
INSERT [dbo].[KhachHang] ([KhachHangID], [HoTen], [DiaChi], [SoDienThoai]) VALUES (3, N'Chu Hầu An', N'Thái Nguyên', N'026786665')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [Gia], [SoLuong], [GiaGoc]) VALUES (1, N'Bộ bàn ăn 6 ghế', CAST(12000000.00 AS Decimal(18, 2)), 13, CAST(8000000.00 AS Decimal(18, 2)))
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [Gia], [SoLuong], [GiaGoc]) VALUES (2, N'sập thờ ', CAST(16000000.00 AS Decimal(18, 2)), 5, CAST(13000000.00 AS Decimal(18, 2)))
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [Gia], [SoLuong], [GiaGoc]) VALUES (3, N'giường hộp', CAST(3000000.00 AS Decimal(18, 2)), 19, CAST(1500500.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [GiaGoc]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([DonHangID])
REFERENCES [dbo].[DonHang] ([DonHangID])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([SanPhamID])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([KhachHangID])
REFERENCES [dbo].[KhachHang] ([KhachHangID])
GO
/****** Object:  StoredProcedure [dbo].[sp_LietKeSanPham]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LietKeSanPham]
AS
BEGIN
    SELECT * FROM SanPham;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaDonHang]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Chức năng sửa đơn hàng
CREATE PROCEDURE [dbo].[sp_SuaDonHang]
    @DonHangID INT,
    @KhachHangID INT,
    @NgayDatHang DATE,
    @ChiTiet ChiTietDonHangType READONLY
AS
BEGIN
    DECLARE @TongTien DECIMAL(18, 2);
    SET @TongTien = 0;

    -- Cập nhật thông tin đơn hàng
    UPDATE DonHang
    SET KhachHangID = @KhachHangID, NgayDatHang = @NgayDatHang
    WHERE DonHangID = @DonHangID;

    -- Xóa chi tiết đơn hàng cũ
    DELETE FROM ChiTietDonHang
    WHERE DonHangID = @DonHangID;

    -- Thêm chi tiết đơn hàng mới và tính tổng tiền
    DECLARE @SanPhamID INT, @SoLuong INT, @GiaBan DECIMAL(18, 2);

    DECLARE cur CURSOR FOR
    SELECT SanPhamID, SoLuong, GiaBan FROM @ChiTiet;

    OPEN cur;
    FETCH NEXT FROM cur INTO @SanPhamID, @SoLuong, @GiaBan;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO ChiTietDonHang (DonHangID, SanPhamID, SoLuong, GiaBan)
        VALUES (@DonHangID, @SanPhamID, @SoLuong, @GiaBan);

        SET @TongTien = @TongTien + (@GiaBan * @SoLuong);

        FETCH NEXT FROM cur INTO @SanPhamID, @SoLuong, @GiaBan;
    END;

    CLOSE cur;
    DEALLOCATE cur;

    -- Cập nhật tổng tiền của đơn hàng
    UPDATE DonHang
    SET TongTien = @TongTien
    WHERE DonHangID = @DonHangID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaSanPham]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SuaSanPham] @SanPhamID INT, @TenSanPham NVARCHAR(100), @Gia DECIMAL(18, 2), @SoLuong INT
AS
BEGIN
    UPDATE SanPham
    SET TenSanPham = @TenSanPham, Gia = @Gia, SoLuong = @SoLuong
    WHERE SanPhamID = @SanPhamID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemDonHang]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemDonHang]
    @KhachHangID INT,
    @NgayDatHang DATE,
    @ChiTiet ChiTietDonHangType READONLY
AS
BEGIN
    DECLARE @DonHangID INT;

    -- Tạo đơn hàng mới
    INSERT INTO DonHang (KhachHangID, NgayDatHang, TongTien)
    VALUES (@KhachHangID, @NgayDatHang, 0);

    -- Lấy ID của đơn hàng vừa tạo
    SET @DonHangID = SCOPE_IDENTITY();

    -- Thêm chi tiết đơn hàng và tính tổng tiền
    DECLARE @TongTien DECIMAL(18, 2);
    SET @TongTien = 0;

    DECLARE @SanPhamID INT, @SoLuong INT, @GiaBan DECIMAL(18, 2);

    DECLARE cur CURSOR FOR
    SELECT SanPhamID, SoLuong, GiaBan FROM @ChiTiet;

    OPEN cur;
    FETCH NEXT FROM cur INTO @SanPhamID, @SoLuong, @GiaBan;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO ChiTietDonHang (DonHangID, SanPhamID, SoLuong, GiaBan)
        VALUES (@DonHangID, @SanPhamID, @SoLuong, @GiaBan);

        SET @TongTien = @TongTien + (@GiaBan * @SoLuong);

        FETCH NEXT FROM cur INTO @SanPhamID, @SoLuong, @GiaBan;
    END;

    CLOSE cur;
    DEALLOCATE cur;

    -- Cập nhật tổng tiền của đơn hàng
    UPDATE DonHang
    SET TongTien = @TongTien
    WHERE DonHangID = @DonHangID;

    SELECT @DonHangID AS DonHangID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemSanPham]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemSanPham] @TenSanPham NVARCHAR(100), @Gia DECIMAL(18, 2), @SoLuong INT
AS
BEGIN
    INSERT INTO SanPham (TenSanPham, Gia, SoLuong)
    VALUES (@TenSanPham, @Gia, @SoLuong);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_TinhTongTienTheoThang]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinhTongTienTheoThang] @Thang INT, @Nam INT
AS
BEGIN
    DECLARE @TongTien DECIMAL(18, 2);
    SET @TongTien = 0.0;

    DECLARE cur CURSOR FOR
    SELECT ct.GiaBan * ct.SoLuong
    FROM ChiTietDonHang ct
    JOIN DonHang dh ON ct.DonHangID = dh.DonHangID
    WHERE MONTH(dh.NgayDatHang) = @Thang AND YEAR(dh.NgayDatHang) = @Nam;

    OPEN cur;
    FETCH NEXT FROM cur INTO @TongTien;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @TongTien = @TongTien + @TongTien;
        FETCH NEXT FROM cur INTO @TongTien;
    END;

    CLOSE cur;
    DEALLOCATE cur;

    SELECT @TongTien AS TongTienBanHang;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaDonHang]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_XoaDonHang]
    @DonHangID INT
AS
BEGIN
    -- Xóa chi tiết đơn hàng trước
    DELETE FROM ChiTietDonHang
    WHERE DonHangID = @DonHangID;

    -- Xóa đơn hàng
    DELETE FROM DonHang
    WHERE DonHangID = @DonHangID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaSanPham]    Script Date: 6/16/2024 11:40:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_XoaSanPham] @SanPhamID INT
AS
BEGIN
    DELETE FROM SanPham
    WHERE SanPhamID = @SanPhamID;
END;
GO
