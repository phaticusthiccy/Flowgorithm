on run
    local Sayı, Sonuc, Giris, Giris2, Tempsonuc
    local Debug
    
    set Sayı to 1
    set Sonuc to 0
    display dialog "2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: "
    display dialog "Enter a value for Giris" default answer "" buttons {"ok"} with title "Enter a value"
    set Giris to the text returned of the result
    Delay(1)
    display dialog "2. Sayıyı Belirleyin: "
    display dialog "Enter a value for Giris2" default answer "" buttons {"ok"} with title "Enter a value"
    set Giris2 to the text returned of the result
    Delay(1)
    display dialog "Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın."
    display dialog "Enter a value for Debug" default answer "" buttons {"ok"} with title "Enter a value"
    set Debug to the text returned of the result
    if Giris is greater than Giris2
        local Af1
        local Af2
        
        set Af1 to Giris
        set Af2 to Giris2
        set Giris to Af2
        set Giris2 to Af1
    else
        
        -- İlk giriş, 2. girişten küçük ise program çalışmaz.
        -- 
        -- Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
    end if
    repeat with Sayı from Giris to Giris2
        if Sayı mod 2 is equal to 1
            set Tempsonuc to Sonuc
            set Sonuc to Sonuc + Sayı
            if Debug is equal to "n" or Debug is equal to "N"
                
                -- es geç
            else
                display dialog (Tempsonuc as string) & "+" & (Sayı as string) & ": " & (Sonuc as string)
            end if
        end if
    end repeat
    display dialog "Sonuc: " & Sonuc
end run

to Delay(Sn)
    local Sonuc
    local Ms
    
    set Ms to Sn * 30000
    local n
    
    set n to 0
    repeat while n isn't equal to Ms
        set n to n + 1
    end repeat
    set Sonuc to true
    
    return Sonuc
end Delay
