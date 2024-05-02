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
    
        ms := sn * 33333.
        n := 0.
        [n ~= ms]
            whileTrue: [
                n := n + 1.
            ].
        sonuc := true.
        ^ sonuc.
    ]
    
    main [
        | sync  index  index2  günler |
    
        sync := true.
        index := 0.
        index2 := 0.
        günler := ArrayZ new count: 7.
        
        günler at: 0 put: 'Pazartesi'.
        günler at: 1 put: 'Salı'.
        günler at: 2 put: 'Çarşamba'.
        günler at: 3 put: 'Perşembe'.
        günler at: 4 put: 'Cuma'.
        günler at: 5 put: 'Cumartesi'.
        günler at: 6 put: 'Pazar'.
        [sync]
            whileTrue: [
                (index = 7)
                    ifTrue: [
                    ]
                    ifFalse: [
                        index := index + 1.
                        Transcript show: 'Haftanın ', (index asString), '. Günü: ', (günler at: index2); cr.
                        self delay: 1.
                        
                        "Çıktı 1 saniye süreyle atılır."
                        index2 := index2 + 1.
                    ].
            ].
    ]
]

"Create the program and run main"
| program |
program := Program new.
program main.
