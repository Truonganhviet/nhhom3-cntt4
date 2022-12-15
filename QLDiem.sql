---câu 1---
CREATE TABLE MONHOC (
	MAMON CHAR(4) PRIMARY KEY,
	TENMON NVARCHAR(20),
	SOTC INT
)
GO

CREATE TABLE DIEM (
	MASV VARCHAR(10),
	MAMON CHAR(10),
	DIEMTHI INT
	CONSTRAINT pk_hx PRIMARY KEY(MASV, MAMON)
)
GO

CREATE TABLE SINHVIEN(
	MASV VARCHAR(10) PRIMARY KEY,
	HOTEN CHAR(40),
	NGAYSINH SMALLDATETIME
)
GO

INSERT MONHOC values('AV01','Anh Van','3'),('T02','Toan','6'),('V03','Van','3')
INSERT DIEM values('SV01','T02','1'),('SV02','V03','2'),('SV03','AV01','6'),('SV04','T02','1'),('SV05','V03','5')
INSERT SINHVIEN VALUES('SV01','VO NGUYEN DUC TOAN','12/6/2002'),('SV02','TRAN DINH KIET','1/11/2002'),('SV03','NGUYEN THIEN NHAN','7/4/2002')


SELECT *  
FROM DIEM;

SELECT   MASV, MAMON, DIEMTHI 
FROM     DIEM
ORDER BY DIEMTHI DESC ;

SELECT MASV, MAMON, DIEMTHI
FROM   DIEM
WHERE  DIEMTHI BETWEEN 1 AND 2 ;

---câu 2---
go
create function tkSV (@tmh nvarchar(20))
returns int
as
begin
 declare @demthi int
 set @demthi = (select count(*)
 from DIEM
where @demthi<5)
 return @demthi
end
go
select dbo.tkSV ('LSDCSVN')
---câu 3---
CREATE PROCEDURE nhapdiem (@masv CHAR(10), @mamon CHAR(10), @diemthi FLOAT)
AS
BEGIN
	INSERT INTO DIEM (MASV, MAMON, DIEMTHI)
	VALUES (@masv, @mamon, @diemthi)
END