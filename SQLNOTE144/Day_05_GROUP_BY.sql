USE sys;

/* ===============================================
		           GROUP BY
   ===============================================*/

/*
 GROUP BY SQL ifadesi, veritabanı sorgularında belirli bir veya 
 birden fazla sütuna göre satırları gruplandırmak için kullanılır. 
 Genellikle aggregate (toplulaştırma) fonksiyonlar 
 (COUNT(), SUM(), AVG(), MIN(), MAX() vb.) ile birlikte kullanılır. 
 GROUP BY ifadesi, belirtilen sütunlardaki değerlere göre benzersiz 
 gruplar oluşturur ve her grup için aggregate fonksiyonların sonuçlarını
 döndürür. Bu, veriler üzerinde özetlemeler ve analizler yapmayı sağlar.
*/

/*
 Notlar
GROUP BY kullanılırken, SELECT ifadesinde belirtilen sütunların ya gruplandırma
ifadesinde (GROUP BY kısmında) belirtilmiş olması ya da bir agregate fonksiyonunun
parçası olması gerekir.
Birden fazla sütun üzerinde gruplandırma yapılabilir. Bu durumda, sütunlar virgül
ile ayrılarak GROUP BY ifadesine eklenir.
*/

/*
*************** SYNTAX ***************
SELECT sutun_adi, SUM(adet) AS toplam_adet
FROM tablo_adi
GROUP BY sutun_adi(gruplanacak verilerin oldugu);
*/

CREATE TABLE manav (
    id INT ,
    urun_adi VARCHAR(50),
    miktar_kg DECIMAL(5, 2),
    satis_fiyati DECIMAL(7, 2),
    satis_tarihi DATE,
    kategori VARCHAR(50)
);


INSERT INTO manav (id, urun_adi, miktar_kg, satis_fiyati, satis_tarihi, kategori) VALUES
(1, 'Elma', 10.5, 315.00, '2023-01-10', 'Meyve'),
(2, 'Muz', 20.0, 600.00, '2023-01-12', 'Meyve'),
(3, 'Portakal', 15.75, 472.50, '2023-01-14', 'Meyve'),
(4, 'Domates', 25.0, 250.00, '2023-01-16', 'Sebze'),
(5, 'Biber', 10.0, 300.00, '2023-01-18', 'Sebze'),
(6, 'Patlıcan', 13.5, 202.50, '2023-01-20', 'Sebze'),
(7, 'Salatalık', 17.0, 170.00, '2023-01-22', 'Sebze'),
(8, 'Üzüm', 22.0, 660.00, '2023-01-24', 'Meyve'),
(9, 'Kavun', 30.0, 450.00, '2023-01-26', 'Meyve'),
(10, 'Karpuz', 50.0, 500.00, '2023-01-28', 'Meyve'),
(11,'Elma', 2.5, 30.00, '2023-01-12', 'Meyve'),
(12,'Muz', 2.0, 30.00, '2023-01-12', 'Meyve'),
(13,'Portakal', 3.0, 20.00, '2023-01-12', 'Meyve'),
(14,'Domates', 4.0, 10.00, '2023-01-12', 'Sebze'),
(15,'Biber', 1.5, 15.00, '2023-01-12', 'Sebze'),
(16,'Patlıcan', 2.0, 12.00, '2023-01-12', 'Sebze'),
(17,'Salatalık', 3.0, 8.00, '2023-01-12', 'Sebze'),
(18,'Üzüm', 2.5, 25.00, '2023-01-12', 'Meyve'),
(19,'Kavun', 3.5, 18.00, '2023-01-12', 'Meyve'),
(20,'Karpuz', 5.0, 22.00, '2023-01-12', 'Meyve');

SELECT * FROM manav;

/*  =============================  SORU-1 =============================
    Manav tablosundaki her bir urun icin toplam satis miktari nedir?   
    ===================================================================
*/

SELECT urun_adi, SUM(miktar_kg) AS toplam_kg
FROM manav
GROUP BY urun_adi;


/*  =============================  SORU-2 =============================
    Manav tablosundaki her bir kategori icin toplam gelir nedir?   
    ===================================================================
*/

SELECT kategori, SUM(miktar_kg * satis_fiyati) AS toplam_gelir
FROM manav
GROUP BY kategori;



SELECT kategori, SUM(miktar_kg * satis_fiyati)toplam_gelir
FROM manav
GROUP BY kategori;

