# Terimler Tartışması — 02: Öneriler

- **Hazırlayan:** Terim önerici (fikir ajanı)
- **Tarih:** 2026-11-09
- **Durum:** Yurttaş gözü ve hakem incelemesini bekliyor. Bu belge öneridir, karar değildir.

## 0. Yaklaşım

İki kurucu girdisine göre çalıştım.

- **K26:** Temel kavramlara halkın benimseyeceği, sıcak, anlaşılır ve güven veren adlar verilir.
- **K27:** "Terimlerde sözlük çevirisi kullanma. Her milletin kendi dilinin özel kelimelerini ve cümle yapılarını kullan."

K27 yüzünden yöntemi değiştirdim.

1. **Önce kavram, sonra ad.** Her kavrama dilden bağımsız bir **kavram kimliği** ve tek cümlelik bir **tanım** verdim. Bağlayıcı olan bunlardır. Adlar dile göre değişir.
2. **Türkçe adlar Türkçeden gelir.** Yabancı bir terimin çevirisi gibi durmasın diye Türkçedeki kurum, meslek ve deyiş kalıplarına baktım (kâtip, defter, yazışma usulü, "Geri Adım Yok", "Kim Baktı?" gibi).
3. **İngilizce adlar çeviri değildir.** Bir İngilizce konuşurun aynı kavrama doğal olarak vereceği adı seçtim (aide, guardrails, model card, integrity commission gibi). Anlamları Türkçe adla birebir aynı olmak zorunda değil, aynı kavramı taşıyorlar.
4. **Kimlik öneki.** Kavram kimlikleri `K-` ile başlar, ama kurucu girdileri olan K1–K27 ile karıştırılmamalı. Kimliklerde sayı yok, ad var (K-AJAN gibi).

Ek bir ölçüt ekledim: **örtmeme.** Sıcak ad gerçeği örtmemeli. Basamak 1'de bazı kararlar kendiliğinden verilir. Bunu "yardımcı" ya da "çırak" diye küçülten bir ad halkı yanıltır. Tersine, "yönetici" ya da "akıl" gibi bir ad da yetkiyi şişirir. Aşağıdaki aile karşılaştırmasında bunu ayrıca değerlendirdim.

Bu belge `terminology-tr-en.md` dosyasını değiştirmez. O dosya Türkçeden İngilizceye sözlük çevirisi mantığıyla yazılmış. K27'ye göre yerini bölüm 2'deki kavram kaydı alacak. Bu geçişi organizatör yapar.

## 1. Ad ailesi önerileri

Bütün yapay zekâ rolleri aynı kalıptan türesin diye altı aday aile çıkardım. İlk beşi tam aile, altıncısı tamamlayıcı. Her birini aynı sınavdan geçirdim: anlam, çağrışım, sadelik, rollerde tutarlılık, dürüstlük ve cümlede kulağa gelişi.

### 1.1 Aileler

| Aile | Kalıp | Örnek adlar | Güçlü yanı | Çağrışım riski (dürüst değerlendirme) |
|---|---|---|---|---|
| **A. Yardımcı** | "[alan] Yardımcısı" | Yasa Yardımcısı, Hizmet Yardımcısı | Günlük dilde en yalın söz. "Yardım eder, karar insandadır" fikrini doğrudan söyler | **Ağır rütbe çakışması.** Türkçede "X yardımcısı" başkan, vali, müdür yardımcısı gibi bir **üst rütbenin ikincisi** demektir. Yapay zekâ "yasa yardımcısı" olunca yetkili biri sanılır. Ayrıca devlet memurluğunda "Yardımcı Hizmetler Sınıfı" diye bir sınıf var ve haberlerde sık geçiyor; "hizmet yardımcısı" adı bu sınıfla karışır. Basamak 1'deki özerkliği de küçültür |
| **B. Emanetçi** | "[alan] Emanetçisi" | Yasa Emanetçisi, Adalet Emanetçisi | "Yetki halkın emanetidir" fikrine en çok uyan aile. Yetkiyi gerçek ve geri alınabilir gösterir. **Örtmeme ölçütünde en dürüst aile** | Günlük dilde "emanet" bırakılan eşyayı çağrıştırır. "Emaneti teslim etmek" deyimi ölmek anlamına gelir (bu iki çağrışımı kaynakla doğrulamadım, dil bilgime dayanıyor). Cümlede garip duyulur: "Emanetçi dosyayı açtı" |
| **C. Kâtip** | "[alan] Kâtibi"; bağımsız denetleyenler için "[alan] Gözcüsü" | Yasa Kâtibi, Hizmet Kâtibi, Adalet Kâtibi; Uygunluk Gözcüsü | Yazan, kaydeden, **imzayı insana bırakan** meslek. "Kâtip yazar, amir imzalar" kalıbı bu projenin tasarımını kendiliğinden anlatır. Mahkemelerde "zabıt katibi", Meclis'te "kâtip üye" olarak bugün de yaşıyor (Meclis'teki kâtip üyeyi arama sonuçlarında gördüm). Kayıt tutma çağrışımı Kamu Defteri ile uyumlu. Cümlede rahat | Eski ve Arapça kökenli. Yazı işini çağrıştırdığı için, hizmet yürüten ya da karar hazırlayan rolleri biraz küçültür. Mahkeme ve Meclis'teki gerçek kâtiplerle karışabilir (insan çalışanların yerine geçildiği algısı doğabilir) |
| **D. Usta–Kalfa** | "[alan] Kalfası" | Hizmet Kalfası, Kural Kalfası | Sıcak, esnaf kültürüne yakın. Kalfa çalışır, **usta (insan) onaylar ve sorumlu olur**; "ajan verdi" mazeret değildir ilkesini ("kalfanın hatasından usta sorumludur") anlatır | Yargı gibi ağır alanlarda tuhaf kalır ("Yargı Kalfası"). Kalfa zamanla usta olur; bu "yapay zekâ bir gün usta olacak" izlenimi verir. "Saray kalfası" çağrışımı da var |
| **E. Eski Türkçe kökler** | "bitikçi" gibi köklerden | Bitikçi (yazıcı) | Köken olarak en "bizden" | Halk bunu anlamaz. Eski Türkçe kaynaklarda bu kökleri doğrulayamadım (denediğim arama sonuç vermedi); kesin bilgi gerekirse dil uzmanına sorulmalı. Sadelik ölçütünde zayıf |
| **F. Gözcü / Nöbetçi** (tamamlayıcı) | "[alan] Gözcüsü" | Uygunluk Gözcüsü | Denetleyen rolü, işi yapan rolden ayırıyor. "Nöbetçi" dilimizde "nöbetçi eczane" gibi güven verici bir hizmet çağrışımı taşır | "Gözcü" gözetim ve izleme korkusu çağrıştırabilir. "Bekçi" adını bilerek dışarıda bıraktım: projede "bekçi yönetim" diye başka bir kavram var |

