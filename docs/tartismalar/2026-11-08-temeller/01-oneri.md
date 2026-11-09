# Temeller Tartışması — 01: Öneri Belgesi

- **Hazırlayan:** Önerici (Claude, ana oturum)
- **Tarih:** 2026-11-08
- **Amaç:** Airokrasinin şimdiye kadar açık kalan bütün sorularına gerekçeli öneriler sunmak. Bu belge bir eleştirmen ajan tarafından sorgulanacak, önerici yanıt verecek, bir hakem ajan karar verecek.

## Kurucunun bağlayıcı tercihleri (tartışmanın sabit girdileri)

Aşağıdakiler proje kurucusunun açıkça ifade ettiği tercihlerdir. Tartışma bunların **özünü değiştiremez**; yalnızca nasıl uygulanacağını şekillendirir. Ciddi bir itiraz varsa "kurucuya not" olarak kaydedilir.

- **K1.** İnsan hakları sözleşmesi üst normdur; ülkeler anayasalarını buna göre yazar.
- **K2.** Yasama, yürütme ve yargı süreçlerini yapay zekâ ajanları yürütür; insanlar yön verir, denetler, son sözü söyler.
- **K3.** Siyasi seçimler devam eder; insanlar işin içindedir; seçim liyakat temellidir.
- **K4.** İnsan atamalarında yapay zekâ önerir, son kararı insan verir.
- **K5.** Her siyasi partinin, programıyla uyumlu kendi yapay zekâ modeli olur. Partiler modelini halka anlatır; halk modelleri dener ve oyunu verir.
- **K6.** İktidar olan parti, devletin ajan ağını ("devlet sinir ağı") kendi modeliyle yönetir.
- **K7.** Seçimden sonra kazanan modelin karar alma süreçleri değiştirilemez; halka verilen sözler sonradan değiştirilemez.
- **K8.** Her kural (kanun, yönetmelik vb.) için bir ajan vardır. Yönetmelik ajanı kanun ajanına, kanun ajanı anayasa ajanına, anayasa ajanı insan hakları sözleşmesine aykırı iş yapamaz.

---

## A. Temel tasarım

### A1. Ajanlar karar mı verir, öneri mi sunar?
**Öneri: Üç kademeli yetki.**
- **Kademe 1 — Ajan karar verir, insan sonradan itiraz edebilir:** Rutin, geri alınabilir, kişiye özgü işlemler (ruhsat, vergi iadesi, sosyal yardım başvurusu, randevu).
- **Kademe 2 — Ajan önerir, yetkili insan onaylar:** Önemli ama geri alınabilir kararlar (büyük harcamalar, yönetmelik çıkarma, geniş grupları etkileyen uygulamalar).
- **Kademe 3 — İnsan karar verir, ajan yalnızca hazırlık yapar:** Ağır ve geri alınamaz sonuçlar (özgürlük kısıtlaması, kanun ve anayasa kabulü, savaş/olağanüstü hâl, sistemin durdurulması).

Bir kararın kademesini dört ölçüt belirler: **geri alınabilirlik, etkilenen kişi sayısı, temel haklara etkisi, mali büyüklük.** Hangi işin hangi kademede olduğu kanunla belirlenir; ajan bir işin kademesini kendisi düşüremez, yalnızca yükseltebilir.

**Gerekçe:** Her şeyi insana onaylatmak sistemin hız avantajını yok eder; her şeyi ajana bırakmak egemenlik ilkesini (İ2) çiğner. Kademe, riskle orantılı insan denetimi sağlar.

### A2. Kuvvetler ayrılığı ve iktidar modelinin kapsamı
**Öneri:** K6 ile İ3'ü (kuvvetler ayrılığı) birlikte korumak için:
- **Yürütme:** İktidar partisinin modeli yönetir. Politika seçer, bütçe önceliklerini belirler, yürütme ajanlarını yönlendirir.
- **Yasama:** Seçilmiş insanlardan oluşan **Meclis** kanunları kabul eder. Taslakları yasama ajanları teknik olarak yazar; Meclis'teki her parti kendi modeliyle taslak ve alternatif sunabilir.
- **Yargı:** Hiçbir partiye ait olmayan, bağımsız bir kurulca seçilen **tarafsız ve çoklu modeller** çalışır.
- **Norm ajanları (K8 piramidi):** Partiler üstüdür. İktidar modeli değişse de onlar değişmez. İktidar modelinin her adımı bu piramitten geçer.

