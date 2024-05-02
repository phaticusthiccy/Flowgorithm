function delay(sn)
    -- Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
    -- setTimeout()
    -- time.sleep()
    -- gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
    local payload
    local ms
    
    ms = sn * 30000
    
    -- 1 Saniye ≊ 30.000 Sayım
    -- 1 Sayım = 3,14e-5
    local n
    
    n = 0
    while n < ms do
        n = n + 1
    end
    payload = true
    
    return payload
end

function exit()
    -- Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
    -- Bu fonskiyon hiçbir şekilde pas geçilemez.
    -- Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
    repeat
    until not (true)
    
    return ex
end

function logger(type, this)
    local payload
    
    -- Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
    -- 
    -- Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
    if type == "int" then
        io.write(math.floor(tonumber(this)), "\n")
        payload = true
    else
        if type == "str" then
            io.write(tostring(this), "\n")
            payload = true
        else
            if type == "bool" then
                payload = this
            else
                
                -- Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                -- Program durdurulur.
                -- process.exit()
                exit ()
            end
        end
    end
    
    -- logger("str", "test")  =>  String İçin
    -- logger("int", "190")  =>  Sayı İçin
    -- logger("bool", true)  => true-false için
    
    return payload
end

function namecorrection(name)
    local payload
    
    if string.len(name) < 3 then
        logger ("str", "İsminiz 3 kelimeden kısa olmamalı." .. string.char(13) .. "Lütfen programı baştan başlatın.")
        exit ()
    else
        payload = true
    end
    
    -- Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
    
    return payload
end