### 1.2 Öneri

**Ana öneri: C ailesi (Kâtip), denetleyen roller için F'nin "Gözcü" kökü.**

Gerekçe:
1. **Tasarımı ad olarak söylüyor.** Yazan kâtiptir, imza insanındır. K17 (insan seçenekler arasından seçer) ve "egemenlik insandadır" ilkesi adın içinde.
2. **Cümlede en doğal ses.** Aşağıdaki halk dili örneğinde denedim. "Yardımcı" ailesinde cümle rütbe gibi, "emanetçi" ailesinde eşya gibi duyuluyor.
3. **İki kökün bilinçli ayrımı.** İşi yapanlar "Kâtip", işi **bağımsız denetleyenler** "Gözcü" olur. Bu, kimsenin kendi işini denetlememesi ilkesini (uygunluk ajanının uygulayandan bağımsız olması) ad düzeyinde görünür kılar.
4. **Yerleşik çağrışımı dar ve olumlu:** kâtip, kimseye hükmetmez. Her zaman birinin adına yazar.

**Bilinen zayıflıklar:**
- Küçültme riski: Basamak 1'de ajan lehe kararı kendiliğinden verir. "Kâtip" adı bunu hafife alır. Önlem: halk dilindeki ad bilgilendirmede kullanılır, hukuki metinde **teknik ad** ("yürütme ajanı") kalır ve her kâtibin **yetki sınırı** açıkça yayımlanır.
- İnsan kâtiplerle karışma: mahkeme kâtibi ya da Meclis kâtip üyesi sanılabilir. Önlem: ad hep alan sözcüğüyle birlikte kullanılır ("Hizmet Kâtibi").
- Eski ve Arapça kökenli bir söz. Yine de yüzyıllardır kamu dilinde yaşıyor ve herkes anlıyor; K27'nin "öz kelime" beklentisini tam karşılamıyor.

**Yedek öneriler** (hakem ve yurttaş gözü karar verirken):
- Sıcaklık ağır basarsa **D (Kalfa)**. Yargı, norm ve denetim rollerinde ayrı ad gerektirir.
- Dürüstlük ağır basarsa **B (Emanetçi)**, ama cümlede tuhaflığı çözülmeden önerilmez.
- **A (Yardımcı) ailesini önermiyorum.** Rütbe çakışması ciddi ve düzeltilemiyor.

### 1.3 Çakışma kontrolü (kısa web denetimi)

Kapsamlı marka ya da alan adı taraması yapmadım. Yalnızca birkaç hızlı aramayla baktım. Bulgular:

| Ad | Ne buldum | Sonuç |
|---|---|---|
| Yardımcı Hizmetler Sınıfı | Devlet memurluğunda bu adla bir sınıf var (haber ve mevzuat sonuçlarında geçiyor) | A ailesini zayıflatıyor |
| Kâtip üye | TBMM'de "kâtip üye" görevi var (haberlerde ve içtüzükte geçiyor) | Çakışma var ama destekleyici bir görev; alan sözcüğüyle birlikte kullanılacak |
| Resmî Yazışmalarda Uygulanacak Usul ve Esaslar Hakkında Yönetmelik | Bu adla bir yönetmelik var | "Ortak Yazışma Usulü" önerisine zemin; ad birebir aynı değil |
| Kamu Denetçiliği Kurumu (Ombudsmanlık) | Türkiye'de var | "Dürüstlük Kurumu" önerisiyle karışmasın diye hakem görev tanımını netleştirmeli |
| "Dürüstlük Kurumu", "Halk Kâtibi", "Kamu Defteri" | Aramalarda kurum, marka ya da yazılım adı olarak bulamadım | Bulamamak yokluğu kanıtlamaz; yazılım ve mevzuat adlarında ("e-Defter", "Defter-Beyan Sistemi" gibi vergi ve tarım sistemleri var) "defter" sözcüğü başka bir anlamda kullanılıyor. "Kamu Defteri" bunlarla karıştırılabilir |
| Arzuhalci | Dilekçe yazan meslek ve geleneği var; hukuki sorumlulukları tartışılıyor | "Halk Kâtibi" adının dayanağı, ama arzuhalcilikle karışabilir |
| Yazman | TDK karşılıkları sözlüğünde bulamadım | "Yazman" önerisini doğrulayamadığım için aday listesinden çıkardım |

