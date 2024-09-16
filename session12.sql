-- Tạo CSDL --
create database session12;

-- Xóa CSDL
-- drop database database_name;
DROP DATABASE session1;

--  Lựa chọn databse để thao tác
use session12;

-- Tạo bảng table
create table person(
	id int,
    firstName varchar(50),
    lastName varchar(50),
    address varchar(255)
)