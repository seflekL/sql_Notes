USE sys;

/*===============================================
        TABLODAN SORGULAMA YAPMAK / SELECT
===============================================*/

/*
Tüm Sütunları Seçme: Eğer tablodaki tüm sütunlardaki verilere ihtiyacınız varsa, 
yıldız işareti (*) kullanarak tüm sütunları seçebilirsiniz. Bu, tablodaki her bir
 sütundan veri getirir.
*/

/*
*************** SYNTAX ***************
SELECT * FROM table_name;

*/

/*
Belirli Sütunları Seçme: Eğer sadece tablonun belirli sütunlarındaki
 verilere ihtiyacınız varsa, bu sütunların adlarını SELECT komutundan
 sonra, FROM komutu ile belirtilen tablo adından önce sıralayabilirsiniz
*/

/*
*************** SYNTAX ***************
SELECT sütun1, sütun2 FROM tablo_adı;
*/

CREATE TABLE kisiler (
    id INT ,
    isim VARCHAR(50) ,
    soyisim VARCHAR(50) ,
    yas INT,
    sehir VARCHAR(50)
);

INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (1,'Ahmet', 'Yılmaz', 30, 'Ankara');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (2,'Mehmet', 'Kara', 25, 'İstanbul');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (3,'Ayşe', 'Kaya', 22, 'İzmir');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (4,'Fatma', 'Güneş', 28, 'Bursa');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (5,'Ali', 'Çelik', 35, 'Antalya');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (6,'Elif', 'Demir', 29, 'Ankara');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (7,'Can', 'Özdemir', 33, 'İstanbul');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (8,'Deniz', 'Arslan', 24, 'İzmir');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (9,'Selin', 'Yıldız', 27, 'Bursa');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (10,'Emre', 'Koç', 31, 'Antalya');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (11,'Zeynep', 'Çınar', 26, 'Konya');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (12,'Oğuz', 'Kaplan', 40, 'Samsun');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (13,'Burcu', 'Ertuğrul', 22, 'Trabzon');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (14,'Kaya', 'Durmaz', 35, 'Diyarbakır');
INSERT INTO kisiler (id,isim, soyisim, yas, sehir) VALUES (15,'Seda', 'Aydın', 28, 'Eskişehir');

SELECT * FROM kisiler;


/*  ========================  SORU-1 ========================
 Kisiler tablosundan isim ve soy isim bilgilerini listeleyiniz.
    =========================================================
 */

SELECT isim,soyisim 
FROM kisiler;

/*  ========================  SORU-2 ========================
 Kisiler tablosundan isim, yas ve sehir bilgilerini listeleyiniz.
    =========================================================
 */ 

SELECT yas,sehir,isim  -- yas | sehir | isim
FROM kisiler;


SELECT isim, yas, sehir  -- isim| yas | sehir | 
FROM kisiler;


/*===============================================
           WHERE ile Filtreleme
===============================================*/

/*
 WHERE koşulu, SQL sorgularında belirli kriterlere göre verileri filtrelemek
 için kullanılır. WHERE ile birlikte karşılaştırma ve mantıksal operatörler,
 daha spesifik ve dinamik sorgular oluşturmak için kullanılabilir.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı 
WHERE sütun = “istenen değer”;
*/

/*  ========================  SORU-3 ========================
 Kisiler tablosundaki sehir= antalya olan kisileri listeleyiniz.
    =========================================================
 */
 
 SELECT * FROM kisiler
 WHERE sehir = 'Antalya';
 

SELECT yas FROM kisiler
WHERE sehir='Antalya';

/*  ========================  SORU-4 ========================
    Kisiler tablosundaki yasi 22 olan kisileri listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE yas= 22;


/*  ========================  SORU-5 ========================
    Kisiler tablosundaki sehri Ankara olanlarin yas, isim ve soyisim
    bilgilerini listeleyiniz.
    =========================================================
 */

SELECT yas, isim ,soyisim 
FROM kisiler
WHERE sehir ='Ankara';


/*===============================================
Karşılaştırma Operatörleri: Karşılaştırma operatörleri, 
sütun değerlerini belirli bir değer veya başka bir sütun 
değeriyle karşılaştırmak için kullanılır.
===============================================*/


-- > Eşittir (=): İki değerin eşit olup olmadığını kontrol eder.

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı 
WHERE sütun_adı = 1;
*/