## 2. Kavram kaydı

Biçim: **kavram kimliği | tanım | Türkçe ad | İngilizce ad | diğer diller.** Teknik adı ve adayları her grubun altındaki ikinci tabloya koydum. "Diğer diller" sütunu şimdilik boş; her millet kendi adını K27'ye göre seçecek (bölüm 4).

Tanımlar dilden bağımsız yazıldı. Tanımların dayanağı projedeki karar belgeleri (Temeller, Ekonomi–Yolsuzluk, Görünür Devlet hakem kararları, sözlük). Emin olmadığım yerlerde tanımın sonuna "(doğrulanmalı)" yazdım.

### 2.1 Yapay zekâ rolleri

| Kimlik | Tanım | Türkçe ad | İngilizce ad | Diğer diller |
|---|---|---|---|---|
| K-AJAN | Belirli bir görev ve yetki sınırı içinde, insanlar adına ve onların denetiminde iş gören yapay zekâ | **Kâtip** | Aide | — |
| K-YASAMA-AJANI | Yasa taslağını ve etki çözümlemesini hazırlayan, kabul yetkisi insanlarda kalan yapay zekâ | **Yasa Kâtibi** | Drafting Aide | — |
| K-YURUTME-AJANI | Yasaları uygulayan ve kamu hizmetlerini yürüten yapay zekâ | **Hizmet Kâtibi** | Service Aide | — |
| K-YARGI-AJANI | Uyuşmazlıkları inceleyen ve hukuka uygunluk denetimi yapan yapay zekâ | **Adalet Kâtibi** | Judicial Aide | — |
| K-NORM-AJANI | Bir kural düzeyinin (anayasa, kanun, yönetmelik) sınırını gözeten ve üstündeki kurala aykırı iş yapamayan yapay zekâ | **Kural Kâtibi** | Rules Aide | — |
| K-UYGULAMA-AJANI | Bir kuralı somut bir işleme uygulayan yapay zekâ | **İşlem Kâtibi** | Casework Aide | — |
| K-UYGUNLUK-AJANI | Bir işlemin kurala uygunluğunu, işi yapandan bağımsız bir kurum ve model soyuyla denetleyen yapay zekâ | **Uygunluk Gözcüsü** | Independent Reviewer | — |
| K-KIRMIZI-TAKIM | Sistemi kötüye kullanım ve zayıflık açısından sürekli sınayan bağımsız yapay zekâ | **Sınama Ekibi** | Red Team | — |
| K-DOSYA-KOORDINATORU | Bir işlem için ilgili kural ajanlarını kamuya açık kural haritasından bulan, her birinden uygunluk alan ve gerekçeleri tek kararda birleştiren yapay zekâ | **Dosya Kâtibi** | Case Coordinator | — |
| K-HALK-AJANI | Kamu karar kayıtlarını okuyup sorgulayan, hiçbir partiye ya da iktidara bağlı olmayan, yurttaş ve gazetecilerin kullanabildiği yapay zekâ | **Halk Kâtibi** | Public Aide | — |
| K-PARTI-MODELI | Bir partinin programına göre uyarlanmış, seçmenin seçimden önce deneyebildiği yapay zekâ modeli | **Parti Modeli** (değişiklik önermiyorum) | Party Model | — |
| K-IKTIDAR-MODELI | Seçimi kazanan partinin, devletin yapay zekâ ağını yönetmek için kullandığı modeli | **İktidar Modeli** (değişiklik önermiyorum) | Governing Model | — |
| K-GOLGE-MODEL | Muhalefetin kendi programına göre hazırladığı ve iktidar modelinin karşısında seçenek sunabilen model | **Gölge Model** (değişiklik önermiyorum) | Shadow Model | — |

