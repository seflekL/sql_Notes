USE sys;

CREATE TABLE personel(
id CHAR(5),
isim VARCHAR(50),
maas INT
);

INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Fatma',4300);
INSERT INTO personel VALUES('10007','Beyza Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);

-- Insert Into komutunu yazarken tablo adindan sonra sutun adlarini yazmayip 
-- sadece VALUES degerleri yazarak tablo create edebiliriz.

SELECT * FROM personel;

/*===============================================
		LIKE OPERATORU 
===============================================*/
/*

/*
1- "LIKE" operatörü, belirli bir patern veya düzene uyan verileri bulmak için kullanılır.
2- Genellikle "%" (yüzde) ve "_" (alt çizgi) olmak üzere iki joker karakterle kullanılır.
3- "%" karakteri, sıfır veya daha fazla karakterin yerini tutar.
4- "_" karakteri ise tek bir karakterin yerini tutar.

Örneğin, "LIKE '%son'" ifadesi "son" ile biten tüm metin değerlerini bulur 
(örn. "Jason", "Wilson").
*/

/*
*************** SYNTAX ***************
SELECT sütun_adları
FROM tablo_adı
WHERE sütun_adı 
LIKE 'patern';
*/

/*  =============================  SORU-1 =============================
    Personel tablosundan ismi A ile baslayan personeli listeleyiniz.
    ===================================================================
 */
 
 
 SELECT * FROM personel
 WHERE isim
 LIKE 'a%';
 
 /*  =============================  SORU-2 =============================
    Personel tablosundan isminde 'Ayse' gecen personeli listeleyiniz.
    ===================================================================
 */
 
 SELECT * FROM personel
 WHERE isim
 LIKE '%Ayse%';
 
/*  =============================  SORU-3 =============================
    Personel tablosundan ismi 'a' ile biten personeli listeleyiniz.
    ===================================================================
 */



SELECT * FROM personel
WHERE isim
LIKE '%a';


/*  =============================  SORU-4 =============================
    Personel tablosundan isminin 2. harfi 'e' olan personeli listeleyiniz
    ===================================================================
 */

SELECT * FROM personel
WHERE isim
LIKE '_e%';


/*  =============================  SORU-5 =============================
    Personel tablosundan Isminin 2. harfi 'e' olup diger harflerinde 'y' 
    olan personeli listeleyiniz
    ===================================================================
 */
 
 SELECT * FROM personel
 WHERE isim
 LIKE '_e%'
 AND isim LIKE '%y%';
 
 
 /*  =============================  SORU-6 =============================
    Personel tablosundan maasi 5 haneli olan personel isimlerini listeleyiniz
    ===================================================================
 */ 

SELECT isim 
FROM personel
WHERE maas
LIKE '_____';

/*  =============================  SORU-7 =============================
    Personel tablosundan isminin 1. harfi 'a' ve 7. harfi 'a' olan 
    personeli listeleyiniz
    ===================================================================
 */

SELECT * FROM personel
WHERE isim
LIKE 'a_____a%';
























































