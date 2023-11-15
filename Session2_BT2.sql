create database Session2_BT2_BanHang;
use Session2_BT2_BanHang;
create table Customer(
cID int primary key auto_increment,
cName varchar(20) not null,
cAge int check(cAge > 18)
);

create table Product(
pID int primary key auto_increment,
pName varchar(20) not null,
pPrice float check(pPrice > 0)
);

create table Orders(
oID int primary key auto_increment,
cID int,
foreign key(cID) references Customer(cID),
oDate date,
oTotalPrice float
);
create table Order_Detail(
oID int,
pID int,
odQty int check (odQty > 0),
foreign key(oID) references Orders(oID),
foreign key(pID) references Product(pID)
);