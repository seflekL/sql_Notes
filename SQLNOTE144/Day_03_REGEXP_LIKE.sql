USE sys;

CREATE TABLE kelimeler
    (
        id INT UNIQUE,
        kelime VARCHAR(50),
        harf_sayisi INT
    );
    
 INSERT INTO kelimeler VALUES 
    (1001, 'hot', 3),
	(1002, 'hat', 3),
	(1003, 'hit', 3),
	(1004, 'hbt', 3),
	(1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
	(1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);   
    
    SELECT * FROM kelimeler;

/* ===============================================
		   REGEXP_LIKE OPERATORU 
    ===============================================*/
 /*    
    
    
 /*
1- "REGEXP_LIKE" (veya bazen "RLIKE" olarak da bilinir), daha karmaşık ve 
 güçlü bir arama yapmak için düzenli ifadeleri (regular expressions) kullanır.
2- Düzenli ifadeler, metin içindeki PATERN'leri tanımlamak için kullanılan bir dil 
veya sözdizimidir.
3- "REGEXP" operatörü, çok daha spesifik ve esnek aramalar yapmanıza olanak tanır.
4- [!-~] = Butun karakterleri karsilayan tek bir karakteri ifade eder.
   [a-zA-Z0-9] = Harf ve rakamlari temsil eden bir karakteri ifade eder.
5- '^' isareti baslangici belirtir.
6- '$' isareti bitisi belirtir.  
7- '|' karakteri veya anlaminda kullanilir.
8- '.' herhangi bir tek karakter anlamina gelir'

 
Örneğin, "REGEXP '^J.*son$'" ifadesi "J" ile başlayıp "son" ile biten tüm metin değerlerini bulur
 (örn. "Jason" ama "Wilson" değil).
*/

/*
*************** SYNTAX ***************
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]');
*/

/*  =============================  SORU-7 =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    listeleyiniz
    ===================================================================
 */

SELECT kelime 
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ot|at');

/* ===============================================
		   CASE SENSITIVE / CASE INSENSITIVE
    ===============================================*/


/*
		Case Sensitive (Büyük/Küçük Harfe Duyarlılık)
	Bir sorgu veya veritabanı işlemi case sensitive olduğunda, 
	büyük ve küçük harfler farklı kabul edilir. 
	Örneğin, 'a' ve 'A' farklı karakterler olarak değerlendirilir.

	KULLANIM: sorgu sonuna 'c' seklinde patern eklenerek belirtilmelidir.
*/


/*
		Case Insensitive (Büyük/Küçük Harfe Duyarsızlık)
	Bir sorgu veya işlem case insensitive olduğunda, 
	büyük ve küçük harf farkı göz ardı edilir. 
	Yani, 'a' ve 'A' aynı karakter olarak kabul edilir.

	KULLANIM: sorgu sonuna 'i' seklinde patern eklenerek belirtilmelidir.
*/

-- NOT: Mysql de default caseType insensitive olarak kabul edilmektedir.
-- Case Sensitive oldugu ozellikle belirtilmemis ise default type degeri 
-- olan insensitive gecerlidir.



/*  =============================  SORU-8 =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    case-sensitive'e dikkat ederek listeleyiniz.
    ===================================================================
 */
 
SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'at|ot', 'c');


SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'at|ot', 'i');

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'at|ot');   


/*  =============================  SORU-9 =============================
    Kelimeler tablosunda icinde 'ho' veya 'hi' gecen kelimeleri 
    case-sensitive'e dikkat etmeksizin listeleyiniz.
    ===================================================================
 */ 

-- Case Insensitive belirtilmis hali
SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ho|hi', 'i');

-- Case Insensitive belirtilmemis hali
SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ho|hi');


/*  =============================  SORU-10 =============================
    Kelimeler tablosundan sonu 't' veya 'm' ile bitenleri 
    case-sensitive'e dikkat etmeksizin listeleyiniz.
    ===================================================================
 */

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 't$|m$', 'i');



/*  =============================  SORU-11 =============================
    Kelimeler tablosundan h ile baslayip t ile biten 3 harfli kelimeleri 
    (h ile t kucuk harfli olanlari) listeleyiniz.
    ===================================================================
 */


/*
	[!-~] = Butun karakterleri karsilayan tek bir karakteri ifade eder.
   [a-zA-Z0-9] = Harf ve rakamlari temsil eden bir karakteri ifade eder.
*/
-- Birinci Yol
SELECT kelime 
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'h[!-~]t', 'c');


-- Ikinci Yol
SELECT kelime 
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t', 'c');


-- Ucuncu Yol
SELECT kelime 
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'h.t', 'c');


/*  =============================  SORU-12 =============================
    Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri rakam 
    olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
    ===================================================================
 */

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'h[0-9]t', 'c');


/*  =============================  SORU-13 =============================
    Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri buyuk 
    harf olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
    ===================================================================
 */

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^h[A-Z]t$', 'c');


/*  =============================  SORU-14 =============================
    Kelimeler tablosundan 2. harfi 'O' (buyuk O harfli) olan 3 karakterli 
    kelimeleri ve id'lerini listeleyiniz
    ===================================================================
 */


-- Birinci Yol
SELECT id, kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^[!-~]O[!-~]$', 'c'); 


-- Ikinci Yol
SELECT id, kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^[a-zA-Z0-9]O[a-zA-Z0-9]$', 'c'); 


-- Ucuncu Yol
SELECT id, kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^.O.$', 'c');


/*
-----------------------------KARSILASTIRMA ------------------------------
Esneklik: "REGEXP" daha esnek ve güçlüdür, karmaşık desenleri tanımlayabilir. 
"LIKE" ise daha basit ve sınırlı desenlerle çalışır.
Performans: "LIKE" operatörü genellikle "REGEXP" operatörüne göre daha hızlıdır,
çünkü daha basit desenleri işler.
Kullanım Kolaylığı: "LIKE" daha basit ve anlaşılması daha kolaydır. "REGEXP" 
ise düzenli ifadelerin nasıl çalıştığını bilmeyi gerektirir, 
bu da öğrenme eğrisini artırır.
*/









