-- Bu bir yorum satiridir.

/*
Bu bir yorum blogudur.
*/

/*===============================================
		TABLO OLUSTURMA (CRUD - Create)
===============================================*/
/*
"CREATE TABLE" bir veritabanında yeni bir tablo oluşturmak için kullanılan 
bir SQL (Structured Query Language) ifadesidir. Bu komut, tablonun yapısını 
tanımlar; yani tabloda bulunacak sütunların isimlerini, veri tiplerini ve diğer 
özelliklerini (örneğin, Primary Key, Unique, Not Null  vb.) belirtir. 
"CREATE TABLE" komutunu kullanırken, her bir sütun için uygun veri tipini ve 
boyutunu belirlemek ve gerektiğinde sütunlara kısıtlamalar eklemek önemlidir. 
Bu işlem, veri bütünlüğünü korumak ve veritabanı işlemlerinin doğru şekilde 
çalışmasını sağlamak için kritik öneme sahiptir.
*/

/*
*************** SYNTAX ***************
CREATE TABLE tablo_adi 
(
    sütun1 veri_tipi1 ,
    sütun2 veri_tipi2 ,
    ...
    sütunN veri_tipiN 
);

*/

/*  ========================  SORU-1 ========================
 Icerisinde kitap id, kitap adi, yazar adi, yayin yili ve kategori columnlari
 olan bir kitaplar tablosu create ediniz. 
    =========================================================
 */
 
 
 USE sys;  -- Bu sayfadaki kodlari sys schema'da calistir demek.

CREATE TABLE kitaplar
(
	kitap_id INT,
    kitap_adi VARCHAR(80),
    yazar_adi VARCHAR(30),
    yayin_yili INT,
    kategori VARCHAR(30)
);

-- MySQL'de isimlendirme yapilirken snake_case kullanilir.
-- MySQL buyuk/kucuk harf duyarsizdir.
-- Ancak genel TEAMUL olarak komut ifadeleri BUYUK HARF ile yazilir.


/*  ========================  SORU-2 ========================
 Icerisinde personel id, adi, soyadi, dogum tarihi, pozisyon, maas columnlari
 olan bir "personel" tablosu create ediniz. 
    =========================================================
 */

CREATE TABLE personel
(
	personel_ID INT,
    adi VARCHAR(20),
    soyadi VARCHAR(20),
    dogum_tarihi DATE,
    pozisyon VARCHAR(30),
    maas DOUBLE(8,3)
);

/*  ========================  SORU-3 ========================
 Icerisinde ogrenci id, ogrenci adi,ogrenci soyadi,ogrenci bolum,ogrenci kayit yili,ogrenci ortalama not 
 columnlari olan bir ogrenciler tablo create ediniz. 
    =========================================================
 */

CREATE TABLE ogrenciler
(
ogrenci_ID INT,
ogrenci_adi VARCHAR(20),
ogrenci_soyadi VARCHAR(20),
ogrenci_bolum VARCHAR(10),
ogrenci_kayit_yili DATE,
ogrenci_ortalama_not FLOAT (3,2)
);

/*===============================================
		TABLO GORUNTULEME - SELECT
===============================================*/
/*
/*
SELECT komutu, SQL'de veritabanından veri sorgulamak ve almak için
 kullanılan temel bir komuttur. Bu komut, belirtilen kriterlere uygun
 verileri seçmek ve görüntülemek için kullanılır.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi;
*/

/*  ========================  SORU-1 ========================
            Kitaplar tablosunu goruntuleyiniz.
    =========================================================
 */

SELECT * FROM kitaplar;

-- select all books from Arzuv's room

 -- SQL syntax yapisi gundelik konusma diline yaklastirilmaya calisiliyor (INGILIZCE)
 -- Syntax yapisini tersten okudugunuzda mantikli bir cumle ile karsilasirsiniz.
 
 
 /*  ========================  SORU-2 ========================
              Personel tablosunu goruntuleyiniz.
    =========================================================
 */ 
 
 SELECT * FROM personel;
 
 /*===============================================
		  TABLOYA VERI GIRISI - INSERT
===============================================*/

