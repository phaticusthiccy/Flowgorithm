Object subclass: Program [
    delay: sn [
        | sonuc  ms  n |
    
        ms := sn * 33333.
        n := 0.
        [n ~= ms]
            whileTrue: [
                n := n + 1.
            ].
        sonuc := true.
        ^ sonuc.
    ]
    
    vki: kilo boy: boy [
        | sonuc  index |
    
        index := kilo / (boy * boy).
        (index < 18)
            ifTrue: [
                sonuc := 'zayıf'.
            ]
            ifFalse: [
                (index < 25)
                    ifTrue: [
                        sonuc := 'normal'.
                    ]
                    ifFalse: [
                        (index < 30)
                            ifTrue: [
                                sonuc := 'kilolu'.
                            ]
                            ifFalse: [
                                (index < 35)
                                    ifTrue: [
                                        sonuc := '1. obez'.
                                    ]
                                    ifFalse: [
                                        (index < 40)
                                            ifTrue: [
                                                sonuc := '2. obez'.
                                            ]
                                            ifFalse: [
                                                sonuc := '3. obez'.
                                            ].
                                    ].
                            ].
                    ].
            ].
        ^ sonuc.
    ]
    
    main [
        | kilo  boy  tab  cümle |
    
        Transcript show: 'Lütfen Kilonuzu Giriniz:   (Ex: 69)  '; cr.
        kilo := stdin nextLine asInteger.
        self delay: 1.
        Transcript show: 'Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  '; cr.
        boy := stdin nextLine asFloat.
        cümle := 'VKI Tablosunda '.
        ((self vki: kilo boy: boy) = 'zayıf')
            ifTrue: [
                tab := cümle, '''Zayıf'' Bölümündesin'.
            ]
            ifFalse: [
                ((self vki: kilo boy: boy) = 'normal')
                    ifTrue: [
                        tab := cümle, '''Normal'' Bölümdesin'.
                    ]
                    ifFalse: [
                        ((self vki: kilo boy: boy) = 'kilolu')
                            ifTrue: [
                                tab := cümle, '''Fazla Kilolu'' Bölümdesin'.
                            ]
                            ifFalse: [
                                ((self vki: kilo boy: boy) = '1. obez')
                                    ifTrue: [
                                        tab := cümle, '''1. Obez'' Bölümündesin'.
                                    ]
                                    ifFalse: [
                                        ((self vki: kilo boy: boy) = '2. obez')
                                            ifTrue: [
                                                tab := cümle, '''2. Obez'' Bölümündesin'.
                                            ]
                                            ifFalse: [
                                                ((self vki: kilo boy: boy) = '3. obez')
                                                    ifTrue: [
                                                        tab := cümle, '''3. Obez'' Bölümündesin'.
                                                    ].
                                            ].
                                    ].
                            ].
                    ].
            ].
        Transcript show: tab; cr.
    ]
]

"Create the program and run main"
| program |
program := Program new.
program main.
