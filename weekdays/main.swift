import Foundation

func delay(sn: Int) -> Boolean {
    var sonuc : Boolean
    var ms : Int
    
    ms = sn * 33333
    var n : Int
    
    n = 0
    while n != ms {
        n = n + 1
    }
    sonuc = true
    
    return sonuc
}

// Main
var sync : Boolean

sync = true
var index : Int, index2 : Int

index = 0
index2 = 0
var günler = [String](repeating: "", count: 7)

günler[0] = "Pazartesi"
günler[1] = "Salı"
günler[2] = "Çarşamba"
günler[3] = "Perşembe"
günler[4] = "Cuma"
günler[5] = "Cumartesi"
günler[6] = "Pazar"
while sync {
    if index == 7 {
    } else {
        index = index + 1
        print("Haftanın " + String(index) + ". Günü: " + günler[index2])
        delay(sn: 1)
        
        // Çıktı 1 saniye süreyle atılır.
        index2 = index2 + 1
    }
}
