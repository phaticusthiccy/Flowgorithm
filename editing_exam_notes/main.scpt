on run
    local Sync
    
    set Sync to true
    local Secim
    local İndex, İndex2
    
    set İndex to 0
    set İndex2 to 0
    local Notlar
    local Eskinotlar
    local Otonot
    local Otoeklenennot
    
    display dialog "Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" & (13 ASCII character) & (13 ASCII character) & "Otomatik için: 'O'" & (13 ASCII character) & "Manuel için: 'M'" & (13 ASCII character) & "Yazın" & (13 ASCII character) & (13 ASCII character) & "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın"
    display dialog "Enter a value for Secim" default answer "" buttons {"ok"} with title "Enter a value"
    set Secim to the text returned of the result
    if Secim is equal to "O" or Secim is equal to "o"
        repeat while Sync
            
            -- Bu döngü notları belirler.
            if İndex is equal to 5
                set Sync to false
                
                -- index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
            else
                set İndex to İndex + 1
                set Notlar(İndex2) to random from 0 to 80 - 1
                
                -- Random sayı belirle
                set İndex2 to İndex2 + 1
                
                -- 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
            end if
        end repeat
        set Sync to true
        set İndex to 0
        set İndex2 to 0
        
        -- Değişkenleri sıfırlayalım
        repeat while Sync
            
            -- Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
            if İndex is equal to 5
                set Sync to false
            else
                set İndex to İndex + 1
                set Eskinotlar(İndex2) to Notlar(İndex2)
                set Notlar(İndex2) to Notlar(İndex2) + 20
                set İndex2 to İndex2 + 1
            end if
        end repeat
        set Sync to true
        set İndex to 0
        set İndex2 to 0
        
        -- Değişkenleri sıfırlayalım
        display dialog "Yeni Notlar:"
        repeat while Sync
            
            -- Bu döngü eski ve yeni notları bir arada yazdırır.
            if İndex is equal to 5
                set Sync to false
                
                -- Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
            else
                set İndex to İndex + 1
                display dialog (İndex as string) & ". Öğrencinin; " & (13 ASCII character) & (13 ASCII character) & "Eski Not: " & Eskinotlar(İndex2) & (13 ASCII character) & "Yeni Not: " & Notlar(İndex2)
                Delay(500)
                
                -- 500 Milisaniyelik Gecikme
                set İndex2 to İndex2 + 1
            end if
        end repeat
    else
        if Secim is equal to "M" or Secim is equal to "m"
            display dialog "1. Öğrencinin Notunu Giriniz: "
            display dialog "Enter a value for Notlar(0)" default answer "" buttons {"ok"} with title "Enter a value"
            set Notlar(0) to the text returned of the result
            display dialog "2. Öğrencinin Notunu Giriniz: "
            display dialog "Enter a value for Notlar(1)" default answer "" buttons {"ok"} with title "Enter a value"
            set Notlar(1) to the text returned of the result
            display dialog "3. Öğrencinin Notunu Giriniz: "
            display dialog "Enter a value for Notlar(2)" default answer "" buttons {"ok"} with title "Enter a value"
            set Notlar(2) to the text returned of the result
            display dialog "4. Öğrencinin Notunu Giriniz: "
            display dialog "Enter a value for Notlar(3)" default answer "" buttons {"ok"} with title "Enter a value"
            set Notlar(3) to the text returned of the result
            display dialog "5. Öğrencinin Notunu Giriniz: "
            display dialog "Enter a value for Notlar(4)" default answer "" buttons {"ok"} with title "Enter a value"
            set Notlar(4) to the text returned of the result
            Delay(800)
            local Secim2
            local Devam
            
            set Devam to true
            set İndex to 0
            set İndex2 to 0
            repeat while Sync
                if İndex is equal to 5
                    set Sync to false
                else
                    set İndex to İndex + 1
                    if Notlar(İndex2) is greater than 100
                        set Sync to false
                        set Devam to false
                    else
                        if Notlar(İndex2) is less than 0
                            set Sync to false
                            set Devam to false
                        else
                            set İndex2 to İndex2 + 1
                        end if
                    end if
                end if
            end repeat
            if not Devam
                display dialog "Notlar 100 ve 0 Arasında Olmalıdır."
            else
                display dialog "Size 3 Seçenek Sunuyoruz:" & (13 ASCII character) & (13 ASCII character) & "1) Herkesin Notuna +20 Puan Ekle" & (13 ASCII character) & "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" & (13 ASCII character) & "3) Sistem'in Kendi Not Ekleme Aracını Kullan"
                display dialog "Enter a value for Secim2" default answer "" buttons {"ok"} with title "Enter a value"
                set Secim2 to the text returned of the result
                if Secim2 is equal to 3
                    Delay(59)
                    set İndex to 0
                    set İndex2 to 0
                    set Sync to true
                    repeat while Sync
                        if İndex is equal to 5
                            set Sync to false
                        else
                            set İndex to İndex + 1
                            set Otoeklenennot(İndex2) to Puanekle(Notlar(İndex2))
                            
                            -- Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                            Delay(59)
                            if Otoeklenennot(İndex2) is equal to "pass"
                                set Otoeklenennot(İndex2) to "0"
                            else
                                set Otonot(İndex2) to Notlar(İndex2) + (Puanekle(Notlar(İndex2)) as integer)
                            end if
                            set İndex2 to İndex2 + 1
                        end if
                    end repeat
                    set İndex to 0
                    set İndex2 to 0
                    set Sync to true
                    repeat while Sync
                        if İndex is equal to 5
                            set Sync to false
                        else
                            set İndex to İndex + 1
                            local Cikti
                            
                            if Otoeklenennot(İndex2) is equal to "0"
                                set Cikti to (İndex as string) & ". Öğrencinin; " & (13 ASCII character) & (13 ASCII character) & "Eski Not: " & Notlar(İndex2) & (13 ASCII character) & "Yeni Not: " & Notlar(İndex2) & (13 ASCII character) & "Ek Puan Yok. Not Yeterli."
                            else
                                set Cikti to (İndex as string) & ". Öğrencinin; " & (13 ASCII character) & (13 ASCII character) & "Eski Not: " & Notlar(İndex2) & (13 ASCII character) & "Yeni Not: " & (Otoeklenennot(İndex2) as integer) + Notlar(İndex2) & (13 ASCII character) & "Eklenen Puan: " & Otoeklenennot(İndex2)
                            end if
                            display dialog Cikti
                            Delay(500)
                            set İndex2 to İndex2 + 1
                        end if
                    end repeat
                else
                    if Secim2 is equal to 2
                        set İndex to 0
                        set İndex2 to 0
                        set Sync to false
                        local Sayı1, Sayı2, Sayı3, Sayı4, Sayı5
                        local Soru1, Soru2, Soru3, Soru4, Soru5
                        
                        -- Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                        -- Yaha henüz ben keşfedemedim :p
                        Delay(230)
                        set Soru1 to Puaneklesoru("1", Notlar(İndex2))
                        set İndex2 to İndex2 + 1
                        set Soru2 to Puaneklesoru("2", Notlar(İndex2))
                        set İndex2 to İndex2 + 1
                        set Soru3 to Puaneklesoru("3", Notlar(İndex2))
                        set İndex2 to İndex2 + 1
                        set Soru4 to Puaneklesoru("4", Notlar(İndex2))
                        set İndex2 to İndex2 + 1
                        set Soru5 to Puaneklesoru("5", Notlar(İndex2))
                        Delay(600)
                        set Sync to true
                        local Soruarray
                        
                        set Soruarray(0) to Soru1
                        set Soruarray(1) to Soru2
                        set Soruarray(2) to Soru3
                        set Soruarray(3) to Soru4
                        set Soruarray(4) to Soru5
                        if Soru1 is greater than 100 and Soru1 is less than 0 or Soru2 is greater than 100 and Soru2 is less than 0 or Soru3 is greater than 100 and Soru3 is less than 0 or Soru4 is greater than 100 and Soru4 is less than 0 or Soru5 is greater than 100 and Soru5 is less than 0
                            display dialog "Notların Son Hali 100 ve 0 Arasında Olmalıdır."
                        else
                            set İndex2 to 0
                            set Sayı1 to Soru1 + Notlar(İndex2)
                            set İndex2 to İndex2 + 1
                            set Sayı2 to Soru2 + Notlar(İndex2)
                            set İndex2 to İndex2 + 1
                            set Sayı3 to Soru3 + Notlar(İndex2)
                            set İndex2 to İndex2 + 1
                            set Sayı4 to Soru4 + Notlar(İndex2)
                            set İndex2 to İndex2 + 1
                            set Sayı5 to Soru5 + Notlar(İndex2)
                            set İndex2 to 0
                            set İndex to 0
                            local Sonsayılar
                            
                            set Sonsayılar(0) to Sayı1
                            set Sonsayılar(1) to Sayı2
                            set Sonsayılar(2) to Sayı3
                            set Sonsayılar(3) to Sayı4
                            set Sonsayılar(4) to Sayı5
                            repeat while Sync
                                if İndex is equal to 5
                                    set Sync to false
                                else
                                    set İndex to İndex + 1
                                    display dialog (İndex as string) & ". Öğrencinin; " & (13 ASCII character) & (13 ASCII character) & "Eski Not: " & Notlar(İndex2) & (13 ASCII character) & "Yeni Not: " & Sonsayılar(İndex2) & (13 ASCII character) & "Eklenen Puan: " & Soruarray(İndex2)
                                    Delay(270)
                                    set İndex2 to İndex2 + 1
                                end if
                            end repeat
                        end if
                    else
                        if Secim2 is equal to 1
                            repeat while Sync
                                
                                -- Bu döngü notları belirler.
                                if İndex is equal to 5
                                    set Sync to false
                                    
                                    -- index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                                else
                                    set İndex to İndex + 1
                                    set Notlar(İndex2) to random from 0 to 80 - 1
                                    
                                    -- Random sayı belirle
                                    set İndex2 to İndex2 + 1
                                    
                                    -- 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                                end if
                            end repeat
                            set Sync to true
                            set İndex to 0
                            set İndex2 to 0
                            
                            -- Değişkenleri sıfırlayalım
                            repeat while Sync
                                
                                -- Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                                if İndex is equal to 5
                                    set Sync to false
                                else
                                    set İndex to İndex + 1
                                    set Eskinotlar(İndex2) to Notlar(İndex2)
                                    set Notlar(İndex2) to Notlar(İndex2) + 20
                                    set İndex2 to İndex2 + 1
                                end if
                            end repeat
                            set Sync to true
                            set İndex to 0
                            set İndex2 to 0
                            
                            -- Değişkenleri sıfırlayalım
                            display dialog "Yeni Notlar:"
                            repeat while Sync
                                
                                -- Bu döngü eski ve yeni notları bir arada yazdırır.
                                if İndex is equal to 5
                                    set Sync to false
                                    
                                    -- Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                else
                                    set İndex to İndex + 1
                                    if Notlar(İndex2) is greater than 100
                                        set Notlar(İndex2) to 100
                                        display dialog (İndex as string) & ". Öğrencinin; " & (13 ASCII character) & (13 ASCII character) & "Eski Not: " & Eskinotlar(İndex2) & (13 ASCII character) & "Yeni Not: " & Notlar(İndex2)
                                    else
                                        display dialog (İndex as string) & ". Öğrencinin; " & (13 ASCII character) & (13 ASCII character) & "Eski Not: " & Eskinotlar(İndex2) & (13 ASCII character) & "Yeni Not: " & Notlar(İndex2)
                                    end if
                                    
                                    -- 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                    Delay(500)
                                    
                                    -- 500 Milisaniyelik Gecikme
                                    set İndex2 to İndex2 + 1
                                end if
                            end repeat
                        else
                            display dialog "Lütfen 1, 2 veya 3 yazınız."
                            Delay(1000)
                            display dialog "Program Kapatılıyor.."
                            set İndex to 3
                            repeat while Sync
                                if İndex is equal to 0
                                    set Sync to false
                                else
                                    Delay(1000)
                                    display dialog (İndex as string) & ".."
                                    set İndex to İndex - 1
                                end if
                                
                                -- Programın Kapatılması İçin Sayaç Oluştur
                            end repeat
                        end if
                    end if
                end if
            end if
        else
            local Helpnum, Helpnum2
            local Loop, Loop2
            
            if Secim is equal to "a" or Secim is equal to "A"
                display dialog "1) Otomatik Mod Hakkında Yardım" & (13 ASCII character) & "2) Manuel Mod Hakkında Yardım"
                display dialog "Enter a value for Helpnum" default answer "" buttons {"ok"} with title "Enter a value"
                set Helpnum to the text returned of the result
                Delay(200)
                
                -- Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                set Loop to Yardımloop(Helpnum)
                Delay(200)
                if Loop is equal to 1
                    display dialog "Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar."
                    Delay(7800)
                    display dialog "Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır."
                    Delay(9000)
                    display dialog "Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır."
                else
                    display dialog "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" & (13 ASCII character) & "2) Manuel Puan Ekleme Hakkında Yardım" & (13 ASCII character) & "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"
                    display dialog "Enter a value for Helpnum2" default answer "" buttons {"ok"} with title "Enter a value"
                    set Helpnum2 to the text returned of the result
                    Delay(200)
                    set Loop2 to Yardımloop2(Helpnum2)
                    Delay(200)
                    if Loop2 is equal to 1
                        display dialog "Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler."
                    else
                        if Loop2 is equal to 2
                            display dialog "Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar."
                            Delay(7800)
                            display dialog "Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır."
                        else
                            display dialog "Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır."
                            Delay(4500)
                            display dialog "Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır."
                            Delay(4500)
                            display dialog "Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar."
                            Delay(8000)
                            display dialog "Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır."
                        end if
                    end if
                end if
            else
                display dialog "Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!"
            end if
        end if
    end if
    
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
end run

