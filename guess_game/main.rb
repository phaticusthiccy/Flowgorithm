include Math

def delay(sn)
    # Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
    # setTimeout()
    # time.sleep()
    # gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
    ms = sn * 30000
    
    # 1 Saniye ≊ 30.000 Sayım
    # 1 Sayım = 3,14e-5
    n = 0
    while n < ms
        n = n + 1
    end
    payload = true
    
    return payload
end

def exit()
    # Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
    # Bu fonskiyon hiçbir şekilde pas geçilemez.
    # Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
    begin
    end while true
    
    return ex
end

def logger(type, this)
    # Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
    # 
    # Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
    if type == "int"
        puts this.to_i
        payload = true
    else
        if type == "str"
            puts this.to_s
            payload = true
        else
            if type == "bool"
                payload = this
            else
                
                # Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                # Program durdurulur.
                # process.exit()
                exit()
            end
        end
    end
    
    # logger("str", "test")  =>  String İçin
    # logger("int", "190")  =>  Sayı İçin
    # logger("bool", true)  => true-false için
    
    return payload
end

def namecorrection(name)
    if name.length < 3
        logger("str", "İsminiz 3 kelimeden kısa olmamalı." + 13.chr + "Lütfen programı baştan başlatın.")
        exit()
    else
        payload = true
    end
    
    # Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
    
    return payload
end

def plugins(type, arg)
    # Program içindeki çeşitlilik için gerekli fonksiyon.
    # Fonksiyon karmaşası olmaması için kısaltıldı.
    str = Array.new(10)
    
    if type == "ask name"
        str[0] = "Oyuna Hoşgeldin Yabancı!" + 13.chr + "Lütfen Adını Gir:"
        str[1] = "Hey, Merhaba Yabacı :)" + 13.chr + "Lütfen İsmini Yazar mısın?"
        str[2] = "Yeni bir oyuncu. Yaşasınn!" + 13.chr + "Adını söylermisin lütfen.."
        str[3] = "Oyunda Yeni Bir Katılımcı Var!" + 13.chr + "Lütfen İsmini Gir:"
        str[4] = "İşte yeni bir oyuncu daha!" + 13.chr + "Sana nasıl hitap etmemi istersin?"
        str[5] = "Seni daha önce buralarda görmedim.." + 13.chr + "Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle."
        str[6] = "Oyuna Hoşgeldin!" + 13.chr + "Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz."
        payload = str[Random.rand(7)]
    else
        if type == "after name"
            str[0] = "Merhaba " + arg + 13.chr + "Oyunun kuralları şunlardır:" + 13.chr + "1) Sistem 0-100 arasında sayı seçer." + 13.chr + "2) Sayıyı tahmin etmeye çalışırsın" + 13.chr + "3) Toplam 10 adet başarısız denemeden sonra oyun biter." + 13.chr + "4) Sayı bulunursa oyun kazanılır!"
            payload = str[0]
        else
            if type == "game mode"
                str[0] = "Lütfen Oyun Modunu Seç" + 13.chr + 13.chr + "1) Kolay (Sıcak-Soğuk Mantığı)" + 13.chr + "2) Normal (Yönergeler Yok)" + 13.chr + "3) İşleyiş Hakkında Bilgi Al"
                payload = str[0]
            else
                if type == "wmode"
                    str[0] = "Lütfen Sadece 1 veya 2 Yazın"
                    str[1] = "Yanlış Seçim! Sadece 1 veya 2 yazın!"
                    payload = str[Random.rand(2)]
                else
                    if type == "get num"
                        str[0] = "Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! " + arg
                        str[1] = "Tuttum! Hadi Başlayalım :)"
                        str[2] = "Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans " + arg + " :)"
                        payload = str[Random.rand(3)]
                    else
                        if type == "think"
                            str[0] = "Tahminin?"
                            str[1] = "Sence ne olabilir " + arg + "?"
                            str[2] = "Bi fikrin varmı?"
                            str[3] = "Tahminin için bekliyorum " + arg
                            str[4] = "İyi düşün ve öyle karar ver.."
                            str[5] = "Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                            str[6] = "Şansını boşa harcama " + arg
                            str[7] = "Sakın yanlış tahin ediyim deme haa"
                            str[8] = "Hadi sıra sende " + arg
                            payload = str[Random.rand(9)]
                        else
                            if type == "wthink"
                                str[0] = "Yanlış! Tahminin?"
                                str[1] = "Bu Değil. Sence ne olabilir " + arg + "?"
                                str[2] = "Sayı bu değil. Bi fikrin varmı?"
                                str[3] = "Yeniden.. Tahminin için bekliyorum " + arg
                                str[4] = "Şimdi iyi düşün ve öyle karar ver.."
                                str[5] = "Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                                str[6] = "Şansını boşa harcama " + arg
                                str[7] = "Ah be abi. Sakın yanlış tahin ediyim deme haa"
                                str[8] = "Tekrardan.. Hadi sıra sende " + arg
                                payload = str[Random.rand(9)]
                            else
                                if type == "sthink"
                                    str[0] = "Hey, hey! Bu son hakkın. Dikkatli Ol!"
                                    str[1] = "Dur Biraz! Bu Son Şansın. İyi Kullan " + arg
                                    str[2] = "Kader Anı! Oyunu kazanman için son şans!"
                                    str[3] = "Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin " + arg
                                    str[4] = "Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı.."
                                    payload = str[Random.rand(5)]
                                else
                                    if type == "win"
                                        str[0] = "[+] Kazandın!!!" + 13.chr + "İşte Buuu! Nasılda tahmin ettin *o*" + 13.chr + 13.chr + "Bir sonraki oyunda görüşmek üzere.."
                                        str[1] = "[+] Tebrikler " + arg + "." + 13.chr + "Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın." + 13.chr + "Bir sonraki oyununda başarılar."
                                        str[2] = "[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)" + 13.chr + "Bir oyuna daha var mısın.."
                                        str[3] = "[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum." + 13.chr + "Sonraki oyunlarda görüşmek dileğiyle.."
                                        str[4] = "[+] İyi iş çıkardın " + arg + 13.chr + "Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \\'_'/"
                                        payload = str[Random.rand(5)]
                                    else
                                        if type == "swin"
                                            str[0] = "[⁂] İnanılmaz.. Tek Kelime İle Şahane!"
                                            str[1] = "[⁂] Ne.. Bu kadar hızlı yenilemem.."
                                            str[2] = "[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim.."
                                            str[3] = "[⁂] Sen..? Nasıl..? Hile mi yapıyosun??"
                                            str[4] = "[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?"
                                            payload = str[Random.rand(5)]
                                        else
                                            if type == "lose"
                                                str[0] = "[-] Üzgünüm, Oyunu Kaybettiniz."
                                                str[1] = "[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın.."
                                                str[2] = "[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin."
                                                str[3] = "[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın."
                                                str[4] = "[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez.."
                                                payload = str[Random.rand(5)]
                                            else
                                                if type == "cold"
                                                    str[0] = "↘                ↙" + 13.chr + " Soğuk" + 13.chr + "↗                ↖"
                                                    payload = str[0]
                                                else
                                                    if type == "warm"
                                                        str[0] = "↘                ↙" + 13.chr + "  Ilık" + 13.chr + "↗                ↖"
                                                        payload = str[0]
                                                    else
                                                        if type == "hot"
                                                            str[0] = "↘                ↙" + 13.chr + " Sıcak" + 13.chr + "↗                ↖"
                                                            payload = str[0]
                                                        else
                                                            if type == "info"
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
                                                                payload = str[arg.to_i]
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
    
    # prototip => plugins(<str>, <str>)
    # Örnek:
    # plugins("ask name", " ")
    # plugins("after name", "İsim")
    
    return payload