| Kimlik | Adaylar | Teknik ad | Gerekçe |
|---|---|---|---|
| K-AJAN | Kâtip, Yardımcı, Kalfa, Emanetçi | ajan | "Ajan" casusu da çağrıştırır; "kâtip" ise yazan ve insan adına iş gören biridir, casusun tersi |
| K-YASAMA-AJANI | Yasa Kâtibi, Taslak Kâtibi, Yasa Yardımcısı | yasama ajanı | Taslağı yazar, kabul Meclis'indir; "yazan kâtip, kabul eden amir" kalıbına tam oturur |
| K-YURUTME-AJANI | Hizmet Kâtibi, Kamu Kâtibi, Yürütme Kâtibi | yürütme ajanı | "Hizmet" yurttaşın gördüğü şeydir; "yürütme" halk dilinde soyut kalıyor |
| K-YARGI-AJANI | Adalet Kâtibi, Dava Kâtibi, Yargı Kâtibi | yargı ajanı | Mahkemedeki kâtip geleneğine yakın; hüküm vermediğini söyler. Gerçek mahkeme kâtipleriyle karışma riski var |
| K-NORM-AJANI | Kural Kâtibi, Norm Kâtibi, Kural Bekçisi | norm ajanı | "Norm" yabancı kökenli ve soyut; "kural" herkesin dili |
| K-UYGULAMA-AJANI | İşlem Kâtibi, İş Kâtibi, Uygulama Kâtibi | uygulama ajanı | Dosyayı kaleme alıp işleyen kişi, kâtibin tam işi |
| K-UYGUNLUK-AJANI | Uygunluk Gözcüsü, Uygunluk Nöbetçisi, Uygunluk Kâtibi | uygunluk ajanı | Bağımsız olması gerektiği için işi yapan kâtiplerden ayrı bir kök ("Gözcü") aldı |
| K-KIRMIZI-TAKIM | Sınama Ekibi, Kırmızı Takım, Sınayıcılar | kırmızı takım ajanı | "Kırmızı takım" tehdit gibi duyuluyor; "sınamak" Türkçede olumlu bir iş |
| K-DOSYA-KOORDINATORU | Dosya Kâtibi, Dosya Sorumlusu, Dosya Başı | Dosya Koordinatörü | "Koordinatör" yabancı; "dosya sorumlusu" ise insan görevli gibi duyuluyor |
| K-HALK-AJANI | Halk Kâtibi, Halk Kılavuzu, Halkın Gözü | Halk Ajanı | Kapı önünde halk adına dilekçe yazan arzuhalci geleneğinden gelen bir çağrışım var; ama devlet adına değil halk adına çalışan olduğu için "halk" kökü |
| K-PARTI-MODELI | Parti Modeli, Parti Aklı, Program Kâtibi | parti modeli | Burada iyi bir halk adı bulamadım. "Akıl" yapay zekâya fazla insan zekâsı yükler ve "devlet aklı" tamlamasının otoriter çağrışımını getirir. "Model" Türkçede "örnek, kalıp" olarak yerleşmiş ve tarafsız. Hakem başka bir ad önerirse değerlendirilir |
| K-IKTIDAR-MODELI | İktidar Modeli, Yönetim Modeli | iktidar modeli | "İktidar" siyaset dilinde olağan bir söz; "yönetim modeli" iş dünyası terimiyle karışır |
| K-GOLGE-MODEL | Gölge Model, Muhalefet Modeli | gölge model | "Gölge kabine" Türkçede yerleşik; aynı mantık |

### 2.2 Yapılar

| Kimlik | Tanım | Türkçe ad | İngilizce ad | Diğer diller |
|---|---|---|---|---|
| K-DEVLET-AGI | Devletin bütün yapay zekâ rollerinin birbirine bağlı çalıştığı ortak düzen | **Kamu Ağı** | Government Network | — |
| K-ORTAK-PROTOKOL | Devletin yapay zekâ rollerinin birbirleriyle haberleşirken uyduğu ortak kurallar | **Ortak Yazışma Usulü** | Common Protocol | — |
| K-KAMU-DEFTERI | Kararların ve verilerin, birden çok kurumun elinde tutulan ve sonradan sessizce değiştirilemeyen kaydı | **Kamu Defteri** | Public Ledger | — |
| K-KAMU-TEMELI | Birden çok bağımsız kaynaktan temel yapay zekâ modellerini kamuya ve partilere sağlayan ortak altyapı | **Kamu Temeli** | Public Model Commons | — |

| Kimlik | Adaylar | Teknik ad | Gerekçe |
|---|---|---|---|
| K-DEVLET-AGI | Kamu Ağı, Devlet Ağı, Kâtipler Divanı | devlet sinir ağı | "Sinir ağı" bedensel ve soğuk; "ağ" herkesin bildiği bir söz. "Ağa düşmek" çağrışımı küçük bir risk. "Divan" saray ve Divan-ı Hümayun çağrışımı yüzünden elendi |
| K-ORTAK-PROTOKOL | Ortak Yazışma Usulü, Ortak Dil, Ortak Usul | ortak ajan protokolü | "Protokol" Türkçede nezaket kuralı demek. "Yazışma usulü" ise devlet dairelerinin bildiği bir kalıp |
| K-KAMU-DEFTERI | Kamu Defteri, Ortak Defter, Mühürlü Defter | blokzincir defteri | "Defter" zaten K15'in dilinde; "deftere geçmek, defteri dürmek" deyimleri güven ve kayıt anlatır. Not: vergi ve tarımdaki "e-Defter" ve "Defter-Beyan" sistemleriyle karışma ihtimali var |
| K-KAMU-TEMELI | Kamu Temeli, Ortak Temel, Kamu Atölyesi | Ortak Kamu Model Altyapısı | "Temel model" teknik adı da zaten "temel". "Altyapı" soğuk |

### 2.3 Söz ve mühür

