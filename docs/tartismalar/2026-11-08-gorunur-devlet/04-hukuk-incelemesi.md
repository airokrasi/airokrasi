# Görünür Devlet Tartışması — 04: Hukuki İnceleme

- **Hazırlayan:** Anayasa hukukçusu ajan
- **Tarih:** 2026-11-08

## 0. Kapsam, yöntem ve okuma notu

İncelenen fikirler: **FA-04 İkinci Termometre**, **FA-06 Bakış Defteri / Veri Kasası**, **FA-14 Sıra Defteri**. Bu fikirler kurucu tercihi değildir; bu yüzden "bırakılsın" ya da "ciddi biçimde değiştirilsin" demekte serbestim. Ortak zemin K14 (ajan protokolü) ve K15 (blokzincir defteri) kurucu tercihidir; ona dokunmuyorum, yalnızca nasıl okunması gerektiğini söylüyorum.

- **Madde numarası notu:** Görevde geçen "m. 15 erişim hakkı" ve "m. 17 silme hakkı" **GDPR** maddeleridir. Türkiye'deki karşılıkları KVKK **m. 11** (ilgili kişinin hakları) ve **m. 7** (silme, yok etme, anonim hâle getirme) maddeleridir.
- Türkiye hukuku asıl çerçevedir; AB ve AİHM kaynakları Türkiye'yi doğrudan bağlamaz ya da bağlama biçimi farklıdır (AİHM kararları Türkiye'yi bağlar, AB hukuku bağlamaz). Karşılaştırma ve ikna edici emsal olarak kullanıldı.
- **[Doğrulanmalı]** işareti, bilgi birikimime dayanan ama bu oturumda kaynağından kontrol edemediğim yerleri gösterir. Hiçbir ayrıntıyı uydurmadım.
- Bu bir tasarım için ön hukuki değerlendirmedir; uygulamadan önce Türk veri koruma, idare ve sağlık hukuku uzmanlarının görüşü alınmalıdır.

### Kısa sonuç

| Fikir | Hüküm | Tek cümlelik gerekçe |
|---|---|---|
| **FA-06 Bakış Defteri** | Düzeltilmeli | Erişim kaydı hukuken desteklenir ve hatta gereklidir; ama zincire ne yazıldığı, istisna rejimi ve "anahtar yalnızca yurttaşta" varsayımı hukuken olduğu gibi çalışmaz. |
| **FA-14 Sıra Defteri** | Düzeltilmeli | Amaç (torpilin kapatılması) hukuken çok sağlam; asıl iş, formülün kanuni dayanağı, yargısal denetimi ve sağlık verisinin korunmasıdır. Sağlıkta ilk pilot olmamalı. |
| **FA-04 İkinci Termometre** | Düzeltilmeli | Bağımsız ölçüm fikri hukuken savunulabilir; ama "yurttaş ölçümünün alarmıyla hukuki sonuç doğurmak" ayrı bir yasal çerçeve, hakem ve yayım koruması ister. |

---

## 1. FA-06 — Bakış Defteri / Veri Kasası

### Hukuki değerlendirme

**a) Temel hukuki zemin: erişim kaydı bir lüks değil, güvencenin parçasıdır.**

- Anayasa m. 20/3 kişisel verilerin korunmasını güvence altına alır; AİHS m. 8 özel hayata saygı hakkını verir.
- AİHM, **I / Finlandiya** (2008) kararında bir hastanenin hasta kayıtlarına yetkisiz erişimi engelleyecek ve **kimin ne zaman baktığını** gösterecek bir sistem kurmamasını m. 8 ihlali saydı. Hemşire, kayıtlarına kimin baktığını öğrenemedi (hastane yalnızca son beş erişimi kaydediyordu) ve ispat yükü bu yüzden ona kalmıştı. Karar, devletin sonradan dava hakkı tanımakla yetinemeyeceğini, **uygulamada etkili koruma** sağlaması gerektiğini söyler.
- Yani FA-06'nın özü (her erişim kaydedilir, yurttaş görebilir, olağandışı erişim alarmı) hukuken **savunulabilir ve yönü doğrudur**.

**b) AB'de ve Türkiye'de erişim hakkı bugün nereye kadar gidiyor?**

- **GDPR m. 15** erişim hakkı, kişiye hangi verisinin işlendiğini, amacı ve alıcıları öğrenme imkânı verir. **AB Adalet Divanı, C-579/21 Pankki S** (2023): bir kişi, verilerine **ne zaman ve neden** bakıldığını (erişim kayıtlarını) öğrenebilir. Buna karşılık, bakan **çalışanların kimliği** genel olarak bu hakkın kapsamında değildir; yalnızca kişinin haklarını kullanabilmesi için zorunluysa ve çalışanların hakları tartıldıktan sonra verilebilir. [Karar basın bülteninden okundu; tam metin doğrulanmalı]
- **KVKK m. 11/1**: kişi işlenip işlenmediğini öğrenme, bilgi talep etme, amacı öğrenme, aktarıldığı üçüncü kişileri bilme haklarına sahiptir. Kurum içinde bakan personel "aktarım" olmadığı için, KVKK'da **"kim baktı" diye soran açık bir hak yok** gibi görünüyor. [Doğrulanmalı]
- **Sonuç:** FA-06, bugünkü hakkın **ötesinde** yeni bir hak yaratır (Ek Protokol'deki "veri onuru" ile aynı hat). Bu yeni hak kanunla verilmeli; çalışanın kendisi de veri sahibi olduğu için (Pankki) "kim" yerine **"hangi birim ve rol"** gösterilmesi hukuken daha sağlamdır. Kişi adı, hak ihlali şüphesinde bağımsız bir kurum (veri koruma kurumu, Bütünlük Kurumu, hâkim) aracılığıyla açılır.

**c) Blokzincirdeki "parmak izi" kişisel veri mi?** (K15 ve KN-10 okuması)

