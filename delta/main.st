"Smalltalk arrays are 1-indexed. This creates a 0-based version."
Object subclass: ArrayZ [
    | array |
    count: size [array := Array new: size.]
    size [^ array size.]
    at: index [^ array at: (index + 1).]
    at: index put: value [array at: (index + 1) put: value.]
]

Object subclass: Program [
    fonksiyon: deger a: a b: b [
        | sonuc |
    
        (deger < 0)
            ifTrue: [
                sonuc := 'Kök Bulunamadı'.
            ]
            ifFalse: [
                (deger = 0)
                    ifTrue: [
                        sonuc := '1. ve 2. Kökler Eşittir. Sonuç: ', ((-b / 2 * a) asString).
                    ]
                    ifFalse: [
                        sonuc := 'pass'.
                    ].
            ].
        ^ sonuc.
    ]
    
    formül: a b: b c: c [
        | sonuc |
    
        sonuc := b * b - (4 * a * c).
        ^ sonuc.
    ]
    
    main [
        | fsayı  islem  text |
    
        fsayı := ArrayZ new count: 7.
        
        "Dizi Kullanımı String Methoda Göre Daha Hızlıdır."
        "// var fsayı = new Array()"
        Transcript show: '''a'' Sayısının Değerini Girin: '; cr.
        fsayı at: 0 set: stdin nextLine asFloat.
        Transcript show: '''b'' Sayısının Değerini Girin: '; cr.
        fsayı at: 1 set: stdin nextLine asFloat.
        Transcript show: '''c'' Sayısının Değerini Girin: '; cr.
        fsayı at: 2 set: stdin nextLine asFloat.
        fsayı at: 3 put: (self formül: fsayı at: 0 b: fsayı at: 1 c: fsayı at: 2).
        
        "Delta Formülü"
        "// formül(a = reel, b = ree, c = ree)"
        Transcript show: 'Program İşleyişini Görmek İster misiniz? (Y yada N): '; cr.
        islem := stdin nextLine asString.
        (islem = 'y' | (islem = 'Y'))
            ifTrue: [
                
                "''Görünür İşlemler''"
                ((self fonksiyon: fsayı at: 3 a: fsayı at: 0 b: fsayı at: 1) = 'pass')
                    ifTrue: [
                        
                        "2 kök içeren sonuçlar buraya yazılır."
                        "Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir."
                        "Sonuç için Gerekli Formül"
                        ""
                        "// fonksiyon(delta = reel, a = reel, b = reel)"
                        "// return str"
                        Transcript show: 'Kök 1: ', ((-(fsayı at: 1) + ((fsayı at: 3) sqrt)) / (2 * (fsayı at: 0)) asString); cr.
                        Transcript show: 'Kök 2: ', ((-(fsayı at: 1) - ((fsayı at: 3) sqrt)) / (2 * (fsayı at: 0)) asString); cr.
                        
                        "Kök formülleri yazıldı."
                        Transcript show: 'Formüller: ', (13 asCharacter), (13 asCharacter), 'Delta Hesabı', (13 asCharacter), 'Delta = ', ((fsayı at: 1) asString), '^2-4*', ((fsayı at: 0) asString), '*', ((fsayı at: 2) asString), (13 asCharacter), (13 asCharacter), '====================', (13 asCharacter), (13 asCharacter), 'X1 İçin:', (13 asCharacter), '(-', ((fsayı at: 1) asString), '+(', ((fsayı at: 3) asString), '^(1/2))) / (2*', ((fsayı at: 0) asString), ')', (13 asCharacter), (13 asCharacter), 'X2 İçin:', (13 asCharacter), '(-', ((fsayı at: 1) asString), '-(', ((fsayı at: 3) asString), '^(1/2))) / (2*', ((fsayı at: 0) asString), ')'; cr.
                    ]
                    ifFalse: [
                        text := (self fonksiyon: fsayı at: 3 a: fsayı at: 0 b: fsayı at: 1).
                        
                        "İkincil bir fonksiyon ata."
                        "İlk işlem sonuç verirse buraya dön."
                        (text = 'Kök Bulunamadı')
                            ifTrue: [
                                Transcript show: text, (13 asCharacter), (13 asCharacter), 'Delta 0''a eşittir. Bu yüzden kök yoktur.'; cr.
                            ]
                            ifFalse: [
                                Transcript show: text, (13 asCharacter), (13 asCharacter), 'Formül = -', ((fsayı at: 1) asString), '/ 2*', ((fsayı at: 0) asString); cr.
                            ].
                    ].
            ]
            ifFalse: [
                
                "''Kapalı İşlemler''"
                ((self fonksiyon: fsayı at: 3 a: fsayı at: 0 b: fsayı at: 1) = 'pass')
                    ifTrue: [
                        Transcript show: 'Kök 1: ', ((-(fsayı at: 1) + ((fsayı at: 3) sqrt)) / (2 * (fsayı at: 0)) asString); cr.
                        Transcript show: 'Kök 2: ', ((-(fsayı at: 1) - ((fsayı at: 3) sqrt)) / (2 * (fsayı at: 0)) asString); cr.
                    ]
                    ifFalse: [
                        Transcript show: (self fonksiyon: fsayı at: 3 a: fsayı at: 0 b: fsayı at: 1); cr.
                    ].
            ].
        
        "Programı Kapat. (return True)"
    ]
]

"Create the program and run main"
| program |
program := Program new.
program main.
