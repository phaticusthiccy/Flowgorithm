function delay(sn)
    local sonuc
    local ms
    
    ms = sn * 30000
    local n
    
    n = 0
    while n ~= ms do
        n = n + 1
    end
    sonuc = true
    
    return sonuc
end

-- Main
local sayı, sonuc, giris, giris2, tempsonuc
local debug

sayı = 1
sonuc = 0
io.write("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ", "\n")
giris = tonumber(io.read())
delay (1)
io.write("2. Sayıyı Belirleyin: ", "\n")
giris2 = tonumber(io.read())
delay (1)
io.write("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın.", "\n")
debug = io.read()
if giris > giris2 then
    local af1
    local af2
    
    af1 = giris
    af2 = giris2
    giris = af2
    giris2 = af1
else
    
    -- İlk giriş, 2. girişten küçük ise program çalışmaz.
    -- 
    -- Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
end
for sayı = giris, giris2 do
    if (math.fmod(sayı, 2)) == 1 then
        tempsonuc = sonuc
        sonuc = sonuc + sayı
        if debug == "n" or debug == "N" then
            
            -- es geç
        else
            io.write(tostring(tempsonuc), "+", tostring(sayı), ": ", tostring(sonuc), "\n")
        end
    end
end
io.write("Sonuc: ", sonuc, "\n")
