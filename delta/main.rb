include Math

def fonksiyon(deger, a, b)
    if deger < 0
        sonuc = "Kök Bulunamadı"
    else
        if deger == 0
            sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " + (-b / 2 * a).to_s
        else
            sonuc = "pass"
        end
    end
    
    return sonuc
end

def formül(a, b, c)
    sonuc = b * b - 4 * a * c
    
    return sonuc
end

# Main
fsayı = Array.new(7)

# Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
# // var fsayı = new Array()
puts "'a' Sayısının Değerini Girin: "
fsayı[0] = gets.chomp.to_f
puts "'b' Sayısının Değerini Girin: "
fsayı[1] = gets.chomp.to_f
puts "'c' Sayısının Değerini Girin: "
fsayı[2] = gets.chomp.to_f
fsayı[3] = formül(fsayı[0], fsayı[1], fsayı[2])

# Delta Formülü
# // formül(a = reel, b = ree, c = ree)
puts "Program İşleyişini Görmek İster misiniz? (Y yada N): "
islem = gets.chomp
if islem == "y" || islem == "Y"
    
    # "Görünür İşlemler"
    if fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass"
        
        # 2 kök içeren sonuçlar buraya yazılır.
        # Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
        # Sonuç için Gerekli Formül
        # 
        # // fonksiyon(delta = reel, a = reel, b = reel)
        # // return str
        puts "Kök 1: " + (-fsayı[1] + Math.sqrt(fsayı[3])) / (2 * fsayı[0]).to_s
        puts "Kök 2: " + (-fsayı[1] - Math.sqrt(fsayı[3])) / (2 * fsayı[0]).to_s
        
        # Kök formülleri yazıldı.
        puts "Formüller: " + 13.chr + 13.chr + "Delta Hesabı" + 13.chr + "Delta = " + fsayı[1].to_s + "^2-4*" + fsayı[0].to_s + "*" + fsayı[2].to_s + 13.chr + 13.chr + "====================" + 13.chr + 13.chr + "X1 İçin:" + 13.chr + "(-" + fsayı[1].to_s + "+(" + fsayı[3].to_s + "^(1/2))) / (2*" + fsayı[0].to_s + ")" + 13.chr + 13.chr + "X2 İçin:" + 13.chr + "(-" + fsayı[1].to_s + "-(" + fsayı[3].to_s + "^(1/2))) / (2*" + fsayı[0].to_s + ")"
    else
        text = fonksiyon(fsayı[3], fsayı[0], fsayı[1])
        
        # İkincil bir fonksiyon ata.
        # İlk işlem sonuç verirse buraya dön.
        if text == "Kök Bulunamadı"
            puts text + 13.chr + 13.chr + "Delta 0'a eşittir. Bu yüzden kök yoktur."
        else
            puts text + 13.chr + 13.chr + "Formül = -" + fsayı[1].to_s + "/ 2*" + fsayı[0].to_s
        end
    end
else
    
    # "Kapalı İşlemler"
    if fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass"
        puts "Kök 1: " + (-fsayı[1] + Math.sqrt(fsayı[3])) / (2 * fsayı[0]).to_s
        puts "Kök 2: " + (-fsayı[1] - Math.sqrt(fsayı[3])) / (2 * fsayı[0]).to_s
    else
        puts fonksiyon(fsayı[3], fsayı[0], fsayı[1])
    end
end

# Programı Kapat. (return True)