end

def func_rand(type)
    index = Array.new(101)
    
    # 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
    # 
    # var dizin = ["bir", "iki", "üç"]
    # return dizin[0]     // "bir"
    if not type
        payload = Random.rand(101)
        
        # Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
        # Değişken kontrolü için;
        # rand(true)
        # 
        # Direk işlem için;
        # rand(false)
        # 
        # kullanın.
        if payload == 0
            func_rand(false)
        end
    else
        
        # Bu kısım değişken kontrolü yapmak isteyenler içindir.
        num = 0
        begin
            index[num] = num
            num = num + 1
        end while num < 101
        
        # do döngüsü kullanılır.
        opt = Random.rand(101)
        payload = index[opt]
        if payload == 0
            func_rand(true)
        end
    end
    
    # İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
    # Çıkış int (Tamsayı) olarak döner.
    
    return payload
end

# Main
logger("str", plugins("ask name", ""))
delay(2)
name = gets.chomp
namecorrection(name)
delay(2)

# İsim Alma Kısmı Tamamlandı
logger("str", plugins("after name", name))
delay(9)
logger("str", plugins("game mode", ""))
mode = gets.chomp.to_i

# Oyun Modu Başarıyla Seçildi
if mode == 1 || mode == 2
    if mode == 1
        
        # Kolay Oyun Modu
        index = 0
        index2 = 0
        sync = true
        number = func_rand(true)
        logger("str", plugins("get num", name))
        delay(2)
        
        # Sayı Belirlendi
        while sync
            if index == 10
                find = false
                sync = false
                
                # 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
            else
                index2 = index2 + 1
                index = index + 1
                if index == 1
                    
                    # İlk başlama mesajı
                    logger("str", plugins("think", name))
                else
                    
                    # Sonraki başlama mesajları
                    if index == 10
                        
                        # Son tahmin hakkı için bilgilendirme mesajı
                        logger("str", plugins("sthink", name))
                        delay(3.5)
                    else
                        
                        # Yanlış tahminler için bilgilendirme mesajı
                        logger("str", plugins("wthink", name))
                    end
                end
                think = gets.chomp.to_i
                if think == number
                    
                    # Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                    find = true
                    sync = false
                else
                    delay(1)
                    if index == 10
                    else
                        if think > number
                            
                            # Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                            if think - number > 25
                                
                                # Tahmin, sayıdan uzak ise bunu gönder
                                logger("str", plugins("cold", ""))
                            else
                                if think - number > 15
                                    
                                    # Tahmin, sayıya biraz yakın ise bunu gönder
                                    logger("str", plugins("warm", ""))
                                else
                                    
                                    # Tahmin, sayıya çok yakın ise bunu gönder
                                    logger("str", plugins("hot", ""))
                                end
                            end
                        else
                            
                            # Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                            if number - think > 25
                                
                                # Tahmin, sayıdan uzak ise bunu gönder
                                logger("str", plugins("cold", ""))
                            else
                                if number - think > 15
                                    
                                    # Tahmin, sayıya biraz yakın ise bunu gönder
                                    logger("str", plugins("warm", ""))
                                else
                                    
                                    # Tahmin, sayıya çok yakın ise bunu gönder
                                    logger("str", plugins("hot", ""))
                                end
                            end
                        end
                    end
                end
            end
        end
        if find
            
            # Oyun Kazanıldığında Buraya Dön
            if index2 < 4
                
                # Sayı hemen tahmin edilirse ek mesaj gönder
                logger("str", plugins("swin", name))
                delay(1)
                logger("str", plugins("win", name))
                delay(2)
                logger("str", index2.to_s + ". Denemede Oyunu Kazandınız!")
            else
                
                # Klasik tebrik mesajı
                logger("str", plugins("win", name))
                delay(2)
                logger("str", index2.to_s + ". Denemede Oyunu Kazandınız!")
            end
        else
            
            # Oyun Kaybedildiğinde Buraya Dön
            logger("str", plugins("lose", name))
            delay(2)
            logger("str", "Bir kez daha oynamak için 1 yazman yeterli.")
            name = gets.chomp
            if name == "1"
                
                # Program kapanmadan bir kez daha oynama hakkı verir.
                main()
            end
        end
    else
        
        # Normal Oyun Modu
        index = 0
        index2 = 0
        sync = true
        number = func_rand(false)
        logger("str", plugins("get num", name))
        delay(2)
        
        # Sayı Belirlendi
        while sync
            if index == 10
                find = false
                sync = false
                
                # 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
            else
                index2 = index2 + 1
                index = index + 1
                if index == 1
                    
                    # İlk başlama mesajı
                    logger("str", plugins("think", name))
                else
                    
                    # Sonraki başlama mesajları
                    if index == 10
                        
                        # Son tahmin hakkı için bilgilendirme mesajı
                        logger("str", plugins("sthink", name))
                        delay(3.5)
                    else
                        
                        # Yanlış tahminler için bilgilendirme mesajı
                        logger("str", plugins("wthink", name))
                    end
                end
                think = gets.chomp.to_i
                if think == number
                    
                    # Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                    find = true
                    sync = false
                else
                    
                    # Tahmin Yanlış İse Döngüyü Yeniden Başlat
                end
            end
        end
        if find
            
            # Oyun Kazanıldığında Buraya Dön
            if index2 < 4
                
                # Sayı hemen tahmin edilirse ek mesaj gönder
                logger("str", plugins("swin", name))
                delay(1)
                logger("str", plugins("win", name))
                delay(2)
                logger("str", index2.to_s + ". Denemede Oyunu Kazandınız!")
            else
                
                # Klasik tebrik mesajı
                logger("str", plugins("win", name))
                delay(2)
                logger("str", index2.to_s + ". Denemede Oyunu Kazandınız!")
            end
        else
            
            # Oyun Kaybedildiğinde Buraya Dön
            logger("str", plugins("lose", name))
            delay(2)
            logger("str", "Bir kez daha oynamak için 1 yazman yeterli.")
            name = gets.chomp
            if name == "1"
                
                # Program kapanmadan bir kez daha oynama hakkı verir.
                main()
            end
        end
    end
else
    if mode == 3
        
        # Bilgilendirme Mesajı
        number = 0
        begin
            logger("str", plugins("info", number.to_s))
            delay(4)
            number = number + 1
        end while number != 10
        
        # do Dögüsü kullanmak en iyi seçenek olacaktır
    else
        logger("str", plugins("wmode", ""))
    end
end
