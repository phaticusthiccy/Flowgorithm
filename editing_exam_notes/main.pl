#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig;

sub delay {
    my ($sn) = @_;
    
    # Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    my $sonuc;
    my $ms;
    
    $ms = $sn * 33;
    my $n;
    
    $n = 0;
    while ($n != $ms) {
        $n = $n + 1;
    }
    $sonuc = 1;
    
    # Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
    # boolen test
    # test = delay(200)
    # çıktı test  // true
    
    return $sonuc;
}

sub puanekle {
    my ($puan) = @_;
    
    my $sonuc;
    my @ekpuan = (0..20 - 1);
    my $index, $index2;
    my $sync;
    
    # while döngüsü için
    $sync = 1;
    $index = 0;
    if ($puan > 89) {
        $sonuc = 'pass';
        
        # 90 ve üstü notlar için puan ekleme olmaz.
    } else {
        if ($puan > 69) {
            $index2 = 5;
            while ($sync) {
                if ($index == 6) {
                    $sync = 0;
                } else {
                    $ekpuan[$index] = $index2;
                    $index = $index + 1;
                    $index2 = $index2 + 1;
                }
            }
            $sonuc = $ekpuan[int(rand(6))];
            
            # Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
        } else {
            if ($puan > 49) {
                $index2 = 10;
                while ($sync) {
                    if ($index == 9) {
                        $sync = 0;
                    } else {
                        $ekpuan[$index] = $index2;
                        $index = $index + 1;
                        $index2 = $index2 + 1;
                    }
                }
                $sonuc = $ekpuan[int(rand(9))];
                
                # Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
            } else {
                if ($puan > 29) {
                    $index2 = 20;
                    while ($sync) {
                        if ($index == 10) {
                            $sync = 0;
                        } else {
                            $ekpuan[$index] = $index2;
                            $index = $index + 1;
                            $index2 = $index2 + 1;
                        }
                    }
                    $sonuc = $ekpuan[int(rand(10))];
                    
                    # Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                } else {
                    $index2 = 30;
                    while ($sync) {
                        if ($index == 11) {
                            $sync = 0;
                        } else {
                            $ekpuan[$index] = $index2;
                            $index = $index + 1;
                            $index2 = $index2 + 1;
                        }
                    }
                    $sonuc = $ekpuan[int(rand(11))];
                    
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
    
    return $sonuc;
}

sub puaneklesoru {
    my ($no, $eskinot) = @_;
    
    my $sonuc;
    
    print $no . '. Öğrenci İçin Kaç Puan Eklemek İstersiniz: ' . chr(13) . chr(13) . 'Öğrencinin Puanı: ' . $eskinot, "\n";
    $sonuc = <>;
    chomp($sonuc);
    
    return $sonuc;
}

sub yardımloop {
    my ($sayı) = @_;
    
    my $sonuc;
    
    if ($sayı == 1 || $sayı == 2) {
    } else {
        print 'Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın.' . chr(13) . 'Yeniden Başlatılıyor..', "\n";
        delay(1000);
        print '1) Otomatik Mod Hakkında Yardım' . chr(13) . '2) Manuel Mod Hakkında Yardım', "\n";
        $sayı = <>;
        chomp($sayı);
        yardımloop($sayı);
    }
    
    # Yardım Modülü İçin
    # Yanlış değer girildiğinde baştan başlatır
    $sonuc = $sayı;
    
    return $sonuc;
}

sub yardımloop2 {
    my ($sayı) = @_;
    
    my $sonuc;
    
    if ($sayı == 1 || $sayı == 2 || $sayı == 3) {
    } else {
        print 'Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın.' . chr(13) . 'Yeniden Başlatılıyor..', "\n";
        delay(1000);
        print '1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım' . chr(13) . '2) Manuel Puan Ekleme Hakkında Yardım' . chr(13) . '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım', "\n";
        $sayı = <>;
        chomp($sayı);
        yardımloop2($sayı);
    }
    $sonuc = $sayı;
    
    return $sonuc;
}

# Main
my $sync;

$sync = 1;
my $secim;
my $index, $index2;

$index = 0;
$index2 = 0;
my @notlar = (0..5 - 1);
my @eskinotlar = (0..5 - 1);
my @otonot = (0..20 - 1);
my @otoeklenennot = (0..15 - 1);

print 'Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?' . chr(13) . chr(13) . 'Otomatik için: \'O\'' . chr(13) . 'Manuel için: \'M\'' . chr(13) . 'Yazın' . chr(13) . chr(13) . 'Arayüz Hakkında Bilgi Almak İçin İse \'A\' Yazın', "\n";
$secim = <>;
chomp($secim);
if ($secim eq 'O' || $secim eq 'o') {
    while ($sync) {
        
        # Bu döngü notları belirler.
        if ($index == 5) {
            $sync = 0;
            
            # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
        } else {
            $index = $index + 1;
            $notlar[$index2] = int(rand(80));
            
            # Random sayı belirle
            $index2 = $index2 + 1;
            
            # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
        }
    }
    $sync = 1;
    $index = 0;
    $index2 = 0;
    
    # Değişkenleri sıfırlayalım
    while ($sync) {
        
        # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
        if ($index == 5) {
            $sync = 0;
        } else {
            $index = $index + 1;
            $eskinotlar[$index2] = $notlar[$index2];
            $notlar[$index2] = $notlar[$index2] + 20;
            $index2 = $index2 + 1;
        }
    }
    $sync = 1;
    $index = 0;
    $index2 = 0;
    
    # Değişkenleri sıfırlayalım
    print 'Yeni Notlar:', "\n";
    while ($sync) {
        
        # Bu döngü eski ve yeni notları bir arada yazdırır.
        if ($index == 5) {
            $sync = 0;
            
            # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
        } else {
            $index = $index + 1;
            print $index . '. Öğrencinin; ' . chr(13) . chr(13) . 'Eski Not: ' . $eskinotlar[$index2] . chr(13) . 'Yeni Not: ' . $notlar[$index2], "\n";
            delay(500);
            
            # 500 Milisaniyelik Gecikme
            $index2 = $index2 + 1;
        }
    }
} else {
    if ($secim eq 'M' || $secim eq 'm') {
        print '1. Öğrencinin Notunu Giriniz: ', "\n";
        $notlar[0] = <>;
        chomp($notlar[0]);
        print '2. Öğrencinin Notunu Giriniz: ', "\n";
        $notlar[1] = <>;
        chomp($notlar[1]);
        print '3. Öğrencinin Notunu Giriniz: ', "\n";
        $notlar[2] = <>;
        chomp($notlar[2]);
        print '4. Öğrencinin Notunu Giriniz: ', "\n";
        $notlar[3] = <>;
        chomp($notlar[3]);
        print '5. Öğrencinin Notunu Giriniz: ', "\n";
        $notlar[4] = <>;
        chomp($notlar[4]);
        delay(800);
        my $secim2;
        my $devam;
        
        $devam = 1;
        $index = 0;
        $index2 = 0;
        while ($sync) {
            if ($index == 5) {
                $sync = 0;
            } else {
                $index = $index + 1;
                if ($notlar[$index2] > 100) {
                    $sync = 0;
                    $devam = 0;
                } else {
                    if ($notlar[$index2] < 0) {
                        $sync = 0;
                        $devam = 0;
                    } else {
                        $index2 = $index2 + 1;
                    }
                }
            }
        }
        if (!$devam) {
            print 'Notlar 100 ve 0 Arasında Olmalıdır.', "\n";
        } else {
            print 'Size 3 Seçenek Sunuyoruz:' . chr(13) . chr(13) . '1) Herkesin Notuna +20 Puan Ekle' . chr(13) . '2) Herkesin Notuna Eklenecek Puanı Manuel Gir' . chr(13) . '3) Sistem\'in Kendi Not Ekleme Aracını Kullan', "\n";
            $secim2 = <>;
            chomp($secim2);
            if ($secim2 == 3) {
                delay(59);
                $index = 0;
                $index2 = 0;
                $sync = 1;
                while ($sync) {
                    if ($index == 5) {
                        $sync = 0;
                    } else {
                        $index = $index + 1;
                        $otoeklenennot[$index2] = puanekle($notlar[$index2]);
                        
                        # Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                        delay(59);
                        if ($otoeklenennot[$index2] eq 'pass') {
                            $otoeklenennot[$index2] = '0';
                        } else {
                            $otonot[$index2] = $notlar[$index2] + puanekle($notlar[$index2]);
                        }
                        $index2 = $index2 + 1;
                    }
                }
                $index = 0;
                $index2 = 0;
                $sync = 1;
                while ($sync) {
                    if ($index == 5) {
                        $sync = 0;
                    } else {
                        $index = $index + 1;
                        my $cikti;
                        
                        if ($otoeklenennot[$index2] eq '0') {
                            $cikti = $index . '. Öğrencinin; ' . chr(13) . chr(13) . 'Eski Not: ' . $notlar[$index2] . chr(13) . 'Yeni Not: ' . $notlar[$index2] . chr(13) . 'Ek Puan Yok. Not Yeterli.';
                        } else {
                            $cikti = $index . '. Öğrencinin; ' . chr(13) . chr(13) . 'Eski Not: ' . $notlar[$index2] . chr(13) . 'Yeni Not: ' . ($otoeklenennot[$index2] + $notlar[$index2]) . chr(13) . 'Eklenen Puan: ' . $otoeklenennot[$index2];
                        }
                        print $cikti, "\n";
                        delay(500);
                        $index2 = $index2 + 1;
                    }
                }
            } else {
                if ($secim2 == 2) {
                    $index = 0;
                    $index2 = 0;
                    $sync = 0;
                    my $sayı1, $sayı2, $sayı3, $sayı4, $sayı5;
                    my $soru1, $soru2, $soru3, $soru4, $soru5;
                    
                    # Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                    # Yaha henüz ben keşfedemedim :p
                    delay(230);
                    $soru1 = puaneklesoru('1', $notlar[$index2]);
                    $index2 = $index2 + 1;
                    $soru2 = puaneklesoru('2', $notlar[$index2]);
                    $index2 = $index2 + 1;
                    $soru3 = puaneklesoru('3', $notlar[$index2]);
                    $index2 = $index2 + 1;
                    $soru4 = puaneklesoru('4', $notlar[$index2]);
                    $index2 = $index2 + 1;
                    $soru5 = puaneklesoru('5', $notlar[$index2]);
                    delay(600);
                    $sync = 1;
                    my @soruarray = (0..5 - 1);
                    
                    $soruarray[0] = $soru1;
                    $soruarray[1] = $soru2;
                    $soruarray[2] = $soru3;
                    $soruarray[3] = $soru4;
                    $soruarray[4] = $soru5;
                    if ($soru1 > 100 && $soru1 < 0 || $soru2 > 100 && $soru2 < 0 || $soru3 > 100 && $soru3 < 0 || $soru4 > 100 && $soru4 < 0 || $soru5 > 100 && $soru5 < 0) {
                        print 'Notların Son Hali 100 ve 0 Arasında Olmalıdır.', "\n";
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
                        my @sonsayılar = (0..5 - 1);
                        
                        $sonsayılar[0] = $sayı1;
                        $sonsayılar[1] = $sayı2;
                        $sonsayılar[2] = $sayı3;
                        $sonsayılar[3] = $sayı4;
                        $sonsayılar[4] = $sayı5;
                        while ($sync) {
                            if ($index == 5) {
                                $sync = 0;
                            } else {
                                $index = $index + 1;
                                print $index . '. Öğrencinin; ' . chr(13) . chr(13) . 'Eski Not: ' . $notlar[$index2] . chr(13) . 'Yeni Not: ' . $sonsayılar[$index2] . chr(13) . 'Eklenen Puan: ' . $soruarray[$index2], "\n";
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
                                $sync = 0;
                                
                                # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                            } else {
                                $index = $index + 1;
                                $notlar[$index2] = int(rand(80));
                                
                                # Random sayı belirle
                                $index2 = $index2 + 1;
                                
                                # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                            }
                        }
                        $sync = 1;
                        $index = 0;
                        $index2 = 0;
                        
                        # Değişkenleri sıfırlayalım
                        while ($sync) {
                            
                            # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                            if ($index == 5) {
                                $sync = 0;
                            } else {
                                $index = $index + 1;
                                $eskinotlar[$index2] = $notlar[$index2];
                                $notlar[$index2] = $notlar[$index2] + 20;
                                $index2 = $index2 + 1;
                            }
                        }
                        $sync = 1;
                        $index = 0;
                        $index2 = 0;
                        
                        # Değişkenleri sıfırlayalım
                        print 'Yeni Notlar:', "\n";
                        while ($sync) {
                            
                            # Bu döngü eski ve yeni notları bir arada yazdırır.
                            if ($index == 5) {
                                $sync = 0;
                                
                                # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                            } else {
                                $index = $index + 1;
                                if ($notlar[$index2] > 100) {
                                    $notlar[$index2] = 100;
                                    print $index . '. Öğrencinin; ' . chr(13) . chr(13) . 'Eski Not: ' . $eskinotlar[$index2] . chr(13) . 'Yeni Not: ' . $notlar[$index2], "\n";
                                } else {
                                    print $index . '. Öğrencinin; ' . chr(13) . chr(13) . 'Eski Not: ' . $eskinotlar[$index2] . chr(13) . 'Yeni Not: ' . $notlar[$index2], "\n";
                                }
                                
                                # 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                delay(500);
                                
                                # 500 Milisaniyelik Gecikme
                                $index2 = $index2 + 1;
                            }
                        }
                    } else {
                        print 'Lütfen 1, 2 veya 3 yazınız.', "\n";
                        delay(1000);
                        print 'Program Kapatılıyor..', "\n";
                        $index = 3;
                        while ($sync) {
                            if ($index == 0) {
                                $sync = 0;
                            } else {
                                delay(1000);
                                print $index . '..', "\n";
                                $index = $index - 1;
                            }
                            
                            # Programın Kapatılması İçin Sayaç Oluştur
                        }
                    }
                }
            }
        }
    } else {
        my $helpnum, $helpnum2;
        my $loop, $loop2;
        
        if ($secim eq 'a' || $secim eq 'A') {
            print '1) Otomatik Mod Hakkında Yardım' . chr(13) . '2) Manuel Mod Hakkında Yardım', "\n";
            $helpnum = <>;
            chomp($helpnum);
            delay(200);
            
            # Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
            $loop = yardımloop($helpnum);
            delay(200);
            if ($loop == 1) {
                print 'Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.', "\n";
                delay(7800);
                print 'Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.', "\n";
                delay(9000);
                print 'Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.', "\n";
            } else {
                print '1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım' . chr(13) . '2) Manuel Puan Ekleme Hakkında Yardım' . chr(13) . '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım', "\n";
                $helpnum2 = <>;
                chomp($helpnum2);
                delay(200);
                $loop2 = yardımloop2($helpnum2);
                delay(200);
                if ($loop2 == 1) {
                    print 'Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.', "\n";
                } else {
                    if ($loop2 == 2) {
                        print 'Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.', "\n";
                        delay(7800);
                        print 'Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.', "\n";
                    } else {
                        print 'Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.', "\n";
                        delay(4500);
                        print 'Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.', "\n";
                        delay(4500);
                        print 'Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.', "\n";
                        delay(8000);
                        print 'Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt\'a (ekrana) yazdırılır.', "\n";
                    }
                }
            }
        } else {
            print 'Lütfen Sadece \'M\' veya \'O\' Harflerini Giriniz!', "\n";
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