- Kişisel veri, "kimliği belirli veya belirlenebilir gerçek kişiye ilişkin her türlü bilgi"dir (GDPR m. 4/1; KVKK m. 3). Kimliği belirlenebilirlik, "makul olarak kullanılması muhtemel araçlar" ölçütüne göre değerlendirilir (GDPR Gerekçe 26).
- **Tek yönlü özet (hash) tek başına anonim değildir.** Bir erişim olayının özeti, olay zamanı, kasa/kayıt numarası ya da ayrı depodaki kayıtla birlikte düşünüldüğünde, o kayıtları elinde tutan için kişiyi belirlenebilir kılar. AB Veri Koruma Kurulu'nun blokzincir kılavuzu (02/2025) **tuzsuz/anahtarsız özetin yeterli gizlilik vermediğini**, özetin başka tanımlayıcılarla birlikte kişisel veri sayıldığını, kişisel veriyi zincirde tutmaktan **kaçınılmasını**, zincirde en fazla "varlık kanıtı" tutulmasını söyler. İyi tasarlanmış bir kriptografik taahhüt, asıl veri silinince işe yaramaz hâle gelebilir. [Bir web kaynağına göre kılavuzun nihai sürümü 2026 Temmuz'unda kabul edilmiş; doğrulanmalı. Taslak sürüm Nisan 2025'tir.]
- **AB Adalet Divanı, EDPS / SRB (C-413/23 P, 4 Eylül 2025):** Takma adlı veri, "her durumda ve herkes için" kişisel veri değildir; alıcının kimliği belirleme araçlarına bakılır. Ama veri sorumlusunun bilgilendirme yükümlülüğü açısından, kimlik belirlenebilirliği sorumlunun gözünden ve toplama anında değerlendirilir. **Çıkarım:** zincirdeki özeti tutan düğümler için kişisel veri olmayabilir, ama **ayrı depoyu elinde tutan devlet için kişisel veridir.** Güvenli varsayım: *kişisel veri sayılır* diye tasarlamak.
- **Silme (GDPR m. 17, KVKK m. 7) ve zincir:** Zincirden fiziksel silme genelde imkânsızdır. Kılavuza göre çözüm: silme talebinde zincirdeki bilgiyi fiilen **anonim/işe yaramaz** kılmak ve **zincir dışı** kişisel veriyi silmek. Bunun için her kayıtta **rastgele ve ayrı tutulan tuz** (veya taahhüt) kullanılır; tuz ve ayrıntı silinince zincirdeki özet kimseyi göstermez. Bu çözümün "gerçek anonimlik" sayılıp sayılmayacağı tartışmalıdır. [Doğrulanmalı]
- **Silme hakkı mutlak değil.** GDPR m. 17/3 hukuki yükümlülük, kamu görevi ve hukuki iddiaların korunması hâllerinde silmeyi sınırlar. Erişim kaydının tutulması **kanunla zorunlu** kılınırsa silme talebi reddedilebilir; ama saklama süresi sınırlı olmalıdır (GDPR m. 5/1-e; KVKK m. 4 ve Silme Yönetmeliği). **Süre dolunca tuz silinir ve kayıt anlamsızlaşır.**
- **K15 okuması (KN-10):** "Veriler zincirde tutulur" ifadesi, kişisel verinin **kendisinin** zincire yazılması anlamına gelirse hukuken uygulanamaz. Okuma "zincirde yalnızca tuzlu özet ve üst veri tutulur; kişisel veri ayrı ve silinebilir depoda" olmalıdır.
- **Veri sorumlusu kim?** Çok kurumlu izinli zincirde her kurum zincirin bir kopyasını tutar. Hangi kurumun erişim/silme taleplerini yanıtlayacağı belirsizleşmemeli; GDPR m. 26 ortak veri sorumluluğuna yer verir, KVKK'da ortak sorumluluk daha az açık. [Doğrulanmalı] Kanun, **tek bir "sorumlu kurum"** adlandırmalıdır.

**d) Ulusal güvenlik ve ceza soruşturması istisnaları, gecikmeli bildirim.**

- AİHM gözetim içtihadı tek tek bakışları değil, **rejimin güvencelerini** denetler. **Big Brother Watch / Birleşik Krallık** (Büyük Daire, 2021): toplu iletişim dinlemesi başlı başına yasak değildir, ama "uçtan uca güvence" ister: her aşamada gereklilik ve ölçülülük değerlendirmesi, **yürütmeden bağımsız yetkilendirme**, süreç boyunca denetim ve **sonradan bağımsız inceleme**. İngiltere'nin rejimi, yetkilendirmeyi bakana bırakması, seçicilerin (arama terimlerinin) başvuruda belirtilmemesi ve gazeteci materyaline bağımsız denetim bulunmaması nedeniyle m. 8 ve 10'u ihlal etti. [Basın bülteninden okundu]
- **Gecikmeli bildirim:** Klass / Almanya (1978), Zakharov / Rusya (2015, BD) ve Szabó ve Vissy / Macaristan (2016) çizgisinde ilke, gizli tedbirden etkilenen kişiye, **tedbirin amacını tehlikeye atmayacak ilk andan itibaren** bildirim yapılmasıdır; bu, etkili başvuru yolunun şartıdır. AB Adalet Divanı da (Tele2 Sverige, 2016; La Quadrature du Net, 2020) benzer bildirim ödevini kabul etti. [Hepsi doğrulanmalı; Big Brother Watch'ın bildirim konusundaki tutumunu okuyamadım]
- **GDPR ulusal güvenlik faaliyetlerini kapsamaz** (m. 2/2-a). Kolluk için ayrı bir Direktif (2016/680) vardır ve bilgilendirme/erişim haklarını sınırlamaya, hatta dolaylı erişim (denetim kurumu aracılığıyla) yoluna izin verir. [Doğrulanmalı]
- **KVKK m. 28:** Millî güvenlik, kamu güvenliği ve istihbari faaliyetler Kanun kapsamı dışında; suç önleme/soruşturma için bazı hakların (aydınlatma, ilgili kişi hakları, sicil) uygulanmadığı kısmi istisnalar var. [Bent ve kapsam doğrulanmalı] Bu genel muafiyetler, Bakış Defteri'nin **"gecikmeli ve gizli" kısmı için yeterli kanun kalitesini sağlamaz.** AİHM'e göre müdahale, erişilebilir, öngörülebilir ve keyfîliğe karşı güvenceli bir kanuna dayanmalıdır.
- **Siyasi görüş verisi:** AİHM, güvenlik servisinin kişilerin siyasi görüşüne dair dosya tutmasını m. 8, 10, 11 yönünden ihlal saymıştır (Segerstedt-Wiberg / İsveç, 2006; Catt / Birleşik Krallık, 2019). [Doğrulanmalı] FA-06'nın "ajan seçimden önce muhalif bölgedeki seçmenlere baktı" alarmı güzel bir amaç taşır, ama alarmı üretmek **siyasi eğilim çıkarımı** gerektirir. Bu analiz yalnızca **bağımsız denetçi ortamında ve toplulaştırılmış veriyle** yapılmalı.

**e) "Veri Kasası" kavramı ve veri birleştirme.**

- "Kasa" tek bir devlet deposu anlamına gelirse, kişi hakkında bütün devlet verisinin tek yerde birleşmesi **orantılılık** itirazı doğurur. Alman Federal Anayasa Mahkemesi'nin Nüfus Sayımı kararı (1983) ve Mikrozensus kararı, kişiliğin **bütünüyle kaydedilmesini ve kataloglanmasını** anayasaya aykırı saydı. [Doğrulanmalı] Avusturya'nın sektöre özgü kimlik numaraları yaklaşımı (veri alanları arası birleştirmeyi engeller) benzer kaygıya cevap verir. [Doğrulanmalı]
- Hukuken güvenli okuma: Kasa, **federatif bir görünüm** olsun (veriler kaynak kurumlarda kalır, X-Road mantığı); birleşik bir "kişi dosyası" oluşturulmasın.

**f) "Kasanın anahtarı yalnızca yurttaşta" hukuken çalışmaz.** Devletin vergi, yargı kararı, kolluk, çocuğun korunması, hayati menfaat gibi **yasal görevleri**, yurttaşın iznine bağlanamaz. Doğru model "yurttaş izin verir" değil, **"yurttaş bilgi sahibi olur ve itiraz eder"**dir. Acil durumda "kasa kırma" (break-glass) usulü: bağımsız hâkim/gözetim kurumu yetkisi, anında kayıt, sonradan inceleme.

**g) Görevli kendisi de veri sahibi ve çalışandır.**

- **Disiplin:** Otomatik alarm tek başına disiplin gerekçesi olamaz; Anayasa m. 129 savunma hakkını güvenceye alır. Alarm bir **sinyaldir**, kanıt değil; yüzlerce kayda bakmak vergi denetçisi için olağan olabilir (rol bazlı ölçüt gerekir).
- **İzleme:** AİHM, çalışanın izlenmesinde önceden bilgilendirme, ölçülülük ve güvence arar (Bărbulescu / Romanya, 2017 BD; López Ribalda / İspanya, 2019 BD). [Doğrulanmalı]

