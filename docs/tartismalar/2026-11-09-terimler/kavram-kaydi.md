# Kavram Kaydı (Concept Registry)

- **Hazırlayan:** Hakem ajan (Terimler)
- **Tarih:** 2026-11-09
- **Durum:** Taslak — kurucu onayı bekliyor (K31: değer tercihleri `TASKS.md` V-07 altında Değer Kararı Hakemi'ne gider; varsayılanlar geçerlidir)
- **Kaynak:** `docs/tartismalar/2026-11-09-terimler/05-hakem-karari.md`

## Introduction (English)

This is the concept registry of the Airokrasi project. Each row is one concept. **The ID and the language-neutral definition are binding. The names are not.** Under founder rule K27 (no dictionary translation) every language names the concepts with its own natural words. The Turkish and English names below were therefore chosen **separately**, with separate reasons. Neither is a translation of the other, and a name that happens to match in both languages is a coincidence.

Each language has two layers (K26). The **public name** (bold) is for ordinary readers: Manifesto, README, decision cards, citizen notices. The **technical name** (second line) is for constitutions, laws, regulations, decision records and debate files. On first use in a public text give both: *Service Assistant (AI), the executive AI agent*.

How to use the table:
- **Do not translate a name into another language.** Start from the definition and ask how your language would say it.
- **IDs are labels, not names.** They stay when a name changes. A changed name is recorded in the table "Changed names" below and the old name is kept there.
- **Role names must be used with their usage rules** (the «(AI)» label, the level in plain words, the verb rule). The rules are in `05-hakem-karari.md`, section 2. Without them a warm name can mislead.
- **Status.** ✅ decided. ✅ (… to be tested) decided, but the public name has not been tested with real readers. 🧭-n a value choice whose default is shown in the table; it is handed to a value-decision referee under `TASKS.md` V-07. All persona reactions in the debate were assumptions; no name has been tested with real people yet.
- Names not yet in this registry (for example Norm Denetim Organı, Acil Durum Kurulu, Afet Reçetesi) will be added in a second round (`05-hakem-karari.md`, Q4).

## Genel gerekçe

**Bu kayıt neden var?** Kurucu, temel kavramlara halkın benimseyeceği adlar verilmesini (K26) ve her dilin kendi sözcüklerini kullanmasını (K27) istedi. Kayıt, her kavramın dilden bağımsız tanımını ve her dilde ayrı seçilmiş halk ve teknik adını tek yerde tutar. `terminology-tr-en.md` dosyasının yerini alır.

**Hangi tartışmalardan doğdu?** `tartismalar/2026-11-09-terimler/` klasörü: görev (01), öneriler (02), yurttaş gözü (03), İngilizce değerlendirme (04), hakem kararı (05).

**Madde gerekçesi.** Her satırın son sütunu o satırın kısa gerekçesidir. Tam gerekçe dipnotları `05-hakem-karari.md` içinde `T1–T18` maddelerindedir. Onay durumu: taslak.

## Kayıt

### A. Yapay zekâ rolleri ve modeller

| Kimlik | Tanım (dilden bağımsız) | Türkçe: halk adı / teknik ad | English: public name / technical name | Gerekçe | Durum |
|---|---|---|---|---|---|
| `K-AJAN` | Belirli bir görev ve yetki sınırı içinde, insanlar adına ve onların denetiminde iş gören yapay zekâ. | **Kâtip (çalışan roller; denetleyen rol ayrı)**<br>teknik: ajan | **Assistant**<br>technical: AI agent | TR: casus çağrışımı olan «ajan» halk dilinde bırakıldı; «Kâtip» ancak kullanım kuralıyla (Bölüm 2) kullanılır. EN: «AI assistant» bilinen bir kategori; «Aide» ~ «aid» ve siyasi danışman, «Clerk» insan katiplerle karışır. [T2, T3, T8] | 🧭-1, 🧭-3 (TR) · ✅ (EN) |
| `K-YASAMA-AJANI` | Yasa taslağını ve etki çözümlemesini hazırlayan, kabul yetkisi insanlarda kalan yapay zekâ. | **Yasa Kâtibi**<br>teknik: yasama ajanı | **Drafting Assistant**<br>technical: legislative drafting AI agent | TR: taslağı yazar, kabul Meclis'te. EN: «legislative agent» ABD'de kayıtlı lobici demektir, teknik adda da kaçınıldı; «Legislative Assistant» insan personel unvanı. [T2, T8] | ✅ |
| `K-YURUTME-AJANI` | Yasaları uygulayan ve kamu hizmetlerini yürüten yapay zekâ. | **Kamu Kâtibi**<br>teknik: yürütme ajanı | **Service Assistant**<br>technical: executive AI agent | TR: «Hizmet» Gülen hareketinin adı; resmî ad olmaz (yedek: Yürütme Kâtibi). EN: «Service» siyasi yük taşımıyor; perakende çağrışımı sınanacak. [T5, T8] | ✅ |
| `K-YARGI-AJANI` | Uyuşmazlıkları inceleyen, hukuka uygunluk incelemesine hazırlık yapan ve insan hâkime öneri sunan yapay zekâ; bağlayıcı hüküm yalnızca insan hâkimdedir. | **Yargı Kâtibi**<br>teknik: yargı ajanı | **Disputes Assistant**<br>technical: judicial AI agent | TR: «Adalet» fazla büyük vaat; adın yanında hep «hüküm vermez». EN: «Justice» aynı vaat riski taşır, «Judicial Assistant» insan mahkeme personeli unvanıdır. [T5, T8] | ✅ |
| `K-NORM-AJANI` | Bir kural düzeyinin (anayasa, kanun, yönetmelik) sınırını gözeten ve üstündeki kurala aykırı iş yapamayan yapay zekâ. | **Kural Kâtibi**<br>teknik: norm ajanı | **Rules Assistant**<br>technical: rule-level AI agent | «Norm» Türkçede soyut, İngilizcede «toplumsal norm» demek; iki dilde de halk adı «kural». İngilizce teknik adda «norm agent» kullanılmaz. [T8] | ✅ |
| `K-UYGULAMA-AJANI` | Bir kuralı somut bir işleme uygulayan yapay zekâ. | **İşlem Kâtibi**<br>teknik: uygulama ajanı | **Processing Assistant**<br>technical: rule-application AI agent | TR: Birinci Kademe'de kararı bu rol verebilir; kullanım kuralı en çok burada işler. EN: «Casework» ile «Case Coordinator» karışıyordu. [T3, T8] | ✅ |
| `K-UYGUNLUK-AJANI` | Bir işlemin kurala açık aykırılığını, işi yapandan ayrı bir kuruma bağlı ve farklı model soyundan bir yapay zekâ olarak tespit eden; yorum gerektiren her durumu insan makama sevk eden yapay zekâ. | **Uygunluk Gözetmeni (geçici ad)**<br>teknik: uygunluk ajanı | **Independent Reviewer**<br>technical: compliance AI agent | TR: «Gözcü» (casus/gözetim çağrışımı; projede «vekil gözcü»), «Denetçi» (projede insan denetçiler) ve «Nöbetçi» (projede insan nöbetçi) elendi; «Gözetmen» yeni ve sınanacak. EN: bağımsızlık adın içinde. [T4, T8] | ✅ (TR sınanacak) |
| `K-KIRMIZI-TAKIM` | Sistemi kötüye kullanım ve zayıflık açısından sürekli sınayan bağımsız yapay zekâ. | **Sınama Ekibi**<br>teknik: kırmızı takım ajanı | **Stress-Test Team**<br>technical: red team | TR: «kırmızı takım» tehdit gibi duyuluyor. EN: bankacılıktan bilinen «dayanır mı?» sınavı. «Ekip/Team» insan sanılabilir: ilk kullanımda «(yapay zekâ)» / «(AI)». [T8] | ✅ |
| `K-DOSYA-KOORDINATORU` | Bir işlem için ilgili kural ajanlarını kamuya açık kural haritasından bulan, her birinden uygunluk alan ve gerekçeleri tek kararda birleştiren yapay zekâ. | **Dosya Kâtibi**<br>teknik: Dosya Koordinatörü | **Case Coordinator**<br>technical: case coordination AI agent | TR: «koordinatör» yabancı; dosyayı toplayıp birleştirmek kâtibin işi. EN: ad işi anlatıyor; insan mesleği olarak da bilindiğinden «(AI)» eki şart. [T2] | ✅ |
| `K-HALK-AJANI` | Kamu kayıtlarını kaynak göstererek sorgulayan, yalnızca okuyan, kişisel veriye erişmeyen, hiçbir partiye ya da iktidara bağlı olmayan ve yurttaşın ile gazetecinin kullanabildiği yapay zekâ. | **Halk Kâtibi**<br>teknik: Halk Ajanı | **Citizens' Assistant**<br>technical: citizen-access AI agent | TR: Defter'i yurttaşa okuyan kâtip; «Kamu Kâtibi» ile «Halk Kâtibi» hep tam adıyla yazılır. EN: «Public Aide» ~ «public aid» (ABD'de refah). [T2, T8] | ✅ |
| `K-PARTI-MODELI` | Bir partinin programına göre uyarlanmış, seçmenin seçimden önce deneyebildiği yapay zekâ modeli. | **Parti Modeli**<br>teknik: parti modeli | **Party Model**<br>technical: party model | TR: «Parti Maketi» reddedildi (aynı nesne sonra iktidar ya da muhalefet modeli olur; «maket» küçük sahte kopya gibi). «Model» araba modeli sanılabilir: ilk kullanımda «(partinin yapay zekâ modeli)». [T7] | ✅ |
| `K-IKTIDAR-MODELI` | Seçimi kazanan partinin, devletin yapay zekâ ağına siyasi yön vermek için kullandığı model. | **İktidar Modeli**<br>teknik: iktidar modeli | **Mandate Model**<br>technical: governing model (yalnızca teknik katmanda; «the governing party's model») | TR: «iktidar» olağan siyaset sözü. EN: «Governing Model» modelin yönettiği izlenimi verir; kurucunun onayladığı okuma (KB-1) «yön verir». «Mandate» yetkiyi seçmene bağlar. Tanım KB-1'e göre düzeltildi. [T7, T9] | ✅ |
| `K-GOLGE-MODEL` | Muhalefetin kendi programına göre hazırladığı ve iktidar modelinin karşısında seçenek sunabilen model. | **Muhalefet Modeli**<br>teknik: muhalefet modeli (eski ad: gölge model) | **Opposition Model**<br>technical: shadow model (yalnızca Birleşik Krallık ve Commonwealth metinlerinde) | TR: «gölge» gizli/kayıt dışı çağrışımı yapıyor ve projede «gölge dönem/gölgede» yetkisiz çalışma demek. EN: «shadow government» ABD'de gizli yapı, «shadow AI» izinsiz araç. [T7, T9] | ✅ |

### B. Yapılar

| Kimlik | Tanım (dilden bağımsız) | Türkçe: halk adı / teknik ad | English: public name / technical name | Gerekçe | Durum |
|---|---|---|---|---|---|
| `K-DEVLET-AGI` | Devletin bütün yapay zekâ rollerinin birbirine bağlı çalıştığı ortak düzen. | **Kamu Ağı**<br>teknik: devlet sinir ağı | **Government Network**<br>technical: AI agent network | TR: «ağ» herkesin bildiği söz; «sinir ağı» teknik katmanda kalır. EN: gerçek BT ağlarıyla karışabilir (GovNet); ilk kullanımda tanımlanır. [T16] | ✅ |
| `K-ORTAK-PROTOKOL` | Devletin yapay zekâ rollerinin birbirleriyle haberleşirken uyduğu ortak kurallar. | **Ortak Yazışma Usulü**<br>teknik: ortak ajan protokolü | **Common Standard**<br>technical: common agent protocol | TR: «protokol» nezaket kuralı; «yazışma usulü» kâtip ailesiyle uyumlu, Resmî Yazışmalar yönetmeliğiyle karışmasın diye hep «ortak» ile. EN: «protocol» sıradan okura nezaket/hastane, «Protocols» sahte metin çağrışımı; teknik katmanda doğal ad. [T14, T15] | ✅ |
| `K-KAMU-DEFTERI` | Kararların ve verilerin izini, kişisel veri içermeden (yalnızca toplu özetler ve kişisel olmayan üst veri), birden çok kurumun elinde tutarak sonradan sessizce değiştirilemez biçimde kaydeden düzen. | **Kamu Defteri**<br>teknik: blokzincir defteri | **Shared Record**<br>technical: tamper-evident ledger | TR: «defter» güven ve kayıt imgesi; «silinmez» denmez, çünkü kişisel veri defterde değil ayrı ve silinebilir yerde. e-Defter karışması sınanacak. EN: «Public Record» hukuki terim ve herkese açıklık vaadi; defter izinli ve kademeli erişimli. [T10, T15] | ✅ |
| `K-KAMU-TEMELI` | Birden çok bağımsız kaynaktan temel yapay zekâ modellerini kamuya ve partilere sağlayan ortak altyapı. | **Kamu Temeli**<br>teknik: Ortak Kamu Model Altyapısı | **Public Model Library**<br>technical: common public model infrastructure | TR: «altyapı» soğuk, «temel» temel model anlamını taşıyor. EN: «Commons» Avam Kamarası ya da jargon; «Library» çok kaynaktan ödünç alınır. [T14, T15] | ✅ |

### C. Söz ve mühür

| Kimlik | Tanım (dilden bağımsız) | Türkçe: halk adı / teknik ad | English: public name / technical name | Gerekçe | Durum |
|---|---|---|---|---|---|
| `K-SOZ-BELGESI` | Partinin seçimden önce halka verdiği ve hukuken esas sayılan yazılı söz. | **Söz Belgesi**<br>teknik: Söz Belgesi | **Binding Pledge**<br>technical: binding pledge | Zaten Türkçe; «söz vermek» güven kalıbı. EN: güçlü ve doğal. [T16] | ✅ |
| `K-MUHUR` | Söz Belgesi'nin ve modelin seçimden önce çok kurum imzasıyla değiştirilemez biçimde kaydedilmesi. | **Mühür**<br>teknik: mühür | **Seal**<br>technical: seal | «Mühür vurmak» bağlayıcılığı taşır. EN: onay damgası okunabilir; «sealed before the vote» diye açıklanır. [T16] | ✅ |
| `K-MUHURLU-ZARF` | Modelin ağırlıklarının, isteminin, araç ve yetki listesinin, ayarlarının ve sürümünün bir bütün olarak mühürlenmiş hâli. | **Mühürlü Zarf**<br>teknik: Mühür Paketi | **Sealed Version**<br>technical: sealed release package | TR: «kapalı zarf» halk imgesi; içi gizli değildir, kim neyi görebilir yanında yazılır; «Mühür Paketi» karar metinlerinde teknik ad. EN: «Release» yazılım sürümü ya da tahliye, «sealed envelope» gizlilik çağrışımı yapar. [T14, T15] | ✅ |
| `K-SOZ-KAPISI` | Modelin dışında duran, kırmızı çizgileri her eylemde denetleyen ve insanın okuyabildiği kural katmanı. | **Söz Kapısı**<br>teknik: Söz Kapısı | **Guardrails**<br>technical: pledge enforcement layer | TR: «söz» konuşma anlamında sansür sesi verebilir; ilk kullanımda açıklanır. EN: yerleşik ad; bunların sert sınır olduğu yazılır. [T15, T16] | ✅ |
| `K-GERI-ADIM-YOK` | Seçimden sonra modelin ya da iktidarın tek taraflı olarak yapay zekânın yetkisini genişletmesini veya yurttaşın durumunu mühürlü davranışa göre kötüleştirmesini yasaklayan; yalnızca yetkiyi daraltan ve yurttaşın lehine olan değişikliğe izin veren kural. | **Tek Yön**<br>teknik: çıkrık | **One-Way Rule**<br>technical: non-regression rule | TR: «Geri Adım Yok» inat gibi okunuyor; proje belgeleri zaten «tek yönlü çıkrık» diyor. EN: «No-Rollback» geri alınamaz gibi okunur, «Never Worse Off» aşırı vaat. Kimlik değişmez. [T11] | ✅ (TR sınanacak) |
| `K-B-PLANI` | Seçimden önce sözün parçası olarak yazılıp oylanan, belirli bir koşul oluşunca devreye giren alternatif yol. | **B Planı**<br>teknik: B Planı | **Fallback Plan**<br>technical: contingency plan | TR: günlük dilde yerleşik. EN: «Plan B» bir markayla ve şakacı kullanımla anılıyor. «Yedek paket» (mühürlü yedek model) ayrı bir kavramdır. [T13] | ✅ |
| `K-KAPSAM-RAPORU` | Bir modelin hangi işlerde ve hangi sınırlar içinde sınandığını gösteren, «sertifika» yerine geçen açık rapor. | **Kapsam Raporu**<br>teknik: kapsam raporu | **Scope Report**<br>technical: scope report (sektörün «model card» belgesi benzerdir, aynı değildir) | TR: sade. EN: «Model Card» laboratuvarın kendi belgesidir, devletin mühürlü kapsam bildirimi değil. [T14, T16] | ✅ |

### D. İnsan rolleri ve kurumlar

| Kimlik | Tanım (dilden bağımsız) | Türkçe: halk adı / teknik ad | English: public name / technical name | Gerekçe | Durum |
|---|---|---|---|---|---|
| `K-MECLIS` | Seçilmiş insanların kanunları kabul ettiği organ. | **Meclis**<br>teknik: Meclis | **Legislature**<br>technical: legislature | TR: yerleşik. EN: «Assembly», «citizens' assembly» ile karışır; her ülke kendi adını (Parliament, Congress...) yazar. [T14] | ✅ |
| `K-YURTTAS-PANELI` | Kurayla seçilen, ücretli yurttaşlardan oluşan; kanunların ikinci okumasını yapan, görüş bildiren ve referandum isteyebilen, ama karar organı olmayan kurul. | **Yurttaş Heyeti**<br>teknik: Yurttaş Paneli | **Citizens' Panel**<br>technical: citizens' panel | TR: «panel» televizyon tartışması; «heyet» kurul sıcaklığı taşır, yanında «karar vermez» yazılır. EN: karar organı olmadığı için «Panel» («Jury» hüküm çağrışımı yapar). Sözlükteki «Yurttaş meclisi» emekli. [T15] | ✅ |
| `K-ATAMA-ANAYASASI` | Denetim organlarının kura ve nitelik havuzuyla oluşturulmasını düzenleyen kurallar bütünü. | **Atama Anayasası**<br>teknik: Atama Anayasası | **Appointments Charter**<br>technical: appointments charter | Kurallar gerçekten temel düzeyde. EN: «Appointments» atama dili; kayırma çağrışımı izlenebilir. [T16] | ✅ |
| `K-SECENEK-SORUMLUSU` | İnsana sunulan seçenek kümesinin yeterliliğinden adıyla sorumlu olan insan makam. | **Seçenek Sorumlusu**<br>teknik: küme sorumlusu | **Shortlist Officer**<br>technical: option-set officer | TR: «küme» matematik dili, «sorumlu» insan olduğunu söyler. EN: «Slate» yalnız ABD'de anlaşılır. [T14, T15] | ✅ |
| `K-LIYAKAT-KURULU` | Atamalardaki liyakat ölçütlerini önceden ilan eden bağımsız kurul. | **Liyakat Kurulu**<br>teknik: Liyakat Kurulu | **Merit Board**<br>technical: merit board | TR: «liyakat» tartışmada yerleşik. EN: ABD'de Merit Systems Protection Board ve «merit» siyasi yük taşıyabilir; İngiltere'de nötr. [T16] | ✅ |
| `K-DURUSTLUK-KURUMU` | Yolsuzlukla mücadele işlevini taşıyan bağımsız kurum (ülkede böyle bir kurum varsa o görevlendirilir). | **Dürüstlük Kurumu**<br>teknik: Bağımsız Bütünlük Kurumu (BBK) | **Integrity Commission**<br>technical: integrity commission | TR: «bütünlük» integrity'nin çevirisi gibi (K27), halk adı «dürüstlük»; Kamu Denetçiliği Kurumu ile karışmaması için görev tanımı yazılır. EN: gerçek kurumlar bu adı taşıyor. [T15] | ✅ |
| `K-SOZ-DENETIM-KURULU` | Mühürlü modelin sözle uyumunu inceleyen ve etki raporu hazırlayan kurul. | **Söz Denetim Kurulu**<br>teknik: Model Denetim Kurulu | **Pledge Audit Board**<br>technical: model audit board | TR: «Söz» ailesi (Belgesi, Kapısı). EN: Meta'nın «Oversight Board»'u ve «Oversight Level» ile karışmasın. [T14, T15] | ✅ |

### E. Yurttaş güvenceleri

| Kimlik | Tanım (dilden bağımsız) | Türkçe: halk adı / teknik ad | English: public name / technical name | Gerekçe | Durum |
|---|---|---|---|---|---|
| `K-YURTTAS-GUVENCESI` | Yapay zekâ kararlarında geçim ödemelerinin şüpheyle kesilmemesini, aleyhe kararın insan onayı istemesini ve hata bedelinin kuruma yazılmasını güvence altına alan hükümler bütünü. | **Yurttaş Güvencesi**<br>teknik: Yurttaş Güvence Paketi | **Citizen Guarantees**<br>technical: citizen guarantee provisions | TR: «paket» soğuk, halk adı «güvence». EN: «safeguards» İngiltere'de çocuk koruma dilidir. [T14, T15] | ✅ |
| `K-HATA-HESABI` | Otomatik verilen kararların hata bedelinin, hizmeti yürüten kurumun bütçesinde ayrı bir hesaba yazılması; hesap aşılırsa ilgili karar türü insan onayına çıkar. | **Hata Hesabı**<br>teknik: Hata Hesabı | **Mistakes Account**<br>technical: error cost account | TR: «Yanlışın Faturası» reddedildi, «faturayı halk öder» deyimi tersini çağrıştırır. EN: «Redress» resmî ve yalnızca ödemeyi anlatır. [T14, T15] | ✅ |
| `K-DEVLET-SENI-ARAR` | Devletin, yurttaşın hakkı olan bir hizmeti kendi kayıtlarında bulup yurttaşa teklif etmesi; yurttaş onaylar, otomatik tanıma değildir. | **Hakkın Kapına Gelir**<br>teknik: proaktif hak teklifi (eski ad: Devlet Seni Arar) | **Benefits That Find You**<br>technical: proactive entitlement offer | TR: «Devlet Seni Arar» telefon dolandırıcılığına çok yakın. EN: «No application needed» aşırı vaat (teklif ve onaydır), «entitlement» yüklü. Tanım Temeller FA-07'ye göre düzeltildi. [T6] | ✅ |
| `K-YURTTAS-PAYI` | Ortak kamu gelirinden hak sahibi her yetişkine aylık, eşit ve koşulsuz ödenen pay; adı ve hak sahipliği kararlaşmamıştır. | **Yurttaş Payı (geçici)**<br>teknik: Yurttaş Payı | **Citizen's Dividend (provisional)**<br>technical: citizen's dividend | Ad hak sahipliğini peşinen belirliyor: «yurttaş / citizen» ile «yerleşik / resident» aynı şey değil. Varsayılan ad korundu. [T17] | 🧭-2 |
| `K-GECIS-GUVENCESI` | İşi yapay zekâ nedeniyle azalan kişiye yeni bir işe geçerken sağlanan gelir desteği; mevcut işsizlik sigortasının tetikli genişlemesi. | **Köprü Güvencesi**<br>teknik: Geçiş Güvencesi | **Bridge Support**<br>technical: transition support | TR: «köprü» sıcak ve görsel. EN: «bridge» açık. [T15, T16] | ✅ |
| `K-MAHALLE-KATKISI` | Mahalle düzeyinde, ayda en çok 24 saat için ödenek verilen küçük kamu yararı işleri (pilot). | **Mahalle Katkısı**<br>teknik: Mahalle Katkısı | **Neighbourhood Work**<br>technical: neighbourhood public-benefit work (pilot) | TR: «imece» gönüllülük çağrıştırır, ödenekli işe yanlış beklenti kurar. EN: «Jobs» istihdam vaadi, «community service» ceza. Ölçek hep yanında yazılır. [T14, T15] | ✅ |
| `K-BAKIS-GORUNUMU` | Yurttaşın kendisiyle ilgili kayıtlara hangi birim ve rolün, hangi gerekçeyle baktığını görebildiği; değiştirilemez erişim kayıtlarından türeyen görünüm. | **Kim Baktı?**<br>teknik: Bakış Görünümü | **Who Looked?**<br>technical: access view | TR: yurttaşın sorusu; yanında «kişiyi değil birimi ve rolü gösterir» yazılır. EN: «Access Log» BT jargonu. [T14, T15] | ✅ |
| `K-SIRA-DEFTERI` | Kıt kamu hizmetlerinde (kreş, yurt gibi) sıra kuralının herkese açık ve mühürlü olduğu, kişinin yalnızca kendi durumunu görebildiği kayıt düzeni. | **Sıra Defteri**<br>teknik: Sıra Defteri | **Waiting List**<br>technical: sealed queue register | Zaten Türkçe ve doğal. EN: çok doğal; kişiye dönük kart: «Sıram Nerede?» / «Where am I in the queue?». [T16] | ✅ |

### F. Kademe, üst norm, uyarlama

| Kimlik | Tanım (dilden bağımsız) | Türkçe: halk adı / teknik ad | English: public name / technical name | Gerekçe | Durum |
|---|---|---|---|---|---|
| `K-BASAMAK` | Bir kararda insan denetiminin ağırlığını belirleyen üç kademe: lehe ve düşük etkili kararlar kanundaki koşullarla yapay zekâda kalabilir, takdir gerektiren ve aleyhe kararlar insan onayı ister, anayasal taban kararlarında insan önce kendi değerlendirmesini yapar. | **Kademe (Birinci: otomatik karar · İkinci: insan onaylı · Üçüncü: önce insan)**<br>teknik: Kademe | **Oversight Level (Level 1 Automatic · Level 2 Human-Approved · Level 3 Human-First)**<br>technical: oversight level | TR: «Basamak» yerine «Kademe»: 498 satırda yerleşik, «basamak/merdiven» Hak Merdiveni ile çakışıyor. EN: «Tier» COVID kademeleri ve abonelik demek. Kimlik değişmez. [T12] | ✅ |
| `K-UST-NORM` | Evrensel insan hakları metni; bütün anayasa ve yasaların uymak zorunda olduğu en üst kural. | **Hak Çatısı**<br>teknik: üst norm | **Human Rights Charter**<br>technical: supreme norm | TR: «çatı» yerleşik; Hak-İş ve dinî ses için ilk kullanımda açıklanır. EN: «Universal Charter» belirsiz. Metnin kendi adı (Beyanname) ayrı bir konu. [T14] | ✅ |
| `K-ULKE-UYARLAMASI` | Bir ülkenin evrensel çerçeveyi (başta üst normu) kendi hukuk düzenine, diline ve geleneğine uyarlaması. | **Ülke Uyarlaması**<br>teknik: ülke uyarlaması | **National Version**<br>technical: country adaptation | TR: yalın. EN: «National Adaptation Plan» iklim politikası terimi. Tanım, depodaki kullanıma göre (countries/turkiye) genişletildi. [T14] | ✅ |


## Kullanım notları (özet)

Tam metin: `05-hakem-karari.md`, Bölüm 2 (kullanım kuralı) ve Bölüm 4 (diğer diller için rehber).

- **Kâtip adları ve Uygunluk Gözetmeni:** ilk geçişte «(yapay zekâ)» yazılır. Kademe düz sözle yazılır. Birinci Kademe'de «karar verdi» yazılır; «imza» sözü kullanılmaz. «Kâtip» tek başına unvan olmaz. Hukuki metinde teknik ad yazılır.
- **Assistant adları (English):** ilk geçişte «(AI)» yazılır. Level 1'de «decided», asla «assisted». «Assistant» bir rütbenin önünde ya da unvan biçiminde kullanılmaz.
- **«Denetçi», «nöbetçi», «gözcü»** sözcükleri projede insan rolleri için ayrılmıştır; yapay zekâ rollerine verilmez.
- **«Devlet telefonla, mesajla ya da kapıda para, şifre veya kod istemez»** cümlesi Hakkın Kapına Gelir bildirimlerinde bulunur.
- **Kamu Defteri için «silinmez» denmez;** «sessizce değiştirilemez» denir. Kişisel veri defterde değildir.

## Değişen adlar (eski → yeni)

Önerici belgesi (`02-oneriler.md`) ile kesinleşen ad arasındaki fark. Organizatör, halka dönük belgeleri güncellerken bu tablodan yararlanır (`TASKS.md` W-03). Teknik adlar mevcut karar metinlerinde değişmez.

**Türkçe halk adı değişen kavram: 7 / 42**

| Kimlik | Önerilen Türkçe ad | Kesinleşen Türkçe halk adı | Madde |
|---|---|---|---|
| `K-YURUTME-AJANI` | Hizmet Kâtibi | Kamu Kâtibi | T5, T8 |
| `K-YARGI-AJANI` | Adalet Kâtibi | Yargı Kâtibi | T5, T8 |
| `K-UYGUNLUK-AJANI` | Uygunluk Gözcüsü | Uygunluk Gözetmeni | T4, T8 |
| `K-GOLGE-MODEL` | Gölge Model | Muhalefet Modeli | T7, T9 |
| `K-GERI-ADIM-YOK` | Geri Adım Yok | Tek Yön | T11 |
| `K-DEVLET-SENI-ARAR` | Devlet Seni Arar | Hakkın Kapına Gelir | T6 |
| `K-BASAMAK` | Basamak | Kademe | T12 |

**English public name değişen kavram: 28 / 42**

| Kimlik | Önerilen English name | Kesinleşen English public name | Madde |
|---|---|---|---|
| `K-AJAN` | Aide | Assistant | T2, T3, T8 |
| `K-YASAMA-AJANI` | Drafting Aide | Drafting Assistant | T2, T8 |
| `K-YURUTME-AJANI` | Service Aide | Service Assistant | T5, T8 |
| `K-YARGI-AJANI` | Judicial Aide | Disputes Assistant | T5, T8 |
| `K-NORM-AJANI` | Rules Aide | Rules Assistant | T8 |
| `K-UYGULAMA-AJANI` | Casework Aide | Processing Assistant | T3, T8 |
| `K-KIRMIZI-TAKIM` | Red Team | Stress-Test Team | T8 |
| `K-HALK-AJANI` | Public Aide | Citizens' Assistant | T2, T8 |
| `K-IKTIDAR-MODELI` | Governing Model | Mandate Model | T7, T9 |
| `K-GOLGE-MODEL` | Shadow Model | Opposition Model | T7, T9 |
| `K-ORTAK-PROTOKOL` | Common Protocol | Common Standard | T14, T15 |
| `K-KAMU-DEFTERI` | Public Ledger | Shared Record | T10, T15 |
| `K-KAMU-TEMELI` | Public Model Commons | Public Model Library | T14, T15 |
| `K-MUHURLU-ZARF` | Sealed Release | Sealed Version | T14, T15 |
| `K-GERI-ADIM-YOK` | No-Rollback Rule | One-Way Rule | T11 |
| `K-B-PLANI` | Plan B | Fallback Plan | T13 |
| `K-KAPSAM-RAPORU` | Model Card | Scope Report | T14, T16 |
| `K-MECLIS` | Assembly | Legislature | T14 |
| `K-SECENEK-SORUMLUSU` | Slate Officer | Shortlist Officer | T14, T15 |
| `K-SOZ-DENETIM-KURULU` | Model Oversight Board | Pledge Audit Board | T14, T15 |
| `K-YURTTAS-GUVENCESI` | Citizen Safeguards | Citizen Guarantees | T14, T15 |
| `K-HATA-HESABI` | Redress Account | Mistakes Account | T14, T15 |
| `K-DEVLET-SENI-ARAR` | Proactive Entitlement | Benefits That Find You | T6 |
| `K-MAHALLE-KATKISI` | Neighbourhood Jobs | Neighbourhood Work | T14, T15 |
| `K-BAKIS-GORUNUMU` | Access Log | Who Looked? | T14, T15 |
| `K-BASAMAK` | Oversight Tier | Oversight Level | T12 |
| `K-UST-NORM` | Universal Charter | Human Rights Charter | T14 |
| `K-ULKE-UYARLAMASI` | National Adaptation | National Version | T14 |
