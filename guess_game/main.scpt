on run
    local Sync, Find
    local Name
    local Mode, var_Number
    
    Logger("str", Plugins("ask name", ""))
    Delay(2)
    display dialog "Enter a value for Name" default answer "" buttons {"ok"} with title "Enter a value"
    set Name to the text returned of the result
    Namecorrection(Name)
    Delay(2)
    
    -- İsim Alma Kısmı Tamamlandı
    Logger("str", Plugins("after name", Name))
    Delay(9)
    Logger("str", Plugins("game mode", ""))
    display dialog "Enter a value for Mode" default answer "" buttons {"ok"} with title "Enter a value"
    set Mode to the text returned of the result
    
    -- Oyun Modu Başarıyla Seçildi
    if Mode is equal to 1 or Mode is equal to 2
        if Mode is equal to 1
            
            -- Kolay Oyun Modu
            local İndex, İndex2, Think
            
            set İndex to 0
            set İndex2 to 0
            set Sync to true
            set var_Number to Rand(true)
            Logger("str", Plugins("get num", Name))
            Delay(2)
            
            -- Sayı Belirlendi
            repeat while Sync
                if İndex is equal to 10
                    set Find to false
                    set Sync to false
                    
                    -- 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                else
                    set İndex2 to İndex2 + 1
                    set İndex to İndex + 1
                    if İndex is equal to 1
                        
                        -- İlk başlama mesajı
                        Logger("str", Plugins("think", Name))
                    else
                        
                        -- Sonraki başlama mesajları
                        if İndex is equal to 10
                            
                            -- Son tahmin hakkı için bilgilendirme mesajı
                            Logger("str", Plugins("sthink", Name))
                            Delay(3.5)
                        else
                            
                            -- Yanlış tahminler için bilgilendirme mesajı
                            Logger("str", Plugins("wthink", Name))
                        end if
                    end if
                    display dialog "Enter a value for Think" default answer "" buttons {"ok"} with title "Enter a value"
                    set Think to the text returned of the result
                    if Think is equal to var_Number
                        
                        -- Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        set Find to true
                        set Sync to false
                    else
                        Delay(1)
                        if İndex is equal to 10
                        else
                            if Think is greater than var_Number
                                
                                -- Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                                if Think - var_Number is greater than 25
                                    
                                    -- Tahmin, sayıdan uzak ise bunu gönder
                                    Logger("str", Plugins("cold", ""))
                                else
                                    if Think - var_Number is greater than 15
                                        
                                        -- Tahmin, sayıya biraz yakın ise bunu gönder
                                        Logger("str", Plugins("warm", ""))
                                    else
                                        
                                        -- Tahmin, sayıya çok yakın ise bunu gönder
                                        Logger("str", Plugins("hot", ""))
                                    end if
                                end if
                            else
                                
                                -- Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                                if var_Number - Think is greater than 25
                                    
                                    -- Tahmin, sayıdan uzak ise bunu gönder
                                    Logger("str", Plugins("cold", ""))
                                else
                                    if var_Number - Think is greater than 15
                                        
                                        -- Tahmin, sayıya biraz yakın ise bunu gönder
                                        Logger("str", Plugins("warm", ""))
                                    else
                                        
                                        -- Tahmin, sayıya çok yakın ise bunu gönder
                                        Logger("str", Plugins("hot", ""))
                                    end if
                                end if
                            end if
                        end if
                    end if
                end if
            end repeat
            if Find
                
                -- Oyun Kazanıldığında Buraya Dön
                if İndex2 is less than 4
                    
                    -- Sayı hemen tahmin edilirse ek mesaj gönder
                    Logger("str", Plugins("swin", Name))
                    Delay(1)
                    Logger("str", Plugins("win", Name))
                    Delay(2)
                    Logger("str", İndex2 as string & ". Denemede Oyunu Kazandınız!")
                else
                    
                    -- Klasik tebrik mesajı
                    Logger("str", Plugins("win", Name))
                    Delay(2)
                    Logger("str", İndex2 as string & ". Denemede Oyunu Kazandınız!")
                end if
            else
                
                -- Oyun Kaybedildiğinde Buraya Dön
                Logger("str", Plugins("lose", Name))
                Delay(2)
                Logger("str", "Bir kez daha oynamak için 1 yazman yeterli.")
                display dialog "Enter a value for Name" default answer "" buttons {"ok"} with title "Enter a value"
                set Name to the text returned of the result
                if Name is equal to "1"
                    
                    -- Program kapanmadan bir kez daha oynama hakkı verir.
                    Main()
                end if
            end if
        else
            
            -- Normal Oyun Modu
            local İndex, İndex2, Think
            
            set İndex to 0
            set İndex2 to 0
            set Sync to true
            set var_Number to Rand(false)
            Logger("str", Plugins("get num", Name))
            Delay(2)
            
            -- Sayı Belirlendi
            repeat while Sync
                if İndex is equal to 10
                    set Find to false
                    set Sync to false
                    
                    -- 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                else
                    set İndex2 to İndex2 + 1
                    set İndex to İndex + 1
                    if İndex is equal to 1
                        
                        -- İlk başlama mesajı
                        Logger("str", Plugins("think", Name))
                    else
                        
                        -- Sonraki başlama mesajları
                        if İndex is equal to 10
                            
                            -- Son tahmin hakkı için bilgilendirme mesajı
                            Logger("str", Plugins("sthink", Name))
                            Delay(3.5)
                        else
                            
                            -- Yanlış tahminler için bilgilendirme mesajı
                            Logger("str", Plugins("wthink", Name))
                        end if
                    end if
                    display dialog "Enter a value for Think" default answer "" buttons {"ok"} with title "Enter a value"
                    set Think to the text returned of the result
                    if Think is equal to var_Number
                        
                        -- Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        set Find to true
                        set Sync to false
                    else
                        
                        -- Tahmin Yanlış İse Döngüyü Yeniden Başlat
                    end if
                end if
            end repeat
            if Find
                
                -- Oyun Kazanıldığında Buraya Dön
                if İndex2 is less than 4
                    
                    -- Sayı hemen tahmin edilirse ek mesaj gönder
                    Logger("str", Plugins("swin", Name))
                    Delay(1)
                    Logger("str", Plugins("win", Name))
                    Delay(2)
                    Logger("str", İndex2 as string & ". Denemede Oyunu Kazandınız!")
                else
                    
                    -- Klasik tebrik mesajı
                    Logger("str", Plugins("win", Name))
                    Delay(2)
                    Logger("str", İndex2 as string & ". Denemede Oyunu Kazandınız!")
                end if
            else
                
                -- Oyun Kaybedildiğinde Buraya Dön
                Logger("str", Plugins("lose", Name))
                Delay(2)
                Logger("str", "Bir kez daha oynamak için 1 yazman yeterli.")
                display dialog "Enter a value for Name" default answer "" buttons {"ok"} with title "Enter a value"
                set Name to the text returned of the result
                if Name is equal to "1"
                    
                    -- Program kapanmadan bir kez daha oynama hakkı verir.
                    Main()
                end if
            end if
        end if
    else
        if Mode is equal to 3
            
            -- Bilgilendirme Mesajı
            set var_Number to 0
            repeat
                Logger("str", Plugins("info", var_Number as string))
                Delay(4)
                set var_Number to var_Number + 1
                
                if var_Number isn't equal to 10 is false then exit repeat
            end repeat
            
            -- do Dögüsü kullanmak en iyi seçenek olacaktır
        else
            Logger("str", Plugins("wmode", ""))
        end if
    end if
