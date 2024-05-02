Option Explicit

Sub Main
    Randomize Timer  'Prepare random number generator
    Dim Sync As Boolean
    
    Sync = True
    Dim Secim As String
    Dim İndex As Integer, İndex2 As Integer
    
    İndex = 0
    İndex2 = 0
    Dim Notlar(5) As Integer
    Dim Eskinotlar(5) As Integer
    Dim Otonot(20) As Integer
    Dim Otoeklenennot(15) As String
    
    Output "Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" & ChrW(13) & ChrW(13) & "Otomatik için: 'O'" & ChrW(13) & "Manuel için: 'M'" & ChrW(13) & "Yazın" & ChrW(13) & ChrW(13) & "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın"
    Secim = InputText("Please enter a value for Secim")
    If Secim = "O" Or Secim = "o" Then
        Do While Sync
            
            ' Bu döngü notları belirler.
            If İndex = 5 Then
                Sync = False
                
                ' index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
            Else
                İndex = İndex + 1
                Notlar(İndex2) = Int(Rnd() * 80)
                
                ' Random sayı belirle
                İndex2 = İndex2 + 1
                
                ' 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
            End If
        Loop
        Sync = True
        İndex = 0
        İndex2 = 0
        
        ' Değişkenleri sıfırlayalım
        Do While Sync
            
            ' Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
            If İndex = 5 Then
                Sync = False
            Else
                İndex = İndex + 1
                Eskinotlar(İndex2) = Notlar(İndex2)
                Notlar(İndex2) = Notlar(İndex2) + 20
                İndex2 = İndex2 + 1
            End If
        Loop
        Sync = True
        İndex = 0
        İndex2 = 0
        
        ' Değişkenleri sıfırlayalım
        Output "Yeni Notlar:"
        Do While Sync
            
            ' Bu döngü eski ve yeni notları bir arada yazdırır.
            If İndex = 5 Then
                Sync = False
                
                ' Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
            Else
                İndex = İndex + 1
                Output CStr(İndex) & ". Öğrencinin; " & ChrW(13) & ChrW(13) & "Eski Not: " & Eskinotlar(İndex2) & ChrW(13) & "Yeni Not: " & Notlar(İndex2)
                Delay 500
                
                ' 500 Milisaniyelik Gecikme
                İndex2 = İndex2 + 1
            End If
        Loop
    Else
        If Secim = "M" Or Secim = "m" Then
            Output "1. Öğrencinin Notunu Giriniz: "
            Notlar(0) = InputValue("Please enter a value for Notlar(0)")
            Output "2. Öğrencinin Notunu Giriniz: "
            Notlar(1) = InputValue("Please enter a value for Notlar(1)")
            Output "3. Öğrencinin Notunu Giriniz: "
            Notlar(2) = InputValue("Please enter a value for Notlar(2)")
            Output "4. Öğrencinin Notunu Giriniz: "
            Notlar(3) = InputValue("Please enter a value for Notlar(3)")
            Output "5. Öğrencinin Notunu Giriniz: "
            Notlar(4) = InputValue("Please enter a value for Notlar(4)")
            Delay 800
            Dim Secim2 As Integer
            Dim Devam As Boolean
            
            Devam = True
            İndex = 0
            İndex2 = 0
            Do While Sync
                If İndex = 5 Then
                    Sync = False
                Else
                    İndex = İndex + 1
                    If Notlar(İndex2) > 100 Then
                        Sync = False
                        Devam = False
                    Else
                        If Notlar(İndex2) < 0 Then
                            Sync = False
                            Devam = False
                        Else
                            İndex2 = İndex2 + 1
                        End If
                    End If
                End If
            Loop
            If Not Devam Then
                Output "Notlar 100 ve 0 Arasında Olmalıdır."
            Else
                Output "Size 3 Seçenek Sunuyoruz:" & ChrW(13) & ChrW(13) & "1) Herkesin Notuna +20 Puan Ekle" & ChrW(13) & "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" & ChrW(13) & "3) Sistem'in Kendi Not Ekleme Aracını Kullan"
                Secim2 = InputValue("Please enter a value for Secim2")
                If Secim2 = 3 Then
                    Delay 59
                    İndex = 0
                    İndex2 = 0
                    Sync = True
                    Do While Sync
                        If İndex = 5 Then
                            Sync = False
                        Else
                            İndex = İndex + 1
                            Otoeklenennot(İndex2) = Puanekle(Notlar(İndex2))
                            
                            ' Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                            Delay 59
                            If Otoeklenennot(İndex2) = "pass" Then
                                Otoeklenennot(İndex2) = "0"
                            Else
                                Otonot(İndex2) = Notlar(İndex2) + CInt(Puanekle(Notlar(İndex2)))
                            End If
                            İndex2 = İndex2 + 1
                        End If
                    Loop
                    İndex = 0
                    İndex2 = 0
                    Sync = True
                    Do While Sync
                        If İndex = 5 Then
                            Sync = False
                        Else
                            İndex = İndex + 1
                            Dim Cikti As String
                            
                            If Otoeklenennot(İndex2) = "0" Then
                                Cikti = CStr(İndex) & ". Öğrencinin; " & ChrW(13) & ChrW(13) & "Eski Not: " & Notlar(İndex2) & ChrW(13) & "Yeni Not: " & Notlar(İndex2) & ChrW(13) & "Ek Puan Yok. Not Yeterli."
                            Else
                                Cikti = CStr(İndex) & ". Öğrencinin; " & ChrW(13) & ChrW(13) & "Eski Not: " & Notlar(İndex2) & ChrW(13) & "Yeni Not: " & (CInt(Otoeklenennot(İndex2)) + Notlar(İndex2)) & ChrW(13) & "Eklenen Puan: " & Otoeklenennot(İndex2)
                            End If
                            Output Cikti
                            Delay 500
                            İndex2 = İndex2 + 1
                        End If
                    Loop
                Else
                    If Secim2 = 2 Then
                        İndex = 0
                        İndex2 = 0
                        Sync = False
                        Dim Sayı1 As Integer, Sayı2 As Integer, Sayı3 As Integer, Sayı4 As Integer, Sayı5 As Integer
                        Dim Soru1 As Integer, Soru2 As Integer, Soru3 As Integer, Soru4 As Integer, Soru5 As Integer
                        
                        ' Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                        ' Yaha henüz ben keşfedemedim :p
                        Delay 230
                        Soru1 = Puaneklesoru("1", Notlar(İndex2))
                        İndex2 = İndex2 + 1
                        Soru2 = Puaneklesoru("2", Notlar(İndex2))
                        İndex2 = İndex2 + 1
                        Soru3 = Puaneklesoru("3", Notlar(İndex2))
                        İndex2 = İndex2 + 1
                        Soru4 = Puaneklesoru("4", Notlar(İndex2))
                        İndex2 = İndex2 + 1
                        Soru5 = Puaneklesoru("5", Notlar(İndex2))
                        Delay 600
                        Sync = True
                        Dim Soruarray(5) As Integer
                        
                        Soruarray(0) = Soru1
                        Soruarray(1) = Soru2
                        Soruarray(2) = Soru3
                        Soruarray(3) = Soru4
                        Soruarray(4) = Soru5
                        If Soru1 > 100 And Soru1 < 0 Or Soru2 > 100 And Soru2 < 0 Or Soru3 > 100 And Soru3 < 0 Or Soru4 > 100 And Soru4 < 0 Or Soru5 > 100 And Soru5 < 0 Then
                            Output "Notların Son Hali 100 ve 0 Arasında Olmalıdır."
                        Else
                            İndex2 = 0
                            Sayı1 = Soru1 + Notlar(İndex2)
                            İndex2 = İndex2 + 1
                            Sayı2 = Soru2 + Notlar(İndex2)
                            İndex2 = İndex2 + 1
                            Sayı3 = Soru3 + Notlar(İndex2)
                            İndex2 = İndex2 + 1
                            Sayı4 = Soru4 + Notlar(İndex2)
                            İndex2 = İndex2 + 1
                            Sayı5 = Soru5 + Notlar(İndex2)
                            İndex2 = 0
                            İndex = 0
                            Dim Sonsayılar(5) As Integer
                            
                            Sonsayılar(0) = Sayı1
                            Sonsayılar(1) = Sayı2
                            Sonsayılar(2) = Sayı3
                            Sonsayılar(3) = Sayı4
                            Sonsayılar(4) = Sayı5
                            Do While Sync
                                If İndex = 5 Then
                                    Sync = False
                                Else
                                    İndex = İndex + 1
                                    Output CStr(İndex) & ". Öğrencinin; " & ChrW(13) & ChrW(13) & "Eski Not: " & Notlar(İndex2) & ChrW(13) & "Yeni Not: " & Sonsayılar(İndex2) & ChrW(13) & "Eklenen Puan: " & Soruarray(İndex2)
                                    Delay 270
                                    İndex2 = İndex2 + 1
                                End If
                            Loop
                        End If
                    Else
                        If Secim2 = 1 Then
                            Do While Sync
                                
                                ' Bu döngü notları belirler.
                                If İndex = 5 Then
                                    Sync = False
                                    
                                    ' index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                                Else
                                    İndex = İndex + 1
                                    Notlar(İndex2) = Int(Rnd() * 80)
                                    
                                    ' Random sayı belirle
                                    İndex2 = İndex2 + 1
                                    
                                    ' 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                                End If
                            Loop
                            Sync = True
                            İndex = 0
                            İndex2 = 0
                            
                            ' Değişkenleri sıfırlayalım
                            Do While Sync
                                
                                ' Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                                If İndex = 5 Then
                                    Sync = False
                                Else
                                    İndex = İndex + 1
                                    Eskinotlar(İndex2) = Notlar(İndex2)
                                    Notlar(İndex2) = Notlar(İndex2) + 20
                                    İndex2 = İndex2 + 1
                                End If
                            Loop
                            Sync = True
                            İndex = 0
                            İndex2 = 0
                            
                            ' Değişkenleri sıfırlayalım
                            Output "Yeni Notlar:"
                            Do While Sync
                                
                                ' Bu döngü eski ve yeni notları bir arada yazdırır.
                                If İndex = 5 Then
                                    Sync = False
                                    
                                    ' Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                Else
                                    İndex = İndex + 1
                                    If Notlar(İndex2) > 100 Then
                                        Notlar(İndex2) = 100
                                        Output CStr(İndex) & ". Öğrencinin; " & ChrW(13) & ChrW(13) & "Eski Not: " & Eskinotlar(İndex2) & ChrW(13) & "Yeni Not: " & Notlar(İndex2)
                                    Else
                                        Output CStr(İndex) & ". Öğrencinin; " & ChrW(13) & ChrW(13) & "Eski Not: " & Eskinotlar(İndex2) & ChrW(13) & "Yeni Not: " & Notlar(İndex2)
                                    End If
                                    
                                    ' 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                    Delay 500
                                    
                                    ' 500 Milisaniyelik Gecikme
                                    İndex2 = İndex2 + 1
                                End If
                            Loop
                        Else
                            Output "Lütfen 1, 2 veya 3 yazınız."
                            Delay 1000
                            Output "Program Kapatılıyor.."
                            İndex = 3
                            Do While Sync
                                If İndex = 0 Then
                                    Sync = False
                                Else
                                    Delay 1000
                                    Output CStr(İndex) & ".."
                                    İndex = İndex - 1
                                End If
                                
                                ' Programın Kapatılması İçin Sayaç Oluştur
                            Loop
                        End If
                    End If
                End If
            End If
        Else
            Dim Helpnum As Integer, Helpnum2 As Integer
            Dim Var_Loop As Integer, Loop2 As Integer
            
            If Secim = "a" Or Secim = "A" Then
                Output "1) Otomatik Mod Hakkında Yardım" & ChrW(13) & "2) Manuel Mod Hakkında Yardım"
                Helpnum = InputValue("Please enter a value for Helpnum")
                Delay 200
                
                ' Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                Var_Loop = Yardımloop(Helpnum)
                Delay 200
                If Var_Loop = 1 Then
                    Output "Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar."
                    Delay 7800
                    Output "Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır."
                    Delay 9000
                    Output "Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır."
                Else
                    Output "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" & ChrW(13) & "2) Manuel Puan Ekleme Hakkında Yardım" & ChrW(13) & "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"
                    Helpnum2 = InputValue("Please enter a value for Helpnum2")
                    Delay 200
                    Loop2 = Yardımloop2(Helpnum2)
                    Delay 200
                    If Loop2 = 1 Then
                        Output "Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler."
                    Else
                        If Loop2 = 2 Then
                            Output "Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar."
                            Delay 7800
                            Output "Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır."
                        Else
                            Output "Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır."
                            Delay 4500
                            Output "Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır."
                            Delay 4500
                            Output "Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar."
                            Delay 8000
                            Output "Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır."
                        End If
                    End If
                End If
            Else
                Output "Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!"
            End If
        End If
    End If
    
    ' 2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır.
    ' 
    ' Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir.
    ' Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer.
    ' 
    ' 1. İşlem: Seçilen Notların Hepine 20 Puan Ekle
    ' 2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler
    ' 3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar.
    ' 
    ' 3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir.
