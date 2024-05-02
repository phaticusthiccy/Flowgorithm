#include <iostream>
#include <sstream>
#include <string>
#include <cstdlib>
#include <cmath>
#include <ctime>

using namespace std;

// Headers
string toString (double);
int toInt (string);
double toDouble (string);
bool delay(int sn);
string puanekle(int puan);
int puaneklesoru(string no, int eskinot);
int yardımloop(int sayı);
int yardımloop2(int sayı);

int main() {
    srand(time(0));   //Seed random number generator
    
    bool sync;
    
    sync = true;
    string secim;
    int index, index2;
    
    index = 0;
    index2 = 0;
    int notlar[5];
    int eskinotlar[5];
    int otonot[20];
    string otoeklenennot[15];
    
    cout << "Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" << (char) 13 << (char) 13 << "Otomatik için: 'O'" << (char) 13 << "Manuel için: 'M'" << (char) 13 << "Yazın" << (char) 13 << (char) 13 << "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın" << endl;
    cin >> secim;
    if (secim == "O" || secim == "o") {
        while (sync) {
            
            // Bu döngü notları belirler.
            if (index == 5) {
                sync = false;
                
                // index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
            } else {
                index = index + 1;
                notlar[index2] = rand() % 80;
                
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
        cout << "Yeni Notlar:" << endl;
        while (sync) {
            
            // Bu döngü eski ve yeni notları bir arada yazdırır.
            if (index == 5) {
                sync = false;
                
                // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
            } else {
                index = index + 1;
                cout << toString(index) << ". Öğrencinin; " << (char) 13 << (char) 13 << "Eski Not: " << eskinotlar[index2] << (char) 13 << "Yeni Not: " << notlar[index2] << endl;
                delay(500);
                
                // 500 Milisaniyelik Gecikme
                index2 = index2 + 1;
            }
        }
    } else {
        if (secim == "M" || secim == "m") {
            cout << "1. Öğrencinin Notunu Giriniz: " << endl;
            cin >> notlar[0];
            cout << "2. Öğrencinin Notunu Giriniz: " << endl;
            cin >> notlar[1];
            cout << "3. Öğrencinin Notunu Giriniz: " << endl;
            cin >> notlar[2];
            cout << "4. Öğrencinin Notunu Giriniz: " << endl;
            cin >> notlar[3];
            cout << "5. Öğrencinin Notunu Giriniz: " << endl;
            cin >> notlar[4];
            delay(800);
            int secim2;
            bool devam;
            
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
                cout << "Notlar 100 ve 0 Arasında Olmalıdır." << endl;
            } else {
                cout << "Size 3 Seçenek Sunuyoruz:" << (char) 13 << (char) 13 << "1) Herkesin Notuna +20 Puan Ekle" << (char) 13 << "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" << (char) 13 << "3) Sistem'in Kendi Not Ekleme Aracını Kullan" << endl;
                cin >> secim2;
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
                            if (otoeklenennot[index2] == "pass") {
                                otoeklenennot[index2] = "0";
                            } else {
                                otonot[index2] = notlar[index2] + toInt(puanekle(notlar[index2]));
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
                            string cikti;
                            
                            if (otoeklenennot[index2] == "0") {
                                cikti = toString(index) + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + toString(notlar[index2]) + (char) 13 + "Yeni Not: " + toString(notlar[index2]) + (char) 13 + "Ek Puan Yok. Not Yeterli.";
                            } else {
                                cikti = toString(index) + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + toString(notlar[index2]) + (char) 13 + "Yeni Not: " + toString((toInt(otoeklenennot[index2]) + notlar[index2])) + (char) 13 + "Eklenen Puan: " + otoeklenennot[index2];
                            }
                            cout << cikti << endl;
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
                        int soruarray[5];
                        
                        soruarray[0] = soru1;
                        soruarray[1] = soru2;
                        soruarray[2] = soru3;
                        soruarray[3] = soru4;
                        soruarray[4] = soru5;
                        if (soru1 > 100 && soru1 < 0 || soru2 > 100 && soru2 < 0 || soru3 > 100 && soru3 < 0 || soru4 > 100 && soru4 < 0 || soru5 > 100 && soru5 < 0) {
                            cout << "Notların Son Hali 100 ve 0 Arasında Olmalıdır." << endl;
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
                            int sonsayılar[5];
                            
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
                                    cout << toString(index) << ". Öğrencinin; " << (char) 13 << (char) 13 << "Eski Not: " << notlar[index2] << (char) 13 << "Yeni Not: " << sonsayılar[index2] << (char) 13 << "Eklenen Puan: " << soruarray[index2] << endl;
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
                                    notlar[index2] = rand() % 80;
                                    
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
                            cout << "Yeni Notlar:" << endl;
                            while (sync) {
                                
                                // Bu döngü eski ve yeni notları bir arada yazdırır.
                                if (index == 5) {
                                    sync = false;
                                    
                                    // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                } else {
                                    index = index + 1;
                                    if (notlar[index2] > 100) {
                                        notlar[index2] = 100;
                                        cout << toString(index) << ". Öğrencinin; " << (char) 13 << (char) 13 << "Eski Not: " << eskinotlar[index2] << (char) 13 << "Yeni Not: " << notlar[index2] << endl;
                                    } else {
                                        cout << toString(index) << ". Öğrencinin; " << (char) 13 << (char) 13 << "Eski Not: " << eskinotlar[index2] << (char) 13 << "Yeni Not: " << notlar[index2] << endl;
                                    }
                                    
                                    // 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                    delay(500);
                                    
                                    // 500 Milisaniyelik Gecikme
                                    index2 = index2 + 1;
                                }
                            }
                        } else {
                            cout << "Lütfen 1, 2 veya 3 yazınız." << endl;
                            delay(1000);
                            cout << "Program Kapatılıyor.." << endl;
                            index = 3;
                            while (sync) {
                                if (index == 0) {
                                    sync = false;
                                } else {
                                    delay(1000);
                                    cout << toString(index) << ".." << endl;
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
            
            if (secim == "a" || secim == "A") {
                cout << "1) Otomatik Mod Hakkında Yardım" << (char) 13 << "2) Manuel Mod Hakkında Yardım" << endl;
                cin >> helpnum;
                delay(200);
                
                // Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                loop = yardımloop(helpnum);
                delay(200);
                if (loop == 1) {
                    cout << "Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar." << endl;
                    delay(7800);
                    cout << "Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır." << endl;
                    delay(9000);
                    cout << "Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır." << endl;
                } else {
                    cout << "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" << (char) 13 << "2) Manuel Puan Ekleme Hakkında Yardım" << (char) 13 << "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım" << endl;
                    cin >> helpnum2;
                    delay(200);
                    loop2 = yardımloop2(helpnum2);
                    delay(200);
                    if (loop2 == 1) {
                        cout << "Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler." << endl;
                    } else {
                        if (loop2 == 2) {
                            cout << "Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar." << endl;
                            delay(7800);
                            cout << "Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır." << endl;
                        } else {
                            cout << "Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır." << endl;
                            delay(4500);
                            cout << "Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır." << endl;
                            delay(4500);
                            cout << "Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar." << endl;
                            delay(8000);
                            cout << "Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır." << endl;
                        }
                    }
                }
            } else {
                cout << "Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!" << endl;
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
    return 0;
}

bool delay(int sn) {
    // Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    bool sonuc;
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

string puanekle(int puan) {
    string sonuc;
    int ekpuan[20];
    int index, index2;
    bool sync;
    
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
            sonuc = toString(ekpuan[rand() % 6]);
            
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
                sonuc = toString(ekpuan[rand() % 9]);
                
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
                    sonuc = toString(ekpuan[rand() % 10]);
                    
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
                    sonuc = toString(ekpuan[rand() % 11]);
                    
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

int puaneklesoru(string no, int eskinot) {
    int sonuc;
    
    cout << no << ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " << (char) 13 << (char) 13 << "Öğrencinin Puanı: " << eskinot << endl;
    cin >> sonuc;
    
    return sonuc;
}

int yardımloop(int sayı) {
    int sonuc;
    
    if (sayı == 1 || sayı == 2) {
    } else {
        cout << "Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." << (char) 13 << "Yeniden Başlatılıyor.." << endl;
        delay(1000);
        cout << "1) Otomatik Mod Hakkında Yardım" << (char) 13 << "2) Manuel Mod Hakkında Yardım" << endl;
        cin >> sayı;
        yardımloop(sayı);
    }
    
    // Yardım Modülü İçin
    // Yanlış değer girildiğinde baştan başlatır
    sonuc = sayı;
    
    return sonuc;
}

int yardımloop2(int sayı) {
    int sonuc;
    
    if (sayı == 1 || sayı == 2 || sayı == 3) {
    } else {
        cout << "Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." << (char) 13 << "Yeniden Başlatılıyor.." << endl;
        delay(1000);
        cout << "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" << (char) 13 << "2) Manuel Puan Ekleme Hakkında Yardım" << (char) 13 << "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım" << endl;
        cin >> sayı;
        yardımloop2(sayı);
    }
    sonuc = sayı;
    
    return sonuc;
}

// The following implements type conversion functions.
string toString (double value) { //int also
    stringstream temp;
    temp << value;
    return temp.str();
}

int toInt (string text) {
    return atoi(text.c_str());
}

double toDouble (string text) {
    return atof(text.c_str());
}