Özet: **İktidar modeli yönü belirler, norm ajanları sınırı çizer, yargı uyuşmazlığı çözer, Meclis kuralı koyar.**

**Gerekçe:** "Devlet sinir ağı" ifadesi tek modelin her şeyi yönetmesi şeklinde okunursa üç kuvvet tek elde toplanır. Bu, en temel demokratik güvenceyi ortadan kaldırır.

### A3. Temsilciler ve yurttaş katılımı (eski S2, S3)
**Öneri:** Seçilmiş temsilci (milletvekili) kavramı kalır (K3). Önceki taslaktaki "kura ile yurttaş meclisi" kanun kabul eden organ olmaktan çıkar; onun yerine **kurayla oluşan Yurttaş Paneli** danışma ve ikinci okuma rolü üstlenir: temel hakları etkileyen kanunları inceler, görüşünü yayımlar ve gerekirse halk oylaması talep edebilir.

**Gerekçe:** Seçilmiş meclis meşruiyeti, kura paneli ise kampanya ve lobiden bağımsız sıradan yurttaş sesini taşır.

---

## B. Parti modelleri ve seçimler

### B1. Mühürlenen şey tam olarak nedir?
**Öneri: Üç katman.**
1. **Söz Belgesi (mühürlü):** Partinin hedefleri, değerleri, öncelik sıralaması, kırmızı çizgileri ve karar kuralları. Hem insanın okuyabileceği hem de modelin uygulayacağı biçimde yazılır. Seçimden sonra **hiçbir şekilde değiştirilemez.**
2. **Model (mühürlü, sınırlı yama):** Modelin kendisi de sürüm parmak iziyle mühürlenir. Yalnızca güvenlik açığı ve teknik hata için, bağımsız Teknik Denetim Kurulu onayıyla yama yapılabilir. Yamadan sonra model, Söz Belgesi test senaryolarında eskisiyle **aynı kararları verdiğini** kanıtlamak zorundadır. Kanıtlayamazsa yama reddedilir.
3. **Bilgi (güncellenebilir):** Ekonomik veriler, nüfus bilgileri, olaylar sürekli güncellenir. Model değişmez, ama dünyayı güncel görür.

**Gerekçe:** Modelin her şeyiyle dondurulması güvenlik açığını düzeltilemez kılar; hiçbir şeyin dondurulmaması K7'yi boşa çıkarır. Bağlayıcı olan "söz"dür; söz Söz Belgesi'nde yazılıdır.

### B2. Beklenmedik olaylar (afet, salgın, savaş, kriz)
**Öneri:**
- Her Söz Belgesi'nin zorunlu bir bölümü **"Öngörülmeyen Durumlar İlkeleri"**dir: Parti, programında olmayan bir durumda hangi önceliklerle karar vereceğini seçimden önce yazar. Halk buna da oy verir.
- Olağanüstü durumda model kararları otomatik olarak Kademe 2 veya 3'e yükselir; insan Acil Durum Kurulu devreye girer.
- Söz Belgesi değiştirilemez, ama **geçici sapma** Meclis nitelikli çoğunluğuyla, süreli ve kayıtlı olarak mümkündür. Temel haklar hiçbir sapmayla askıya alınamaz.

### B3. Modellerin denenmesi ve doğrulanması
**Öneri:**
- **Tek sürüm kuralı:** Seçimde denenen sürüm = seçimden sonra çalıştırılan sürüm. Parmak izi seçimden belirli bir süre önce ilan edilir; herkes doğrulayabilir.
- **Bağımsız Model Denetim Kurulu:** Binlerce senaryodan oluşan **ortak senaryo bankasını** tüm modellere uygular, sonuçları yan yana yayımlar. Senaryo bankasına yurttaşlar da senaryo ekleyebilir.
- **Uygunluk sertifikası:** Üst norma ve anayasaya uygunluk testinden geçmeyen model seçime giremez.
- **Program uyum puanı:** Modelin, kendi Söz Belgesi'ne ne kadar sadık davrandığı ölçülür ve yayımlanır.
- **Eşit deneme platformu:** Yurttaşlar bütün modelleri aynı arayüzde, aynı koşullarda dener.

### B4. Para, şirket gücü ve eşitlik
**Öneri:**
- **Ortak Kamu Model Altyapısı:** Temel model(ler) bağımsız bir kamu vakfı tarafından herkese eşit sağlanır. Partiler yalnızca Söz Belgesi'ni ve onun üzerine kurulan uyum katmanını geliştirir.
- Hesaplama bütçesine üst sınır ve kamu finansmanı.
- Şirket bağışları yasak; bireysel bağışlar sınırlı ve tamamen şeffaf.

