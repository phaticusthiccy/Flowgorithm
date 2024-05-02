function fonksiyon(deger, a, b)
    local sonuc
    
    if deger < 0 then
        sonuc = "Kök Bulunamadı"
    else
        if deger == 0 then
            sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " .. tostring(-b / 2 * a)
        else
            sonuc = "pass"
        end
    end
    
    return sonuc
end

function formül(a, b, c)
    local sonuc
    
    sonuc = b * b - 4 * a * c
    
    return sonuc
end

-- Main
local fsayı = {}

-- Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
-- // var fsayı = new Array()
local islem

io.write("'a' Sayısının Değerini Girin: ", "\n")
fsayı[0] = tonumber(io.read())
io.write("'b' Sayısının Değerini Girin: ", "\n")
fsayı[1] = tonumber(io.read())
io.write("'c' Sayısının Değerini Girin: ", "\n")
fsayı[2] = tonumber(io.read())
fsayı[3] = formül(fsayı[0], fsayı[1], fsayı[2])

-- Delta Formülü
-- // formül(a = reel, b = ree, c = ree)
io.write("Program İşleyişini Görmek İster misiniz? (Y yada N): ", "\n")
islem = io.read()
if islem == "y" or islem == "Y" then
    
    -- "Görünür İşlemler"
    if fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass" then
        
        -- 2 kök içeren sonuçlar buraya yazılır.
        -- Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
        -- Sonuç için Gerekli Formül
        -- 
        -- // fonksiyon(delta = reel, a = reel, b = reel)
        -- // return str
        io.write("Kök 1: ", (-fsayı[1] + math.sqrt(fsayı[3])) / (2 * fsayı[0]), "\n")
        io.write("Kök 2: ", (-fsayı[1] - math.sqrt(fsayı[3])) / (2 * fsayı[0]), "\n")
        
        -- Kök formülleri yazıldı.
        io.write("Formüller: ", string.char(13), string.char(13), "Delta Hesabı", string.char(13), "Delta = ", tostring(fsayı[1]), "^2-4*", tostring(fsayı[0]), "*", tostring(fsayı[2]), string.char(13), string.char(13), "====================", string.char(13), string.char(13), "X1 İçin:", string.char(13), "(-", tostring(fsayı[1]), "+(", tostring(fsayı[3]), "^(1/2))) / (2*", tostring(fsayı[0]), ")", string.char(13), string.char(13), "X2 İçin:", string.char(13), "(-", tostring(fsayı[1]), "-(", tostring(fsayı[3]), "^(1/2))) / (2*", tostring(fsayı[0]), ")", "\n")
    else
        local text
        
        text = fonksiyon(fsayı[3], fsayı[0], fsayı[1])
        
        -- İkincil bir fonksiyon ata.
        -- İlk işlem sonuç verirse buraya dön.
        if text == "Kök Bulunamadı" then
            io.write(text, string.char(13), string.char(13), "Delta 0'a eşittir. Bu yüzden kök yoktur.", "\n")
        else
            io.write(text, string.char(13), string.char(13), "Formül = -", tostring(fsayı[1]), "/ 2*", tostring(fsayı[0]), "\n")
        end
    end
else
    
    -- "Kapalı İşlemler"
    if fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass" then
        io.write("Kök 1: ", (-fsayı[1] + math.sqrt(fsayı[3])) / (2 * fsayı[0]), "\n")
        io.write("Kök 2: ", (-fsayı[1] - math.sqrt(fsayı[3])) / (2 * fsayı[0]), "\n")
    else
        io.write(fonksiyon(fsayı[3], fsayı[0], fsayı[1]), "\n")
    end
end

-- Programı Kapat. (return True)
