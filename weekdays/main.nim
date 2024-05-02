import math
import strutils

# Headers
proc delay(sn: int): bool

proc delay(sn: int): bool =
    var
        sonuc: bool
        ms: int
        n: int
    
    ms = sn * 33333
    n = 0
    while n != ms:
        n = n + 1
    sonuc = true
    
    result = sonuc
    return

# Main
var
    sync: bool
    index, index2: int
    günler: seq[string]

sync = true
index = 0
index2 = 0
günler = newSeq[string](7)

günler[0] = "Pazartesi"
günler[1] = "Salı"
günler[2] = "Çarşamba"
günler[3] = "Perşembe"
günler[4] = "Cuma"
günler[5] = "Cumartesi"
günler[6] = "Pazar"
while sync:
    if index == 7:
    else:
        index = index + 1
        echo "Haftanın ", $index, ". Günü: ", günler[index2]
        delay(1)
        
        # Çıktı 1 saniye süreyle atılır.
        index2 = index2 + 1
