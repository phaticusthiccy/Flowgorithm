function delay(sn)
    -- Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    local sonuc
    local ms
    
    ms = sn * 33
    local n
    
    n = 0
    while n ~= ms do
        n = n + 1
    end
    sonuc = true
    
    -- Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
    -- boolen test
    -- test = delay(200)
    -- çıktı test  // true
    
    return sonuc
end

function puanekle(puan)
    local sonuc
    local ekpuan = {}
    local var_index, index2
    local sync
    
    -- while döngüsü için
    sync = true
    var_index = 0
    if puan > 89 then
        sonuc = "pass"
        
        -- 90 ve üstü notlar için puan ekleme olmaz.
    else
        if puan > 69 then
            index2 = 5
            while sync do
                if var_index == 6 then
                    sync = false
                else
                    ekpuan[var_index] = index2
                    var_index = var_index + 1
                    index2 = index2 + 1
                end
            end
            sonuc = tostring(ekpuan[(math.random(6) - 1)])
            
            -- Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
        else
            if puan > 49 then
                index2 = 10
                while sync do
                    if var_index == 9 then
                        sync = false
                    else
                        ekpuan[var_index] = index2
                        var_index = var_index + 1
                        index2 = index2 + 1
                    end
                end
                sonuc = tostring(ekpuan[(math.random(9) - 1)])
                
                -- Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
            else
                if puan > 29 then
                    index2 = 20
                    while sync do
                        if var_index == 10 then
                            sync = false
                        else
                            ekpuan[var_index] = index2
                            var_index = var_index + 1
                            index2 = index2 + 1
                        end
                    end
                    sonuc = tostring(ekpuan[(math.random(10) - 1)])
                    
                    -- Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                else
                    index2 = 30
                    while sync do
                        if var_index == 11 then
                            sync = false
                        else
                            ekpuan[var_index] = index2
                            var_index = var_index + 1
                            index2 = index2 + 1
                        end
                    end
                    sonuc = tostring(ekpuan[(math.random(11) - 1)])
                    
                    -- Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                end
            end
        end
    end
    
    -- String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
    -- var sayı = 0.65   // Javascript
    -- sayı = 0.65          // Python
    -- local sayı = 0.65          // Lua
    -- int sayı = 0.65     // C
    
    return sonuc
end