to Delay(Sn)
    -- Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    local Sonuc
    local Ms
    
    set Ms to Sn * 33
    local n
    
    set n to 0
    repeat while n isn't equal to Ms
        set n to n + 1
    end repeat
    set Sonuc to true
    
    -- Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
    -- boolen test
    -- test = delay(200)
    -- çıktı test  // true
    
    return Sonuc
end Delay

to Puanekle(Puan)
    local Sonuc
    local Ekpuan
    local İndex, İndex2
    local Sync
    
    -- while döngüsü için
    set Sync to true
    set İndex to 0
    if Puan is greater than 89
        set Sonuc to "pass"
        
        -- 90 ve üstü notlar için puan ekleme olmaz.
    else
        if Puan is greater than 69
            set İndex2 to 5
            repeat while Sync
                if İndex is equal to 6
                    set Sync to false
                else
                    set Ekpuan(İndex) to İndex2
                    set İndex to İndex + 1
                    set İndex2 to İndex2 + 1
                end if
            end repeat
            set Sonuc to Ekpuan(random from 0 to 6 - 1) as string
            
            -- Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
        else
            if Puan is greater than 49
                set İndex2 to 10
                repeat while Sync
                    if İndex is equal to 9
                        set Sync to false
                    else
                        set Ekpuan(İndex) to İndex2
                        set İndex to İndex + 1
                        set İndex2 to İndex2 + 1
                    end if
                end repeat
                set Sonuc to Ekpuan(random from 0 to 9 - 1) as string
                
                -- Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
            else
                if Puan is greater than 29
                    set İndex2 to 20
                    repeat while Sync
                        if İndex is equal to 10
                            set Sync to false
                        else
                            set Ekpuan(İndex) to İndex2
                            set İndex to İndex + 1
                            set İndex2 to İndex2 + 1
                        end if
                    end repeat
                    set Sonuc to Ekpuan(random from 0 to 10 - 1) as string
                    
                    -- Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                else
                    set İndex2 to 30
                    repeat while Sync
                        if İndex is equal to 11
                            set Sync to false
                        else
                            set Ekpuan(İndex) to İndex2
                            set İndex to İndex + 1
                            set İndex2 to İndex2 + 1
                        end if
                    end repeat
                    set Sonuc to Ekpuan(random from 0 to 11 - 1) as string
                    
                    -- Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                end if
            end if
        end if
    end if
    
    -- String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
    -- var sayı = 0.65   // Javascript
    -- sayı = 0.65          // Python
    -- local sayı = 0.65          // Lua
    -- int sayı = 0.65     // C
    
    return Sonuc
