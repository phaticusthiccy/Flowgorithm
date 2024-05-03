include Math

def delay(sn)
    ms = sn * 30000
    n = 0
    while n != ms
        n = n + 1
    end
    sonuc = true
    
    return sonuc
end

# Main
sayı = 1
sonuc = 0
puts "2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: "
giris = gets.chomp.to_i
delay(1)
puts "2. Sayıyı Belirleyin: "
giris2 = gets.chomp.to_i
delay(1)
puts "Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın."
debug = gets.chomp
if giris > giris2
    af1 = giris
    af2 = giris2
    giris = af2
    giris2 = af1
else
    
    # İlk giriş, 2. girişten küçük ise program çalışmaz.
    # 
    # Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
end
for sayı in (giris .. giris2)
    if sayı % 2 == 1
        tempsonuc = sonuc
        sonuc = sonuc + sayı
        if debug == "n" || debug == "N"
            
            # es geç
        else
            puts tempsonuc.to_s + "+" + sayı.to_s + ": " + sonuc.to_s
        end
    end
end
puts "Sonuc: " + sonuc.to_s
