﻿import java.util.*;
import java.lang.Math;

public class JavaApplication {
    private static Random random = new Random();
    private static Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        boolean sync;
        
        sync = true;
        String secim;
        int index, index2;
        
        index = 0;
        index2 = 0;
        int[] notlar = new int[5];
        int[] eskinotlar = new int[5];
        int[] otonot = new int[20];
        String[] otoeklenennot = new String[15];
        
        System.out.println("Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" + (char) 13 + (char) 13 + "Otomatik için: 'O'" + (char) 13 + "Manuel için: 'M'" + (char) 13 + "Yazın" + (char) 13 + (char) 13 + "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın");
        secim = input.nextLine();
        if (secim.equals("O") || secim.equals("o")) {
            while (sync) {
                
                // Bu döngü notları belirler.
                if (index == 5) {
                    sync = false;
                    
                    // index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                } else {
                    index = index + 1;
                    notlar[index2] = random.nextInt(80);
                    
                    // Random sayı belirle
                    index2 = index2 + 1;
                    
                    // 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                }
            }
            sync = true;
            index = 0;
            index2 = 0;
            
            // Değişkenleri sıfırlayalım
            while (sync) {
                
                // Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                if (index == 5) {
                    sync = false;
                } else {
                    index = index + 1;
                    eskinotlar[index2] = notlar[index2];
                    notlar[index2] = notlar[index2] + 20;
                    index2 = index2 + 1;
                }
            }
            sync = true;
            index = 0;
            index2 = 0;
            
            // Değişkenleri sıfırlayalım
            System.out.println("Yeni Notlar:");
            while (sync) {
                
                // Bu döngü eski ve yeni notları bir arada yazdırır.
                if (index == 5) {
                    sync = false;
                    
                    // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                } else {
                    index = index + 1;
                    System.out.println(index.toString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + eskinotlar[index2] + (char) 13 + "Yeni Not: " + notlar[index2]);
                    delay(500);
                    
                    // 500 Milisaniyelik Gecikme
                    index2 = index2 + 1;
                }
            }
        } else {
            if (secim.equals("M") || secim.equals("m")) {
                System.out.println("1. Öğrencinin Notunu Giriniz: ");
                notlar[0] = input.nextInt();
                System.out.println("2. Öğrencinin Notunu Giriniz: ");
                notlar[1] = input.nextInt();
                System.out.println("3. Öğrencinin Notunu Giriniz: ");
                notlar[2] = input.nextInt();
                System.out.println("4. Öğrencinin Notunu Giriniz: ");
                notlar[3] = input.nextInt();
                System.out.println("5. Öğrencinin Notunu Giriniz: ");
                notlar[4] = input.nextInt();
                delay(800);
                int secim2;
                boolean devam;
                
                devam = true;
                index = 0;
                index2 = 0;
                while (sync) {
                    if (index == 5) {
                        sync = false;
                    } else {
                        index = index + 1;
                        if (notlar[index2] > 100) {
                            sync = false;
                            devam = false;
                        } else {
                            if (notlar[index2] < 0) {
                                sync = false;
                                devam = false;
                            } else {
                                index2 = index2 + 1;
                            }
                        }
                    }
                }
                if (!devam) {
                    System.out.println("Notlar 100 ve 0 Arasında Olmalıdır.");
                } else {
                    System.out.println("Size 3 Seçenek Sunuyoruz:" + (char) 13 + (char) 13 + "1) Herkesin Notuna +20 Puan Ekle" + (char) 13 + "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" + (char) 13 + "3) Sistem'in Kendi Not Ekleme Aracını Kullan");
                    secim2 = input.nextInt();
                    if (secim2 == 3) {
                        delay(59);
                        index = 0;
                        index2 = 0;
                        sync = true;
                        while (sync) {
                            if (index == 5) {
                                sync = false;
                            } else {
                                index = index + 1;
                                otoeklenennot[index2] = puanekle(notlar[index2]);
                                
                                // Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                                delay(59);
                                if (otoeklenennot[index2].equals("pass")) {
                                    otoeklenennot[index2] = "0";
                                } else {
                                    otonot[index2] = notlar[index2] + Integer.parseInt(puanekle(notlar[index2]));
                                }
                                index2 = index2 + 1;
                            }
                        }
                        index = 0;
                        index2 = 0;
                        sync = true;
                        while (sync) {
                            if (index == 5) {
                                sync = false;
                            } else {
                                index = index + 1;
                                String cikti;
                                
                                if (otoeklenennot[index2].equals("0")) {
                                    cikti = index.toString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + notlar[index2] + (char) 13 + "Yeni Not: " + notlar[index2] + (char) 13 + "Ek Puan Yok. Not Yeterli.";
                                } else {
                                    cikti = index.toString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + notlar[index2] + (char) 13 + "Yeni Not: " + (Integer.parseInt(otoeklenennot[index2]) + notlar[index2]) + (char) 13 + "Eklenen Puan: " + otoeklenennot[index2];
                                }
                                System.out.println(cikti);
                                delay(500);
                                index2 = index2 + 1;
                            }
                        }
                    } else {
                        if (secim2 == 2) {
                            index = 0;
                            index2 = 0;
                            sync = false;
                            int sayı1, sayı2, sayı3, sayı4, sayı5;
                            int soru1, soru2, soru3, soru4, soru5;
                            
                            // Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                            // Yaha henüz ben keşfedemedim :p
                            delay(230);
                            soru1 = puaneklesoru("1", notlar[index2]);
                            index2 = index2 + 1;
                            soru2 = puaneklesoru("2", notlar[index2]);
                            index2 = index2 + 1;
                            soru3 = puaneklesoru("3", notlar[index2]);
                            index2 = index2 + 1;
                            soru4 = puaneklesoru("4", notlar[index2]);
                            index2 = index2 + 1;
                            soru5 = puaneklesoru("5", notlar[index2]);
                            delay(600);
                            sync = true;
                            int[] soruarray = new int[5];
                            
                            soruarray[0] = soru1;
                            soruarray[1] = soru2;
                            soruarray[2] = soru3;
                            soruarray[3] = soru4;
                            soruarray[4] = soru5;
                            if (soru1 > 100 && soru1 < 0 || soru2 > 100 && soru2 < 0 || soru3 > 100 && soru3 < 0 || soru4 > 100 && soru4 < 0 || soru5 > 100 && soru5 < 0) {
                                System.out.println("Notların Son Hali 100 ve 0 Arasında Olmalıdır.");
                            } else {
                                index2 = 0;
                                sayı1 = soru1 + notlar[index2];
                                index2 = index2 + 1;
                                sayı2 = soru2 + notlar[index2];
                                index2 = index2 + 1;
                                sayı3 = soru3 + notlar[index2];
                                index2 = index2 + 1;
                                sayı4 = soru4 + notlar[index2];
                                index2 = index2 + 1;
                                sayı5 = soru5 + notlar[index2];
                                index2 = 0;
                                index = 0;
                                int[] sonsayılar = new int[5];
                                
                                sonsayılar[0] = sayı1;
                                sonsayılar[1] = sayı2;
                                sonsayılar[2] = sayı3;
                                sonsayılar[3] = sayı4;
                                sonsayılar[4] = sayı5;
                                while (sync) {
                                    if (index == 5) {
                                        sync = false;
                                    } else {
                                        index = index + 1;
                                        System.out.println(index.toString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + notlar[index2] + (char) 13 + "Yeni Not: " + sonsayılar[index2] + (char) 13 + "Eklenen Puan: " + soruarray[index2]);
                                        delay(270);
                                        index2 = index2 + 1;
                                    }
                                }
                            }
                        } else {
                            if (secim2 == 1) {
                                while (sync) {
                                    
                                    // Bu döngü notları belirler.
                                    if (index == 5) {
                                        sync = false;
                                        
                                        // index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                                    } else {
                                        index = index + 1;
                                        notlar[index2] = random.nextInt(80);
                                        
                                        // Random sayı belirle
                                        index2 = index2 + 1;
                                        
                                        // 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                                    }
                                }
                                sync = true;
                                index = 0;
                                index2 = 0;
                                
                                // Değişkenleri sıfırlayalım
                                while (sync) {
                                    
                                    // Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                                    if (index == 5) {
                                        sync = false;
                                    } else {
                                        index = index + 1;
                                        eskinotlar[index2] = notlar[index2];
                                        notlar[index2] = notlar[index2] + 20;
                                        index2 = index2 + 1;
                                    }
                                }
                                sync = true;
                                index = 0;
                                index2 = 0;
                                
                                // Değişkenleri sıfırlayalım
                                System.out.println("Yeni Notlar:");
                                while (sync) {
                                    
                                    // Bu döngü eski ve yeni notları bir arada yazdırır.
                                    if (index == 5) {
                                        sync = false;
                                        
                                        // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                    } else {
                                        index = index + 1;
                                        if (notlar[index2] > 100) {
                                            notlar[index2] = 100;
                                            System.out.println(index.toString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + eskinotlar[index2] + (char) 13 + "Yeni Not: " + notlar[index2]);
                                        } else {
                                            System.out.println(index.toString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + eskinotlar[index2] + (char) 13 + "Yeni Not: " + notlar[index2]);
                                        }
                                        
                                        // 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                        delay(500);
                                        
                                        // 500 Milisaniyelik Gecikme
                                        index2 = index2 + 1;
                                    }
                                }
                            } else {
                                System.out.println("Lütfen 1, 2 veya 3 yazınız.");
                                delay(1000);
                                System.out.println("Program Kapatılıyor..");
                                index = 3;
                                while (sync) {
                                    if (index == 0) {
                                        sync = false;
                                    } else {
                                        delay(1000);
                                        System.out.println(index.toString() + "..");
                                        index = index - 1;
                                    }
                                    
                                    // Programın Kapatılması İçin Sayaç Oluştur
                                }
                            }
                        }
                    }
                }
            } else {
                int helpnum, helpnum2;
                int loop, loop2;
                
                if (secim.equals("a") || secim.equals("A")) {
                    System.out.println("1) Otomatik Mod Hakkında Yardım" + (char) 13 + "2) Manuel Mod Hakkında Yardım");
                    helpnum = input.nextInt();
                    delay(200);
                    
                    // Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                    loop = yardımloop(helpnum);
                    delay(200);
                    if (loop == 1) {
                        System.out.println("Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.");
                        delay(7800);
                        System.out.println("Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.");
                        delay(9000);
                        System.out.println("Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.");
                    } else {
                        System.out.println("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + (char) 13 + "2) Manuel Puan Ekleme Hakkında Yardım" + (char) 13 + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım");
                        helpnum2 = input.nextInt();
                        delay(200);
                        loop2 = yardımloop2(helpnum2);
                        delay(200);
                        if (loop2 == 1) {
                            System.out.println("Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.");
                        } else {
                            if (loop2 == 2) {
                                System.out.println("Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.");
                                delay(7800);
                                System.out.println("Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.");
                            } else {
                                System.out.println("Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.");
                                delay(4500);
                                System.out.println("Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.");
                                delay(4500);
                                System.out.println("Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.");
                                delay(8000);
                                System.out.println("Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır.");
                            }
                        }
                    }
                } else {
                    System.out.println("Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!");
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
    
    public static boolean delay(int sn) {
        // Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
        boolean sonuc;
        int ms;
        
        ms = sn * 33;
        int n;
        
        n = 0;
        while (n != ms) {
            n = n + 1;
        }
        sonuc = true;
        
        // Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
        // boolen test
        // test = delay(200)
        // çıktı test  // true
        
        return sonuc;
    }
    
    public static String puanekle(int puan) {
        String sonuc;
        int[] ekpuan = new int[20];
        int index, index2;
        boolean sync;
        
        // while döngüsü için
        sync = true;
        index = 0;
        if (puan > 89) {
            sonuc = "pass";
            
            // 90 ve üstü notlar için puan ekleme olmaz.
        } else {
            if (puan > 69) {
                index2 = 5;
                while (sync) {
                    if (index == 6) {
                        sync = false;
                    } else {
                        ekpuan[index] = index2;
                        index = index + 1;
                        index2 = index2 + 1;
                    }
                }
                sonuc = ekpuan[random.nextInt(6)].toString();
                
                // Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
            } else {
                if (puan > 49) {
                    index2 = 10;
                    while (sync) {
                        if (index == 9) {
                            sync = false;
                        } else {
                            ekpuan[index] = index2;
                            index = index + 1;
                            index2 = index2 + 1;
                        }
                    }
                    sonuc = ekpuan[random.nextInt(9)].toString();
                    
                    // Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
                } else {
                    if (puan > 29) {
                        index2 = 20;
                        while (sync) {
                            if (index == 10) {
                                sync = false;
                            } else {
                                ekpuan[index] = index2;
                                index = index + 1;
                                index2 = index2 + 1;
                            }
                        }
                        sonuc = ekpuan[random.nextInt(10)].toString();
                        
                        // Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                    } else {
                        index2 = 30;
                        while (sync) {
                            if (index == 11) {
                                sync = false;
                            } else {
                                ekpuan[index] = index2;
                                index = index + 1;
                                index2 = index2 + 1;
                            }
                        }
                        sonuc = ekpuan[random.nextInt(11)].toString();
                        
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
        
        return sonuc;
    }
    
    public static int puaneklesoru(String no, int eskinot) {
        int sonuc;
        
        System.out.println(no + ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " + (char) 13 + (char) 13 + "Öğrencinin Puanı: " + eskinot);
        sonuc = input.nextInt();
        
        return sonuc;
    }
    
    public static int yardımloop(int sayı) {
        int sonuc;
        
        if (sayı == 1 || sayı == 2) {
        } else {
            System.out.println("Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." + (char) 13 + "Yeniden Başlatılıyor..");
            delay(1000);
            System.out.println("1) Otomatik Mod Hakkında Yardım" + (char) 13 + "2) Manuel Mod Hakkında Yardım");
            sayı = input.nextInt();
            yardımloop(sayı);
        }
        
        // Yardım Modülü İçin
        // Yanlış değer girildiğinde baştan başlatır
        sonuc = sayı;
        
        return sonuc;
    }
    
    public static int yardımloop2(int sayı) {
        int sonuc;
        
        if (sayı == 1 || sayı == 2 || sayı == 3) {
        } else {
            System.out.println("Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." + (char) 13 + "Yeniden Başlatılıyor..");
            delay(1000);
            System.out.println("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + (char) 13 + "2) Manuel Puan Ekleme Hakkında Yardım" + (char) 13 + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım");
            sayı = input.nextInt();
            yardımloop2(sayı);
        }
        sonuc = sayı;
        
        return sonuc;
    }
}