| Kimlik | Tanım | Türkçe ad | İngilizce ad | Diğer diller |
|---|---|---|---|---|
| K-SOZ-BELGESI | Partinin seçimden önce halka verdiği ve hukuken esas sayılan yazılı söz | **Söz Belgesi** | Binding Pledge | — |
| K-MUHUR | Söz Belgesi'nin ve modelin seçimden önce çok kurum imzasıyla değiştirilemez biçimde kaydedilmesi | **Mühür** | Seal | — |
| K-MUHURLU-ZARF | Modelin ağırlıkları, istemi, araç ve yetki listesi, ayarları ve sürümünün bir bütün olarak mühürlenmiş hâli | **Mühürlü Zarf** | Sealed Release | — |
| K-SOZ-KAPISI | Modelin dışında duran, kırmızı çizgileri her eylemde denetleyen ve insanın okuyabildiği kural katmanı | **Söz Kapısı** | Guardrails | — |
| K-GERI-ADIM-YOK | Seçimden sonra ajan yetkisini genişletmeyi ve yurttaşın durumunu kötüleştirmeyi yasaklayan, yalnızca yurttaşın lehine dönebilen kural | **Geri Adım Yok** | No-Rollback Rule | — |
| K-B-PLANI | Seçimden önce sözün parçası olarak yazılıp oylanan, belirli bir koşul oluşunca devreye giren alternatif yol | **B Planı** | Plan B | — |
| K-KAPSAM-RAPORU | Bir modelin hangi işlerde ve hangi sınırlar içinde sınandığını gösteren, "sertifika" yerine geçen açık rapor | **Kapsam Raporu** | Model Card | — |

| Kimlik | Adaylar | Teknik ad | Gerekçe |
|---|---|---|---|
| K-SOZ-BELGESI | Söz Belgesi, Söz Senedi, Halk Sözü | Söz Belgesi | "Söz vermek, sözünü tutmak" Türkçenin en güçlü güven kalıplarından; ad zaten Türkçe, değiştirmeye gerek yok |
| K-MUHUR | Mühür, Damga, Mühürleme | mühür | "Mühür vurmak" deyimi hukuki bağlayıcılığı da taşır; ad zaten Türkçe |
| K-MUHURLU-ZARF | Mühürlü Zarf, Mühür Dosyası, Mühür Paketi | Mühür Paketi | "Paket" yazılım dili. "Kapalı zarf" ihale kalıbı herkesin bildiği bir şey: herkesin önünde açılır, değiştirilemez. "Dosya" adı Dosya Kâtibi ile karışırdı. Risk: zarf gizlilik çağrıştırabilir |
| K-SOZ-KAPISI | Söz Kapısı, Söz Bekçisi, Eşik | Söz Kapısı | Zaten Türkçe ve görsel ("kapıdan geçmeyen girmez") |
| K-GERI-ADIM-YOK | Geri Adım Yok, Tek Yön, Kazanılmış Hak Kuralı | çıkrık | "Çıkrık" (kuyudan su çeken makara) halkın bildiği bir kavram değil ve işlevi tam anlatmıyor. "Geri adım yok" Türkçede cümle olarak yerleşik bir söz ve "Devlet Seni Arar" gibi söz kalıbı adlarla uyumlu. "Kazanılmış hak" hukuk terimi olarak başka bir şey demek |
| K-B-PLANI | B Planı, Yedek Yol, Önceden Yazılmış Yol | B Planı | "B planı" halk dilinde zaten günlük kullanımda; değiştirmek yapaylık olur |
| K-KAPSAM-RAPORU | Kapsam Raporu, Sınır Raporu, Nerede Çalışır Raporu | kapsam raporu | Anlamı tutuyor, sade; daha iyi bir ad bulamadım |

### 2.4 İnsan rolleri ve kurumlar

| Kimlik | Tanım | Türkçe ad | İngilizce ad | Diğer diller |
|---|---|---|---|---|
| K-MECLIS | Seçilmiş insanların kanunları kabul ettiği organ | **Meclis** | Assembly | — |
| K-YURTTAS-PANELI | Kurayla seçilen, ücretli yurttaşlardan oluşan, karar organı olmayan danışma ve onay kurulu | **Yurttaş Heyeti** | Citizens' Panel | — |
| K-ATAMA-ANAYASASI | Denetim organlarının kura ve nitelik havuzuyla oluşturulmasını düzenleyen kurallar bütünü | **Atama Anayasası** | Appointments Charter | — |
| K-SECENEK-SORUMLUSU | İnsana sunulan seçenek kümesinin yeterliliğinden adıyla sorumlu olan kişi | **Seçenek Sorumlusu** | Slate Officer | — |
| K-LIYAKAT-KURULU | Atamalardaki liyakat ölçütlerini önceden ilan eden bağımsız kurul | **Liyakat Kurulu** | Merit Board | — |
| K-DURUSTLUK-KURUMU | Yolsuzlukla mücadele işlevini taşıyan bağımsız kurum (ülkede böyle bir kurum varsa o görevlendirilir) | **Dürüstlük Kurumu** | Integrity Commission | — |
| K-SOZ-DENETIM-KURULU | Mühürlü modelin sözle uyumunu inceleyen ve etki raporu hazırlayan kurul | **Söz Denetim Kurulu** | Model Oversight Board | — |

