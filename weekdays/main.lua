function delay(sn)
    local sonuc
    local ms
    
    ms = sn * 33333
    local n
    
    n = 0
    while n ~= ms do
        n = n + 1
    end
    sonuc = true
    
    return sonuc
end

-- Main
local sync

sync = true
local var_index, index2

var_index = 0
index2 = 0
local günler = {}

günler[0] = "Pazartesi"
günler[1] = "Salı"
günler[2] = "Çarşamba"
günler[3] = "Perşembe"
günler[4] = "Cuma"
günler[5] = "Cumartesi"
günler[6] = "Pazar"
while sync do
    if var_index == 7 then
    else
        var_index = var_index + 1
        io.write("Haftanın ", tostring(var_index), ". Günü: ", günler[index2], "\n")
        delay (1)
        
        -- Çıktı 1 saniye süreyle atılır.
        index2 = index2 + 1
    end
end
