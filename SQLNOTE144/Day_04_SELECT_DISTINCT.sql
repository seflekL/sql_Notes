USE sys;


CREATE TABLE siparisler (
    id INT ,
    musteri_adi VARCHAR(50),
    urun_adi VARCHAR(50),
    siparis_tarihi DATE
);


INSERT INTO siparisler (musteri_adi, urun_adi, siparis_tarihi) 
VALUES  ('Ahmet Yılmaz', 'Laptop', '2023-01-10'),
		('Ayşe Kaya', 'Akıllı Telefon', '2023-01-12'),
		('Mehmet Öz', 'Laptop', '2023-02-05'),
		('Ahmet Yılmaz', 'Akıllı Telefon', '2023-02-10'),
		('Ayşe Kaya', 'Tablet', '2023-02-20'),
		('Ahmet Yılmaz', 'Laptop', '2023-02-25');


SELECT * FROM siparisler;


/* ===============================================
		       SELECT - DISTINCT
   ===============================================*/

/*
 DISTINCT anahtar kelimesi SQL'de, bir sorgu sonucu setinden
 yalnızca benzersiz (tekrar etmeyen) değerleri seçmek için 
 kullanılır. Tekrarlanan verilerin filtrelenmesi ve veri 
 setinden tekil kayıtların alınması gerektiğinde bu ifade 
 devreye girer.

DISTINCT genellikle SELECT ifadesiyle birlikte kullanılır 
ve SELECT sorgusunun hemen ardından gelir.
*/

/*
*************** SYNTAX ***************
SELECT DISTINCT sütun_adı
FROM tablo_adı;
*/

/*  =============================  SORU-1 =============================
    Siparisler tablosundaki müşteri adlarından benzersiz olanları listeleyin.
    ===================================================================
 */

SELECT DISTINCT musteri_adi
FROM siparisler;

/*  =============================  SORU-2 =============================
    Siparisler tablosuna gore hangi urunler siparis edilmis. 
    (Urunler UNIQUE (benzersiz) olmali)
    ===================================================================
*/

SELECT DISTINCT urun_adi
FROM siparisler;

/*  ============================= SORU-3 =============================
    Siparisler tablosundaki verilere gore subat ayi icerisinde satilan
    urunleri benzersiz olarak listeleyiniz
    ===================================================================
*/


-- Birinci Yol
SELECT DISTINCT urun_adi
FROM siparisler
WHERE siparis_tarihi BETWEEN '2023-02-01' AND '2023-02-28';

-- Ikinci Yol 
SELECT DISTINCT urun_adi
FROM siparisler
WHERE REGEXP_LIKE(siparis_tarihi, '.-02-.');

-- Ucuncu Yol
SELECT DISTINCT urun_adi
FROM siparisler
WHERE siparis_tarihi >= '2023-02-01'
AND siparis_tarihi <= '2023-02-28';

-- Dorduncu Yol
SELECT DISTINCT urun_adi
FROM siparisler
WHERE MONTH(siparis_tarihi)= 2
AND YEAR(siparis_tarihi)=2023; 





















































