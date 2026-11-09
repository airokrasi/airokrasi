# Ekonomi ve Yolsuzluk Tartışması — 11: Güvenlik Uzmanı Yanıtı (Karar 36)

- **Hazırlayan:** Yapay zekâ güvenliği ajanı
- **Tarih:** 2026-11-08
- **Dayanak:** 09-hakem-karari.md (Karar 36, bölüm 9 Soru 2), 07b-savunma-yolsuzluk.md (B2 madde 4 ve 9, B6, FA-15), Görünür Devlet 02-guvenlik-incelemesi.md, Temeller 05 ve 07 (F1, F4).

**Kısa yanıt:** (1) "Kimliksiz" risk skoru aslında *takma adlı* veridir; açık veriyle birleştirilince kimlik çıkar. Risk Yüksektir ve skor işlem düzeyinde, kaba ve toplulaştırılmış tutulup bağımsız bir "bağlama saldırısı" testinden geçmeden devreye girmemelidir. (2) Üç bileşen için tek bir cevap yok: ihbar kanalında tam ayrım gerekir, BBK'da ayrı yönetim düzlemi ve ayrı anahtar yeter (fiziksel ayrım tetikleyicili ikinci aşama), Halk Ajanı'nda mantıksal ayrım ve çoğaltma yeter. Ayrımın derecesini belirleyen şey ortak bağımlılık haritası olmalıdır.

---

## Soru 1 — Kimliksiz risk skorlarında yeniden kimliklendirme riski ve yönetimi

### Değerlendirme

- **Ad yanlış.** Skor kimlik taşımıyor ama bir dosyaya, kuruma ya da kişiye *takma adla* bağlı. Bu, anonim değil takma adlı veridir; hukuken ve teknik olarak kişisel veri sayılması gerekir.
- **Asıl sorun açık veridir.** Skor ihale, sözleşme ve ödeme kayıtlarından türüyor, bu kayıtlar ise Karar 43 ile zaten kamuya açık (Kazananlar Haritası, Büyük Dosyalar Panosu). Skorun yanında ihale numarası, kurum, tarih, tutar ya da sinyal türü kalırsa, açık veriyle eşleştirme birkaç adımda kişiyi ya da kurumu bulur. Literatür bunun genel bir kural olduğunu gösteriyor: dört zaman-mekân noktası 1,1 milyon kişinin yaklaşık %90'ını ayırt etmeye yetti (de Montjoye vd., 2015); "anonim" bir veri kümesi dışarıdaki bilgiyle yeniden kimliklendirildi (Narayanan ve Shmatikov, 2008).
- **Küçük gruplar en açık nokta.** Yerel yönetimde tek bir ihale yetkilisi ya da tek bir şirket olabilir. Bir kişilik hücrede "kimliksiz" skor fiilen adlıdır.
- **Gerçek koruma "kimliksizlik" değil, kimliği açma kapısıdır.** Savunmadaki fikir (kimliğin açılması insan kararıyla, gerekçeli ve kayıtlı) doğru; ama skor dışarı sızarsa ya da kurum içinde yaygın dolaşırsa bu kapı atlanır.

### Risk

**Yüksek.** Sonuç, yanlış etiketin kişiye yapışmasıdır ("yüksek riskli"): itibar zararı, siyasi silah olarak kullanım (seçici uygulama kaygısı, Karar 35) ve sızıntı durumunda geri alınamaz damga. Kimlik açılmadan bile kişi hakkında hüküm kurulmuş olur. Karar 36'nın geçici metni (gölge dönem, yalnızca uyarı) doğru ve yeterli bir ilk fren; kalıcı çözüm değil.

### Öneri

1. **Doğru adlandırma:** "Kimliksiz" yerine "takma adlı risk skoru"; veri koruma etki değerlendirmesi başlamadan yayımlanır.
2. **Skor işlem düzeyinde olsun, kişi düzeyinde değil.** Ölçü ihale dosyası, sözleşme ya da kurum işlemi olur. Kişi ya da şirket bazında birikmiş skor üretilmez; kişiye bağlama yalnızca kimlik açma kararıyla, dosya bazında olur.
3. **Kaba skor, toplulaştırılmış yayın.** BBK içinde üç kademe (izle, incele, öncelikli) yeter; ham sayı ve bileşen dökümü yalnızca ilgili dosya ekibinde kalır. BBK dışına yalnızca kurum/bölge/yıl düzeyinde toplulaştırılmış, küçük hücreleri bastırılmış (en az N işlem, [H] başlangıç değeri) ve gürültü eklenmiş (diferansiyel gizlilik) istatistik çıkar. Gizlilik bütçesi kullanımı deftere yazılır.
4. **Bağlama anahtarlarını kopar.** Skor, ihale numarası ya da açık kayıtta aranabilir hiçbir alanla birlikte tutulmaz; takma ad anahtarlıdır, dosya bazlıdır ve dönemsel yenilenir. Böylece aynı kişinin skorları zaman içinde birleştirilemez.
5. **Kimlik açma kapısı:** Çok üyeli kurul, gerekçeli ve kayıtlı karar; eşik paylaşımlı anahtar (tek kişi çözemez); her açma Bakış Defteri mantığıyla kayda geçer (Görünür Devlet 02, FA-06); açılan kişiye bilgi ve savunma hakkı; yanlış pozitif oranı yayımlanır.
6. **Devreye girmeden önce bağımsız sınav.** Kırmızı takım, açık veriyi kullanarak skorları kişi ve kuruma bağlamayı dener (bağlama saldırısı). Sonuç yayımlanır; belirlenen eşik geçilmeden skor BBK dışında hiçbir biçimde paylaşılmaz ve "yalnızca uyarı" konumunda kalır. Bu, Karar 46'daki "eşik tutarsa devreye girer" mantığıyla aynıdır.
7. **Veri sınırları:** Yurttaş Payı ödeme verisi, mal varlığı taramaları ve sağlık/sosyal verisi skora girmez (Karar 35). Skor modeli geçmiş soruşturma kararlarıyla eğitilmez (Ö10), açıklanabilir ve önceden yayımlı ölçüte dayanır.

