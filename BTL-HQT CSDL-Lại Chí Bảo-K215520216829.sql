USE [Cua_hang_do_go_NT]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_TongSoLuongSanPhamTrongDonHang]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_TongSoLuongSanPhamTrongDonHang]
(
    @MaDonHang INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TongSoLuong INT;

    SELECT @TongSoLuong = SUM(SoLuong)
    FROM ChiTietDonHang
    WHERE MaDonHang = @MaDonHang;

    RETURN ISNULL(@TongSoLuong, 0);
END;
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaChiTietDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaDonHang] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatHang] [date] NOT NULL,
	[MaKhachHang] [int] NULL,
	[TongGiaTri] [decimal](10, 2) NULL,
	[TinhTrangDonHang] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaCungCap] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[LoaiSanPham] [nvarchar](50) NULL,
	[GiaBan] [decimal](10, 2) NULL,
	[SoLuongTon] [int] NULL,
	[KichThuoc] [nvarchar](50) NULL,
	[ChatLieu] [nvarchar](50) NULL,
	[MauSac] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (1, 1, 1, 1, CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (2, 2, 2, 2, CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (3, 3, 3, 1, CAST(5000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (4, 4, 4, 1, CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (5, 5, 5, 1, CAST(2000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSanPham], [SoLuong], [GiaBan]) VALUES (6, 1, 4, 3, CAST(100.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [MaKhachHang], [TongGiaTri], [TinhTrangDonHang]) VALUES (1, CAST(N'2024-06-01' AS Date), 1, CAST(7500000.00 AS Decimal(10, 2)), N'Ðã giao hàng')
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [MaKhachHang], [TongGiaTri], [TinhTrangDonHang]) VALUES (2, CAST(N'2024-06-02' AS Date), 2, CAST(3000000.00 AS Decimal(10, 2)), N'Ch? x? lý')
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [MaKhachHang], [TongGiaTri], [TinhTrangDonHang]) VALUES (3, CAST(N'2024-06-03' AS Date), 3, CAST(5000000.00 AS Decimal(10, 2)), N'Ðang giao hàng')
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [MaKhachHang], [TongGiaTri], [TinhTrangDonHang]) VALUES (4, CAST(N'2024-06-18' AS Date), 2, CAST(800.50 AS Decimal(10, 2)), N'Đã giao hàng')
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [MaKhachHang], [TongGiaTri], [TinhTrangDonHang]) VALUES (5, CAST(N'2024-06-05' AS Date), 5, CAST(2000000.00 AS Decimal(10, 2)), N'Ðã h?y')
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [MaKhachHang], [TongGiaTri], [TinhTrangDonHang]) VALUES (7, CAST(N'2024-06-18' AS Date), 1, CAST(500.25 AS Decimal(10, 2)), N'Đang xử lý')
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (1, N'Nguy?n Van A', N'123 Ðu?ng ABC, Thành ph? Tuyên Quang, T?nh Tuyên Quang', N'0912345678', N'nguyenvana@example.com')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (2, N'Tr?n Th? B', N'456 Ðu?ng DEF, Huy?n Y, T?nh Tuyên Quang', N'0987654321', N'tranthib@example.com')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (3, N'Lê Van C', N'789 Ðu?ng GHI, Th? xã Z, T?nh Tuyên Quang', N'0923456789', N'levanc@example.com')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (4, N'Ph?m Th? D', N'101 Ðu?ng JKL, Huy?n M, T?nh Tuyên Quang', N'0934567890', N'phamthid@example.com')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (5, N'Hoàng Van E', N'202 Ðu?ng MNO, Thành ph? Tuyên Quang, T?nh Tuyên Quang', N'0945678901', N'hoangvane@example.com')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai]) VALUES (1, N'Công ty g? ABC', N'456 Ðu?ng F, Qu?n 6, TP.HCM', N'0956789012')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai]) VALUES (2, N'Công ty g? DEF', N'789 Ðu?ng G, Qu?n 7, TP.HCM', N'0967890123')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai]) VALUES (3, N'Công ty g? GHI', N'101 Ðu?ng H, Qu?n 8, TP.HCM', N'0978901234')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai]) VALUES (4, N'Công ty g? JKL', N'102 Ðu?ng I, Qu?n 9, TP.HCM', N'0989012345')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [SoDienThoai]) VALUES (5, N'Công ty g? MNO', N'103 Ðu?ng J, Qu?n 10, TP.HCM', N'0990123456')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (1, N'Bộ bàn ghế lim', N'ghế ngồi', CAST(150.75 AS Decimal(10, 2)), 75, N'1.8x2', N'Lim', N'Nâu trầm')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (2, N'Gh? g? thông', N'Gh?', CAST(1500000.00 AS Decimal(10, 2)), 20, N'45x45x90', N'G? thông', N'Vàng')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (3, N'T? qu?n áo', N'T?', CAST(5000000.00 AS Decimal(10, 2)), 5, N'200x60x220', N'G? cam xe', N'Tr?ng')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (4, N'K? sách', N'K?', CAST(2000000.00 AS Decimal(10, 2)), 15, N'100x30x180', N'G? huong', N'Ðen')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (5, N'Giu?ng g? lim', N'Giu?ng', CAST(8000000.00 AS Decimal(10, 2)), 8, N'180x200x50', N'G? lim', N'Nâu d?')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (6, N'Bàn g? s?i', N'Bàn', CAST(2500000.00 AS Decimal(10, 2)), 10, N'120x60x75', N'G? s?i', N'Nâu')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (7, N'Gh? g? thông', N'Gh?', CAST(1500000.00 AS Decimal(10, 2)), 20, N'45x45x90', N'G? thông', N'Vàng')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (8, N'T? qu?n áo', N'T?', CAST(5000000.00 AS Decimal(10, 2)), 5, N'200x60x220', N'G? cam xe', N'Tr?ng')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (9, N'K? sách', N'K?', CAST(2000000.00 AS Decimal(10, 2)), 15, N'100x30x180', N'G? huong', N'Ðen')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (10, N'Giu?ng g? lim', N'Giu?ng', CAST(8000000.00 AS Decimal(10, 2)), 8, N'180x200x50', N'G? lim', N'Nâu d?')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [LoaiSanPham], [GiaBan], [SoLuongTon], [KichThuoc], [ChatLieu], [MauSac]) VALUES (11, N'Giuong Hop', N'Giuong ngu', CAST(100.50 AS Decimal(10, 2)), 10, N'1.8 x 2', N'Soi', N'Trang')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
/****** Object:  StoredProcedure [dbo].[BaoCaoHangBanNhieuTrongThang]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BaoCaoHangBanNhieuTrongThang]
    @Thang INT,
    @Nam INT
AS
BEGIN
    SELECT SP.TenSanPham, SUM(CTDH.SoLuong) AS SoLuongBan
    FROM ChiTietDonHang CTDH
    INNER JOIN DonHang DH ON CTDH.MaDonHang = DH.MaDonHang
    INNER JOIN SanPham SP ON CTDH.MaSanPham = SP.MaSanPham
    WHERE MONTH(DH.NgayDatHang) = @Thang AND YEAR(DH.NgayDatHang) = @Nam
    GROUP BY SP.TenSanPham
    ORDER BY SoLuongBan DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[BaoCaoHangBanTrongThang]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BaoCaoHangBanTrongThang]
    @Thang INT,
    @Nam INT
AS
BEGIN
    DECLARE @TenSanPham NVARCHAR(100), @SoLuongBan INT;
    DECLARE HangBanCursor CURSOR FOR
    SELECT SP.TenSanPham, SUM(CTDH.SoLuong) AS SoLuongBan
    FROM ChiTietDonHang CTDH
    INNER JOIN DonHang DH ON CTDH.MaDonHang = DH.MaDonHang
    INNER JOIN SanPham SP ON CTDH.MaSanPham = SP.MaSanPham
    WHERE MONTH(DH.NgayDatHang) = @Thang AND YEAR(DH.NgayDatHang) = @Nam
    GROUP BY SP.TenSanPham;

    OPEN HangBanCursor;
    FETCH NEXT FROM HangBanCursor INTO @TenSanPham, @SoLuongBan;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Sản phẩm: ' + @TenSanPham + ' - Số lượng bán: ' + CAST(@SoLuongBan AS NVARCHAR);
        FETCH NEXT FROM HangBanCursor INTO @TenSanPham, @SoLuongBan;
    END;

    CLOSE HangBanCursor;
    DEALLOCATE HangBanCursor;
END;
GO
/****** Object:  StoredProcedure [dbo].[BaoCaoHangTon]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BaoCaoHangTon]
AS
BEGIN
    SELECT TenSanPham, SoLuongTon
    FROM SanPham
    WHERE SoLuongTon > 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[BaoCaoMatHangBanChayTrongThang]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BaoCaoMatHangBanChayTrongThang]
    @Thang INT,
    @Nam INT
AS
BEGIN
    SELECT TOP 1 SP.TenSanPham, SUM(CTDH.SoLuong) AS SoLuongBan
    FROM ChiTietDonHang CTDH
    INNER JOIN DonHang DH ON CTDH.MaDonHang = DH.MaDonHang
    INNER JOIN SanPham SP ON CTDH.MaSanPham = SP.MaSanPham
    WHERE MONTH(DH.NgayDatHang) = @Thang AND YEAR(DH.NgayDatHang) = @Nam
    GROUP BY SP.TenSanPham
    ORDER BY SoLuongBan DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[CapNhatSoLuongChiTietHoaDon]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatSoLuongChiTietHoaDon]
    @MaChiTietDonHang INT,
    @SoLuong INT
AS
BEGIN
    UPDATE ChiTietDonHang
    SET SoLuong = @SoLuong
    WHERE MaChiTietDonHang = @MaChiTietDonHang;
END;
GO
/****** Object:  StoredProcedure [dbo].[LietKeHangHoa]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LietKeHangHoa]
AS
BEGIN
    SELECT * FROM SanPham;
END;
GO
/****** Object:  StoredProcedure [dbo].[SuaHoaDon]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SuaHoaDon]
    @MaDonHang INT,
    @NgayDatHang DATE,
    @MaKhachHang INT,
    @TongGiaTri DECIMAL(10, 2),
    @TinhTrangDonHang NVARCHAR(20)
AS
BEGIN
    UPDATE DonHang
    SET NgayDatHang = @NgayDatHang,
        MaKhachHang = @MaKhachHang,
        TongGiaTri = @TongGiaTri,
        TinhTrangDonHang = @TinhTrangDonHang
    WHERE MaDonHang = @MaDonHang;
END;
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinHangHoa]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SuaThongTinHangHoa]
    @MaSanPham INT,
    @TenSanPham NVARCHAR(100),
    @LoaiSanPham NVARCHAR(50),
    @GiaBan DECIMAL(10, 2),
    @SoLuongTon INT,
    @KichThuoc NVARCHAR(50),
    @ChatLieu NVARCHAR(50),
    @MauSac NVARCHAR(30)
AS
BEGIN
    UPDATE SanPham
    SET TenSanPham = @TenSanPham,
        LoaiSanPham = @LoaiSanPham,
        GiaBan = @GiaBan,
        SoLuongTon = @SoLuongTon,
        KichThuoc = @KichThuoc,
        ChatLieu = @ChatLieu,
        MauSac = @MauSac
    WHERE MaSanPham = @MaSanPham;
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemChiTietHoaDon]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemChiTietHoaDon]
    @MaDonHang INT,
    @MaSanPham INT,
    @SoLuong INT,
    @GiaBan DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO ChiTietDonHang (MaDonHang, MaSanPham, SoLuong, GiaBan)
    VALUES (@MaDonHang, @MaSanPham, @SoLuong, @GiaBan);
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemHangHoa]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemHangHoa]
    @TenSanPham NVARCHAR(100),
    @LoaiSanPham NVARCHAR(50),
    @GiaBan DECIMAL(10, 2),
    @SoLuongTon INT,
    @KichThuoc NVARCHAR(50),
    @ChatLieu NVARCHAR(50),
    @MauSac NVARCHAR(30)
AS
BEGIN
    INSERT INTO SanPham (TenSanPham, LoaiSanPham, GiaBan, SoLuongTon, KichThuoc, ChatLieu, MauSac)
    VALUES (@TenSanPham, @LoaiSanPham, @GiaBan, @SoLuongTon, @KichThuoc, @ChatLieu, @MauSac);
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemHoaDon]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[ThemHoaDon]
    @NgayDatHang DATE,
    @MaKhachHang INT,
    @TongGiaTri DECIMAL(10, 2),
    @TinhTrangDonHang NVARCHAR(20)
AS
BEGIN
    INSERT INTO DonHang (NgayDatHang, MaKhachHang, TongGiaTri, TinhTrangDonHang)
    VALUES (@NgayDatHang, @MaKhachHang, @TongGiaTri, @TinhTrangDonHang);
END;
GO
/****** Object:  StoredProcedure [dbo].[XoaChiTietHoaDon]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaChiTietHoaDon]
    @MaChiTietDonHang INT
AS
BEGIN
    DELETE FROM ChiTietDonHang WHERE MaChiTietDonHang = @MaChiTietDonHang;
END;
GO
/****** Object:  StoredProcedure [dbo].[XoaHangHoa]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaHangHoa]
    @MaSanPham INT
AS
BEGIN
    DELETE FROM SanPham WHERE MaSanPham = @MaSanPham;
END;
GO
/****** Object:  StoredProcedure [dbo].[XoaHoaDon]    Script Date: 6/18/2024 10:50:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaHoaDon]
    @MaDonHang INT
AS
BEGIN
    DELETE FROM ChiTietDonHang WHERE MaDonHang = @MaDonHang;
    DELETE FROM DonHang WHERE MaDonHang = @MaDonHang;
END;
GO
