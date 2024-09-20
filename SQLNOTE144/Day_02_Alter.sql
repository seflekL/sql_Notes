USE sys;

/*===============================================
		  TABLOYU DEGISTIRME - ALTER TABLE
===============================================*/

/*ALTER TABLE ifadesi, SQL'de mevcut bir veritabanı tablosunun 
yapısını değiştirmek için kullanılır. Bu komut sayesinde, tabloya
 yeni sütunlar ekleyebilir, mevcut sütunları değiştirebilir veya silebilir,
 sütunların veri türlerini güncelleyebilir, sütunlara kısıtlamalar (constraints)
 ekleyebilir veya mevcut kısıtlamaları kaldırabilirsiniz. 
 */

/*===============================================
		   ALTER TABLE - Sutun Ekleme
===============================================*/

 /*
*************** SYNTAX ***************
ALTER TABLE tablo_adi 
ADD sütun_adi + dataType;
*/

/*  ========================  SORU-1 ========================
 Kitaplar tablosuna sayfa sayisi column'i ekleyiniz.
    =========================================================
 */

-- Before
SELECT * FROM kitaplar;

ALTER TABLE kitaplar
ADD sayfa_sayisi INT;

-- After
SELECT * FROM kitaplar;


/*  ========================  SORU-2 ========================
 Kitaplar tablosuna fiyat column'i ekleyiniz.
    =========================================================
 */ 

ALTER TABLE kitaplar
ADD fiyat DOUBLE(5,3);

/*  ========================  SORU-3 ========================
       Personel tablosuna sehir column'i ekleyiniz 
    =========================================================
 */
 
 ALTER TABLE personel
 ADD şehir VARCHAR(15);

SELECT * FROM personel;


/*===============================================
ALTER TABLE - Sütunun Veri Türünü Değiştirme
===============================================*/

/*
*************** SYNTAX ***************
ALTER TABLE tablo_adi 
MODIFY COLUMN  sütun_adi + yeniDataType;
*/

/*  ========================  SORU-4 ========================
  Ogrenciler tablosundaki ogrenci_adi column'inin data type'ini degistiriniz .
    =========================================================
 */
 
 ALTER TABLE ogrenciler
 MODIFY COLUMN ogrenci_adi CHAR(15);
 
/*  ========================  SORU-5 ========================
 Ogrenciler tablosundaki kayit yili column'inin data type'ini degistiriniz .
    =========================================================
 */

ALTER TABLE ogrenciler
MODIFY COLUMN ogrenci_kayit_yili INT;


/*===============================================
		ALTER TABLE - Sütun Adını Değiştirme
===============================================*/
/*

/*
*************** SYNTAX ***************
ALTER TABLE tablo_adi 
RENAME COLUMN  eskiSütunAdi TO yeniSütunAdi;
*/

/*  ========================  SORU-6 ========================
 Personel tablosundaki pozisyon column'in adini sorumluluk olarak degistiriniz.
    =========================================================
 */

-- Before
SELECT * FROM personel;

ALTER TABLE personel
RENAME COLUMN pozisyon
TO sorumluluk;

-- After
SELECT * FROM personel;


/*  ========================  SORU-7 ========================
 Ogrenciler tablosundaki ogrenci_adi column'in adini isim olarak degistiriniz.
    =========================================================
 */

SELECT * FROM ogrenciler;

ALTER TABLE ogrenciler
RENAME COLUMN ogrenci_adi
TO isim;

/*  ========================  SORU-8 ========================
 Ogrenciler tablosundaki ogrenci_soyadi column'in adini lastname olarak degistiriniz.
    =========================================================
 */

ALTER TABLE ogrenciler
RENAME COLUMN ogrenci_soyadi
TO lastname;

/*===============================================
      ALTER TABLE - Sütun Silme
===============================================*/

/*
*************** SYNTAX ***************
ALTER TABLE tablo_adi 
DROP COLUMN  sütun_adi;
*/

/*  ========================  SORU-8 ========================
     Ogrenciler tablosundaki ogrenci_ID column'ini siliniz.
    =========================================================
 */