**Teknolojinin bugün yapamadıkları:** Açık veriyle bağlamaya karşı *garantili* anonimlik yoktur; küçük gruplarda diferansiyel gizlilik ya doğruluğu bozar ya da koruma bırakmaz. Bu yüzden öneri riski azaltır, sıfırlamaz; "güvenlidir" denmemeli, "şu testlerde, şu sınırlar içinde" denmelidir.

---

## Soru 2 — BBK, ihbar kanalı ve Halk Ajanı: mantıksal ayrım yeter mi, tam fiziksel ayrım gerekir mi?

### Değerlendirme

- **Tehdit modeli:** K6 gereği devlet sinir ağını iktidar modeli ve onun atadığı yöneticiler işletiyor. Düşman, ağın yönetim düzlemine erişen ayrıcalıklı bir yönetici ya da onu ele geçiren biridir.
- **Mantıksal ayrımın sınırı:** Ayrı kiracı ve ayrı anahtar, veri *içeriğini* korur; ama aynı bulut ya da aynı yönetim düzleminde, yönetici kiracıları durdurabilir, kopyalayabilir, sürüm değiştirebilir ve üst veriyi (kim ne zaman bağlandı, trafik miktarı, dosya boyutu) görebilir. Bu, ihbar kanalı için içeriğin kendisi kadar tehlikelidir (ihbarcının kanala bağlandığının bilinmesi yeter).
- **Fiziksel ayrımın sınırı:** Tam fiziksel ayrım tek başına yetmez, çünkü gerçek bağımlılıklar başka yerde: ortak alt yüklenici, ortak çip ve donanım yazılımı, ortak yazılım bileşeni, ortak kimlik ve sertifika sağlayıcısı, ortak güncelleme kanalı, ortak personel, ortak ağ omurgası. "Ayrı tedarikçi" aynı alt tedarikçiye çıkabilir. Ayrıca dört küçük ayrı altyapı (ödeme, BBK, ihbar, Halk Ajanı) küçük güvenlik ekipleri ve geç yamalar demektir; fiziksel ayrım, kötü işletilirse daha zayıf bir hedef üretir.
- **Dolayısıyla cevap bileşene göre değişir.** Ayrımın derecesi bileşenin gizlilik ve bütünlük hassasiyetine bağlanmalı.

### Risk

| Bileşen | Ana risk | Mantıksal ayrım yeter mi | Düzey (yetersizse) |
|---|---|---|---|
| **İhbar kanalı** | İhbarcının kimliği ve varlığının iktidar tarafından görülmesi, kanalın kapatılması | **Hayır.** Tam ayrım gerekir. | Kritik |
| **BBK** | Seçici uygulama, soruşturma bilgisinin sızması, BBK'nın durdurulması | **Kısmen.** Ayrı yönetim düzlemi ve BBK'ya ait anahtar şart; fiziksel ayrım ikinci aşama. | Yüksek |
| **Halk Ajanı** | Sahte bulgu, kesinti (kişisel veri erişimi zaten kapalı, yalnızca okuma) | **Evet,** çoğaltmayla birlikte. | Orta |

### Öneri

