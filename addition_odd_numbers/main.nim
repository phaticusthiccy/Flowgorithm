import math
import strutils

# Headers
proc delay(sn: int): bool

proc delay(sn: int): bool =
    var
        sonuc: bool
        ms: int
        n: int
    
    ms = sn * 30000
    n = 0
    while n != ms:
        n = n + 1
    sonuc = true
    
    result = sonuc
    return

# Main
var
    sayı, sonuc, giris, giris2, tempsonuc: int
    debug: string
    af1: int
    af2: int

sayı = 1
sonuc = 0
echo "2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: "
giris = parseInt(readLine(stdin))
delay(1)
echo "2. Sayıyı Belirleyin: "
giris2 = parseInt(readLine(stdin))
delay(1)
echo "Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın."
debug = readLine(stdin)
if giris > giris2:
    af1 = giris
    af2 = giris2
    giris = af2
    giris2 = af1
else:
    
    # İlk giriş, 2. girişten küçük ise program çalışmaz.
    # 
    # Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
for sayı in countup(giris, giris2):
    if sayı mod 2 == 1:
        tempsonuc = sonuc
        sonuc = sonuc + sayı
        if debug == "n" or debug == "N":
            
            # es geç
        else:
            echo $tempsonuc, "+", $sayı, ": ", $sonuc
echo "Sonuc: ", sonuc