**h) Bildirim yağmuru.** Hukuken her bakışı yurttaşa bildirme zorunluluğu yok. Zorunlu bildirimler dar: veri ihlali (GDPR m. 34; KVKK m. 12) ve gizli gözetim sonrası bildirim. Gerisi tasarım tercihidir: **çekme** (yurttaş kendisi bakar) + **itme** (yalnızca anomali).

### Risk

1. **Zincirde kişisel veri:** Silme/düzeltme talepleriyle çatışma, yüksek idari para cezası ve güven kaybı.
2. **İstisnaların yeni delik olması:** Kanun kalitesi düşükse AİHM önünde m. 8 ihlali; "gecikmeli bildirim" süresiz sessizliğe dönüşür.
3. **Defterin kendisi bir hedef:** "Kim kime baktı" haritası, istihbarat görevlilerinin ve soruşturmaların ifşasına yol açabilir. Güvenlik yükümlülüğü (KVKK m. 12) ağırdır.
4. **Zorla gösterilen defter:** Ev içi şiddet gibi durumlarda biri, mağdura "defterini göster" diye baskı yapabilir. Bakış Defteri'nin kendisi bir baskı aracına dönüşebilir.
5. **Tek kasa:** Veri birleştirme ve orantılılık itirazı.
6. **Çalışan hakları:** Disiplinde otomatik alarm; izleme bilgilendirmesi eksikliği.
7. **Siyasi profilleme:** Alarm üretmek için siyasi eğilim çıkarmak.
8. **Kontrolör belirsizliği:** Çok düğümlü zincirde hak talebinin muhatabı bilinmez.

### Öneri

1. **Zincirde yalnızca** kayıt-başına rastgele tuzlu özet/taahhüt ve teknik üst veri; kişisel veri, kimlik, amaç ayrıntısı ayrı ve silinebilir depoda. Kanunda saklama süresi yazılsın; süre sonunda tuz silinsin.
2. **Tek sorumlu kurum** kanunla adlandırılsın; zincirdeki düğümler yalnızca teknik işleyici olsun.
3. **Üç erişim sınıfı** kanunda tanımlansın:
   - *Olağan idari erişim:* yurttaş ilk bakışta görür (birim + rol + amaç kategorisi).
   - *Soruşturma/istihbarat erişimi:* hâkim (veya Big Brother Watch ölçütünü karşılayan bağımsız organ) izni; yurttaşa gecikmeli bildirim.
   - *Acil erişim (break-glass):* anında kayıt, kısa sürede bağımsız inceleme.
4. **Gecikmeli bildirimin kötüye kullanılmaması için:** (a) gecikmeye yargı izni; (b) azami süre ve her uzatmaya gerekçeli yeni izin; (c) süre sonunda **otomatik bildirim**, aksi hâlde hâkim kararı gerekir; (d) bağımsız gözetim kurumu "karanlık günlüğü"nün tamamını görür; (e) bildirimsizlik istatistikleri yılda bir yayımlanır; (f) bildirimden sonra kişinin itiraz ve inceleme hakkı.
5. **İstisna rejimi KVKK m. 28'in genel muafiyetine bırakılmasın**; özel bir kanunla sınırları yazılsın.
6. **Görevli kimliği:** Yurttaşa birim ve rol gösterilir; ad yalnızca bağımsız kuruma ve ihlal soruşturmasında açılır. Çalışanlar önceden bilgilendirilsin; alarm **sinyaldir**, disiplin kararı insan kararıdır ve savunma hakkı verilir.
7. **Defterin korunması:** Defter, kişisel veri gibi korunur; yurttaş görünümü ek doğrulama ister ve **başkasına zorla gösterilmesini** zorlaştıran seçenekler sunar (gizli mod, geç görünüm gibi).
8. **Alarm ölçütleri** (rol bazlı eşik, siyasi bölge çıkarımı) bağımsız denetçi kurumca belirlensin; siyasi eğilim analizi yalnızca toplulaştırılmış veriyle ve denetim ortamında yapılsın.
9. **Kasa federatif bir görünüm** olsun; sağlık sırası, siyasi görüş ve bakış kaydı gibi kategoriler **birleştirilmesin** (aşağıda §5).
10. **Pilot:** Önce yalnızca *olağan idari erişim* kaydı ve yurttaşın görünümü; soruşturma/istihbarat kısmı ayrı kanun çıkana kadar kapsam dışı kalsın.

---

## 2. FA-14 — Sıra Defteri

### Hukuki değerlendirme

**a) Eşitlik ve ayrımcılık yasağı.**

- Anayasa m. 10 kanun önünde eşitliği, AİHS m. 14 ayrımcılık yasağını, MSHS m. 26 kanun önünde eşit korunmayı güvenceye alır. Farklı muamele, **nesnel ve makul bir gerekçeye** dayanıyorsa eşitliğe aykırı değildir (Belçika Dil Davası, 1968).
- **Tıbbi aciliyet, hastalığın şiddeti, bekleme süresi, başarı şansı** nesnel ölçütlerdir. **Torpil, makam talebi, tanışıklık, siyasi sadakat** ise hiçbir makul gerekçeye dayanmaz; Sıra Defteri'nin temel fikri hukuken sağlamdır.
- **Pozitif ayrımcılık:** Anayasa m. 10, çocuklar, yaşlılar, engelliler, şehit yakınları ve gaziler için alınacak tedbirlerin eşitliğe aykırı sayılamayacağını söyler. Yani kanunla tanımlanmış öncelik grupları meşrudur. [Madde metni doğrulanmalı]
- **Dolaylı ayrımcılık:** Görünüşte tarafsız ölçütler belirli grupları orantısız etkileyebilir. "Yakınlık" ölçütü (kreş) yoksul mahalleleri; "bekleme süresi" ise geç başvuranları cezalandırır. Dijital olarak erişimi zor kişiler (H5) geç kaydolur. AİHM dolaylı ayrımcılığı kabul eder (D.H. ve Diğerleri / Çekya, 2007 BD). [Doğrulanmalı] Sosyal konutta vatandaşlık veya yerleşiklik süresi ölçütleri için önceki (ekonomi) notta anlattığım ayrımlar (ikamet, uyruk) geçerlidir.

**b) Sağlık hakkı ve tıbbi önceliklendirmenin hukuki dayanağı.**

