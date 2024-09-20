USE sys;

/*===============================================
        WHERE / Mantiksal Operatorler
===============================================*/

/*
"AND", "OR" ve "NOT", SQL sorgu dili içinde kullanılan mantıksal operatörlerdir.
 Bu operatörler, sorgularda belirli koşulların nasıl birleştirileceğini ve 
 değerlendirileceğini kontrol eder. Bu operatörlerin kullanımı, veritabanı 
 sorgularınızın esnekliğini ve gücünü arttirir.
*/

/*===============================================
        Mantiksal Operatorler / AND
===============================================*/
/*

/*
1- "AND" operatörü, birden fazla koşulun aynı anda karşılanması gerektiğinde kullanılır.
2- Tüm "AND" operatörüyle bağlanmış koşulların TRUE olması durumunda sonuç TRUE döner.
3- Eğer koşullardan herhangi biri FALSE ise, sonuç da FALSE olur.
Örnek: SELECT * FROM tablo_adi WHERE sütun1 = 'değer1' AND sütun2 = 'değer2' sorgusu,
hem sütun1'in 'değer1' değerine eşit olduğu hem de sütun2'nin 'değer2' değerine eşit olduğu kayıtları
secer.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı 
WHERE 1sütun_adı = 1 
AND 2sütun_adı = 2 ;
*/

/*  ========================  SORU-1 ========================
 Kisiler tablosundan 29 yaşından büyük olan ve Ankara'da yaşayan kişileri listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE yas > 29
AND sehir = 'Ankara';


/*  ========================  SORU-2 ========================
 Kisiler tablosundan Adı 'Fatma' olan ve Bursa'da yaşayan kişileri listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE isim= 'Fatma'
AND sehir = 'Bursa';


/*  ========================  SORU-3 ========================
 Kisiler tablosundan ismi 'Ayse' ve soyismi 'Kaya' olan kişileri listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE isim = 'Ayse'
AND soyisim = 'Kaya';


-- Tabloda AND ile berlitilen iki kosulu da karsilayacak bir data yok ise sonuc kumesi BOS doner.
SELECT * FROM kisiler
WHERE isim = 'Zeynep'
AND soyisim = 'Kaya';


/* ===============================================
                   BETWEEN
===============================================*/
/*

/*
BETWEEN anahtar kelimesi, SQL'de bir aralıktaki değerleri seçmek için kullanılır.
 Bu anahtar kelime genellikle sayısal değerler, tarihler ve metinlerle kullanılır
 ve belirtilen iki değer arasındaki tüm değerleri kapsar. 
 BETWEEN ile belirlenen aralık her iki uç değeri de içerir, yani "başlangıç" ve "bitiş"
 değerleri sorgu sonuçlarına dahildir.
*/

/*
*************** SYNTAX ***************
SELECT sütun_adı
FROM tablo_adı
WHERE sütun_adı BETWEEN değer1 AND değer2;
*/


/*  ========================  SORU-4 ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan kişileri listeleyiniz.
    =========================================================
 */

SELECT isim, soyisim
FROM kisiler
WHERE yas BETWEEN 25 AND 35;


/*  ========================  SORU-5 ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan ve Ankara'da yaşayan kişileri listeleyiniz.
    =========================================================
 */


SELECT isim, soyisim
FROM kisiler
WHERE yas BETWEEN 25 AND 35
AND sehir = 'Ankara';

/*  ======================== Extra ========================
   Kisiler tablosundan ismi Adem ile Aylin arasında olan ve 
   Ankara'da yaşayan kişileri listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE isim BETWEEN 'Adem' AND 'Aylin'
AND sehir = 'Ankara';


/*===============================================
        Mantiksal Operatorler / OR
===============================================*/

/*
1- "OR" operatörü, birden fazla koşuldan en az birinin karşılanması 
gerektiğinde kullanılır.
2- Koşullardan herhangi biri TRUE ise, sonuç TRUE döner.
3- Tüm koşullar FALSE ise, sonuç FALSE olur.

Örnek: SELECT * FROM tablo_adi WHERE sütun1 = 'değer1' OR 
sütun2 = 'değer2' sorgusu, sütun1'in
'değer1' değerine eşit olduğu veya sütun2'nin 'değer2' 
değerine eşit olduğu kayıtları seçer.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı 
WHERE 1sütun_adı = 1 
OR 2sütun_adı = 2 ;
*/

