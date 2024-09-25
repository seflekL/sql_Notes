USE sys;

/* ====================================== UPDATE =======================================

Tabloda varolan herhangi bir record'a ait verinin degistirilmesi 
icin kullanilir.

-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;

UPDATE islemlerinin yapilabilmesi icin 
SET SQL_SAFE_UPDATES = 1 kodu UPDATE isleminden once kullanilmali veya
bu komutun kalici hale gelmesi icin;
Ayarlar -> SQL Editor -> "Safe Updates" check box'indaki
tik isaretini kaldirip kaydetmemiz gerekiyor, 
sonrasinda MySQL'i kapatip tekrar acmaliyiz
========================================================================================*/

/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
id ve isim field'lari PRIMARY KEY olsun.
---------------------------------------------------------------------------------------*/

CREATE TABLE firmalar
(
id INT,
isim VARCHAR (20),
iletisim_isim VARCHAR (20),
CONSTRAINT firmalar_pk PRIMARY KEY(id, isim)
);

/*--------------------------------------------------------------------------------------
2) Firmalar tablosunun icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/

INSERT INTO firmalar VALUES 
(1, 'ACB', 'Ali Can'),
(2, 'RDB', 'Veli Gul'),
(3, 'KMN', 'Ayse Gulmez');

SELECT * FROM firmalar;

-- Id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz

UPDATE firmalar
SET isim = 'KRM'  -- Yeni data buraya yazilacak
WHERE id = 3;     -- Mevcut datanin hangisi degisecegini burada belirtecegiz.

-- Eger WHERE ile hangi datayi degsitirecegimizi belirtmez isek o sutundaki tum datalari degistirir.



















































