- **Anayasa m. 17** (yaşam, beden bütünlüğü) ve **m. 56** (sağlık hakkı ve devletin sağlık hizmetlerini düzenleme ödevi); **AİHS m. 2 ve 8**; **İKSHS m. 12** ve BM İKSH Komitesi 14 No'lu Genel Yorum (sağlık hizmetinin erişilebilirliği ve ayrımsızlığı). [Madde ve yorum ayrıntıları doğrulanmalı]
- AİHM, sağlık sistemindeki sistemik aksaklıklar yüzünden hastanın zamanında bakıma erişememesini m. 2 kapsamında inceler (Lopes de Sousa Fernandes / Portekiz, 2017 BD). [Doğrulanmalı] Yani **bekleme listesi yönetimi bir sağlık hakkı konusudur**, salt idari kolaylık değil.
- **Organ nakli emsali:** AB'de 2010/53/AB sayılı Direktif organların kalite ve güvenliğini düzenler; bekleme listesi ve tahsis ölçütleri ulusal hukuka (ve Eurotransplant gibi üye ülke ortak kurallarına) bırakılmıştır. Almanya'da Nakil Kanunu (TPG § 12) tahsis için **tıbbi aciliyet ve başarı şansı** ölçütlerini kanun düzeyinde söyler. [Doğrulanmalı] Türkiye'de 2238 sayılı Organ ve Doku Nakli Hakkında Kanun ve yönetmelikler çerçeveyi çizer; tahsis ölçütlerinin yasal dayanağı doğrulanmalıdır. [Doğrulanmalı]
- **Önemli ders:** Eurotransplant'ın MELD puanı bir **tıbbi ölçüm**dür (hastalığın şiddetini ölçer); "sıra atlama" değil, **tıbbi sınıflandırma**dır. Sıra Defteri'nin sağlıktaki hukuki sağlamlığı, formülün tıp bilimine ve **yayımlanmış klinik ölçütlere** dayanmasından gelir.
- **Alman Federal Anayasa Mahkemesi, Triyaj kararı (16 Aralık 2021, 1 BvR 1541/20):** Kıt yoğun bakım kaynaklarının dağıtımında engelli kişilerin ayrımcılığa karşı korunması için yasa koyucu önlem almak zorundadır. Mahkeme, "mevcut hastalığı atlatma şansı" ölçütünü tek başına anayasaya aykırı bulmadı; ama komorbidite ve kırılganlık gibi ölçütlerin **engellilikle klişeleşmiş biçimde** ilişkilendirilme riskini gördü. Yasa koyucu; maddi ölçütler, dört göz ilkesi, belgeleme ve eğitim gibi güvenceler seçebilir. **Ders:** formüldeki yaş, engellilik, "yaşam kalitesi" benzeri değişkenler ayrımcılık riski taşır; güvenceler (ikinci imza, belge, eğitim) şarttır.

**c) Sıra atlamanın hukuken meşru sayılabileceği durumlar.**

| Durum | Meşru mu? | Koşul |
|---|---|---|
| Yaşamsal tehlike veya geri dönüşsüz kötüleşme riski (tıbbi acil) | Evet | Önceden tanımlı klinik ölçüt, hekim değerlendirmesi, ikinci imza |
| Kanunla tanımlanmış öncelik grupları (çocuk, engelli, şehit yakını, gazi vb.) | Evet | Kanunda yazılı; sınırlı; ölçülü (Anayasa m. 10) |
| Afet, salgın gibi zorunluluk hâlleri | Evet | Önceden ilan edilmiş kural; süreli; sonradan denetim |
| Organ-alıcı **uygunluğu** (doku eşleşmesi) | Evet, ama "atlama" değil uygunluk | Tıbbi ölçüt |
| Hata düzeltmesi (yanlış sıralama) | Evet | Gerekçe ve kayıt |
| Tanıdık, makam talebi, bağış, siyasi sadakat | **Hayır** | Hiçbir gerekçe bunu meşru kılmaz |

"İmzalı gerekçe" yeterli değildir: gerekçe **önceden tanımlı kategorilerden birine** girmeli ve **bağımsız bir ikinci incelemeden** geçmelidir. Aksi hâlde "sahte aciliyet beyanı" yeni torpil kanalı olur.

**d) Atlanan kişiye bildirim ve gizlilik.**

- Öne alınan kişinin sağlık durumu **özel nitelikli kişisel veridir** (KVKK m. 6; GDPR m. 9). KVKK m. 6/3'e göre sağlık verisi, sır saklama yükümlülüğü altındaki kişiler veya yetkili kuruluşlarca, **tıbbi teşhis, tedavi, sağlık hizmetlerinin planlanması ve yönetimi** gibi amaçlarla işlenebilir. [Madde metni doğrulanmalı] Herkese açık yayım bu kapsama girmez.
- **"Sizden önce biri öne alındı, çünkü ..."** bildirimi küçük listelerde (nadir ameliyat, küçük hastane, küçük ilçe) öne alınanı **yeniden kimliklendirebilir.** AİHM, sağlık verisinin gizliliğine özel önem verir (örn. Z / Finlandiya, 1997). [Doğrulanmalı]

**e) Kamuya açık sıra.** Kişinin yalnızca **kendi sırasını** görmesi sorunsuzdur. Herkese açık liste kimlik içermese bile, sıra numarası + kurum + tarih bilgisi bir araya gelince kişiyi belirleyebilir. Kamuya yalnızca **toplulaştırılmış istatistik** (kuyruk uzunluğu, ortalama bekleme, istisna sayısı) açılsın; ayrıntı bağımsız denetçiye.

**f) Formül nedir ve yargısal denetim nasıl olur?**

- **Hukuki nitelik:** Formül, genel ve soyut kurallar içerdiği için **düzenleyici işlemdir** (yönetmelik/yönerge). Birinin sırasının belirlenmesi ise **bireysel işlemdir.**
- **Kanunilik:** Kimin kıt bir kaynağa önce eriştiği, hakları doğrudan etkilediği için **önemli ölçütler kanunda** yer almalıdır (Anayasa m. 13, 123–128; Alman *Wesentlichkeitstheorie*: önemli konuları yasa koyucu belirler). Ağırlıklar ve ayrıntılar yönetmelikte olabilir.
- **Dava konusu olma sorunu:** Türkiye'de idari dava, **kesin ve yürütülebilir** işlemlere karşı açılabilir. Sıra numarası veya hesabı "hazırlık işlemi" sayılırsa, hasta tedavi gününe kadar dava açamayabilir. [Danıştay içtihadı doğrulanmalı] Kanun, **sıra tespitini ayrı dava konusu** sayabilir ve **ivedi yargılama/yürütmeyi durdurma** yolunu açabilir.
- **Yargının neye bakacağı:** Yetki, şekil, sebep, konu, maksat unsurları; takdirin sınırları; eşitlik; gerekçe. Hesap karmaşıksa mahkeme bilirkişiye başvurur. Algoritma için emsaller: İtalya Danıştayı (*Consiglio di Stato*, 2270/2019): algoritmik kural, **bilinebilir, anlaşılabilir ve yargı denetimine açık** olmalı; Fransa Anayasa Konseyi (2018-765 DC): idare, algoritmanın işleyişini kişiye ayrıntılı açıklayabilmeli ve kendini idarenin denetimi dışında değiştiren algoritmalar kullanılmamalı; Almanya'da tam otomatik idari işlem yalnızca kanun izin verirse ve takdir yetkisi yoksa mümkün (VwVfG § 35a). [Hepsi doğrulanmalı]
- **Ticari sır savunması kabul edilmemeli:** Formül kamu hukuku kuralıdır; açık, sürümlü ve yeniden hesaplanabilir olmalıdır.
- **Mühürleme ve değişiklik:** Formül sonuçtan önce mühürlenir (Ö6 ile uyum). Formül değişirse **bekleyenlerin sırası** nasıl etkilenir? Meşru beklenti ve hukuki güvenlik gereği geçiş kuralı gerekir (bekleyen kimse formül değişikliğiyle geriye düşmemeli).

**g) Otomatik karar ve yapay zekâ mevzuatı.**

