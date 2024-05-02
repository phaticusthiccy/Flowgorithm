include Math

def delay(sn)
    ms = sn * 33333
    n = 0
    while n != ms
        n = n + 1
    end
    sonuc = true
    
    return sonuc
end

# Main
sync = true
index = 0
index2 = 0
günler = Array.new(7)

günler[0] = "Pazartesi"
günler[1] = "Salı"
günler[2] = "Çarşamba"
günler[3] = "Perşembe"
günler[4] = "Cuma"
günler[5] = "Cumartesi"
günler[6] = "Pazar"
while sync
    if index == 7
    else
        index = index + 1
        puts "Haftanın " + index.to_s + ". Günü: " + günler[index2]
        delay(1)
        
        # Çıktı 1 saniye süreyle atılır.
        index2 = index2 + 1
    end
end
