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

def vki(kilo, boy)
    index = kilo / (boy * boy)
    if index < 18
        sonuc = "zayıf"
    else
        if index < 25
            sonuc = "normal"
        else
            if index < 30
                sonuc = "kilolu"
            else
                if index < 35
                    sonuc = "1. obez"
                else
                    if index < 40
                        sonuc = "2. obez"
                    else
                        sonuc = "3. obez"
                    end
                end
            end
        end
    end
    
    return sonuc
end

# Main
puts "Lütfen Kilonuzu Giriniz:   (Ex: 69)  "
kilo = gets.chomp.to_i
delay(1)
puts "Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  "
boy = gets.chomp.to_f
cümle = "VKI Tablosunda "
if vki(kilo, boy) == "zayıf"
    tab = cümle + "'Zayıf' Bölümündesin"
else
    if vki(kilo, boy) == "normal"
        tab = cümle + "'Normal' Bölümdesin"
    else
        if vki(kilo, boy) == "kilolu"
            tab = cümle + "'Fazla Kilolu' Bölümdesin"
        else
            if vki(kilo, boy) == "1. obez"
                tab = cümle + "'1. Obez' Bölümündesin"
            else
                if vki(kilo, boy) == "2. obez"
                    tab = cümle + "'2. Obez' Bölümündesin"
                else
                    if vki(kilo, boy) == "3. obez"
                        tab = cümle + "'3. Obez' Bölümündesin"
                    end
                end
            end
        end
    end
end
puts tab