/*-------------------- NOT -------------------------
   Degerleri girerken dikkat edilmesi gerekenler;
1- Tabloyu olustururken hangi data type belirlediysek o
   datatype cinsinden veri girisi yapmaliyiz
2- String ifadeleri 'tek tirnak' icinde yaziyoruz.
3- DATE data type'da String gibi 'tek tirnak' icinde yazilir.
4- MySQL'in default tarih formati YYYY-MM-DD seklindedir.
--------------------------------------------------*/
 
/*-------------------- NOT -------------------------
 1- Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
   table olustururken field isminin yanina UNIQUE yaziyoruz.
 2- Bir field kaydedilecek verilerde NULL olmasin istiyorsak
   table olustururken field isminin yanina NOT NULL yaziyoruz.
--------------------------------------------------*/

/*
*************** SYNTAX ***************
INSERT INTO table_name (columns)
	VALUES (
	std_id ,           
	std_name ,     
	std_age 				  
	);
*/

/*  ========================  SORU-1 ========================
 Kitaplar tablosuna null deger olmadan bir veri girisi saglayiniz.
    =========================================================
 */
 
 INSERT INTO kitaplar (kitap_id, kitap_adi, yazar_adi, yayin_yili, kategori)
			    VALUES(1000, 'Sefiller', 'Victor Hugo', 1862, 'Roman');


SELECT * FROM kitaplar;

/*  ========================  SORU-2 ========================
 Kitaplar tablosuna null deger olmadan coklu veri girisi saglayiniz.
    =========================================================
 */

INSERT INTO kitaplar(kitap_id, kitap_adi, yazar_adi, yayin_yili, kategori)
			  VALUES(1001, 'Suc ve Ceza', 'Dostoyevski', 1866, 'Roman'),
					(1002, 'Nutuk' , 'M.Kemal Ataturk', 1927, 'Soylev'),
                    (1003, 'Yabanci', 'Albert Camus', 1899, 'Roman');
                    
                    
/*  ========================  SORU-3 ========================
 Personel tablosuna null deger olmadan coklu veri girisi saglayiniz.
    =========================================================
 */
 
 INSERT INTO personel(personel_ID, adi, soyadi, dogum_tarihi, pozisyon, maas)
               VALUES(1, 'Ali', 'Bak', '2000-01-24', 'CEO', 12345.678),
                     (2, 'Veli', 'Bakma', '2001-02-25', 'CTO', 34567.123);
 

SELECT * FROM personel;


/*  ========================  SORU-4 ========================
 ogrenciler tablosuna null deger olmadan coklu veri girisi saglayiniz.
    =========================================================
 */
 
 INSERT INTO ogrenciler (ogrenci_ID, ogrenci_adi, ogrenci_soyadi, ogrenci_bolum, ogrenci_kayit_yili, ogrenci_ortalama_not)
                  VALUES(101, 'Ismail', 'Kaya', 'IT', '2020-01-01', 4.98),
						(102, 'Can', 'Yilmaz', 'EEE', '2019-02-02', 4.95),
                        (103, 'Levent', 'Seflek', 'Marketing', '2018-03-03', 4.92);

SELECT * FROM ogrenciler;


/*  ========================  EXTRA ========================
 personel tablosuna id, isim ve soyisim degerleri girerek bir veri girisi yapiniz.
    =========================================================
 */
 
 INSERT INTO personel(personel_ID, adi, soyadi)
				VALUES(3, 'Bayram', 'Bayramoglu');

SELECT * FROM personel;

-- SQL Query'leri hazirlarken INSERT komutunda HEADERS siralamasina gore VALUES sirasini olusturmamiz gerekir.
























