def delay(sn):
    ms = sn * 30000
    n = 0
    while n != ms:
        n = n + 1
    sonuc = True
    
    return sonuc

# Main
sayı = 1
sonuc = 0
print("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ")
giris = int(input())
delay(1)
print("2. Sayıyı Belirleyin: ")
giris2 = int(input())
delay(1)
print("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın.")
debug = input()
if giris > giris2:
    af1 = giris
    af2 = giris2
    giris = af2
    giris2 = af1
else:
    
    # İlk giriş, 2. girişten küçük ise program çalışmaz.
    # 
    # Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
for sayı in range(giris, giris2 + 1, 1):
    if sayı % 2 == 1:
        tempsonuc = sonuc
        sonuc = sonuc + sayı
        if debug == "n" or debug == "N":
            
            # es geç
        else:
            print(str(tempsonuc) + "+" + str(sayı) + ": " + str(sonuc))
print("Sonuc: " + str(sonuc))