SELECT * FROM ogrenciler;

ALTER TABLE ogrenciler
DROP COLUMN ogrenci_ID;

/*  ========================  SORU-10 ========================
 Kitaplar tablosundaki sayfa sayisi column'ini siliniz.
    =========================================================
 */

SELECT * FROM kitaplar;

ALTER TABLE kitaplar
DROP COLUMN sayfa_sayisi;

/*  ========================  SORU-11 ========================
	    Personel tablosundaki sehir column'ini siliniz.
    =========================================================
 */

SELECT * FROM personel;

ALTER TABLE personel
DROP COLUMN şehir;


/*===============================================
        TABLOYU SILME - DROP TABLE
===============================================*/
 
 /*DROP TABLE ifadesi, SQL'de veritabanı nesnelerini (tablo, görünüm, dizin, vb.)
 kalıcı olarak silmek için kullanılır. DROP komutu, belirtilen nesneyi ve o nesneyle
 ilişkili tüm verileri veritabanından kaldırır. Bu işlem geri alınamaz, yani DROP komutu
 kullanıldığında, nesne ve içeriği kalıcı olarak silinir ve geri getirilemez.
 */
 
 /*
 NOT!  
 DROP ifadesi ile sadece tabloları değil veritabanını da silebileceğiniz için
 bu komutu kullanırken çok dikkatli olmalısınız….
 */
 
 /*
*************** SYNTAX ***************
DROP TABLE tablo_adi;
*/
 
 CREATE SCHEMA t144;
 
 DROP SCHEMA t144;
 
 /*  ========================  SORU-1 ========================
      Kitaplar tablosunu siliniz.
    =========================================================
 */
 
 SELECT * FROM kitaplar;
 
 DROP TABLE kitaplar;
 
 
 /*  ========================  SORU-2 ========================
      Personel tablosunu siliniz.
    =========================================================
 */
 
  DROP TABLE personel;
 
 
/*===============================================
    TABLO İÇERİĞİNİ SİLME - TRUNCATE TABLE
===============================================*/ 
 
 /*TRUNCATE TABLE komutu, SQL'de bir tablodaki tüm satırları hızlı ve etkili
 bir şekilde silmek için kullanılır. Bu komut, tabloyu silmez veya tablonun
 yapısını değiştirmez, sadece tablo içindeki tüm verileri temizler. TRUNCATE TABLE
 komutunun kullanımı genellikle DELETE komutuna göre çok daha hızlıdır çünkü TRUNCATE,
 tablodaki verileri toplu olarak siler ve her bir satır için ayrı ayrı log kaydı tutmaz.
 */
 
 /*
NOT!  
TRUNCATE TABLE komutunun etkileri kalıcıdır ve geri alınamaz, bu nedenle bu komutu
 kullanmadan önce verilerin yedeklenmesi önemlidir. Ayrıca, tüm verilerin silineceğini
 ve bu işlemin geri alınamayacağını unutmamak önemlidir.
 */ 
 
 /*
*************** SYNTAX ***************
TRUNCATE TABLE tablo_adi;
*/
 
 SELECT * FROM ogrenciler;
 
 TRUNCATE TABLE ogrenciler;
 
 
/*  ========================  SORU-1 ========================
      Kitaplar tablosunu create edin sonra truncate kullanarak siliniz.
    =========================================================
 */ 
 
 
 CREATE TABLE kitaplar
 (
	ID INT,
    kitap_adi VARCHAR(80),
    yazar_adi VARCHAR(30),
    yayin_yili YEAR,
    kategori VARCHAR(20)
 );
 
 SELECT * FROM kitaplar;
 
 
 INSERT INTO kitaplar(ID, kitap_adi, yazar_adi, yayin_yili,kategori)
               VALUES(1001, 'Bootcamp Seruvenim', 'Rana Nur Ulker', '2024', 'Otobiyografi');
 
 TRUNCATE TABLE kitaplar;
 
 
 
 
 
 
 
 
 



