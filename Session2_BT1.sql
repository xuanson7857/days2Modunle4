create database Session2_BT1_QuanLyVatTu;
use Session2_BT1_QuanLyVatTu;
create table PhieuXuat(
SoPX int primary key auto_increment,
NgayXuat date
);

create table Vattu(
MaVT int primary key auto_increment,
TenVT varchar(20) not null
);

create table PhieuNhap(
SoPN int primary key auto_increment,
NgayNhap date
);

create table DonDatHang(
SoDH int primary key auto_increment,
NgayDH date
);

create table NhaCC(
MaNCC int primary key auto_increment,
TenNCC varchar(20) not null,
Diachi varchar(50) not null,
DienThoai varchar(10) not null
);

create table ChiTietPhieuXuat(
id int not null,
foreign key (id) references PhieuXuat(SoPX),
MaVT int ,
foreign key (MaVT) references Vattu(MaVT),
DGXuat float not null check(DGXuat > 0),
SLXuat int not null check(SLXuat > 0)
);

create table ChiTietPhieuNhap(
id int not null,
foreign key(id) references PhieuNhap(SoPN),
idVT int not null,
foreign key(idVT) references Vattu(MaVT),
SLNhap int not null check(SLNhap > 0),
DGNhap float not null check(DGNhap > 0)
);

create table ChiTietDonHang(
MaVT int,
foreign key (MAVT) references Vattu(MaVT),
DonDH int,
foreign key (DonDH) references DonDatHang(SoDH)
);

create table ChitietNhaCungCap(
DonDH int,
foreign key (DonDH) references DonDatHang(SoDH),
idNCC int,
foreign key(idNCC) references NhaCC(MaNCC)
);