function plugins(type, arg)
    -- Program içindeki çeşitlilik için gerekli fonksiyon.
    -- Fonksiyon karmaşası olmaması için kısaltıldı.
    local payload
    local str = {}
    
    if type == "ask name" then
        str[0] = "Oyuna Hoşgeldin Yabancı!" .. string.char(13) .. "Lütfen Adını Gir:"
        str[1] = "Hey, Merhaba Yabacı :)" .. string.char(13) .. "Lütfen İsmini Yazar mısın?"
        str[2] = "Yeni bir oyuncu. Yaşasınn!" .. string.char(13) .. "Adını söylermisin lütfen.."
        str[3] = "Oyunda Yeni Bir Katılımcı Var!" .. string.char(13) .. "Lütfen İsmini Gir:"
        str[4] = "İşte yeni bir oyuncu daha!" .. string.char(13) .. "Sana nasıl hitap etmemi istersin?"
        str[5] = "Seni daha önce buralarda görmedim.." .. string.char(13) .. "Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle."
        str[6] = "Oyuna Hoşgeldin!" .. string.char(13) .. "Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz."
        payload = str[(math.random(7) - 1)]
    else
        if type == "after name" then
            str[0] = "Merhaba " .. arg .. string.char(13) .. "Oyunun kuralları şunlardır:" .. string.char(13) .. "1) Sistem 0-100 arasında sayı seçer." .. string.char(13) .. "2) Sayıyı tahmin etmeye çalışırsın" .. string.char(13) .. "3) Toplam 10 adet başarısız denemeden sonra oyun biter." .. string.char(13) .. "4) Sayı bulunursa oyun kazanılır!"
            payload = str[0]
        else
            if type == "game mode" then
                str[0] = "Lütfen Oyun Modunu Seç" .. string.char(13) .. string.char(13) .. "1) Kolay (Sıcak-Soğuk Mantığı)" .. string.char(13) .. "2) Normal (Yönergeler Yok)" .. string.char(13) .. "3) İşleyiş Hakkında Bilgi Al"
                payload = str[0]
            else
                if type == "wmode" then
                    str[0] = "Lütfen Sadece 1 veya 2 Yazın"
                    str[1] = "Yanlış Seçim! Sadece 1 veya 2 yazın!"
                    payload = str[(math.random(2) - 1)]
                else
                    if type == "get num" then
                        str[0] = "Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! " .. arg
                        str[1] = "Tuttum! Hadi Başlayalım :)"
                        str[2] = "Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans " .. arg .. " :)"
                        payload = str[(math.random(3) - 1)]
                    else
                        if type == "think" then
                            str[0] = "Tahminin?"
                            str[1] = "Sence ne olabilir " .. arg .. "?"
                            str[2] = "Bi fikrin varmı?"
                            str[3] = "Tahminin için bekliyorum " .. arg
                            str[4] = "İyi düşün ve öyle karar ver.."
                            str[5] = "Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                            str[6] = "Şansını boşa harcama " .. arg
                            str[7] = "Sakın yanlış tahin ediyim deme haa"
                            str[8] = "Hadi sıra sende " .. arg
                            payload = str[(math.random(9) - 1)]
                        else
                            if type == "wthink" then
                                str[0] = "Yanlış! Tahminin?"
                                str[1] = "Bu Değil. Sence ne olabilir " .. arg .. "?"
                                str[2] = "Sayı bu değil. Bi fikrin varmı?"
                                str[3] = "Yeniden.. Tahminin için bekliyorum " .. arg
                                str[4] = "Şimdi iyi düşün ve öyle karar ver.."
                                str[5] = "Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                                str[6] = "Şansını boşa harcama " .. arg
                                str[7] = "Ah be abi. Sakın yanlış tahin ediyim deme haa"
                                str[8] = "Tekrardan.. Hadi sıra sende " .. arg
                                payload = str[(math.random(9) - 1)]
                            else
                                if type == "sthink" then
                                    str[0] = "Hey, hey! Bu son hakkın. Dikkatli Ol!"
                                    str[1] = "Dur Biraz! Bu Son Şansın. İyi Kullan " .. arg
                                    str[2] = "Kader Anı! Oyunu kazanman için son şans!"
                                    str[3] = "Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin " .. arg
                                    str[4] = "Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı.."
                                    payload = str[(math.random(5) - 1)]
                                else
                                    if type == "win" then
                                        str[0] = "[+] Kazandın!!!" .. string.char(13) .. "İşte Buuu! Nasılda tahmin ettin *o*" .. string.char(13) .. string.char(13) .. "Bir sonraki oyunda görüşmek üzere.."
                                        str[1] = "[+] Tebrikler " .. arg .. "." .. string.char(13) .. "Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın." .. string.char(13) .. "Bir sonraki oyununda başarılar."
                                        str[2] = "[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)" .. string.char(13) .. "Bir oyuna daha var mısın.."
                                        str[3] = "[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum." .. string.char(13) .. "Sonraki oyunlarda görüşmek dileğiyle.."
                                        str[4] = "[+] İyi iş çıkardın " .. arg .. string.char(13) .. "Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \\'_'/"
                                        payload = str[(math.random(5) - 1)]
                                    else
                                        if type == "swin" then
                                            str[0] = "[⁂] İnanılmaz.. Tek Kelime İle Şahane!"
                                            str[1] = "[⁂] Ne.. Bu kadar hızlı yenilemem.."
                                            str[2] = "[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim.."
                                            str[3] = "[⁂] Sen..? Nasıl..? Hile mi yapıyosun??"
                                            str[4] = "[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?"
                                            payload = str[(math.random(5) - 1)]
                                        else
                                            if type == "lose" then
                                                str[0] = "[-] Üzgünüm, Oyunu Kaybettiniz."
                                                str[1] = "[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın.."
                                                str[2] = "[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin."
                                                str[3] = "[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın."
                                                str[4] = "[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez.."
                                                payload = str[(math.random(5) - 1)]
                                            else
                                                if type == "cold" then
                                                    str[0] = "↘                ↙" .. string.char(13) .. " Soğuk" .. string.char(13) .. "↗                ↖"
                                                    payload = str[0]
                                                else
                                                    if type == "warm" then
                                                        str[0] = "↘                ↙" .. string.char(13) .. "  Ilık" .. string.char(13) .. "↗                ↖"
                                                        payload = str[0]
                                                    else
                                                        if type == "hot" then
                                                            str[0] = "↘                ↙" .. string.char(13) .. " Sıcak" .. string.char(13) .. "↗                ↖"
                                                            payload = str[0]
                                                        else
                                                            if type == "info" then
                                                                str[0] = "Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır."
                                                                str[1] = "Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir."
                                                                str[2] = "İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır."
                                                                str[3] = "Ardından oyun hakkında bilgilendirme mesajı gönderilir."
                                                                str[4] = "Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki 'Ana' yazan yere basıp 'logger' seçmelisiniz."
                                                                str[5] = "Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor."
                                                                str[6] = "Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir."
                                                                str[7] = "Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir."
                                                                str[8] = "Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır."
                                                                str[9] = "Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur."
                                                                payload = str[math.floor(tonumber(arg))]
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    -- prototip => plugins(<str>, <str>)
    -- Örnek:
    -- plugins("ask name", " ")
    -- plugins("after name", "İsim")
    
    return payload