/*  ========================  SORU-6 ========================
 Kisiler tablosundan yaşı 22 veya 35 olan kişileri listeleyiniz.
    =========================================================
 */
 
 SELECT * FROM kisiler
 WHERE yas = 22 
 OR yas = 35;
 
/*  ========================  SORU-7 ========================
 Kisiler tablosundan İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE sehir = 'Istanbul'
OR sehir = 'Ankara'
OR sehir = 'Izmir';

/*===============================================
                  IN OPERATORU
===============================================*/

/*
SQL'de IN operatörü, belirli bir sütunun değerlerini belirtilen bir değerler
 listesiyle karşılaştırmak için kullanılır. Bu operatör, sorgulanacak değerlerin
 bir listesini parantez içinde alır ve belirtilen sütunun değeri bu listedeki 
 herhangi bir değerle eşleşirse, o satırı sonuç kümesine dahil eder. IN operatörü,
 birden çok OR koşulunu daha okunaklı ve kısa bir şekilde yazmanın bir yoludur.
*/

/*
*************** SYNTAX ***************
SELECT sütun_adları
FROM tablo_adi
WHERE sütun_adi IN (değer1, değer2, ..., değerN);
*/

/*  ========================  SORU-8 ========================
 Kisiler tablosundan İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyiniz.
    =========================================================
 */
 
 
 -- OR COZUMU 
SELECT * FROM kisiler
WHERE sehir = 'Istanbul'
OR sehir = 'Ankara'
OR sehir = 'Izmir';

-- IN COZUMU
SELECT * FROM kisiler
WHERE sehir IN('Ankara', 'Istanbul', 'Izmir');

/*  ========================  SORU-9 ========================
 Kisiler tablosundan adı 'Ahmet', 'Mehmet' veya 'Ayşe' olan kişileri listeleyiniz.
    =========================================================
 */


SELECT * FROM kisiler
WHERE isim IN('Ahmet', 'Mehmet', 'Ayşe');


/*  ========================  SORU-10 ========================
 Kisiler tablosundan Soyadı 'Demir', 'Çelik' veya 'Kaya' olan kişileri listeleyiniz.
    =========================================================
 */
 
 
 SELECT * FROM kisiler
 WHERE soyisim IN('Demir', 'Çelik', 'Kaya');


/*===============================================
        Mantiksal Operatorler / NOT
===============================================*/

/*
1- "NOT" operatörü, bir koşulun sonucunu tersine çevirmek için kullanılır.
2- Eğer koşul TRUE ise, "NOT" operatörü sonucu FALSE yapar; koşul FALSE ise, sonucu TRUE yapar.
3- Genellikle "NOT IN", "NOT EXISTS", "NOT LIKE" gibi ifadelerde kullanılır.

Örnek: SELECT * FROM tablo_adi WHERE NOT sütun1 = 'değer1' sorgusu, sütun1'in 
'değer1' değerine eşit olmayan tüm kayıtları seçer.
*/
 
 /*
*************** SYNTAX ***************
SELECT * FROM tablo_adı 
WHERE NOT sütun_adı = 1;
*/

/*  ========================  SORU-11 ========================
 Kisiler tablosundan  İstanbul'da yaşamayan kişileri listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE NOT sehir = 'Istanbul';

/*  ========================  SORU-12 ========================
 Kisiler tablosundan 30 yaşından büyük olmayan kişileri listeleyiniz.
    =========================================================
 */

-- Birinci Yol

SELECT * FROM kisiler
WHERE yas <= 30;

-- Ikinci Yol

SELECT * FROM kisiler
WHERE NOT yas > 30;

/*  ========================  SORU-13 ========================
 Kisiler tablosundan adı 'Ali' olmayan kişileri listeleyiniz.
    =========================================================
 */

SELECT * FROM kisiler
WHERE NOT isim = 'Ali';

/*  ========================  SORU-14 ========================
 Kisiler tablosundan soyadı 'Yılmaz' veya 'Kara' olmayan kişileri listeleyiniz.
    =========================================================
 */
 
 SELECT * FROM kisiler
 WHERE NOT soyisim IN('Yılmaz', 'Kara');
 
 
 
 













