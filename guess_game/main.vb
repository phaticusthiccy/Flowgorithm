Imports System

Public Module MyProgram
    Private random as new Random()
    
    Sub Main
        Dim sync As Boolean, find As Boolean
        Dim name As String
        Dim mode As Integer, number As Integer
        
        Logger("str", Plugins("ask name", ""))
        Delay(2)
        name = Console.ReadLine()
        Namecorrection(name)
        Delay(2)
        
        ' İsim Alma Kısmı Tamamlandı
        Logger("str", Plugins("after name", name))
        Delay(9)
        Logger("str", Plugins("game mode", ""))
        mode = readValue()
        
        ' Oyun Modu Başarıyla Seçildi
        If mode = 1 Or mode = 2 Then
            If mode = 1 Then
                
                ' Kolay Oyun Modu
                Dim index As Integer, index2 As Integer, think As Integer
                
                index = 0
                index2 = 0
                sync = True
                number = Rand(True)
                Logger("str", Plugins("get num", name))
                Delay(2)
                
                ' Sayı Belirlendi
                Do While sync
                    If index = 10 Then
                        find = False
                        sync = False
                        
                        ' 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                    Else
                        index2 = index2 + 1
                        index = index + 1
                        If index = 1 Then
                            
                            ' İlk başlama mesajı
                            Logger("str", Plugins("think", name))
                        Else
                            
                            ' Sonraki başlama mesajları
                            If index = 10 Then
                                
                                ' Son tahmin hakkı için bilgilendirme mesajı
                                Logger("str", Plugins("sthink", name))
                                Delay(3.5)
                            Else
                                
                                ' Yanlış tahminler için bilgilendirme mesajı
                                Logger("str", Plugins("wthink", name))
                            End If
                        End If
                        think = readValue()
                        If think = number Then
                            
                            ' Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                            find = True
                            sync = False
                        Else
                            Delay(1)
                            If index = 10 Then
                            Else
                                If think > number Then
                                    
                                    ' Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                                    If think - number > 25 Then
                                        
                                        ' Tahmin, sayıdan uzak ise bunu gönder
                                        Logger("str", Plugins("cold", ""))
                                    Else
                                        If think - number > 15 Then
                                            
                                            ' Tahmin, sayıya biraz yakın ise bunu gönder
                                            Logger("str", Plugins("warm", ""))
                                        Else
                                            
                                            ' Tahmin, sayıya çok yakın ise bunu gönder
                                            Logger("str", Plugins("hot", ""))
                                        End If
                                    End If
                                Else
                                    
                                    ' Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                                    If number - think > 25 Then
                                        
                                        ' Tahmin, sayıdan uzak ise bunu gönder
                                        Logger("str", Plugins("cold", ""))
                                    Else
                                        If number - think > 15 Then
                                            
                                            ' Tahmin, sayıya biraz yakın ise bunu gönder
                                            Logger("str", Plugins("warm", ""))
                                        Else
                                            
                                            ' Tahmin, sayıya çok yakın ise bunu gönder
                                            Logger("str", Plugins("hot", ""))
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If
                Loop
                If find Then
                    
                    ' Oyun Kazanıldığında Buraya Dön
                    If index2 < 4 Then
                        
                        ' Sayı hemen tahmin edilirse ek mesaj gönder
                        Logger("str", Plugins("swin", name))
                        Delay(1)
                        Logger("str", Plugins("win", name))
                        Delay(2)
                        Logger("str", index2 & ". Denemede Oyunu Kazandınız!")
                    Else
                        
                        ' Klasik tebrik mesajı
                        Logger("str", Plugins("win", name))
                        Delay(2)
                        Logger("str", index2 & ". Denemede Oyunu Kazandınız!")
                    End If
                Else
                    
                    ' Oyun Kaybedildiğinde Buraya Dön
                    Logger("str", Plugins("lose", name))
                    Delay(2)
                    Logger("str", "Bir kez daha oynamak için 1 yazman yeterli.")
                    name = Console.ReadLine()
                    If name = "1" Then
                        
                        ' Program kapanmadan bir kez daha oynama hakkı verir.
                        Main()
                    End If
                End If
            Else
                
                ' Normal Oyun Modu
                Dim index As Integer, index2 As Integer, think As Integer
                
                index = 0
                index2 = 0
                sync = True
                number = Rand(False)
                Logger("str", Plugins("get num", name))
                Delay(2)
                
                ' Sayı Belirlendi
                Do While sync
                    If index = 10 Then
                        find = False
                        sync = False
                        
                        ' 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                    Else
                        index2 = index2 + 1
                        index = index + 1
                        If index = 1 Then
                            
                            ' İlk başlama mesajı
                            Logger("str", Plugins("think", name))
                        Else
                            
                            ' Sonraki başlama mesajları
                            If index = 10 Then
                                
                                ' Son tahmin hakkı için bilgilendirme mesajı
                                Logger("str", Plugins("sthink", name))
                                Delay(3.5)
                            Else
                                
                                ' Yanlış tahminler için bilgilendirme mesajı
                                Logger("str", Plugins("wthink", name))
                            End If
                        End If
                        think = readValue()
                        If think = number Then
                            
                            ' Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                            find = True
                            sync = False
                        Else
                            
                            ' Tahmin Yanlış İse Döngüyü Yeniden Başlat
                        End If
                    End If
                Loop
                If find Then
                    
                    ' Oyun Kazanıldığında Buraya Dön
                    If index2 < 4 Then
                        
                        ' Sayı hemen tahmin edilirse ek mesaj gönder
                        Logger("str", Plugins("swin", name))
                        Delay(1)
                        Logger("str", Plugins("win", name))
                        Delay(2)
                        Logger("str", index2 & ". Denemede Oyunu Kazandınız!")
                    Else
                        
                        ' Klasik tebrik mesajı
                        Logger("str", Plugins("win", name))
                        Delay(2)
                        Logger("str", index2 & ". Denemede Oyunu Kazandınız!")
                    End If
                Else
                    
                    ' Oyun Kaybedildiğinde Buraya Dön
                    Logger("str", Plugins("lose", name))
                    Delay(2)
                    Logger("str", "Bir kez daha oynamak için 1 yazman yeterli.")
                    name = Console.ReadLine()
                    If name = "1" Then
                        
                        ' Program kapanmadan bir kez daha oynama hakkı verir.
                        Main()
                    End If
                End If
            End If
        Else
            If mode = 3 Then
                
                ' Bilgilendirme Mesajı
                number = 0
                Do
                    Logger("str", Plugins("info", number.ToString()))
                    Delay(4)
                    number = number + 1
                Loop While number <> 10
                
                ' do Dögüsü kullanmak en iyi seçenek olacaktır
            Else
                Logger("str", Plugins("wmode", ""))
            End If
        End If
    End Sub
    
    Private Function Delay(sn As Double) As Boolean
        ' Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
        ' setTimeout()
        ' time.sleep()
        ' gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
        Dim payload As Boolean
        Dim ms As Double
        
        ms = sn * 30000
        
        ' 1 Saniye ≊ 30.000 Sayım
        ' 1 Sayım = 3,14e-5
        Dim n As Integer
        
        n = 0
        Do While n < ms
            n = n + 1
        Loop
        payload = True
        
        Return payload
    End Function
    
    Private Function [Exit]() As Boolean
        ' Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
        ' Bu fonskiyon hiçbir şekilde pas geçilemez.
        ' Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
        Do
        Loop While True
        
        Return ex
    End Function
    
    Private Function Logger(type As String, this As String) As Boolean
        Dim payload As Boolean
        
        ' Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
        ' 
        ' Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
        If type = "int" Then
            Console.WriteLine(Convert.ToInt32(this))
            payload = True
        Else
            If type = "str" Then
                Console.WriteLine(this.ToString())
                payload = True
            Else
                If type = "bool" Then
                    payload = this
                Else
                    
                    ' Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                    ' Program durdurulur.
                    ' process.exit()
                    [Exit]()
                End If
            End If
        End If
        
        ' logger("str", "test")  =>  String İçin
        ' logger("int", "190")  =>  Sayı İçin
        ' logger("bool", true)  => true-false için
        
        Return payload
    End Function
    
    Private Function Namecorrection(name As String) As Boolean
        Dim payload As Boolean
        
        If name.Length < 3 Then
            Logger("str", "İsminiz 3 kelimeden kısa olmamalı." & Strings.ChrW(13) & "Lütfen programı baştan başlatın.")
            [Exit]()
        Else
            payload = True
        End If
        
        ' Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
        
        Return payload
    End Function
    
    Private Function Plugins(type As String, arg As String) As String
        ' Program içindeki çeşitlilik için gerekli fonksiyon.
        ' Fonksiyon karmaşası olmaması için kısaltıldı.
        Dim payload As String
        Dim str(10) As String
        
        If type = "ask name" Then
            str(0) = "Oyuna Hoşgeldin Yabancı!" & Strings.ChrW(13) & "Lütfen Adını Gir:"
            str(1) = "Hey, Merhaba Yabacı :)" & Strings.ChrW(13) & "Lütfen İsmini Yazar mısın?"
            str(2) = "Yeni bir oyuncu. Yaşasınn!" & Strings.ChrW(13) & "Adını söylermisin lütfen.."
            str(3) = "Oyunda Yeni Bir Katılımcı Var!" & Strings.ChrW(13) & "Lütfen İsmini Gir:"
            str(4) = "İşte yeni bir oyuncu daha!" & Strings.ChrW(13) & "Sana nasıl hitap etmemi istersin?"
            str(5) = "Seni daha önce buralarda görmedim.." & Strings.ChrW(13) & "Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle."
            str(6) = "Oyuna Hoşgeldin!" & Strings.ChrW(13) & "Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz."
            payload = str(random.Next(7))
        Else
            If type = "after name" Then
                str(0) = "Merhaba " & arg & Strings.ChrW(13) & "Oyunun kuralları şunlardır:" & Strings.ChrW(13) & "1) Sistem 0-100 arasında sayı seçer." & Strings.ChrW(13) & "2) Sayıyı tahmin etmeye çalışırsın" & Strings.ChrW(13) & "3) Toplam 10 adet başarısız denemeden sonra oyun biter." & Strings.ChrW(13) & "4) Sayı bulunursa oyun kazanılır!"
                payload = str(0)
            Else
                If type = "game mode" Then
                    str(0) = "Lütfen Oyun Modunu Seç" & Strings.ChrW(13) & Strings.ChrW(13) & "1) Kolay (Sıcak-Soğuk Mantığı)" & Strings.ChrW(13) & "2) Normal (Yönergeler Yok)" & Strings.ChrW(13) & "3) İşleyiş Hakkında Bilgi Al"
                    payload = str(0)
                Else
                    If type = "wmode" Then
                        str(0) = "Lütfen Sadece 1 veya 2 Yazın"
                        str(1) = "Yanlış Seçim! Sadece 1 veya 2 yazın!"
                        payload = str(random.Next(2))
                    Else
                        If type = "get num" Then
                            str(0) = "Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! " & arg
                            str(1) = "Tuttum! Hadi Başlayalım :)"
                            str(2) = "Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans " & arg & " :)"
                            payload = str(random.Next(3))
                        Else
                            If type = "think" Then
                                str(0) = "Tahminin?"
                                str(1) = "Sence ne olabilir " & arg & "?"
                                str(2) = "Bi fikrin varmı?"
                                str(3) = "Tahminin için bekliyorum " & arg
                                str(4) = "İyi düşün ve öyle karar ver.."
                                str(5) = "Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                                str(6) = "Şansını boşa harcama " & arg
                                str(7) = "Sakın yanlış tahin ediyim deme haa"
                                str(8) = "Hadi sıra sende " & arg
                                payload = str(random.Next(9))
                            Else
                                If type = "wthink" Then
                                    str(0) = "Yanlış! Tahminin?"
                                    str(1) = "Bu Değil. Sence ne olabilir " & arg & "?"
                                    str(2) = "Sayı bu değil. Bi fikrin varmı?"
                                    str(3) = "Yeniden.. Tahminin için bekliyorum " & arg
                                    str(4) = "Şimdi iyi düşün ve öyle karar ver.."
                                    str(5) = "Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                                    str(6) = "Şansını boşa harcama " & arg
                                    str(7) = "Ah be abi. Sakın yanlış tahin ediyim deme haa"
                                    str(8) = "Tekrardan.. Hadi sıra sende " & arg
                                    payload = str(random.Next(9))
                                Else
                                    If type = "sthink" Then
                                        str(0) = "Hey, hey! Bu son hakkın. Dikkatli Ol!"
                                        str(1) = "Dur Biraz! Bu Son Şansın. İyi Kullan " & arg
                                        str(2) = "Kader Anı! Oyunu kazanman için son şans!"
                                        str(3) = "Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin " & arg
                                        str(4) = "Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı.."
                                        payload = str(random.Next(5))
                                    Else
                                        If type = "win" Then
                                            str(0) = "[+] Kazandın!!!" & Strings.ChrW(13) & "İşte Buuu! Nasılda tahmin ettin *o*" & Strings.ChrW(13) & Strings.ChrW(13) & "Bir sonraki oyunda görüşmek üzere.."
                                            str(1) = "[+] Tebrikler " & arg & "." & Strings.ChrW(13) & "Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın." & Strings.ChrW(13) & "Bir sonraki oyununda başarılar."
                                            str(2) = "[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)" & Strings.ChrW(13) & "Bir oyuna daha var mısın.."
                                            str(3) = "[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum." & Strings.ChrW(13) & "Sonraki oyunlarda görüşmek dileğiyle.."
                                            str(4) = "[+] İyi iş çıkardın " & arg & Strings.ChrW(13) & "Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \'_'/"
                                            payload = str(random.Next(5))
                                        Else
                                            If type = "swin" Then
                                                str(0) = "[⁂] İnanılmaz.. Tek Kelime İle Şahane!"
                                                str(1) = "[⁂] Ne.. Bu kadar hızlı yenilemem.."
                                                str(2) = "[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim.."
                                                str(3) = "[⁂] Sen..? Nasıl..? Hile mi yapıyosun??"
                                                str(4) = "[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?"
                                                payload = str(random.Next(5))
                                            Else
                                                If type = "lose" Then
                                                    str(0) = "[-] Üzgünüm, Oyunu Kaybettiniz."
                                                    str(1) = "[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın.."
                                                    str(2) = "[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin."
                                                    str(3) = "[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın."
                                                    str(4) = "[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez.."
                                                    payload = str(random.Next(5))
                                                Else
                                                    If type = "cold" Then
                                                        str(0) = "↘                ↙" & Strings.ChrW(13) & " Soğuk" & Strings.ChrW(13) & "↗                ↖"
                                                        payload = str(0)
                                                    Else
                                                        If type = "warm" Then
                                                            str(0) = "↘                ↙" & Strings.ChrW(13) & "  Ilık" & Strings.ChrW(13) & "↗                ↖"
                                                            payload = str(0)
                                                        Else
                                                            If type = "hot" Then
                                                                str(0) = "↘                ↙" & Strings.ChrW(13) & " Sıcak" & Strings.ChrW(13) & "↗                ↖"
                                                                payload = str(0)
                                                            Else
                                                                If type = "info" Then
                                                                    str(0) = "Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır."
                                                                    str(1) = "Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir."
                                                                    str(2) = "İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır."
                                                                    str(3) = "Ardından oyun hakkında bilgilendirme mesajı gönderilir."
                                                                    str(4) = "Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki 'Ana' yazan yere basıp 'logger' seçmelisiniz."
                                                                    str(5) = "Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor."
                                                                    str(6) = "Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir."
                                                                    str(7) = "Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir."
                                                                    str(8) = "Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır."
                                                                    str(9) = "Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur."
                                                                    payload = str(Convert.ToInt32(arg))
                                                                End If
                                                            End If
                                                        End If
                                                    End If
                                                End If
                                            End If
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If
        
        ' prototip => plugins(<str>, <str>)
        ' Örnek:
        ' plugins("ask name", " ")
        ' plugins("after name", "İsim")
        
        Return payload
    End Function
    
    Private Function Rand(type As Boolean) As Integer
        Dim payload As Integer, opt As Integer, num As Integer
        Dim index(101) As Integer
        
        ' 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
        ' 
        ' var dizin = ["bir", "iki", "üç"]
        ' return dizin[0]     // "bir"
        If Not type Then
            payload = random.Next(101)
            
            ' Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
            ' Değişken kontrolü için;
            ' rand(true)
            ' 
            ' Direk işlem için;
            ' rand(false)
            ' 
            ' kullanın.
            If payload = 0 Then
                Rand(False)
            End If
        Else
            
            ' Bu kısım değişken kontrolü yapmak isteyenler içindir.
            num = 0
            Do
                index(num) = num
                num = num + 1
            Loop While num < 101
            
            ' do döngüsü kullanılır.
            opt = random.Next(101)
            payload = index(opt)
            If payload = 0 Then
                Rand(True)
            End If
        End If
        
        ' İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
        ' Çıkış int (Tamsayı) olarak döner.
        
        Return payload
    End Function
    
    ' .NET can only read single characters or entire lines from the console.
    ' The following function safely reads a double value.
    Private Function readValue() As Double
        Dim result As Double
        While Not Double.TryParse(Console.ReadLine(), result)
            ' No code in the loop
        End While
        Return result
    End Function
End Module
