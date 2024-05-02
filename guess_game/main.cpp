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
bool delay(double sn);
bool exit();
bool logger(string type, string var_this);
bool namecorrection(string name);
string plugins(string type, string arg);
int rand(bool type);

int main() {
    bool sync, find;
    string name;
    int mode, number;
    
    logger("str", plugins("ask name", ""));
    delay(2);
    cin >> name;
    namecorrection(name);
    delay(2);
    
    // İsim Alma Kısmı Tamamlandı
    logger("str", plugins("after name", name));
    delay(9);
    logger("str", plugins("game mode", ""));
    cin >> mode;
    
    // Oyun Modu Başarıyla Seçildi
    if (mode == 1 || mode == 2) {
        if (mode == 1) {
            
            // Kolay Oyun Modu
            int index, index2, think;
            
            index = 0;
            index2 = 0;
            sync = true;
            number = rand(true);
            logger("str", plugins("get num", name));
            delay(2);
            
            // Sayı Belirlendi
            while (sync) {
                if (index == 10) {
                    find = false;
                    sync = false;
                    
                    // 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                } else {
                    index2 = index2 + 1;
                    index = index + 1;
                    if (index == 1) {
                        
                        // İlk başlama mesajı
                        logger("str", plugins("think", name));
                    } else {
                        
                        // Sonraki başlama mesajları
                        if (index == 10) {
                            
                            // Son tahmin hakkı için bilgilendirme mesajı
                            logger("str", plugins("sthink", name));
                            delay(3.5);
                        } else {
                            
                            // Yanlış tahminler için bilgilendirme mesajı
                            logger("str", plugins("wthink", name));
                        }
                    }
                    cin >> think;
                    if (think == number) {
                        
                        // Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        find = true;
                        sync = false;
                    } else {
                        delay(1);
                        if (index == 10) {
                        } else {
                            if (think > number) {
                                
                                // Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                                if (think - number > 25) {
                                    
                                    // Tahmin, sayıdan uzak ise bunu gönder
                                    logger("str", plugins("cold", ""));
                                } else {
                                    if (think - number > 15) {
                                        
                                        // Tahmin, sayıya biraz yakın ise bunu gönder
                                        logger("str", plugins("warm", ""));
                                    } else {
                                        
                                        // Tahmin, sayıya çok yakın ise bunu gönder
                                        logger("str", plugins("hot", ""));
                                    }
                                }
                            } else {
                                
                                // Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                                if (number - think > 25) {
                                    
                                    // Tahmin, sayıdan uzak ise bunu gönder
                                    logger("str", plugins("cold", ""));
                                } else {
                                    if (number - think > 15) {
                                        
                                        // Tahmin, sayıya biraz yakın ise bunu gönder
                                        logger("str", plugins("warm", ""));
                                    } else {
                                        
                                        // Tahmin, sayıya çok yakın ise bunu gönder
                                        logger("str", plugins("hot", ""));
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (find) {
                
                // Oyun Kazanıldığında Buraya Dön
                if (index2 < 4) {
                    
                    // Sayı hemen tahmin edilirse ek mesaj gönder
                    logger("str", plugins("swin", name));
                    delay(1);
                    logger("str", plugins("win", name));
                    delay(2);
                    logger("str", toString(index2) + ". Denemede Oyunu Kazandınız!");
                } else {
                    
                    // Klasik tebrik mesajı
                    logger("str", plugins("win", name));
                    delay(2);
                    logger("str", toString(index2) + ". Denemede Oyunu Kazandınız!");
                }
            } else {
                
                // Oyun Kaybedildiğinde Buraya Dön
                logger("str", plugins("lose", name));
                delay(2);
                logger("str", "Bir kez daha oynamak için 1 yazman yeterli.");
                cin >> name;
                if (name == "1") {
                    
                    // Program kapanmadan bir kez daha oynama hakkı verir.
                    main();
                }
            }
        } else {
            
            // Normal Oyun Modu
            int index, index2, think;
            
            index = 0;
            index2 = 0;
            sync = true;
            number = rand(false);
            logger("str", plugins("get num", name));
            delay(2);
            
            // Sayı Belirlendi
            while (sync) {
                if (index == 10) {
                    find = false;
                    sync = false;
                    
                    // 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                } else {
                    index2 = index2 + 1;
                    index = index + 1;
                    if (index == 1) {
                        
                        // İlk başlama mesajı
                        logger("str", plugins("think", name));
                    } else {
                        
                        // Sonraki başlama mesajları
                        if (index == 10) {
                            
                            // Son tahmin hakkı için bilgilendirme mesajı
                            logger("str", plugins("sthink", name));
                            delay(3.5);
                        } else {
                            
                            // Yanlış tahminler için bilgilendirme mesajı
                            logger("str", plugins("wthink", name));
                        }
                    }
                    cin >> think;
                    if (think == number) {
                        
                        // Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        find = true;
                        sync = false;
                    } else {
                        
                        // Tahmin Yanlış İse Döngüyü Yeniden Başlat
                    }
                }
            }
            if (find) {
                
                // Oyun Kazanıldığında Buraya Dön
                if (index2 < 4) {
                    
                    // Sayı hemen tahmin edilirse ek mesaj gönder
                    logger("str", plugins("swin", name));
                    delay(1);
                    logger("str", plugins("win", name));
                    delay(2);
                    logger("str", toString(index2) + ". Denemede Oyunu Kazandınız!");
                } else {
                    
                    // Klasik tebrik mesajı
                    logger("str", plugins("win", name));
                    delay(2);
                    logger("str", toString(index2) + ". Denemede Oyunu Kazandınız!");
                }
            } else {
                
                // Oyun Kaybedildiğinde Buraya Dön
                logger("str", plugins("lose", name));
                delay(2);
                logger("str", "Bir kez daha oynamak için 1 yazman yeterli.");
                cin >> name;
                if (name == "1") {
                    
                    // Program kapanmadan bir kez daha oynama hakkı verir.
                    main();
                }
            }
        }
    } else {
        if (mode == 3) {
            
            // Bilgilendirme Mesajı
            number = 0;
            do {
                logger("str", plugins("info", toString(number)));
                delay(4);
                number = number + 1;
            } while (number != 10);
            
            // do Dögüsü kullanmak en iyi seçenek olacaktır
        } else {
            logger("str", plugins("wmode", ""));
        }
    }
    return 0;
}

bool delay(double sn) {
    // Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
    // setTimeout()
    // time.sleep()
    // gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
    bool payload;
    double ms;
    
    ms = sn * 30000;
    
    // 1 Saniye ≊ 30.000 Sayım
    // 1 Sayım = 3,14e-5
    int n;
    
    n = 0;
    while (n < ms) {
        n = n + 1;
    }
    payload = true;
    
    return payload;
}

bool exit() {
    // Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
    // Bu fonskiyon hiçbir şekilde pas geçilemez.
    // Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
    do {
    } while (true);
    
    return ex;
}

bool logger(string type, string var_this) {
    bool payload;
    
    // Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
    // 
    // Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
    if (type == "int") {
        cout << toInt(var_this) << endl;
        payload = true;
    } else {
        if (type == "str") {
            cout << toString(var_this) << endl;
            payload = true;
        } else {
            if (type == "bool") {
                payload = var_this;
            } else {
                
                // Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                // Program durdurulur.
                // process.exit()
                exit();
            }
        }
    }
    
    // logger("str", "test")  =>  String İçin
    // logger("int", "190")  =>  Sayı İçin
    // logger("bool", true)  => true-false için
    
    return payload;
}

bool namecorrection(string name) {
    bool payload;
    
    if (name.length() < 3) {
        logger("str", string("İsminiz 3 kelimeden kısa olmamalı.") + (char) 13 + "Lütfen programı baştan başlatın.");
        exit();
    } else {
        payload = true;
    }
    
    // Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
    
    return payload;
}

string plugins(string type, string arg) {
    // Program içindeki çeşitlilik için gerekli fonksiyon.
    // Fonksiyon karmaşası olmaması için kısaltıldı.
    string payload;
    string str[10];
    
    if (type == "ask name") {
        str[0] = string("Oyuna Hoşgeldin Yabancı!") + (char) 13 + "Lütfen Adını Gir:";
        str[1] = string("Hey, Merhaba Yabacı :)") + (char) 13 + "Lütfen İsmini Yazar mısın?";
        str[2] = string("Yeni bir oyuncu. Yaşasınn!") + (char) 13 + "Adını söylermisin lütfen..";
        str[3] = string("Oyunda Yeni Bir Katılımcı Var!") + (char) 13 + "Lütfen İsmini Gir:";
        str[4] = string("İşte yeni bir oyuncu daha!") + (char) 13 + "Sana nasıl hitap etmemi istersin?";
        str[5] = string("Seni daha önce buralarda görmedim..") + (char) 13 + "Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle.";
        str[6] = string("Oyuna Hoşgeldin!") + (char) 13 + "Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz.";
        payload = str[rand() % 7];
    } else {
        if (type == "after name") {
            str[0] = string("Merhaba ") + arg + (char) 13 + "Oyunun kuralları şunlardır:" + (char) 13 + "1) Sistem 0-100 arasında sayı seçer." + (char) 13 + "2) Sayıyı tahmin etmeye çalışırsın" + (char) 13 + "3) Toplam 10 adet başarısız denemeden sonra oyun biter." + (char) 13 + "4) Sayı bulunursa oyun kazanılır!";
            payload = str[0];
        } else {
            if (type == "game mode") {
                str[0] = string("Lütfen Oyun Modunu Seç") + (char) 13 + (char) 13 + "1) Kolay (Sıcak-Soğuk Mantığı)" + (char) 13 + "2) Normal (Yönergeler Yok)" + (char) 13 + "3) İşleyiş Hakkında Bilgi Al";
                payload = str[0];
            } else {
                if (type == "wmode") {
                    str[0] = "Lütfen Sadece 1 veya 2 Yazın";
                    str[1] = "Yanlış Seçim! Sadece 1 veya 2 yazın!";
                    payload = str[rand() % 2];
                } else {
                    if (type == "get num") {
                        str[0] = string("Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! ") + arg;
                        str[1] = "Tuttum! Hadi Başlayalım :)";
                        str[2] = string("Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans ") + arg + " :)";
                        payload = str[rand() % 3];
                    } else {
                        if (type == "think") {
                            str[0] = "Tahminin?";
                            str[1] = string("Sence ne olabilir ") + arg + "?";
                            str[2] = "Bi fikrin varmı?";
                            str[3] = string("Tahminin için bekliyorum ") + arg;
                            str[4] = "İyi düşün ve öyle karar ver..";
                            str[5] = "Bencee.. Ay, yardım edemem.. En iyisi tahmin et.";
                            str[6] = string("Şansını boşa harcama ") + arg;
                            str[7] = "Sakın yanlış tahin ediyim deme haa";
                            str[8] = string("Hadi sıra sende ") + arg;
                            payload = str[rand() % 9];
                        } else {
                            if (type == "wthink") {
                                str[0] = "Yanlış! Tahminin?";
                                str[1] = string("Bu Değil. Sence ne olabilir ") + arg + "?";
                                str[2] = "Sayı bu değil. Bi fikrin varmı?";
                                str[3] = string("Yeniden.. Tahminin için bekliyorum ") + arg;
                                str[4] = "Şimdi iyi düşün ve öyle karar ver..";
                                str[5] = "Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et.";
                                str[6] = string("Şansını boşa harcama ") + arg;
                                str[7] = "Ah be abi. Sakın yanlış tahin ediyim deme haa";
                                str[8] = string("Tekrardan.. Hadi sıra sende ") + arg;
                                payload = str[rand() % 9];
                            } else {
                                if (type == "sthink") {
                                    str[0] = "Hey, hey! Bu son hakkın. Dikkatli Ol!";
                                    str[1] = string("Dur Biraz! Bu Son Şansın. İyi Kullan ") + arg;
                                    str[2] = "Kader Anı! Oyunu kazanman için son şans!";
                                    str[3] = string("Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin ") + arg;
                                    str[4] = "Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı..";
                                    payload = str[rand() % 5];
                                } else {
                                    if (type == "win") {
                                        str[0] = string("[+] Kazandın!!!") + (char) 13 + "İşte Buuu! Nasılda tahmin ettin *o*" + (char) 13 + (char) 13 + "Bir sonraki oyunda görüşmek üzere..";
                                        str[1] = string("[+] Tebrikler ") + arg + "." + (char) 13 + "Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın." + (char) 13 + "Bir sonraki oyununda başarılar.";
                                        str[2] = string("[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)") + (char) 13 + "Bir oyuna daha var mısın..";
                                        str[3] = string("[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum.") + (char) 13 + "Sonraki oyunlarda görüşmek dileğiyle..";
                                        str[4] = string("[+] İyi iş çıkardın ") + arg + (char) 13 + "Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \\'_'/";
                                        payload = str[rand() % 5];
                                    } else {
                                        if (type == "swin") {
                                            str[0] = "[⁂] İnanılmaz.. Tek Kelime İle Şahane!";
                                            str[1] = "[⁂] Ne.. Bu kadar hızlı yenilemem..";
                                            str[2] = "[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim..";
                                            str[3] = "[⁂] Sen..? Nasıl..? Hile mi yapıyosun??";
                                            str[4] = "[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?";
                                            payload = str[rand() % 5];
                                        } else {
                                            if (type == "lose") {
                                                str[0] = "[-] Üzgünüm, Oyunu Kaybettiniz.";
                                                str[1] = "[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın..";
                                                str[2] = "[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin.";
                                                str[3] = "[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın.";
                                                str[4] = "[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez..";
                                                payload = str[rand() % 5];
                                            } else {
                                                if (type == "cold") {
                                                    str[0] = string("↘                ↙") + (char) 13 + " Soğuk" + (char) 13 + "↗                ↖";
                                                    payload = str[0];
                                                } else {
                                                    if (type == "warm") {
                                                        str[0] = string("↘                ↙") + (char) 13 + "  Ilık" + (char) 13 + "↗                ↖";
                                                        payload = str[0];
                                                    } else {
                                                        if (type == "hot") {
                                                            str[0] = string("↘                ↙") + (char) 13 + " Sıcak" + (char) 13 + "↗                ↖";
                                                            payload = str[0];
                                                        } else {
                                                            if (type == "info") {
                                                                str[0] = "Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır.";
                                                                str[1] = "Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir.";
                                                                str[2] = "İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır.";
                                                                str[3] = "Ardından oyun hakkında bilgilendirme mesajı gönderilir.";
                                                                str[4] = "Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki 'Ana' yazan yere basıp 'logger' seçmelisiniz.";
                                                                str[5] = "Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor.";
                                                                str[6] = "Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir.";
                                                                str[7] = "Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir.";
                                                                str[8] = "Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır.";
                                                                str[9] = "Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur.";
                                                                payload = str[toInt(arg)];
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // prototip => plugins(<str>, <str>)
    // Örnek:
    // plugins("ask name", " ")
    // plugins("after name", "İsim")
    
    return payload;
}

int rand(bool type) {
    int payload, opt, num;
    int index[101];
    
    // 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
    // 
    // var dizin = ["bir", "iki", "üç"]
    // return dizin[0]     // "bir"
    if (!type) {
        payload = rand() % 101;
        
        // Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
        // Değişken kontrolü için;
        // rand(true)
        // 
        // Direk işlem için;
        // rand(false)
        // 
        // kullanın.
        if (payload == 0) {
            rand(false);
        }
    } else {
        
        // Bu kısım değişken kontrolü yapmak isteyenler içindir.
        num = 0;
        do {
            index[num] = num;
            num = num + 1;
        } while (num < 101);
        
        // do döngüsü kullanılır.
        opt = rand() % 101;
        payload = index[opt];
        if (payload == 0) {
            rand(true);
        }
    }
    
    // İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
    // Çıkış int (Tamsayı) olarak döner.
    
    return payload;
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
