Option Explicit

Sub Main
    Dim Sync As Boolean, Find As Boolean
    Dim Name As String
    Dim Mode As Integer, Number As Integer
    
    Logger "str", Plugins("ask name", "")
    Delay 2
    Name = InputText("Please enter a value for Name")
    Namecorrection Name
    Delay 2
    
    ' İsim Alma Kısmı Tamamlandı
    Logger "str", Plugins("after name", Name)
    Delay 9
    Logger "str", Plugins("game mode", "")
    Mode = InputValue("Please enter a value for Mode")
    
    ' Oyun Modu Başarıyla Seçildi
    If Mode = 1 Or Mode = 2 Then
        If Mode = 1 Then
            
            ' Kolay Oyun Modu
            Dim İndex As Integer, İndex2 As Integer, Think As Integer
            
            İndex = 0
            İndex2 = 0
            Sync = True
            Number = Rand(True)
            Logger "str", Plugins("get num", Name)
            Delay 2
            
            ' Sayı Belirlendi
            Do While Sync
                If İndex = 10 Then
                    Find = False
                    Sync = False
                    
                    ' 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                Else
                    İndex2 = İndex2 + 1
                    İndex = İndex + 1
                    If İndex = 1 Then
                        
                        ' İlk başlama mesajı
                        Logger "str", Plugins("think", Name)
                    Else
                        
                        ' Sonraki başlama mesajları
                        If İndex = 10 Then
                            
                            ' Son tahmin hakkı için bilgilendirme mesajı
                            Logger "str", Plugins("sthink", Name)
                            Delay 3.5
                        Else
                            
                            ' Yanlış tahminler için bilgilendirme mesajı
                            Logger "str", Plugins("wthink", Name)
                        End If
                    End If
                    Think = InputValue("Please enter a value for Think")
                    If Think = Number Then
                        
                        ' Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        Find = True
                        Sync = False
                    Else
                        Delay 1
                        If İndex = 10 Then
                        Else
                            If Think > Number Then
                                
                                ' Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                                If Think - Number > 25 Then
                                    
                                    ' Tahmin, sayıdan uzak ise bunu gönder
                                    Logger "str", Plugins("cold", "")
                                Else
                                    If Think - Number > 15 Then
                                        
                                        ' Tahmin, sayıya biraz yakın ise bunu gönder
                                        Logger "str", Plugins("warm", "")
                                    Else
                                        
                                        ' Tahmin, sayıya çok yakın ise bunu gönder
                                        Logger "str", Plugins("hot", "")
                                    End If
                                End If
                            Else
                                
                                ' Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                                If Number - Think > 25 Then
                                    
                                    ' Tahmin, sayıdan uzak ise bunu gönder
                                    Logger "str", Plugins("cold", "")
                                Else
                                    If Number - Think > 15 Then
                                        
                                        ' Tahmin, sayıya biraz yakın ise bunu gönder
                                        Logger "str", Plugins("warm", "")
                                    Else
                                        
                                        ' Tahmin, sayıya çok yakın ise bunu gönder
                                        Logger "str", Plugins("hot", "")
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            Loop
            If Find Then
                
                ' Oyun Kazanıldığında Buraya Dön
                If İndex2 < 4 Then
                    
                    ' Sayı hemen tahmin edilirse ek mesaj gönder
                    Logger "str", Plugins("swin", Name)
                    Delay 1
                    Logger "str", Plugins("win", Name)
                    Delay 2
                    Logger "str", İndex2 & ". Denemede Oyunu Kazandınız!"
                Else
                    
                    ' Klasik tebrik mesajı
                    Logger "str", Plugins("win", Name)
                    Delay 2
                    Logger "str", İndex2 & ". Denemede Oyunu Kazandınız!"
                End If
            Else
                
                ' Oyun Kaybedildiğinde Buraya Dön
                Logger "str", Plugins("lose", Name)
                Delay 2
                Logger "str", "Bir kez daha oynamak için 1 yazman yeterli."
                Name = InputText("Please enter a value for Name")
                If Name = "1" Then
                    
                    ' Program kapanmadan bir kez daha oynama hakkı verir.
                    Main 
                End If
            End If
        Else
            
            ' Normal Oyun Modu
            Dim İndex As Integer, İndex2 As Integer, Think As Integer
            
            İndex = 0
            İndex2 = 0
            Sync = True
            Number = Rand(False)
            Logger "str", Plugins("get num", Name)
            Delay 2
            
            ' Sayı Belirlendi
            Do While Sync
                If İndex = 10 Then
                    Find = False
                    Sync = False
                    
                    ' 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                Else
                    İndex2 = İndex2 + 1
                    İndex = İndex + 1
                    If İndex = 1 Then
                        
                        ' İlk başlama mesajı
                        Logger "str", Plugins("think", Name)
                    Else
                        
                        ' Sonraki başlama mesajları
                        If İndex = 10 Then
                            
                            ' Son tahmin hakkı için bilgilendirme mesajı
                            Logger "str", Plugins("sthink", Name)
                            Delay 3.5
                        Else
                            
                            ' Yanlış tahminler için bilgilendirme mesajı
                            Logger "str", Plugins("wthink", Name)
                        End If
                    End If
                    Think = InputValue("Please enter a value for Think")
                    If Think = Number Then
                        
                        ' Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        Find = True
                        Sync = False
                    Else
                        
                        ' Tahmin Yanlış İse Döngüyü Yeniden Başlat
                    End If
                End If
            Loop
            If Find Then
                
                ' Oyun Kazanıldığında Buraya Dön
                If İndex2 < 4 Then
                    
                    ' Sayı hemen tahmin edilirse ek mesaj gönder
                    Logger "str", Plugins("swin", Name)
                    Delay 1
                    Logger "str", Plugins("win", Name)
                    Delay 2
                    Logger "str", İndex2 & ". Denemede Oyunu Kazandınız!"
                Else
                    
                    ' Klasik tebrik mesajı
                    Logger "str", Plugins("win", Name)
                    Delay 2
                    Logger "str", İndex2 & ". Denemede Oyunu Kazandınız!"
                End If
            Else
                
                ' Oyun Kaybedildiğinde Buraya Dön
                Logger "str", Plugins("lose", Name)
                Delay 2
                Logger "str", "Bir kez daha oynamak için 1 yazman yeterli."
                Name = InputText("Please enter a value for Name")
                If Name = "1" Then
                    
                    ' Program kapanmadan bir kez daha oynama hakkı verir.
                    Main 
                End If
            End If
        End If
    Else
        If Mode = 3 Then
            
            ' Bilgilendirme Mesajı
            Number = 0
            Do
                Logger "str", Plugins("info", CStr(Number))
                Delay 4
                Number = Number + 1
            Loop While Number <> 10
            
            ' do Dögüsü kullanmak en iyi seçenek olacaktır
        Else
            Logger "str", Plugins("wmode", "")
        End If
    End If