| Kimlik | Adaylar | Teknik ad | Gerekçe |
|---|---|---|---|
| K-MECLIS | Meclis, Millet Meclisi | Meclis | Zaten Türkçede yerleşik; değişiklik önermiyorum |
| K-YURTTAS-PANELI | Yurttaş Heyeti, Yurttaş Jürisi, Yurttaş Paneli | Yurttaş Paneli | "Panel" Türkçede tartışma toplantısı demek; kurayla seçilen bir kurulun işini anlatmıyor. "Heyet" jüri ve komisyon çağrışımıyla yakın. Not: sözlükteki "Yurttaş meclisi" ile belgelerdeki "Yurttaş Paneli" tutarsız; hakem tek ad seçmeli |
| K-ATAMA-ANAYASASI | Atama Anayasası, Atama Düzeni, Kura ve Liyakat Kuralı | Atama Anayasası | Değişiklik önermiyorum. "Anayasa" sözü büyük, ama bu kurallar gerçekten temel düzeydeler |
| K-SECENEK-SORUMLUSU | Seçenek Sorumlusu, Küme Sorumlusu, Seçenek Emini | küme sorumlusu | "Küme" matematik dili. Yanında "sorumlu" bırakmak, ajan değil insan olduğunu da belli ediyor |
| K-LIYAKAT-KURULU | Liyakat Kurulu, Hak Ediş Kurulu | Liyakat Kurulu | "Liyakat" Arapça kökenli ama dilde çok yerleşik; daha iyi bir halk sözü bulamadım |
| K-DURUSTLUK-KURUMU | Dürüstlük Kurumu, Doğruluk Kurumu, Temiz Eller Kurumu | Bağımsız Bütünlük Kurumu (BBK) | "Bütünlük" İngilizce "integrity" kelimesinin çevirisi gibi duruyor, K27'nin kaçınılmasını istediği şey tam bu. Türkçede bu fikre "dürüstlük" denir. Kamu Denetçiliği Kurumu ile karışmaması için görev tanımı net yazılmalı |
| K-SOZ-DENETIM-KURULU | Söz Denetim Kurulu, Model Denetim Kurulu | Model Denetim Kurulu | Kurulun işi modelin **söze** uyup uymadığına bakmak; ad bunu söylüyor |

### 2.5 Yurttaş güvenceleri

| Kimlik | Tanım | Türkçe ad | İngilizce ad | Diğer diller |
|---|---|---|---|---|
| K-YURTTAS-GUVENCESI | Yapay zekâ kararlarında geçim ödemelerinin şüpheyle kesilmemesini, aleyhe kararın insan onayı istemesini ve hata bedelinin kuruma yazılmasını güvence altına alan hükümler bütünü | **Yurttaş Güvencesi** | Citizen Safeguards | — |
| K-HATA-HESABI | Otomatik verilen kararların hata bedelinin, hizmeti yürüten kurumun bütçesinde ayrı bir hesaba yazılması; hesap aşılırsa ilgili karar türü insan onayına çıkar | **Hata Hesabı** | Redress Account | — |
| K-DEVLET-SENI-ARAR | Yurttaşın lehine olan hakların, başvuru beklenmeden devlet tarafından tanınması | **Devlet Seni Arar** | Proactive Entitlement | — |
| K-YURTTAS-PAYI | Ortak kamu gelirinden her yurttaşa koşulsuz verilen küçük bir pay (adı ve hak sahipliği kurucunun kararına bağlı) | **Yurttaş Payı** | Citizen's Dividend | — |
| K-GECIS-GUVENCESI | İşi yapay zekâ nedeniyle azalan kişiye yeni bir işe geçerken sağlanan gelir desteği; mevcut işsizlik sigortasının tetikli genişlemesi | **Köprü Güvencesi** | Bridge Support | — |
| K-MAHALLE-KATKISI | Mahalle düzeyinde, ayda en çok 24 saat için ödenek verilen küçük kamu yararı işleri (pilot) | **Mahalle Katkısı** | Neighbourhood Jobs | — |
| K-BAKIS-GORUNUMU | Yurttaşın kendisiyle ilgili kayıtlara hangi birim ve rolün, hangi gerekçeyle baktığını görebildiği; değiştirilemez erişim kayıtlarından türeyen görünüm | **Kim Baktı?** | Access Log | — |
| K-SIRA-DEFTERI | Kıt kamu hizmetlerinde (kreş, yurt gibi) sıra kuralının herkese açık ve mühürlü olduğu, kişinin yalnızca kendi durumunu görebildiği kayıt düzeni | **Sıra Defteri** | Waiting List | — |

| Kimlik | Adaylar | Teknik ad | Gerekçe |
|---|---|---|---|
| K-YURTTAS-GUVENCESI | Yurttaş Güvencesi, Geçimine Dokunulmaz, Yurttaş Güvence Paketi | Yurttaş Güvence Paketi | "Paket" soğuk bir yazılım ve pazarlama sözü. İlk iki aday da kullanılabilir; "Geçimine Dokunulmaz" paketin tamamını değil yalnızca bir maddesini söylüyor |
| K-HATA-HESABI | Hata Hesabı, Hata Payı Hesabı, Yanlışın Faturası | Hata Hesabı | "Hata hesabı" zaten Türkçe ve "hesap sormak" deyimini de çağrıştırıyor; değiştirmeye gerek yok |
| K-DEVLET-SENI-ARAR | Devlet Seni Arar, Hakkın Kapına Gelir | Devlet Seni Arar | Zaten cümle biçiminde bir ad, Türkçeye özgü; değiştirmeye gerek yok. Cümle adların uygun olduğunu gösteren iyi bir örnek |
| K-YURTTAS-PAYI | Yurttaş Payı, Ortak Pay, Halk Payı | Yurttaş Payı | "Pay" ortaklık çağrışımı taşır; olumlu |
| K-GECIS-GUVENCESI | Köprü Güvencesi, Geçiş Güvencesi, Yeni İşe Köprü | Geçiş Güvencesi | "Köprüden geçmek" hem günlük hem de yeni işe geçişi anlatan bir imge. "Geçiş" resmî ve soğuk |
| K-MAHALLE-KATKISI | Mahalle Katkısı, Mahalle İşi, Mahalle İmecesi | Mahalle Katkısı | "İmece" karşılıksız, gönüllü emek geleneğidir; ödenekli bir işe bu adı vermek yanlış beklenti kurar ve zorla çalıştırma riskini (Ekonomi E5) yumuşatır gibi duyulur. Bu yüzden önermiyorum |
| K-BAKIS-GORUNUMU | Kim Baktı?, Bakış Görünümü, Bakan Kim | Bakış Görünümü | Yurttaşın sorusunu olduğu gibi ad yapıyor. Kayıtlar ayrı bir defterde değil kaynak sistemlerde duruyor; "görünüm" teknik adı bunu doğru anlatıyor |
| K-SIRA-DEFTERI | Sıra Defteri, Sıram Nerede, Bekleme Listesi | Sıra Defteri | Zaten Türkçe. Kişinin kendi ekranı için "Durumum Nerede?" kartı ayrı bir ad olarak kullanılabilir |