End Sub

Function Delay(byval Sn As Integer) As Boolean
    ' Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    Dim Sonuc As Boolean
    Dim Ms As Integer
    
    Ms = Sn * 33
    Dim n As Integer
    
    n = 0
    Do While n <> Ms
        n = n + 1
    Loop
    Sonuc = True
    
    ' Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
    ' boolen test
    ' test = delay(200)
    ' çıktı test  // true
    
    Delay = Sonuc
End Function

Function Puanekle(byval Puan As Integer) As String
    Dim Sonuc As String
    Dim Ekpuan(20) As Integer
    Dim İndex As Integer, İndex2 As Integer
    Dim Sync As Boolean
    
    ' while döngüsü için
    Sync = True
    İndex = 0
    If Puan > 89 Then
        Sonuc = "pass"
        
        ' 90 ve üstü notlar için puan ekleme olmaz.
    Else
        If Puan > 69 Then
            İndex2 = 5
            Do While Sync
                If İndex = 6 Then
                    Sync = False
                Else
                    Ekpuan(İndex) = İndex2
                    İndex = İndex + 1
                    İndex2 = İndex2 + 1
                End If
            Loop
            Sonuc = CStr(Ekpuan(Int(Rnd() * 6)))
            
            ' Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
        Else
            If Puan > 49 Then
                İndex2 = 10
                Do While Sync
                    If İndex = 9 Then
                        Sync = False
                    Else
                        Ekpuan(İndex) = İndex2
                        İndex = İndex + 1
                        İndex2 = İndex2 + 1
                    End If
                Loop
                Sonuc = CStr(Ekpuan(Int(Rnd() * 9)))
                
                ' Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
            Else
                If Puan > 29 Then
                    İndex2 = 20
                    Do While Sync
                        If İndex = 10 Then
                            Sync = False
                        Else
                            Ekpuan(İndex) = İndex2
                            İndex = İndex + 1
                            İndex2 = İndex2 + 1
                        End If
                    Loop
                    Sonuc = CStr(Ekpuan(Int(Rnd() * 10)))
                    
                    ' Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                Else
                    İndex2 = 30
                    Do While Sync
                        If İndex = 11 Then
                            Sync = False
                        Else
                            Ekpuan(İndex) = İndex2
                            İndex = İndex + 1
                            İndex2 = İndex2 + 1
                        End If
                    Loop
                    Sonuc = CStr(Ekpuan(Int(Rnd() * 11)))
                    
                    ' Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                End If
            End If
        End If
    End If
    
    ' String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
    ' var sayı = 0.65   // Javascript
    ' sayı = 0.65          // Python
    ' local sayı = 0.65          // Lua
    ' int sayı = 0.65     // C
    
    Puanekle = Sonuc
