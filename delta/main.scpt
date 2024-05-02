on run
    local Fsayı
    
    -- Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
    -- // var fsayı = new Array()
    local İslem
    
    display dialog "'a' Sayısının Değerini Girin: "
    display dialog "Enter a value for Fsayı(0)" default answer "" buttons {"ok"} with title "Enter a value"
    set Fsayı(0) to the text returned of the result
    display dialog "'b' Sayısının Değerini Girin: "
    display dialog "Enter a value for Fsayı(1)" default answer "" buttons {"ok"} with title "Enter a value"
    set Fsayı(1) to the text returned of the result
    display dialog "'c' Sayısının Değerini Girin: "
    display dialog "Enter a value for Fsayı(2)" default answer "" buttons {"ok"} with title "Enter a value"
    set Fsayı(2) to the text returned of the result
    set Fsayı(3) to Formül(Fsayı(0), Fsayı(1), Fsayı(2))
    
    -- Delta Formülü
    -- // formül(a = reel, b = ree, c = ree)
    display dialog "Program İşleyişini Görmek İster misiniz? (Y yada N): "
    display dialog "Enter a value for İslem" default answer "" buttons {"ok"} with title "Enter a value"
    set İslem to the text returned of the result
    if İslem is equal to "y" or İslem is equal to "Y"
        
        -- "Görünür İşlemler"
        if Fonksiyon(Fsayı(3), Fsayı(0), Fsayı(1)) is equal to "pass"
            
            -- 2 kök içeren sonuçlar buraya yazılır.
            -- Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
            -- Sonuç için Gerekli Formül
            -- 
            -- // fonksiyon(delta = reel, a = reel, b = reel)
            -- // return str
            display dialog "Kök 1: " & (-Fsayı(1) + sqrt(Fsayı(3))) / (2 * Fsayı(0))
            display dialog "Kök 2: " & (-Fsayı(1) - sqrt(Fsayı(3))) / (2 * Fsayı(0))
            
            -- Kök formülleri yazıldı.
            display dialog "Formüller: " & (13 ASCII character) & (13 ASCII character) & "Delta Hesabı" & (13 ASCII character) & "Delta = " & (Fsayı(1) as string) & "^2-4*" & (Fsayı(0) as string) & "*" & (Fsayı(2) as string) & (13 ASCII character) & (13 ASCII character) & "====================" & (13 ASCII character) & (13 ASCII character) & "X1 İçin:" & (13 ASCII character) & "(-" & (Fsayı(1) as string) & "+(" & (Fsayı(3) as string) & "^(1/2))) / (2*" & (Fsayı(0) as string) & ")" & (13 ASCII character) & (13 ASCII character) & "X2 İçin:" & (13 ASCII character) & "(-" & (Fsayı(1) as string) & "-(" & (Fsayı(3) as string) & "^(1/2))) / (2*" & (Fsayı(0) as string) & ")"
        else
            local Text
            
            set Text to Fonksiyon(Fsayı(3), Fsayı(0), Fsayı(1))
            
            -- İkincil bir fonksiyon ata.
            -- İlk işlem sonuç verirse buraya dön.
            if Text is equal to "Kök Bulunamadı"
                display dialog Text & (13 ASCII character) & (13 ASCII character) & "Delta 0'a eşittir. Bu yüzden kök yoktur."
            else
                display dialog Text & (13 ASCII character) & (13 ASCII character) & "Formül = -" & (Fsayı(1) as string) & "/ 2*" & (Fsayı(0) as string)
            end if
        end if
    else
        
        -- "Kapalı İşlemler"
        if Fonksiyon(Fsayı(3), Fsayı(0), Fsayı(1)) is equal to "pass"
            display dialog "Kök 1: " & (-Fsayı(1) + sqrt(Fsayı(3))) / (2 * Fsayı(0))
            display dialog "Kök 2: " & (-Fsayı(1) - sqrt(Fsayı(3))) / (2 * Fsayı(0))
        else
            display dialog Fonksiyon(Fsayı(3), Fsayı(0), Fsayı(1))
        end if
    end if
    
    -- Programı Kapat. (return True)
end run

to Fonksiyon(Deger, a, b)
    local Sonuc
    
    if Deger is less than 0
        set Sonuc to "Kök Bulunamadı"
    else
        if Deger is equal to 0
            set Sonuc to "1. ve 2. Kökler Eşittir. Sonuç: " & (-b / 2 * a as string)
        else
            set Sonuc to "pass"
        end if
    end if
    
    return Sonuc
end Fonksiyon

to Formül(a, b, c)
    local Sonuc
    
    set Sonuc to b * b - 4 * a * c
    
    return Sonuc
end Formül

to sqrt(value)
    return value ^ (1 / 2)
end tan
