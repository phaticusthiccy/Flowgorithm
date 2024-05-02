import math
import strutils

# Headers
proc fonksiyon(deger: float; a: float; b: float): string
proc formül(a: int; b: int; c: int): float

proc fonksiyon(deger: float; a: float; b: float): string =
    var
        sonuc: string
    
    if deger < 0:
        sonuc = "Kök Bulunamadı"
    else:
        if deger == 0:
            sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " & $(-b / 2 * a)
        else:
            sonuc = "pass"
    
    result = sonuc
    return

proc formül(a: int; b: int; c: int): float =
    var
        sonuc: float
    
    sonuc = b * b - 4 * a * c
    
    result = sonuc
    return

# Main
var
    fsayı: seq[float]
    islem: string
    text: string
fsayı = newSeq[float](7)

# Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
# // var fsayı = new Array()
echo "'a' Sayısının Değerini Girin: "
fsayı[0] = parseFloat(readLine(stdin))
echo "'b' Sayısının Değerini Girin: "
fsayı[1] = parseFloat(readLine(stdin))
echo "'c' Sayısının Değerini Girin: "
fsayı[2] = parseFloat(readLine(stdin))
fsayı[3] = formül(fsayı[0], fsayı[1], fsayı[2])

# Delta Formülü
# // formül(a = reel, b = ree, c = ree)
echo "Program İşleyişini Görmek İster misiniz? (Y yada N): "
islem = readLine(stdin)
if islem == "y" or islem == "Y":
    
    # "Görünür İşlemler"
    if fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass":
        
        # 2 kök içeren sonuçlar buraya yazılır.
        # Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
        # Sonuç için Gerekli Formül
        # 
        # // fonksiyon(delta = reel, a = reel, b = reel)
        # // return str
        echo "Kök 1: ", (-fsayı[1] + sqrt(fsayı[3])) / (2 * fsayı[0])
        echo "Kök 2: ", (-fsayı[1] - sqrt(fsayı[3])) / (2 * fsayı[0])
        
        # Kök formülleri yazıldı.
        echo "Formüller: ", char(13), char(13), "Delta Hesabı", char(13), "Delta = ", $fsayı[1], "^2-4*", $fsayı[0], "*", $fsayı[2], char(13), char(13), "====================", char(13), char(13), "X1 İçin:", char(13), "(-", $fsayı[1], "+(", $fsayı[3], "^(1/2))) / (2*", $fsayı[0], ")", char(13), char(13), "X2 İçin:", char(13), "(-", $fsayı[1], "-(", $fsayı[3], "^(1/2))) / (2*", $fsayı[0], ")"
    else:
        text = fonksiyon(fsayı[3], fsayı[0], fsayı[1])
        
        # İkincil bir fonksiyon ata.
        # İlk işlem sonuç verirse buraya dön.
        if text == "Kök Bulunamadı":
            echo text, char(13), char(13), "Delta 0'a eşittir. Bu yüzden kök yoktur."
        else:
            echo text, char(13), char(13), "Formül = -", $fsayı[1], "/ 2*", $fsayı[0]
else:
    
    # "Kapalı İşlemler"
    if fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass":
        echo "Kök 1: ", (-fsayı[1] + sqrt(fsayı[3])) / (2 * fsayı[0])
        echo "Kök 2: ", (-fsayı[1] - sqrt(fsayı[3])) / (2 * fsayı[0])
    else:
        echo fonksiyon(fsayı[3], fsayı[0], fsayı[1])

# Programı Kapat. (return True)
