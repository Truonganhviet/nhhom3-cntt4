﻿/*BÀI 1:*/
DECLARE @THONGKE TABLE(MAPB INT, LUONGTB FLOAT)
INSERT INTO @THONGKE 
SELECT PHG, AVG(LUONG) FROM NHANVIEN GROUP BY PHG
SELECT * FROM @THONGKE
SELECT TENNV,PHG, LUONG, LUONGTB,
TINHTRANG = CASE 
WHEN LUONG > LUONGTB THEN 'KHONG TANG LUONG'
ELSE 'TANG LUONG'
END
FROM NHANVIEN A
INNER JOIN @THONGKE B
ON A.PHG = B.MAPB

DECLARE @THONGKE TABLE(MAPB INT, LUONGTB FLOAT)
INSERT INTO @THONGKE 
SELECT PHG, AVG(LUONG) FROM NHANVIEN GROUP BY PHG
SELECT * FROM @THONGKE
SELECT TENNV,PHG, LUONG, LUONGTB,
TINHTRANG = CASE 
WHEN LUONG > LUONGTB THEN 'TRUONG PHONG'
ELSE 'NHAN VIEN'
END
FROM NHANVIEN A
INNER JOIN @THONGKE B
ON A.PHG = B.MAPB

SELECT TENNV = CASE 
WHEN PHAI = 'Nam' THEN 'Mr. ' + TENNV
WHEN PHAI = N'Nữ' THEN 'Ms. ' + TENNV
ELSE 'KHONG XAC DINH' 
END
FROM NHANVIEN

SELECT TENNV, LUONG,
Thue = CASE
WHEN LUONG between 0 and 25000 THEN LUONG * 0.1
WHEN LUONG between 25000 and 30000 THEN LUONG * 0.12
WHEN LUONG between 30000 and 40000 THEN LUONG * 0.15
WHEN LUONG between 40000 and 50000 THEN LUONG * 0.2
ELSE LUONG * 0.25
END
FROM NHANVIEN

/*BÀI 2:*/

SELECT * FROM NHANVIEN
DECLARE @L INT = 2, @DEM INT;
SET @DEM = (SELECT COUNT(*) FROM NHANVIEN)
WHILE (@L < @DEM)
BEGIN
IF (@L = 4) 
BEGIN 
SET @L += 2;
CONTINUE;
END
SELECT MANV, HONV, TENLOT, TENNV FROM NHANVIEN 
WHERE CAST(MANV AS INT) = @L;
SET @L += 2;
END

/** cau 3**/

GO
BEGIN TRY
	INSERT PHONGBAN
	VALUES(799, 'ZXK - 799', '2008-07-01', '0179-05-22')
	PRINT 'SUCCESS: record was inserted.'
END TRY 
BEGIN CATCH 
PRINT 'FAILURE: record was not inserted.'
PRINT 'ERROR ' + CONVERT (VARCHAR , ERROR_NUMBER (), 1) + ': ' + ERROR_MESSAGE()
END CATCH
GO
DECLARE @CHIA FLOAT,@A CHAR
IF(@CHIA/0)>0
BEGIN
SET @A=N' KHONG HOP LE'
RAISERROR (@A,16,1)
END

DECLARE @i INT = 0, @tong INT = 0;
WHILE @i <= 10
	BEGIN 
		PRINT @i; 
			IF(@i%2 = 0)
				BEGIN
					SET @tong = @tong + @i;
				END;
		SET @i = @i + 1;
	END;
	PRINT 'tong la: ' + str(@tong);
GO

DECLARE @i INT = 0, @tong INT = 0;
WHILE @i <= 10
	BEGIN 
		PRINT @i; 
			IF(@i%2 = 0)
				BEGIN
				IF(@i != 4)
					BEGIN
						SET @tong = @tong + @i;
					END;
				END;
		SET @i = @i + 1;
	END;
	PRINT 'tong la: ' + str(@tong);
GO
