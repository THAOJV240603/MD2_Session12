-- Tạo CSDL --
create database session12;

-- Xóa CSDL
-- drop database database_name;
DROP DATABASE session1;

-- Lựa chọn databse để thao tác
use session12;

-- Tạo bảng table
create table person(
	id int,
    firstName varchar(50),
    lastName varchar(50),
    address varchar(255)
);

-- Xóa bảng
drop table student;

-- Tạo bảng category
create table category(
	id int,
    name varchar(100),
    status tinyint(1)
);

-- Chỉnh sửa bảng
-- Thêm 1 cột
alter table category add column description_cate varchar(255);

-- Xóa bỏ 1 cột
alter table category drop column description_cate;

-- Thay đổi kiểu dữ liệu
alter table category modify column id bigint;

-- Thêm mới dữ liệu vào bảng
insert into category(id,name,status) value (1,"Áo",1);
insert into category(id,name,status) value (2,"Quần",0);

-- Thêm nhiều bảng ghi 
insert into category(id,name,status) values 
(3,"Mũ",1),
(4,"Dép",0);
-- Lấy tất cả trường và bảng ghi của 1 bảng
select * from category;

-- Ràng buộc khóa chính
drop table category;

create table category(
	id int primary key,
	name varchar(100),
	status tinyint(1)
);

-- ID khóa chính int thì hay cho tự động tăng auto_increment
create table category(
	id int primary key auto_increment,
	name varchar(100),
	status tinyint(1)
);
-- id tự động tăng rồi thì không cần thêm id nữa
insert into category(name,status) value ("Áo",1);
insert into category(name,status) value ("Quần",0);
insert into category(status) value (0);
select * from category;

-- Ràng buộc Not Null
drop table category;
create table category(
	id int primary key auto_increment,
	name varchar(100) NOT NULL,
	status tinyint(1)
);

-- Ràng buộc duy nhất Unique
create table category(
	id int primary key auto_increment,
	name varchar(100) NOT NULL Unique,
	status tinyint(1)
);

-- Ràng buộc Defaut dữ liệu mặc định
drop table category;
create table category(
	id int primary key auto_increment,
	name varchar(100) NOT NULL Unique,
	status tinyint(1) default 1
);
insert into category(name,status) value ("Áo",1);
insert into category(name,status) value ("Quần",0);
insert into category(name) value ("Quần Áo");
select * from category;

-- Ràng buộc khóa ngoại
create table product(
	id int primary key auto_increment,
    name varchar(100) not null unique,
    price float not null,
    category_id int not null,
    foreign key (category_id) references category(id) -- tạo khóa ngoại
);

insert into product(name,price,category_id) value("Áo xịn",100,1);
insert into product(name,price,category_id) value("Mũ",100,10); -- báo lỗi "ko tồn tài giá trị id trong bảng category"
select * from product;

insert into product(name,price,category_id) value("Áo Khoác",-100,1);

-- Không xóa được dữ liệu của bảng cha khi mà bảng con có dữ liệu (xóa bảng con trước r xóa bảng cha)
delete from category where id = 1;

-- Ràng buộc check 
drop table product;
create table product(
	id int primary key auto_increment,
    name varchar(100) not null unique,
    price float not null,
    check (price>0), -- ràng buộc check
    category_id int not null,
    foreign key (category_id) references category(id) -- tạo khóa ngoại
);

insert into product(name,price,category_id) value("Áo xịn",100,1);
insert into product(name,price,category_id) value("Mũ",100,2);
insert into product(name,price,category_id) value("Áo Khoác",-100,1); -- báo lỗi
select * from product;
 
 -- BÀI TẬP --
 
drop database session12;
create database session12;
use session12;

create table Category(
	id int primary key auto_increment,
    name varchar(100),
    status tinyint(1) default(1)
);

create table Product(
	id int primary key auto_increment,
    name varchar(100) not null unique,
    price float not null,
    check (price>0), -- ràng buộc check
    sale_price float not null,
    check (sale_price<price),
    image varchar(255),
    category_id int not null,
    foreign key (category_id) references Category (id) -- khóa ngoại đến Category
);

create table Account(
	id int primary key auto_increment,
    email varchar(100) not null unique,
    password varchar(100) not null,
    fullName varchar(100)
);

select * from Category;
select * from Product;
select * from Account;

---------------------------

Insert into Category(name,status) value ("Áo",1);
Insert into Category(name,status) value ("Áo",2);
Insert into Product(name,price,sale_price,category_id) value ("Áo khoác",100,70,1);
Insert into Product(name,price,sale_price,category_id) value ("Áo 2",115,70,2);
-- Nhóm lệnh DML
-- INSERT
-- UPDATE
-- Cập nhật tên của bảng ghi có id = 1 thành "Áo xịn"
update Product set name ="Áo xịn" where id=1;

update Product set price = 100 where price < 200;
update Product set price = 180 where id = 2;

-- Cập nhật giá tiền của sản phẩm có giá nhỏ hơn 200 về 10% so với giá hiện tại
update Product set price = price - (price*0.1) where price<200;

drop table Product;

-- Cập nhật tên của sp thành khoác và giá thành 210 với sp có id=2
update Product set name = "Khoác", price = 210 where id=2;

select * from Product;

-- DELETE
delete from Product where id=2;
-- không có từ khóa where thì bảng sẽ bị xóa toàn bộ dữ liệu

-- Xóa tất cả sp có danh mục = 2
delete from Product where Category_id = 2;

-- SELECT
-- Lấy tất cả bảng ghi theo tất cả trường của bảng
select * from Product;

-- Lấy tất cả bảng ghi theo trường lựa chọn
select name,price from Product;