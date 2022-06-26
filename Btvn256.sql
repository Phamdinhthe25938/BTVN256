use btvn256;
create table KhachHang(
     MaKH INT primary key,
     HoTenKH VARCHAR(50),
     DiaChiKH VARCHAR(255),
     SoDT varchar(20),
     NgaySinhKH date,
     DoanhSoKH int ,
     NgayDk date
);
Create table NhanVien(
	 MaNv INT PRIMARY KEY,
     HoTenNV VARCHAR(50),
	 NgayVaoLam date,
     SoDTNV varchar(50)
);
create table SanPham(
    MaSP INT PRIMARY KEY,
    TenSP VARCHAR(30),
    DVT varchar(50),
    NguonGoc varchar(20),
    Gia double 
);
Create table HoaDon(
	SoHoaDon int primary key,
    TGHoaDon date,
    MaKH int,
    MaNv int,
    TotalMoney double ,
    foreign key(MaKH) references KhachHang(MaKH),
	foreign key(MaNv) references NhanVien(MaNv)
);
create table HDCT(
     SoHoaDon int,
     MaSP int,
     primary key(SoHoaDon,MaSP),
     SoLuong int,
	 foreign key(SoHoaDon) references HoaDon(SoHoaDon),
	 foreign key(MaSP) references SanPham(MaSP)
);

-- Thao tac  CSDL:
-- cau 1:
select TenSp,TGHoaDon,gia from SanPham  join HDCT join HoaDon  on SanPham.MaSP = HDCT.MaSP and
   HoaDon.SoHoaDon = HDCT.SoHoaDon where year(TGHoaDon)=2006 group by TenSP;
-- cau 2:
 select * from HoaDon where TotalMoney= (select max(TotalMoney) from hoadon);
  select * from HoaDon where TotalMoney= (select min(TotalMoney) from hoadon);
-- cau3:
select avg(TotalMoney) `Doanh thu trung binh nam 2006` from hoadon   where year(TGHoaDon)=2006;
-- cau4:
select sum(TotalMoney) `Doanh thu  nam 2006` from hoadon   where year(TGHoaDon)=2006;
-- cau5:
  select * from HoaDon where TotalMoney= (select max(TotalMoney) from hoadon) and year(TGHoaDon)=2006;
--  cau 6:
  select HoTenKH from HoaDon join KhachHang on   KhachHang.MaKH=HoaDon.MaKH   where  TotalMoney= (select max(TotalMoney) from hoadon) and year(TGHoaDon)=2006;

 -- cau7:
 select maKH, HoTenKH from KhachHang order by DoanhSoKH desc limit 3;