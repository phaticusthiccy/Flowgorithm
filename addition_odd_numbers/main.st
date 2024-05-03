Object subclass: Program [
    delay: sn [
        | sonuc  ms  n |
    
        ms := sn * 30000.
        n := 0.
        [n ~= ms]
            whileTrue: [
                n := n + 1.
            ].
        sonuc := true.
        ^ sonuc.
    ]
    
    main [
        | sayı  sonuc  giris  giris2  tempsonuc  debug  af1  af2 |
    
        sayı := 1.
        sonuc := 0.
        Transcript show: '2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: '; cr.
        giris := stdin nextLine asInteger.
        self delay: 1.
        Transcript show: '2. Sayıyı Belirleyin: '; cr.
        giris2 := stdin nextLine asInteger.
        self delay: 1.
        Transcript show: 'Programın İşleyişini Görmek İçin ''Y'', Direk Sonucu Görmek İçin ''N'' yazın.'; cr.
        debug := stdin nextLine asString.
        (giris > giris2)
            ifTrue: [
                af1 := giris.
                af2 := giris2.
                giris := af2.
                giris2 := af1.
            ]
            ifFalse: [
                
                "İlk giriş, 2. girişten küçük ise program çalışmaz."
                ""
                "Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir."
            ].
        giris to: giris2
            do: [ :sayı |
                (sayı \\ 2 = 1)
                    ifTrue: [
                        tempsonuc := sonuc.
                        sonuc := sonuc + sayı.
                        (debug = 'n' | (debug = 'N'))
                            ifTrue: [
                                
                                "es geç"
                            ]
                            ifFalse: [
                                Transcript show: tempsonuc asString, '+', (sayı asString), ': ', (sonuc asString); cr.
                            ].
                    ].
            ].
        Transcript show: 'Sonuc: ', (sonuc asString); cr.
    ]
]

"Create the program and run main"
| program |
program := Program new.
program main.