End Function

Function Puaneklesoru(byval No As String, byval Eskinot As Integer) As Integer
    Dim Sonuc As Integer
    
    Output No & ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " & ChrW(13) & ChrW(13) & "Öğrencinin Puanı: " & Eskinot
    Sonuc = InputValue("Please enter a value for Sonuc")
    
    Puaneklesoru = Sonuc
End Function

Function Yardımloop(byval Sayı As Integer) As Integer
    Dim Sonuc As Integer
    
    If Sayı = 1 Or Sayı = 2 Then
    Else
        Output "Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." & ChrW(13) & "Yeniden Başlatılıyor.."
        Delay 1000
        Output "1) Otomatik Mod Hakkında Yardım" & ChrW(13) & "2) Manuel Mod Hakkında Yardım"
        Sayı = InputValue("Please enter a value for Sayı")
        Yardımloop Sayı
    End If
    
    ' Yardım Modülü İçin
    ' Yanlış değer girildiğinde baştan başlatır
    Sonuc = Sayı
    
    Yardımloop = Sonuc
End Function

Function Yardımloop2(byval Sayı As Integer) As Integer
    Dim Sonuc As Integer
    
    If Sayı = 1 Or Sayı = 2 Or Sayı = 3 Then
    Else
        Output "Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." & ChrW(13) & "Yeniden Başlatılıyor.."
        Delay 1000
        Output "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" & ChrW(13) & "2) Manuel Puan Ekleme Hakkında Yardım" & ChrW(13) & "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"
        Sayı = InputValue("Please enter a value for Sayı")
        Yardımloop2 Sayı
    End If
    Sonuc = Sayı
    
    Yardımloop2 = Sonuc
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
