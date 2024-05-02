Imports System

Public Module MyProgram
    Private random as new Random()
    
    Sub Main
        Dim sync As Boolean
        
        sync = True
        Dim secim As String
        Dim index As Integer, index2 As Integer
        
        index = 0
        index2 = 0
        Dim notlar(5) As Integer
        Dim eskinotlar(5) As Integer
        Dim otonot(20) As Integer
        Dim otoeklenennot(15) As String
        
        Console.WriteLine("Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" & Strings.ChrW(13) & Strings.ChrW(13) & "Otomatik için: 'O'" & Strings.ChrW(13) & "Manuel için: 'M'" & Strings.ChrW(13) & "Yazın" & Strings.ChrW(13) & Strings.ChrW(13) & "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın")
        secim = Console.ReadLine()
        If secim = "O" Or secim = "o" Then
            Do While sync
                
                ' Bu döngü notları belirler.
                If index = 5 Then
                    sync = False
                    
                    ' index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                Else
                    index = index + 1
                    notlar(index2) = random.Next(80)
                    
                    ' Random sayı belirle
                    index2 = index2 + 1
                    
                    ' 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                End If
            Loop
            sync = True
            index = 0
            index2 = 0
            
            ' Değişkenleri sıfırlayalım
            Do While sync
                
                ' Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                If index = 5 Then
                    sync = False
                Else
                    index = index + 1
                    eskinotlar(index2) = notlar(index2)
                    notlar(index2) = notlar(index2) + 20
                    index2 = index2 + 1
                End If
            Loop
            sync = True
            index = 0
            index2 = 0
            
            ' Değişkenleri sıfırlayalım
            Console.WriteLine("Yeni Notlar:")
            Do While sync
                
                ' Bu döngü eski ve yeni notları bir arada yazdırır.
                If index = 5 Then
                    sync = False
                    
                    ' Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                Else
                    index = index + 1
                    Console.WriteLine(index.ToString() & ". Öğrencinin; " & Strings.ChrW(13) & Strings.ChrW(13) & "Eski Not: " & eskinotlar(index2) & Strings.ChrW(13) & "Yeni Not: " & notlar(index2))
                    Delay(500)
                    
                    ' 500 Milisaniyelik Gecikme
                    index2 = index2 + 1
                End If
            Loop
        Else
            If secim = "M" Or secim = "m" Then
                Console.WriteLine("1. Öğrencinin Notunu Giriniz: ")
                notlar(0) = readValue()
                Console.WriteLine("2. Öğrencinin Notunu Giriniz: ")
                notlar(1) = readValue()
                Console.WriteLine("3. Öğrencinin Notunu Giriniz: ")
                notlar(2) = readValue()
                Console.WriteLine("4. Öğrencinin Notunu Giriniz: ")
                notlar(3) = readValue()
                Console.WriteLine("5. Öğrencinin Notunu Giriniz: ")
                notlar(4) = readValue()
                Delay(800)
                Dim secim2 As Integer
                Dim devam As Boolean
                
                devam = True
                index = 0
                index2 = 0
                Do While sync
                    If index = 5 Then
                        sync = False
                    Else
                        index = index + 1
                        If notlar(index2) > 100 Then
                            sync = False
                            devam = False
                        Else
                            If notlar(index2) < 0 Then
                                sync = False
                                devam = False
                            Else
                                index2 = index2 + 1
                            End If
                        End If
                    End If
                Loop
                If Not devam Then
                    Console.WriteLine("Notlar 100 ve 0 Arasında Olmalıdır.")
                Else
                    Console.WriteLine("Size 3 Seçenek Sunuyoruz:" & Strings.ChrW(13) & Strings.ChrW(13) & "1) Herkesin Notuna +20 Puan Ekle" & Strings.ChrW(13) & "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" & Strings.ChrW(13) & "3) Sistem'in Kendi Not Ekleme Aracını Kullan")
                    secim2 = readValue()
                    If secim2 = 3 Then
                        Delay(59)
                        index = 0
                        index2 = 0
                        sync = True
                        Do While sync
                            If index = 5 Then
                                sync = False
                            Else
                                index = index + 1
                                otoeklenennot(index2) = Puanekle(notlar(index2))
                                
                                ' Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                                Delay(59)
                                If otoeklenennot(index2) = "pass" Then
                                    otoeklenennot(index2) = "0"
                                Else
                                    otonot(index2) = notlar(index2) + Convert.ToInt32(Puanekle(notlar(index2)))
                                End If
                                index2 = index2 + 1
                            End If
                        Loop
                        index = 0
                        index2 = 0
                        sync = True
                        Do While sync
                            If index = 5 Then
                                sync = False
                            Else
                                index = index + 1
                                Dim cikti As String
                                
                                If otoeklenennot(index2) = "0" Then
                                    cikti = index.ToString() & ". Öğrencinin; " & Strings.ChrW(13) & Strings.ChrW(13) & "Eski Not: " & notlar(index2) & Strings.ChrW(13) & "Yeni Not: " & notlar(index2) & Strings.ChrW(13) & "Ek Puan Yok. Not Yeterli."
                                Else
                                    cikti = index.ToString() & ". Öğrencinin; " & Strings.ChrW(13) & Strings.ChrW(13) & "Eski Not: " & notlar(index2) & Strings.ChrW(13) & "Yeni Not: " & (Convert.ToInt32(otoeklenennot(index2)) + notlar(index2)) & Strings.ChrW(13) & "Eklenen Puan: " & otoeklenennot(index2)
                                End If
                                Console.WriteLine(cikti)
                                Delay(500)
                                index2 = index2 + 1
                            End If
                        Loop
                    Else
                        If secim2 = 2 Then
                            index = 0
                            index2 = 0
                            sync = False
                            Dim sayı1 As Integer, sayı2 As Integer, sayı3 As Integer, sayı4 As Integer, sayı5 As Integer
                            Dim soru1 As Integer, soru2 As Integer, soru3 As Integer, soru4 As Integer, soru5 As Integer
                            
                            ' Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                            ' Yaha henüz ben keşfedemedim :p
                            Delay(230)
                            soru1 = Puaneklesoru("1", notlar(index2))
                            index2 = index2 + 1
                            soru2 = Puaneklesoru("2", notlar(index2))
                            index2 = index2 + 1
                            soru3 = Puaneklesoru("3", notlar(index2))
                            index2 = index2 + 1
                            soru4 = Puaneklesoru("4", notlar(index2))
                            index2 = index2 + 1
                            soru5 = Puaneklesoru("5", notlar(index2))
                            Delay(600)
                            sync = True
                            Dim soruarray(5) As Integer
                            
                            soruarray(0) = soru1
                            soruarray(1) = soru2
                            soruarray(2) = soru3
                            soruarray(3) = soru4
                            soruarray(4) = soru5
                            If soru1 > 100 And soru1 < 0 Or soru2 > 100 And soru2 < 0 Or soru3 > 100 And soru3 < 0 Or soru4 > 100 And soru4 < 0 Or soru5 > 100 And soru5 < 0 Then
                                Console.WriteLine("Notların Son Hali 100 ve 0 Arasında Olmalıdır.")
                            Else
                                index2 = 0
                                sayı1 = soru1 + notlar(index2)
                                index2 = index2 + 1
                                sayı2 = soru2 + notlar(index2)
                                index2 = index2 + 1
                                sayı3 = soru3 + notlar(index2)
                                index2 = index2 + 1
                                sayı4 = soru4 + notlar(index2)
                                index2 = index2 + 1
                                sayı5 = soru5 + notlar(index2)
                                index2 = 0
                                index = 0
                                Dim sonsayılar(5) As Integer
                                
                                sonsayılar(0) = sayı1
                                sonsayılar(1) = sayı2
                                sonsayılar(2) = sayı3
                                sonsayılar(3) = sayı4
                                sonsayılar(4) = sayı5
                                Do While sync
                                    If index = 5 Then
                                        sync = False
                                    Else
                                        index = index + 1
                                        Console.WriteLine(index.ToString() & ". Öğrencinin; " & Strings.ChrW(13) & Strings.ChrW(13) & "Eski Not: " & notlar(index2) & Strings.ChrW(13) & "Yeni Not: " & sonsayılar(index2) & Strings.ChrW(13) & "Eklenen Puan: " & soruarray(index2))
                                        Delay(270)
                                        index2 = index2 + 1
                                    End If
                                Loop
                            End If
                        Else
                            If secim2 = 1 Then
                                Do While sync
                                    
                                    ' Bu döngü notları belirler.
                                    If index = 5 Then
                                        sync = False
                                        
                                        ' index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                                    Else
                                        index = index + 1
                                        notlar(index2) = random.Next(80)
                                        
                                        ' Random sayı belirle
                                        index2 = index2 + 1
                                        
                                        ' 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                                    End If
                                Loop
                                sync = True
                                index = 0
                                index2 = 0
                                
                                ' Değişkenleri sıfırlayalım
                                Do While sync
                                    
                                    ' Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                                    If index = 5 Then
                                        sync = False
                                    Else
                                        index = index + 1
                                        eskinotlar(index2) = notlar(index2)
                                        notlar(index2) = notlar(index2) + 20
                                        index2 = index2 + 1
                                    End If
                                Loop
                                sync = True
                                index = 0
                                index2 = 0
                                
                                ' Değişkenleri sıfırlayalım
                                Console.WriteLine("Yeni Notlar:")
                                Do While sync
                                    
                                    ' Bu döngü eski ve yeni notları bir arada yazdırır.
                                    If index = 5 Then
                                        sync = False
                                        
                                        ' Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                    Else
                                        index = index + 1
                                        If notlar(index2) > 100 Then
                                            notlar(index2) = 100
                                            Console.WriteLine(index.ToString() & ". Öğrencinin; " & Strings.ChrW(13) & Strings.ChrW(13) & "Eski Not: " & eskinotlar(index2) & Strings.ChrW(13) & "Yeni Not: " & notlar(index2))
                                        Else
                                            Console.WriteLine(index.ToString() & ". Öğrencinin; " & Strings.ChrW(13) & Strings.ChrW(13) & "Eski Not: " & eskinotlar(index2) & Strings.ChrW(13) & "Yeni Not: " & notlar(index2))
                                        End If
                                        
                                        ' 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                        Delay(500)
                                        
                                        ' 500 Milisaniyelik Gecikme
                                        index2 = index2 + 1
                                    End If
                                Loop
                            Else
                                Console.WriteLine("Lütfen 1, 2 veya 3 yazınız.")
                                Delay(1000)
                                Console.WriteLine("Program Kapatılıyor..")
                                index = 3
                                Do While sync
                                    If index = 0 Then
                                        sync = False
                                    Else
                                        Delay(1000)
                                        Console.WriteLine(index.ToString() & "..")
                                        index = index - 1
                                    End If
                                    
                                    ' Programın Kapatılması İçin Sayaç Oluştur
                                Loop
                            End If
                        End If
                    End If
                End If
            Else
                Dim helpnum As Integer, helpnum2 As Integer
                Dim [loop] As Integer, loop2 As Integer
                
                If secim = "a" Or secim = "A" Then
                    Console.WriteLine("1) Otomatik Mod Hakkında Yardım" & Strings.ChrW(13) & "2) Manuel Mod Hakkında Yardım")
                    helpnum = readValue()
                    Delay(200)
                    
                    ' Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                    [loop] = Yardımloop(helpnum)
                    Delay(200)
                    If [loop] = 1 Then
                        Console.WriteLine("Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.")
                        Delay(7800)
                        Console.WriteLine("Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.")
                        Delay(9000)
                        Console.WriteLine("Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.")
                    Else
                        Console.WriteLine("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" & Strings.ChrW(13) & "2) Manuel Puan Ekleme Hakkında Yardım" & Strings.ChrW(13) & "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım")
                        helpnum2 = readValue()
                        Delay(200)
                        loop2 = Yardımloop2(helpnum2)
                        Delay(200)
                        If loop2 = 1 Then
                            Console.WriteLine("Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.")
                        Else
                            If loop2 = 2 Then
                                Console.WriteLine("Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.")
                                Delay(7800)
                                Console.WriteLine("Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.")
                            Else
                                Console.WriteLine("Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.")
                                Delay(4500)
                                Console.WriteLine("Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.")
                                Delay(4500)
                                Console.WriteLine("Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.")
                                Delay(8000)
                                Console.WriteLine("Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır.")
                            End If
                        End If
                    End If
                Else
                    Console.WriteLine("Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!")
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
    
    Private Function Delay(sn As Integer) As Boolean
        ' Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
        Dim sonuc As Boolean
        Dim ms As Integer
        
        ms = sn * 33
        Dim n As Integer
        
        n = 0
        Do While n <> ms
            n = n + 1
        Loop
        sonuc = True
        
        ' Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
        ' boolen test
        ' test = delay(200)
        ' çıktı test  // true
        
        Return sonuc
    End Function
    
    Private Function Puanekle(puan As Integer) As String
        Dim sonuc As String
        Dim ekpuan(20) As Integer
        Dim index As Integer, index2 As Integer
        Dim sync As Boolean
        
        ' while döngüsü için
        sync = True
        index = 0
        If puan > 89 Then
            sonuc = "pass"
            
            ' 90 ve üstü notlar için puan ekleme olmaz.
        Else
            If puan > 69 Then
                index2 = 5
                Do While sync
                    If index = 6 Then
                        sync = False
                    Else
                        ekpuan(index) = index2
                        index = index + 1
                        index2 = index2 + 1
                    End If
                Loop
                sonuc = ekpuan(random.Next(6)).ToString()
                
                ' Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
            Else
                If puan > 49 Then
                    index2 = 10
                    Do While sync
                        If index = 9 Then
                            sync = False
                        Else
                            ekpuan(index) = index2
                            index = index + 1
                            index2 = index2 + 1
                        End If
                    Loop
                    sonuc = ekpuan(random.Next(9)).ToString()
                    
                    ' Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
                Else
                    If puan > 29 Then
                        index2 = 20
                        Do While sync
                            If index = 10 Then
                                sync = False
                            Else
                                ekpuan(index) = index2
                                index = index + 1
                                index2 = index2 + 1
                            End If
                        Loop
                        sonuc = ekpuan(random.Next(10)).ToString()
                        
                        ' Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                    Else
                        index2 = 30
                        Do While sync
                            If index = 11 Then
                                sync = False
                            Else
                                ekpuan(index) = index2
                                index = index + 1
                                index2 = index2 + 1
                            End If
                        Loop
                        sonuc = ekpuan(random.Next(11)).ToString()
                        
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
        
        Return sonuc
    End Function
    
    Private Function Puaneklesoru(no As String, eskinot As Integer) As Integer
        Dim sonuc As Integer
        
        Console.WriteLine(no & ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " & Strings.ChrW(13) & Strings.ChrW(13) & "Öğrencinin Puanı: " & eskinot)
        sonuc = readValue()
        
        Return sonuc
    End Function
    
    Private Function Yardımloop(sayı As Integer) As Integer
        Dim sonuc As Integer
        
        If sayı = 1 Or sayı = 2 Then
        Else
            Console.WriteLine("Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." & Strings.ChrW(13) & "Yeniden Başlatılıyor..")
            Delay(1000)
            Console.WriteLine("1) Otomatik Mod Hakkında Yardım" & Strings.ChrW(13) & "2) Manuel Mod Hakkında Yardım")
            sayı = readValue()
            Yardımloop(sayı)
        End If
        
        ' Yardım Modülü İçin
        ' Yanlış değer girildiğinde baştan başlatır
        sonuc = sayı
        
        Return sonuc
    End Function
    
    Private Function Yardımloop2(sayı As Integer) As Integer
        Dim sonuc As Integer
        
        If sayı = 1 Or sayı = 2 Or sayı = 3 Then
        Else
            Console.WriteLine("Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." & Strings.ChrW(13) & "Yeniden Başlatılıyor..")
            Delay(1000)
            Console.WriteLine("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" & Strings.ChrW(13) & "2) Manuel Puan Ekleme Hakkında Yardım" & Strings.ChrW(13) & "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım")
            sayı = readValue()
            Yardımloop2(sayı)
        End If
        sonuc = sayı
        
        Return sonuc
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
