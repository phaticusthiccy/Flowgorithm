import Foundation

func delay(sn: Int) -> Boolean {
    // Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    var sonuc : Boolean
    var ms : Int
    
    ms = sn * 33
    var n : Int
    
    n = 0
    while n != ms {
        n = n + 1
    }
    sonuc = true
    
    // Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
    // boolen test
    // test = delay(200)
    // çıktı test  // true
    
    return sonuc
}

func puanekle(puan: Int) -> String {
    var sonuc : String
    var ekpuan = [Int](repeating: 0, count: 20)
    var index : Int, index2 : Int
    var sync : Boolean
    
    // while döngüsü için
    sync = true
    index = 0
    if puan > 89 {
        sonuc = "pass"
        
        // 90 ve üstü notlar için puan ekleme olmaz.
    } else {
        if puan > 69 {
            index2 = 5
            while sync {
                if index == 6 {
                    sync = false
                } else {
                    ekpuan[index] = index2
                    index = index + 1
                    index2 = index2 + 1
                }
            }
            sonuc = String(ekpuan[(random() % 6)])
            
            // Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
        } else {
            if puan > 49 {
                index2 = 10
                while sync {
                    if index == 9 {
                        sync = false
                    } else {
                        ekpuan[index] = index2
                        index = index + 1
                        index2 = index2 + 1
                    }
                }
                sonuc = String(ekpuan[(random() % 9)])
                
                // Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
            } else {
                if puan > 29 {
                    index2 = 20
                    while sync {
                        if index == 10 {
                            sync = false
                        } else {
                            ekpuan[index] = index2
                            index = index + 1
                            index2 = index2 + 1
                        }
                    }
                    sonuc = String(ekpuan[(random() % 10)])
                    
                    // Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                } else {
                    index2 = 30
                    while sync {
                        if index == 11 {
                            sync = false
                        } else {
                            ekpuan[index] = index2
                            index = index + 1
                            index2 = index2 + 1
                        }
                    }
                    sonuc = String(ekpuan[(random() % 11)])
                    
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
    
    return sonuc
}

func puaneklesoru(no: String, eskinot: Int) -> Int {
    var sonuc : Int
    
    print(no + ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Öğrencinin Puanı: " + String(eskinot))
    sonuc = Int(readLine()!)!
    
    return sonuc
}

func yardımloop(sayı: Int) -> Int {
    var sonuc : Int
    
    if sayı == 1 || sayı == 2 {
    } else {
        print("Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." + String(UnicodeScalar(13)) + "Yeniden Başlatılıyor..")
        delay(sn: 1000)
        print("1) Otomatik Mod Hakkında Yardım" + String(UnicodeScalar(13)) + "2) Manuel Mod Hakkında Yardım")
        sayı = Int(readLine()!)!
        yardımloop(sayı: sayı)
    }
    
    // Yardım Modülü İçin
    // Yanlış değer girildiğinde baştan başlatır
    sonuc = sayı
    
    return sonuc
}

func yardımloop2(sayı: Int) -> Int {
    var sonuc : Int
    
    if sayı == 1 || sayı == 2 || sayı == 3 {
    } else {
        print("Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." + String(UnicodeScalar(13)) + "Yeniden Başlatılıyor..")
        delay(sn: 1000)
        print("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + String(UnicodeScalar(13)) + "2) Manuel Puan Ekleme Hakkında Yardım" + String(UnicodeScalar(13)) + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım")
        sayı = Int(readLine()!)!
        yardımloop2(sayı: sayı)
    }
    sonuc = sayı
    
    return sonuc
}

// Main
srandom(UInt32(time(nil)))   //Prepare random number generator
var sync : Boolean

sync = true
var secim : String
var index : Int, index2 : Int

index = 0
index2 = 0
var notlar = [Int](repeating: 0, count: 5)
var eskinotlar = [Int](repeating: 0, count: 5)
var otonot = [Int](repeating: 0, count: 20)
var otoeklenennot = [String](repeating: "", count: 15)

print("Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Otomatik için: 'O'" + String(UnicodeScalar(13)) + "Manuel için: 'M'" + String(UnicodeScalar(13)) + "Yazın" + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın")
secim = readLine()!
if secim == "O" || secim == "o" {
    while sync {
        
        // Bu döngü notları belirler.
        if index == 5 {
            sync = false
            
            // index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
        } else {
            index = index + 1
            notlar[index2] = (random() % 80)
            
            // Random sayı belirle
            index2 = index2 + 1
            
            // 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
        }
    }
    sync = true
    index = 0
    index2 = 0
    
    // Değişkenleri sıfırlayalım
    while sync {
        
        // Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
        if index == 5 {
            sync = false
        } else {
            index = index + 1
            eskinotlar[index2] = notlar[index2]
            notlar[index2] = notlar[index2] + 20
            index2 = index2 + 1
        }
    }
    sync = true
    index = 0
    index2 = 0
    
    // Değişkenleri sıfırlayalım
    print("Yeni Notlar:")
    while sync {
        
        // Bu döngü eski ve yeni notları bir arada yazdırır.
        if index == 5 {
            sync = false
            
            // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
        } else {
            index = index + 1
            print(String(index) + ". Öğrencinin; " + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Eski Not: " + String(eskinotlar[index2]) + String(UnicodeScalar(13)) + "Yeni Not: " + String(notlar[index2]))
            delay(sn: 500)
            
            // 500 Milisaniyelik Gecikme
            index2 = index2 + 1
        }
    }
} else {
    if secim == "M" || secim == "m" {
        print("1. Öğrencinin Notunu Giriniz: ")
        notlar[0] = Int(readLine()!)!
        print("2. Öğrencinin Notunu Giriniz: ")
        notlar[1] = Int(readLine()!)!
        print("3. Öğrencinin Notunu Giriniz: ")
        notlar[2] = Int(readLine()!)!
        print("4. Öğrencinin Notunu Giriniz: ")
        notlar[3] = Int(readLine()!)!
        print("5. Öğrencinin Notunu Giriniz: ")
        notlar[4] = Int(readLine()!)!
        delay(sn: 800)
        var secim2 : Int
        var devam : Boolean
        
        devam = true
        index = 0
        index2 = 0
        while sync {
            if index == 5 {
                sync = false
            } else {
                index = index + 1
                if notlar[index2] > 100 {
                    sync = false
                    devam = false
                } else {
                    if notlar[index2] < 0 {
                        sync = false
                        devam = false
                    } else {
                        index2 = index2 + 1
                    }
                }
            }
        }
        if !devam {
            print("Notlar 100 ve 0 Arasında Olmalıdır.")
        } else {
            print("Size 3 Seçenek Sunuyoruz:" + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "1) Herkesin Notuna +20 Puan Ekle" + String(UnicodeScalar(13)) + "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" + String(UnicodeScalar(13)) + "3) Sistem'in Kendi Not Ekleme Aracını Kullan")
            secim2 = Int(readLine()!)!
            if secim2 == 3 {
                delay(sn: 59)
                index = 0
                index2 = 0
                sync = true
                while sync {
                    if index == 5 {
                        sync = false
                    } else {
                        index = index + 1
                        otoeklenennot[index2] = puanekle(puan: notlar[index2])
                        
                        // Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                        delay(sn: 59)
                        if otoeklenennot[index2] == "pass" {
                            otoeklenennot[index2] = "0"
                        } else {
                            otonot[index2] = notlar[index2] + Int(puanekle(puan: notlar[index2]))
                        }
                        index2 = index2 + 1
                    }
                }
                index = 0
                index2 = 0
                sync = true
                while sync {
                    if index == 5 {
                        sync = false
                    } else {
                        index = index + 1
                        var cikti : String
                        
                        if otoeklenennot[index2] == "0" {
                            cikti = String(index) + ". Öğrencinin; " + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Eski Not: " + String(notlar[index2]) + String(UnicodeScalar(13)) + "Yeni Not: " + String(notlar[index2]) + String(UnicodeScalar(13)) + "Ek Puan Yok. Not Yeterli."
                        } else {
                            cikti = String(index) + ". Öğrencinin; " + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Eski Not: " + String(notlar[index2]) + String(UnicodeScalar(13)) + "Yeni Not: " + String(Int(otoeklenennot[index2]) + notlar[index2]) + String(UnicodeScalar(13)) + "Eklenen Puan: " + otoeklenennot[index2]
                        }
                        print(cikti)
                        delay(sn: 500)
                        index2 = index2 + 1
                    }
                }
            } else {
                if secim2 == 2 {
                    index = 0
                    index2 = 0
                    sync = false
                    var sayı1 : Int, sayı2 : Int, sayı3 : Int, sayı4 : Int, sayı5 : Int
                    var soru1 : Int, soru2 : Int, soru3 : Int, soru4 : Int, soru5 : Int
                    
                    // Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                    // Yaha henüz ben keşfedemedim :p
                    delay(sn: 230)
                    soru1 = puaneklesoru(no: "1", eskinot: notlar[index2])
                    index2 = index2 + 1
                    soru2 = puaneklesoru(no: "2", eskinot: notlar[index2])
                    index2 = index2 + 1
                    soru3 = puaneklesoru(no: "3", eskinot: notlar[index2])
                    index2 = index2 + 1
                    soru4 = puaneklesoru(no: "4", eskinot: notlar[index2])
                    index2 = index2 + 1
                    soru5 = puaneklesoru(no: "5", eskinot: notlar[index2])
                    delay(sn: 600)
                    sync = true
                    var soruarray = [Int](repeating: 0, count: 5)
                    
                    soruarray[0] = soru1
                    soruarray[1] = soru2
                    soruarray[2] = soru3
                    soruarray[3] = soru4
                    soruarray[4] = soru5
                    if soru1 > 100 && soru1 < 0 || soru2 > 100 && soru2 < 0 || soru3 > 100 && soru3 < 0 || soru4 > 100 && soru4 < 0 || soru5 > 100 && soru5 < 0 {
                        print("Notların Son Hali 100 ve 0 Arasında Olmalıdır.")
                    } else {
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
                        var sonsayılar = [Int](repeating: 0, count: 5)
                        
                        sonsayılar[0] = sayı1
                        sonsayılar[1] = sayı2
                        sonsayılar[2] = sayı3
                        sonsayılar[3] = sayı4
                        sonsayılar[4] = sayı5
                        while sync {
                            if index == 5 {
                                sync = false
                            } else {
                                index = index + 1
                                print(String(index) + ". Öğrencinin; " + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Eski Not: " + String(notlar[index2]) + String(UnicodeScalar(13)) + "Yeni Not: " + String(sonsayılar[index2]) + String(UnicodeScalar(13)) + "Eklenen Puan: " + String(soruarray[index2]))
                                delay(sn: 270)
                                index2 = index2 + 1
                            }
                        }
                    }
                } else {
                    if secim2 == 1 {
                        while sync {
                            
                            // Bu döngü notları belirler.
                            if index == 5 {
                                sync = false
                                
                                // index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                            } else {
                                index = index + 1
                                notlar[index2] = (random() % 80)
                                
                                // Random sayı belirle
                                index2 = index2 + 1
                                
                                // 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                            }
                        }
                        sync = true
                        index = 0
                        index2 = 0
                        
                        // Değişkenleri sıfırlayalım
                        while sync {
                            
                            // Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                            if index == 5 {
                                sync = false
                            } else {
                                index = index + 1
                                eskinotlar[index2] = notlar[index2]
                                notlar[index2] = notlar[index2] + 20
                                index2 = index2 + 1
                            }
                        }
                        sync = true
                        index = 0
                        index2 = 0
                        
                        // Değişkenleri sıfırlayalım
                        print("Yeni Notlar:")
                        while sync {
                            
                            // Bu döngü eski ve yeni notları bir arada yazdırır.
                            if index == 5 {
                                sync = false
                                
                                // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                            } else {
                                index = index + 1
                                if notlar[index2] > 100 {
                                    notlar[index2] = 100
                                    print(String(index) + ". Öğrencinin; " + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Eski Not: " + String(eskinotlar[index2]) + String(UnicodeScalar(13)) + "Yeni Not: " + String(notlar[index2]))
                                } else {
                                    print(String(index) + ". Öğrencinin; " + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Eski Not: " + String(eskinotlar[index2]) + String(UnicodeScalar(13)) + "Yeni Not: " + String(notlar[index2]))
                                }
                                
                                // 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                delay(sn: 500)
                                
                                // 500 Milisaniyelik Gecikme
                                index2 = index2 + 1
                            }
                        }
                    } else {
                        print("Lütfen 1, 2 veya 3 yazınız.")
                        delay(sn: 1000)
                        print("Program Kapatılıyor..")
                        index = 3
                        while sync {
                            if index == 0 {
                                sync = false
                            } else {
                                delay(sn: 1000)
                                print(String(index) + "..")
                                index = index - 1
                            }
                            
                            // Programın Kapatılması İçin Sayaç Oluştur
                        }
                    }
                }
            }
        }
    } else {
        var helpnum : Int, helpnum2 : Int
        var loop : Int, loop2 : Int
        
        if secim == "a" || secim == "A" {
            print("1) Otomatik Mod Hakkında Yardım" + String(UnicodeScalar(13)) + "2) Manuel Mod Hakkında Yardım")
            helpnum = Int(readLine()!)!
            delay(sn: 200)
            
            // Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
            loop = yardımloop(sayı: helpnum)
            delay(sn: 200)
            if loop == 1 {
                print("Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.")
                delay(sn: 7800)
                print("Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.")
                delay(sn: 9000)
                print("Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.")
            } else {
                print("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + String(UnicodeScalar(13)) + "2) Manuel Puan Ekleme Hakkında Yardım" + String(UnicodeScalar(13)) + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım")
                helpnum2 = Int(readLine()!)!
                delay(sn: 200)
                loop2 = yardımloop2(sayı: helpnum2)
                delay(sn: 200)
                if loop2 == 1 {
                    print("Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.")
                } else {
                    if loop2 == 2 {
                        print("Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.")
                        delay(sn: 7800)
                        print("Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.")
                    } else {
                        print("Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.")
                        delay(sn: 4500)
                        print("Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.")
                        delay(sn: 4500)
                        print("Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.")
                        delay(sn: 8000)
                        print("Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır.")
                    }
                }
            }
        } else {
            print("Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!")
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