/*  ========================  SORU-6 ========================
    Kisiler tablosundaki yasi 35 olan kisilerin isim ve 
    soyisimlerini listeleyiniz.
    =========================================================
 */

SELECT isim,soyisim
FROM kisiler
WHERE yas = 35;


-- > Büyüktür (>), Küçüktür (<): Sayısal değerlerin büyüklük/küçüklüğünü karşılaştırır.

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun_adı > 1;
SELECT * FROM tablo_adı WHERE sütun_adı < 1;
*/

/*  ========================  SORU-7 ========================
    Kisiler tablosundaki yasi 30 `dan buyuk olan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE yas > 30;


/*  ========================  SORU-8 ========================
    Kisiler tablosundaki ismi 'emre' den buyuk olan kisilerin
    isimlerini listeleyiniz.
    =========================================================
 */
 
 
/*===============================================
CHAR veya VARCHAR türündeki ifadeler için de büyüktür (>) ve küçüktür (<)
 operatörleri kullanılabilir. Bu operatörler, karakter dizileri (stringler)
 arasında alfabetik veya leksikografik karşılaştırma yapar. 
 Bu tür karşılaştırmalar, karakter dizilerinin alfabetik sırasına göre büyük
 veya küçük olup olmadıklarını belirlemek için kullanılır.
 (ASCII tablosundaki yerlerine gore karakterleri siralar)
===============================================*/


SELECT * FROM kisiler
WHERE isim > 'Emre';


/*  ========================  SORU-9 ========================
    Kisiler tablosundaki sehri 'D' den buyuk olan sehirlerde
    yasayan kisileri isim ve soyisim  bilgilerini listeleyiniz.
    =========================================================
 */

SELECT isim, soyisim FROM kisiler
WHERE sehir > 'D';


/*===============================================
Büyük eşittir (>=), > Küçük eşittir (<=): Sayısal değerlerin 
büyüklüğünü/küçüklüğünü eşitlikle birlikte karşılaştırır.
===============================================*/

/*===============================================
Büyüktür (>) ve küçüktür (<) operatörleri kullanıldığında, karşılaştırmada
 belirtilen değer genellikle dahil edilmez; yani sorgulanan değer "hariç" tutulur.
 Bu, sayısal değerler, tarihler ve karakter dizileri gibi farklı veri türleri için
 geçerlidir. Eğer belirtilen değeri de dahil etmek istiyorsanız, büyük eşittir (>=)
 veya küçük eşittir (<=) operatörlerini kullanmanız gerekir.
===============================================*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun_adı >= 1;
SELECT * FROM tablo_adı WHERE sütun_adı <= 1;
*/


/*  ========================  SORU-10 ========================
    Kisiler tablosundaki sehri 'Z' den kucuk veya esit olan sehirlerde
    yasayan kisileri isim ve soyisim  bilgilerini listeleyiniz.
    =========================================================
 */


SELECT isim, soyisim
FROm kisiler
WHERE sehir <= 'Z';


/*  ========================  SORU-11 ========================
    Kisiler tablosundaki ismi 'Fatma' dan kucuk veya esit olan kisilerin
    yas bilgilerini listeleyiniz.
    =========================================================
 */
 
 SELECT yas
 FROM kisiler
 WHERE isim <= 'Fatma';
 
 
/*  ========================  SORU-12 ========================
    Kisiler tablosundaki yasi 35 den kucuk veya esit olan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */

SELECT *
FROM kisiler
WHERE yas <=35;

/*===============================================
Değildir (<> veya !=): İki değerin birbirine eşit olmadığını kontrol eder.
===============================================*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun_adı <> 1;
SELECT * FROM tablo_adı WHERE sütun_adı != 1;
*/

/*  ========================  SORU-13 ========================
    Kisiler tablosundaki sehri Trabzon olmayan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE sehir <> 'Trabzon';

SELECT * FROM kisiler
WHERE sehir != 'Trabzon';

/*  ========================  SORU-14 ========================
    Kisiler tablosundaki soyismi Gunes olmayan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
 WHERE soyisim != 'Güneş';


/*  ========================  SORU-15 ========================
    Kisiler tablosundaki ismi  Kaya olmayan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */


SELECT * FROM kisiler
WHERE isim <> 'Kaya';



























