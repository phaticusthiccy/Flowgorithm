<?php
# The following function is called whenever your program needs to input data.
# You can change it to use other sources rather than fgets().
function input() {
    return fgets(STDIN);
}

function delay($sn) {
    # Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    $ms = $sn * 33;
    $n = 0;
    while ($n != $ms) {
        $n = $n + 1;
    }
    $sonuc = True;
    
    # Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
    # boolen test
    # test = delay(200)
    # çıktı test  // true
    
    return sonuc;
}

function puanekle($puan) {
    ekpuan = array();
    
    # while döngüsü için
    $sync = True;
    $index = 0;
    if ($puan > 89) {
        $sonuc = "pass";
        
        # 90 ve üstü notlar için puan ekleme olmaz.
    } else {
        if ($puan > 69) {
            $index2 = 5;
            while ($sync) {
                if ($index == 6) {
                    $sync = False;
                } else {
                    $ekpuan[$index] = $index2;
                    $index = $index + 1;
                    $index2 = $index2 + 1;
                }
            }
            $sonuc = (string) $ekpuan[rand(0, 6 - 1)];
            
            # Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
        } else {
            if ($puan > 49) {
                $index2 = 10;
                while ($sync) {
                    if ($index == 9) {
                        $sync = False;
                    } else {
                        $ekpuan[$index] = $index2;
                        $index = $index + 1;
                        $index2 = $index2 + 1;
                    }
                }
                $sonuc = (string) $ekpuan[rand(0, 9 - 1)];
                
                # Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
            } else {
                if ($puan > 29) {
                    $index2 = 20;
                    while ($sync) {
                        if ($index == 10) {
                            $sync = False;
                        } else {
                            $ekpuan[$index] = $index2;
                            $index = $index + 1;
                            $index2 = $index2 + 1;
                        }
                    }
                    $sonuc = (string) $ekpuan[rand(0, 10 - 1)];
                    
                    # Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                } else {
                    $index2 = 30;
                    while ($sync) {
                        if ($index == 11) {
                            $sync = False;
                        } else {
                            $ekpuan[$index] = $index2;
                            $index = $index + 1;
                            $index2 = $index2 + 1;
                        }
                    }
                    $sonuc = (string) $ekpuan[rand(0, 11 - 1)];
                    
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
    
    return sonuc;
}

function puaneklesoru($no, $eskinot) {
    echo $no . ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " . chr(13) . chr(13) . "Öğrencinin Puanı: " . $eskinot . PHP_EOL;
    $sonuc = input();
    
    return sonuc;
}

function yardımloop($sayı) {
    if ($sayı == 1 || $sayı == 2) {
    } else {
        echo "Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." . chr(13) . "Yeniden Başlatılıyor.." . PHP_EOL;
        delay(1000);
        echo "1) Otomatik Mod Hakkında Yardım" . chr(13) . "2) Manuel Mod Hakkında Yardım" . PHP_EOL;
        $sayı = input();
        yardımloop($sayı);
    }
    
    # Yardım Modülü İçin
    # Yanlış değer girildiğinde baştan başlatır
    $sonuc = $sayı;
    
    return sonuc;
}

function yardımloop2($sayı) {
    if ($sayı == 1 || $sayı == 2 || $sayı == 3) {
    } else {
        echo "Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." . chr(13) . "Yeniden Başlatılıyor.." . PHP_EOL;
        delay(1000);
        echo "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" . chr(13) . "2) Manuel Puan Ekleme Hakkında Yardım" . chr(13) . "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım" . PHP_EOL;
        $sayı = input();
        yardımloop2($sayı);
    }
    $sonuc = $sayı;
    
    return sonuc;
}

# Main
$sync = True;
$index = 0;
$index2 = 0;
notlar = array();
eskinotlar = array();
otonot = array();
otoeklenennot = array();

echo "Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" . chr(13) . chr(13) . "Otomatik için: 'O'" . chr(13) . "Manuel için: 'M'" . chr(13) . "Yazın" . chr(13) . chr(13) . "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın" . PHP_EOL;
$secim = input();
if ($secim == "O" || $secim == "o") {
    while ($sync) {
        
        # Bu döngü notları belirler.
        if ($index == 5) {
            $sync = False;
            
            # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
        } else {
            $index = $index + 1;
            $notlar[$index2] = rand(0, 80 - 1);
            
            # Random sayı belirle
            $index2 = $index2 + 1;
            
            # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
        }
    }
    $sync = True;
    $index = 0;
    $index2 = 0;
    
    # Değişkenleri sıfırlayalım
    while ($sync) {
        
        # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
        if ($index == 5) {
            $sync = False;
        } else {
            $index = $index + 1;
            $eskinotlar[$index2] = $notlar[$index2];
            $notlar[$index2] = $notlar[$index2] + 20;
            $index2 = $index2 + 1;
        }
    }
    $sync = True;
    $index = 0;
    $index2 = 0;
    
    # Değişkenleri sıfırlayalım
    echo "Yeni Notlar:" . PHP_EOL;
    while ($sync) {
        
        # Bu döngü eski ve yeni notları bir arada yazdırır.
        if ($index == 5) {
            $sync = False;
            
            # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
        } else {
            $index = $index + 1;
            echo (string) $index . ". Öğrencinin; " . chr(13) . chr(13) . "Eski Not: " . $eskinotlar[$index2] . chr(13) . "Yeni Not: " . $notlar[$index2] . PHP_EOL;
            delay(500);
            
            # 500 Milisaniyelik Gecikme
            $index2 = $index2 + 1;
        }
    }
} else {
    if ($secim == "M" || $secim == "m") {
        echo "1. Öğrencinin Notunu Giriniz: " . PHP_EOL;
        $notlar[0] = input();
        echo "2. Öğrencinin Notunu Giriniz: " . PHP_EOL;
        $notlar[1] = input();
        echo "3. Öğrencinin Notunu Giriniz: " . PHP_EOL;
        $notlar[2] = input();
        echo "4. Öğrencinin Notunu Giriniz: " . PHP_EOL;
        $notlar[3] = input();
        echo "5. Öğrencinin Notunu Giriniz: " . PHP_EOL;
        $notlar[4] = input();
        delay(800);
        $devam = True;
        $index = 0;
        $index2 = 0;
        while ($sync) {
            if ($index == 5) {
                $sync = False;
            } else {
                $index = $index + 1;
                if ($notlar[$index2] > 100) {
                    $sync = False;
                    $devam = False;
                } else {
                    if ($notlar[$index2] < 0) {
                        $sync = False;
                        $devam = False;
                    } else {
                        $index2 = $index2 + 1;
                    }
                }
            }
        }
        if (!$devam) {
            echo "Notlar 100 ve 0 Arasında Olmalıdır." . PHP_EOL;
        } else {
            echo "Size 3 Seçenek Sunuyoruz:" . chr(13) . chr(13) . "1) Herkesin Notuna +20 Puan Ekle" . chr(13) . "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" . chr(13) . "3) Sistem'in Kendi Not Ekleme Aracını Kullan" . PHP_EOL;
            $secim2 = input();
            if ($secim2 == 3) {
                delay(59);
                $index = 0;
                $index2 = 0;
                $sync = True;
                while ($sync) {
                    if ($index == 5) {
                        $sync = False;
                    } else {
                        $index = $index + 1;
                        $otoeklenennot[$index2] = puanekle($notlar[$index2]);
                        
                        # Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                        delay(59);
                        if ($otoeklenennot[$index2] == "pass") {
                            $otoeklenennot[$index2] = "0";
                        } else {
                            $otonot[$index2] = $notlar[$index2] + (int) puanekle($notlar[$index2]);
                        }
                        $index2 = $index2 + 1;
                    }
                }
                $index = 0;
                $index2 = 0;
                $sync = True;
                while ($sync) {
                    if ($index == 5) {
                        $sync = False;
                    } else {
                        $index = $index + 1;
                        if ($otoeklenennot[$index2] == "0") {
                            $cikti = (string) $index . ". Öğrencinin; " . chr(13) . chr(13) . "Eski Not: " . $notlar[$index2] . chr(13) . "Yeni Not: " . $notlar[$index2] . chr(13) . "Ek Puan Yok. Not Yeterli.";
                        } else {
                            $cikti = (string) $index . ". Öğrencinin; " . chr(13) . chr(13) . "Eski Not: " . $notlar[$index2] . chr(13) . "Yeni Not: " . ((int) $otoeklenennot[$index2] + $notlar[$index2]) . chr(13) . "Eklenen Puan: " . $otoeklenennot[$index2];
                        }
                        echo $cikti . PHP_EOL;
                        delay(500);
                        $index2 = $index2 + 1;
                    }
                }
            } else {
                if ($secim2 == 2) {
                    $index = 0;
                    $index2 = 0;
                    $sync = False;
                    
                    # Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                    # Yaha henüz ben keşfedemedim :p
                    delay(230);
                    $soru1 = puaneklesoru("1", $notlar[$index2]);
                    $index2 = $index2 + 1;
                    $soru2 = puaneklesoru("2", $notlar[$index2]);
                    $index2 = $index2 + 1;
                    $soru3 = puaneklesoru("3", $notlar[$index2]);
                    $index2 = $index2 + 1;
                    $soru4 = puaneklesoru("4", $notlar[$index2]);
                    $index2 = $index2 + 1;
                    $soru5 = puaneklesoru("5", $notlar[$index2]);
                    delay(600);
                    $sync = True;
                    soruarray = array();
                    
                    $soruarray[0] = $soru1;
                    $soruarray[1] = $soru2;
                    $soruarray[2] = $soru3;
                    $soruarray[3] = $soru4;
                    $soruarray[4] = $soru5;
                    if ($soru1 > 100 && $soru1 < 0 || $soru2 > 100 && $soru2 < 0 || $soru3 > 100 && $soru3 < 0 || $soru4 > 100 && $soru4 < 0 || $soru5 > 100 && $soru5 < 0) {
                        echo "Notların Son Hali 100 ve 0 Arasında Olmalıdır." . PHP_EOL;
                    } else {
                        $index2 = 0;
                        $sayı1 = $soru1 + $notlar[$index2];
                        $index2 = $index2 + 1;
                        $sayı2 = $soru2 + $notlar[$index2];
                        $index2 = $index2 + 1;
                        $sayı3 = $soru3 + $notlar[$index2];
                        $index2 = $index2 + 1;
                        $sayı4 = $soru4 + $notlar[$index2];
                        $index2 = $index2 + 1;
                        $sayı5 = $soru5 + $notlar[$index2];
                        $index2 = 0;
                        $index = 0;
                        sonsayılar = array();
                        
                        $sonsayılar[0] = $sayı1;
                        $sonsayılar[1] = $sayı2;
                        $sonsayılar[2] = $sayı3;
                        $sonsayılar[3] = $sayı4;
                        $sonsayılar[4] = $sayı5;
                        while ($sync) {
                            if ($index == 5) {
                                $sync = False;
                            } else {
                                $index = $index + 1;
                                echo (string) $index . ". Öğrencinin; " . chr(13) . chr(13) . "Eski Not: " . $notlar[$index2] . chr(13) . "Yeni Not: " . $sonsayılar[$index2] . chr(13) . "Eklenen Puan: " . $soruarray[$index2] . PHP_EOL;
                                delay(270);
                                $index2 = $index2 + 1;
                            }
                        }
                    }
                } else {
                    if ($secim2 == 1) {
                        while ($sync) {
                            
                            # Bu döngü notları belirler.
                            if ($index == 5) {
                                $sync = False;
                                
                                # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                            } else {
                                $index = $index + 1;
                                $notlar[$index2] = rand(0, 80 - 1);
                                
                                # Random sayı belirle
                                $index2 = $index2 + 1;
                                
                                # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                            }
                        }
                        $sync = True;
                        $index = 0;
                        $index2 = 0;
                        
                        # Değişkenleri sıfırlayalım
                        while ($sync) {
                            
                            # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                            if ($index == 5) {
                                $sync = False;
                            } else {
                                $index = $index + 1;
                                $eskinotlar[$index2] = $notlar[$index2];
                                $notlar[$index2] = $notlar[$index2] + 20;
                                $index2 = $index2 + 1;
                            }
                        }
                        $sync = True;
                        $index = 0;
                        $index2 = 0;
                        
                        # Değişkenleri sıfırlayalım
                        echo "Yeni Notlar:" . PHP_EOL;
                        while ($sync) {
                            
                            # Bu döngü eski ve yeni notları bir arada yazdırır.
                            if ($index == 5) {
                                $sync = False;
                                
                                # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                            } else {
                                $index = $index + 1;
                                if ($notlar[$index2] > 100) {
                                    $notlar[$index2] = 100;
                                    echo (string) $index . ". Öğrencinin; " . chr(13) . chr(13) . "Eski Not: " . $eskinotlar[$index2] . chr(13) . "Yeni Not: " . $notlar[$index2] . PHP_EOL;
                                } else {
                                    echo (string) $index . ". Öğrencinin; " . chr(13) . chr(13) . "Eski Not: " . $eskinotlar[$index2] . chr(13) . "Yeni Not: " . $notlar[$index2] . PHP_EOL;
                                }
                                
                                # 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                delay(500);
                                
                                # 500 Milisaniyelik Gecikme
                                $index2 = $index2 + 1;
                            }
                        }
                    } else {
                        echo "Lütfen 1, 2 veya 3 yazınız." . PHP_EOL;
                        delay(1000);
                        echo "Program Kapatılıyor.." . PHP_EOL;
                        $index = 3;
                        while ($sync) {
                            if ($index == 0) {
                                $sync = False;
                            } else {
                                delay(1000);
                                echo (string) $index . ".." . PHP_EOL;
                                $index = $index - 1;
                            }
                            
                            # Programın Kapatılması İçin Sayaç Oluştur
                        }
                    }
                }
            }
        }
    } else {
        if ($secim == "a" || $secim == "A") {
            echo "1) Otomatik Mod Hakkında Yardım" . chr(13) . "2) Manuel Mod Hakkında Yardım" . PHP_EOL;
            $helpnum = input();
            delay(200);
            
            # Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
            $loop = yardımloop($helpnum);
            delay(200);
            if ($loop == 1) {
                echo "Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar." . PHP_EOL;
                delay(7800);
                echo "Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır." . PHP_EOL;
                delay(9000);
                echo "Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır." . PHP_EOL;
            } else {
                echo "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" . chr(13) . "2) Manuel Puan Ekleme Hakkında Yardım" . chr(13) . "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım" . PHP_EOL;
                $helpnum2 = input();
                delay(200);
                $loop2 = yardımloop2($helpnum2);
                delay(200);
                if ($loop2 == 1) {
                    echo "Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler." . PHP_EOL;
                } else {
                    if ($loop2 == 2) {
                        echo "Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar." . PHP_EOL;
                        delay(7800);
                        echo "Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır." . PHP_EOL;
                    } else {
                        echo "Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır." . PHP_EOL;
                        delay(4500);
                        echo "Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır." . PHP_EOL;
                        delay(4500);
                        echo "Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar." . PHP_EOL;
                        delay(8000);
                        echo "Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır." . PHP_EOL;
                    }
                }
            }
        } else {
            echo "Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!" . PHP_EOL;
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
?>