1. **İhbar kanalı: tam ayrım (yönetim, tedarikçi, hesaplama ve ağ).** Sinir ağından ayrı yönetim düzlemi ve kök kimlik; ayrı tedarikçi ve alt yüklenici zinciri; kanalın yönetim ve hesaplaması iktidar operatörünün erişemediği ayrı kuruluşta (yargı, Meclis denetim komisyonu ya da bağımsız sivil kuruluş); anahtarlar bu kuruluşların kontrolündeki donanım güvenlik modüllerinde ve parçalı; ağ düzeyinde trafik/üst veri koruması (kanala bağlanmanın sinir ağından izlenememesi). Hacim düşük olduğu için maliyeti de düşüktür; Karar 36'nın "maliyet tablosu yazılamıyorsa devreye girmez" kuralı burada kolay işler.
2. **BBK: ayrı yönetim düzlemi + BBK'ya ait anahtar yönetimi + çoklu tedarikçi.** Koşullar: (i) hesaplama ayrı kiracıdan öte ayrı *organizasyon hesabı* ve ayrı kök kimlikte olur, sinir ağı operatörü yönetim düzlemine giremez; (ii) veri şifreli saklanır, anahtar BBK'dadır (eşik paylaşımlı); (iii) sinir ağıyla yalnızca K14 geçidi üzerinden, kayıtlı ve dosya bazlı veri alışverişi (bölünmüş erişim, Karar 35); (iv) düzenli sızma testi ve tatbikat. **Fiziksel ayrıma geçiş tetikleyicisi önceden yazılır:** bağımsız sızma testinin yönetim düzlemi bulgusu, BBK'ya yönelik belgelenmiş baskı ya da bağımsız kurulun kararı. Taşınabilirlik (bir gün fiziksel ayrıma geçebilme) baştan tasarlanır; maliyeti ayrı kalemdir.
3. **Halk Ajanı: mantıksal ayrım yeter, koruma çoğaltmadan gelir.** En az iki bağımsız uygulama ve bağımsız barındırma zaten kararda (FA-15); yalnızca okuma ve kişisel veriye kapalı olduğundan gizlilik riski düşüktür. Halk Ajanı'nın BBK ve ihbar verisine hiçbir erişimi olmaması, altyapı ayrımından çok *erişim kuralıdır* ve açıkça yazılmalıdır.
4. **Ortak bağımlılık haritası (F4) ayrımın ölçüsü olur.** Satırlar bileşenler, sütunlar bağımlılıklar: bulut/donanım, çip, yazılım bileşenleri, model soyu, kimlik ve anahtar, ağ/alan adı/sertifika, güncelleme kanalı, alt yüklenici/personel, enerji/konum, hukuki yargı alanı. Kurallar: ihbar kanalı ile devlet sinir ağı arasında yönetim, anahtar, tedarikçi ve alt yüklenici bakımından *sıfır* ortak hücre; BBK ile sinir ağı arasında yönetim ve anahtarda sıfır, enerji ve ağ omurgasında kayıtlı ve yedekli ortaklık kabul. Harita yılda bir güncellenir, bağımsız denetçi (Sayıştay Bütünlük Denetim Dairesi) doğrular ve yayımlanır; tek hata noktası hücreleri kırmızı gösterilir. Model soyu da haritada yer alır: BBK, ihbar ve Halk Ajanı ajanları iktidar modelinin soyundan olmamalı (Temeller 05, soy çizelgesi).
5. **Karar 36 geçici metnine ek öneri:** "İhbar kanalı ayrı altyapıda" hükmü korunsun ve "yönetim düzlemi ve tedarik zinciri dahil" diye netleşsin; BBK için "ayrı yönetim ve anahtar" hükmüne "tam fiziksel ayrım tetikleyicili ikinci aşama" eklensin; bileşen bazında maliyet tablosu zorunlu olsun.

**Teknolojinin bugün yapamadıkları:** Kamu bulutu yöneticisine karşı mantıksal izolasyonun tam kanıtlanması (yönetim düzlemi ve yan kanal saldırıları); şifreli hesaplama donanımlarının üretici güvenine ve yan kanal açıklarına bağımlılığı; trafik analizine karşı ihbarcıyı tam gizlemek (karışım ağları kısmi koruma sağlar). Bunlar genel teknik bilgidir, bu oturumda ayrıca kaynak doğrulaması yapılmadı. Bu yüzden ihbar kanalı için tek katmana güvenilmez; ayrım, parçalı şifreleme ve iki bağımsız alım birlikte işler.

---

## Hakem için özet

| Konu | Önerim |
|---|---|
| Skorun adı ve niteliği | "Takma adlı"; kişisel veri sayılır |
| Skor devreye giriş koşulu | Bağımsız bağlama saldırısı testi geçilene kadar yalnızca BBK içi uyarı (Karar 36 geçici metni korunur) |
| İhbar kanalı | Tam ayrım (yönetim, tedarikçi, hesaplama, ağ) |
| BBK | Ayrı yönetim düzlemi ve BBK anahtarı; fiziksel ayrım tetikleyicili |
| Halk Ajanı | Mantıksal ayrım + çoğaltma; BBK/ihbar verisine erişim yok |
| F4 haritası | Ayrım derecesinin ölçüsü; sıfır ortak yönetim/anahtar kuralı |

**Kaynaklar:** de Montjoye, Y.-A. vd. (2015), *Unique in the shopping mall*, Science; Narayanan, A. ve Shmatikov, V. (2008), *Robust De-anonymization of Large Sparse Datasets*; Görünür Devlet 02-guvenlik-incelemesi.md; Temeller 05 ve 07 (soy çizelgesi, F1, F4); Ekonomi–Yolsuzluk 09 (Karar 35, 36, 42, 43, 46).