end Puanekle

to Puaneklesoru(No, Eskinot)
    local Sonuc
    
    display dialog No & ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " & (13 ASCII character) & (13 ASCII character) & "Öğrencinin Puanı: " & Eskinot
    display dialog "Enter a value for Sonuc" default answer "" buttons {"ok"} with title "Enter a value"
    set Sonuc to the text returned of the result
    
    return Sonuc
end Puaneklesoru

to Yardımloop(Sayı)
    local Sonuc
    
    if Sayı is equal to 1 or Sayı is equal to 2
    else
        display dialog "Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." & (13 ASCII character) & "Yeniden Başlatılıyor.."
        Delay(1000)
        display dialog "1) Otomatik Mod Hakkında Yardım" & (13 ASCII character) & "2) Manuel Mod Hakkında Yardım"
        display dialog "Enter a value for Sayı" default answer "" buttons {"ok"} with title "Enter a value"
        set Sayı to the text returned of the result
        Yardımloop(Sayı)
    end if
    
    -- Yardım Modülü İçin
    -- Yanlış değer girildiğinde baştan başlatır
    set Sonuc to Sayı
    
    return Sonuc
end Yardımloop

to Yardımloop2(Sayı)
    local Sonuc
    
    if Sayı is equal to 1 or Sayı is equal to 2 or Sayı is equal to 3
    else
        display dialog "Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." & (13 ASCII character) & "Yeniden Başlatılıyor.."
        Delay(1000)
        display dialog "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" & (13 ASCII character) & "2) Manuel Puan Ekleme Hakkında Yardım" & (13 ASCII character) & "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"
        display dialog "Enter a value for Sayı" default answer "" buttons {"ok"} with title "Enter a value"
        set Sayı to the text returned of the result
        Yardımloop2(Sayı)
    end if
    set Sonuc to Sayı
    
    return Sonuc
end Yardımloop2
