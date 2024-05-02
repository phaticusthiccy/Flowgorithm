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

function vki(kilo, boy)
    local sonuc
    local var_index
    
    var_index = kilo / (boy * boy)
    if var_index < 18 then
        sonuc = "zayıf"
    else
        if var_index < 25 then
            sonuc = "normal"
        else
            if var_index < 30 then
                sonuc = "kilolu"
            else
                if var_index < 35 then
                    sonuc = "1. obez"
                else
                    if var_index < 40 then
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

-- Main
local kilo
local boy

io.write("Lütfen Kilonuzu Giriniz:   (Ex: 69)  ", "\n")
kilo = tonumber(io.read())
delay (1)
io.write("Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ", "\n")
boy = tonumber(io.read())
local tab
local cümle

cümle = "VKI Tablosunda "
if vki(kilo, boy) == "zayıf" then
    tab = cümle .. "'Zayıf' Bölümündesin"
else
    if vki(kilo, boy) == "normal" then
        tab = cümle .. "'Normal' Bölümdesin"
    else
        if vki(kilo, boy) == "kilolu" then
            tab = cümle .. "'Fazla Kilolu' Bölümdesin"
        else
            if vki(kilo, boy) == "1. obez" then
                tab = cümle .. "'1. Obez' Bölümündesin"
            else
                if vki(kilo, boy) == "2. obez" then
                    tab = cümle .. "'2. Obez' Bölümündesin"
                else
                    if vki(kilo, boy) == "3. obez" then
                        tab = cümle .. "'3. Obez' Bölümündesin"
                    end
                end
            end
        end
    end
end
io.write(tab, "\n")
