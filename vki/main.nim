import math
import strutils

# Headers
proc delay(sn: int): bool
proc vki(kilo: int; boy: int): string

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

proc vki(kilo: int; boy: int): string =
    var
        sonuc: string
        index: int
    
    index = kilo / (boy * boy)
    if index < 18:
        sonuc = "zayıf"
    else:
        if index < 25:
            sonuc = "normal"
        else:
            if index < 30:
                sonuc = "kilolu"
            else:
                if index < 35:
                    sonuc = "1. obez"
                else:
                    if index < 40:
                        sonuc = "2. obez"
                    else:
                        sonuc = "3. obez"
    
    result = sonuc
    return

# Main
var
    kilo: int
    boy: float
    tab: string
    cümle: string

echo "Lütfen Kilonuzu Giriniz:   (Ex: 69)  "
kilo = parseInt(readLine(stdin))
delay(1)
echo "Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  "
boy = parseFloat(readLine(stdin))
cümle = "VKI Tablosunda "
if vki(kilo, boy) == "zayıf":
    tab = cümle & "'Zayıf' Bölümündesin"
else:
    if vki(kilo, boy) == "normal":
        tab = cümle & "'Normal' Bölümdesin"
    else:
        if vki(kilo, boy) == "kilolu":
            tab = cümle & "'Fazla Kilolu' Bölümdesin"
        else:
            if vki(kilo, boy) == "1. obez":
                tab = cümle & "'1. Obez' Bölümündesin"
            else:
                if vki(kilo, boy) == "2. obez":
                    tab = cümle & "'2. Obez' Bölümündesin"
                else:
                    if vki(kilo, boy) == "3. obez":
                        tab = cümle & "'3. Obez' Bölümündesin"
echo tab
