def delay(sn):
    ms = sn * 33333
    n = 0
    while n != ms:
        n = n + 1
    sonuc = True
    
    return sonuc

def vki(kilo, boy):
    index = float(kilo) / (boy * boy)
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
    
    return sonuc

# Main
print("Lütfen Kilonuzu Giriniz:   (Ex: 69)  ")
kilo = int(input())
delay(1)
print("Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ")
boy = float(input())
cümle = "VKI Tablosunda "
if vki(kilo, boy) == "zayıf":
    tab = cümle + "'Zayıf' Bölümündesin"
else:
    if vki(kilo, boy) == "normal":
        tab = cümle + "'Normal' Bölümdesin"
    else:
        if vki(kilo, boy) == "kilolu":
            tab = cümle + "'Fazla Kilolu' Bölümdesin"
        else:
            if vki(kilo, boy) == "1. obez":
                tab = cümle + "'1. Obez' Bölümündesin"
            else:
                if vki(kilo, boy) == "2. obez":
                    tab = cümle + "'2. Obez' Bölümündesin"
                else:
                    if vki(kilo, boy) == "3. obez":
                        tab = cümle + "'3. Obez' Bölümündesin"
print(tab)
