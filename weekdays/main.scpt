on run
    local Sync
    
    set Sync to true
    local İndex, İndex2
    
    set İndex to 0
    set İndex2 to 0
    local Günler
    
    set Günler(0) to "Pazartesi"
    set Günler(1) to "Salı"
    set Günler(2) to "Çarşamba"
    set Günler(3) to "Perşembe"
    set Günler(4) to "Cuma"
    set Günler(5) to "Cumartesi"
    set Günler(6) to "Pazar"
    repeat while Sync
        if İndex is equal to 7
        else
            set İndex to İndex + 1
            display dialog "Haftanın " & (İndex as string) & ". Günü: " & Günler(İndex2)
            Delay(1)
            
            -- Çıktı 1 saniye süreyle atılır.
            set İndex2 to İndex2 + 1
        end if
    end repeat
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