### 2.6 Kademe, üst norm, uyarlama

| Kimlik | Tanım | Türkçe ad | İngilizce ad | Diğer diller |
|---|---|---|---|---|
| K-BASAMAK | Bir kararda insan denetiminin ağırlığını belirleyen üç basamak: lehe ve düşük etkili kararlar ajanda kalabilir, takdir gerektiren ve aleyhe kararlar insan onayı ister, anayasal taban kararlarında insan önce kendi değerlendirmesini yapar | **Basamak** (Birinci, İkinci, Üçüncü Basamak) | Oversight Tier | — |
| K-UST-NORM | Evrensel insan hakları metni; bütün anayasa ve yasaların uymak zorunda olduğu en üst kural | **Hak Çatısı** | Universal Charter | — |
| K-ULKE-UYARLAMASI | Bir ülkenin üst normu kendi hukuk düzenine, diline ve geleneğine uyarlaması | **Ülke Uyarlaması** | National Adaptation | — |

| Kimlik | Adaylar | Teknik ad | Gerekçe |
|---|---|---|---|
| K-BASAMAK | Basamak, Kademe, Aşama | Kademe | "Basamak" Türkçe ve merdiven imgesiyle anlaşılır. "Kademe" zam ve maaş dilinde başka bir şey demek (kademe ilerlemesi). Dikkat: "Basamak" "çıkrık"/"Geri Adım Yok" ile birlikte merdiven imgesi yaratıyor; ikisinin birlikte duyulması anlam karışıklığı doğurmasın diye yurttaş gözü baksın |
| K-UST-NORM | Hak Çatısı, Üst Kural, Ortak Hak Metni | üst norm | "Norm" soyut ve yabancı. "Çatı" Türkçede "çatı yasa" ve "çatı örgüt" gibi kalıplarla yerleşik. Not: Bu metnin kendisinin adı (insan hakları sözleşmesi) ayrı bir kavram |
| K-ULKE-UYARLAMASI | Ülke Uyarlaması, Kendi Diline Uyarlama, Yurda Uyarlama | ülke uyarlaması | Zaten yeterince yalın; değişiklik önermiyorum |

## 3. Halk dili örneği

Seçtiğim adlarla yazılmış kısa bir paragraf. Amaç, adların kulağa nasıl geldiğini görmek.

> Ayşe Hanım mahallesinde küçük bir fırın açmak için ruhsat başvurusunu telefonundan yaptı. Dosya Kâtibi başvurunun hangi kurallara bağlı olduğunu buldu ve ilgili Kural Kâtiplerine sordu; belediye, itfaiye ve sağlık kuralları tek tek "uygun" yazdı. Yazılanları Uygunluk Gözcüsü ayrıca, işi yapan kâtibin gerekçesini görmeden kendi başına gözden geçirdi. Başvuru Ayşe Hanım'ın lehine olduğu için Birinci Basamakta kaldı ve ruhsat birkaç saat içinde çıktı. Aleyhine bir sonuç çıksaydı, adı ve numarası belli bir insan memur onaylamadan hiçbir ödeme ya da hakkı kesilmeyecekti. Ayşe Hanım "Kim Baktı?" ekranından dosyasına hangi birimlerin baktığını gördü; her adım Kamu Defteri'ne yazılmıştı.

**Kulağa nasıl geliyor?**
- Çalışan adlar (Dosya Kâtibi, Kural Kâtipleri) cümlede rahat ve ağırlık taşımıyor. "Kâtip" olunca kimse "ajan" derken duyduğu casusluk ya da tahakküm çağrışımını duymuyor.
- "Uygunluk Gözcüsü" işi yapan kâtiplerden ayrı duruyor; bu ayrım cümlede hemen anlaşılıyor.
- "Kim Baktı?" bir yurttaşın gerçekten soracağı bir soru olduğu için resmî bir ad gibi durmuyor.
- Zayıf nokta: "Basamak" ile "Kâtip" aynı cümlede olunca anlatım biraz bürokratik oluyor. Kâtip adının dar bir iş gibi duyulması ("yalnızca yazıyor") burada görünüyor; Basamak 1'deki kararları da kâtibin verdiğini düşünen biri adı küçültücü bulabilir.

## 4. Diğer milletler kendi adlarını seçerken hangi ilkeleri izlesin?

K27'ye göre her millet kendi dilinin sözcüklerini ve deyiş kalıplarını kullanır. Aşağıdaki rehber kısa tutuldu ve bağlayıcı değil.