End Sub

Function Delay(byval Sn As Double) As Boolean
    ' Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
    ' setTimeout()
    ' time.sleep()
    ' gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
    Dim Payload As Boolean
    Dim Ms As Double
    
    Ms = Sn * 30000
    
    ' 1 Saniye ≊ 30.000 Sayım
    ' 1 Sayım = 3,14e-5
    Dim n As Integer
    
    n = 0
    Do While n < Ms
        n = n + 1
    Loop
    Payload = True
    
    Delay = Payload
End Function

Function Func_Exit() As Boolean
    ' Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
    ' Bu fonskiyon hiçbir şekilde pas geçilemez.
    ' Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
    Do
    Loop While True
    
    Func_Exit = ex
End Function

Function Logger(byval Var_Type As String, byval This As String) As Boolean
    Dim Payload As Boolean
    
    ' Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
    ' 
    ' Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
    If Var_Type = "int" Then
        Output CInt(This)
        Payload = True
    Else
        If Var_Type = "str" Then
            Output CStr(This)
            Payload = True
        Else
            If Var_Type = "bool" Then
                Payload = This
            Else
                
                ' Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                ' Program durdurulur.
                ' process.exit()
                Func_Exit 
            End If
        End If
    End If
    
    ' logger("str", "test")  =>  String İçin
    ' logger("int", "190")  =>  Sayı İçin
    ' logger("bool", true)  => true-false için
    
    Logger = Payload
End Function

Function Namecorrection(byval Name As String) As Boolean
    Dim Payload As Boolean
    
    If Len(Name) < 3 Then
        Logger "str", "İsminiz 3 kelimeden kısa olmamalı." & ChrW(13) & "Lütfen programı baştan başlatın."
        Func_Exit 
    Else
        Payload = True
    End If
    
    ' Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
    
    Namecorrection = Payload
End Function

