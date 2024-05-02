object MyProgram {
    def main(args: Array[String]) {
        var sync : Boolean = false
        
        sync = true
        var secim : String = ""
        var index, index2 : Int = 0
        
        index = 0
        index2 = 0
        var notlar = new Array[Int](5)
        var eskinotlar = new Array[Int](5)
        var otonot = new Array[Int](20)
        var otoeklenennot = new Array[String](15)
        
        println("Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" + 13.toChar + 13.toChar + "Otomatik için: 'O'" + 13.toChar + "Manuel için: 'M'" + 13.toChar + "Yazın" + 13.toChar + 13.toChar + "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın")
        secim = readLine
        if (secim == "O" || secim == "o") {
            while (sync) {
                
                // Bu döngü notları belirler.
                if (index == 5) {
                    sync = false
                    
                    // index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                } else {
                    index = (index + 1).toInt
                    notlar(index2) = (Math.random * 80).toInt
                    
                    // Random sayı belirle
                    index2 = (index2 + 1).toInt
                    
                    // 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                }
            }
            sync = true
            index = 0
            index2 = 0
            
            // Değişkenleri sıfırlayalım
            while (sync) {
                
                // Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                if (index == 5) {
                    sync = false
                } else {
                    index = (index + 1).toInt
                    eskinotlar(index2) = notlar(index2)
                    notlar(index2) = (notlar(index2) + 20).toInt
                    index2 = (index2 + 1).toInt
                }
            }
            sync = true
            index = 0
            index2 = 0
            
            // Değişkenleri sıfırlayalım
            println("Yeni Notlar:")
            while (sync) {
                
                // Bu döngü eski ve yeni notları bir arada yazdırır.
                if (index == 5) {
                    sync = false
                    
                    // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                } else {
                    index = (index + 1).toInt
                    println(index.toString + ". Öğrencinin; " + 13.toChar + 13.toChar + "Eski Not: " + eskinotlar(index2) + 13.toChar + "Yeni Not: " + notlar(index2))
                    delay(500)
                    
                    // 500 Milisaniyelik Gecikme
                    index2 = (index2 + 1).toInt
                }
            }
        } else {
            if (secim == "M" || secim == "m") {
                println("1. Öğrencinin Notunu Giriniz: ")
                notlar(0) = readInt
                println("2. Öğrencinin Notunu Giriniz: ")
                notlar(1) = readInt
                println("3. Öğrencinin Notunu Giriniz: ")
                notlar(2) = readInt
                println("4. Öğrencinin Notunu Giriniz: ")
                notlar(3) = readInt
                println("5. Öğrencinin Notunu Giriniz: ")
                notlar(4) = readInt
                delay(800)
                var secim2 : Int = 0
                var devam : Boolean = false
                
                devam = true
                index = 0
                index2 = 0
                while (sync) {
                    if (index == 5) {
                        sync = false
                    } else {
                        index = (index + 1).toInt
                        if (notlar(index2) > 100) {
                            sync = false
                            devam = false
                        } else {
                            if (notlar(index2) < 0) {
                                sync = false
                                devam = false
                            } else {
                                index2 = (index2 + 1).toInt
                            }
                        }
                    }
                }
                if (!devam) {
                    println("Notlar 100 ve 0 Arasında Olmalıdır.")
                } else {
                    println("Size 3 Seçenek Sunuyoruz:" + 13.toChar + 13.toChar + "1) Herkesin Notuna +20 Puan Ekle" + 13.toChar + "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" + 13.toChar + "3) Sistem'in Kendi Not Ekleme Aracını Kullan")
                    secim2 = readInt
                    if (secim2 == 3) {
                        delay(59)
                        index = 0
                        index2 = 0
                        sync = true
                        while (sync) {
                            if (index == 5) {
                                sync = false
                            } else {
                                index = (index + 1).toInt
                                otoeklenennot(index2) = puanekle(notlar(index2))
                                
                                // Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                                delay(59)
                                if (otoeklenennot(index2) == "pass") {
                                    otoeklenennot(index2) = "0"
                                } else {
                                    otonot(index2) = (notlar(index2) + puanekle(notlar(index2)).toInt).toInt
                                }
                                index2 = (index2 + 1).toInt
                            }
                        }
                        index = 0
                        index2 = 0
                        sync = true
                        while (sync) {
                            if (index == 5) {
                                sync = false
                            } else {
                                index = (index + 1).toInt
                                var cikti : String = ""
                                
                                if (otoeklenennot(index2) == "0") {
                                    cikti = index.toString + ". Öğrencinin; " + 13.toChar + 13.toChar + "Eski Not: " + notlar(index2) + 13.toChar + "Yeni Not: " + notlar(index2) + 13.toChar + "Ek Puan Yok. Not Yeterli."
                                } else {
                                    cikti = index.toString + ". Öğrencinin; " + 13.toChar + 13.toChar + "Eski Not: " + notlar(index2) + 13.toChar + "Yeni Not: " + (otoeklenennot(index2).toInt + notlar(index2)) + 13.toChar + "Eklenen Puan: " + otoeklenennot(index2)
                                }
                                println(cikti)
                                delay(500)
                                index2 = (index2 + 1).toInt
                            }
                        }
                    } else {
                        if (secim2 == 2) {
                            index = 0
                            index2 = 0
                            sync = false
                            var sayı1, sayı2, sayı3, sayı4, sayı5 : Int = 0
                            var soru1, soru2, soru3, soru4, soru5 : Int = 0
                            
                            // Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                            // Yaha henüz ben keşfedemedim :p
                            delay(230)
                            soru1 = puaneklesoru("1", notlar(index2))
                            index2 = (index2 + 1).toInt
                            soru2 = puaneklesoru("2", notlar(index2))
                            index2 = (index2 + 1).toInt
                            soru3 = puaneklesoru("3", notlar(index2))
                            index2 = (index2 + 1).toInt
                            soru4 = puaneklesoru("4", notlar(index2))
                            index2 = (index2 + 1).toInt
                            soru5 = puaneklesoru("5", notlar(index2))
                            delay(600)
                            sync = true
                            var soruarray = new Array[Int](5)
                            
                            soruarray(0) = soru1
                            soruarray(1) = soru2
                            soruarray(2) = soru3
                            soruarray(3) = soru4
                            soruarray(4) = soru5
                            if (soru1 > 100 && soru1 < 0 || soru2 > 100 && soru2 < 0 || soru3 > 100 && soru3 < 0 || soru4 > 100 && soru4 < 0 || soru5 > 100 && soru5 < 0) {
                                println("Notların Son Hali 100 ve 0 Arasında Olmalıdır.")
                            } else {
                                index2 = 0
                                sayı1 = (soru1 + notlar(index2)).toInt
                                index2 = (index2 + 1).toInt
                                sayı2 = (soru2 + notlar(index2)).toInt
                                index2 = (index2 + 1).toInt
                                sayı3 = (soru3 + notlar(index2)).toInt
                                index2 = (index2 + 1).toInt
                                sayı4 = (soru4 + notlar(index2)).toInt
                                index2 = (index2 + 1).toInt
                                sayı5 = (soru5 + notlar(index2)).toInt
                                index2 = 0
                                index = 0
                                var sonsayılar = new Array[Int](5)
                                
                                sonsayılar(0) = sayı1
                                sonsayılar(1) = sayı2
                                sonsayılar(2) = sayı3
                                sonsayılar(3) = sayı4
                                sonsayılar(4) = sayı5
                                while (sync) {
                                    if (index == 5) {
                                        sync = false
                                    } else {
                                        index = (index + 1).toInt
                                        println(index.toString + ". Öğrencinin; " + 13.toChar + 13.toChar + "Eski Not: " + notlar(index2) + 13.toChar + "Yeni Not: " + sonsayılar(index2) + 13.toChar + "Eklenen Puan: " + soruarray(index2))
                                        delay(270)
                                        index2 = (index2 + 1).toInt
                                    }
                                }
                            }
                        } else {
                            if (secim2 == 1) {
                                while (sync) {
                                    
                                    // Bu döngü notları belirler.
                                    if (index == 5) {
                                        sync = false
                                        
                                        // index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                                    } else {
                                        index = (index + 1).toInt
                                        notlar(index2) = (Math.random * 80).toInt
                                        
                                        // Random sayı belirle
                                        index2 = (index2 + 1).toInt
                                        
                                        // 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                                    }
                                }
                                sync = true
                                index = 0
                                index2 = 0
                                
                                // Değişkenleri sıfırlayalım
                                while (sync) {
                                    
                                    // Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                                    if (index == 5) {
                                        sync = false
                                    } else {
                                        index = (index + 1).toInt
                                        eskinotlar(index2) = notlar(index2)
                                        notlar(index2) = (notlar(index2) + 20).toInt
                                        index2 = (index2 + 1).toInt
                                    }
                                }
                                sync = true
                                index = 0
                                index2 = 0
                                
                                // Değişkenleri sıfırlayalım
                                println("Yeni Notlar:")
                                while (sync) {
                                    
                                    // Bu döngü eski ve yeni notları bir arada yazdırır.
                                    if (index == 5) {
                                        sync = false
                                        
                                        // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                    } else {
                                        index = (index + 1).toInt
                                        if (notlar(index2) > 100) {
                                            notlar(index2) = 100
                                            println(index.toString + ". Öğrencinin; " + 13.toChar + 13.toChar + "Eski Not: " + eskinotlar(index2) + 13.toChar + "Yeni Not: " + notlar(index2))
                                        } else {
                                            println(index.toString + ". Öğrencinin; " + 13.toChar + 13.toChar + "Eski Not: " + eskinotlar(index2) + 13.toChar + "Yeni Not: " + notlar(index2))
                                        }
                                        
                                        // 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                        delay(500)
                                        
                                        // 500 Milisaniyelik Gecikme
                                        index2 = (index2 + 1).toInt
                                    }
                                }
                            } else {
                                println("Lütfen 1, 2 veya 3 yazınız.")
                                delay(1000)
                                println("Program Kapatılıyor..")
                                index = 3
                                while (sync) {
                                    if (index == 0) {
                                        sync = false
                                    } else {
                                        delay(1000)
                                        println(index.toString + "..")
                                        index = (index - 1).toInt
                                    }
                                    
                                    // Programın Kapatılması İçin Sayaç Oluştur
                                }
                            }
                        }
                    }
                }
            } else {
                var helpnum, helpnum2 : Int = 0
                var loop, loop2 : Int = 0
                
                if (secim == "a" || secim == "A") {
                    println("1) Otomatik Mod Hakkında Yardım" + 13.toChar + "2) Manuel Mod Hakkında Yardım")
                    helpnum = readInt
                    delay(200)
                    
                    // Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                    loop = yardımloop(helpnum)
                    delay(200)
                    if (loop == 1) {
                        println("Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.")
                        delay(7800)
                        println("Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.")
                        delay(9000)
                        println("Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.")
                    } else {
                        println("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + 13.toChar + "2) Manuel Puan Ekleme Hakkında Yardım" + 13.toChar + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım")
                        helpnum2 = readInt
                        delay(200)
                        loop2 = yardımloop2(helpnum2)
                        delay(200)
                        if (loop2 == 1) {
                            println("Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.")
                        } else {
                            if (loop2 == 2) {
                                println("Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.")
                                delay(7800)
                                println("Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.")
                            } else {
                                println("Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.")
                                delay(4500)
                                println("Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.")
                                delay(4500)
                                println("Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.")
                                delay(8000)
                                println("Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır.")
                            }
                        }
                    }
                } else {
                    println("Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!")
                }
            }
        }
        
        // 2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır.
        // 
        // Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir.
        // Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer.
        // 
        // 1. İşlem: Seçilen Notların Hepine 20 Puan Ekle
        // 2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler
        // 3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar.
        // 
        // 3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir.
    }
    
    def delay(sn : Int)  = {
        // Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
        var sonuc : Boolean = false
        var ms : Int = 0
        
        ms = (sn * 33).toInt
        var n : Int = 0
        
        n = 0
        while (n != ms) {
            n = (n + 1).toInt
        }
        sonuc = true
        
        // Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
        // boolen test
        // test = delay(200)
        // çıktı test  // true
        
        sonuc
    }
    
    def puanekle(puan : Int)  = {
        var sonuc : String = ""
        var ekpuan = new Array[Int](20)
        var index, index2 : Int = 0
        var sync : Boolean = false
        
        // while döngüsü için
        sync = true
        index = 0
        if (puan > 89) {
            sonuc = "pass"
            
            // 90 ve üstü notlar için puan ekleme olmaz.
        } else {
            if (puan > 69) {
                index2 = 5
                while (sync) {
                    if (index == 6) {
                        sync = false
                    } else {
                        ekpuan(index) = index2
                        index = (index + 1).toInt
                        index2 = (index2 + 1).toInt
                    }
                }
                sonuc = ekpuan((Math.random * 6).toInt).toString
                
                // Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
            } else {
                if (puan > 49) {
                    index2 = 10
                    while (sync) {
                        if (index == 9) {
                            sync = false
                        } else {
                            ekpuan(index) = index2
                            index = (index + 1).toInt
                            index2 = (index2 + 1).toInt
                        }
                    }
                    sonuc = ekpuan((Math.random * 9).toInt).toString
                    
                    // Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
                } else {
                    if (puan > 29) {
                        index2 = 20
                        while (sync) {
                            if (index == 10) {
                                sync = false
                            } else {
                                ekpuan(index) = index2
                                index = (index + 1).toInt
                                index2 = (index2 + 1).toInt
                            }
                        }
                        sonuc = ekpuan((Math.random * 10).toInt).toString
                        
                        // Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                    } else {
                        index2 = 30
                        while (sync) {
                            if (index == 11) {
                                sync = false
                            } else {
                                ekpuan(index) = index2
                                index = (index + 1).toInt
                                index2 = (index2 + 1).toInt
                            }
                        }
                        sonuc = ekpuan((Math.random * 11).toInt).toString
                        
                        // Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                    }
                }
            }
        }
        
        // String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
        // var sayı = 0.65   // Javascript
        // sayı = 0.65          // Python
        // local sayı = 0.65          // Lua
        // int sayı = 0.65     // C
        
        sonuc
    }
    
    def puaneklesoru(no : String, eskinot : Int)  = {
        var sonuc : Int = 0
        
        println(no + ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " + 13.toChar + 13.toChar + "Öğrencinin Puanı: " + eskinot)
        sonuc = readInt
        
        sonuc
    }
    
    def yardımloop(sayı : Int)  = {
        var sonuc : Int = 0
        
        if (sayı == 1 || sayı == 2) {
        } else {
            println("Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." + 13.toChar + "Yeniden Başlatılıyor..")
            delay(1000)
            println("1) Otomatik Mod Hakkında Yardım" + 13.toChar + "2) Manuel Mod Hakkında Yardım")
            sayı = readInt
            yardımloop(sayı)
        }
        
        // Yardım Modülü İçin
        // Yanlış değer girildiğinde baştan başlatır
        sonuc = sayı
        
        sonuc
    }
    
    def yardımloop2(sayı : Int)  = {
        var sonuc : Int = 0
        
        if (sayı == 1 || sayı == 2 || sayı == 3) {
        } else {
            println("Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." + 13.toChar + "Yeniden Başlatılıyor..")
            delay(1000)
            println("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + 13.toChar + "2) Manuel Puan Ekleme Hakkında Yardım" + 13.toChar + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım")
            sayı = readInt
            yardımloop2(sayı)
        }
        sonuc = sayı
        
        sonuc
    }
}