end

function rand(type)
    local payload, opt, num
    local var_index = {}
    
    -- 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
    -- 
    -- var dizin = ["bir", "iki", "üç"]
    -- return dizin[0]     // "bir"
    if not type then
        payload = (math.random(101) - 1)
        
        -- Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
        -- Değişken kontrolü için;
        -- rand(true)
        -- 
        -- Direk işlem için;
        -- rand(false)
        -- 
        -- kullanın.
        if payload == 0 then
            rand (false)
        end
    else
        
        -- Bu kısım değişken kontrolü yapmak isteyenler içindir.
        num = 0
        repeat
            var_index[num] = num
            num = num + 1
        until not (num < 101)
        
        -- do döngüsü kullanılır.
        opt = (math.random(101) - 1)
        payload = var_index[opt]
        if payload == 0 then
            rand (true)
        end
    end
    
    -- İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
    -- Çıkış int (Tamsayı) olarak döner.
    
    return payload
end

-- Main
local sync, find
local name
local mode, number

logger ("str", plugins("ask name", ""))
delay (2)
name = io.read()
namecorrection (name)
delay (2)

-- İsim Alma Kısmı Tamamlandı
logger ("str", plugins("after name", name))
delay (9)
logger ("str", plugins("game mode", ""))
mode = tonumber(io.read())

