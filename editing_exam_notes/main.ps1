function delay {
    param ( [int] $sn )
    process {
        # Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
        $ms = $sn * 33
        $n = 0
        While ($n -ne $ms) {
            $n = $n + 1
        }
        $sonuc = 1
        
        # Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
        # boolen test
        # test = delay(200)
        # çıktı test  // true
        return $sonuc
    }
}

function puanekle {
    param ( [int] $puan )
    process {
        $ekpuan = @(0 .. (20 - 1))
        
        # while döngüsü için
        $sync = 1
        $index = 0
        If ($puan -gt 89) {
            $sonuc = 'pass'
            
            # 90 ve üstü notlar için puan ekleme olmaz.
        } Else {
            If ($puan -gt 69) {
                $index2 = 5
                While ($sync) {
                    If ($index -eq 6) {
                        $sync = 0
                    } Else {
                        $ekpuan[$index] = $index2
                        $index = $index + 1
                        $index2 = $index2 + 1
                    }
                }
                $sonuc = [string] $ekpuan[Get-Random -Maximum 6]
                
                # Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
            } Else {
                If ($puan -gt 49) {
                    $index2 = 10
                    While ($sync) {
                        If ($index -eq 9) {
                            $sync = 0
                        } Else {
                            $ekpuan[$index] = $index2
                            $index = $index + 1
                            $index2 = $index2 + 1
                        }
                    }
                    $sonuc = [string] $ekpuan[Get-Random -Maximum 9]
                    
                    # Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
                } Else {
                    If ($puan -gt 29) {
                        $index2 = 20
                        While ($sync) {
                            If ($index -eq 10) {
                                $sync = 0
                            } Else {
                                $ekpuan[$index] = $index2
                                $index = $index + 1
                                $index2 = $index2 + 1
                            }
                        }
                        $sonuc = [string] $ekpuan[Get-Random -Maximum 10]
                        
                        # Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                    } Else {
                        $index2 = 30
                        While ($sync) {
                            If ($index -eq 11) {
                                $sync = 0
                            } Else {
                                $ekpuan[$index] = $index2
                                $index = $index + 1
                                $index2 = $index2 + 1
                            }
                        }
                        $sonuc = [string] $ekpuan[Get-Random -Maximum 11]
                        
                        # Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                    }
                }
            }
        }
        
        # String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
        # var sayı = 0.65   // Javascript
        # sayı = 0.65          // Python
        # local sayı = 0.65          // Lua
        # int sayı = 0.65     // C
        return $sonuc
    }
}

function puaneklesoru {
    param ( [string] $no, [int] $eskinot )
    process {
        Write-Host $($no + '. Öğrenci İçin Kaç Puan Eklemek İstersiniz: ' + [char] 13 + [char] 13 + 'Öğrencinin Puanı: ' + $eskinot)
        [int] $sonuc = Read-Host
        return $sonuc
    }
}

function yardımloop {
    param ( [int] $sayı )
    process {
        If ($sayı -eq 1 -or $sayı -eq 2) {
        } Else {
            Write-Host $('Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın.' + [char] 13 + 'Yeniden Başlatılıyor..')
            delay -sn 1000
            Write-Host $('1) Otomatik Mod Hakkında Yardım' + [char] 13 + '2) Manuel Mod Hakkında Yardım')
            [int] $sayı = Read-Host
            yardımloop -sayı $sayı
        }
        
        # Yardım Modülü İçin
        # Yanlış değer girildiğinde baştan başlatır
        $sonuc = $sayı
        return $sonuc
    }
}

function yardımloop2 {
    param ( [int] $sayı )
    process {
        If ($sayı -eq 1 -or $sayı -eq 2 -or $sayı -eq 3) {
        } Else {
            Write-Host $('Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın.' + [char] 13 + 'Yeniden Başlatılıyor..')
            delay -sn 1000
            Write-Host $('1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım' + [char] 13 + '2) Manuel Puan Ekleme Hakkında Yardım' + [char] 13 + '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım')
            [int] $sayı = Read-Host
            yardımloop2 -sayı $sayı
        }
        $sonuc = $sayı
        return $sonuc
    }
}

# Main

$sync = 1
$index = 0
$index2 = 0
$notlar = @(0 .. (5 - 1))
$eskinotlar = @(0 .. (5 - 1))
$otonot = @(0 .. (20 - 1))
$otoeklenennot = @(0 .. (15 - 1))

Write-Host $('Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?' + [char] 13 + [char] 13 + 'Otomatik için: \'O\'' + [char] 13 + 'Manuel için: \'M\'' + [char] 13 + 'Yazın' + [char] 13 + [char] 13 + 'Arayüz Hakkında Bilgi Almak İçin İse \'A\' Yazın')
$secim = Read-Host
If ($secim -eq 'O' -or $secim -eq 'o') {
    While ($sync) {
        
        # Bu döngü notları belirler.
        If ($index -eq 5) {
            $sync = 0
            
            # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
        } Else {
            $index = $index + 1
            $notlar[$index2] = Get-Random -Maximum 80
            
            # Random sayı belirle
            $index2 = $index2 + 1
            
            # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
        }
    }
    $sync = 1
    $index = 0
    $index2 = 0
    
    # Değişkenleri sıfırlayalım
    While ($sync) {
        
        # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
        If ($index -eq 5) {
            $sync = 0
        } Else {
            $index = $index + 1
            $eskinotlar[$index2] = $notlar[$index2]
            $notlar[$index2] = $notlar[$index2] + 20
            $index2 = $index2 + 1
        }
    }
    $sync = 1
    $index = 0
    $index2 = 0
    
    # Değişkenleri sıfırlayalım
    Write-Host 'Yeni Notlar:'
    While ($sync) {
        
        # Bu döngü eski ve yeni notları bir arada yazdırır.
        If ($index -eq 5) {
            $sync = 0
            
            # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
        } Else {
            $index = $index + 1
            Write-Host $([string] $index + '. Öğrencinin; ' + [char] 13 + [char] 13 + 'Eski Not: ' + $eskinotlar[$index2] + [char] 13 + 'Yeni Not: ' + $notlar[$index2])
            delay -sn 500
            
            # 500 Milisaniyelik Gecikme
            $index2 = $index2 + 1
        }
    }
} Else {
    If ($secim -eq 'M' -or $secim -eq 'm') {
        Write-Host '1. Öğrencinin Notunu Giriniz: '
        [int] $notlar[0] = Read-Host
        Write-Host '2. Öğrencinin Notunu Giriniz: '
        [int] $notlar[1] = Read-Host
        Write-Host '3. Öğrencinin Notunu Giriniz: '
        [int] $notlar[2] = Read-Host
        Write-Host '4. Öğrencinin Notunu Giriniz: '
        [int] $notlar[3] = Read-Host
        Write-Host '5. Öğrencinin Notunu Giriniz: '
        [int] $notlar[4] = Read-Host
        delay -sn 800
        $devam = 1
        $index = 0
        $index2 = 0
        While ($sync) {
            If ($index -eq 5) {
                $sync = 0
            } Else {
                $index = $index + 1
                If ($notlar[$index2] -gt 100) {
                    $sync = 0
                    $devam = 0
                } Else {
                    If ($notlar[$index2] -lt 0) {
                        $sync = 0
                        $devam = 0
                    } Else {
                        $index2 = $index2 + 1
                    }
                }
            }
        }
        If (-not $devam) {
            Write-Host 'Notlar 100 ve 0 Arasında Olmalıdır.'
        } Else {
            Write-Host $('Size 3 Seçenek Sunuyoruz:' + [char] 13 + [char] 13 + '1) Herkesin Notuna +20 Puan Ekle' + [char] 13 + '2) Herkesin Notuna Eklenecek Puanı Manuel Gir' + [char] 13 + '3) Sistem\'in Kendi Not Ekleme Aracını Kullan')
            [int] $secim2 = Read-Host
            If ($secim2 -eq 3) {
                delay -sn 59
                $index = 0
                $index2 = 0
                $sync = 1
                While ($sync) {
                    If ($index -eq 5) {
                        $sync = 0
                    } Else {
                        $index = $index + 1
                        $otoeklenennot[$index2] = puanekle -puan $notlar[$index2]
                        
                        # Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                        delay -sn 59
                        If ($otoeklenennot[$index2] -eq 'pass') {
                            $otoeklenennot[$index2] = '0'
                        } Else {
                            $otonot[$index2] = $notlar[$index2] + [int] (puanekle -puan $notlar[$index2])
                        }
                        $index2 = $index2 + 1
                    }
                }
                $index = 0
                $index2 = 0
                $sync = 1
                While ($sync) {
                    If ($index -eq 5) {
                        $sync = 0
                    } Else {
                        $index = $index + 1
                        If ($otoeklenennot[$index2] -eq '0') {
                            $cikti = [string] $index + '. Öğrencinin; ' + [char] 13 + [char] 13 + 'Eski Not: ' + $notlar[$index2] + [char] 13 + 'Yeni Not: ' + $notlar[$index2] + [char] 13 + 'Ek Puan Yok. Not Yeterli.'
                        } Else {
                            $cikti = [string] $index + '. Öğrencinin; ' + [char] 13 + [char] 13 + 'Eski Not: ' + $notlar[$index2] + [char] 13 + 'Yeni Not: ' + ([int] $otoeklenennot[$index2] + $notlar[$index2]) + [char] 13 + 'Eklenen Puan: ' + $otoeklenennot[$index2]
                        }
                        Write-Host $cikti
                        delay -sn 500
                        $index2 = $index2 + 1
                    }
                }
            } Else {
                If ($secim2 -eq 2) {
                    $index = 0
                    $index2 = 0
                    $sync = 0
                    
                    # Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                    # Yaha henüz ben keşfedemedim :p
                    delay -sn 230
                    $soru1 = puaneklesoru -no '1' -eskinot $notlar[$index2]
                    $index2 = $index2 + 1
                    $soru2 = puaneklesoru -no '2' -eskinot $notlar[$index2]
                    $index2 = $index2 + 1
                    $soru3 = puaneklesoru -no '3' -eskinot $notlar[$index2]
                    $index2 = $index2 + 1
                    $soru4 = puaneklesoru -no '4' -eskinot $notlar[$index2]
                    $index2 = $index2 + 1
                    $soru5 = puaneklesoru -no '5' -eskinot $notlar[$index2]
                    delay -sn 600
                    $sync = 1
                    $soruarray = @(0 .. (5 - 1))
                    
                    $soruarray[0] = $soru1
                    $soruarray[1] = $soru2
                    $soruarray[2] = $soru3
                    $soruarray[3] = $soru4
                    $soruarray[4] = $soru5
                    If ($soru1 -gt 100 -and $soru1 -lt 0 -or ($soru2 -gt 100 -and $soru2 -lt 0) -or ($soru3 -gt 100 -and $soru3 -lt 0) -or ($soru4 -gt 100 -and $soru4 -lt 0) -or ($soru5 -gt 100 -and $soru5 -lt 0)) {
                        Write-Host 'Notların Son Hali 100 ve 0 Arasında Olmalıdır.'
                    } Else {
                        $index2 = 0
                        $sayı1 = $soru1 + $notlar[$index2]
                        $index2 = $index2 + 1
                        $sayı2 = $soru2 + $notlar[$index2]
                        $index2 = $index2 + 1
                        $sayı3 = $soru3 + $notlar[$index2]
                        $index2 = $index2 + 1
                        $sayı4 = $soru4 + $notlar[$index2]
                        $index2 = $index2 + 1
                        $sayı5 = $soru5 + $notlar[$index2]
                        $index2 = 0
                        $index = 0
                        $sonsayılar = @(0 .. (5 - 1))
                        
                        $sonsayılar[0] = $sayı1
                        $sonsayılar[1] = $sayı2
                        $sonsayılar[2] = $sayı3
                        $sonsayılar[3] = $sayı4
                        $sonsayılar[4] = $sayı5
                        While ($sync) {
                            If ($index -eq 5) {
                                $sync = 0
                            } Else {
                                $index = $index + 1
                                Write-Host $([string] $index + '. Öğrencinin; ' + [char] 13 + [char] 13 + 'Eski Not: ' + $notlar[$index2] + [char] 13 + 'Yeni Not: ' + $sonsayılar[$index2] + [char] 13 + 'Eklenen Puan: ' + $soruarray[$index2])
                                delay -sn 270
                                $index2 = $index2 + 1
                            }
                        }
                    }
                } Else {
                    If ($secim2 -eq 1) {
                        While ($sync) {
                            
                            # Bu döngü notları belirler.
                            If ($index -eq 5) {
                                $sync = 0
                                
                                # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                            } Else {
                                $index = $index + 1
                                $notlar[$index2] = Get-Random -Maximum 80
                                
                                # Random sayı belirle
                                $index2 = $index2 + 1
                                
                                # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                            }
                        }
                        $sync = 1
                        $index = 0
                        $index2 = 0
                        
                        # Değişkenleri sıfırlayalım
                        While ($sync) {
                            
                            # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                            If ($index -eq 5) {
                                $sync = 0
                            } Else {
                                $index = $index + 1
                                $eskinotlar[$index2] = $notlar[$index2]
                                $notlar[$index2] = $notlar[$index2] + 20
                                $index2 = $index2 + 1
                            }
                        }
                        $sync = 1
                        $index = 0
                        $index2 = 0
                        
                        # Değişkenleri sıfırlayalım
                        Write-Host 'Yeni Notlar:'
                        While ($sync) {
                            
                            # Bu döngü eski ve yeni notları bir arada yazdırır.
                            If ($index -eq 5) {
                                $sync = 0
                                
                                # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                            } Else {
                                $index = $index + 1
                                If ($notlar[$index2] -gt 100) {
                                    $notlar[$index2] = 100
                                    Write-Host $([string] $index + '. Öğrencinin; ' + [char] 13 + [char] 13 + 'Eski Not: ' + $eskinotlar[$index2] + [char] 13 + 'Yeni Not: ' + $notlar[$index2])
                                } Else {
                                    Write-Host $([string] $index + '. Öğrencinin; ' + [char] 13 + [char] 13 + 'Eski Not: ' + $eskinotlar[$index2] + [char] 13 + 'Yeni Not: ' + $notlar[$index2])
                                }
                                
                                # 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                delay -sn 500
                                
                                # 500 Milisaniyelik Gecikme
                                $index2 = $index2 + 1
                            }
                        }
                    } Else {
                        Write-Host 'Lütfen 1, 2 veya 3 yazınız.'
                        delay -sn 1000
                        Write-Host 'Program Kapatılıyor..'
                        $index = 3
                        While ($sync) {
                            If ($index -eq 0) {
                                $sync = 0
                            } Else {
                                delay -sn 1000
                                Write-Host $([string] $index + '..')
                                $index = $index - 1
                            }
                            
                            # Programın Kapatılması İçin Sayaç Oluştur
                        }
                    }
                }
            }
        }
    } Else {
        If ($secim -eq 'a' -or $secim -eq 'A') {
            Write-Host $('1) Otomatik Mod Hakkında Yardım' + [char] 13 + '2) Manuel Mod Hakkında Yardım')
            [int] $helpnum = Read-Host
            delay -sn 200
            
            # Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
            $loop = yardımloop -sayı $helpnum
            delay -sn 200
            If ($loop -eq 1) {
                Write-Host 'Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.'
                delay -sn 7800
                Write-Host 'Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.'
                delay -sn 9000
                Write-Host 'Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.'
            } Else {
                Write-Host $('1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım' + [char] 13 + '2) Manuel Puan Ekleme Hakkında Yardım' + [char] 13 + '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım')
                [int] $helpnum2 = Read-Host
                delay -sn 200
                $loop2 = yardımloop2 -sayı $helpnum2
                delay -sn 200
                If ($loop2 -eq 1) {
                    Write-Host 'Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.'
                } Else {
                    If ($loop2 -eq 2) {
                        Write-Host 'Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.'
                        delay -sn 7800
                        Write-Host 'Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.'
                    } Else {
                        Write-Host 'Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.'
                        delay -sn 4500
                        Write-Host 'Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.'
                        delay -sn 4500
                        Write-Host 'Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.'
                        delay -sn 8000
                        Write-Host 'Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt\'a (ekrana) yazdırılır.'
                    }
                }
            }
        } Else {
            Write-Host 'Lütfen Sadece \'M\' veya \'O\' Harflerini Giriniz!'
        }
    }
}

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
