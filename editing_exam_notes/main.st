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
        | sonuc  ms  n |
    
        "Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız."
        ms := sn * 33.
        n := 0.
        [n ~= ms]
            whileTrue: [
                n := n + 1.
            ].
        sonuc := true.
        
        "Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır."
        "boolen test"
        "test = delay(200)"
        "çıktı test  // true"
        ^ sonuc.
    ]
    
    puanekle: puan [
        | sonuc  ekpuan  index  index2  sync |
    
        ekpuan := ArrayZ new count: 20.
        
        "while döngüsü için"
        sync := true.
        index := 0.
        (puan > 89)
            ifTrue: [
                sonuc := 'pass'.
                
                "90 ve üstü notlar için puan ekleme olmaz."
            ]
            ifFalse: [
                (puan > 69)
                    ifTrue: [
                        index2 := 5.
                        [sync]
                            whileTrue: [
                                (index = 6)
                                    ifTrue: [
                                        sync := false.
                                    ]
                                    ifFalse: [
                                        ekpuan at: index put: index2.
                                        index := index + 1.
                                        index2 := index2 + 1.
                                    ].
                            ].
                        sonuc := (ekpuan at: Random between: 0 and: (6 - 1)) asString.
                        
                        "Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle."
                    ]
                    ifFalse: [
                        (puan > 49)
                            ifTrue: [
                                index2 := 10.
                                [sync]
                                    whileTrue: [
                                        (index = 9)
                                            ifTrue: [
                                                sync := false.
                                            ]
                                            ifFalse: [
                                                ekpuan at: index put: index2.
                                                index := index + 1.
                                                index2 := index2 + 1.
                                            ].
                                    ].
                                sonuc := (ekpuan at: Random between: 0 and: (9 - 1)) asString.
                                
                                "Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle."
                            ]
                            ifFalse: [
                                (puan > 29)
                                    ifTrue: [
                                        index2 := 20.
                                        [sync]
                                            whileTrue: [
                                                (index = 10)
                                                    ifTrue: [
                                                        sync := false.
                                                    ]
                                                    ifFalse: [
                                                        ekpuan at: index put: index2.
                                                        index := index + 1.
                                                        index2 := index2 + 1.
                                                    ].
                                            ].
                                        sonuc := (ekpuan at: Random between: 0 and: (10 - 1)) asString.
                                        
                                        "Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle."
                                    ]
                                    ifFalse: [
                                        index2 := 30.
                                        [sync]
                                            whileTrue: [
                                                (index = 11)
                                                    ifTrue: [
                                                        sync := false.
                                                    ]
                                                    ifFalse: [
                                                        ekpuan at: index put: index2.
                                                        index := index + 1.
                                                        index2 := index2 + 1.
                                                    ].
                                            ].
                                        sonuc := (ekpuan at: Random between: 0 and: (11 - 1)) asString.
                                        
                                        "Not 30'dan küçük ise, 30 ila 40 arasında puan ekle."
                                    ].
                            ].
                    ].
            ].
        
        "String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:"
        "var sayı = 0.65   // Javascript"
        "sayı = 0.65          // Python"
        "local sayı = 0.65          // Lua"
        "int sayı = 0.65     // C"
        ^ sonuc.
    ]
    
    puaneklesoru: no eskinot: eskinot [
        | sonuc |
    
        Transcript show: no, '. Öğrenci İçin Kaç Puan Eklemek İstersiniz: ', (13 asCharacter), (13 asCharacter), 'Öğrencinin Puanı: ', (eskinot asString); cr.
        sonuc := stdin nextLine asInteger.
        ^ sonuc.
    ]
    
    yardımloop: sayı [
        | sonuc |
    
        (sayı = 1 | (sayı = 2))
            ifTrue: [
            ]
            ifFalse: [
                Transcript show: 'Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın.', (13 asCharacter), 'Yeniden Başlatılıyor..'; cr.
                self delay: 1000.
                Transcript show: '1) Otomatik Mod Hakkında Yardım', (13 asCharacter), '2) Manuel Mod Hakkında Yardım'; cr.
                sayı := stdin nextLine asInteger.
                self yardımloop: sayı.
            ].
        
        "Yardım Modülü İçin"
        "Yanlış değer girildiğinde baştan başlatır"
        sonuc := sayı.
        ^ sonuc.
    ]
    
    yardımloop2: sayı [
        | sonuc |
    
        (sayı = 1 | (sayı = 2) | (sayı = 3))
            ifTrue: [
            ]
            ifFalse: [
                Transcript show: 'Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın.', (13 asCharacter), 'Yeniden Başlatılıyor..'; cr.
                self delay: 1000.
                Transcript show: '1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım', (13 asCharacter), '2) Manuel Puan Ekleme Hakkında Yardım', (13 asCharacter), '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım'; cr.
                sayı := stdin nextLine asInteger.
                self yardımloop2: sayı.
            ].
        sonuc := sayı.
        ^ sonuc.
    ]
    
    main [
        | sync  secim  index  index2  notlar  eskinotlar  otonot  otoeklenennot  secim2  devam  cikti  sayı1  sayı2  sayı3  sayı4  sayı5  soru1  soru2  soru3  soru4  soru5  soruarray  sonsayılar  helpnum  helpnum2  loop  loop2 |
    
        sync := true.
        index := 0.
        index2 := 0.
        notlar := ArrayZ new count: 5.
        eskinotlar := ArrayZ new count: 5.
        otonot := ArrayZ new count: 20.
        otoeklenennot := ArrayZ new count: 15.
        
        Transcript show: 'Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?', (13 asCharacter), (13 asCharacter), 'Otomatik için: ''O''', (13 asCharacter), 'Manuel için: ''M''', (13 asCharacter), 'Yazın', (13 asCharacter), (13 asCharacter), 'Arayüz Hakkında Bilgi Almak İçin İse ''A'' Yazın'; cr.
        secim := stdin nextLine asString.
        (secim = 'O' | (secim = 'o'))
            ifTrue: [
                [sync]
                    whileTrue: [
                        
                        "Bu döngü notları belirler."
                        (index = 5)
                            ifTrue: [
                                sync := false.
                                
                                "index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır."
                            ]
                            ifFalse: [
                                index := index + 1.
                                notlar at: index2 put: (Random between: 0 and: (80 - 1)).
                                
                                "Random sayı belirle"
                                index2 := index2 + 1.
                                
                                "0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet"
                            ].
                    ].
                sync := true.
                index := 0.
                index2 := 0.
                
                "Değişkenleri sıfırlayalım"
                [sync]
                    whileTrue: [
                        
                        "Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler."
                        (index = 5)
                            ifTrue: [
                                sync := false.
                            ]
                            ifFalse: [
                                index := index + 1.
                                eskinotlar at: index2 put: (notlar at: index2).
                                notlar at: index2 put: ((notlar at: index2) + 20).
                                index2 := index2 + 1.
                            ].
                    ].
                sync := true.
                index := 0.
                index2 := 0.
                
                "Değişkenleri sıfırlayalım"
                Transcript show: 'Yeni Notlar:'; cr.
                [sync]
                    whileTrue: [
                        
                        "Bu döngü eski ve yeni notları bir arada yazdırır."
                        (index = 5)
                            ifTrue: [
                                sync := false.
                                
                                "Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım"
                            ]
                            ifFalse: [
                                index := index + 1.
                                Transcript show: index asString, '. Öğrencinin; ', (13 asCharacter), (13 asCharacter), 'Eski Not: ', (eskinotlar at: index2 asString), (13 asCharacter), 'Yeni Not: ', (notlar at: index2 asString); cr.
                                self delay: 500.
                                
                                "500 Milisaniyelik Gecikme"
                                index2 := index2 + 1.
                            ].
                    ].
            ]
            ifFalse: [
                (secim = 'M' | (secim = 'm'))
                    ifTrue: [
                        Transcript show: '1. Öğrencinin Notunu Giriniz: '; cr.
                        notlar at: 0 set: stdin nextLine asInteger.
                        Transcript show: '2. Öğrencinin Notunu Giriniz: '; cr.
                        notlar at: 1 set: stdin nextLine asInteger.
                        Transcript show: '3. Öğrencinin Notunu Giriniz: '; cr.
                        notlar at: 2 set: stdin nextLine asInteger.
                        Transcript show: '4. Öğrencinin Notunu Giriniz: '; cr.
                        notlar at: 3 set: stdin nextLine asInteger.
                        Transcript show: '5. Öğrencinin Notunu Giriniz: '; cr.
                        notlar at: 4 set: stdin nextLine asInteger.
                        self delay: 800.
                        devam := true.
                        index := 0.
                        index2 := 0.
                        [sync]
                            whileTrue: [
                                (index = 5)
                                    ifTrue: [
                                        sync := false.
                                    ]
                                    ifFalse: [
                                        index := index + 1.
                                        ((notlar at: index2) > 100)
                                            ifTrue: [
                                                sync := false.
                                                devam := false.
                                            ]
                                            ifFalse: [
                                                ((notlar at: index2) < 0)
                                                    ifTrue: [
                                                        sync := false.
                                                        devam := false.
                                                    ]
                                                    ifFalse: [
                                                        index2 := index2 + 1.
                                                    ].
                                            ].
                                    ].
                            ].
                        (devam not)
                            ifTrue: [
                                Transcript show: 'Notlar 100 ve 0 Arasında Olmalıdır.'; cr.
                            ]
                            ifFalse: [
                                Transcript show: 'Size 3 Seçenek Sunuyoruz:', (13 asCharacter), (13 asCharacter), '1) Herkesin Notuna +20 Puan Ekle', (13 asCharacter), '2) Herkesin Notuna Eklenecek Puanı Manuel Gir', (13 asCharacter), '3) Sistem''in Kendi Not Ekleme Aracını Kullan'; cr.
                                secim2 := stdin nextLine asInteger.
                                (secim2 = 3)
                                    ifTrue: [
                                        self delay: 59.
                                        index := 0.
                                        index2 := 0.
                                        sync := true.
                                        [sync]
                                            whileTrue: [
                                                (index = 5)
                                                    ifTrue: [
                                                        sync := false.
                                                    ]
                                                    ifFalse: [
                                                        index := index + 1.
                                                        otoeklenennot at: index2 put: (self puanekle: notlar at: index2).
                                                        
                                                        "Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir."
                                                        self delay: 59.
                                                        ((otoeklenennot at: index2) = 'pass')
                                                            ifTrue: [
                                                                otoeklenennot at: index2 put: '0'.
                                                            ]
                                                            ifFalse: [
                                                                otonot at: index2 put: ((notlar at: index2) + ((self puanekle: notlar at: index2) asInteger)).
                                                            ].
                                                        index2 := index2 + 1.
                                                    ].
                                            ].
                                        index := 0.
                                        index2 := 0.
                                        sync := true.
                                        [sync]
                                            whileTrue: [
                                                (index = 5)
                                                    ifTrue: [
                                                        sync := false.
                                                    ]
                                                    ifFalse: [
                                                        index := index + 1.
                                                        ((otoeklenennot at: index2) = '0')
                                                            ifTrue: [
                                                                cikti := index asString, '. Öğrencinin; ', (13 asCharacter), (13 asCharacter), 'Eski Not: ', (notlar at: index2 asString), (13 asCharacter), 'Yeni Not: ', (notlar at: index2 asString), (13 asCharacter), 'Ek Puan Yok. Not Yeterli.'.
                                                            ]
                                                            ifFalse: [
                                                                cikti := index asString, '. Öğrencinin; ', (13 asCharacter), (13 asCharacter), 'Eski Not: ', (notlar at: index2 asString), (13 asCharacter), 'Yeni Not: ', ((otoeklenennot at: index2) asInteger + (notlar at: index2) asString), (13 asCharacter), 'Eklenen Puan: ', (otoeklenennot at: index2).
                                                            ].
                                                        Transcript show: cikti; cr.
                                                        self delay: 500.
                                                        index2 := index2 + 1.
                                                    ].
                                            ].
                                    ]
                                    ifFalse: [
                                        (secim2 = 2)
                                            ifTrue: [
                                                index := 0.
                                                index2 := 0.
                                                sync := false.
                                                
                                                "Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez."
                                                "Yaha henüz ben keşfedemedim :p"
                                                self delay: 230.
                                                soru1 := (self puaneklesoru: '1' eskinot: notlar at: index2).
                                                index2 := index2 + 1.
                                                soru2 := (self puaneklesoru: '2' eskinot: notlar at: index2).
                                                index2 := index2 + 1.
                                                soru3 := (self puaneklesoru: '3' eskinot: notlar at: index2).
                                                index2 := index2 + 1.
                                                soru4 := (self puaneklesoru: '4' eskinot: notlar at: index2).
                                                index2 := index2 + 1.
                                                soru5 := (self puaneklesoru: '5' eskinot: notlar at: index2).
                                                self delay: 600.
                                                sync := true.
                                                soruarray := ArrayZ new count: 5.
                                                
                                                soruarray at: 0 put: soru1.
                                                soruarray at: 1 put: soru2.
                                                soruarray at: 2 put: soru3.
                                                soruarray at: 3 put: soru4.
                                                soruarray at: 4 put: soru5.
                                                (soru1 > 100 & (soru1 < 0) | (soru2 > 100 & (soru2 < 0)) | (soru3 > 100 & (soru3 < 0)) | (soru4 > 100 & (soru4 < 0)) | (soru5 > 100 & (soru5 < 0)))
                                                    ifTrue: [
                                                        Transcript show: 'Notların Son Hali 100 ve 0 Arasında Olmalıdır.'; cr.
                                                    ]
                                                    ifFalse: [
                                                        index2 := 0.
                                                        sayı1 := soru1 + (notlar at: index2).
                                                        index2 := index2 + 1.
                                                        sayı2 := soru2 + (notlar at: index2).
                                                        index2 := index2 + 1.
                                                        sayı3 := soru3 + (notlar at: index2).
                                                        index2 := index2 + 1.
                                                        sayı4 := soru4 + (notlar at: index2).
                                                        index2 := index2 + 1.
                                                        sayı5 := soru5 + (notlar at: index2).
                                                        index2 := 0.
                                                        index := 0.
                                                        sonsayılar := ArrayZ new count: 5.
                                                        
                                                        sonsayılar at: 0 put: sayı1.
                                                        sonsayılar at: 1 put: sayı2.
                                                        sonsayılar at: 2 put: sayı3.
                                                        sonsayılar at: 3 put: sayı4.
                                                        sonsayılar at: 4 put: sayı5.
                                                        [sync]
                                                            whileTrue: [
                                                                (index = 5)
                                                                    ifTrue: [
                                                                        sync := false.
                                                                    ]
                                                                    ifFalse: [
                                                                        index := index + 1.
                                                                        Transcript show: index asString, '. Öğrencinin; ', (13 asCharacter), (13 asCharacter), 'Eski Not: ', (notlar at: index2 asString), (13 asCharacter), 'Yeni Not: ', (sonsayılar at: index2 asString), (13 asCharacter), 'Eklenen Puan: ', (soruarray at: index2 asString); cr.
                                                                        self delay: 270.
                                                                        index2 := index2 + 1.
                                                                    ].
                                                            ].
                                                    ].
                                            ]
                                            ifFalse: [
                                                (secim2 = 1)
                                                    ifTrue: [
                                                        [sync]
                                                            whileTrue: [
                                                                
                                                                "Bu döngü notları belirler."
                                                                (index = 5)
                                                                    ifTrue: [
                                                                        sync := false.
                                                                        
                                                                        "index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır."
                                                                    ]
                                                                    ifFalse: [
                                                                        index := index + 1.
                                                                        notlar at: index2 put: (Random between: 0 and: (80 - 1)).
                                                                        
                                                                        "Random sayı belirle"
                                                                        index2 := index2 + 1.
                                                                        
                                                                        "0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet"
                                                                    ].
                                                            ].
                                                        sync := true.
                                                        index := 0.
                                                        index2 := 0.
                                                        
                                                        "Değişkenleri sıfırlayalım"
                                                        [sync]
                                                            whileTrue: [
                                                                
                                                                "Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler."
                                                                (index = 5)
                                                                    ifTrue: [
                                                                        sync := false.
                                                                    ]
                                                                    ifFalse: [
                                                                        index := index + 1.
                                                                        eskinotlar at: index2 put: (notlar at: index2).
                                                                        notlar at: index2 put: ((notlar at: index2) + 20).
                                                                        index2 := index2 + 1.
                                                                    ].
                                                            ].
                                                        sync := true.
                                                        index := 0.
                                                        index2 := 0.
                                                        
                                                        "Değişkenleri sıfırlayalım"
                                                        Transcript show: 'Yeni Notlar:'; cr.
                                                        [sync]
                                                            whileTrue: [
                                                                
                                                                "Bu döngü eski ve yeni notları bir arada yazdırır."
                                                                (index = 5)
                                                                    ifTrue: [
                                                                        sync := false.
                                                                        
                                                                        "Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım"
                                                                    ]
                                                                    ifFalse: [
                                                                        index := index + 1.
                                                                        ((notlar at: index2) > 100)
                                                                            ifTrue: [
                                                                                notlar at: index2 put: 100.
                                                                                Transcript show: index asString, '. Öğrencinin; ', (13 asCharacter), (13 asCharacter), 'Eski Not: ', (eskinotlar at: index2 asString), (13 asCharacter), 'Yeni Not: ', (notlar at: index2 asString); cr.
                                                                            ]
                                                                            ifFalse: [
                                                                                Transcript show: index asString, '. Öğrencinin; ', (13 asCharacter), (13 asCharacter), 'Eski Not: ', (eskinotlar at: index2 asString), (13 asCharacter), 'Yeni Not: ', (notlar at: index2 asString); cr.
                                                                            ].
                                                                        
                                                                        "20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır."
                                                                        self delay: 500.
                                                                        
                                                                        "500 Milisaniyelik Gecikme"
                                                                        index2 := index2 + 1.
                                                                    ].
                                                            ].
                                                    ]
                                                    ifFalse: [
                                                        Transcript show: 'Lütfen 1, 2 veya 3 yazınız.'; cr.
                                                        self delay: 1000.
                                                        Transcript show: 'Program Kapatılıyor..'; cr.
                                                        index := 3.
                                                        [sync]
                                                            whileTrue: [
                                                                (index = 0)
                                                                    ifTrue: [
                                                                        sync := false.
                                                                    ]
                                                                    ifFalse: [
                                                                        self delay: 1000.
                                                                        Transcript show: index asString, '..'; cr.
                                                                        index := index - 1.
                                                                    ].
                                                                
                                                                "Programın Kapatılması İçin Sayaç Oluştur"
                                                            ].
                                                    ].
                                            ].
                                    ].
                            ].
                    ]
                    ifFalse: [
                        (secim = 'a' | (secim = 'A'))
                            ifTrue: [
                                Transcript show: '1) Otomatik Mod Hakkında Yardım', (13 asCharacter), '2) Manuel Mod Hakkında Yardım'; cr.
                                helpnum := stdin nextLine asInteger.
                                self delay: 200.
                                
                                "Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar."
                                loop := (self yardımloop: helpnum).
                                self delay: 200.
                                (loop = 1)
                                    ifTrue: [
                                        Transcript show: 'Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.'; cr.
                                        self delay: 7800.
                                        Transcript show: 'Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.'; cr.
                                        self delay: 9000.
                                        Transcript show: 'Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.'; cr.
                                    ]
                                    ifFalse: [
                                        Transcript show: '1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım', (13 asCharacter), '2) Manuel Puan Ekleme Hakkında Yardım', (13 asCharacter), '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım'; cr.
                                        helpnum2 := stdin nextLine asInteger.
                                        self delay: 200.
                                        loop2 := (self yardımloop2: helpnum2).
                                        self delay: 200.
                                        (loop2 = 1)
                                            ifTrue: [
                                                Transcript show: 'Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.'; cr.
                                            ]
                                            ifFalse: [
                                                (loop2 = 2)
                                                    ifTrue: [
                                                        Transcript show: 'Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.'; cr.
                                                        self delay: 7800.
                                                        Transcript show: 'Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.'; cr.
                                                    ]
                                                    ifFalse: [
                                                        Transcript show: 'Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.'; cr.
                                                        self delay: 4500.
                                                        Transcript show: 'Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.'; cr.
                                                        self delay: 4500.
                                                        Transcript show: 'Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.'; cr.
                                                        self delay: 8000.
                                                        Transcript show: 'Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt''a (ekrana) yazdırılır.'; cr.
                                                    ].
                                            ].
                                    ].
                            ]
                            ifFalse: [
                                Transcript show: 'Lütfen Sadece ''M'' veya ''O'' Harflerini Giriniz!'; cr.
                            ].
                    ].
            ].
        
        "2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır."
        ""
        "Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir."
        "Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer."
        ""
        "1. İşlem: Seçilen Notların Hepine 20 Puan Ekle"
        "2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler"
        "3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar."
        ""
        "3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir."
    ]
]

"Create the program and run main"
| program |
program := Program new.
program main.
