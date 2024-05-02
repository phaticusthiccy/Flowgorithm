Object subclass: Program [
    main [
        | süt  sütkontrol  yumurta  yumurtakontrol  peynir  peynirkontrol |
    
        süt := 10.
        peynir := 10.
        yumurta := 10.
        Transcript show: 'Ürünlerin Stok Durumu', (13 asCharacter), (13 asCharacter), 'Süt :: ', (süt asString), (13 asCharacter), 'Yumurta :: ', (yumurta asString), (13 asCharacter), 'Peynir :: ', (peynir asString); cr.
        [true]
            whileTrue: [
                Transcript show: 'Alacaginiz urunun miktarini giriniz', (13 asCharacter), 'Süt ::'; cr.
                sütkontrol := stdin nextLine asInteger.
                (sütkontrol > süt)
                    ifTrue: [
                        Transcript show: 'Stokta yeterli sut yok'; cr.
                    ]
                    ifFalse: [
                        süt := süt - sütkontrol.
                    ].
                Transcript show: 'Alacaginiz urunun miktarini giriniz', (13 asCharacter), 'Yumurta ::'; cr.
                yumurtakontrol := stdin nextLine asInteger.
                (yumurtakontrol > yumurta)
                    ifTrue: [
                        Transcript show: 'Stokta yeterli yumurta yok'; cr.
                    ]
                    ifFalse: [
                        yumurta := yumurta - yumurtakontrol.
                    ].
                Transcript show: 'Alacaginiz urunun miktarini giriniz', (13 asCharacter), 'Peynir ::'; cr.
                peynirkontrol := stdin nextLine asInteger.
                (peynirkontrol > peynir)
                    ifTrue: [
                        Transcript show: 'Stokta yeterli peynir yok'; cr.
                    ]
                    ifFalse: [
                        peynir := peynir - peynirkontrol.
                    ].
                Transcript show: 'Ürünlerin Güncel Stok Durumu', (13 asCharacter), (13 asCharacter), 'Süt :: ', (süt asString), (13 asCharacter), 'Yumurta :: ', (yumurta asString), (13 asCharacter), 'Peynir :: ', (peynir asString); cr.
            ].
    ]
]

"Create the program and run main"
| program |
program := Program new.
program main.
