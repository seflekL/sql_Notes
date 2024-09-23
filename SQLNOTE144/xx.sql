* ===============================================
	    AGGREGATE FUNCTIONS / MAX() & MIN()
   ===============================================*/
/*
*************** SYNTAX ***************
SELECT MAX(sütun_adı) / MIN(sütun_adı)
FROM tablo_adı;
*/
/*  =============================  SORU-10 =============================
    Satis raporu tablosundaki en dusuk birim fiyati nedir ve hangi urune aittir?
    ===================================================================
*/
SELECT MIN(birim_fiyati)
FROM satis_raporu;
/*  =============================  SORU-11 =============================
    Satis raporu tablosundaki en eski ve en yeni satis tarihleri nelerdir?   ===================================================================
*/