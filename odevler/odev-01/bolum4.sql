-- Soru 1: Filoda toplam kaç robot var?
SELECT COUNT(*) AS toplam_robot
FROM robots;
-- Sonuç: 10 robot bulundu.
-- Yorum: Filoda toplam 10 robot bulunmaktadır.
-- Soru 2: Görevdeki robot sayısı
SELECT COUNT(*) AS aktif_robot
FROM robots
WHERE status = 'active';

-- Sonuç: 6 robot bulundu.
-- Yorum: Filodaki 10 robotun 6 tanesi görev durumundadır.
-- Soru 3: Bütün robotların batarya seviyelerinin toplamı
SELECT SUM(battery_level) AS toplam_batarya
FROM robots;

-- Sonuç: 381
-- Yorum: Filodaki 10 robotun batarya seviyelerinin toplamı 381'dir.
-- Soru 4: Ortalama batarya seviyesi
SELECT ROUND(AVG(battery_level), 1) AS ortalama_batarya
FROM robots;

-- Sonuç: 42.3
-- Yorum: Bilinen batarya değerlerinin ortalaması 42.3'tür.
-- AVG, NULL değerleri hesaba katmaz.
-- Soru 5: En düşük ve en yüksek batarya seviyesi
SELECT
    MIN(battery_level) AS en_dusuk,
    MAX(battery_level) AS en_yuksek
FROM robots;

-- Sonuç: En düşük 0, en yüksek 91.
-- Yorum: Robotların batarya seviyeleri 0 ile 91 arasında değişmektedir.
-- Soru 6: Robotları durumlarına göre grupla
SELECT status, COUNT(*) AS robot_sayisi
FROM robots
GROUP BY status;

-- Sonuç: 4 satır döndü.
-- active: 6, offline: 1, charging: 2, maintenance: 1
-- Yorum: Filodaki 10 robotun 6'sı görevde,
-- 2'si şarjda, 1'i bakımda ve 1'i çevrimdışıdır.
-- Soru 7: Her modelin robot sayısı ve ortalama bataryası
SELECT
    model,
    COUNT(*) AS robot_sayisi,
    ROUND(AVG(battery_level), 1) AS ortalama_batarya
FROM robots
GROUP BY model;

-- Sonuç: 3 satır döndü.
-- Yorum: Robotlar 3 farklı modele ayrılmaktadır.
-- En yüksek ortalama batarya 57.7 ile DRN-X1 modelindedir.
-- Soru 8: Her bölgede, her durumdan kaç robot var?
SELECT
    zone,
    status,
    COUNT(*) AS robot_sayisi
FROM robots
GROUP BY zone, status
ORDER BY zone, status;

-- Sonuç: 7 satır döndü.
-- Yorum: Robotlar bölge ve durumlarına göre 7 gruba ayrıldı.
-- Beklenmedik sonuç: 1 aktif robotun bölgesi NULL,
-- yani hangi bölgede olduğu bilinmiyor.
-- Soru 9: Birden fazla robotu olan modeller
SELECT model, COUNT(*) AS robot_sayisi
FROM robots
GROUP BY model
HAVING COUNT(*) > 1;

-- Sonuç: 3 satır döndü.
-- Yorum: Üç robot modelinin de birden fazla robotu vardır.
-- Model başına robot sayıları 3, 4 ve 3'tür.
-- Soru 10: Görevdeki robotlardan en az 2 tane olan modeller
SELECT
    model,
    COUNT(*) AS robot_sayisi,
    ROUND(AVG(battery_level), 1) AS ortalama_batarya
FROM robots
WHERE status = 'active'
GROUP BY model
HAVING COUNT(*) >= 2;