- Sıra hesabı, tedavi zamanını etkilediği için kişiyi "benzer şekilde önemli ölçüde etkileyen" karardır. GDPR m. 22 yalnızca otomatik kararlara karşı güvenceler (insan müdahalesi, görüş bildirme, itiraz) ister; özel nitelikli veride (sağlık) ek kısıtlar vardır. KVKK m. 11/1-g aleyhe otomatik sonuca itiraz hakkı verir. [Doğrulanmalı]
- **AB Yapay Zekâ Yasası Ek III, nokta 5:** kamu makamlarınca temel kamu yardım ve hizmetlerine (sağlık hizmetleri dâhil) uygunluğu değerlendiren sistemler ve **acil sağlık hasta triyaj sistemleri yüksek risklidir.** Sıra Defteri sağlık bölümü bu kapsamda düşünülmeli. Bir web kaynağına göre Ek III yükümlülüklerinin uygulanması 2 Aralık 2027'ye ertelendi. [Doğrulanmalı]
- Triyaj yazılımının AB tıbbi cihaz mevzuatı (MDR) kapsamına girip girmediği ayrıca incelenmelidir. [Doğrulanmalı] Türkiye'deki muadil düzenleme araştırılmadı.
- **Hekimin klinik takdiri:** Hekim, formülün sonucundan **klinik gerekçeyle** ayrılabilmeli; bu, "sıra atlama"dan farklı bir "klinik yeniden sınıflandırma"dır ve ayrı bir yoldan kayda geçer.

**h) Formülü kim yazar?** Hukuken iki katman ayrılmalı: **(1) tıbbi/teknik ölçütler** (aciliyet, başarı şansı) tıp bilimi ve bağımsız bilimsel kurulca; **(2) değer yargısı içeren ağırlıklar** (örn. çocuğa ek öncelik, bekleme süresinin ağırlığı) Meclis veya kanunla yetkilendirilmiş kurulca, Yurttaş Paneli'nin **danışma** görüşüyle. Yurttaş Paneli'nin tıbbi ölçüt yazması hukuken ve bilimsel olarak uygun değildir.

### Risk

1. **Formülün kanuni dayanağının eksikliği:** Önemli ölçütler yönetmelikle belirlenirse iptal riski.
2. **Dava konusu olmama:** Sıra "hazırlık işlemi" sayılırsa hak arama imkânı zayıflar.
3. **Ayrımcı değişkenler:** Yaş, engellilik, "kırılganlık" (Triyaj kararı).
4. **Dolaylı ayrımcılık:** Bekleme süresi ve yakınlık ölçütleri; dijital uçurum.
5. **Sağlık verisi sızıntısı:** Bildirimin yeniden kimliklendirmesi; kamuya açık liste.
6. **Sahte aciliyet:** İstisna yolu yeni torpile dönüşür.
7. **Yüksek riskli sistem:** Sağlık alanında sıra hesabı daha ağır yükümlülüklere tabi (AB karşılaştırması).
8. **Formül kayırma aracı olur** (Y3).

### Öneri

1. **Çerçeve kanun:** Hangi kaynakların Sıra Defteri'ne girdiğini, önemli ölçütleri, yasak ölçütleri (siyasi görüş, bağış vb.), öncelik gruplarını ve istisna kategorilerini yazsın. Ağırlıklar yönetmelikte; sürümlü ve mühürlü.
2. **Sağlıkta iki katman:** Tıbbi ölçütler bağımsız bilimsel kurulda (meslek örgütleri ve etik kurul katılımıyla); değer ağırlıkları yetkili organda. Yaş/engellilik gibi değişkenlerde Triyaj kararındaki güvenceler (ikinci imza, belge, eğitim, engelli örgütlerinin görüşü).
3. **Sıra atlama:** Yalnızca kanunda sayılı kategorilerle; **iki imza** (hekim + bağımsız ikinci inceleme); kategori kodu; gerekçe kayıtlı; sonradan denetim; her kurumda istisna oranı kamuya açık. "Tanıdık" için hiçbir kategori yok.
4. **Bildirim:** Atlanana yalnızca **kodlu kategori** ("yaşamsal aciliyet", "yasal öncelik grubu") ve toplulaştırılmış istatistik; tanı, yaş, cinsiyet, kurum içi ayrıntı yok. Küçük listelerde bildirim toplulaştırılır veya gecikmeli verilir.
5. **Kamuya açık görünüm:** Kişi yalnızca kendi sırasını görür; kamu toplulaştırılmış veri görür; ayrıntı bağımsız denetçiye (takma adlı).
6. **Yargı yolu:** Kanunda sıra tespitinin **ayrı dava konusu** olduğu, **ivedi** yargılanacağı ve **insan incelemesi** talebinin süre sınırı içinde sonuçlanacağı yazılsın. Formülün kaynağı, sürümü ve hesap kaydı yargıya açık olsun.
7. **Dijital dışı kanal:** Başvuru tarihi, insan kanalından yapılan başvuruyla da aynı geçerlilikte; "bekleme süresi" dijital erişimsizlik yüzünden kaybolmasın (H5).
8. **Geçiş kuralı:** Formül değişince bekleyenlerin sırası korunsun veya yeniden hesaplama lehe uygulansın.
9. **Pilot sırası:** İlk pilotu **sağlık dışı** (kreş, yurt, sosyal konut) bir alanda yapın; sağlıkta önce yalnızca **kuyruk şeffaflığı ve istatistik** ile başlayın (sıra *hesaplama* değil). Sağlıkta tahsis, klinik rehberler, etik kurul ve yüksek riskli sistem değerlendirmesi tamamlandıktan sonra gelsin.

---

## 3. FA-04 — İkinci Termometre

### Hukuki değerlendirme

**a) Resmî istatistiğin hukuki statüsü ve bağımsızlığı.**

