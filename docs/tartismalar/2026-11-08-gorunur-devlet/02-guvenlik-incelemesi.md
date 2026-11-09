# Görünür Devlet Tartışması — 02: Güvenlik İncelemesi

- **Hazırlayan:** Yapay zekâ güvenliği ajanı
- **Tarih:** 2026-11-08

---

## 0. Kısa özet

Bu üç fikir (FA-04 İkinci Termometre, FA-06 Bakış Defteri, FA-14 Sıra Defteri) aynı iyi niyete dayanıyor: devleti görünür kılmak. Güvenlik gözüyle ortak bir uyarı var: **görünürlük araçlarının kendisi birer saldırı hedefi ve silahtır.** Bir ölçü alarm tetikleyince, ölçüyü kirleten alarmı kontrol eder. Bir defter "kim kime baktı"yı tutunca, defter ülkenin en değerli gözetim haritasına dönüşür. Bir sıra herkese açılınca, sıranın girdisi ve gerekçesi kayırmanın yeni adresi olur.

| Fikir | Risk düzeyi | Ana sebep |
|---|---|---|
| **FA-04 İkinci Termometre** | **Yüksek** (alarm bir ödemeye ya da B Planı'na otomatik bağlanırsa **Kritik**) | Sahte ve yanlı katkı; alarmın silah olması; "kimliksiz" fişin kimliksiz olmaması |
| **FA-06 Bakış Defteri** | **Kritik** | Defterin kendisi hedef ve harita; istihbarat istisnası; bildirim kanalının kötüye kullanımı |
| **FA-14 Sıra Defteri** | **Yüksek** (sağlık dışı alanlarda **Orta**) | Kayırmanın formüle değil girdiye, gerekçeye ve defter dışı kanallara kayması; kamuya açık sıradan kişi çıkarımı |

Öneri belgesi bu fikirleri kendi içinde "orta" ve "düşük" cesaretli sayıyor. Güvenlik açısından bu sınıflama yanıltıcı: **cesaret düzeyi ile güvenlik riski aynı şey değildir.** FA-14 "düşük cesaret"tir ama sağlık sırasına dokunur; yanlış bir sıra bir insanın ameliyatını geciktirir.

Bu belge kod içermez; kavramsal bir tehdit ve güvence analizidir. Fikirler kurucu tercihi değil, eleştiriye tamamen açıktır; K1–K17 sabittir ve bu belgede hiçbirine itiraz edilmemiştir.

---

## 1. Nasıl okunmalı

- **Risk düzeyleri** Temeller 05 incelemesindekiyle aynıdır: Düşük, Orta, Yüksek, Kritik (olasılık ile sonucun ağırlığı ve geri alınamazlığının birleşimi).
- Her fikir için: risk düzeyi, tehdit senaryoları, mevcut tasarım yeterli mi, önerilen güvenceler, teknolojinin bugün yapamadıkları, tartışma sorularına güvenlik gözüyle kısa yanıt.
- Senaryolardaki adlar hayalidir.
- **Tutarlılık notu:** Temeller 05 (güvenlik incelemesi) ve 07 (savunma) içinde kabul edilen ilkeler burada yeniden kullanıldı, yeniden icat edilmedi: *veri talimat değildir*, *karantina ajanı*, *en az yetki*, *deterministik geçit* (modelin değil kodun yetki kontrolü), *tek yönlü çıkrık*, *yeniden oynatma denetimi*, *bilgi katmanı yönetişimi*, *kanarya (kasıtlı test) kayıtları*, "kayıt = denetlenebilir iz, delil değil" (07, 2.2) ve "bu sistem güvenlidir" yerine "şu koşullarda ve sınırlar içinde güvence sağlar" dili. Bölüm 7'de tablo var.
- **Bir düzeltme önerisi:** 07'nin K15 tasarımı (izinli konsorsiyum zinciri, zincire yalnızca "anahtarlı özet ve yapılandırılmış üst veri" yazılır) doğru yönde ama FA-06 için yetmez; bölüm 4'te neden yetmediğini ve ne eklenmesi gerektiğini yazdım.

---

## 2. Üç fikrin ortak güvenlik dersleri

1. **Görünürlük de saldırı yüzeyidir.** Her şeffaflık aracının bir "arka yüzü" vardır: ölçüyü kirleten, defteri okuyan, sırayı oyunlayan biri. Şeffaflığın kendisi saldırı için gereken bilgiyi de sağlar (örneğin sıra formülü açıksa, formülü oyunlamak kolaylaşır).
2. **Ölçü tetikleyici olunca silah olur.** Temeller 05'te "bilgi katmanı yoluyla yönlendirme" riskini yazmıştım: girdiyi kontrol eden, davranışı kontrol eder. İkinci Termometre'nin alarmı yürütme kararlarını Kademe 2'ye çıkarıyor ve FA-02'nin B Planı eşiklerinin hakemi oluyor; yani bir **tetikleyici gösterge**. Tetikleyicinin kirletilmesi ya da susturulması iki yönde de saldırıdır.
3. **Yurttaşın yazdığı ya da yüklediği her şey güvenilmez girdidir** (fiş, fiş fotoğrafı, ihtiyaç beyanı, "amaç" kutusu, sıra atlama gerekçesi, sevk yazısı). Bunların hepsi istem enjeksiyonu için kapıdır (Greshake vd., 2023). Nasr vd. (2025), yayımlandığında neredeyse sıfır saldırı başarısı bildiren 12 savunmanın çoğunun uyarlanabilir saldırılarla %90'ın üzerinde aşıldığını gösterdi; yani "savunmamız var" yetmez, mimari ilke gerekir.
4. **Değiştirilemez kayıt doğru kayıt değildir** (07, 2.2). K15 zaman damgası "ne zaman" der, "doğru mu" demez.
5. **"Kimliksiz" ve "özet (hash)" gizlilik garantisi değildir.** Alan küçükse özet geri çıkarılır; birkaç ayrıntı bir insanı tek başına işaretler. de Montjoye vd. (2015), 1,1 milyon kişilik kredi kartı kayıtlarında **dört zaman-mekân noktasının** kişilerin yaklaşık %90'ını tek başına ayırt etmeye yettiğini gösterdi. Narayanan ve Shmatikov (2008) benzer biçimde "anonim" bir film puanı veri kümesini yeniden kimliklendirdi. Bu, üç fikrin üçü için de geçerli.
6. **Karne ve ölçü, oyunlamayı teşvik eder.** İngiltere sağlık sisteminde bekleme hedeflerinin nasıl oyunlandığı iyi belgelenmiştir (Bevan ve Hood, 2006). Karne tanımladığınız anda biri karneyi, hizmeti değil, güzelleştirmeye çalışır.

---

## 3. FA-04 — İkinci Termometre

### 3.1 Risk düzeyi

**Yüksek.** İkinci Termometre hiçbir otomatik ödemeye ve B Planı'na bağlanmadan, yalnızca "insan incelemesi" için bir uyarı olarak kalırsa **Orta–Yüksek**. Bağlanırsa **Kritik** (T7).

### 3.2 Tehdit senaryoları

**T1 — Sahte fiş ve bot (yurttaş verisinin zehirlenmesi).**
1. Bir parti (ya da yabancı bir aktör) üretken yapay zekâyla binlerce gerçekçi fiş görüntüsü üretir ve onlarca bin sahte "hane" hesabı açar. Üretken görüntü araçlarıyla sahte fiş üretmek bugün çok ucuz.
2. "Yurttaş sepeti" enflasyonu yüzde 35'e şişer; resmî rakam yüzde 20 iken **Veri Alarmı** çalar.
3. Kira ve maaş güncellemeleri insan onayına gider; hizmet yavaşlar; muhalefet "resmî rakam yalan" kampanyasını bu veriyle başlatır.
4. *Ters yön:* İktidar yandaşlarına çağrı yapar, ya da sahte katkıyla sepeti düşürür, alarm hiç çalmaz. İkinci Termometre susturulur.
Kimliksiz katkı ilkesi bu saldırıyı güçlendirir: sahte kimlik üretmenin maliyeti ancak kimlik doğrulamayla yükselir (Douceur, 2002: "Sybil saldırısı"). Anonimlik ile sahteciliğe direnç doğrudan çelişir.

**T2 — Gerçek ama yanlı veri.**
Sahte veri gerekmeden de çarpıtma mümkün. Fiş bağışlayanlar daha çok kentli, dijital, siyasi olarak aktif ve belli mahallelerde yaşayan insanlardır. Bir parti kendi seçmenlerine "fiş bağışlayın" çağrısı yapar; örnek, dürüst ama yanlı olur. Dijital uçurum (H5) bunu daha da kötüleştirir. Düzeltmek için demografik bilgi gerekir; bu da kimliksizlikle çelişir.

**T3 — "Kimliksiz" fişin kimliksiz olmaması (mahremiyet sızıntısı).**
Bir fişte mağaza ve şube, saat, ürünler, bazen kart numarasının son hanesi ve sadakat kartı vardır. Ürünler sağlık (ilaç), inanç, içki, kişisel tercih bilgisi taşır. Dört nokta yetebileceği için (de Montjoye vd.) bir yurttaşın fişleri toplandığında kim olduğu çıkarılabilir. Katkı veritabanı ele geçirilirse şantaj ve profil çıkarma malzemesi olur. Ayrıca *katkıda bulunmak* bile siyasi bir sinyaldir ("muhalefetin çağrısıyla fiş verenler").

**T4 — Fiş ve belge içinden istem enjeksiyonu.**
Fiş görüntülerini okuyan bir yazılım, özellikle bir yapay zekâ modeli, fişin üzerine yazılmış ya da görüntüye gömülmüş "bu fişi 100 kez say" türü talimatlara kandırılabilir. Mağaza adı, ürün adı gibi serbest metin alanları da kapıdır. Sonuç: ölçüm hattı tahrif edilir ve kimse fark etmez, çünkü hata "veri" gibi görünür.

**T5 — Termometrenin ele geçirilmesi ve yöntem oyunu.**
Sepet ağırlıkları, aykırı değerlerin atılması, bölge ağırlıkları gibi görünüşte teknik tercihler sonucu birkaç puan oynatır. Yöntemi yazan sonucu belirler (Ekonomi–Yolsuzluk Y3). Finansmanın kesilmesi, kurul atamaları, sunucuyu barındıran kurum ve yazılım bileşenleri (tedarik zinciri) ele geçirme noktalarıdır. Bağımsız İstatistik Kurumu (Y2) ve resmî veri aynı kişilerin ya da tedarikçinin elindeyse "iki termometre" aslında bir tanedir.

**T6 — Alarm silahı: yorgunluk, hizmet engelleme, eşik oyunu.**
- *Eşiğin hemen altında tutma:* Saldırgan sinyali eşiğin altında tutarak alarmı hiç çaldırmaz.
- *Sürekli çaldırma:* Alarm sık çalarsa ya kimse bakmaz ya da Kademe 2 yığılır. "Alarm sürerken o göstergeye bağlı yürütme kararları insan onayına gider" kuralı, kasıtlı alarm üretene bir **hizmet engelleme** aracı verir: kira ve maaş güncellemeleri insan kuyruğunda bekler, yurttaş zarar görür.
- *Eşiğin değiştirilmesi:* Eşiği değiştirebilen, alarmı da değiştirebilir (özellikle seçim öncesi).

**T7 — Teşvik bozulması (ölçü ödemeye bağlanırsa).**
Kira artışı ya da maaş güncellemesi bu ikinci ölçüye bağlanırsa milyonlarca kişi sepeti şişirmek için maddi teşvik kazanır. Bu klasik Goodhart sorunudur: bir ölçü para dağıtmaya başlayınca iyi bir ölçü olmaktan çıkar. Öneri belgesindeki "kira ve yurttaş maaşı güncellemeleri insan onayına gider" örneği tam bu bağı çağrıştırıyor.

**T8 — Sensör ağı ve diğer göstergeler.**
Açık sensör ağında sahte ya da yerinden oynatılmış sensörler; ucuz sensörlerin kalibrasyon kayması; ölçümü bozmak için bir sensörün yakınına kaynak koymak; sensör kimliklerinin konum haritası çıkarması. "Ameliyat bekleme süresi" için yurttaşın kendi bildirimi **sağlık verisi** olur (bkz. FA-14).

**T9 — Ölçümün bilgi katmanına karışması.**
İkinci Termometre'nin çıktısı mühürlü modelin bilgi katmanına "çapraz teyit" olarak girerse, güvenilmeyen yurttaş verisi model-yüzü bir girdi olur (Temeller 05, Tehdit B). Bu veriyle modelin ince ayarı ya da öğrenmesi yapılırsa durum daha da kötüdür: Anthropic araştırması, eğitim verisine konan yalnızca 250 zehirli belgenin 600 milyondan 13 milyar parametreye kadar modellerde tetikleyici bir davranış yerleştirmeye yettiğini gösterdi.

**T10 — Zaman damgası yanılsaması (K15).**
Blokzincire yazılan ölçümün zamanı güvence altındadır, doğruluğu değil. "Zincirde, o halde doğru" yanılgısı sahte veriye saygınlık kazandırır.

**T11 — Meşru fark, yanlış alarm.**
Yoksul hane sepeti zaten resmî endeksten farklıdır (farklı ürün ağırlıkları). Aynı şeyi ölçmeyen iki sayı arasındaki fark, hile olmadan alarm verir. Yanlış alarm "resmî rakam yalan" propagandasının hammaddesidir.

### 3.3 Mevcut tasarım yeterli mi?

Hayır. Öneri doğru bir ihtiyacı (Arjantin'in INDEC örneği; 05 ve 07'de "bilgi katmanı" riski) karşılıyor ve Billion Prices Project gibi **herkese açık çevrimiçi fiyatları** derleyen bağımsız bir ölçü örneğini anıyor. Ama iki fark önemli: o proje *kamusal* fiyatları topluyordu; fiş bağışı ise *özel* alışveriş verisi toplar. Ve kimliksiz katkı hem Sybil'e hem mahremiyet sızıntısına açıktır. Bilinen riskler listesi sahte fişi, alarm yorgunluğunu ve propagandayı anıyor; ödeme teşviki, istem enjeksiyonu, fişin yeniden kimliklendirilmesi, alarmın hizmet engelleme aracı olması ve yöntem oyunu eksik.

### 3.4 Önerilen güvenceler

1. **Alarm, ödeme değil uyarıdır.** İkinci Termometre hiçbir ödemeyi, endeksi ya da oranı otomatik belirlemez. Yalnızca insan incelemesi tetikler. Geçim ödemeleri hiçbir alarmda aksamaz (07, F4 ve Yurttaş Güvence Paketi ile uyum). Bu tek ilke T7'yi kapatır.
2. **Alarm Kademe 2'ye çıkarırken dar, süreli ve tavanlıdır.** Kapsama giren karar türleri kanunda listelenir; alarm kendiliğinden sona erer; Kademe 2 kuyruğu kapasite tavanını (H4) aşarsa güvenli varsayılan işler (önceki durum sürer, geçim ödemeleri aksamaz). Kademeyi yükseltmek "tek yönlü çıkrık"a uyar (güvenli yön), ama hizmeti tıkamasın.
3. **İki anahtarlı alarm:** Kırmızı alarm, en az iki *bağımsız* ikinci kaynak (örneğin fiş katkısı + herkese açık çevrimiçi fiyat derlemesi + üniversite hane paneli) aynı yönü gösterince çalar. Tek kanaldan alarm olmaz. Kaynakların bağımsızlığı sayıyla değil hata ilişkisi ölçülerek doğrulanır (Temeller D8 mantığı).
4. **Referans hane paneli:** Rastgele seçilmiş, kimlikli, gizlilik güvenceli ve ücretli küçük bir hane paneli, açık katkıları kalibre eder. Açık kitle katkısı "yardımcı" olur, "tek ölçü" olmaz. Sahte katkıyı ve yanlı örneklemeyi yakalamanın en sağlam yolu, kontrollü bir referanstır.
5. **Katkı hakkı sınırlı ve anonim kimlik bilgisiyle:** Hane başına sınırlı sayıda, tek kullanımlık, anonim "katkı hakkı" (anonim kimlik bilgisi yöntemleri). Böylece kimlik açığa çıkmadan Sybil maliyeti yükselir. (Sınır: bölüm 3.5.)
6. **Fiş telefonda işlenir, sunucuya ham fiş gitmez:** Uygulama fişi cihazda okur ve yalnızca ürün kategorisi, fiyat, kaba bölge ve hafta bilgisini gönderir. Mağaza, şube, saat, kart ve sadakat numaraları atılır. Küçük hücreler bastırılır; yerel gürültü (diferansiyel gizlilik) eklenir. Bu hem T3'ü hem T4'ü azaltır (sunucuda görüntü/serbest metin yok). Elektronik belge (imzalı e-fatura/e-fiş) varsa görüntü yerine **imzalı belge** kullanılır; sahtesi çok daha zordur.
7. **Güvenilmeyen girdi sınıfı:** Yurttaş katkısı "güvenilmez" sınıfta, deterministik bir istatistik hattında işlenir. Hatta bir yapay zekâ modeli varsa (okuma, sınıflama) *karantinada* çalışır, hiçbir araç ve karar yetkisi olmaz, çıktısı sabit alanlı forma döner. Yurttaş katkılı veri **mühürlü modelin bilgi katmanına serbest girdi olmaz**, hiçbir modelin eğitiminde kullanılmaz (T9).
8. **Yöntem mühürleme (Ekonomi–Yolsuzluk Ö6'nın uzantısı):** Sepet, ağırlıklar, temizleme kuralları ve eşik formülü önceden ilan edilir ve mühürlenir. Seçime belirli bir süre kala (öneri: 90 gün) yöntem ve eşik değiştirilemez. Değişiklik yalnızca ileriye dönüktür, eski ve yeni yöntemle yan yana iki seri yayımlanır, etki raporu şarttır.
9. **Çoklu bağımsız hesaplama ve yeniden üretilebilirlik:** Aynı (gizlilik korumalı) veriden en az iki bağımsız ekip hesaplar; farklarsa fark yayımlanır. Yöntem kodu açık, sürümlü. Bu, Temeller 05'teki *yeniden oynatma* ilkesinin ölçüm sürümüdür.
10. **Alarm tasarımı:** Tek sayı yerine belirsizlik aralığı. İki kademe: *sarı* (izle, açıklama iste) ve *kırmızı* (Kademe 2). İki ölçü aynı şeyi ölçecek biçimde (aynı tanım ve karşılaştırılabilir sepet) hizalanır; fark "açıklanabilir bileşenlere" ayrıştırılır (sepet farkı, bölge farkı, yöntem farkı, açıklanamayan kalan). Alarm kanıt değil sorudur; metin ve yayın dili buna göre yazılır.
11. **Eşik yönetişimi:** Eşiği ve kuralı değiştirmek Bağımsız İstatistik Kurumu'nun tek başına yetkisi olmaz; bilimsel bir kurul + Meclis nitelikli çoğunluğu gerekir; kurul oluşumu Y1 (Atama Anayasası) zincirindedir. Gölge dönemde eşik ayarı yapılır.
12. **Finansman:** Karma. Kamu finansmanı çok yıllık ve kesilemez bir satırdır (bağımlılığı Y1 ile dengelenir); sivil/akademik ayak ayrıca vardır; tek kaynağın payına üst sınır konur (F1'deki pay sınırı mantığı).
13. **Sensör ağında:** Akredite sensör, kalibrasyon kaydı, komşu sensörlerle çapraz doğrulama, referans istasyonlar, kurcalama tespiti, konum bilgisinin toplulaştırılması. Bekleme süresi gibi sağlık göstergeleri yalnızca toplulaştırılmış biçimde alınır.
14. **Defter (K15):** Ölçüm kayıtlarında *yöntem sürümü*, ham veri özeti ve hesaplama kimliği tutulur; zincir doğruluk değil iz sağlar (07, 2.2).

### 3.5 Teknolojinin bugün yapamadıkları

1. **Anonim ve aynı anda sahteciliğe dirençli kitlesel katkı.** Anonim kimlik bilgileri bu çelişkiyi azaltır ama ulusal ölçekte, kitlesel kamu kullanımı henüz yaygın değil; tam çözüm sayılmaz.
2. **Üretken yapay zekâ çağında fiş, fotoğraf ve belge görüntüsünün gerçekliğini güvenilir doğrulamak.** Sahte görüntü tespit araçları güvenilir değil; içerik kökeni imzalama girişimleri (örneğin C2PA) var ama yaygın ve zorunlu değil. Bu yüzden imzalı elektronik belge tercih edilmeli.
3. **Gönüllü katkılı örneklemden ulusal ölçekte temsil edici bir enflasyon ya da bekleme süresi çıkarmak.** Yanlılığı düzeltmek demografik bilgi ister; bu da gizlilikle çelişir. Kontrollü referans panel şart.
4. **Ucuz sensörlerin güvenilir kalibrasyonu ve fiziksel kurcalamanın kesin tespiti.**
5. **Yurttaş verisini hem yararlı hem yeniden kimliklendirilemez tutmak.** Diferansiyel gizlilik ve toplulaştırma yardımcı olur ama doğruluk bedeli vardır, küçük gruplarda koruma zayıflar.
6. **Bir ölçü paraya bağlandığında Goodhart'a dayanması.** Teknik çözüm yok; yalnızca tasarımla (ölçüyü ödemeden ayırmak) kaçınılır.
7. **Alarm eşiğinin doğru değerini önceden bilmek.** Yanlış alarm ve kaçırma dengesi gerçek veriyle öğrenilir; gölge dönem şart.
8. **Açık kaynak bir ölçüm hattının tedarik zincirinin tam güvenliğini kanıtlamak.**

### 3.6 Tartışma sorularına güvenlik gözüyle kısa yanıt

1. *Hangi göstergeler zorunlu?* Her göstergenin **kaynağı kontrol edilebilir ve ödemeden ayrı** olmalı; para dağıtan göstergelerde ikinci termometre alarm verir, ödeme belirlemez. Liste kanunla, Y1 zincirindeki bağımsız kurulun önerisiyle.
2. *Alarm eşiğini kim belirler?* Önceden ilan edilmiş istatistik kuralı; değişiklik bilimsel kurul + nitelikli çoğunluk; seçime yakın dönemde dondurma (T6).
3. *Kamu mu sivil mi?* Karma (3.4, madde 12). Güvenlik açısından kritik olan finansmanın **kesilememesi** ve tek kaynağa bağımlılığın sınırlanması.
4. *Yanlı örnekleme nasıl düzeltilir?* Referans hane paneli ve çoklu kaynak (3.4, madde 3–4). Yalnızca açık katkıya güvenmek yetmez.
5. *Muhalefet alarmı propagandaya çevirirse?* Alarm "sarı/kırmızı" dilini ve fark ayrıştırmasını (madde 10) taşır; 30 gün açıklama süresi kamuya açık yürür. B Planı arayüzü: alarm B Planı'nı tek başına tetiklemez, yalnızca bir girdidir (T6–T7). Aksi hâlde alarm bir "devre kesici silahı" olur.

---

## 4. FA-06 — Bakış Defteri

### 4.1 Risk düzeyi

**Kritik.** Fikir doğru ve gerekli. Ama bir ülkenin en hassas verisi olan "kim kimin kaydına baktı" bilgisini tek yerde toplar ve bunun üstüne alarm ve bildirim sistemi kurar. Koruması zayıf kalırsa, çözmeye çalıştığı gözetim sorununu kendisi üretir.

### 4.2 Tehdit senaryoları

**T1 — Defter bir harita: üst veri (metadata) sızıntısı.**
1. Defterde içerik yok, yalnızca "kim (ya da hangi ajan), kime, ne zaman, hangi amaç ve yetkiyle baktı" var.
2. Bu bilgi tek başına bir istihbarat kaynağıdır: hangi hâkimin, gazetecinin, muhalif milletvekilinin ya da muhbirin dosyasına hangi birimler bakıyor; hangi soruşturmanın ne zaman yoğunlaştığı; hangi seçmen grubuna ajan baktığı.
3. Defterin bir kopyası ya da bir düğüm sahibinin görüşü sızarsa, düşman bir devlet ya da suç örgütü bu haritayla kaynak ifşa eder, kişileri hedef alır, soruşturmalardan önce haberdar olur.
4. K15'in izinli konsorsiyum zincirinde (üniversite, STK, yargı, Meclis düğümleri) **her düğüm sahibi zincire yazılan üst veriyi görür.** Yani harita tek bir yerde değil, düğüm sayısı kadar yerde durur.

**T2 — Düşük entropili "parmak izi" gizlemez.**
"Amaç ve yetkinin parmak izi" fikri, amacın yazı olarak değil özetle tutulmasıdır. Ama olası amaçlar ve yetki türleri birkaç yüz kod olabilir; bir özet alanı küçükse saldırgan tüm olasılıkları dener ve özeti geri çıkarır (sözlük saldırısı). Özet, **gizli anahtarla** (anahtarlı özet) alınmadıkça gizlilik sağlamaz. 07 (KN-10, 2.2) "anahtarlı/tuzlu özet" diyor; doğru, ama anahtarın nerede ve kimde durduğu da güvenlik meselesidir.

**T3 — Yeniden kimliklendirme ve silme hakkı paradoksu.**
Yurttaş takma adı zincirde sabit kalırsa, aynı takma adın tüm kayıtları birbirine bağlanır (bağlanabilirlik). Silme hakkı (P2) kişisel verinin silinmesini ister; takma ad ile üst veri kalırsa "silindi" demek zorlaşır. Ayrıca *görevlinin* kimliği başka bir kişisel veridir: görevlinin hesap verebilirliği ile mahremiyeti çatışır. Bir yurttaşın uygulamada görevlinin adını görmesi, misillemeye (tehdit, taciz) yol açabilir; özellikle şiddet mağduru dosyalarına bakan hekim, hâkim, sosyal hizmet uzmanı için.

**T4 — Bildirim kanalı kötüye kullanılır.**
- *Kimlik avı:* Dolandırıcı "verinize bakıldı, şu bağlantıya tıklayın" SMS'i atar. Gerçek bildirimler yurttaşı bu mesajlara alıştırır.
- *Telefondaki bildirimin başkası tarafından okunması:* Eş, işveren veya takipçi yazılımı, yurttaşın "polis bakışı" ya da "sağlık kaydına bakış" bildirimini görür; aile içi şiddet ve baskı senaryoları.
- *Bildirimin soruşturmayı ifşa etmesi:* Suçlu, "bana bakıldı" bildirimiyle haberdar olur.
- *Bildirim yağmuru:* Her gün onlarca bildirim, yurttaşı hepsine kör eder (öneri belgesi bunu zaten anıyor).
- *Hesabın ele geçirilmesi:* Saldırgan yurttaşın uygulama hesabını alır, bildirimleri kapatır ve bakışları gizler.

**T5 — Veri Kasası anahtarı.**
- *Kayıp:* Anahtar yalnızca yurttaştaysa, kaybolursa sağlık verisi bir acil durumda erişilemez.
- *Zorlama:* Eş, işveren, banka, kiraya veren "kasanı aç, defterini göster" diyebilir; "bana kimse bakmadı" ya da "kimse soruşturmadı" bir **temiz sicil belgesine** dönüşür.
- *Kırılabilir anahtar:* Devlet olağanüstü durumda anahtarı kırabiliyorsa, bütün koruma bu kapıya iner; bu kapı tek bir hedef olur.
- *Özel gruplar:* Çocuklar, yaşlılar, vasi altındakiler, dijital uçurumdaki yurttaşlar (H5) için anahtar kimdedir? Vekil ve yakın, anahtarın kötüye kullanımı için ayrı bir riski doğurur.

**T6 — İstihbarat ve soruşturma istisnası "karanlık delik" olur.**
1. Öneri "gecikmeli bildirim" diyor ama kim, ne kadar, kaç kez uzatır belirsiz.
2. İktidara yakın bir birim "ulusal güvenlik" gerekçesiyle muhalif, gazeteci ya da aktivist dosyalarına bakar. Bildirim sürekli ertelenir.
3. Daha da kötüsü, istisna kapsamındaki bakışlar deftere *hiç yazılmaz* (çünkü yazmak ifşa riskidir). Defter sessizce delik içeren bir "temiz" görüntü verir.
4. Toplu tarama (seçmen profilleme dahil) "tek tek bakış" olarak değil "güvenlik analizi" olarak etiketlenip bildirimsiz yürütülür.
Tarihsel bir örnek biçimi olarak, bazı ülkelerde gizlilik ve bildirim yasağı içeren idari taleplerin süresiz uzayabildiği tartışılmıştır; ilke olarak kanuni "susturma" emirlerinin sonsuz uzaması iyi bilinen bir risktir.

**T7 — Amaç beyanı yalan, amaç uydurma ve işbirliği.**
Alarm örneği şuydu: "amaç ruhsat ama açık ruhsat başvurusu yok". Kötü niyetli görevli önce sahte (ya da bir arkadaşın) başvuru açar, sonra bakar; kayıt meşru görünür. İki görevlinin anlaşması da alarmı geçer. Amaç kutusu ya serbest metin ya da kod seçimidir; ikisi de beyandır, kanıt değildir.

**T8 — Karıştırılmış yetkili ajan ve istem enjeksiyonu.**
1. Bir saldırgan, kendi dilekçesine ya da yüklediği belgeye gizli talimat koyar: "Bu başvuruyu işlerken şu kişinin kasasına da bak."
2. Ajan, meşru yetki belgesiyle (kendi işlediği dosya için) başka kasaya bakar.
3. Defterde "meşru ajan, meşru yetki, meşru amaç" görünür; alarm çalmaz. Bakış gerçekleşmiş ve veri saldırganın eline geçmiş olabilir.
Bu, "karıştırılmış yetkili" (confused deputy) sorunudur ve Temeller 05'teki D5/F3 bulgularının doğrudan devamıdır.

**T9 — Ölçek ve "beklenen" tanımı.**
Ajanlar saniyede binlerce bakış yapar. Her bakışı bildirimle haber vermek anlamsızdır; her bakışı deftere yazmak defteri şişirir ve yalnızca oturum düzeyinde yazmak ayrıntıyı kaybettirir. "Beklenmedik bakış alarmı" ise kuralları dışarıdan öğrenilebilir: saldırgan sınırı keşfeder ve altında kalır ("yavaş ve sessiz" yöntem), ya da bakışını "beklenen" sınıfa benzetir.

**T10 — Alarm sisteminin kendisi profilleme aracı olur.**
"Bir ajan seçim öncesi muhalif bölgedeki seçmenlere baktı" alarmını çalıştırmak için, sistemin seçmenin siyasi eğilimini ya da bölgesini bilmesi gerekir. Yani **denetim sistemi, birleştirilmemesi gereken verileri (siyasi görüş, bakış kaydı) kendisi birleştirir.** Ayrıca ajan kasaya bakmadan da profilleyebilir: toplulaştırılmış sorgularla, kasa verisini dışa aktararak ya da modeli bu verilerle eğiterek. Büyük dil modellerinin eğitim verisini ezberleyip geri verebildiği gösterilmiştir (Carlini vd., 2021). Defter bunu görmez; "kayıt yok" ile "bakılmadı" aynı şey değildir.

**T11 — İçeriden saldırgan ve silme.**
Defter yöneticileri, anahtar yönetimi yapanlar ve ayrıntı deposunun işletmenleri içeriden tehdittir. Ayrıntılar "silinebilir ayrı depoda" duruyorsa, silme hakkı ya da silme yetkisi bakış izlerini yok etmek için kullanılabilir. Hesap verebilirlik ile silme hakkı burada karşı karşıya gelir.

**T12 — Dayatma ve dijital uçurum.**
Defter çıktısı bir "sicil belgesi"ne dönüşür (işveren ya da kiraya veren ister). Uygulaması olmayan yurttaş, bu hakkı başkası üzerinden (vekil) kullanır; vekil kötüye kullanabilir.

### 4.3 Mevcut tasarım yeterli mi?

Hayır, ama temeli sağlam. Estonya'daki Veri İzleyici (X-Road üzerinde) örneği, yurttaşa kendi verisine kimin baktığını göstermenin mümkün olduğunu gösterir; öneri bunu K14 (protokol) ve K15 (defter) ile birleştirmeyi öneriyor ki bu doğru bir mimari yön. Eksik olanlar: defterin kendisinin korunması (hassas harita), düşük entropili özet sorunu, düğüm sahiplerinin görüşü, istisna rejiminin deftere zorunlu yazımı, bildirimin güvenliği, ajan bakışlarının yetki kapsamı, "kayıt yok = bakılmadı" yanılgısı ve silme hakkıyla hesap verebilirliğin uzlaştırılması.

### 4.4 Önerilen güvenceler

**A. Defterin mimarisi: üç katman, zincirde kişi yok.**
1. **Kasa:** Yurttaşın verisi; yurttaşa ait anahtar; silinebilir.
2. **Bakış kayıtları:** Şifreli, her yurttaş için ayrı anahtarla; denetim anahtarı *eşik paylaşımlıdır* (örneğin 5 parçadan 3'ü: yargı, bağımsız veri koruma kurulu, Meclis muhalefet temsilcisi vb.; hiçbir tek kurum çözemez). Saklama süresi sınırlı ve kanunla belirli.
3. **Zincir (K15):** Yalnızca **toplu kök ve zaman** (Merkle kökü) yazılır. Zincire **yurttaş takma adı, ajan kimliği ya da amaç özeti yazılmaz.** Bu, 07'nin 2.2 tasarım kararını FA-06 için daraltmaktır: "yapılandırılmış üst veri" (zaman, ajan kimliği...) zincirde değil, şifreli bakış kayıtlarında durur; zincir yalnızca "bu toplu kayıt bu anda var ve değişmedi"yi kanıtlar. Böylece her düğüm sahibi bir haritaya sahip olmaz.
4. **Anahtarlı özet:** Amaç ve yetki özetleri gizli, kasada tutulan anahtarla alınır (T2); anahtar belli aralıklarla yenilenir.
5. **Takma ad değişimi:** Yurttaş takma adı dönemsel yenilenir; bağlanabilirlik sınırlı kalır.

**B. Amaç = vaka numarası, beyan değil (T7, T8).**
- Kasaya bakmak için "amaç kutusu" yerine, **sistemin başka bir rolün işlemiyle açtığı bir vaka numarası** gerekir. Yetki belgesini ve vaka-yurttaş eşleşmesini **deterministik geçit** (K14) doğrular; model ya da görevli değil.
- Vaka kapsamı alan düzeyindedir: ruhsat için "vergi borcu var/yok" görünür, vergi kaydının tamamı değil.
- Vaka yaratmanın kendisi yurttaşın başvurusuna ya da kanuni bir tetikleyiciye bağlıdır; aynı kişinin hem vaka açıp hem bakması engellenir (iki kişi / iki rol kuralı). Sağlık, hâkim, gazeteci, avukat, milletvekili gibi hassas dosyalarda **iki kişi onayı**.
- Hız sınırı: bir görevli ya da ajan belli sürede kaç farklı kasaya bakabilir sınırlıdır.

**C. Ajan erişimi: tek vaka, tek yurttaş (T8).**
- Ajanın yetki belgesi tek vakayla, tek yurttaşın kasasıyla sınırlıdır ve kısa ömürlüdür. Toplu sorgu ve toplu dışa aktarma kasa tarafından reddedilir.
- Güvenilmeyen metni okuyan *karantina ajanının* kasaya hiç erişimi yoktur (Temeller 05: "veri talimat değildir", en az yetki).
- Kasa verisiyle model eğitimi yasaktır (Ekonomi–Yolsuzluk Ö10 mantığı; T10). Toplulaştırılmış istatistik yalnızca diferansiyel gizlilik bütçesiyle üretilir ve **bu bütçe kullanımı da deftere yazılır**.

**D. Kanarya kayıtları (T7, T11).**
Gerçek yurttaşa ait olmayan uydurma "bal kayıtları" kasada bulunur. Kimsenin bakmaması gereken bu kayıtlara bakan kişi ya da ajan anında yakalanır. Bu, H4'teki kasıtlı test dosyalarının veri tarafındaki karşılığıdır ve içerideki kötüye kullanımı yakalamanın en ucuz yollarından biridir.

**E. İstisna rejimi (T6): "yazılmayan bakış yoktur".**
Bu, önerinin en kritik güvence maddesidir. İlkeler:
1. **Her bakış deftere yazılır.** İstisna kapsamındaki bakışlar da, ama *kapalı biçimde*: içerik ve kimlik şifrelenmiş taahhüt olarak mühürlenir, yalnızca varlığı, zamanı, onaylayan hâkim kaydı ve kategori açık kalır. Yazılmayan bakış mümkün olmamalı (kasa, kaydı atlayan erişimi teknik olarak sunmaz).
2. **Hâkim onayı ve süre sınırı:** Soruşturma ve istihbarat bakışı bireysel, gerekçeli ve hâkim onaylıdır. Bildirimin gecikmesi kanunla *azami süreye* bağlıdır; her uzatma yeni bir gerekçeli kararla yapılır ve **toplam üst sınırı** vardır. Süre dolunca bildirim kendiliğinden gider, aksi bir hâkim kararı yoksa.
3. **Toplu tarama ayrı ve daha sıkı:** Bireysel bakış ile toplu tarama (profilleme, seçmen analizi) aynı rejimde değildir. Toplu tarama için ek onay, süre, kapsam ve sonradan toplu bildirim zorunludur. Seçim dönemi öncesi ajanların ve partilerin toplu tarama yetkisi yoktur (A2, B5 mantığı).
4. **Çok partili, güvenlik izinli denetim:** Bağımsız bir veri koruma kurulu ve çok partili gizli komite, istisna bakışlarının *istatistiğini* ve örneklemini denetler. Yıllık istatistik (kategori ve sayı düzeyinde) kamuya açıklanır.
5. **Ayrıntılı rejim kapsam dışıdır** (güvenlik dalgası). Bu belge yalnızca Bakış Defteri ile arayüzü tanımlar: *deftere yazım zorunluluğu, süre sınırı, denetim, yazılmama imkânsızlığı*.
Sınır: Zamanla açılan şifreleme (zaman kilidi) ve eşik anahtarlar tam güvence değildir; asıl güvence hâkimlerin ve denetim kurullarının bağımsızlığıdır (Y1).

**F. Bildirim tasarımı (T4, T9).**
- Bildirim **bağlantı içermez**: "Yeni bir bakış var, uygulamayı kendiniz açın." Bildirim kısa, imzalı ve ayrıntısızdır; hassas içerik bildirim metninde bulunmaz (başkasının okuması).
- *Üç sınıf:* (1) *Beklenen* (kendi başvurunuz için): bildirim yok, haftalık özet. (2) *Beklenmedik* (açık bir vakası olmayan bakış): bildirim. (3) *Hassas/istisna*: kanuni sürede gecikmeli.
- Alarm kuralları kısmen gizli ve değişken tutulur; ayrıca rastgele örnek bakışlar insan denetçiye gider (böylece "eşiğin altında kalma" işlemez).
- Yurttaş bildirimi, bildirim kapatma ve hesap ele geçirilmesine karşı: bildirim kapatma yeni cihaz/giriş sinyali verir, bakış kayıtları hesapla birlikte silinmez (hesap ele geçirilse bile kayıt bağımsız durur).
- Eğitim: "devlet size asla bağlantı göndermez" ilkesi.

**G. Silme hakkı ve hesap verebilirlik (T3, T11).**
- Yurttaş silme isterse kasa verisi silinir ve yurttaşı bakış kayıtlarına bağlayan anahtar yok edilir; "bir bakış oldu (kategori, zaman)" kaydı anonim kalır. Böylece görevlinin eylemi silinmez, yurttaşın kişisel verisi silinir.
- Görevlinin kimliği yurttaşa **rol ve kurum düzeyinde** görünür ("X Belediyesi ruhsat birimi"); ad yalnızca denetim kuruluna ve disiplin sürecine açıktır (misillemeyi önler).
- Bu uzlaştırma 04'te (hukuk) ve KN-10 tartışmasında ele alınan "karma değer değiştirilemez, kişisel veri silinebilir" çizgisiyle uyumludur; hukukçu tarafından ayrıca doğrulanmalıdır.

**H. Anahtar yönetimi (T5).**
- Anahtar yurttaştadır; kayıp için güvenli kurtarma yolları (insan kanalı, kimlikli başvuru, bekleme süresi) vardır. Çocuk, yaşlı ve vasi altındakiler için tanımlı vekâlet kuralları ve vekil bakışlarının ayrıca kaydı.
- **Acil durum (kırık cam):** Yurttaşın hayatı söz konusuysa (acil tıbbi erişim) çok imzalı, kayıtlı, kısa süreli ve sonradan bildirimli bir yol bulunur. Bu yol tek bir kurumda değil, eşik paylaşımlıdır. "Devlet olağanüstü durumda kırabilir mi?" sorusuna yanıtım: *tek başına hayır, yargı ve bağımsız kurumun birlikte açtığı kısıtlı bir yolla evet* ve her kullanım deftere ve sonradan yurttaşa bildirilir.
- **Sicil belgesi yasağı:** Bakış Defteri'nin işveren, banka, kiraya veren gibi üçüncü taraflara belge olarak sunulması ve istenmesi yasaktır; defter dışa aktarımı (toplu PDF) sınırlıdır.

**I. Ajan ve model gözetimi (T10).**
- Alarm kuralları **kaba bölge düzeyinde ve toplulaştırılmış** çalışır: "bir ajanın baktığı kasaların bölgelere dağılımı nüfusa göre orantısız mı?" Bireysel siyasi tercih hiçbir zaman bu denetimde kullanılmaz; bireysel oy tercihi zaten tutulmaz.
- Ajan eylemleri yalnızca "bakış" değil, dışa aktarma, toplulaştırılmış sorgu, kopya ve eğitim kayıtlarını da kapsar; "kayıt yok = bakılmadı" yanılgısı belgede açıkça uyarı olarak yer alır.

**J. Defterin kendisinin korunması.**
Defter, "kritik altyapı" sayılır: ayrı güvenlik rejimi, çevrimdışı yedek, düzenli sızma testi (kırmızı takım), tatbikat, içeriden saldırı kuralları (iki kişi ilkesi, görevler ayrılığı). Bakış defterinin haritası olduğu için, savunma Temeller F4'teki kırık cam prosedürüne ve çevrimdışı yedeklere de bağlanır.

### 4.5 Teknolojinin bugün yapamadıkları

1. **Üst veriyi hiç sızdırmadan, ama yine de denetlenebilir "kim kime baktı" kaydı tutmak.** Şifreleme, Merkle kökleri ve eşik anahtarlar riski büyük ölçüde azaltır; sıfır bilgi kanıtları (içerik gizli, "bakış kayıtlıdır" doğrulanır) ise ulusal ölçekte yaygın kullanımda değil, araştırma ve pilot düzeyinde.
2. **İçeriden kötü niyeti kesin tespit etmek.** Davranış analitiği yanlış alarm üretir, kasıtlı olarak "normal" görünen kötü niyeti kaçırır. Kanarya kayıtları yardımcı olur ama yeter değil.
3. **Bir modelin ne "öğrendiğini" ya da ezberlediğini kaydetmek.** Model eğitimi ve çıkarımı bakış kaydına düşmez; ezberlenmiş veri geri çıkabilir. Çare kayıt değil, yasak ve veri en aza indirmedir.
4. **Amaç beyanını doğrulamak.** Bir görevlinin ya da ajanın gerçek niyetini bilmek mümkün değil; yalnızca vaka bağıyla dolaylı kontrol edilir.
5. **Yorgunluk yaratmayan ama kaçırmayan bildirim eşiğini önceden bilmek.** Bu bir ödünleşimdir; gölge dönemde veriyle ayarlanır.
6. **Tüm nüfusta cihaz güvenliği ve kimlik avına dayanıklılık.** Telefona kötü yazılım ve sosyal mühendislik tamamen önlenemez.
7. **Kaybolmayan, zorlanamayan, çocuk-yaşlı-vasi dostu bir kasa anahtarı yönetimi.** Teknik olarak yapılabilir parçalar var (eşik paylaşımı, kurtarma) ama bunların hepsini kolay kullanılır ve zorlamaya dayanıklı kılmak çözülmemiş bir tasarım sorunu.
8. **Büyük kamu ağında "yazılmayan bakış yoktur" ilkesini kanıtlamak.** Kayıtsız erişim yolu bırakmamak için tüm erişim yolları tek geçitten geçmelidir; bunun eksiksiz olduğunu kanıtlamak zordur (sızma testleri bulduğunu gösterir, olmadığını değil).

### 4.6 Tartışma sorularına güvenlik gözüyle kısa yanıt

1. *Kimler hangi amaç ve yetki belgesiyle bakabilir; iktidar modeli ve partilerin erişimi nasıl sınırlanır?* Amaç = vaka (B). Parti ve iktidar modeli kasaya *kimliklendirilmiş yurttaş verisi* olarak hiç erişemez; yalnızca toplulaştırılmış, gizlilik bütçeli istatistik alır (C). İktidar modelinin ajanları kasaya yine yalnızca vaka bazında bakar.
2. *Parmak izi–silme–K15 uyumu, KN-10 okuması yeterli mi?* KN-10 okuması gerekli ama yetmez. **Zincire kişi, ajan ya da amaç alanı yazılmaz; yalnızca toplu kök yazılır** (A.3). Bu, 07'nin tasarım kararını FA-06 için sıkılaştırır.
3. *Soruşturma ve istihbarat bakışları ne zaman, hangi hâkimin denetiminde?* E bölümü: her bakış kapalı biçimde yazılır, bireysel ve hâkim onaylı, gecikmeli bildirim azami süre ve toplam sınırlıdır, toplu tarama ayrı ve daha sıkıdır. "Gecikmeli bildirim" kötüye kullanılmasın diye süre dolunca bildirim kendiliğinden gider.
4. *Bildirim yağmuru nasıl önlenir; alarm ölçütünü kim koyar?* F bölümü: üç sınıf, kısmen gizli ve değişken kurallar, rastgele insan örneklemesi. Ölçütü bağımsız veri koruma kurulu koyar; yanlış alarmın bedeli *görevli için değil süreç için* olur (ilk adım gerekçe istemek; cezai sonuç yalnızca doğrulanmış kötüye kullanımda), aksi hâlde görevliler gerekli bakışlardan kaçınır.
5. *Defterin kendisi nasıl korunur; kasa anahtarını devlet kırabilir mi?* A ve J bölümleri; H bölümündeki "kırık cam" yolu. Tek anahtar yok, tek kurum yok.

---

## 5. FA-14 — Sıra Defteri

### 5.1 Risk düzeyi

**Yüksek** (sağlık sırası). Sosyal konut, kreş, yurt ve kamu ilanında **Orta**. Öneri belgesi onu "düşük risk" sayıyor; veri güvenliği, mahremiyet ve manipülasyon açısından bu doğru değil. Ancak fikir değerlidir: kayırmayı azaltmak güvenlik kazanımıdır (K9). Mesele, kayırmanın *kaybolmayıp nereye taşınacağıdır.*

### 5.2 Tehdit senaryoları

**T1 — Kayırma formülden forma taşınır (girdi oyunu).**
1. Formül herkese açık ve adil görünüyor: "tıbbi aciliyet + bekleme süresi".
2. Kayırma artık sırayı sürüklemekte değil, **girdiyi doldurmakta**: "aciliyet" puanını giren hekim ya da memur, tanıdığına yüksek puan verir; gelir beyanı, hane büyüklüğü, belgeler sahtelenir.
3. Almanya'da 2012'de ortaya çıkan organ nakli bekleme listesi skandalı bu desenin gerçek bir örneğidir: bazı hastaların sıra kazanması için durumlarının ağır gösterildiği (verilerin gerçeğe aykırı bildirildiği) iddiaları ve ülke çapındaki incelemelerde birden çok merkezde usulsüzlük bulunması. (Sıra *kamuya açık puanlamayla* hesaplanıyordu; oyun girdideydi.) Eurotransplant'ın MELD tabanlı modeli sıranın hesabını nesnelleştirir ama girdiyi doğrulama sorununu çözmez.
4. Üretken yapay zekâ sahte rapor, tahlil ve belge üretimini ucuzlatır.

**T2 — Formül oyunu: yazan sırayı belirler.**
- *Kasıtlı:* Ağırlıklar ya da "yakınlık" ölçütü belirli bir bölgenin ya da grubun lehine ayarlanır; seçim öncesi ince bir değişiklik bir bölgeyi öne geçirir. İktidar modeli parametreleri seçmen bölgelerine göre kaydırabilir.
- *Kasıtsız:* Yanlış vekil ölçü grupları zarara uğratır. Obermeyer vd. (2019), ABD'de yaygın bir sağlık algoritmasının "sağlık harcamasını" "sağlık ihtiyacı" yerine kullandığını, bu yüzden aynı hastalık düzeyindeki siyah hastaları daha sağlıklı gösterdiğini ve ek bakıma seçilen siyah hasta sayısının yarıdan fazla azaldığını bildirdi. Formülün tarafsız görünmesi adil olduğunu göstermez.

**T3 — Sıra Atlama Gerekçesi sahteliği.**
1. Atlama yetkisi bir imza ile kullanılıyor.
2. Aciliyet gerekçesi serbest metin ya da geniş bir kategori; "acil tıbbi durum" her kapıyı açar.
3. Öne alınan, imzalayanın tanıdığıdır. Atlanan kişiye gelen "Sizden önce bir kişi öne alındı, çünkü acil tıbbi durum" mesajı bunu doğrulamaz, yalnızca örter.
4. İmzalayana baskı (müdür, yönetici, siyasi çevre) vardır; imza rutine biner.
5. *Karne baskısı:* "İstisna sayısı kurumun karnesine işlenir." Hastane yöneticisi karne için gerçek aciliyetleri atlatmaz (hasta zarar görür) ya da istisnaları sıra dışı kanallara kaydırır (aşağıya bakın).

**T4 — Kamuya açık sıradan kişi çıkarımı (mahremiyet).**
- *Farklılaşma saldırısı:* Sıra numarası ve güncelleme zamanı herkese açıksa, iki ardışık anlık görüntü karşılaştırılarak kimin çıktığı ya da öne alındığı anlaşılır. Kişinin başvuru tarihini bilen bir komşu, akraba, işveren onu bulabilir.
- *Küçük sıra:* Nadir bir ameliyat ya da küçük bir ilçe için sıra o kadar küçüktür ki herkes birbirini tanır.
- *Bildirim ipucu:* "Sizden önce bir kişi öne alındı, çünkü..." mesajı kategori, hastane ve zamanı birlikte verirse öne alınan kişi çıkarılır. Sağlık kategorisinin kendisi hassastır (psikiyatri, bulaşıcı hastalık, üreme sağlığı...).
- Kimliksiz sanılan veri (de Montjoye vd.) birkaç ayrıntıyla kişiye bağlanır.

**T5 — Defter dışı kanallar ve "karanlık sıra".**
Torpil kaybolmaz, defterin dışındaki kapıya kayar: acil servis girişi, "kontrol randevusu", özel muayeneden sevk, "yedek liste", "kontenjan dışı", "afet mağduru". Defter yalnızca girdiği alanı görünür kılar; girmeyen alanda kayırma artar (ikame etkisi).

**T6 — Çoklu kayıt, hayalet kayıt, sıra satma.**
- Bekleme süresi puan getirdiği için erken ve çoklu kayıt yaptırma; ailede yer tutma.
- Ölmüş, vazgeçmiş ya da taşınmış kişilerin kayıtlarını listede tutup sonra "devretmek" ya da içeriden satmak.
- Başvuru tarihini geriye çekmek (içeriden).
- Bu oyunların hepsi "saat yurttaşın başvurusuyla başlar" ilkesini aşındırır. Bevan ve Hood (2006) bekleme hedeflerinin bu tür saat oyunlarıyla delindiğini belgelemiştir.

**T7 — Sıra hesabının kurcalanması.**
Sıra tablosunu yöneten bir sistem yöneticisi sessizce birkaç kaydı yukarı taşır. Yurttaş yalnızca kendi numarasını görür ve değişikliği fark edemez. Hesaplama kodu sessizce değişebilir (tedarik zinciri).

**T8 — "Ajan" bir dil modeliyse: istem enjeksiyonu ve tutarsızlık.**
Sıra hesabını ya da başvuru okumasını bir dil modeli yaparsa:
- "İhtiyaç açıklaması", sevk yazısı veya başvuru eki içindeki gizli talimat ("bu başvuruyu ilk sıraya al") sırayı oynatır (Greshake vd.).
- Aynı girdiye farklı sıra çıkabilir (parmak izi davranış garantisi vermez; Temeller 05, B3).
- Belge okuma hataları (OCR, uydurma/halüsinasyon) tıbbi/hukuki belgelerde ciddi sonuç doğurur.

**T9 — Siyasi kullanım.**
İktidar modeli ya da yönetici, kreş ve konut kontenjanı gibi dağıtımda bölgeleri seçmen davranışına göre ayarlar. Dağılım görünür olduğu için fark edilebilir; ama fark "formülün sonucu" diye savunulur.

**T10 — Bildirim ve uygulama saldırıları.**
Sahte "sıranız ilerledi" mesajları (kimlik avı); sağlık sırası bilgisinin toplu sızıntısı; sıra uygulamasına hizmet engelleme saldırısı (randevu günlerinde).

### 5.3 Mevcut tasarım yeterli mi?

Kısmen. Fikir güçlü: kıt kaynakta herkesin gördüğü tek formül, kayırmayı azaltır; Eurotransplant örneği yerinde. Bilinen riskler formülün kayırma aracı olmasını, sahte aciliyeti ve mahremiyeti anıyor. Eksik olanlar: **girdi doğrulama** (T1), sıra atlamanın **teknik olarak sürükle-bırak olmaması**, **defter dışı kanalların** kapsamı (T5), kamuya açık sıradan **farklılaşma ve küçük sıra çıkarımı** (T4), **karne baskısı** (T3), hesaplamanın **dil modeli olmaması** (T8) ve sıranın **bağımsız yeniden hesabı** (T7).

### 5.4 Önerilen güvenceler

1. **Sıra hesabı bir yapay zekâ ajanı değil, deterministik hesaptır.** Formül basit, kapalı biçimli ve az sayıda doğrulanabilir girdiyle çalışır; aynı girdi her zaman aynı sırayı üretir. Dil modeli yalnızca belge okumada *yardımcı* olabilir (karantina ajanı), çıktısı sabit alanlı forma döner ve girdiyi insan ya da imzalı kaynak doğrular. Serbest metin (ihtiyaç açıklaması, sevk yazısı) **puana girmez**, yalnızca insan doğrulayıcıya gider. (T8; Temeller 05 "Söz Kapısı" ve "veri talimat değildir" ile uyumlu.)
2. **Girdiler kaynağından, imzalı gelir.** Laboratuvar sonucu, ölüm kaydı, gelir, ikamet gibi veriler ilgili kaynak sistemden doğrudan alınır; elle girilen girdi işaretlenir, ağırlığı düşer ya da ikinci kişi doğrular. Bu, Eurotransplant benzeri sistemlerin de dayandığı temel koruma: kontrol edilebilir girdi (T1).
3. **Formül yönetişimi:** Formül sürümlü ve mühürlü (Ekonomi–Yolsuzluk Ö6 ile uyumlu); değişiklik yalnızca ileriye dönük, **etki analiziyle** (bölge, yaş, cinsiyet, engellilik, gelir grubu için kim kazanır, kim kaybeder; geçmiş veriyle simülasyon) ve yetkili kurulların (uzmanlar + Yurttaş Paneli + gerekirse Meclis) onayıyla yapılır. *İki bağımsız ekip* formülü ayrı yazar, farklar yayımlanır. "Vekil ölçü testi": ölçülen şey gerçekten istenen şey mi (Obermeyer dersi)? Eşit puanlılar arasında herkese açık, **doğrulanabilir rastgelelik** (kura) kullanılır; böylece eşitlik bozma ayrıntılarında gizli kayırma kalmaz (T2).
4. **"Sürükle-bırak yok" kuralı (T3):** Sistem, bir kişiyi elle öne almayı teknik olarak desteklemez. İstisna yalnızca **formüle yazılı bir kategori puanı** olarak eklenir (örneğin klinik acil puanı). Bu kategori listesi kapalıdır, her kategorinin **nesnel kanıt şartı** vardır (laboratuvar bulgusu, olay numarası), kategori puanı kanıtla birlikte deftere yazılır.
5. **Sıra atlama imzası:** İki imza (biri klinik, biri bağımsız ikinci hekim ya da yetkili), imzacı başına kota, çatışma beyanı (akrabalık, tanıdıklık) ve **denetim kurumunda** imzalayan–öne alınan kişi arasında ortak adres, telefon, soyadı gibi ilişkileri tarayan otomatik uyarı (mahremiyet nedeniyle yalnızca denetçi görür). Rastgele geriye dönük inceleme; aşılan eşikte karar Kademe 2'ye çıkar (öneri belgesiyle uyumlu).
6. **Karne ve Goodhart (T3, T5):** İstisna sayısı **vaka karışımına göre düzeltilir** (acil hastane daha çok istisna yapar). "Az istisna" ödüllendirilmez, "çok istisna" suçlanmaz; ikisi de bağımsız örnek incelemesini tetikler. Karnede ayrıca *"gerekli ama yapılmayan atlama"* (geç kalındığı için zarar gören vaka) izlenir. Defter dışı kanallar (acil giriş, sevk, kontrol randevusu) **aynı karnede ayrı satır** olarak görünür.
7. **Kapsam bütünlüğü (T5):** Kıt kaynağın *tüm girişleri* deftere bağlanır; defter dışı her giriş kanalı ayrı ve görünür bir kategori olarak kayda geçer. Bütün girişlerin kapsamı denetim kurumunca periyodik olarak sınanır.
8. **Mahremiyet (T4):** Kamuya açık sıra **toplulaştırılmıştır**: sıra uzunluğu aralığı, ortanca bekleme süresi, istisna sayısı (kategori düzeyi). Kişi başına satır ya da kişiye ait kalıcı takma ad **yayımlanmaz.** Yurttaş yalnızca kendi sırasını, kimlik doğrulamayla görür. Güncellemeler toplu aralıklarla (günlük/haftalık) yapılır; küçük hücreler bastırılır; mümkün olan yerde diferansiyel gizlilik uygulanır. **Atlanan kişiye bildirim:** "Bu dönemde bu sırada A kategorisinde X kişi öne alındı" gibi kategori ve dönem düzeyinde; hastane, bölüm, gün ve ayrıntı yok. Küçük sıralarda (örneğin bir kişilik) bildirim geciktirilir ya da birleştirilir.
9. **Bütünlük ve yeniden hesap (T7):** Günlük sıra özeti zincire (toplu kök) yazılır; yurttaş kendi sırasının doğruluğunu kanıtlayan bir **ispat** alır. Bağımsız bir denetçi aynı girdilerle sırayı yeniden hesaplar (Temeller 05'in *yeniden oynatma* ilkesi). Sahte başvuru/hasta kayıtlarından oluşan **kanarya vakaları** sisteme verilir ve nasıl işlendikleri izlenir.
10. **Başvuru saati (T6):** Saat yurttaşın başvuru anında başlar, sistem dışından değiştirilemez ve K15 zaman damgası alır (burada K15 gerçekten değer katar). Tekil kimlik, çoklu kayıt tespiti, ölüm kaydı çapraz kontrolü, pozisyonun devredilememesi; "hâlâ bekliyorum" teyidi insan kanalı ve ara kademeyle (hemen silme yok) yapılır, dijital uçurumdaki yurttaş yok sayılmaz (H5).
11. **Bildirim güvenliği (T10):** Bildirim bağlantı içermez; yalnızca "uygulamanıza girin" der.
12. **Siyasi kullanımın izlenmesi (T9):** Sıra sonuçlarının bölgelere dağılımı bağımsız kurumca, oy tercihi kullanılmadan, kaba bölge düzeyinde sınanır (Temeller 07 Eksik #8: kayırma testi senaryoları).
13. **Pilot sırası (güvenlik gözüyle):** Önce **gölge dönem**: Defter sırayı hesaplar ama insanlar eski usulle çalışır; sonuçlar karşılaştırılır (G1). Canlıya geçişte önce düşük hassasiyetli ve nesnel doğrulanabilir bir alan (örneğin kreş ya da yurt), sonra planlı ameliyatlar; **acil durum ve nakil en sona.**

### 5.5 Teknolojinin bugün yapamadıkları

1. **Tıbbi aciliyeti otomatik, adil ve oyunlanamaz biçimde belirlemek.** Klinik karar ve doğrulama insandır; yapay zekâ en fazla hazırlık yapar.
2. **Girdi gerçekliğini otomatik doğrulamak.** Sahte rapor, tahlil ve belge görüntüsü üretmek kolaylaştı, tespit güvenilir değil.
3. **Bir formülün "adil" olduğunu kanıtlamak.** Adalet tanımları (örneğin hata oranı eşitliği ile kalibrasyon) genellikle aynı anda sağlanamaz (Kleinberg vd., 2016; Chouldechova, 2017). Seçim bir değer seçimidir ve açıkça yazılmalıdır.
4. **Kamuya açık sırayı hem faydalı hem yeniden kimliklendirilemez tutmak.** Farklılaşma saldırıları ve yardımcı bilgi, küçük sıralarda koruma bırakmaz; diferansiyel gizlilik doğruluk kaybı getirir.
5. **Dolaylı kayırmanın (vekil ölçü üzerinden) otomatik ve yanlış alarmsız tespiti.** İstatistik ancak ipucu verir; nedensel kanıt ve insan incelemesi gerekir.
6. **Sıra hesabının doğruluğunu sır vermeden herkese kanıtlamak** (sıfır bilgi kanıtlarıyla) ulusal ölçekte olgun ve yaygın değil; bugün için bağımsız denetçinin yeniden hesabı daha gerçekçi.
7. **Sistem dışı torpili (telefon, kapı, tanıdık) yazılımla önlemek.** Teknoloji yalnızca sistem içini görünür kılar.
8. **Dil modeliyle belge okumanın güvenilir olması.** Hata, uydurma ve enjeksiyon riski sürüyor; bu yüzden hesap deterministik, okuma doğrulamalı olmalı.

### 5.6 Tartışma sorularına güvenlik gözüyle kısa yanıt

1. *Hangi kaynaklar girer, tek model mi?* Tek *güvenlik çerçevesi* (deterministik hesap, imzalı girdi, sürükle-bırak yok, toplulaştırılmış yayın), alan alan farklı formül.
2. *Formülü kim yazar, mühürlenir mi, kayırma aracı olursa kim yakalar?* İki bağımsız ekip, uzman kurul + Yurttaş Paneli + Meclis onayı; sonuçtan önce mühürlenir; etki analizi ve bağımsız yeniden hesap yakalar (madde 3, 9, 12).
3. *Sıra atlama kim imzalar, bildirimde ne söylenir?* İki imza, kapalı kategori, kategori ve dönem düzeyinde bildirim (madde 4, 5, 8).
4. *Kamuya açık sıra ile mahremiyet nasıl dengelenir?* Kamuya açık toplulaştırılmış, kişi kendi sırasını görür (madde 8).
5. *Sahte aciliyet ve oyunlama nasıl izlenir, eşik ne?* Vaka karışımına göre düzeltilmiş istisna oranı, kanarya vakaları, rastgele inceleme; kesin sayısal eşik gölge dönemde veriyle belirlenir. Eşik aşıldığında karar Kademe 2'ye çıkar (madde 5–6).

---

## 6. Ortak sorulara güvenlik gözüyle yanıt

**Ortak soru 1 — Erişim kademeleri tablosu (öneri; Ekonomi Y5 Halk Ajanı ile tutarlılık için hakem tarafından taşınmalı).**

| Kim | Ne görebilir | Sınır |
|---|---|---|
| **Yurttaş** | Kendi bakış kayıtları (rol ve kurum düzeyinde), kendi sırası, kendi katkıları | Başkasının hiçbir bilgisi; sicil belgesi üretimi yasak |
| **Görevli** | Kendi bakışları; yalnızca vakası için gereken alanlar | Vaka bağı ve yetki belgesi şart; hız sınırı; hassas dosyada iki kişi onayı |
| **Ajan** | Tek vaka, tek yurttaş kapsamında kısa ömürlü yetki | Toplu sorgu ve dışa aktarma yok; karantina ajanı kasaya erişemez |
| **Gazeteci / araştırmacı** | Toplulaştırılmış, gizlilik bütçeli istatistik (kurum başına bakış sayısı, ortanca bekleme, istisna oranı, ölçüm serileri) | Kişi ya da küçük hücre düzeyi yok; gizlilik bütçesi deftere yazılır |
| **Denetçi (Bağımsız Veri Koruma Kurulu, Model/Teknik Denetim Kurulu)** | Örneklem ve kural dışı bakışlar; eşik anahtarla çözüm | Eşik paylaşımı; her çözüm kayıtlı |
| **Hâkim** | Dosya bazında, gerekçeli karar üzerine | İstisna rejimi kuralları (azami süre, uzatma sınırı) |
| **Parti / iktidar modeli** | Yalnızca toplulaştırılmış istatistik | Kasa içeriği, bakış kayıtları ve sıra verisine kimliklendirilmiş erişim yok |

**Ortak soru 2 — Hiçbir koşulda birleştirilemeyecek bilgiler.**
1. Sağlık sırası ↔ siyasi görüş / oy tercihi ↔ bakış kaydı.
2. İkinci Termometre katkıcısının kimliği ↔ sepet içeriği ↔ siyasi katılım çağrıları.
3. Kasa içeriği ↔ model eğitimi (hiçbir yapay zekâ modeli kasa verisiyle eğitilemez).
4. Sıra Defteri'ndeki sağlık kategorisi ↔ konut ve sosyal yardım kaydı.
5. Bakış kaydı ↔ işveren, banka, kiraya veren gibi üçüncü taraf sorguları.
Bunların uygulanması *iyi niyete* değil, **protokol geçidine (K14)** bağlanır: veri ayrılığı, kuvvetler ayrılığı gibi kod düzeyinde zorlanır; birleştirme yalnızca yargı kararıyla, tek vaka için, kayıtlı ve süreli olarak mümkündür.

**Ortak soru 3 — Pilot sırası.**
Önerilen sıra (FA-06 → FA-14 ve FA-04) güvenlik açısından da mantıklı, bir ayrımla: **önce FA-06'nın kuralları** (erişim kademeleri, geçit, istisna rejimi, zincire kişi yazılmaması) yazılır ve test edilir. Ama canlı bir ulusal "kim kime baktı" haritası oluşturmak, korumalar sınanmadan **en son** yapılmalıdır. Öneri:
1. *Gölge dönem:* Üç fikir de yetkisiz çalışır. FA-06 dar bir alanda (tek kurum) denenir, FA-14 sırayı hesaplar ama insanlar eski usulle işler, FA-04 yalnızca ölçer ve **alarm bilgi verir, Kademe 2'ye çıkarmaz.**
2. *Başarı ölçütleri:* Kırmızı takım bulguları, yeniden kimliklendirme testleri, sızıntı tatbikatı sonuçları, yanlış alarm ve kaçırma oranları, sahte katkıyı yakalama oranı, yurttaşın bildirimleri anlayıp anlamadığı (Yurttaş Paneli ile sınanır).
3. *Canlıya geçiş* yukarıdaki ölçütleri ve bağımsız denetimi geçtikten sonra, Meclis onayıyla; hata durumunda geri dönüş planı (G2) hazır.

---

## 7. Temeller 05 ve 07 ile tutarlılık tablosu

| Temellerden gelen ilke | Bu belgede nerede |
|---|---|
| "Veri talimat değildir", karantina ajanı, en az yetki (05, D5/F3; 07, K14) | FA-04 T4/3.4-7; FA-06 T8/4.4-C; FA-14 T8/5.4-1 |
| Deterministik geçit: yetkiyi kod doğrular (05, F3; 07, 2.1) | FA-06 4.4-B; Ortak soru 2 (veri ayrılığı protokolde) |
| Bilgi katmanı yönetişimi, tetikleyici göstergeler (05, B1 Tehdit B; 07, B1 madde 8) | FA-04 bütünüyle; T6–T7; 3.4-1, 3.4-3 |
| Yeniden oynatma denetimi (05, B7; 07, B1 madde 9) | FA-04 3.4-9; FA-14 5.4-9 |
| Tek yönlü çıkrık (07, B1 madde 5) | FA-04 3.4-2 (kademe yükselmesi güvenli yön); yöntem değişikliği ileriye dönük |
| Kanarya / kasıtlı test kayıtları (05, H4) | FA-06 4.4-D; FA-14 5.4-9 |
| Kayıt = denetlenebilir iz, delil değil (07, 2.2; F2) | FA-04 T10/3.4-14 |
| K15 tasarımı: izinli konsorsiyum zinciri, kişisel veri zincirde değil, parmak izi (07, 2.2; KN-10) | FA-06 4.4-A (daraltılmış: zincirde yalnızca toplu kök) |
| Y1 Atama Anayasası, Y2 Bağımsız İstatistik Kurumu (07, 4.1) | FA-04 3.4-11/12; FA-06 4.4-E/H |
| Ö6 ölçüt mühürleme (Ekonomi–Yolsuzluk 03) | FA-04 3.4-8; FA-14 5.4-3 |
| Ö10 geçmiş kararlarla eğitmeme (Ekonomi–Yolsuzluk 03) | FA-06 4.4-C (kasa verisiyle eğitim yasağı) |
| Geçim ödemeleri aksamaz; Yurttaş Güvence Paketi (07, F4/4.4) | FA-04 3.4-1/2 |
| Gölge dönem, geri dönüş planı (G1, G2) | Ortak soru 3 |
| "Sertifika/güvenlidir" dili yerine "şu koşullarda ve sınırlar içinde" (05, 07 4.2) | Her fikirde "bugün yapılamayanlar" bölümü |

---

## 8. En kritik 5 risk

1. **Bakış Defteri'nin kendisinin "kim kime baktı" haritasına ve hedefe dönüşmesi (FA-06).** Üst veri tek başına istihbarattır; düğüm sahipleri, düşük entropili özetler ve bağlanabilir takma adlar haritayı yayar. *Düzeyi: Kritik.* Çare: zincirde yalnızca toplu kök, şifreli ve eşik anahtarlı bakış kayıtları, anahtarlı özet, defterin kritik altyapı gibi korunması (4.4-A, J).
2. **İstihbarat ve soruşturma istisnasının "yazılmayan bakış"a ve süresiz gecikmeye dönüşmesi (FA-06).** İstisna deftere hiç yazılmazsa defter bir güven yanılsaması olur; yazılırsa ama süresiz ertelenirse bildirim hakkı anlamsızlaşır. *Düzeyi: Kritik.* Çare: "yazılmayan bakış yoktur" ilkesi, hâkim onayı, azami süre ve toplam sınır, toplu taramaya ayrı sıkı rejim, çok partili denetim (4.4-E).
3. **İkinci Termometre'nin silaha dönüşmesi (FA-04).** Sahte ve yanlı yurttaş katkısıyla alarmı çaldırmak (hizmet engelleme, "resmî rakam yalan" kampanyası) ya da susturmak mümkün; ölçü paraya ya da B Planı'na bağlanırsa milyonlarca kişiye sahte katkı teşviki doğar. *Düzeyi: Yüksek, bağlanırsa Kritik.* Çare: alarm ödemeyi belirlemez, iki bağımsız kaynak ve referans panel, mühürlü yöntem, dar ve süreli Kademe 2, fişin cihazda işlenmesi (3.4-1–9).
4. **Sıra Defteri'nde kayırmanın girdiye, gerekçeye ve defter dışı kanallara kayması (FA-14).** Formül açık olsa da hekimin girdiği aciliyet, sahte belge, tek imzalı atlama ve acil servis gibi dış kapılar kayırmayı sürdürür; karne baskısı hem sahtekârlığı hem gerçek aciliyetlerin atlanmamasını doğurur. *Düzeyi: Yüksek.* Çare: imzalı kaynak girdisi, sürükle-bırak yok, kapalı kategori ve iki imza, vaka karışımına göre karne, tüm girişleri kapsayan defter, bağımsız yeniden hesap (5.4).
5. **Yurttaş girdisi üzerinden ajanlara istem enjeksiyonu ve karıştırılmış yetkili ajan (üç fikirde ortak).** Fiş, ihtiyaç beyanı, sevk yazısı, dilekçe, "amaç" kutusu; ajanı başka kasaya baktırabilir, ölçümü tahrif edebilir, sırayı oynatabilir. Etkili ve genel bir çözüm bugün yok (Nasr vd., 2025). *Düzeyi: Yüksek, tasarım ihmal edilirse Kritik.* Çare: veri talimat değildir, karantina ajanı, tek vaka–tek yurttaş yetkisi, deterministik hesap (dil modeli yok), serbest metnin puana ve kayda girmemesi.

**Yakın adaylar:** "Kimliksiz" sanılan verinin yeniden kimliklendirilmesi (fiş, kamuya açık sıra, takma adlar), kasa anahtarının kaybı ve zorlanması, bu üç fikrin dayandığı kurulların ele geçirilmesi (Y1), alarm ve bildirim yorgunluğu.

---

## 9. Hakem için: karar gerektiren noktalar

Bu üç fikir kurucu tercihi değildir; aşağıdakiler hakemin karara bağlaması için öneridir. K1–K17'ye dokunan bir itiraz yoktur.

1. **İkinci Termometre ödeme belirlemez.** Hiçbir otomatik ödeme, endeks ya da B Planı tetikleyicisi doğrudan bu ölçüye bağlanmaz; yalnızca insan incelemesi tetikler. (T6–T7.)
2. **Zincire kişi, ajan ve amaç alanı yazılmaz; yalnızca toplu kök yazılır** (FA-06). Bu, 07'nin K15 tasarım kararını sıkılaştırır; KN-10'daki "parmak izi okuması" yeterli değildir, çünkü anahtarlı özet bile sabit bir takma adla bağlanabilir. Kurucunun K15 okumasına (verinin kendisi değil parmak izi) uygun kalır.
3. **"Yazılmayan bakış yoktur" ilkesi** istisna rejiminin ön koşuludur. Ayrıntılı rejim güvenlik dalgasına bırakılsa bile bu ilke şimdiden karara bağlanmalıdır.
4. **Sıra hesabı yapay zekâ ajanı değil deterministik hesaptır** (FA-14). "Sıra, kamuya ilan edilmiş tek bir formülle ajan tarafından hesaplanır" ifadesi "formülle deterministik olarak hesaplanır" biçiminde düzeltilmelidir.
5. **Pilot sırası ve gölge dönem** (Ortak soru 3): önce kurallar, sonra gölge, canlı defter en son.
6. **Hukukçuya iletilecek soru:** Bakış kaydının varlığı (kategori ve zaman) silme hakkının dışında kalabilir mi; görevlinin kimliği yurttaşa hangi düzeyde gösterilebilir (rol ve kurum)?

**Bu belgenin sınırları:** Senaryolar kavramsaldır; bir saldırının gerçekte ne kadar kolay olacağı tasarımın ayrıntılarına bağlıdır. Bilimsel atıflar kısa özetlerdir. Yeniden kimliklendirme riskinin sayısal değerlendirmesi, istatistik tasarımı (ağırlıklandırma, alarm eşiği) ve klinik sıra formülleri bu belgenin dışında kalan uzmanlıklar (istatistikçi, veri koruma hukukçusu, sağlık politikası uzmanı) tarafından ayrıca ele alınmalıdır.

---

## 10. Kaynaklar

Aşağıda (T) bu oturumda arama ya da sayfa okumasıyla başlık, künye ve temel bulgusu teyit edilen kaynakları, (B) yaygın bilinen ancak bu oturumda ayrıca doğrulanmayan kaynakları gösterir.

**Proje içi belgeler**
1. Temeller Tartışması 05 — Yapay Zekâ Güvenliği İncelemesi (`../2026-11-08-temeller/05-guvenlik-incelemesi.md`).
2. Temeller Tartışması 07 — Savunma (`../2026-11-08-temeller/07-savunma.md`), özellikle B1, F2, F3, F4, bölüm 2.1–2.2 (K14, K15), bölüm 4.1 (Y1, Y2), KN-10.
3. Görünür Devlet Tartışması 01 — Öneriler ve Sorular (`01-oneri.md`).
4. Ekonomi–Yolsuzluk Tartışması 03 — Yolsuzluk İncelemesi (Y3, Ö6, Ö7, Ö10).

**Yapay zekâ güvenliği**
5. Greshake, K. vd. (2023). *Not what you've signed up for: Compromising Real-World LLM-Integrated Applications with Indirect Prompt Injection.* arXiv:2302.12173. https://arxiv.org/abs/2302.12173 (T: başlık ve künye)
6. Nasr, M. vd. (2025). *The Attacker Moves Second: Stronger Adaptive Attacks Bypass Defenses Against LLM Jailbreaks and Prompt Injections.* arXiv:2510.09023. https://arxiv.org/abs/2510.09023 (T)
7. Debenedetti, E. vd. (2025). *Defeating Prompt Injections by Design* (CaMeL). arXiv:2503.18813. https://arxiv.org/abs/2503.18813 (T)
8. Souly, A. vd. / Anthropic (2025). *Poisoning attacks on LLMs require a near-constant number of poison samples.* arXiv:2510.07192; duyuru: https://www.anthropic.com/research/small-samples-poison (T)
9. Carlini, N. vd. (2021). *Extracting Training Data from Large Language Models.* USENIX Security 2021. (B)

**Gizlilik, yeniden kimliklendirme ve ölçüm**
10. de Montjoye, Y.-A. vd. (2015). *Unique in the shopping mall: On the reidentifiability of credit card metadata.* Science. https://dspace.mit.edu/handle/1721.1/96321 (T: dört zaman-mekân noktası, 1,1 milyon kişinin yaklaşık %90'ı)
11. Narayanan, A. ve Shmatikov, V. (2008). *Robust De-anonymization of Large Sparse Datasets.* IEEE S&P. arXiv:cs/0610105. https://arxiv.org/abs/cs/0610105 (T: başlık ve künye)
12. Douceur, J. R. (2002). *The Sybil Attack.* IPTPS 2002. (B)
13. Dwork, C. ve Roth, A. (2014). *The Algorithmic Foundations of Differential Privacy.* (B)
14. Cavallo, A. ve Rigobon, R. (2016). *The Billion Prices Project: Using Online Prices for Measurement and Research.* Journal of Economic Perspectives, 30(2). https://www.hks.harvard.edu/centers/cid/publications/billion-prices-project-using-online-prices-inflation-measurement-and (T: başlık ve künye; çevrimiçi fiyatları kullanması öneri belgesinde de belirtilmiştir; Arjantin bağlamı ve IMF'nin 2013 tutumu (B))
15. Estonya X-Road "Veri İzleyici" (Data Tracker) uygulaması: öneri belgesinde (FA-06) gerçek dünya dayanağı olarak belirtilmiştir; bu oturumda ayrıca doğrulanmadı. (B)

**Sıra, kayırma ve adalet**
16. Obermeyer, Z. vd. (2019). *Dissecting racial bias in an algorithm used to manage the health of populations.* Science. https://chmi.berkeley.edu/news/dissecting-racial-bias-in-an-algorithm-used-to-manage-the-health-of-populations (T: sağlık harcamasının ihtiyaç yerine vekil olarak kullanılması; ek bakıma seçilen siyah hasta sayısında yarıdan fazla azalma)
17. Bevan, G. ve Hood, C. (2006). *What's measured is what matters: targets and gaming in the English public health care system.* Public Administration. https://researchonline.lse.ac.uk/id/eprint/16211 (T: başlık ve künye)
18. Almanya organ nakli bekleme listesi usulsüzlükleri (2012 ve sonrası incelemeler): The Local (Almanya), 30 Eylül 2014. https://www.thelocal.de/20140930/berlin-heart-centre-fiddled-transplant-list (T: ülke çapındaki incelemede birden çok merkezde usulsüzlük bulunduğu; bazı ilgili kovuşturmaların sonuçları bu belgede ayrıca doğrulanmadı ve hiçbir kişi hakkında hüküm iddia edilmemiştir.)
19. Kleinberg, J., Mullainathan, S. ve Raghavan, M. (2016). *Inherent Trade-Offs in the Fair Determination of Risk Scores.* arXiv:1609.05807; Chouldechova, A. (2017). *Fair prediction with disparate impact.* (B)
20. Eurotransplant karaciğer tahsisinde MELD puanı: öneri belgesinde (FA-14) gerçek dünya dayanağı olarak belirtilmiştir; bu oturumda ayrıca doğrulanmadı. (B)
21. Goodhart yasası (Strathern'in formülasyonu, 1997): "Bir ölçü hedef olunca iyi bir ölçü olmaktan çıkar." (B)