Function Plugins(byval Var_Type As String, byval Arg As String) As String
    ' Program içindeki çeşitlilik için gerekli fonksiyon.
    ' Fonksiyon karmaşası olmaması için kısaltıldı.
    Dim Payload As String
    Dim Str(10) As String
    
    If Var_Type = "ask name" Then
        Str(0) = "Oyuna Hoşgeldin Yabancı!" & ChrW(13) & "Lütfen Adını Gir:"
        Str(1) = "Hey, Merhaba Yabacı :)" & ChrW(13) & "Lütfen İsmini Yazar mısın?"
        Str(2) = "Yeni bir oyuncu. Yaşasınn!" & ChrW(13) & "Adını söylermisin lütfen.."
        Str(3) = "Oyunda Yeni Bir Katılımcı Var!" & ChrW(13) & "Lütfen İsmini Gir:"
        Str(4) = "İşte yeni bir oyuncu daha!" & ChrW(13) & "Sana nasıl hitap etmemi istersin?"
        Str(5) = "Seni daha önce buralarda görmedim.." & ChrW(13) & "Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle."
        Str(6) = "Oyuna Hoşgeldin!" & ChrW(13) & "Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz."
        Payload = Str(Int(Rnd() * 7))
    Else
        If Var_Type = "after name" Then
            Str(0) = "Merhaba " & Arg & ChrW(13) & "Oyunun kuralları şunlardır:" & ChrW(13) & "1) Sistem 0-100 arasında sayı seçer." & ChrW(13) & "2) Sayıyı tahmin etmeye çalışırsın" & ChrW(13) & "3) Toplam 10 adet başarısız denemeden sonra oyun biter." & ChrW(13) & "4) Sayı bulunursa oyun kazanılır!"
            Payload = Str(0)
        Else
            If Var_Type = "game mode" Then
                Str(0) = "Lütfen Oyun Modunu Seç" & ChrW(13) & ChrW(13) & "1) Kolay (Sıcak-Soğuk Mantığı)" & ChrW(13) & "2) Normal (Yönergeler Yok)" & ChrW(13) & "3) İşleyiş Hakkında Bilgi Al"
                Payload = Str(0)
            Else
                If Var_Type = "wmode" Then
                    Str(0) = "Lütfen Sadece 1 veya 2 Yazın"
                    Str(1) = "Yanlış Seçim! Sadece 1 veya 2 yazın!"
                    Payload = Str(Int(Rnd() * 2))
                Else
                    If Var_Type = "get num" Then
                        Str(0) = "Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! " & Arg
                        Str(1) = "Tuttum! Hadi Başlayalım :)"
                        Str(2) = "Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans " & Arg & " :)"
                        Payload = Str(Int(Rnd() * 3))
                    Else
                        If Var_Type = "think" Then
                            Str(0) = "Tahminin?"
                            Str(1) = "Sence ne olabilir " & Arg & "?"
                            Str(2) = "Bi fikrin varmı?"
                            Str(3) = "Tahminin için bekliyorum " & Arg
                            Str(4) = "İyi düşün ve öyle karar ver.."
                            Str(5) = "Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                            Str(6) = "Şansını boşa harcama " & Arg
                            Str(7) = "Sakın yanlış tahin ediyim deme haa"
                            Str(8) = "Hadi sıra sende " & Arg
                            Payload = Str(Int(Rnd() * 9))
                        Else
                            If Var_Type = "wthink" Then
                                Str(0) = "Yanlış! Tahminin?"
                                Str(1) = "Bu Değil. Sence ne olabilir " & Arg & "?"
                                Str(2) = "Sayı bu değil. Bi fikrin varmı?"
                                Str(3) = "Yeniden.. Tahminin için bekliyorum " & Arg
                                Str(4) = "Şimdi iyi düşün ve öyle karar ver.."
                                Str(5) = "Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                                Str(6) = "Şansını boşa harcama " & Arg
                                Str(7) = "Ah be abi. Sakın yanlış tahin ediyim deme haa"
                                Str(8) = "Tekrardan.. Hadi sıra sende " & Arg
                                Payload = Str(Int(Rnd() * 9))
                            Else
                                If Var_Type = "sthink" Then
                                    Str(0) = "Hey, hey! Bu son hakkın. Dikkatli Ol!"
                                    Str(1) = "Dur Biraz! Bu Son Şansın. İyi Kullan " & Arg
                                    Str(2) = "Kader Anı! Oyunu kazanman için son şans!"
                                    Str(3) = "Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin " & Arg
                                    Str(4) = "Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı.."
                                    Payload = Str(Int(Rnd() * 5))
                                Else
                                    If Var_Type = "win" Then
                                        Str(0) = "[+] Kazandın!!!" & ChrW(13) & "İşte Buuu! Nasılda tahmin ettin *o*" & ChrW(13) & ChrW(13) & "Bir sonraki oyunda görüşmek üzere.."
                                        Str(1) = "[+] Tebrikler " & Arg & "." & ChrW(13) & "Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın." & ChrW(13) & "Bir sonraki oyununda başarılar."
                                        Str(2) = "[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)" & ChrW(13) & "Bir oyuna daha var mısın.."
                                        Str(3) = "[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum." & ChrW(13) & "Sonraki oyunlarda görüşmek dileğiyle.."
                                        Str(4) = "[+] İyi iş çıkardın " & Arg & ChrW(13) & "Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \'_'/"
                                        Payload = Str(Int(Rnd() * 5))
                                    Else
                                        If Var_Type = "swin" Then
                                            Str(0) = "[⁂] İnanılmaz.. Tek Kelime İle Şahane!"
                                            Str(1) = "[⁂] Ne.. Bu kadar hızlı yenilemem.."
                                            Str(2) = "[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim.."
                                            Str(3) = "[⁂] Sen..? Nasıl..? Hile mi yapıyosun??"
                                            Str(4) = "[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?"
                                            Payload = Str(Int(Rnd() * 5))
                                        Else
                                            If Var_Type = "lose" Then
                                                Str(0) = "[-] Üzgünüm, Oyunu Kaybettiniz."
                                                Str(1) = "[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın.."
                                                Str(2) = "[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin."
                                                Str(3) = "[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın."
                                                Str(4) = "[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez.."
                                                Payload = Str(Int(Rnd() * 5))
                                            Else
                                                If Var_Type = "cold" Then
                                                    Str(0) = "↘                ↙" & ChrW(13) & " Soğuk" & ChrW(13) & "↗                ↖"
                                                    Payload = Str(0)
                                                Else
                                                    If Var_Type = "warm" Then
                                                        Str(0) = "↘                ↙" & ChrW(13) & "  Ilık" & ChrW(13) & "↗                ↖"
                                                        Payload = Str(0)
                                                    Else
                                                        If Var_Type = "hot" Then
                                                            Str(0) = "↘                ↙" & ChrW(13) & " Sıcak" & ChrW(13) & "↗                ↖"
                                                            Payload = Str(0)
                                                        Else
                                                            If Var_Type = "info" Then
                                                                Str(0) = "Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır."
                                                                Str(1) = "Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir."
                                                                Str(2) = "İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır."
                                                                Str(3) = "Ardından oyun hakkında bilgilendirme mesajı gönderilir."
                                                                Str(4) = "Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki 'Ana' yazan yere basıp 'logger' seçmelisiniz."
                                                                Str(5) = "Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor."
                                                                Str(6) = "Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir."
                                                                Str(7) = "Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir."
                                                                Str(8) = "Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır."
                                                                Str(9) = "Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur."
                                                                Payload = Str(CInt(Arg))
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
    
    Plugins = Payload