### B5. Muhalefet
**Öneri:** Muhalefet partilerinin modelleri **gölge model** olarak çalışır: İktidar modelinin her önemli kararına (Kademe 2–3) kendi alternatifini üretir; ikisi yan yana yayımlanır. Muhalefet milletvekilleri iktidar modelinin bütün karar kayıtlarına erişebilir.

### B6. Koalisyon
**Öneri:** K7 gereği seçimden sonra yeni bir ortak söz yazılamaz. Bu yüzden:
- Partiler seçimden **önce** ittifak kurup ortak Söz Belgesi ile seçime girebilir.
- Seçim sonrası koalisyonda modeller değişmez; görev alanları (ör. ekonomi bir modelde, eğitim diğerinde) paylaşılır. Ortak alanlarda yalnızca **iki Söz Belgesi'nin kesiştiği** kararlar uygulanır; kesişim yoksa karar Meclis'e gider.

### B7. Dönem ortasında başarısızlık ve geri çağırma
**Öneri:**
- **Söz sapması denetimi:** Model kendi Söz Belgesi'nden saparsa (denetim kurulu tespit ederse) ilgili yetkisi askıya alınır ve karar insanlara geçer.
- **Geri çağırma:** Belirli oranda yurttaş imzasıyla, dönem ortasında "güven oylaması" yapılabilir; kaybedilirse erken seçim.
- **Dönem karnesi:** Model, Söz Belgesi'ndeki ölçülebilir hedeflere ne kadar ulaştığını düzenli raporlar; bağımsız kurul doğrular.

### B8. Oy neye verilir?
**Öneri:** Oy partiye verilir; parti oyu hem partinin **modelini** hem de Meclis'e gönderdiği **insan adaylarını** kapsar. İktidar, Meclis çoğunluğunu sağlayan parti veya seçim öncesi ittifaktır.

---

## C. Liyakat

### C1. Atamalarda liyakat (K4)
**Öneri:**
- Görev için liyakat ölçütlerini **Bağımsız Liyakat Kurulu** önceden ilan eder (iktidar modeli değil).
- Adayları **tarafsız bir liyakat ajanı** değerlendirir (iktidar modeli değil) ve gerekçeli, sıralı bir kısa liste (3–5 aday) sunar.
- Yetkili insan listeden seçer. Listenin dışından birini seçerse veya sıralamanın gerisinden birini alırsa **gerekçesini kamuya açıklamak** zorundadır; bu gerekçe denetime tabidir.
- Adayların değerlendirmeye itiraz hakkı vardır.
- **Siyasi görevler** (bakan, danışman) ile **kariyer görevleri** (memur, uzman, hâkim) ayrılır; siyasi görevlerde takdir alanı daha geniş, kariyer görevlerinde dardır.

### C2. Seçilecek adaylara liyakat şartı mı?
**Öneri:** Seçilme hakkı bir insan hakkıdır; yasal asgari şartlar dışında kısıtlanmaz. Onun yerine **şeffaf yeterlilik profili**: Tarafsız bir ajan her adayın eğitim, deneyim, geçmiş performans ve beyanlarını doğrular ve yayımlar. Liyakat zorunlu şart olarak yalnızca **atanan** görevlerde uygulanır; seçilenlerde ise seçmenin bilgilenmesini sağlar.

---

## D. Norm ajanları piramidi (K8)

### D1. Uygulama ve denetim ayrımı
**Öneri:** Her kural için iki ayrı ajan: **Uygulama ajanı** (kuralı işler) ve **Uygunluk ajanı** (her işlemin hem o kurala hem üst normlara uygunluğunu denetler). İkisi farklı modellerle çalışır.

### D2. "Aykırı mı?" sorusunda son söz
**Öneri:**
1. Üst normun uygunluk ajanı aykırılık tespit ederse işlem **geçici olarak durur** (ihtiyat ilkesi).
2. İlgili taraf itiraz ederse dosya yargı ajanına gider.
3. Yargı ajanı kararına itiraz edilirse **insan Anayasa Kurulu** son kararı verir.
4. İnsan hakları metninin yorumunda son söz **Uluslararası İnsan Hakları Kurulu**'nundur (insan hukukçular).