-- Oyun Modu Başarıyla Seçildi
if mode == 1 or mode == 2 then
    if mode == 1 then
        
        -- Kolay Oyun Modu
        local var_index, index2, think
        
        var_index = 0
        index2 = 0
        sync = true
        number = rand(true)
        logger ("str", plugins("get num", name))
        delay (2)
        
        -- Sayı Belirlendi
        while sync do
            if var_index == 10 then
                find = false
                sync = false
                
                -- 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
            else
                index2 = index2 + 1
                var_index = var_index + 1
                if var_index == 1 then
                    
                    -- İlk başlama mesajı
                    logger ("str", plugins("think", name))
                else
                    
                    -- Sonraki başlama mesajları
                    if var_index == 10 then
                        
                        -- Son tahmin hakkı için bilgilendirme mesajı
                        logger ("str", plugins("sthink", name))
                        delay (3.5)
                    else
                        
                        -- Yanlış tahminler için bilgilendirme mesajı
                        logger ("str", plugins("wthink", name))
                    end
                end
                think = tonumber(io.read())
                if think == number then
                    
                    -- Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                    find = true
                    sync = false
                else
                    delay (1)
                    if var_index == 10 then
                    else
                        if think > number then
                            
                            -- Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                            if think - number > 25 then
                                
                                -- Tahmin, sayıdan uzak ise bunu gönder
                                logger ("str", plugins("cold", ""))
                            else
                                if think - number > 15 then
                                    
                                    -- Tahmin, sayıya biraz yakın ise bunu gönder
                                    logger ("str", plugins("warm", ""))
                                else
                                    
                                    -- Tahmin, sayıya çok yakın ise bunu gönder
                                    logger ("str", plugins("hot", ""))
                                end
                            end
                        else
                            
                            -- Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                            if number - think > 25 then
                                
                                -- Tahmin, sayıdan uzak ise bunu gönder
                                logger ("str", plugins("cold", ""))
                            else
                                if number - think > 15 then
                                    
                                    -- Tahmin, sayıya biraz yakın ise bunu gönder
                                    logger ("str", plugins("warm", ""))
                                else
                                    
                                    -- Tahmin, sayıya çok yakın ise bunu gönder
                                    logger ("str", plugins("hot", ""))
                                end
                            end
                        end
                    end
                end
            end
        end
        if find then
            
            -- Oyun Kazanıldığında Buraya Dön
            if index2 < 4 then
                
                -- Sayı hemen tahmin edilirse ek mesaj gönder
                logger ("str", plugins("swin", name))
                delay (1)
                logger ("str", plugins("win", name))
                delay (2)
                logger ("str", index2 .. ". Denemede Oyunu Kazandınız!")
            else
                
                -- Klasik tebrik mesajı
                logger ("str", plugins("win", name))
                delay (2)
                logger ("str", index2 .. ". Denemede Oyunu Kazandınız!")
            end
        else
            
            -- Oyun Kaybedildiğinde Buraya Dön
            logger ("str", plugins("lose", name))
            delay (2)
            logger ("str", "Bir kez daha oynamak için 1 yazman yeterli.")
            name = io.read()
            if name == "1" then
                
                -- Program kapanmadan bir kez daha oynama hakkı verir.
                main ()
            end
        end
    else
        
        -- Normal Oyun Modu
        local var_index, index2, think
        
        var_index = 0
        index2 = 0
        sync = true
        number = rand(false)
        logger ("str", plugins("get num", name))
        delay (2)
        
        -- Sayı Belirlendi
        while sync do
            if var_index == 10 then
                find = false
                sync = false
                
                -- 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
            else
                index2 = index2 + 1
                var_index = var_index + 1
                if var_index == 1 then
                    
                    -- İlk başlama mesajı
                    logger ("str", plugins("think", name))
                else
                    
                    -- Sonraki başlama mesajları
                    if var_index == 10 then
                        
                        -- Son tahmin hakkı için bilgilendirme mesajı
                        logger ("str", plugins("sthink", name))
                        delay (3.5)
                    else
                        
                        -- Yanlış tahminler için bilgilendirme mesajı
                        logger ("str", plugins("wthink", name))
                    end
                end
                think = tonumber(io.read())
                if think == number then
                    
                    -- Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                    find = true
                    sync = false
                else
                    
                    -- Tahmin Yanlış İse Döngüyü Yeniden Başlat
                end
            end
        end
        if find then
            
            -- Oyun Kazanıldığında Buraya Dön
            if index2 < 4 then
                
                -- Sayı hemen tahmin edilirse ek mesaj gönder
                logger ("str", plugins("swin", name))
                delay (1)
                logger ("str", plugins("win", name))
                delay (2)
                logger ("str", index2 .. ". Denemede Oyunu Kazandınız!")
            else
                
                -- Klasik tebrik mesajı
                logger ("str", plugins("win", name))
                delay (2)
                logger ("str", index2 .. ". Denemede Oyunu Kazandınız!")
            end
        else
            
            -- Oyun Kaybedildiğinde Buraya Dön
            logger ("str", plugins("lose", name))
            delay (2)
            logger ("str", "Bir kez daha oynamak için 1 yazman yeterli.")
            name = io.read()
            if name == "1" then
                
                -- Program kapanmadan bir kez daha oynama hakkı verir.
                main ()
            end
        end
    end
else
    if mode == 3 then
        
        -- Bilgilendirme Mesajı
        number = 0
        repeat
            logger ("str", plugins("info", tostring(number)))
            delay (4)
            number = number + 1
        until not (number ~= 10)
        
        -- do Dögüsü kullanmak en iyi seçenek olacaktır
    else
        logger ("str", plugins("wmode", ""))
    end
end
