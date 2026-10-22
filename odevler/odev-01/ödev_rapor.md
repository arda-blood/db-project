# ÖDEV RAPOR

**Ad Soyad:** Arda Yiğit Öncü  
**Ders:** BLP 105  
**Tarih:** 22.10.2026

**1. bölümde** Python ile üç soru çözdüm. Sayıları ayırma, art arda gelen değerleri bulma ve kelimeleri sayma işlemlerini yaptım. Birkaç kez girintiyi yanlış yazdığım için sonuçlar fazla çıktı. `print` satırının yerini düzeltip tekrar çalıştırınca doğru oldu.

**2. bölümde** veritabanıyla ilgili soruları cevapladım. Excel yerine veritabanı kullanmanın daha düzenli olduğunu, birincil anahtarın kayıtları ayırmaya yaradığını öğrendim.

**3. bölümde** robot verileriyle 15 SQL sorgusu yaptım. `SELECT`, `WHERE`, `ORDER BY` gibi komutları kullandım. Önce bazı sorguların ne işe yaradığını karıştırdım ama pgAdmin'de çalıştırıp sonuçlarına bakınca daha anlaşılır oldu.

**4. bölümde** `COUNT`, `AVG`, `GROUP BY` ve `NULL` konularını çalıştım. Toplam 10 robot vardı, 6 tanesi aktifti. Batarya ortalaması boş değerleri saymayınca 42.3, boşu sıfır kabul edince 38.1 çıktı. Bu farkı görünce `NULL` değerinin sıfırla aynı şey olmadığını anladım. Bir de bölgesi yazılmayan robot olduğunu gördüm. Python'da sayarak yaptığım işlemlere benzer şekilde SQL'de `GROUP BY` ile gruplama yapılabildiğini fark ettim.

**Karşılaştığım sorun:** PostgreSQL'de veritabanı oluştururken kodlama (encoding) hatası aldım. Şablon olarak `template0` seçince sorun çözüldü. Python'da da girinti hatalarını düzelttim.
