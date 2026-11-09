# Tartışma Yöntemi

Airokrasinin fikirleri, yapay zekâ ajanlarının yapılandırılmış bir tartışmasıyla olgunlaştırılır. Son söz kurucuya, ileride ise gerçek insanlara aittir.

> Bu yöntem küçük bir Airokrasidir: Ajanlar hazırlar, tartışır ve önerir; insan karar verir.

> **K31 (kurucu kuralı, 2026-11-09):** Kurucu hiçbir aşamada karar vermez. Bu belgede "kurucu onayı" ya da "🧭 kurucunun kararı" yazan her yerde artık şu geçerlidir: Değer kararları **TASKS.md** dosyasına görev olarak yazılır. Bu görevleri, tartışmaya katılmamış bir **Değer Kararı Hakemi** (yapay zekâ) gerekçeli olarak karara bağlar. Karar yayımlanır ve herkesin itirazına açıktır. Yeni bir argüman ya da kanıt getiren itiraz, kararı yeniden açar.

## Roller

| Rol | Kim | Görevi | Karar verir mi? |
|---|---|---|---|
| **Organizatör / Yazıcı** | Ana oturum | Süreci yönetir, belgeleri ajanlara dağıtır, ajanlar arası soruları taşır, önemli kaynakları kontrol eder, sonuçları dokümanlara işler, kurucuya kısa ilerleme raporu verir | Hayır |
| **Eleştirmen** | Alt ajan | Önerileri madde madde sorgular, zayıflık ve kötüye kullanım senaryoları arar | Hayır |
| **Araştırmacı → Savunucu** | Alt ajan | Önce gerçek dünya deneyimini araştırır, sonra önerileri savunur ve gerektiğinde revize eder | Hayır |
| **Uzmanlar** | Alt ajanlar | Hukuk, yapay zekâ güvenliği, Vatandaşın Düşüncesi gibi alanlarda inceleme yapar; hakemin sorularını yanıtlar | Hayır |
| **Hakem** | Ayrı alt ajan | Tartışmaya katılmamış, hiçbir şey yazmamış ajan. Bütün görüşleri okur, gerekirse uzmanlara soru sorar, her madde için **gerekçeli** karar verir | Taslak karar |
| **Kurucu** | İnsan | Hakem kararlarını onaylar, değiştirir veya reddeder; değer tercihlerini belirler | **Evet — son söz** |

## Akış

```
Tur 1  İnceleme      → Eleştirmen, araştırmacı ve uzmanlar öneriyi inceler   (paralel)
Tur 2  Savunma       → Savunucu bütün incelemelere tek belgede yanıt verir
Tur 3  Karşı yanıt   → Eleştirmen savunmaya ikinci kez yanıt verir
Tur 4  Hakem         → Hakem her maddeye karar verir
                       ↳ Emin olmadığı noktada uzmanlara soru sorar (organizatör aracılığıyla)
                       ↳ Yanıtları aldıktan sonra kararı kesinleştirir
Tur 5  Kurucu onayı  → Kurucu kısa karar listesini görür; onaylar / değiştirir / reddeder
Tur 6  Dokümantasyon → Organizatör kararları dokümanlara, karar kayıtlarına ve açık sorulara işler
```

## Hakemin karar kuralları

1. **Gerekçe zorunludur.** Her karar, hangi argümanın neden daha güçlü bulunduğunu söyler.
2. **Oy sayılmaz, argüman tartılır.** Beş ajandan dördünün aynı şeyi söylemesi tek başına bir gerekçe değildir; aynı modelden geldikleri için ortak hata yapabilirler.
3. **Kurucu tercihleri (K1–K8) sabittir.** Hakem bunların özünü değiştiremez; ciddi bir tehlike görürse "kurucuya not" düşer.
4. **Her madde üç sonuçtan birini alır:**
   - ✅ **Karar verildi:** Hakem gerekçesiyle bir seçenek belirledi.
   - 🧭 **Kurucunun kararı:** Konu bir değer tercihidir (ör. ajanlara ne kadar yetki verilmeli); hakem seçenekleri ve sonuçlarını açıklar, kararı kurucuya bırakır.
   - ❓ **Açık kaldı:** Bilgi veya kanıt yetersiz; ne gerektiği yazılır.
