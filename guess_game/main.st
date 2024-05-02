"Smalltalk arrays are 1-indexed. This creates a 0-based version."
Object subclass: ArrayZ [
    | array |
    count: size [array := Array new: size.]
    size [^ array size.]
    at: index [^ array at: (index + 1).]
    at: index put: value [array at: (index + 1) put: value.]
]

Object subclass: Program [
    delay: sn [
        | payload  ms  n |
    
        "Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;"
        "setTimeout()"
        "time.sleep()"
        "gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız."
        ms := sn * 30000.
        
        "1 Saniye ≊ 30.000 Sayım"
        "1 Sayım = 3,14e-5"
        n := 0.
        [n < ms]
            whileTrue: [
                n := n + 1.
            ].
        payload := true.
        ^ payload.
    ]
    
    exit [
        "Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller."
        "Bu fonskiyon hiçbir şekilde pas geçilemez."
        "Fonksiyon bir kez çalışırsa durdurmak imkansızdır."
        [
            true
        ] whileTrue: [ ].
        ^ ex.
    ]
    
    logger: type this: this [
        | payload |
    
        "Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım."
        ""
        "Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir."
        (type = 'int')
            ifTrue: [
                Transcript show: this asInteger asString; cr.
                payload := true.
            ]
            ifFalse: [
                (type = 'str')
                    ifTrue: [
                        Transcript show: this asString; cr.
                        payload := true.
                    ]
                    ifFalse: [
                        (type = 'bool')
                            ifTrue: [
                                payload := this.
                            ]
                            ifFalse: [
                                
                                "Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir."
                                "Program durdurulur."
                                "process.exit()"
                                self exit.
                            ].
                    ].
            ].
        
        "logger(''str'', ''test'')  =>  String İçin"
        "logger(''int'', ''190'')  =>  Sayı İçin"
        "logger(''bool'', true)  => true-false için"
        ^ payload.
    ]
    
    namecorrection: name [
        | payload |
    
        (name size < 3)
            ifTrue: [
                self logger: 'str' this: 'İsminiz 3 kelimeden kısa olmamalı.', (13 asCharacter), 'Lütfen programı baştan başlatın.'.
                self exit.
            ]
            ifFalse: [
                payload := true.
            ].
        
        "Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz."
        ^ payload.
    ]
    
    plugins: type arg: arg [
        | payload  str |
    
        "Program içindeki çeşitlilik için gerekli fonksiyon."
        "Fonksiyon karmaşası olmaması için kısaltıldı."
        str := ArrayZ new count: 10.
        
        (type = 'ask name')
            ifTrue: [
                str at: 0 put: ('Oyuna Hoşgeldin Yabancı!', (13 asCharacter), 'Lütfen Adını Gir:').
                str at: 1 put: ('Hey, Merhaba Yabacı :)', (13 asCharacter), 'Lütfen İsmini Yazar mısın?').
                str at: 2 put: ('Yeni bir oyuncu. Yaşasınn!', (13 asCharacter), 'Adını söylermisin lütfen..').
                str at: 3 put: ('Oyunda Yeni Bir Katılımcı Var!', (13 asCharacter), 'Lütfen İsmini Gir:').
                str at: 4 put: ('İşte yeni bir oyuncu daha!', (13 asCharacter), 'Sana nasıl hitap etmemi istersin?').
                str at: 5 put: ('Seni daha önce buralarda görmedim..', (13 asCharacter), 'Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle.').
                str at: 6 put: ('Oyuna Hoşgeldin!', (13 asCharacter), 'Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz.').
                payload := (str at: Random between: 0 and: (7 - 1)).
            ]
            ifFalse: [
                (type = 'after name')
                    ifTrue: [
                        str at: 0 put: ('Merhaba ', arg, (13 asCharacter), 'Oyunun kuralları şunlardır:', (13 asCharacter), '1) Sistem 0-100 arasında sayı seçer.', (13 asCharacter), '2) Sayıyı tahmin etmeye çalışırsın', (13 asCharacter), '3) Toplam 10 adet başarısız denemeden sonra oyun biter.', (13 asCharacter), '4) Sayı bulunursa oyun kazanılır!').
                        payload := (str at: 0).
                    ]
                    ifFalse: [
                        (type = 'game mode')
                            ifTrue: [
                                str at: 0 put: ('Lütfen Oyun Modunu Seç', (13 asCharacter), (13 asCharacter), '1) Kolay (Sıcak-Soğuk Mantığı)', (13 asCharacter), '2) Normal (Yönergeler Yok)', (13 asCharacter), '3) İşleyiş Hakkında Bilgi Al').
                                payload := (str at: 0).
                            ]
                            ifFalse: [
                                (type = 'wmode')
                                    ifTrue: [
                                        str at: 0 put: 'Lütfen Sadece 1 veya 2 Yazın'.
                                        str at: 1 put: 'Yanlış Seçim! Sadece 1 veya 2 yazın!'.
                                        payload := (str at: Random between: 0 and: (2 - 1)).
                                    ]
                                    ifFalse: [
                                        (type = 'get num')
                                            ifTrue: [
                                                str at: 0 put: ('Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! ', arg).
                                                str at: 1 put: 'Tuttum! Hadi Başlayalım :)'.
                                                str at: 2 put: ('Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans ', arg, ' :)').
                                                payload := (str at: Random between: 0 and: (3 - 1)).
                                            ]
                                            ifFalse: [
                                                (type = 'think')
                                                    ifTrue: [
                                                        str at: 0 put: 'Tahminin?'.
                                                        str at: 1 put: ('Sence ne olabilir ', arg, '?').
                                                        str at: 2 put: 'Bi fikrin varmı?'.
                                                        str at: 3 put: ('Tahminin için bekliyorum ', arg).
                                                        str at: 4 put: 'İyi düşün ve öyle karar ver..'.
                                                        str at: 5 put: 'Bencee.. Ay, yardım edemem.. En iyisi tahmin et.'.
                                                        str at: 6 put: ('Şansını boşa harcama ', arg).
                                                        str at: 7 put: 'Sakın yanlış tahin ediyim deme haa'.
                                                        str at: 8 put: ('Hadi sıra sende ', arg).
                                                        payload := (str at: Random between: 0 and: (9 - 1)).
                                                    ]
                                                    ifFalse: [
                                                        (type = 'wthink')
                                                            ifTrue: [
                                                                str at: 0 put: 'Yanlış! Tahminin?'.
                                                                str at: 1 put: ('Bu Değil. Sence ne olabilir ', arg, '?').
                                                                str at: 2 put: 'Sayı bu değil. Bi fikrin varmı?'.
                                                                str at: 3 put: ('Yeniden.. Tahminin için bekliyorum ', arg).
                                                                str at: 4 put: 'Şimdi iyi düşün ve öyle karar ver..'.
                                                                str at: 5 put: 'Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et.'.
                                                                str at: 6 put: ('Şansını boşa harcama ', arg).
                                                                str at: 7 put: 'Ah be abi. Sakın yanlış tahin ediyim deme haa'.
                                                                str at: 8 put: ('Tekrardan.. Hadi sıra sende ', arg).
                                                                payload := (str at: Random between: 0 and: (9 - 1)).
                                                            ]
                                                            ifFalse: [
                                                                (type = 'sthink')
                                                                    ifTrue: [
                                                                        str at: 0 put: 'Hey, hey! Bu son hakkın. Dikkatli Ol!'.
                                                                        str at: 1 put: ('Dur Biraz! Bu Son Şansın. İyi Kullan ', arg).
                                                                        str at: 2 put: 'Kader Anı! Oyunu kazanman için son şans!'.
                                                                        str at: 3 put: ('Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin ', arg).
                                                                        str at: 4 put: 'Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı..'.
                                                                        payload := (str at: Random between: 0 and: (5 - 1)).
                                                                    ]
                                                                    ifFalse: [
                                                                        (type = 'win')
                                                                            ifTrue: [
                                                                                str at: 0 put: ('[+] Kazandın!!!', (13 asCharacter), 'İşte Buuu! Nasılda tahmin ettin *o*', (13 asCharacter), (13 asCharacter), 'Bir sonraki oyunda görüşmek üzere..').
                                                                                str at: 1 put: ('[+] Tebrikler ', arg, '.', (13 asCharacter), 'Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın.', (13 asCharacter), 'Bir sonraki oyununda başarılar.').
                                                                                str at: 2 put: ('[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)', (13 asCharacter), 'Bir oyuna daha var mısın..').
                                                                                str at: 3 put: ('[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum.', (13 asCharacter), 'Sonraki oyunlarda görüşmek dileğiyle..').
                                                                                str at: 4 put: ('[+] İyi iş çıkardın ', arg, (13 asCharacter), 'Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \''_''/').
                                                                                payload := (str at: Random between: 0 and: (5 - 1)).
                                                                            ]
                                                                            ifFalse: [
                                                                                (type = 'swin')
                                                                                    ifTrue: [
                                                                                        str at: 0 put: '[⁂] İnanılmaz.. Tek Kelime İle Şahane!'.
                                                                                        str at: 1 put: '[⁂] Ne.. Bu kadar hızlı yenilemem..'.
                                                                                        str at: 2 put: '[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim..'.
                                                                                        str at: 3 put: '[⁂] Sen..? Nasıl..? Hile mi yapıyosun??'.
                                                                                        str at: 4 put: '[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?'.
                                                                                        payload := (str at: Random between: 0 and: (5 - 1)).
                                                                                    ]
                                                                                    ifFalse: [
                                                                                        (type = 'lose')
                                                                                            ifTrue: [
                                                                                                str at: 0 put: '[-] Üzgünüm, Oyunu Kaybettiniz.'.
                                                                                                str at: 1 put: '[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın..'.
                                                                                                str at: 2 put: '[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin.'.
                                                                                                str at: 3 put: '[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın.'.
                                                                                                str at: 4 put: '[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez..'.
                                                                                                payload := (str at: Random between: 0 and: (5 - 1)).
                                                                                            ]
                                                                                            ifFalse: [
                                                                                                (type = 'cold')
                                                                                                    ifTrue: [
                                                                                                        str at: 0 put: ('↘                ↙', (13 asCharacter), ' Soğuk', (13 asCharacter), '↗                ↖').
                                                                                                        payload := (str at: 0).
                                                                                                    ]
                                                                                                    ifFalse: [
                                                                                                        (type = 'warm')
                                                                                                            ifTrue: [
                                                                                                                str at: 0 put: ('↘                ↙', (13 asCharacter), '  Ilık', (13 asCharacter), '↗                ↖').
                                                                                                                payload := (str at: 0).
                                                                                                            ]
                                                                                                            ifFalse: [
                                                                                                                (type = 'hot')
                                                                                                                    ifTrue: [
                                                                                                                        str at: 0 put: ('↘                ↙', (13 asCharacter), ' Sıcak', (13 asCharacter), '↗                ↖').
                                                                                                                        payload := (str at: 0).
                                                                                                                    ]
                                                                                                                    ifFalse: [
                                                                                                                        (type = 'info')
                                                                                                                            ifTrue: [
                                                                                                                                str at: 0 put: 'Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır.'.
                                                                                                                                str at: 1 put: 'Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir.'.
                                                                                                                                str at: 2 put: 'İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır.'.
                                                                                                                                str at: 3 put: 'Ardından oyun hakkında bilgilendirme mesajı gönderilir.'.
                                                                                                                                str at: 4 put: 'Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki ''Ana'' yazan yere basıp ''logger'' seçmelisiniz.'.
                                                                                                                                str at: 5 put: 'Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor.'.
                                                                                                                                str at: 6 put: 'Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir.'.
                                                                                                                                str at: 7 put: 'Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir.'.
                                                                                                                                str at: 8 put: 'Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır.'.
                                                                                                                                str at: 9 put: 'Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur.'.
                                                                                                                                payload := (str at: arg asInteger).
                                                                                                                            ].
                                                                                                                    ].
                                                                                                            ].
                                                                                                    ].
                                                                                            ].
                                                                                    ].
                                                                            ].
                                                                    ].
                                                            ].
                                                    ].
                                            ].
                                    ].
                            ].
                    ].
            ].
        
        "prototip => plugins(<str>, <str>)"
        "Örnek:"
        "plugins(''ask name'', '' '')"
        "plugins(''after name'', ''İsim'')"
        ^ payload.
    ]
    
    rand: type [
        | payload  opt  num  index |
    
        index := ArrayZ new count: 101.
        
        "100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır."
        ""
        "var dizin = [''bir'', ''iki'', ''üç'']"
        "return dizin[0]     // ''bir''"
        (type not)
            ifTrue: [
                payload := (Random between: 0 and: (101 - 1)).
                
                "Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu."
                "Değişken kontrolü için;"
                "rand(true)"
                ""
                "Direk işlem için;"
                "rand(false)"
                ""
                "kullanın."
                (payload = 0)
                    ifTrue: [
                        self rand: false.
                    ].
            ]
            ifFalse: [
                
                "Bu kısım değişken kontrolü yapmak isteyenler içindir."
                num := 0.
                [
                    index at: num put: num.
                    num := num + 1.
                    num < 101
                ] whileTrue: [ ].
                
                "do döngüsü kullanılır."
                opt := (Random between: 0 and: (101 - 1)).
                payload := (index at: opt).
                (payload = 0)
                    ifTrue: [
                        self rand: true.
                    ].
            ].
        
        "İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır."
        "Çıkış int (Tamsayı) olarak döner."
        ^ payload.
    ]
    
    main [
        | sync  find  name  mode  number  index  index2  think  index  index2  think |
    
        self logger: 'str' this: self plugins: 'ask name' arg: ''.
        self delay: 2.
        name := stdin nextLine asString.
        self namecorrection: name.
        self delay: 2.
        
        "İsim Alma Kısmı Tamamlandı"
        self logger: 'str' this: self plugins: 'after name' arg: name.
        self delay: 9.
        self logger: 'str' this: self plugins: 'game mode' arg: ''.
        mode := stdin nextLine asInteger.
        
        "Oyun Modu Başarıyla Seçildi"
        (mode = 1 | (mode = 2))
            ifTrue: [
                (mode = 1)
                    ifTrue: [
                        
                        "Kolay Oyun Modu"
                        index := 0.
                        index2 := 0.
                        sync := true.
                        number := (self rand: true).
                        self logger: 'str' this: self plugins: 'get num' arg: name.
                        self delay: 2.
                        
                        "Sayı Belirlendi"
                        [sync]
                            whileTrue: [
                                (index = 10)
                                    ifTrue: [
                                        find := false.
                                        sync := false.
                                        
                                        "10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat"
                                    ]
                                    ifFalse: [
                                        index2 := index2 + 1.
                                        index := index + 1.
                                        (index = 1)
                                            ifTrue: [
                                                
                                                "İlk başlama mesajı"
                                                self logger: 'str' this: self plugins: 'think' arg: name.
                                            ]
                                            ifFalse: [
                                                
                                                "Sonraki başlama mesajları"
                                                (index = 10)
                                                    ifTrue: [
                                                        
                                                        "Son tahmin hakkı için bilgilendirme mesajı"
                                                        self logger: 'str' this: self plugins: 'sthink' arg: name.
                                                        self delay: 3.5.
                                                    ]
                                                    ifFalse: [
                                                        
                                                        "Yanlış tahminler için bilgilendirme mesajı"
                                                        self logger: 'str' this: self plugins: 'wthink' arg: name.
                                                    ].
                                            ].
                                        think := stdin nextLine asInteger.
                                        (think = number)
                                            ifTrue: [
                                                
                                                "Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat."
                                                find := true.
                                                sync := false.
                                            ]
                                            ifFalse: [
                                                self delay: 1.
                                                (index = 10)
                                                    ifTrue: [
                                                    ]
                                                    ifFalse: [
                                                        (think > number)
                                                            ifTrue: [
                                                                
                                                                "Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön"
                                                                (think - number > 25)
                                                                    ifTrue: [
                                                                        
                                                                        "Tahmin, sayıdan uzak ise bunu gönder"
                                                                        self logger: 'str' this: self plugins: 'cold' arg: ''.
                                                                    ]
                                                                    ifFalse: [
                                                                        (think - number > 15)
                                                                            ifTrue: [
                                                                                
                                                                                "Tahmin, sayıya biraz yakın ise bunu gönder"
                                                                                self logger: 'str' this: self plugins: 'warm' arg: ''.
                                                                            ]
                                                                            ifFalse: [
                                                                                
                                                                                "Tahmin, sayıya çok yakın ise bunu gönder"
                                                                                self logger: 'str' this: self plugins: 'hot' arg: ''.
                                                                            ].
                                                                    ].
                                                            ]
                                                            ifFalse: [
                                                                
                                                                "Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön"
                                                                (number - think > 25)
                                                                    ifTrue: [
                                                                        
                                                                        "Tahmin, sayıdan uzak ise bunu gönder"
                                                                        self logger: 'str' this: self plugins: 'cold' arg: ''.
                                                                    ]
                                                                    ifFalse: [
                                                                        (number - think > 15)
                                                                            ifTrue: [
                                                                                
                                                                                "Tahmin, sayıya biraz yakın ise bunu gönder"
                                                                                self logger: 'str' this: self plugins: 'warm' arg: ''.
                                                                            ]
                                                                            ifFalse: [
                                                                                
                                                                                "Tahmin, sayıya çok yakın ise bunu gönder"
                                                                                self logger: 'str' this: self plugins: 'hot' arg: ''.
                                                                            ].
                                                                    ].
                                                            ].
                                                    ].
                                            ].
                                    ].
                            ].
                        (find)
                            ifTrue: [
                                
                                "Oyun Kazanıldığında Buraya Dön"
                                (index2 < 4)
                                    ifTrue: [
                                        
                                        "Sayı hemen tahmin edilirse ek mesaj gönder"
                                        self logger: 'str' this: self plugins: 'swin' arg: name.
                                        self delay: 1.
                                        self logger: 'str' this: self plugins: 'win' arg: name.
                                        self delay: 2.
                                        self logger: 'str' this: index2 asString, '. Denemede Oyunu Kazandınız!'.
                                    ]
                                    ifFalse: [
                                        
                                        "Klasik tebrik mesajı"
                                        self logger: 'str' this: self plugins: 'win' arg: name.
                                        self delay: 2.
                                        self logger: 'str' this: index2 asString, '. Denemede Oyunu Kazandınız!'.
                                    ].
                            ]
                            ifFalse: [
                                
                                "Oyun Kaybedildiğinde Buraya Dön"
                                self logger: 'str' this: self plugins: 'lose' arg: name.
                                self delay: 2.
                                self logger: 'str' this: 'Bir kez daha oynamak için 1 yazman yeterli.'.
                                name := stdin nextLine asString.
                                (name = '1')
                                    ifTrue: [
                                        
                                        "Program kapanmadan bir kez daha oynama hakkı verir."
                                        self main.
                                    ].
                            ].
                    ]
                    ifFalse: [
                        
                        "Normal Oyun Modu"
                        index := 0.
                        index2 := 0.
                        sync := true.
                        number := (self rand: false).
                        self logger: 'str' this: self plugins: 'get num' arg: name.
                        self delay: 2.
                        
                        "Sayı Belirlendi"
                        [sync]
                            whileTrue: [
                                (index = 10)
                                    ifTrue: [
                                        find := false.
                                        sync := false.
                                        
                                        "10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat"
                                    ]
                                    ifFalse: [
                                        index2 := index2 + 1.
                                        index := index + 1.
                                        (index = 1)
                                            ifTrue: [
                                                
                                                "İlk başlama mesajı"
                                                self logger: 'str' this: self plugins: 'think' arg: name.
                                            ]
                                            ifFalse: [
                                                
                                                "Sonraki başlama mesajları"
                                                (index = 10)
                                                    ifTrue: [
                                                        
                                                        "Son tahmin hakkı için bilgilendirme mesajı"
                                                        self logger: 'str' this: self plugins: 'sthink' arg: name.
                                                        self delay: 3.5.
                                                    ]
                                                    ifFalse: [
                                                        
                                                        "Yanlış tahminler için bilgilendirme mesajı"
                                                        self logger: 'str' this: self plugins: 'wthink' arg: name.
                                                    ].
                                            ].
                                        think := stdin nextLine asInteger.
                                        (think = number)
                                            ifTrue: [
                                                
                                                "Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat."
                                                find := true.
                                                sync := false.
                                            ]
                                            ifFalse: [
                                                
                                                "Tahmin Yanlış İse Döngüyü Yeniden Başlat"
                                            ].
                                    ].
                            ].
                        (find)
                            ifTrue: [
                                
                                "Oyun Kazanıldığında Buraya Dön"
                                (index2 < 4)
                                    ifTrue: [
                                        
                                        "Sayı hemen tahmin edilirse ek mesaj gönder"
                                        self logger: 'str' this: self plugins: 'swin' arg: name.
                                        self delay: 1.
                                        self logger: 'str' this: self plugins: 'win' arg: name.
                                        self delay: 2.
                                        self logger: 'str' this: index2 asString, '. Denemede Oyunu Kazandınız!'.
                                    ]
                                    ifFalse: [
                                        
                                        "Klasik tebrik mesajı"
                                        self logger: 'str' this: self plugins: 'win' arg: name.
                                        self delay: 2.
                                        self logger: 'str' this: index2 asString, '. Denemede Oyunu Kazandınız!'.
                                    ].
                            ]
                            ifFalse: [
                                
                                "Oyun Kaybedildiğinde Buraya Dön"
                                self logger: 'str' this: self plugins: 'lose' arg: name.
                                self delay: 2.
                                self logger: 'str' this: 'Bir kez daha oynamak için 1 yazman yeterli.'.
                                name := stdin nextLine asString.
                                (name = '1')
                                    ifTrue: [
                                        
                                        "Program kapanmadan bir kez daha oynama hakkı verir."
                                        self main.
                                    ].
                            ].
                    ].
            ]
            ifFalse: [
                (mode = 3)
                    ifTrue: [
                        
                        "Bilgilendirme Mesajı"
                        number := 0.
                        [
                            self logger: 'str' this: self plugins: 'info' arg: number asString.
                            self delay: 4.
                            number := number + 1.
                            number ~= 10
                        ] whileTrue: [ ].
                        
                        "do Dögüsü kullanmak en iyi seçenek olacaktır"
                    ]
                    ifFalse: [
                        self logger: 'str' this: self plugins: 'wmode' arg: ''.
                    ].
            ].
    ]
]

"Create the program and run main"
| program |
program := Program new.
program main.
