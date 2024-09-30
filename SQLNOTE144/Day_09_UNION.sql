USE sys;

-- ====================== UNION ======================

/*  
   1-Iki farkli sorgulamanin sonucunu birlestiren islemdir.
    Iki veya daha fazla Sorgu ifadesinin sonuc kumelerini 
    birlestirerek tek bir sonuc kumesi olusturur.
    
   2.sorgunun sonuna ORDER BY komutunu kullanirsaniz 
    tum tabloyu istediginiz siralamaya gore siralar. 
    
    NOT: Secilen Field SAYISI'nin ayni olmasi zorunludur.
    ve DATA TYPE'i ayni olmasi sonucun anlamli olmasi icin onemlidir.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersiz degerleri alir. 
    Benzer verileri almak icin UNION ALL kullanilir.
    
 */
 
CREATE TABLE kadro(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO kadro VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO kadro VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO kadro VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO kadro VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO kadro VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO kadro VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO kadro VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO kadro VALUES(345678902, 'Mehmet Ozturk', 'Izmir', 3500,'Honda');   

SELECT * FROM kadro;

 -- 1) Honda ve Tofas'ta calisan benzersiz isimdeki personelleri listeleyin


SELECT isim
FROM kadro
WHERE sirket IN('Honda', 'Tofas');



-- DISTINCT
SELECT DISTINCT isim
FROM kadro
WHERE sirket IN('Honda', 'Tofas');


-- UNION

SELECT isim 
FROM kadro
WHERE sirket = 'Honda'
UNION
SELECT isim
FROM kadro
WHERE sirket = 'Tofas';

-- Honda, Ford ve Tofas'ta calisan benzersiz isimdeki 
 -- personelleri listeleyin

SELECT isim 
FROM kadro
WHERE sirket = 'Honda'
UNION
SELECT isim
FROM kadro
WHERE sirket = 'Tofas'
UNION
SELECT isim
FROM kadro
WHERE sirket = 'Ford';

-- Honda, Ford ve Tofas'ta calisan butun personellerin
-- isim maas ve sehir bilgilerini listeleyiniz 

SELECT isim, maas, sehir
FROM kadro
WHERE sirket = 'Honda'
UNION ALL
SELECT isim, maas, sehir
FROM kadro
WHERE sirket = 'Tofas'
UNION ALL
SELECT isim, maas, sehir
FROM kadro
WHERE sirket = 'Ford';

-- Maasi 4000'den fazla olan isci isimlerini ve 5000'den fazla
-- maas alinan sehirleri gosteren sorguyu yaziniz

SELECT isim AS isim_sehir
FROM kadro
WHERE maas > 4000
UNION ALL
SELECT sehir
FROM kadro
WHERE maas > 5000;

-- NOT! UNION sorgusu sonucu olusan sonuc kumesindeki column'da sadece 
-- sorgunun ilk kisminda kullanilan filed'lar yer alir. 
-- Ikinci kisminda kullanilan filed'larin bir onemi yoktur.

-- Mehmet Ozturk ismindeki personellerin aldigi maaslari ve 
-- Istanbul'daki personellerin maaslarini en yuksekten dusuge gore
-- siralayarak bir tabloda gosteriniz.


SELECT maas
FROM kadro
WHERE isim = 'Mehmet Ozturk'
UNION 
SELECT maas
FROM kadro
WHERE sehir = 'Istanbul'
ORDER BY maas DESC;


/*
SELECT (AGGREATE FUNCTION, DISTINCT) AS name
FROM table_name
WHERE CONDITION(LIKE, IN, REGEXP_LIKE,IS NULL, EXISTS, BETWEEN, AND,OR)
GROUP BY
HAVING
ORDER BY (ASC/DESC)
LIMIT OFFSET
*/





































