- **BM Resmî İstatistiğin Temel İlkeleri** (BM Genel Kurulu'nun 2014 tarihli 68/261 sayılı kararıyla benimsendi): resmî istatistik **tarafsız** derlenir ve eşit erişime açıktır; yöntem **bilimsel ve mesleki ölçütlerle** seçilir; kaynak ve yöntemler açıklanır; kurumlar **yanlış yorumlara karşı yorum yapabilir**; bireysel veriler **gizli** tutulur; istatistik sistemini düzenleyen kanunlar kamuya açıktır. [Metin okundu]
- **AB:** Avrupa İstatistikleri Tüzüğü (223/2009, 2015/759 ile değişik) ve **Avrupa İstatistik Uygulama Esasları** (16 ilke), istatistik kurumlarının **mesleki bağımsızlığını** esas alır. Kurum başkanının atanması ve görevden alınması yalnızca mesleki ölçütlere dayanmalı, siyasi baskıdan uzak olmalıdır (Parlamento'nun birinci okuma metninden okudum; nihai metin doğrulanmalı). AB Çalışma Şekli Antlaşması m. 338 de istatistikte tarafsızlık, güvenilirlik, nesnellik ve bilimsel bağımsızlık arar. [Doğrulanmalı]
- **Türkiye:** 5429 sayılı Türkiye İstatistik Kanunu ve Resmî İstatistik Programı çerçevesidir. Kurum başkanının atanması, kurumun yapısı ve bağımsızlığı bu notta incelenmedi; ayrıca araştırılmalı. [Doğrulanmalı]
- **"Resmî" etiketi hukuki sonuç doğurur.** Kira artışı, indeksli sözleşmeler, vergi değerleme oranları, maaş ve ödenek güncellemeleri resmî endekse bağlanır. Örneğin Türk Borçlar Kanunu m. 344, kira artışını TÜFE'nin 12 aylık ortalamasıyla sınırlar. [Doğrulanmalı] Bu bağ **hukuki kesinlik** sağlar. İkinci Termometre bu işlevi devralamaz; yurttaş ölçümünü hukuki sonuca bağlayacak her adım **ayrı bir kanun** gerektirir.
- Airokrasi'ye ek: Bağımsız İstatistik Kurumu'nun atanma zinciri, görev süresi, görevden alma, bütçe güvencesi ve cezai sorumluluktan korunması (iyi niyetli ölçüm yapana karşı) anayasal düzeyde yazılmalıdır. Aynı mantık Bütünlük Kurumu için de önerildi.

**b) "Veri Alarmı bağlı yürütme kararlarını Kademe 2'ye çeker": hukuki dayanak ve sınırlar.**

- **Kademe kanunla belirlenir** (Temeller A1; ajan kademeyi yalnızca yükseltebilir). "Alarm çalarsa Kademe 2" kuralı, kanunda **önceden tanımlı, nesnel bir tetikleyiciyle** yazılırsa, yasama yetkisinin devri sayılmaz (Anayasa m. 7). Tetikleyiciyi ilan eden kurum yalnızca **olguyu tespit** eder; tetikleyicinin eşiğini değiştirebilen kişi asıl gücü elinde tutar. Bu yüzden eşik kanunda ya da nitelikli çoğunlukla belirlenen bir bantta olmalıdır.
- **Alarm bir idari işlemdir.** Karar usulünü değiştirdiği (Kademe 2'ye çektiği) için hukuki sonuç doğurur; yargı denetimine tabidir. Alarm ilanı, **ilgili kurumun cevap hakkı** (30 gün içinde açıklama) ve gerekçeli karar ile verilmelidir (öneri belgesindeki açıklama süresi bu bakımdan yerinde).
- **Çıkar çatışması:** Bağımsız İstatistik Kurumu hem resmî rakamın üreticisi hem alarmdaki farkı açıklamakla yükümlü. Kurum, kendi ürününün "yanlış" bulunmasında hakem olursa tarafsızlık sorunu doğar. Alarmın ilanı veya düşmesi, **farklı ve bağımsız bir metodoloji paneli**nin değerlendirmesine bağlanmalıdır.
- **Lehe işlemlerin gecikmesi:** Kademe 2, ajanın hazırlayıp insanın onayladığı kademedir. Alarm çalarken yurttaş payı güncellemesi, kira ya da yardım güncellemesi insan onayı bekleyecekse, **hak sahipleri gecikmeden zarar görür.** Kanun, alarm sürerken lehe güncellemenin geçici uygulanıp onayla kesinleşmesini veya mevcut formülün işlemeye devam etmesini açıkça düzenlemeli.
- **Mevcut hukuki ilişkiler:** Sözleşme ve vergi bağları resmî endekse bağlı kalır; alarm bunları değiştirmez, yalnızca **usulü** (insan onayı, açıklama) etkiler. Bu açıkça yazılmalı.

**c) Alternatif istatistik yayımının hukuki riski.**

- **İfade özgürlüğü:** Ekonomik istatistiklere dair tartışma kamu yararı taşır; AİHS m. 10 siyasi ve ekonomik tartışmayı güçlü korur.
- **Arjantin dersi:** Hükümetin ticaret sekreterliği, resmî rakamdan çok yüksek enflasyon tahmini yayımlayan özel danışmanlıklara para cezası verdi (2011, tehdit edilen ceza 500 bin pesoya kadar); birçok kuruluş yayımı bıraktı. 2013'te üst mahkemeler cezaları bozdu (haksız tüketici bilgisi hükmü bu yayına uymuyordu). IMF 2013'te Arjantin'e resmî veri yüzünden "kınama bildirimi" verdi ve 2016'da kaldırdı. [Haber ve IMF duyurusu başlığından okundu; ayrıntılar doğrulanmalı]
- **Türkiye'de risk:** 2022'de eklenen TCK m. 217/A ("halkı yanıltıcı bilgiyi alenen yayma") alternatif bir enflasyon veya yoksulluk rakamı yayımlayanlar için hukuki risk doğurabilir; bağımsız enflasyon ölçümü yapan gruplara karşı suç duyurusu ve dava örnekleri olduğunu hatırlıyorum. [Doğrulanmalı] Ayrıca özel kuruluşların istatistik üretmesine ve yayımlamasına ilişkin sınırlar araştırılmadı. [Doğrulanmalı]
- **Ders:** İkinci Termometre'nin **yayımlama özgürlüğü** ve ölçümcülerin cezai sorumluluktan korunması kanunla güvenceye alınmalı (yöntem açık ve iyi niyetli olduğu sürece). Yunanistan'da istatistik kurumu başkanının yargılanması da ölçümcüyü cezai sorumluluğa karşı koruma ihtiyacını gösterir. [Doğrulanmalı]

**d) Yurttaş katkılı veri: kişisel veri ve doğruluk sorumluluğu.**

- **Alışveriş fişi kişisel veri olabilir.** "Kimliksiz" demek "anonim" demek değildir. Fişte mağaza, saat, ürün, kart numarasının bir bölümü bulunur; az sayıda alışveriş noktası bile bir kişiyi tek kılabilir (kredi kartı üst verisiyle yapılan çalışmalar bunu gösterdi). [Doğrulanmalı] KVKK'da anonim hâle getirme, verinin başka verilerle eşleştirilse bile kimliğin belirlenemeyeceği şekilde işlenmesidir (m. 3). Fişlerdeki ürünler ilaç, kitap, dergi gibi **özel nitelikli bilgi** (sağlık, din, siyasi eğilim) ortaya çıkarabilir.
- **Hukuki dayanak:** Katkı gönüllü olduğundan **açık rıza** (KVKK m. 5) ve kamu finansmanlıysa kanunda öngörülen veri işleme dayanakları gerekir. Veri azaltma ilkesi: yalnızca ürün kategorisi ve fiyat gerekir.
- **Doğruluk sorumluluğu üç yerde:**
  1. *Bağışçı:* Yanlış/sahte fiş kasıtlıysa özel belgede sahtecilik veya dolandırıcılık gündeme gelir (TCK). Ancak tek tek ihmaller için ceza öngörmek orantısızdır. [Doğrulanmalı]
  2. *Termometre işletmecisi:* Ölçümü yayımlayan kuruluş, kanunla kurulmuş kamu kurumuysa idari sorumluluk (Anayasa m. 125, 129/5) ve veri sorumlusu yükümlülükleri taşır; özel kuruluşsa haksız fiil (TBK m. 49) ve kişilik hakları sorumluluğu. Ölçüm bir **tahmindir**; belirsizlik aralığı, yöntem beyanı ve **düzeltme/yanıt hakkı** (basın hukukundaki cevap ve düzeltme hakkına benzer biçimde) gerekir. [Doğrulanmalı]
  3. *Alarmla karar veren kamu:* Hatalı alarm yüzünden hak kaybı olursa **kamu** sorumludur.
- **Yanlı örnekleme ve eşitlik:** Dijital olarak erişimi zor kişiler (yaşlılar, kırsal, yoksullar) ölçümde az temsil edilir. Alarm bunlara karşı yanlı sonuç verirse ayrımcılık tartışması çıkar. Ağırlıklandırma yöntemi açık, belgeli ve bağımsız denetlenmeli.
- **Kamu verisine erişim:** Resmî istatistiğin bireysel verileri gizlidir (BM ilke 6); İkinci Termometre kamunun gizli idari kayıtlarına dayanamaz.

