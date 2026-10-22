-- Soru 1: Bütün robotların adı ve modeli
SELECT name, model
FROM robots;

-- 10 satır döndü.
-- Soru 2: Robotların adı ve eksik şarj miktarı
SELECT
    name AS robot,
    100 - battery_level AS missing
FROM robots;

-- 10 satır döndü.
-- Soru 3: Bataryası 50'nin üstündeki robotlar
SELECT *
FROM robots
WHERE battery_level > 50;

-- 4 satır döndü.
-- Soru 4: Bakımdaki robotlar
SELECT *
FROM robots
WHERE status = 'maintenance';

-- 1 satır döndü.
-- Soru 5: Görevde olmayan robotlar
SELECT *
FROM robots
WHERE status <> 'active';

-- 4 satır döndü.
-- Soru 6: AMR-300 modelinde ve bataryası 40'ın üstündeki robotlar
SELECT *
FROM robots
WHERE model = 'AMR-300'
  AND battery_level > 40;

-- 2 satır döndü.
-- Soru 7: Şarjda veya bakımda olan, bataryası 50'nin altındaki robotlar
SELECT *
FROM robots
WHERE (status = 'charging' OR status = 'maintenance')
  AND battery_level < 50;

-- 1 satır döndü.
-- Soru 7: Parantezsiz karşılaştırma
SELECT *
FROM robots
WHERE status = 'charging'
   OR status = 'maintenance'
  AND battery_level < 50;

-- Parantezsiz sorgu: 2 satır döndü.
-- Parantezli sorgu: 1 satır döndü.
-- Çünkü AND, OR işleminden önce değerlendirilir.
-- Soru 8: Bataryası 15 ile 50 arasında olan robotlar
SELECT *
FROM robots
WHERE battery_level BETWEEN 15 AND 50;

-- 3 satır döndü.
-- Soru 9: Depo A ve Depo B'de olmayan robotlar
SELECT *
FROM robots
WHERE zone NOT IN ('Depo A', 'Depo B');

-- 5 satır döndü.
-- Soru 10: Adı kartal ile başlayan robotlar
SELECT *
FROM robots
WHERE name ILIKE 'kartal%';

-- 4 satır döndü.
-- Soru 11: Önce modele, sonra bataryaya göre sırala
SELECT *
FROM robots
ORDER BY model ASC, battery_level DESC;

-- 10 satır döndü.
-- Soru 12: Şarjı en yüksek 3 robot
SELECT *
FROM robots
ORDER BY battery_level DESC
LIMIT 3;

-- 3 satır döndü.
-- Soru 13: Filodaki farklı bölgeler
SELECT DISTINCT zone
FROM robots;

-- 6 satır döndü.
-- Soru 14: Operatörleri normal ve Türkçe alfabe sırasına göre listele

-- Normal sıralama
SELECT operator_name
FROM operators
ORDER BY operator_name;

-- 10 satır döndü.

-- Türkçe sıralama
SELECT operator_name
FROM operators
ORDER BY operator_name COLLATE "tr-TR-x-icu";

-- 10 satır döndü.
-- COLLATE Türkçe alfabetik sıralama yapılmasını sağlar.
-- İki sorgu aynı sayıda kayıt döndürür, ancak sıraları farklı olabilir.
-- Soru 15: Belirli bölgelerdeki görevdeki robotlar
SELECT name, zone, battery_level
FROM robots
WHERE (zone = 'Dış Alan' OR zone = 'Depo B')
  AND status = 'active'
ORDER BY battery_level ASC;

-- 4 satır döndü.