5. **Kanıt kalitesi önemlidir.** Kaynağa dayanan iddia, kaynaksız iddiadan güçlüdür; uydurma şüphesi olan kaynak dikkate alınmaz.

## Gerekçe standardı (kurucu, K23)

Gerçek hayattaki kanun yapımında olduğu gibi, her belge ve her madde **gerekçesiyle** yazılır. Bir maddenin neden yazıldığı, amacının ne olduğu ve hangi tartışmadan çıktığı, maddenin hemen altındaki bir dipnotta görünür.

**Genel gerekçe:** Belgenin başında yer alır. Bu belge neden var, hangi sorunu çözüyor, hangi tartışmalardan doğdu?

**Madde gerekçesi:** Her maddenin altında, dipnot olarak yazılır:

```
> **Gerekçe [madde no]**
> - **Amaç:** Bu madde neyi sağlamak için var?
> - **Neden:** Hangi sorunu ya da riski çözüyor? Gerçek dünyadan örnek veya kanıt.
> - **Tartışma özeti:** Kim ne önerdi, hangi itirazlar geldi, hangi alternatifler neden reddedildi, hakem neye dayanarak karar verdi? (2–5 cümle)
> - **Kaynak:** İlgili tartışma dosyası ve karar numarası, ör. `tartismalar/2026-11-08-temeller/09-hakem-karari.md`, B1.
> - **Onay:** Kurucu onayı (tarih) ya da "taslak".
```

Bu standart şu belgelerin hepsine uygulanır: manifesto, anayasa, kanun taslakları, ana dokümanlar ve karar kayıtları. Airokrasi modelinin kendisinde de, ajanların hazırladığı her kanun ve her kanun maddesi bu biçimde gerekçeli olur.

## Fikirlerin akışı

- **Kurucunun fikirleri** sabit girdi (K-kodları) olarak tartışmaya eklenir.
- **Organizatör** kurucuya öneri sunmaz. Kendi gözlemlerini ve sorularını tartışma belgelerine **organizatör notu / soru** olarak yazar. Bunları tartışmacılar ve hakem değerlendirir.
- **Fikir ajanı** yeni fikirleri `fikir-havuzu.md` dosyasına yazar. Hangi fikrin tartışmaya açılacağına **hakem ajan** karar verir.
- Kurucuya yalnızca kısa ilerleme başlıkları ve hakem kararları iletilir.

## Organizatörün sorumlulukları

- Ajanlara aynı belgeleri ve aynı kuralları vermek.
- Hakemin sorularını ilgili uzmana iletmek, yanıtı hakeme geri götürmek.
- Kararları etkileyen önemli kaynak iddialarını rastgele kontrol etmek.
- Kurucuya her aşamada **kısa başlıklar** hâlinde ilerleme bildirmek.
- Kurucunun onayından sonra dokümanları güncellemek; hiçbir kararı kendisi vermemek.

## Dosya düzeni

Her tartışma `docs/tartismalar/<tarih>-<konu>/` klasöründe tutulur:

```
01-oneri.md              Tartışmaya açılan öneriler
02-elestiri.md           Eleştirmen
03-...  06-...           Araştırma ve uzman incelemeleri
07-savunma.md            Savunucu
08-karsi-yanit.md        Eleştirmen, ikinci tur
09-hakem-karari.md       Hakem kararları ve gerekçeleri
10-kurucu-onayi.md       Kurucunun onay / değişiklik / ret kayıtları
```

Kesinleşen kararlar ayrıca `docs/kararlar/` altına karar kaydı (KK) olarak yazılır.

## Bilinen sınırlar

- **Model çeşitliliği yanılsaması:** Bütün ajanlar aynı model ailesinden. Benzer kör noktaları paylaşabilirler. Bu yüzden hakem oy saymaz, argüman tartar.
- **Gerçek insan yok:** "Vatandaşın Düşüncesi" gerçek yurttaşların yerini tutmaz. Proje GitHub'da yayımlandığında dokümanlar gerçek uzmanların ve yurttaşların eleştirisine açılmalıdır.
- **Siyasette tek doğru yoktur:** Bu yöntem hataları, çelişkileri ve riskleri bulabilir. Değer tercihleri ise insanlarındır.
