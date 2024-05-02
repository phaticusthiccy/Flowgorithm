def fonksiyon(deger, a, b):
    if deger < 0:
        sonuc = "Kök Bulunamadı"
    else:
        if deger == 0:
            sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " + str(-b / 2 * a)
        else:
            sonuc = "pass"
    
    return sonuc

def formül(a, b, c):
    sonuc = b * b - 4 * a * c
    
    return sonuc

# Main
fsayı = [0] * (7)

# Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
# // var fsayı = new Array()
print("'a' Sayısının Değerini Girin: ")
fsayı[0] = float(input())
print("'b' Sayısının Değerini Girin: ")
fsayı[1] = float(input())
print("'c' Sayısının Değerini Girin: ")
fsayı[2] = float(input())
fsayı[3] = formül(fsayı[0], fsayı[1], fsayı[2])

# Delta Formülü
# // formül(a = reel, b = ree, c = ree)
print("Program İşleyişini Görmek İster misiniz? (Y yada N): ")
islem = input()
if islem == "y" or islem == "Y":
    
    # "Görünür İşlemler"
    if fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass":
        
        # 2 kök içeren sonuçlar buraya yazılır.
        # Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
        # Sonuç için Gerekli Formül
        # 
        # // fonksiyon(delta = reel, a = reel, b = reel)
        # // return str
        print("Kök 1: " + str((-fsayı[1] + sqrt(fsayı[3])) / (2 * fsayı[0])))
        print("Kök 2: " + str((-fsayı[1] - sqrt(fsayı[3])) / (2 * fsayı[0])))
        
        # Kök formülleri yazıldı.
        print("Formüller: " + chr(13) + chr(13) + "Delta Hesabı" + chr(13) + "Delta = " + str(fsayı[1]) + "^2-4*" + str(fsayı[0]) + "*" + str(fsayı[2]) + chr(13) + chr(13) + "====================" + chr(13) + chr(13) + "X1 İçin:" + chr(13) + "(-" + str(fsayı[1]) + "+(" + str(fsayı[3]) + "^(1/2))) / (2*" + str(fsayı[0]) + ")" + chr(13) + chr(13) + "X2 İçin:" + chr(13) + "(-" + str(fsayı[1]) + "-(" + str(fsayı[3]) + "^(1/2))) / (2*" + str(fsayı[0]) + ")")
    else:
        text = fonksiyon(fsayı[3], fsayı[0], fsayı[1])
        
        # İkincil bir fonksiyon ata.
        # İlk işlem sonuç verirse buraya dön.
        if text == "Kök Bulunamadı":
            print(text + chr(13) + chr(13) + "Delta 0'a eşittir. Bu yüzden kök yoktur.")
        else:
            print(text + chr(13) + chr(13) + "Formül = -" + str(fsayı[1]) + "/ 2*" + str(fsayı[0]))
else:
    
    # "Kapalı İşlemler"
    if fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass":
        print("Kök 1: " + str((-fsayı[1] + sqrt(fsayı[3])) / (2 * fsayı[0])))
        print("Kök 2: " + str((-fsayı[1] - sqrt(fsayı[3])) / (2 * fsayı[0])))
    else:
        print(fonksiyon(fsayı[3], fsayı[0], fsayı[1]))

# Programı Kapat. (return True)