-- Sonuç: 2 satır döndü.
-- Yorum: Şartları sağlayan 2 robot modeli bulunmaktadır.
-- DRN-X1 modelinin ortalama bataryası 54.5,
-- diğer modelin ise 37.0'dır.
-- Soru 11: Robotların eksik bilgilerini say
SELECT
    COUNT(*) - COUNT(id) AS eksik_id,
    COUNT(*) - COUNT(name) AS eksik_isim,
    COUNT(*) - COUNT(model) AS eksik_model,
    COUNT(*) - COUNT(status) AS eksik_durum,
    COUNT(*) - COUNT(battery_level) AS eksik_batarya,
    COUNT(*) - COUNT(zone) AS eksik_bolge,
    COUNT(*) - COUNT(operator_name) AS eksik_operator
FROM robots;

-- Beklenen sonuç: 1 satır.
-- Yorum: Batarya, bölge ve operatör bilgilerinde
-- birer NULL değer bulunuyor. Diğerlerinde eksik yok.
-- Soru 12: NULL kontrolü

-- Yanlış yöntem: = NULL
SELECT *
FROM robots
WHERE battery_level = NULL
   OR zone = NULL
   OR operator_name = NULL;

-- Sonuç: 0 satır döndü.

-- Doğru yöntem: IS NULL
SELECT *
FROM robots
WHERE battery_level IS NULL
   OR zone IS NULL
   OR operator_name IS NULL;

-- Sonuç: 2 satır döndü.
-- Yorum: 9 ve 10 numaralı robotlarda eksik bilgiler var.
-- NULL bilinmeyen değer olduğu için = NULL yerine IS NULL kullanılır.
-- Soru 13: NULL değerlerle iki farklı ortalama
SELECT
    ROUND(AVG(battery_level), 1) AS boslari_atlayan,
    ROUND(AVG(COALESCE(battery_level, 0)), 1) AS boslari_sifir_sayan
FROM robots;

-- Sonuç: 1 satır döndü.
-- NULL değerleri atlayınca ortalama 42.3 çıktı.
-- NULL değerleri sıfır sayınca ortalama 38.1 çıktı.
-- Yorum: Eksik batarya bilgisi sıfır kabul edilince ortalama düşüyor.
-- Ancak bilinmeyen batarya değeri her zaman sıfır anlamına gelmez.
-- Soru 14: Operatörlerin işe giriş yıllarına göre sayısı
SELECT
    EXTRACT(YEAR FROM hired_at) AS ise_giris_yili,
    COUNT(*) AS operator_sayisi
FROM operators
GROUP BY EXTRACT(YEAR FROM hired_at)
ORDER BY ise_giris_yili;

-- Sonuç: 4 satır döndü.
-- 2023: 1, 2024: 3, 2025: 4, 2026: 2
-- Yorum: En fazla operatör 2025 yılında işe başlamıştır.
-- Bu yıl işe başlayan toplam 4 operatör vardır.
-- Soru 15: Robotları batarya seviyelerine göre gruplandır

-- İlk deneme: NULL kontrolü başta
SELECT
    CASE
        WHEN battery_level IS NULL THEN 'Bilinmiyor'
        WHEN battery_level < 20 THEN 'Kritik'
        WHEN battery_level < 60 THEN 'Düşük'
        ELSE 'Normal'
    END AS kategori,
    COUNT(*) AS robot_sayisi
FROM robots
GROUP BY kategori;

-- Sonuç: 4 satır döndü.

-- İkinci deneme: NULL kontrolü sonda
SELECT
    CASE
        WHEN battery_level < 20 THEN 'Kritik'
        WHEN battery_level < 60 THEN 'Düşük'
        WHEN battery_level >= 60 THEN 'Normal'
        WHEN battery_level IS NULL THEN 'Bilinmiyor'
        ELSE 'Bilinmiyor'
    END AS kategori,
    COUNT(*) AS robot_sayisi
FROM robots
GROUP BY kategori;

-- Sonuç: 4 satır döndü.
-- Normal: 3, Kritik: 4, Düşük: 2, Bilinmiyor: 1
-- Yorum: NULL kontrolünün yeri değişse de sonuç değişmedi.
-- Çünkü NULL değerleri sayılarla karşılaştırılamaz.