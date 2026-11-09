# 02 — Mimari: Ajanlar ve Kuvvetler

## Genel görünüm

```
                ┌──────────────────────────────┐
                │  Evrensel İnsan Hakları Metni │  ← değiştirilemez çekirdek
                └──────────────┬───────────────┘
                               │
                ┌──────────────▼───────────────┐
                │      Ülke Anayasası           │  ← insanlar yazar ve onaylar
                └──────────────┬───────────────┘
        ┌──────────────────────┼──────────────────────┐
        ▼                      ▼                      ▼
 ┌─────────────┐       ┌──────────────┐       ┌─────────────┐
 │  YASAMA     │       │  YÜRÜTME     │       │  YARGI      │
 │  ajanları   │       │  ajanları    │       │  ajanları   │
 └──────┬──────┘       └──────┬───────┘       └──────┬──────┘
        │                     │                      │
        └──────────── İNSAN DENETİM KATMANI ─────────┘
           (yurttaş meclisleri, denetçiler, itiraz kurulları)
```

## Yasama ajanları
**Görev:** İnsanların belirlediği hedefler doğrultusunda yasa taslakları hazırlamak.

- Toplumsal ihtiyaçları ve verileri analiz eder, taslak önerir.
- Her taslak için etki analizi (hak etkisi, bütçe, çevre, eşitlik) üretir.
- Taslağın insan haklarına ve anayasaya uygunluğunu otomatik ön kontrolden geçirir.
- **Karar vermez:** Taslaklar yurttaş meclisi / referandum / temsilci onayıyla yasalaşır.

## Yürütme ajanları
**Görev:** Yasaları uygulamak, kamu hizmetlerini yürütmek.

- Başvuruları işler, hizmetleri dağıtır, bütçeyi uygular.
- Yalnızca yürürlükteki yasaların verdiği yetki içinde hareket eder.
- Her işlem kayıt altına alınır ve gerekçelendirilir.
- Belirli eşiklerin üzerindeki kararlar (ör. büyük harcamalar, hak kısıtlamaları) insan onayı gerektirir.

## Yargı ajanları
**Görev:** Uyuşmazlıkları incelemek, hukuka uygunluk denetimi yapmak.

- Dosyayı inceler, emsalleri bulur, gerekçeli karar önerisi hazırlar.
- Yasama ve yürütme ajanlarının kararlarını insan haklarına ve anayasaya uygunluk açısından denetler.
- Ceza, özgürlük kısıtlaması gibi ağır sonuçlu kararlar **her zaman** insan hâkim onayı gerektirir.

## Denge ve denetim mekanizmaları
- **Çapraz denetim:** Yargı ajanı, yürütme ajanının kararını denetleyebilir; yasama ajanı yürütmenin uygulama verilerini görebilir ama talimat veremez.
- **Çoklu model:** Kritik kararlar farklı modellerden oluşan bir "kurul" tarafından değerlendirilir; anlaşmazlık durumunda insana yükseltilir.
- **Kırmızı takım ajanları:** Sistemi sürekli olarak açık, yanlılık ve kötüye kullanım açısından test eden bağımsız ajanlar.

## Açık tasarım soruları
- Ajanlar arası iletişim protokolü nasıl olmalı?
- Kararların kaydı için ne tür bir değiştirilemez kayıt (ledger) kullanılmalı?
- Ajan modellerinin seçimi, güncellenmesi ve emekliye ayrılması nasıl yönetilmeli?

Bkz. [acik-sorular.md](acik-sorular.md)