end run

to Delay(Sn)
    -- Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
    -- setTimeout()
    -- time.sleep()
    -- gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
    local Payload
    local Ms
    
    set Ms to Sn * 30000
    
    -- 1 Saniye ≊ 30.000 Sayım
    -- 1 Sayım = 3,14e-5
    local n
    
    set n to 0
    repeat while n is less than Ms
        set n to n + 1
    end repeat
    set Payload to true
    
    return Payload
end Delay

to func_Exit()
    -- Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
    -- Bu fonskiyon hiçbir şekilde pas geçilemez.
    -- Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
    repeat
        
        if true is false then exit repeat
    end repeat
    
    return ex
end func_Exit

to Logger(Type, This)
    local Payload
    
    -- Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
    -- 
    -- Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
    if Type is equal to "int"
        display dialog This as integer
        set Payload to true
    else
        if Type is equal to "str"
            display dialog This as string
            set Payload to true
        else
            if Type is equal to "bool"
                set Payload to This
            else
                
                -- Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                -- Program durdurulur.
                -- process.exit()
                func_Exit()
            end if
        end if
    end if
    
    -- logger("str", "test")  =>  String İçin
    -- logger("int", "190")  =>  Sayı İçin
    -- logger("bool", true)  => true-false için
    
    return Payload
end Logger

to Namecorrection(Name)
    local Payload
    
    if (length of Name) is less than 3
        Logger("str", "İsminiz 3 kelimeden kısa olmamalı." & (13 ASCII character) & "Lütfen programı baştan başlatın.")
        func_Exit()
    else
        set Payload to true
    end if
    
    -- Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
    
    return Payload
end Namecorrection

