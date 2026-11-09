# Görünür Devlet Tartışması — 01: Öneriler ve Sorular

- **Kaynak:** Fikir ajanı (fikirler, fikir-havuzu.md), gündem hakemi (seçim ve sorular, fikir-havuzu-karari.md); organizatör yalnızca derledi
- **Tarih:** 2026-11-08
- **Not:** Bu fikirler kurucu tercihi değildir; tartışmada sabit değil, eleştiriye tamamen açıktır. K1–K17 kurucu tercihleri sabittir (bkz. ../2026-11-08-temeller/01-oneri.md, 01b-kurucu-ekleri.md, ../2026-11-08-ekonomi-yolsuzluk/01-oneri.md).

## Öneriler (fikir havuzundan aynen)

### FA-04 — İkinci Termometre: iktidarın dokunamayacağı paralel ölçüm *(zayıflık kapatır)*

**Dert:** Mühürlü model sözüne sadık kalsa bile "bilgi katmanı" iktidarın elinde oynanırsa model dünyayı yanlış görür ve seçmen farkına varmaz (05 risk #2; 03 D13; 02 Eksik #4). Arjantin'de resmî enflasyon rakamlarına güven 2000'lerin sonunda çöktü; MIT'den Cavallo ve Rigobon'un çevrimiçi fiyatları derleyen Billion Prices Project'i o dönemde bağımsız bir ikinci ölçü sundu. Bugün bizim tasarımda böyle bir "ikinci ölçü" yok.

**Fikir:** Kritik her resmî gösterge (enflasyon, işsizlik, yoksulluk, ameliyat bekleme süresi, hava kalitesi, afet hasarı) için kanunla bir **İkinci Termometre** kurulur: farklı yöntemle, farklı kaynaktan, yurttaş katkılı ve devletten bağımsız yürüyen bir ölçüm. Yurttaşlar kendi alışveriş fişlerini (kimliksiz) bağışlar, açık sensör ağları ve üniversiteler katkı verir. İki ölçü arasındaki fark önceden ilan edilmiş eşiği aşarsa **Veri Alarmı** çalar: Bağımsız İstatistik Kurumu otuz gün içinde farkı açıklamak zorundadır ve alarm sürerken o göstergeye bağlı yürütme kararları Kademe 2'ye çıkar. Alarm, FA-02'deki B Planı eşiklerinin de hakemidir. Örneğin: Resmî enflasyon yüzde 20 görünürken yurttaş sepeti yüzde 35 gösteriyorsa, kira ve yurttaş maaşı güncellemeleri insan onayına gider ve fark kamuya açıklanır.

**Neden Airokrasiye uygun:** İ4 (şeffaflık) ve İ2 (egemenlik halkındır) ilkelerini bilgi alanına taşır. Savunma belgesindeki "Bağımsız İstatistik Kurumu" (Y2) fikrine dış kontrol ekler. K15'te (blokzincir) ölçüm kayıtlarının zaman damgasını güvenceye alır.

**Bilinen riskler:**
- Yurttaş verisi manipüle edilebilir (sahte fiş, bot, belirli bir bölgenin aşırı temsili); dijital eşitsizlik ölçümü çarpıtır.
- Alarm eşiği yanlış kurulursa sürekli çalar ve alarm yorgunluğu doğar, ya da hiç çalmaz.
- Muhalefet "resmî rakam yalan" propagandası için ikinci termometreyi silaha çevirebilir.

**Tartışılacak soru:** Alarm eşiğini hangi istatistik kuralı belirler, kim değiştirebilir? İkinci Termometre kamu finansmanlı olmalı mı (bağımlılık), yoksa tamamen sivil mi (kaynak sorunu)?

**Cesaret düzeyi:** Orta.

---

### FA-06 — Bakış Defteri: "Verilerime kim baktı?"

**Dert:** Ajanlar çoğaldıkça ve devlet verisi birleştikçe şu soru cevapsız kalıyor: komşumun kaydıma bakmadığını, memurun düşmanlık için dosyama girmediğini, bir ajanın seçim öncesi beni profillemediğini nereden bileceğim? 06'daki yurttaşın dördüncü sorusu ("Verilerim ne olacak? Beni fişleyecek mi?") ve R10 (gözetim devleti) tam bu boşluğa işaret ediyor.

**Fikir:** Her yurttaşın kendi **Veri Kasası** olur ve devletin hiçbir ajanı ya da görevlisi, K14 protokolü üzerinden "amaç ve yetki belgesi" taşımadan o kasaya bakamaz. Her bakış (kim ya da hangi ajan, hangi amaç, hangi yetkiyle) K15 defterine yazılır, ama deftere kişisel veri değil yalnızca amaç ve yetkinin parmak izi girer (P2'deki silme hakkı çelişkisini bu çözer); ayrıntı silinebilir ayrı depoda durur. Yurttaş kendi **Bakış Defteri**'ni uygulamada ya da Yurttaş Masası'nda görür. Alışılmadık bakışlarda otomatik alarm çalar: bir görevli kısa sürede yüzlerce kayda baktıysa, ya da bir ajan seçimden önce muhalif bölgedeki seçmenlere bakmışsa. Örneğin: Ahmet'in vergi kaydına belediyeden bir görevli bakmış, amaç kutusu "ruhsat" ama Ahmet'in açık bir ruhsat başvurusu yok; Ahmet'e bildirim gider, görevliden gerekçe istenir, gerekçe yetersizse disiplin süreci başlar.

*(Gerçek dünya dayanağı: Estonya'nın X-Road altyapısı üzerindeki "Data Tracker" (Veri İzleyici) uygulaması, yurttaşa kendi verisine hangi kurumun baktığını gösteriyor.)*

**Neden Airokrasiye uygun:** Ek Protokol'deki "veri onuru hakkı" (04) ile K14 ve K15'i birleştirir. Teknolojiye açık kurucu tarzıyla uyumlu: protokol, defter ve yurttaş uygulaması tek bir hat.

**Bilinen riskler:**
- Bildirim yağmuru: yurttaş her gün onlarca "baktılar" bildirimi alırsa hiçbirine bakmaz (alarm yorgunluğu).
- Güvenlik, istihbarat ve ceza soruşturması istisnaları yeni bir delik açar; "gecikmeli bildirim" kötüye kullanılabilir.
- Bakış Defteri'nin kendisi (kim kime bakıyor) çok hassas bir veri haritasıdır; saldırganlar için yeni bir hedef doğurur.

**Tartışılacak soru:** Soruşturma ve istihbarat bakışları ne zaman, kimin (hâkim?) denetiminde bildirilir? Kasanın anahtarı sadece yurttaşta mı kalmalı, yoksa devlet olağanüstü durumda kırabilmeli mi?

**Cesaret düzeyi:** Orta.

---

### FA-14 — Sıra Defteri: torpile kapalı sıra

**Dert:** Kıt kamu kaynaklarının hepsi sırayla dağıtılır ve sıra torpille atlanır: hastanede ameliyat ve randevu, sosyal konut, kreş, yurt, kamu ilanı. Kayırmacılık (K9) en çok burada, gündelik hayatta, "tanıdığım var mı?" sorusunda hissedilir. Sağlık gibi yurttaşın hayatına doğrudan dokunan alanlar repoda hiç ele alınmamış.

**Fikir:** Her kıt kamu kaynağı için herkese açık bir **Sıra Defteri** kurulur. Sıra, kamuya ilan edilmiş tek bir formülle ajan tarafından hesaplanır: ameliyatta tıbbi aciliyet ve bekleme süresi, sosyal konutta ihtiyaç ve bekleme süresi, kreşte ihtiyaç ve yakınlık gibi. Hiç kimse "bilen" aracılığıyla sıra atlayamaz. İstisna gerekiyorsa (acil tıbbi durum, afet mağduru) imzalı bir **Sıra Atlama Gerekçesi** yazılır ve atlanan kişiye kimliksiz bir bildirim gider: "Sizden önce bir kişi öne alındı, çünkü...". İstisna sayısı kurumun karnesine işlenir. Her yurttaş kendi sırasını anlık görür. Örneğin: Diz protezi bekleyen bir hasta uygulamada "47. sıradasınız, tahmini süre 11 hafta" görür; birisi öne alınırsa, bu bir tıbbi aciliyet olarak kayda geçer ve hasta bildirim alır; aynı hastane bir ayda kaç istisna yaptıysa kamuya açıktır.

*(Gerçek dünya dayanağı: Eurotransplant'ın karaciğer nakli tahsisi, kamuya açık puanlama (MELD) ile işler; sıra hesaplanır, tanıdık hesap edilmez.)*

**Neden Airokrasiye uygun:** K9 ve K12 ile uyumlu: kayırmacılığı ve kuyruk yönetiminin insan emeğini birlikte azaltır. İ4 şeffaflık ilkesini hizmetin tam ortasına koyar. Düşük riskli, görünür bir başlangıç noktasıdır (G1 pilot).

**Bilinen riskler:**
- Formülü yazan sırayı belirler (Y3, algoritmik kayırmacılık); formülün kendisi kayırma aracı olabilir.
- Aşırı katı formül gerçek aciliyeti kaçırır; "gerekçe yazarak atlama" sahte aciliyet beyanına dönüşür.
- Sağlık ve sosyal ihtiyaç verisi içeren sıra bilgisinin mahremiyeti; kamuya açık sıra kimliksiz ve özetli olmalı.

**Tartışılacak soru:** Formülü kim ve nasıl yazar (Yurttaş Paneli, uzmanlar, Meclis)? Atlanan kişiye gönderilen bildirimin ayrıntısı, öne alınan kişinin mahremiyetini ne kadar ihlal eder?

**Cesaret düzeyi:** Düşük.

---


## Gündem hakeminin kapsam tanımı ve tartışma soruları

## 3. Üçüncü tartışma: önerilen ad ve kapsam

### Önerilen ad

**Görünür Devlet: Ölçüm, Sıra ve Veri Gözetimi**

Önerilen klasör: `docs/tartismalar/<tarih>-gorunur-devlet/` (YONTEM.md dosya düzenine göre).

### Kapsam

Tartışma üç soruyu birlikte ele alır:
1. **Devlet dünyayı doğru mu görüyor?** (FA-04 İkinci Termometre)
2. **Devlet yurttaşa kim, ne için bakıyor?** (FA-06 Bakış Defteri)
3. **Kıt kamu hizmetinde sıra kimde ve herkes görebiliyor mu?** (FA-14 Sıra Defteri)

Ortak zemin K14 (protokol) ve K15 (defter). Ortak gerilimler: şeffaflık ile mahremiyet, ölçü ile Goodhart, formül ile algoritmik kayırmacılık.

**Önerilen sıra:** Önce FA-06 (zemin kuralları: kim neye bakabilir), sonra FA-14 ve FA-04 paralel. FA-14'ün kamuya açık sırası ile FA-04'ün yurttaş katkılı verisi FA-06'nın kurallarına dayanıyor.

**Kapsam dışı (başka yerde ele alınıyor):** B Planı ve düzeltme kapıları (Temeller B1), rant kararları (Ekonomi Y4), basın ve Halk Ajanı (Ekonomi Y5), istihbarat ve soruşturma rejiminin ayrıntıları (güvenlik dalgası), sağlık hizmetinin tamamı (yalnızca sıra yönetimi bu tartışmada).

**Uzman önerisi (organizatör seçer):** veri koruma hukukçusu, istatistikçi / ölçüm uzmanı, sağlık ve sosyal politika uzmanı (sıra formülleri için), yapay zekâ güvenliği uzmanı (defterin kendisinin hedef olması, yeniden kimliklendirme), yurttaş gözü.

### FA-06 — Bakış Defteri: tartışma soruları

1. Yurttaşın Veri Kasası'na kimler, hangi "amaç ve yetki belgesiyle" bakabilir? Belgeyi kim verir, kim denetler? İktidar modelinin ve partilerin veriye erişimi bu belgeyle nasıl sınırlanır?
2. Deftere kişisel veri yazmadan yalnızca amaç ve yetkinin parmak izini yazmak, K15'in "veriler" ifadesi ve silme hakkıyla nasıl bağdaşır? Kurucunun savunmadaki KN-10 okumasına ihtiyaç var mı?
3. Soruşturma ve istihbarat bakışları ne zaman, hangi hâkimin denetiminde ve ne kadar gecikmeyle bildirilir? "Gecikmeli bildirim" nasıl kötüye kullanılmaz?
4. Bildirim yağmurunu nasıl önleriz? Hangi bakışlar yurttaşa bildirilir, hangileri yalnızca defterde kalır? Alışılmadık bakış alarmının ölçütünü kim koyar, yanlış alarmın bedeli ne olur?
5. Bakış Defteri'nin kendisi "kim kime bakıyor" haritasıdır. Nasıl korunur? Kasanın anahtarı yalnızca yurttaşta mı kalır, devlet olağanüstü durumda kırabilir mi?

### FA-14 — Sıra Defteri: tartışma soruları

1. Hangi kamu kaynakları Sıra Defteri'ne girer (ameliyat, sosyal konut, kreş, yurt, kamu ilanı)? Hepsi için tek model mi, alan alan farklı formül mü?
2. Sıra formülünü kim yazar (uzmanlar, Yurttaş Paneli, Meclis)? Formül sonuçtan önce mühürlenir mi (Ekonomi–Yolsuzluk Ö6 ile uyum)? Formülün kendisi kayırma aracı olursa bunu kim, nasıl yakalar?
3. Sıra atlama istisnası kim tarafından imzalanır? Atlanan kişiye ne söylenir? Öne alınan kişinin sağlık ve ihtiyaç verisi bildirimden nasıl korunur?
4. Kamuya açık sıra ile mahremiyet nasıl dengelenir? Sıra numarası ve tahmini süre görünürken kimliğin gizli kalması hangi açıklık düzeyinde sağlanır?
5. Sahte aciliyet beyanı ve formüle göre oynama nasıl izlenir? İstisna sayısı hangi eşiği aşınca kurum karnesinde alarm çalar ve karar kategorisi Kademe 2'ye çıkar? Pilot nerede başlar (G1)?

### FA-04 — İkinci Termometre: tartışma soruları

1. Hangi göstergeler için İkinci Termometre zorunlu olur (enflasyon, işsizlik, bekleme süresi, hava kalitesi)? Bu liste kanunla mı belirlenir, kimin elindedir?
2. Alarm eşiğini hangi istatistik kuralı belirler, kim değiştirebilir? Alarm yorgunluğu ve hiç çalmama riski nasıl dengelenir?
3. Termometre kamu finansmanlı mı, sivil mi? Bağımlılık mı kaynak sorunu mu seçilir? Bağımsızlığın atama zinciri Temeller'deki Atama Anayasası (Y1) ile nasıl bağlanır?
4. Yurttaş katkısı (kimliksiz fiş, açık sensör) sahte veri, bot ve dijital eşitsizlik yüzünden yanlı örnekleme üretirse bunu nasıl ölçer ve düzeltiriz?
5. Alarm çalınca "bağlı yürütme kararları Kademe 2'ye çıkar" kuralı hangi kararları kapsar? Muhalefet alarmı "resmî rakam yalan" propagandasına çevirirse ne olur? Temeller'deki B Planı fikri (FA-02) için hangi arayüz sunulur?

### Ortak sorular (üç fikir için)

1. Yurttaş, görevli, gazeteci / araştırmacı, denetçi için ortak bir erişim kademeleri tablosu nasıl yazılır? (Bu tablo Ekonomi Y5'teki Halk Ajanı tartışmasıyla tutarlı olmalı; organizatör iki hakem arasında taşır.)
2. Hangi bilgiler hiçbir koşulda birleştirilemez (örneğin sağlık sırası, siyasi görüş ve bakış kaydı)?
3. Gölge dönemde ve pilotta (G1) hangisi önce denenir, başarı ölçütü nedir?

---

