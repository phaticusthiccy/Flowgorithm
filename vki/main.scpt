on run
    local Kilo
    local Boy
    
    display dialog "Lütfen Kilonuzu Giriniz:   (Ex: 69)  "
    display dialog "Enter a value for Kilo" default answer "" buttons {"ok"} with title "Enter a value"
    set Kilo to the text returned of the result
    Delay(1)
    display dialog "Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  "
    display dialog "Enter a value for Boy" default answer "" buttons {"ok"} with title "Enter a value"
    set Boy to the text returned of the result
    local Tab
    local Cümle
    
    set Cümle to "VKI Tablosunda "
    if Vki(Kilo, Boy) is equal to "zayıf"
        set Tab to Cümle & "'Zayıf' Bölümündesin"
    else
        if Vki(Kilo, Boy) is equal to "normal"
            set Tab to Cümle & "'Normal' Bölümdesin"
        else
            if Vki(Kilo, Boy) is equal to "kilolu"
                set Tab to Cümle & "'Fazla Kilolu' Bölümdesin"
            else
                if Vki(Kilo, Boy) is equal to "1. obez"
                    set Tab to Cümle & "'1. Obez' Bölümündesin"
                else
                    if Vki(Kilo, Boy) is equal to "2. obez"
                        set Tab to Cümle & "'2. Obez' Bölümündesin"
                    else
                        if Vki(Kilo, Boy) is equal to "3. obez"
                            set Tab to Cümle & "'3. Obez' Bölümündesin"
                        end if
                    end if
                end if
            end if
        end if
    end if
    display dialog Tab
end run

to Delay(Sn)
    local Sonuc
    local Ms
    
    set Ms to Sn * 33333
    local n
    
    set n to 0
    repeat while n isn't equal to Ms
        set n to n + 1
    end repeat
    set Sonuc to true
    
    return Sonuc
end Delay

to Vki(Kilo, Boy)
    local Sonuc
    local İndex
    
    set İndex to Kilo / (Boy * Boy)
    if İndex is less than 18
        set Sonuc to "zayıf"
    else
        if İndex is less than 25
            set Sonuc to "normal"
        else
            if İndex is less than 30
                set Sonuc to "kilolu"
            else
                if İndex is less than 35
                    set Sonuc to "1. obez"
                else
                    if İndex is less than 40
                        set Sonuc to "2. obez"
                    else
                        set Sonuc to "3. obez"
                    end if
                end if
            end if
        end if
    end if
    
    return Sonuc
end Vki
