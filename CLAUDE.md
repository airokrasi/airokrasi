# Airokrasi — Claude için proje rehberi

## Proje
Airokrasi, yapay zekâ ajanlarının yasama, yürütme ve yargı süreçlerini yürüttüğü bir yönetim modelidir. Bu modelde insanlar yön verir, denetler ve son sözü söyler. Bu depo **yalnızca kavramsal dokümantasyon** içerir: ilkeler, kanun yapımı, seçimler, ekonomi ve benzeri konular. **Kod yazılmaz.**

- Dil: Türkçe. Doğru Türkçe karakterler kullanılır (ç, ğ, ı, ö, ş, ü). Dil sade olmalıdır.
- Ana dokümanlar: `docs/00–07`, `docs/acik-sorular.md`, `docs/sozluk.md`
- Karar kayıtları: `docs/kararlar/KK-XXXX-*.md`
- Tartışmalar: `docs/tartismalar/<tarih>-<konu>/`
- Yöntem: `docs/tartismalar/YONTEM.md` (her işten önce okunur)

## Kurucu tercihleri (sabit girdiler)
K1–K17, şu dosyalarda tanımlıdır: `docs/tartismalar/2026-11-08-temeller/01-oneri.md`, `01b-kurucu-ekleri.md` ve `docs/tartismalar/2026-11-08-ekonomi-yolsuzluk/01-oneri.md`. Tartışmalar bu tercihlerin özünü değiştiremez; yalnızca nasıl uygulanacaklarını şekillendirir.

## Çalışma yöntemi (kurucunun isteği)
- Fikirleri **alt ajanlar tartışır**. Roller: eleştirmen, savunucu, uzmanlar (hukuk, yapay zekâ güvenliği, Vatandaşın Düşüncesi, ekonomi, yolsuzluk), fikir ajanı ve gündem hakemi.
- Kararı **ayrı bir hakem ajan** gerekçeleriyle verir. Hakem, tartışmaya katılmamış bir ajandır.
- Ana oturum **organizatör ve yazıcıdır**. Süreci yönetir, ajanlar arasında soru ve yanıt taşır, kararları dokümanlara işler. **Kendisi hakemlik yapmaz.** Kurucuya öneri sunmaz; kendi gözlemlerini tartışma belgelerine "organizatör notu" olarak yazar.
- Alt ajanlar **Sonnet modeli ve yüksek efor** ile çalışır.
- Aynı anda en fazla 5 alt ajan çalışır.
- Kurucuya ilerleme **çok kısa başlıklar** hâlinde bildirilir.
- **K31: Kurucu hiçbir aşamada karar vermez.** Değer tercihleri TASKS.md dosyasına görev olarak eklenir ve tartışmaya katılmamış bir yapay zekâ hakemi tarafından gerekçeli olarak karara bağlanır. Kurucuya karar sorusu sorulmaz.
- Kurucu yeni bir fikir yazdığında bu fikir K-kodlu sabit girdi olarak ilgili tartışmaya eklenir.

## Gerekçe standardı (kurucu, K23)
Gerçek kanun yapımında olduğu gibi her belgenin bir **genel gerekçesi**, her maddenin de bir **madde gerekçesi dipnotu** olur. Dipnot şu başlıkları içerir: amaç, neden, ajanların tartışma özeti, kaynak tartışma dosyası ve onay durumu. Biçim `docs/tartismalar/YONTEM.md` dosyasında tanımlıdır. Bu standart, Airokrasi modelinin ürettiği kanunlar için de geçerlidir.

## Yol haritası (kurucu, K18)
Adım adım ilerlenir:
1. **Manifesto:** Evrensel değerler bildirgesi ve "neden Airokrasi".
2. **Anayasa:** Manifestoya ve insan hakları sözleşmesine göre yazılır.
3. **Kurumlar ve kanunlar:** Tartışma kararlarından türetilir.

Proje adı ayrıca tartışılıyor (`docs/tartismalar/2026-11-08-isim/`).

## Durum (2026-11-08)
Üç tartışma sürüyor: Temeller, Ekonomi ve Yolsuzluk, Görünür Devlet. Hakem kararları `09-hakem-karari.md` dosyalarında yer alır. Kararlar henüz ana dokümanlara (`docs/00–07`, kararlar, açık sorular) işlenmedi. Sıradaki iş bu işlemedir.