function puaneklesoru(no, eskinot)
    local sonuc
    
    io.write(no, ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: ", string.char(13), string.char(13), "Öğrencinin Puanı: ", eskinot, "\n")
    sonuc = tonumber(io.read())
    
    return sonuc
end

function yardımloop(sayı)
    local sonuc
    
    if sayı == 1 or sayı == 2 then
    else
        io.write("Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın.", string.char(13), "Yeniden Başlatılıyor..", "\n")
        delay (1000)
        io.write("1) Otomatik Mod Hakkında Yardım", string.char(13), "2) Manuel Mod Hakkında Yardım", "\n")
        sayı = tonumber(io.read())
        yardımloop (sayı)
    end
    
    -- Yardım Modülü İçin
    -- Yanlış değer girildiğinde baştan başlatır
    sonuc = sayı
    
    return sonuc
end

function yardımloop2(sayı)
    local sonuc
    
    if sayı == 1 or sayı == 2 or sayı == 3 then
    else
        io.write("Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın.", string.char(13), "Yeniden Başlatılıyor..", "\n")
        delay (1000)
        io.write("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım", string.char(13), "2) Manuel Puan Ekleme Hakkında Yardım", string.char(13), "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım", "\n")
        sayı = tonumber(io.read())
        yardımloop2 (sayı)
    end
    sonuc = sayı
    
    return sonuc
end

-- Main
math.randomseed(os.time ())  -- Prepare the random number generator

local sync

sync = true
local secim
local var_index, index2

var_index = 0
index2 = 0
local notlar = {}
local eskinotlar = {}
local otonot = {}
local otoeklenennot = {}

io.write("Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?", string.char(13), string.char(13), "Otomatik için: 'O'", string.char(13), "Manuel için: 'M'", string.char(13), "Yazın", string.char(13), string.char(13), "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın", "\n")
secim = io.read()
if secim == "O" or secim == "o" then
    while sync do
        
        -- Bu döngü notları belirler.
        if var_index == 5 then
            sync = false
            
            -- index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
        else
            var_index = var_index + 1
            notlar[index2] = (math.random(80) - 1)
            
            -- Random sayı belirle
            index2 = index2 + 1
            
            -- 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
        end
    end
    sync = true
    var_index = 0
    index2 = 0
    
    -- Değişkenleri sıfırlayalım
    while sync do
        
        -- Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
        if var_index == 5 then
            sync = false
        else
            var_index = var_index + 1
            eskinotlar[index2] = notlar[index2]
            notlar[index2] = notlar[index2] + 20
            index2 = index2 + 1
        end
    end
    sync = true
    var_index = 0
    index2 = 0
    
    -- Değişkenleri sıfırlayalım
    io.write("Yeni Notlar:", "\n")
    while sync do
        
        -- Bu döngü eski ve yeni notları bir arada yazdırır.
        if var_index == 5 then
            sync = false
            
            -- Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
        else
            var_index = var_index + 1
            io.write(tostring(var_index), ". Öğrencinin; ", string.char(13), string.char(13), "Eski Not: ", eskinotlar[index2], string.char(13), "Yeni Not: ", notlar[index2], "\n")
            delay (500)
            
            -- 500 Milisaniyelik Gecikme
            index2 = index2 + 1
        end
    end
else
    if secim == "M" or secim == "m" then
        io.write("1. Öğrencinin Notunu Giriniz: ", "\n")
        notlar[0] = tonumber(io.read())
        io.write("2. Öğrencinin Notunu Giriniz: ", "\n")
        notlar[1] = tonumber(io.read())
        io.write("3. Öğrencinin Notunu Giriniz: ", "\n")
        notlar[2] = tonumber(io.read())
        io.write("4. Öğrencinin Notunu Giriniz: ", "\n")
        notlar[3] = tonumber(io.read())
        io.write("5. Öğrencinin Notunu Giriniz: ", "\n")
        notlar[4] = tonumber(io.read())
        delay (800)
        local secim2
        local devam
        
        devam = true
        var_index = 0
        index2 = 0
        while sync do
            if var_index == 5 then
                sync = false
            else
                var_index = var_index + 1
                if notlar[index2] > 100 then
                    sync = false
                    devam = false
                else
                    if notlar[index2] < 0 then
                        sync = false
                        devam = false
                    else
                        index2 = index2 + 1
                    end
                end
            end
        end
        if not devam then
            io.write("Notlar 100 ve 0 Arasında Olmalıdır.", "\n")
        else
            io.write("Size 3 Seçenek Sunuyoruz:", string.char(13), string.char(13), "1) Herkesin Notuna +20 Puan Ekle", string.char(13), "2) Herkesin Notuna Eklenecek Puanı Manuel Gir", string.char(13), "3) Sistem'in Kendi Not Ekleme Aracını Kullan", "\n")
            secim2 = tonumber(io.read())
            if secim2 == 3 then
                delay (59)
                var_index = 0
                index2 = 0
                sync = true
                while sync do
                    if var_index == 5 then
                        sync = false
                    else
                        var_index = var_index + 1
                        otoeklenennot[index2] = puanekle(notlar[index2])
                        
                        -- Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                        delay (59)
                        if otoeklenennot[index2] == "pass" then
                            otoeklenennot[index2] = "0"
                        else
                            otonot[index2] = notlar[index2] + math.floor(tonumber(puanekle(notlar[index2])))
                        end
                        index2 = index2 + 1
                    end
                end
                var_index = 0
                index2 = 0
                sync = true
                while sync do
                    if var_index == 5 then
                        sync = false
                    else
                        var_index = var_index + 1
                        local cikti
                        
                        if otoeklenennot[index2] == "0" then
                            cikti = tostring(var_index) .. ". Öğrencinin; " .. string.char(13) .. string.char(13) .. "Eski Not: " .. notlar[index2] .. string.char(13) .. "Yeni Not: " .. notlar[index2] .. string.char(13) .. "Ek Puan Yok. Not Yeterli."
                        else
                            cikti = tostring(var_index) .. ". Öğrencinin; " .. string.char(13) .. string.char(13) .. "Eski Not: " .. notlar[index2] .. string.char(13) .. "Yeni Not: " .. math.floor(tonumber(otoeklenennot[index2])) + notlar[index2] .. string.char(13) .. "Eklenen Puan: " .. otoeklenennot[index2]
                        end
                        io.write(cikti, "\n")
                        delay (500)
                        index2 = index2 + 1
                    end
                end
            else
                if secim2 == 2 then
                    var_index = 0
                    index2 = 0
                    sync = false
                    local sayı1, sayı2, sayı3, sayı4, sayı5
                    local soru1, soru2, soru3, soru4, soru5
                    
                    -- Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                    -- Yaha henüz ben keşfedemedim :p
                    delay (230)
                    soru1 = puaneklesoru("1", notlar[index2])
                    index2 = index2 + 1
                    soru2 = puaneklesoru("2", notlar[index2])
                    index2 = index2 + 1
                    soru3 = puaneklesoru("3", notlar[index2])
                    index2 = index2 + 1
                    soru4 = puaneklesoru("4", notlar[index2])
                    index2 = index2 + 1
                    soru5 = puaneklesoru("5", notlar[index2])
                    delay (600)
                    sync = true
                    local soruarray = {}
                    
                    soruarray[0] = soru1
                    soruarray[1] = soru2
                    soruarray[2] = soru3
                    soruarray[3] = soru4
                    soruarray[4] = soru5
                    if soru1 > 100 and soru1 < 0 or soru2 > 100 and soru2 < 0 or soru3 > 100 and soru3 < 0 or soru4 > 100 and soru4 < 0 or soru5 > 100 and soru5 < 0 then
                        io.write("Notların Son Hali 100 ve 0 Arasında Olmalıdır.", "\n")
                    else
                        index2 = 0
                        sayı1 = soru1 + notlar[index2]
                        index2 = index2 + 1
                        sayı2 = soru2 + notlar[index2]
                        index2 = index2 + 1
                        sayı3 = soru3 + notlar[index2]
                        index2 = index2 + 1
                        sayı4 = soru4 + notlar[index2]
                        index2 = index2 + 1
                        sayı5 = soru5 + notlar[index2]
                        index2 = 0
                        var_index = 0
                        local sonsayılar = {}
                        
                        sonsayılar[0] = sayı1
                        sonsayılar[1] = sayı2
                        sonsayılar[2] = sayı3
                        sonsayılar[3] = sayı4
                        sonsayılar[4] = sayı5
                        while sync do
                            if var_index == 5 then
                                sync = false
                            else
                                var_index = var_index + 1
                                io.write(tostring(var_index), ". Öğrencinin; ", string.char(13), string.char(13), "Eski Not: ", notlar[index2], string.char(13), "Yeni Not: ", sonsayılar[index2], string.char(13), "Eklenen Puan: ", soruarray[index2], "\n")
                                delay (270)
                                index2 = index2 + 1
                            end
                        end
                    end
                else
                    if secim2 == 1 then
                        while sync do
                            
                            -- Bu döngü notları belirler.
                            if var_index == 5 then
                                sync = false
                                
                                -- index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                            else
                                var_index = var_index + 1
                                notlar[index2] = (math.random(80) - 1)
                                
                                -- Random sayı belirle
                                index2 = index2 + 1
                                
                                -- 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                            end
                        end
                        sync = true
                        var_index = 0
                        index2 = 0
                        
                        -- Değişkenleri sıfırlayalım
                        while sync do
                            
                            -- Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                            if var_index == 5 then
                                sync = false
                            else
                                var_index = var_index + 1
                                eskinotlar[index2] = notlar[index2]
                                notlar[index2] = notlar[index2] + 20
                                index2 = index2 + 1
                            end
                        end
                        sync = true
                        var_index = 0
                        index2 = 0
                        
                        -- Değişkenleri sıfırlayalım
                        io.write("Yeni Notlar:", "\n")
                        while sync do
                            
                            -- Bu döngü eski ve yeni notları bir arada yazdırır.
                            if var_index == 5 then
                                sync = false
                                
                                -- Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                            else
                                var_index = var_index + 1
                                if notlar[index2] > 100 then
                                    notlar[index2] = 100
                                    io.write(tostring(var_index), ". Öğrencinin; ", string.char(13), string.char(13), "Eski Not: ", eskinotlar[index2], string.char(13), "Yeni Not: ", notlar[index2], "\n")
                                else
                                    io.write(tostring(var_index), ". Öğrencinin; ", string.char(13), string.char(13), "Eski Not: ", eskinotlar[index2], string.char(13), "Yeni Not: ", notlar[index2], "\n")
                                end
                                
                                -- 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                delay (500)
                                
                                -- 500 Milisaniyelik Gecikme
                                index2 = index2 + 1
                            end
                        end
                    else
                        io.write("Lütfen 1, 2 veya 3 yazınız.", "\n")
                        delay (1000)
                        io.write("Program Kapatılıyor..", "\n")
                        var_index = 3
                        while sync do
                            if var_index == 0 then
                                sync = false
                            else
                                delay (1000)
                                io.write(tostring(var_index), "..", "\n")
                                var_index = var_index - 1
                            end
                            
                            -- Programın Kapatılması İçin Sayaç Oluştur
                        end
                    end
                end
            end
        end
    else
        local helpnum, helpnum2
        local loop, loop2
        
        if secim == "a" or secim == "A" then
            io.write("1) Otomatik Mod Hakkında Yardım", string.char(13), "2) Manuel Mod Hakkında Yardım", "\n")
            helpnum = tonumber(io.read())
            delay (200)
            
            -- Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
            loop = yardımloop(helpnum)
            delay (200)
            if loop == 1 then
                io.write("Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.", "\n")
                delay (7800)
                io.write("Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.", "\n")
                delay (9000)
                io.write("Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.", "\n")
            else
                io.write("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım", string.char(13), "2) Manuel Puan Ekleme Hakkında Yardım", string.char(13), "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım", "\n")
                helpnum2 = tonumber(io.read())
                delay (200)
                loop2 = yardımloop2(helpnum2)
                delay (200)
                if loop2 == 1 then
                    io.write("Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.", "\n")
                else
                    if loop2 == 2 then
                        io.write("Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.", "\n")
                        delay (7800)
                        io.write("Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.", "\n")
                    else
                        io.write("Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.", "\n")
                        delay (4500)
                        io.write("Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.", "\n")
                        delay (4500)
                        io.write("Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.", "\n")
                        delay (8000)
                        io.write("Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır.", "\n")
                    end
                end
            end
        else
            io.write("Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!", "\n")
        end
    end
end

-- 2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır.
-- 
-- Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir.
-- Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer.
-- 
-- 1. İşlem: Seçilen Notların Hepine 20 Puan Ekle
-- 2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler
-- 3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar.
-- 
-- 3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir.
