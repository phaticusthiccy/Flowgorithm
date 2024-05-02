include Math

def delay(sn)
    # Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    ms = sn * 33
    n = 0
    while n != ms
        n = n + 1
    end
    sonuc = true
    
    # Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
    # boolen test
    # test = delay(200)
    # çıktı test  // true
    
    return sonuc
end

def puanekle(puan)
    ekpuan = Array.new(20)
    
    # while döngüsü için
    sync = true
    index = 0
    if puan > 89
        sonuc = "pass"
        
        # 90 ve üstü notlar için puan ekleme olmaz.
    else
        if puan > 69
            index2 = 5
            while sync
                if index == 6
                    sync = false
                else
                    ekpuan[index] = index2
                    index = index + 1
                    index2 = index2 + 1
                end
            end
            sonuc = ekpuan[Random.rand(6)].to_s
            
            # Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
        else
            if puan > 49
                index2 = 10
                while sync
                    if index == 9
                        sync = false
                    else
                        ekpuan[index] = index2
                        index = index + 1
                        index2 = index2 + 1
                    end
                end
                sonuc = ekpuan[Random.rand(9)].to_s
                
                # Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
            else
                if puan > 29
                    index2 = 20
                    while sync
                        if index == 10
                            sync = false
                        else
                            ekpuan[index] = index2
                            index = index + 1
                            index2 = index2 + 1
                        end
                    end
                    sonuc = ekpuan[Random.rand(10)].to_s
                    
                    # Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                else
                    index2 = 30
                    while sync
                        if index == 11
                            sync = false
                        else
                            ekpuan[index] = index2
                            index = index + 1
                            index2 = index2 + 1
                        end
                    end
                    sonuc = ekpuan[Random.rand(11)].to_s
                    
                    # Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                end
            end
        end
    end
    
    # String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
    # var sayı = 0.65   // Javascript
    # sayı = 0.65          // Python
    # local sayı = 0.65          // Lua
    # int sayı = 0.65     // C
    
    return sonuc
end

def puaneklesoru(no, eskinot)
    puts no + ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " + 13.chr + 13.chr + "Öğrencinin Puanı: " + eskinot.to_s
    sonuc = gets.chomp.to_i
    
    return sonuc
end

def yardımloop(sayı)
    if sayı == 1 || sayı == 2
    else
        puts "Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." + 13.chr + "Yeniden Başlatılıyor.."
        delay(1000)
        puts "1) Otomatik Mod Hakkında Yardım" + 13.chr + "2) Manuel Mod Hakkında Yardım"
        sayı = gets.chomp.to_i
        yardımloop(sayı)
    end
    
    # Yardım Modülü İçin
    # Yanlış değer girildiğinde baştan başlatır
    sonuc = sayı
    
    return sonuc
end

def yardımloop2(sayı)
    if sayı == 1 || sayı == 2 || sayı == 3
    else
        puts "Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." + 13.chr + "Yeniden Başlatılıyor.."
        delay(1000)
        puts "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + 13.chr + "2) Manuel Puan Ekleme Hakkında Yardım" + 13.chr + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"
        sayı = gets.chomp.to_i
        yardımloop2(sayı)
    end
    sonuc = sayı
    
    return sonuc
end

# Main
sync = true
index = 0
index2 = 0
notlar = Array.new(5)
eskinotlar = Array.new(5)
otonot = Array.new(20)
otoeklenennot = Array.new(15)

puts "Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" + 13.chr + 13.chr + "Otomatik için: 'O'" + 13.chr + "Manuel için: 'M'" + 13.chr + "Yazın" + 13.chr + 13.chr + "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın"
secim = gets.chomp
if secim == "O" || secim == "o"
    while sync
        
        # Bu döngü notları belirler.
        if index == 5
            sync = false
            
            # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
        else
            index = index + 1
            notlar[index2] = Random.rand(80)
            
            # Random sayı belirle
            index2 = index2 + 1
            
            # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
        end
    end
    sync = true
    index = 0
    index2 = 0
    
    # Değişkenleri sıfırlayalım
    while sync
        
        # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
        if index == 5
            sync = false
        else
            index = index + 1
            eskinotlar[index2] = notlar[index2]
            notlar[index2] = notlar[index2] + 20
            index2 = index2 + 1
        end
    end
    sync = true
    index = 0
    index2 = 0
    
    # Değişkenleri sıfırlayalım
    puts "Yeni Notlar:"
    while sync
        
        # Bu döngü eski ve yeni notları bir arada yazdırır.
        if index == 5
            sync = false
            
            # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
        else
            index = index + 1
            puts index.to_s + ". Öğrencinin; " + 13.chr + 13.chr + "Eski Not: " + eskinotlar[index2].to_s + 13.chr + "Yeni Not: " + notlar[index2].to_s
            delay(500)
            
            # 500 Milisaniyelik Gecikme
            index2 = index2 + 1
        end
    end