/*  =============================  SORU-3 =============================
    Manav tablosundaki en cok satilan urun nedir?   
    ===================================================================
*/

SELECT urun_adi, SUM(miktar_kg)toplam_kg
FROM manav
GROUP BY urun_adi
ORDER BY toplam_kg DESC  -- *****
LIMIT 1;


/*  =============================  SORU-4 =============================
    Manav tablosundaki her bir gun icin toplam satis miktari nedir?   
    ===================================================================
*/

SELECT satis_tarihi, SUM(miktar_kg)toplam_kg
FROM manav
GROUP BY satis_tarihi;


/*  =============================  SORU-5 =============================
    Manav tablosundaki her bir gun icin ortalama birim fiyati nedir?   
    ===================================================================
*/

SELECT satis_tarihi, AVG(satis_fiyati) ort_birim_fiyat
FROM manav
GROUP BY satis_tarihi;

/*  =============================  SORU-6 =============================
    Manav tablosundaki satilan en pahali urunun bilgileri nelerdir?   
    ===================================================================
*/
-- Birinci Yol
SELECT urun_adi, satis_fiyati, satis_tarihi
FROM manav
ORDER BY satis_fiyati DESC
LIMIT 1;

-- Ikinci Yol
SELECT urun_adi, MAX(satis_fiyati)satis_fiyati
FROM manav
GROUP BY urun_adi
ORDER BY satis_fiyati DESC
LIMIT 1;

-- Ucuncu Yol
SELECT * FROM manav
ORDER BY satis_fiyati DESC
LIMIT 1;


/*  =============================  SORU-7 =============================
    Manav tablosundaki "Meyve" kategorisindeki urunlerin 
    toplam satis miktari nedir?   
    ===================================================================
*/

SELECT SUM(miktar_kg)toplam_kg
FROM manav
WHERE kategori='Meyve';


/*  =============================  SORU-8 =============================
    Manav tablosundaki her urun icin ortalama satis fiyati nedir?   
    ===================================================================
*/

SELECT urun_adi, AVG(satis_fiyati)ort_urun_fyt
FROM manav
GROUP BY urun_adi;

/*  =============================  SORU-9 =============================
    Manav tablosundaki 2023-01-12 tarihinde satılan ürünler ve miktarları nelerdir?  
    ===================================================================
*/

SELECT urun_adi, miktar_kg
FROM manav
WHERE satis_tarihi= '2023-01-12'; 


/*  =============================  SORU-10 =============================
    Manav tablosundaki her bir kategorideki en yüksek birim fiyata sahip ürün nedir? 
    ===================================================================
*/


SELECT kategori, MAX(satis_fiyati)birim_fiyat
FROM manav
GROUP BY kategori;

/*  =============================  SORU-11 =============================
    Manav tablosundaki her bir kategori için farklı satış tarihlerinde elde
    edilen toplam gelir nedir? 
    ===================================================================
*/

SELECT kategori, satis_tarihi, SUM(miktar_kg * satis_fiyati) AS toplam_gelir
FROM manav
GROUP BY kategori, satis_tarihi;

/*  =============================  SORU-12 =============================
    Manav tablosundaki toplam miktarına göre en çok satılan ürünleri
    (En cok satilandan en az satilana dogru)siralayiniz? 
    ===================================================================
*/


SELECT urun_adi, SUM(miktar_kg) AS toplam_miktar
FROM manav
GROUP BY urun_adi
ORDER BY toplam_miktar DESC;


/*  =============================  SORU-13 =============================
    Manav tablosundaki her kategorideki en yüksek satış fiyatına sahip ürünleri bulup,
    bunları toplam satış fiyatına göre azalan sırayla sıralayip sadece 
    ilk 5 sonucu listeleyiniz? 
    ===================================================================
*/

SELECT urun_adi, MAX(satis_fiyati) AS toplam_satis
FROM manav
GROUP BY urun_adi
ORDER BY toplam_satis DESC
limit 5;


/*  =============================  SORU-14 =============================
    Manav tablosundaki her kategori için ortalama satış fiyatını hesaplayalım
    ve bu ortalama fiyatları azalan sırayla sıralayiniz? 
    ===================================================================
*/

SELECT kategori, AVG(Satis_fiyati) ort_satis_fiyati
FROM manav
GROUP BY kategori
ORDER BY ort_satis_fiyati DESC;



