to Plugins(Type, Arg)
    -- Program içindeki çeşitlilik için gerekli fonksiyon.
    -- Fonksiyon karmaşası olmaması için kısaltıldı.
    local Payload
    local Str
    
    if Type is equal to "ask name"
        set Str(0) to "Oyuna Hoşgeldin Yabancı!" & (13 ASCII character) & "Lütfen Adını Gir:"
        set Str(1) to "Hey, Merhaba Yabacı :)" & (13 ASCII character) & "Lütfen İsmini Yazar mısın?"
        set Str(2) to "Yeni bir oyuncu. Yaşasınn!" & (13 ASCII character) & "Adını söylermisin lütfen.."
        set Str(3) to "Oyunda Yeni Bir Katılımcı Var!" & (13 ASCII character) & "Lütfen İsmini Gir:"
        set Str(4) to "İşte yeni bir oyuncu daha!" & (13 ASCII character) & "Sana nasıl hitap etmemi istersin?"
        set Str(5) to "Seni daha önce buralarda görmedim.." & (13 ASCII character) & "Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle."
        set Str(6) to "Oyuna Hoşgeldin!" & (13 ASCII character) & "Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz."
        set Payload to Str(random from 0 to 7 - 1)
    else
        if Type is equal to "after name"
            set Str(0) to "Merhaba " & Arg & (13 ASCII character) & "Oyunun kuralları şunlardır:" & (13 ASCII character) & "1) Sistem 0-100 arasında sayı seçer." & (13 ASCII character) & "2) Sayıyı tahmin etmeye çalışırsın" & (13 ASCII character) & "3) Toplam 10 adet başarısız denemeden sonra oyun biter." & (13 ASCII character) & "4) Sayı bulunursa oyun kazanılır!"
            set Payload to Str(0)
        else
            if Type is equal to "game mode"
                set Str(0) to "Lütfen Oyun Modunu Seç" & (13 ASCII character) & (13 ASCII character) & "1) Kolay (Sıcak-Soğuk Mantığı)" & (13 ASCII character) & "2) Normal (Yönergeler Yok)" & (13 ASCII character) & "3) İşleyiş Hakkında Bilgi Al"
                set Payload to Str(0)
            else
                if Type is equal to "wmode"
                    set Str(0) to "Lütfen Sadece 1 veya 2 Yazın"
                    set Str(1) to "Yanlış Seçim! Sadece 1 veya 2 yazın!"
                    set Payload to Str(random from 0 to 2 - 1)
                else
                    if Type is equal to "get num"
                        set Str(0) to "Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! " & Arg
                        set Str(1) to "Tuttum! Hadi Başlayalım :)"
                        set Str(2) to "Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans " & Arg & " :)"
                        set Payload to Str(random from 0 to 3 - 1)
                    else
                        if Type is equal to "think"
                            set Str(0) to "Tahminin?"
                            set Str(1) to "Sence ne olabilir " & Arg & "?"
                            set Str(2) to "Bi fikrin varmı?"
                            set Str(3) to "Tahminin için bekliyorum " & Arg
                            set Str(4) to "İyi düşün ve öyle karar ver.."
                            set Str(5) to "Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                            set Str(6) to "Şansını boşa harcama " & Arg
                            set Str(7) to "Sakın yanlış tahin ediyim deme haa"
                            set Str(8) to "Hadi sıra sende " & Arg
                            set Payload to Str(random from 0 to 9 - 1)
                        else
                            if Type is equal to "wthink"
                                set Str(0) to "Yanlış! Tahminin?"
                                set Str(1) to "Bu Değil. Sence ne olabilir " & Arg & "?"
                                set Str(2) to "Sayı bu değil. Bi fikrin varmı?"
                                set Str(3) to "Yeniden.. Tahminin için bekliyorum " & Arg
                                set Str(4) to "Şimdi iyi düşün ve öyle karar ver.."
                                set Str(5) to "Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                                set Str(6) to "Şansını boşa harcama " & Arg
                                set Str(7) to "Ah be abi. Sakın yanlış tahin ediyim deme haa"
                                set Str(8) to "Tekrardan.. Hadi sıra sende " & Arg
                                set Payload to Str(random from 0 to 9 - 1)
                            else
                                if Type is equal to "sthink"
                                    set Str(0) to "Hey, hey! Bu son hakkın. Dikkatli Ol!"
                                    set Str(1) to "Dur Biraz! Bu Son Şansın. İyi Kullan " & Arg
                                    set Str(2) to "Kader Anı! Oyunu kazanman için son şans!"
                                    set Str(3) to "Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin " & Arg
                                    set Str(4) to "Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı.."
                                    set Payload to Str(random from 0 to 5 - 1)
                                else
                                    if Type is equal to "win"
                                        set Str(0) to "[+] Kazandın!!!" & (13 ASCII character) & "İşte Buuu! Nasılda tahmin ettin *o*" & (13 ASCII character) & (13 ASCII character) & "Bir sonraki oyunda görüşmek üzere.."
                                        set Str(1) to "[+] Tebrikler " & Arg & "." & (13 ASCII character) & "Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın." & (13 ASCII character) & "Bir sonraki oyununda başarılar."
                                        set Str(2) to "[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)" & (13 ASCII character) & "Bir oyuna daha var mısın.."
                                        set Str(3) to "[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum." & (13 ASCII character) & "Sonraki oyunlarda görüşmek dileğiyle.."
                                        set Str(4) to "[+] İyi iş çıkardın " & Arg & (13 ASCII character) & "Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \\'_'/"
                                        set Payload to Str(random from 0 to 5 - 1)
                                    else
                                        if Type is equal to "swin"
                                            set Str(0) to "[⁂] İnanılmaz.. Tek Kelime İle Şahane!"
                                            set Str(1) to "[⁂] Ne.. Bu kadar hızlı yenilemem.."
                                            set Str(2) to "[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim.."
                                            set Str(3) to "[⁂] Sen..? Nasıl..? Hile mi yapıyosun??"
                                            set Str(4) to "[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?"
                                            set Payload to Str(random from 0 to 5 - 1)
                                        else
                                            if Type is equal to "lose"
                                                set Str(0) to "[-] Üzgünüm, Oyunu Kaybettiniz."
                                                set Str(1) to "[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın.."
                                                set Str(2) to "[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin."
                                                set Str(3) to "[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın."
                                                set Str(4) to "[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez.."
                                                set Payload to Str(random from 0 to 5 - 1)
                                            else
                                                if Type is equal to "cold"
                                                    set Str(0) to "↘                ↙" & (13 ASCII character) & " Soğuk" & (13 ASCII character) & "↗                ↖"
                                                    set Payload to Str(0)
                                                else
                                                    if Type is equal to "warm"
                                                        set Str(0) to "↘                ↙" & (13 ASCII character) & "  Ilık" & (13 ASCII character) & "↗                ↖"
                                                        set Payload to Str(0)
                                                    else
                                                        if Type is equal to "hot"
                                                            set Str(0) to "↘                ↙" & (13 ASCII character) & " Sıcak" & (13 ASCII character) & "↗                ↖"
                                                            set Payload to Str(0)
                                                        else
                                                            if Type is equal to "info"
                                                                set Str(0) to "Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır."
                                                                set Str(1) to "Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir."
                                                                set Str(2) to "İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır."
                                                                set Str(3) to "Ardından oyun hakkında bilgilendirme mesajı gönderilir."
                                                                set Str(4) to "Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki 'Ana' yazan yere basıp 'logger' seçmelisiniz."
                                                                set Str(5) to "Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor."
                                                                set Str(6) to "Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir."
                                                                set Str(7) to "Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir."
                                                                set Str(8) to "Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır."
                                                                set Str(9) to "Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur."
                                                                set Payload to Str(Arg as integer)
                                                            end if
                                                        end if
                                                    end if
                                                end if
                                            end if
                                        end if
                                    end if
                                end if
                            end if
                        end if
                    end if
                end if
            end if
        end if
    end if
    
    -- prototip => plugins(<str>, <str>)
    -- Örnek:
    -- plugins("ask name", " ")
    -- plugins("after name", "İsim")
    
    return Payload
end Plugins

to Rand(Type)
    local Payload, Opt, Num
    local İndex
    
    -- 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
    -- 
    -- var dizin = ["bir", "iki", "üç"]
    -- return dizin[0]     // "bir"
    if not Type
        set Payload to random from 0 to 101 - 1
        
        -- Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
        -- Değişken kontrolü için;
        -- rand(true)
        -- 
        -- Direk işlem için;
        -- rand(false)
        -- 
        -- kullanın.
        if Payload is equal to 0
            Rand(false)
        end if
    else
        
        -- Bu kısım değişken kontrolü yapmak isteyenler içindir.
        set Num to 0
        repeat
            set İndex(Num) to Num
            set Num to Num + 1
            
            if Num is less than 101 is false then exit repeat
        end repeat
        
        -- do döngüsü kullanılır.
        set Opt to random from 0 to 101 - 1
        set Payload to İndex(Opt)
        if Payload is equal to 0
            Rand(true)
        end if
    end if
    
    -- İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
    -- Çıkış int (Tamsayı) olarak döner.
    
    return Payload
end Rand