### D3. Hak çatışmaları
**Öneri:**
- **Mutlak haklar** (işkence yasağı, kölelik yasağı, adil yargılanmanın çekirdeği, düşünce ve vicdan özgürlüğünün iç alanı vb.) hiçbir dengelemeye tabi değildir.
- Diğer haklar çatıştığında ajanlar **ölçülülük testi** uygular (meşru amaç → elverişlilik → gereklilik → orantılılık) ve her adımın gerekçesini yazar. Bu test bugün insan hakları mahkemelerinin kullandığı yöntemdir.

### D4. Aynı seviyedeki kuralların çatışması
**Öneri:** Klasik hukuk sırası uygulanır: üst norm alt normdan üstündür → özel kural genel kuraldan üstündür → sonraki kural öncekinden üstündür. Bu sırayla çözülemeyen çelişki otomatik olarak Meclis'e "düzeltme bildirimi" olarak gider.

### D5. Bir işlemin birçok kurala dokunması
**Öneri:** Her başvuru veya işlem için bir **Dosya Koordinatörü** ajanı: İlgili bütün norm ajanlarını bir **kural haritası** üzerinden belirler, her birinden uygunluk alır. Biri reddederse işlem durur; bütün gerekçeler tek bir kararda birleştirilir ve kişiye sunulur.

### D6. Üst norm değiştiğinde
**Öneri:** Bir üst norm değişikliği yürürlüğe girmeden önce: bütün alt normlar uygunluk ajanlarınca taranır → uyumsuzlar listelenir ve yayımlanır → geçiş süresi verilir → süre sonunda düzeltilmemiş alt norm askıya alınır ve üst norm doğrudan uygulanır.

### D7. Kural boşluğu
**Öneri:** **Kişiler için:** yasaklanmayan her şey serbesttir. **Devlet ve ajanlar için:** yetki verilmeyen her şey yasaktır. Ajan bir boşluk tespit ederse bunu yasama önerisi olarak raporlar, ama boşluğu kendisi doldurmaz.

### D8. Tepedeki hatanın zincirleme yayılması
**Öneri: Güvence piramidi.** Piramitte yukarı çıktıkça güvence artar: Yönetmelik düzeyinde 2 farklı model, kanun düzeyinde 3, anayasa düzeyinde 5, insan hakları düzeyinde 7 farklı modelden oluşan kurul. Kurul içinde ayrışma olursa karar insana gider. Üst normların değiştirilmesi de yukarı çıktıkça zorlaşır.

### D9. Norm ajanı nasıl doğar?
**Öneri:** Meclis bir kanunu kabul ederken yalnızca metni değil, **beklenen davranış senaryolarını** da onaylar ("bu durumda kanun şunu gerektirir"). Kanun ajanı bu senaryoları geçmeden yürürlüğe giremez. Böylece "Meclis'in kastettiği" ile "ajanın uyguladığı" arasındaki fark ölçülebilir olur.

---

## E. Hukuki ve uluslararası çerçeve

### E1. Üst norm metni (eski S4)
**Öneri:** Temel, BM İnsan Hakları Evrensel Beyannamesi ile iki temel sözleşmedir (Medeni ve Siyasi Haklar; Ekonomik, Sosyal ve Kültürel Haklar). Üzerine **Airokrasi Ek Protokolü** eklenir (gerekçe hakkı, insana başvurma hakkı, algoritmik ayrımcılığa karşı koruma, veri onuru, dijital dışı katılım hakkı). Sıfırdan yazmak yerine mevcut ve geniş uzlaşı görmüş metinlerden başlamak meşruiyeti artırır.

### E2. Anayasaların üst norma uygunluğunu kim denetler? (eski S5)
**Öneri:** İç denetim ülkenin insan Anayasa Kurulu'nda; dış denetim Uluslararası İnsan Hakları Kurulu'nda. Ajanlar her iki düzeyde ön tarama yapar ama karar vermez.

### E3. Bir ülke üst normdan çekilmek isterse
**Öneri:** Çekilme hakkı vardır (egemenlik), ancak uzun bildirim süresi ve halk oylaması şartıyla. Çekilme, yurttaşların kazanılmış temel haklarını geriye dönük ortadan kaldıramaz.

---

## F. Teknik ilkeler (kod değil, ilke)

### F1. Modellerin açıklığı (eski S6)
**Öneri:** Norm ajanları ve yargı ajanları **açık ve bağımsız denetlenebilir** olmalı. Çoklu tedarikçi zorunlu; tek bir şirketin devlet ajan ağındaki payına üst sınır.