**e) Finansman ve hukuki statü.**

- **Tamamen sivil** bir termometre özgürdür ama kaynak ve süreklilik sorunu vardır; hukuki bir "alarm" yetkisi taşıyamaz.
- **Tamamen kamu finansmanlı** bir termometre bağımlılık riski taşır.
- Hukuken sağlam orta yol: **kanunla tanınmış bir "İkinci Termometre" statüsü**: bağımsız akreditasyon, çok yıllı ve geri çekilemez bütçe (hükümet kesintisi ancak gerekçeli ve bağımsız onayla), kurucu kuruluşlarda siyasi parti/hükümet yok. Bu statüden bağımsız **serbest sivil ölçümler** de olsun ve yayımlama korunsun; yalnızca "tanınmış" olan alarm üretebilsin.

### Risk

1. **Yurttaş ölçümünden hukuki sonuç:** Kalite kontrolü ve hakem olmadan alarm, iptal edilebilir bir idari işlem olur.
2. **Resmî endeksin bağlayıcılığının belirsizleşmesi:** Sözleşme, vergi ve maaş güncellemelerinde hukuki kesinlik kaybı.
3. **Kurumun hem taraf hem hakem olması:** Tarafsızlık itirazı.
4. **Alternatif rakamın cezai veya idari yaptırıma maruz kalması:** TCK m. 217/A; Arjantin örneği.
5. **Fişlerin kişisel veri sayılması:** Rıza, veri azaltma, özel nitelikli veri.
6. **Yanlı örnekleme:** Dijital eşitsizlik ve eşitlik ihlali iddiası.
7. **Hatalı alarmda lehe işlemlerin gecikmesi.**
8. **Siyasi silahlaştırma:** Muhalefet ya da iktidarın alarmı propagandaya çevirmesi; alarm eşiğinin değiştirilmesi.

### Öneri

1. **Alarmın hukuki sonucunu dar tutun:** Alarm yalnızca (a) ilgili kurumdan açıklama istemek ve (b) belirli kararları Kademe 2'ye çekmek gibi **usulî** sonuçlar doğursun. Resmî endeksi, sözleşmeleri, vergi ve maaş hesabını **değiştirmesin**.
2. **Tetikleyici kanunda:** Hangi göstergeler, hangi eşik, hangi karar türleri kanunda sayılsın; eşik değişikliği nitelikli çoğunlukla ve önceden duyurulmuş bantta.
3. **Hakemlik ayrı organda:** Alarmın ilanı ve düşmesi, istatistik kurumundan ve termometre işletmecisinden **bağımsız bir metodoloji paneli** tarafından; ilgili kuruma cevap hakkı.
4. **Lehe güncelleme kuralı:** Alarm sürerken lehe güncelleme geçici uygulanır, onayla kesinleşir; süre sınırı (ör. 30 gün) ve sonra otomatik düşme.
5. **Yayım güvencesi:** Yöntemi açıklanan ölçümlerin yayımı kanunla korunur; ölçümcüler ve istatistik kurumu çalışanları iyi niyetli ölçümden cezai sorumluluğa karşı korunur. Dezenformasyon hükümlerinden muafiyet açıkça yazılır (Türkiye için TCK m. 217/A ile uyum özellikle incelenmeli).
6. **Etiket kuralı:** Yurttaş ölçümü "resmî istatistik" olarak adlandırılamaz; yöntem beyanı, belirsizlik aralığı ve düzeltme/yanıt hakkı yayımın şartı olur.
7. **Veri rejimi:** Fiş katkısı için açık rıza; cihaz üstünde işleme ve ürün kategorisi düzeyinde toplulaştırma; ham fişin merkezde saklanmaması; özel nitelikli ürün kategorilerinin dışlanması; sensörlerde kişiyi belirleyici veri yok.
8. **Örnekleme eşitliği:** Dijital olmayan yurttaşlar için ayrı toplama kanalı (H5), ağırlıklandırma yönteminin yayımı, bağımsız denetim.
9. **Statü:** Kanunla "tanınmış İkinci Termometre" statüsü: akreditasyon, çok yıllı ve korumalı bütçe, hükümet ve parti dışı kurucular. Serbest sivil ölçümlerin yayımı da korunur.
10. **Pilot:** Önce *kimlik ve rıza gerektirmeyen* göstergelerle (hava kalitesi gibi sensör verisi, kamuya açık fiyat verisi) başlayın; fiş ve sağlık bekleme süresi gibi kişisel veri içeren göstergeler sonra.

---

## 4. Ortak sorulara hukuki yanıt

**Hangi bilgiler hiçbir koşulda birleştirilemez?** (Ortak soru 2)

Hukuken en az şunlar birbirinden ayrı tutulmalı ve aynı kişi dosyasında birleştirilmemelidir:

1. **Sağlık sırası/sağlık verisi** ile **siyasi görüş, din, etnik köken** gibi diğer özel nitelikli veriler.
2. **Bakış kaydı** (kim kime baktı) ile **siyasi eğilim çıkarımı** (yalnızca toplulaştırılmış ve bağımsız denetim ortamında analiz).
3. **Yurttaş Payı ödeme verisi** ile **siyasi profil** (ekonomi notunda önerildi).
4. **İhbarcı kimliği** ile ajan kayıtları.
5. **Sıra Defteri verisi** ile **güvenlik/istihbarat verisi**.

Teknik karşılığı: sektöre özgü tanımlayıcılar, federatif görünüm, veri kaynağında kalma. Hukuki karşılığı: amaç sınırlaması (KVKK m. 4), özel nitelikli veri rejimi (m. 6), ve yukarıdaki Nüfus Sayımı kararı mantığı.

---

## 5. En kritik 5 hukuki sorun

1. **Zincirdeki "parmak izi" ile silme/erişim hakkı (FA-06, K15 okuması).** Tuzsuz veya kayıt-bağlantılı özet kişisel veri sayılır; çok düğümlü zincirde veri sorumlusu belirsizdir. Çözüm: zincirde yalnızca tuzlu taahhüt, kişisel veri silinebilir ayrı depoda, tek sorumlu kurum, kanunla saklama süresi.
2. **Soruşturma/istihbarat istisnası ve gecikmeli bildirim (FA-06).** KVKK m. 28'in genel muafiyeti yeterli "kanun kalitesi" sağlamaz; Big Brother Watch ölçütleri (bağımsız yetkilendirme, aşamalı denetim, sonradan inceleme) ve sonradan bildirim ilkesi karşılanmazsa defter AİHS m. 8'e aykırı delik açar.
3. **Sıra formülünün kanuni dayanağı, tıbbi önceliklendirme ve yargı denetimi (FA-14).** Önemli ölçütler kanunda olmalı; sıra tespiti dava konusu yapılabilmeli; yaş/engellilik gibi değişkenler ayrımcılık riski taşır (Alman Triyaj kararı); sağlık verisi bildirimde sızabilir; sağlıkta sıra hesaplama AB'de yüksek riskli sistem sayılır.
4. **Yurttaş ölçümünden hukuki sonuç doğuran Veri Alarmı (FA-04).** Alarm bir idari işlemdir; hakem, tetikleyici ve cevap hakkı kanunla düzenlenmezse iptal edilir; hatalı alarmda lehe işlemler gecikir; resmî endeksin bağlayıcılığı korunmalıdır.
5. **Alternatif ölçümün yayım güvencesi ve yurttaş verisinin hukuki rejimi (FA-04).** Dezenformasyon hükümleri ve Arjantin tipi yaptırımlar ölçümü susturabilir; fişler kimliksiz bile olsa kişisel/özel nitelikli veri olabilir; yanlı örnekleme eşitlik sorunu doğurur.