else
    if secim == "M" || secim == "m"
        puts "1. Öğrencinin Notunu Giriniz: "
        notlar[0] = gets.chomp.to_i
        puts "2. Öğrencinin Notunu Giriniz: "
        notlar[1] = gets.chomp.to_i
        puts "3. Öğrencinin Notunu Giriniz: "
        notlar[2] = gets.chomp.to_i
        puts "4. Öğrencinin Notunu Giriniz: "
        notlar[3] = gets.chomp.to_i
        puts "5. Öğrencinin Notunu Giriniz: "
        notlar[4] = gets.chomp.to_i
        delay(800)
        devam = true
        index = 0
        index2 = 0
        while sync
            if index == 5
                sync = false
            else
                index = index + 1
                if notlar[index2] > 100
                    sync = false
                    devam = false
                else
                    if notlar[index2] < 0
                        sync = false
                        devam = false
                    else
                        index2 = index2 + 1
                    end
                end
            end
        end
        if not devam
            puts "Notlar 100 ve 0 Arasında Olmalıdır."
        else
            puts "Size 3 Seçenek Sunuyoruz:" + 13.chr + 13.chr + "1) Herkesin Notuna +20 Puan Ekle" + 13.chr + "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" + 13.chr + "3) Sistem'in Kendi Not Ekleme Aracını Kullan"
            secim2 = gets.chomp.to_i
            if secim2 == 3
                delay(59)
                index = 0
                index2 = 0
                sync = true
                while sync
                    if index == 5
                        sync = false
                    else
                        index = index + 1
                        otoeklenennot[index2] = puanekle(notlar[index2])
                        
                        # Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                        delay(59)
                        if otoeklenennot[index2] == "pass"
                            otoeklenennot[index2] = "0"
                        else
                            otonot[index2] = notlar[index2] + puanekle(notlar[index2]).to_i
                        end
                        index2 = index2 + 1
                    end
                end
                index = 0
                index2 = 0
                sync = true
                while sync
                    if index == 5
                        sync = false
                    else
                        index = index + 1
                        if otoeklenennot[index2] == "0"
                            cikti = index.to_s + ". Öğrencinin; " + 13.chr + 13.chr + "Eski Not: " + notlar[index2].to_s + 13.chr + "Yeni Not: " + notlar[index2].to_s + 13.chr + "Ek Puan Yok. Not Yeterli."
                        else
                            cikti = index.to_s + ". Öğrencinin; " + 13.chr + 13.chr + "Eski Not: " + notlar[index2].to_s + 13.chr + "Yeni Not: " + otoeklenennot[index2].to_i + notlar[index2].to_s + 13.chr + "Eklenen Puan: " + otoeklenennot[index2]
                        end
                        puts cikti
                        delay(500)
                        index2 = index2 + 1
                    end
                end
            else
                if secim2 == 2
                    index = 0
                    index2 = 0
                    sync = false
                    
                    # Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                    # Yaha henüz ben keşfedemedim :p
                    delay(230)
                    soru1 = puaneklesoru("1", notlar[index2])
                    index2 = index2 + 1
                    soru2 = puaneklesoru("2", notlar[index2])
                    index2 = index2 + 1
                    soru3 = puaneklesoru("3", notlar[index2])
                    index2 = index2 + 1
                    soru4 = puaneklesoru("4", notlar[index2])
                    index2 = index2 + 1
                    soru5 = puaneklesoru("5", notlar[index2])
                    delay(600)
                    sync = true
                    soruarray = Array.new(5)
                    
                    soruarray[0] = soru1
                    soruarray[1] = soru2
                    soruarray[2] = soru3
                    soruarray[3] = soru4
                    soruarray[4] = soru5
                    if soru1 > 100 && soru1 < 0 || soru2 > 100 && soru2 < 0 || soru3 > 100 && soru3 < 0 || soru4 > 100 && soru4 < 0 || soru5 > 100 && soru5 < 0
                        puts "Notların Son Hali 100 ve 0 Arasında Olmalıdır."
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
                        index = 0
                        sonsayılar = Array.new(5)
                        
                        sonsayılar[0] = sayı1
                        sonsayılar[1] = sayı2
                        sonsayılar[2] = sayı3
                        sonsayılar[3] = sayı4
                        sonsayılar[4] = sayı5
                        while sync
                            if index == 5
                                sync = false
                            else
                                index = index + 1
                                puts index.to_s + ". Öğrencinin; " + 13.chr + 13.chr + "Eski Not: " + notlar[index2].to_s + 13.chr + "Yeni Not: " + sonsayılar[index2].to_s + 13.chr + "Eklenen Puan: " + soruarray[index2].to_s
                                delay(270)
                                index2 = index2 + 1
                            end
                        end
                    end
                else
                    if secim2 == 1
                        while sync
                            
                            # Bu döngü notları belirler.
                            if index == 5
                                sync = false
                                
                                # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                            else
                                index = index + 1
                                notlar[index2] = Random.rand(80)
                                
                                # Random sayı belirle
                                index2 = index2 + 1
                                
                                # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                            end
                        end
                        sync = true
                        index = 0
                        index2 = 0
                        
                        # Değişkenleri sıfırlayalım
                        while sync
                            
                            # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                            if index == 5
                                sync = false
                            else
                                index = index + 1
                                eskinotlar[index2] = notlar[index2]
                                notlar[index2] = notlar[index2] + 20
                                index2 = index2 + 1
                            end
                        end
                        sync = true
                        index = 0
                        index2 = 0
                        
                        # Değişkenleri sıfırlayalım
                        puts "Yeni Notlar:"
                        while sync
                            
                            # Bu döngü eski ve yeni notları bir arada yazdırır.
                            if index == 5
                                sync = false
                                
                                # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                            else
                                index = index + 1
                                if notlar[index2] > 100
                                    notlar[index2] = 100
                                    puts index.to_s + ". Öğrencinin; " + 13.chr + 13.chr + "Eski Not: " + eskinotlar[index2].to_s + 13.chr + "Yeni Not: " + notlar[index2].to_s
                                else
                                    puts index.to_s + ". Öğrencinin; " + 13.chr + 13.chr + "Eski Not: " + eskinotlar[index2].to_s + 13.chr + "Yeni Not: " + notlar[index2].to_s
                                end
                                
                                # 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                delay(500)
                                
                                # 500 Milisaniyelik Gecikme
                                index2 = index2 + 1
                            end
                        end
                    else
                        puts "Lütfen 1, 2 veya 3 yazınız."
                        delay(1000)
                        puts "Program Kapatılıyor.."
                        index = 3
                        while sync
                            if index == 0
                                sync = false
                            else
                                delay(1000)
                                puts index.to_s + ".."
                                index = index - 1
                            end
                            
                            # Programın Kapatılması İçin Sayaç Oluştur
                        end
                    end
                end
            end
        end
    else
        if secim == "a" || secim == "A"
            puts "1) Otomatik Mod Hakkında Yardım" + 13.chr + "2) Manuel Mod Hakkında Yardım"
            helpnum = gets.chomp.to_i
            delay(200)
            
            # Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
            loop = yardımloop(helpnum)
            delay(200)
            if loop == 1
                puts "Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar."
                delay(7800)
                puts "Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır."
                delay(9000)
                puts "Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır."
            else
                puts "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + 13.chr + "2) Manuel Puan Ekleme Hakkında Yardım" + 13.chr + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"
                helpnum2 = gets.chomp.to_i
                delay(200)
                loop2 = yardımloop2(helpnum2)
                delay(200)
                if loop2 == 1
                    puts "Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler."
                else
                    if loop2 == 2
                        puts "Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar."
                        delay(7800)
                        puts "Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır."
                    else
                        puts "Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır."
                        delay(4500)
                        puts "Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır."
                        delay(4500)
                        puts "Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar."
                        delay(8000)
                        puts "Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır."
                    end
                end
            end
        else
            puts "Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!"
        end
    end
end

# 2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır.
# 
# Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir.
# Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer.
# 
# 1. İşlem: Seçilen Notların Hepine 20 Puan Ekle
# 2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler
# 3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar.
# 
# 3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir.