1. **Tanımdan başla, çeviriden değil.** Önce kavram kaydındaki tanımı oku. Türkçe ya da İngilizce adı çevirme. "Bu tanımı bizim dilimizde, bir köy kahvesinde nasıl söylerdik?" diye sor.
2. **Kendi dilinin kamu sözcüklerine bak.** Güveni olan eski ve yerleşik meslek, kurum ve deyişlere (kâtip, defter, mühür, söz gibi) bak. Yeni uydurulmuş bir söz yerine insanların zaten bildiği bir sözü tercih et.
3. **Çağrışım testi yap.** Farklı yaş, eğitim ve bölgeden en az beş kişiye adı söyle ve ilk akıllarına geleni sor. Korku, casusluk, tahakküm, ölüm ya da küçümseme çağrışımı varsa adı değiştir. (Örnek: Türkçede "ajan" casusu çağrıştırır.)
4. **Cümle testi yap.** Ad, günlük bir cümlede doğal durmalı. Anlamlı ama cümlede garip duyulan ad ("emanetçi dosyayı açtı") tutmaz.
5. **İnsanı üstte tut.** Ad, yapay zekânın insana hizmet ettiğini ve son sözün insanda olduğunu bozmamalı. Rütbe, unvan ya da yönetici çağrıştıran sözcüklerden kaçın.
6. **Örtme, şişirme.** Ad yapay zekânın gücünü ne küçültsün ne büyütsün. Adın söylediğinden fazlasını yapabiliyorsa bunu yetki sınırı bildirimiyle açıkça yaz.
7. **Aynı kalıbı koru, denetleyeni ayır.** Rollerin adları aynı aileden gelsin. İşi yapan ile onu bağımsız denetleyen farklı köklerden olsun ki kimse kendi işini denetliyormuş gibi görünmesin.
8. **Çakışmaları ara.** Adın bir resmî unvanı, kurumu, markayı, yazılımı ya da yasal terimi yanlışlıkla çağrıştırıp çağrıştırmadığına bak. Yerel hukukta korunan unvanları kullanma.
9. **Yüklü sözlerden kaçın.** Dinî, etnik, mezhebî, siyasi ya da eski bir rejimi çağrıştıran sözcükler (örneğin tarihsel iktidar unvanları) tartışmalı olur. Aynı söz bir dilde olumlu, bir başkasında olumsuz olabilir; bu yüzden yerel yurttaşlarla sına.
10. **İki katman kullan.** Halk adı bilgilendirme dilinde, **teknik ad** hukuki metinde kullanılsın. İkisi kavram kaydında yan yana yazılsın.
11. **Anlam kayması testi yap.** Yerel adı gören bir kişiye, tanımı görmeden "bu ne demek?" diye sor. Verdiği tanım kavram kaydındaki tanıma uymuyorsa ad kavramı taşımıyor demektir.
12. **Kimlik sabit, ad serbest.** Kavram kimliği ve tanımı bağlayıcıdır, ad değildir. Adı değiştirmek serbest; ama kayıt tablosuna işlenir ve eski ad sürümde saklanır.
13. **Ad bulunamazsa beklemek serbest.** Henüz iyi bir ad yoksa kavram kimliği geçici ad olarak kullanılabilir. İngilizce ad da bir dil önerisidir; İngilizce konuşanlar onu K27'ye göre değiştirebilir.

## 5. Sınırlarım ve hakeme açık noktalar

**Doğrulayamadığım şeyler**
- "Yazman" ve eski Türkçe kökler (bitikçi): aramalarda doğrulayamadım. Bu yüzden önerilerin dışında bıraktım.
- "Emanet" kelimesine ilişkin çağrışımlar (bırakılan eşya, "emaneti teslim etmek" deyimi) kendi dil bilgime dayanıyor, kaynakla doğrulamadım.
- Kısa web kontrolünde marka, alan adı ya da kurum adı taraması yapmadım. Bulamamak yokluğun kanıtı değil.
- Tanımlarım proje belgelerindeki hakem kararlarına dayanıyor; her belgeyi baştan sona okumadım. Basamak, Mahalle Katkısı ve Yurttaş Güvence Paketi tanımları özellikle gözden geçirilmeli.

**Hakeme ve yurttaş gözüne sorular**
1. **Ana aile:** Kâtip (C) mi, Kalfa (D) mı? Küçültme riski kabul edilebilir mi?
2. **Model adları:** Parti Modeli, İktidar Modeli ve Gölge Model için iyi bir halk adı bulamadım ve değiştirmedim. Bu kabul edilebilir mi?
3. **Yurttaş Paneli ya da Heyeti:** Sözlükte "Yurttaş meclisi", belgelerde "Yurttaş Paneli" geçiyor. Tek ad seçilmeli.
4. **Dürüstlük Kurumu:** Kamu Denetçiliği Kurumu ile karışma riski için görev tanımı ve ad yurttaş gözünce sınanmalı.
5. **Kamu Defteri:** "Defter" bazı vergi ve tarım sistemlerinin adında geçiyor. Karışma riski kabul edilebilir mi?
6. **Geri Adım Yok ve Basamak:** İkisinin yan yana kullanımı yurttaş gözünce sınanmalı.
7. **K27 geçişi:** `terminology-tr-en.md` dosyasının yerini bu kavram kaydı alacaksa, mevcut belgelerdeki eski adların nasıl güncelleneceğine hakem karar vermeli.
