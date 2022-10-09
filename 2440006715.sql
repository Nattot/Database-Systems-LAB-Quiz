create database SooSooMoo

--1
begin tran
create table MsSupplier(
	SupplierID CHAR(5) primary key check (SupplierID like 'SU[0-9][0-9][0-9]'),
	SupplierName VARCHAR(255) not null check (SupplierName like '% Company'),
	SupplierPhone VARCHAR(20) not null
)
select * from MsSupplier
rollback

--2
begin tran
alter table MsStaff
add StaffAddress VARCHAR(255) check (LEN(StaffAddress) > 10)
select * from MsStaff 
rollback

--3
begin tran
insert into MsMilk values ('ML006', 'Yogurt', '30000', 'Fresh Yogurt, made from Fresh SooSooMoo Milk')
select * from MsMilk
rollback

--4
begin tran
alter table MsCustomer
reverse CustomerName, CustomerDOB, CustomerGender
where CustomerGender like 'Male'
select * from MsCustomer
rollback

-5
begin tran
delete MsMilk
where MsMilk.MilkID like 'SO006'
select * from MsMilk
rollback