*Çapraz not:* "Kasanın anahtarı yalnızca yurttaşta" ilkesi hukuken çalışmaz (devletin yasal görevleri izne bağlanamaz); doğru model "yurttaş bilgi sahibi ve itiraz eder, devlet kayıtlı ve denetimli erişir"dir.

---

## 6. Emin olmadığım noktalar

- KVKK m. 11, 28 ve 6/3'ün bent ve kapsam ayrıntıları; KVKK'da ortak veri sorumluluğu ve "kim baktı" hakkının eksikliği.
- AİHM kararlarının tam atıfları: Klass, Zakharov, Szabó, Segerstedt-Wiberg, Catt, Bărbulescu, López Ribalda, D.H., Lopes de Sousa Fernandes, Z / Finlandiya. Big Brother Watch'ın **bildirim** konusundaki tutumunu okuyamadım.
- AB Adalet Divanı Tele2 ve La Quadrature du Net kararlarındaki bildirim ödevinin tam yeri.
- EDPB blokzincir kılavuzunun nihai sürümü ve tarihi; zincirde "tuz silme" yönteminin anonimlik sayılıp sayılmadığı.
- Türkiye'de sıra tespitinin "kesin ve yürütülebilir işlem" sayılıp sayılmayacağı; Danıştay içtihadı.
- 2238 sayılı Kanun ve organ tahsis ölçütlerinin yasal dayanağı; Almanya TPG § 12; Eurotransplant'ın hukuki statüsü.
- 5429 sayılı Kanun'un kurum bağımsızlığı hükümleri; TCK m. 217/A'nın alternatif istatistiğe uygulanma örnekleri; Yunanistan istatistik başkanı örneğinin ayrıntıları.
- AB Yapay Zekâ Yasası'nın uygulama tarihi (ertelendiği bilgisi bir web kaynağına dayanıyor) ve tıbbi cihaz mevzuatıyla ilişkisi.
- Türk Borçlar Kanunu m. 344'ün güncel metni.

---

## Kaynaklar

### Bu oturumda web'den okunan veya doğrulanan
- AB Adalet Divanı, C-579/21 Pankki S, basın bülteni: https://curia.europa.eu/jcms/upload/docs/application/pdf/2023-06/cp230107en.pdf
- EDPB Blokzincir Kılavuzu 02/2025 özeti (ikincil kaynak; nihai sürüm bilgisi doğrulanmalı): https://ppc.land/edpb-forces-blockchain-firms-to-avoid-storing-personal-data-on-chain/
- AB Adalet Divanı, EDPS / SRB (C-413/23 P) özeti (ikincil kaynak): https://www.aoshearman.com/en/insights/ao-shearman-on-data/cjeu-clarifies-concept-of-personal-data-for-a-transfer-of-pseudonymised-data-to-third-parties
- AİHM, Big Brother Watch / Birleşik Krallık (BD, 2021), basın bülteni: https://www.statewatch.org/media/2443/echr-bulk-surveillance-uk-bbw-judgment-pr-25-5-21.pdf
- AİHM, I / Finlandiya (2008), ikincil özet: https://www.5rb.com/i-v-finland/
- AB Yapay Zekâ Yasası, Ek III, nokta 5 (ikincil kaynak): https://www.euaiact.com/annex/3
- AB Dijital Omnibüs ve ertelenen tarihler (daha önce okunan ikincil kaynak, doğrulanmalı): https://natlawreview.com/article/eu-digital-omnibus-ai-enters-force
- Alman Federal Anayasa Mahkemesi, Triyaj kararı, 1 BvR 1541/20: https://www.hrr-strafrecht.de/hrr/bverfg/20/1-bvr-1541-20.pdf
- BM Resmî İstatistiğin Temel İlkeleri: https://unstats.un.org/UNSD/dnss/gp/FP-New-E.pdf
- AB İstatistik Tüzüğü 223/2009 değişikliği (Parlamento birinci okuma özeti; nihai metin doğrulanmalı): https://oeil.europarl.europa.eu/oeil/en/document-summary?id=1324933
- Arjantin: özel danışmanlıklara verilen cezaların bozulması (haber): https://en.mercopress.com/2013/05/14/argentine-inflation-controversy-court-vindicates-private-stats-agencies
- IMF'nin Arjantin kınama bildirimini kaldırması (yalnızca başlık düzeyinde; metin okunmadı): https://www.imf.org/en/news/articles/2016/11/09/pr16497-argentina-imf-executive-board-removes-declaration-of-censure

### Bilgi birikimime dayanan, bu oturumda yeniden doğrulanmayan metinler ve kararlar
- **Türkiye:** Anayasa m. 7, 10, 13, 17, 20/3, 56, 123–129; 6698 sayılı KVKK (m. 3, 4, 5, 6, 7, 11, 12, 28) ve Silme Yönetmeliği; 5429 sayılı Türkiye İstatistik Kanunu; 2238 sayılı Organ ve Doku Nakli Hakkında Kanun; Türk Ceza Kanunu m. 217/A; Türk Borçlar Kanunu m. 49, 344.
- **AB ve uluslararası:** GDPR (m. 4, 5, 9, 12, 15, 17, 22, 26, 34; Gerekçe 26); Direktif (AB) 2016/680; Direktif 2010/53/AB; Tüzük 223/2009 (2015/759 ile değişik); Avrupa İstatistik Uygulama Esasları; AİHS m. 2, 8, 10, 14; MSHS m. 26; İKSHS m. 12 ve 14 No'lu Genel Yorum; AB Çalışma Şekli Antlaşması m. 338.
- **AİHM ve AB Adalet Divanı:** Belçika Dil Davası (1968); Klass / Almanya (1978); Z / Finlandiya (1997); Segerstedt-Wiberg / İsveç (2006); D.H. ve Diğerleri / Çekya (2007, BD); Zakharov / Rusya (2015, BD); Szabó ve Vissy / Macaristan (2016); Bărbulescu / Romanya (2017, BD); Lopes de Sousa Fernandes / Portekiz (2017, BD); Catt / Birleşik Krallık (2019); López Ribalda / İspanya (2019, BD); Tele2 Sverige (C-203/15, 2016); La Quadrature du Net (2020).
- **Ulusal mahkemeler ve karşılaştırma:** Alman Federal Anayasa Mahkemesi, Nüfus Sayımı kararı (1983) ve Mikrozensus kararı; Alman Nakil Kanunu (TPG) § 12; Alman VwVfG § 35a; İtalya Consiglio di Stato, 2270/2019; Fransa Anayasa Konseyi, 2018-765 DC; Avusturya sektörel kimlik numarası (bPK) yaklaşımı.
- **Proje belgeleri:** `01-oneri.md` (bu klasör); Temeller klasöründeki `01b-kurucu-ekleri.md` (K14, K15) ve `07-savunma.md` (KN-10); Ekonomi-Yolsuzluk klasöründeki `06-hukuk-notu.md`.