### F2. Karar kayıtları (eski S7)
**Öneri:** Her karar, değiştirilemez biçimde, birbirinden bağımsız birden fazla kurumda (ör. yargı, meclis, üniversite, sivil toplum) kopyalanarak saklanır. Kişisel veriler kayıttan ayrılır; kayıt, kişiyi açığa çıkarmadan denetlenebilir.

### F3. Ajanlar arası iletişim (eski S8)
**Öneri:** Bir ajan diğerine **talimat** değil **talep** gönderir; her talep kayıtlıdır ve kendi yetki belgesini taşır. Bir kuvvetin ajanı başka bir kuvvetin ajanına talep gönderemez; yalnızca kamuya açık kanallar üzerinden bilgi alabilir.

### F4. Tek merkez riski
**Öneri:** "Devlet sinir ağı" tek bir merkez değil, **federatif ve parçalı** bir yapıdır: bölgesel ve alan bazlı düğümler. Bir parça çökerse diğerleri çalışır. Her kritik hizmetin **insanla işletme yedek planı** vardır ve düzenli tatbikat yapılır.

---

## G. Geçiş ve etik

### G1. Mevcut demokrasiden geçiş (eski S9)
**Öneri: Dört aşama.**
1. **Gölge dönem:** Ajanlar mevcut kararların paralelinde öneri üretir; insan kararlarıyla karşılaştırılır ve yayımlanır. Hiçbir yetkisi yoktur.
2. **Pilot:** Bir belediye veya tek bir kamu hizmetinde Kademe 1 yetki.
3. **Rutin işlemler:** Ulusal düzeyde Kademe 1 işlemler.
4. **Tam model:** Parti modelleri ve seçim sistemi devreye girer.

Her aşamaya geçiş, önceden ilan edilmiş ölçülebilir başarı kriterlerine ve Meclis onayına (son aşamada halk oylamasına) bağlıdır.

### G2. Geri dönüş planı (eski S10)
**Öneri:** Her aşamada insan yönetimine geri dönüş planı hazır tutulur. **Beceri körelmesine** karşı insan kamu görevlilerinin bir kısmı her zaman aktif tutulur ve düzenli tatbikat yapar.

### G3. Ajanların değerleri (eski S11)
**Öneri:** Ajanların kendine ait değeri yoktur. Değerler üç kaynaktan türetilir: **insan hakları metni → anayasa → seçimle gelen Söz Belgesi.** Bu üçünde olmayan bir değeri ajan uygulayamaz.

### G4. Kültürel farklılıklar (eski S12)
**Öneri:** Evrensel çekirdek **dar ve mutlak** tutulur; geri kalan alan ülke anayasalarına bırakılır (insan hakları hukukundaki "takdir payı" yaklaşımı).

---

## H. Kanun yapımı ve katılım (06 ve 07 dokümanlarındaki sorular)

### H1. Ajanların sorun raporlama yetkisi gizli bir gündem gücüne dönüşür mü?
**Öneri:** Raporlama ölçütleri önceden kanunla tanımlanır; bütün raporlar kamuya açıktır; gündem önceliğini insanlar belirler. Ajanın raporlamadığı sorunları yurttaşlar dilekçeyle getirebilir.

### H2. Kanun taslaklarını kim hazırlar?
**Öneri:** İktidar modeli ve Meclis'teki muhalefet modelleri taslak önerebilir; yasama ajanları teknik yazımı yapar. Her önemli kanun için **en az bir muhalefet alternatifi** zorunlu olarak Meclis'e sunulur.

### H3. Kademeli yürürlük ve eşitlik
**Öneri:** Kademeli yürürlük yalnızca hak kısıtlamayan düzenlemelerde, süre sınırıyla ve bölgeler rastgele/gönüllü seçilerek uygulanır.

### H4. Otomasyon yanlılığı (insanların ajanı sorgulamadan onaylaması)
**Öneri:** Onaylayan insan kısa bir gerekçe yazmak zorundadır; onay/ret oranları izlenir; dikkat ölçmek için zaman zaman kasıtlı hatalı **test dosyaları** gönderilir ve sonuçlar denetim kuruluna raporlanır.

### H5. Dijital uçurum
**Öneri:** Her kamu hizmetinin bir **insan kanalı** vardır; oy verme dahil hiçbir yurttaşlık hakkı dijital erişime bağlanamaz.
