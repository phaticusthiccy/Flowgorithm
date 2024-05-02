on run
    local Süt
    local Sütkontrol
    local Yumurta
    local Yumurtakontrol
    local Peynir
    local Peynirkontrol
    
    set Süt to 10
    set Peynir to 10
    set Yumurta to 10
    display dialog "Ürünlerin Stok Durumu" & (13 ASCII character) & (13 ASCII character) & "Süt :: " & Süt & (13 ASCII character) & "Yumurta :: " & Yumurta & (13 ASCII character) & "Peynir :: " & Peynir
    repeat while true
        display dialog "Alacaginiz urunun miktarini giriniz" & (13 ASCII character) & "Süt ::"
        display dialog "Enter a value for Sütkontrol" default answer "" buttons {"ok"} with title "Enter a value"
        set Sütkontrol to the text returned of the result
        if Sütkontrol is greater than Süt
            display dialog "Stokta yeterli sut yok"
        else
            set Süt to Süt - Sütkontrol
        end if
        display dialog "Alacaginiz urunun miktarini giriniz" & (13 ASCII character) & "Yumurta ::"
        display dialog "Enter a value for Yumurtakontrol" default answer "" buttons {"ok"} with title "Enter a value"
        set Yumurtakontrol to the text returned of the result
        if Yumurtakontrol is greater than Yumurta
            display dialog "Stokta yeterli yumurta yok"
        else
            set Yumurta to Yumurta - Yumurtakontrol
        end if
        display dialog "Alacaginiz urunun miktarini giriniz" & (13 ASCII character) & "Peynir ::"
        display dialog "Enter a value for Peynirkontrol" default answer "" buttons {"ok"} with title "Enter a value"
        set Peynirkontrol to the text returned of the result
        if Peynirkontrol is greater than Peynir
            display dialog "Stokta yeterli peynir yok"
        else
            set Peynir to Peynir - Peynirkontrol
        end if
        display dialog "Ürünlerin Güncel Stok Durumu" & (13 ASCII character) & (13 ASCII character) & "Süt :: " & Süt & (13 ASCII character) & "Yumurta :: " & Yumurta & (13 ASCII character) & "Peynir :: " & Peynir
    end repeat
end run