End Function

Function Rand(byval Var_Type As Boolean) As Integer
    Dim Payload As Integer, Opt As Integer, Num As Integer
    Dim İndex(101) As Integer
    
    ' 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
    ' 
    ' var dizin = ["bir", "iki", "üç"]
    ' return dizin[0]     // "bir"
    If Not Var_Type Then
        Payload = Int(Rnd() * 101)
        
        ' Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
        ' Değişken kontrolü için;
        ' rand(true)
        ' 
        ' Direk işlem için;
        ' rand(false)
        ' 
        ' kullanın.
        If Payload = 0 Then
            Rand False
        End If
    Else
        
        ' Bu kısım değişken kontrolü yapmak isteyenler içindir.
        Num = 0
        Do
            İndex(Num) = Num
            Num = Num + 1
        Loop While Num < 101
        
        ' do döngüsü kullanılır.
        Opt = Int(Rnd() * 101)
        Payload = İndex(Opt)
        If Payload = 0 Then
            Rand True
        End If
    End If
    
    ' İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
    ' Çıkış int (Tamsayı) olarak döner.
    
    Rand = Payload
End Function

' These functions are used to input data. You can change these to another source.
Function InputValue(Prompt As String) As Double
    InputValue = Val(InputBox(Prompt))
End Function

Function InputText(Prompt As String) As String
    InputText = InputBox(Prompt)
End Function

' This function is used to output data. You can change this to another source.
Sub Output(Text As Variant)
    Msgbox Text
End Sub
