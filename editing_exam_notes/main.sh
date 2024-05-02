#!/bin/bash

# This is a useful function for evaluating expressions. expr & let can only can compute integers.
function calc() {
    echo $( bc -l -q <<< "$1" )
}

function tochar() {
    [ "$1" -lt 256 ] || return 0
    printf "\\$(printf '%03o' "$1")"
}

function delay() {
    local sn="$1"   #integer
    local sonuc
    local ms
    local n
    
    # Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    ms=$[ $sn * 33 ]
    n=0
    while [[ $n -ne $ms ]]; do
        n=$[ $n + 1 ]
    done
    sonuc=1
    
    # Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
    # boolen test
    # test = delay(200)
    # çıktı test  // true

    echo $sonuc
}

function puanekle() {
    local puan="$1"   #integer
    local sonuc
    local ekpuan
    local index index2
    local sync
    declare -a ekpuan
    
    # while döngüsü için
    sync=1
    index=0
    if [[ $puan -gt 89 ]]; then
        sonuc="pass"
        
        # 90 ve üstü notlar için puan ekleme olmaz.
    else
        if [[ $puan -gt 69 ]]; then
            index2=5
            while [[ $sync == 1 ]]; do
                if [[ $index -eq 6 ]]; then
                    sync=0
                else
                    ekpuan[$index]=$index2
                    index=$[ $index + 1 ]
                    index2=$[ $index2 + 1 ]
                fi
            done
            sonuc=${ekpuan[$RANDOM % 6]}
            
            # Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
        else
            if [[ $puan -gt 49 ]]; then
                index2=10
                while [[ $sync == 1 ]]; do
                    if [[ $index -eq 9 ]]; then
                        sync=0
                    else
                        ekpuan[$index]=$index2
                        index=$[ $index + 1 ]
                        index2=$[ $index2 + 1 ]
                    fi
                done
                sonuc=${ekpuan[$RANDOM % 9]}
                
                # Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
            else
                if [[ $puan -gt 29 ]]; then
                    index2=20
                    while [[ $sync == 1 ]]; do
                        if [[ $index -eq 10 ]]; then
                            sync=0
                        else
                            ekpuan[$index]=$index2
                            index=$[ $index + 1 ]
                            index2=$[ $index2 + 1 ]
                        fi
                    done
                    sonuc=${ekpuan[$RANDOM % 10]}
                    
                    # Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                else
                    index2=30
                    while [[ $sync == 1 ]]; do
                        if [[ $index -eq 11 ]]; then
                            sync=0
                        else
                            ekpuan[$index]=$index2
                            index=$[ $index + 1 ]
                            index2=$[ $index2 + 1 ]
                        fi
                    done
                    sonuc=${ekpuan[$RANDOM % 11]}
                    
                    # Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                fi
            fi
        fi
    fi
    
    # String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
    # var sayı = 0.65   // Javascript
    # sayı = 0.65          // Python
    # local sayı = 0.65          // Lua
    # int sayı = 0.65     // C

    echo $sonuc
}

function puaneklesoru() {
    local no="$1"   #text
    local eskinot="$2"   #integer
    local sonuc
    
    echo "$no. Öğrenci İçin Kaç Puan Eklemek İstersiniz: "$(tochar 13)""$(tochar 13)"Öğrencinin Puanı: $eskinot" >$(tty)
    read sonuc

    echo $sonuc
}

function yardımloop() {
    local sayı="$1"   #integer
    local sonuc
    
    if [[ $sayı -eq 1 ]]; then
    else
        echo "Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın."$(tochar 13)"Yeniden Başlatılıyor.." >$(tty)
        delay  1000
        echo "1) Otomatik Mod Hakkında Yardım"$(tochar 13)"2) Manuel Mod Hakkında Yardım" >$(tty)
        read sayı
        yardımloop  $sayı
    fi
    
    # Yardım Modülü İçin
    # Yanlış değer girildiğinde baştan başlatır
    sonuc=$sayı

    echo $sonuc
}

function yardımloop2() {
    local sayı="$1"   #integer
    local sonuc
    
    if [[ $sayı -eq 1 ]]; then
    else
        echo "Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın."$(tochar 13)"Yeniden Başlatılıyor.." >$(tty)
        delay  1000
        echo "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım"$(tochar 13)"2) Manuel Puan Ekleme Hakkında Yardım"$(tochar 13)"3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım" >$(tty)
        read sayı
        yardımloop2  $sayı
    fi
    sonuc=$sayı

    echo $sonuc
}

# Main
sync=1
index=0
index2=0
declare -a notlar
declare -a eskinotlar
declare -a otonot
declare -a otoeklenennot

echo "Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?"$(tochar 13)""$(tochar 13)"Otomatik için: 'O'"$(tochar 13)"Manuel için: 'M'"$(tochar 13)"Yazın"$(tochar 13)""$(tochar 13)"Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın" >$(tty)
read secim
if [[ $secim == "O" ]]; then
    while [[ $sync == 1 ]]; do
        
        # Bu döngü notları belirler.
        if [[ $index -eq 5 ]]; then
            sync=0
            
            # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
        else
            index=$[ $index + 1 ]
            notlar[$index2]=$[ $RANDOM % 80 ]
            
            # Random sayı belirle
            index2=$[ $index2 + 1 ]
            
            # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
        fi
    done
    sync=1
    index=0
    index2=0
    
    # Değişkenleri sıfırlayalım
    while [[ $sync == 1 ]]; do
        
        # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
        if [[ $index -eq 5 ]]; then
            sync=0
        else
            index=$[ $index + 1 ]
            eskinotlar[$index2]=${notlar[$index2]}
            notlar[$index2]=$[ ${notlar[$index2]} + 20 ]
            index2=$[ $index2 + 1 ]
        fi
    done
    sync=1
    index=0
    index2=0
    
    # Değişkenleri sıfırlayalım
    echo "Yeni Notlar:" >$(tty)
    while [[ $sync == 1 ]]; do
        
        # Bu döngü eski ve yeni notları bir arada yazdırır.
        if [[ $index -eq 5 ]]; then
            sync=0
            
            # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
        else
            index=$[ $index + 1 ]
            echo "$index. Öğrencinin; "$(tochar 13)""$(tochar 13)"Eski Not: ${eskinotlar[$index2]}"$(tochar 13)"Yeni Not: ${notlar[$index2]}" >$(tty)
            delay  500
            
            # 500 Milisaniyelik Gecikme
            index2=$[ $index2 + 1 ]
        fi
    done
else
    if [[ $secim == "M" ]]; then
        echo "1. Öğrencinin Notunu Giriniz: " >$(tty)
        read notlar[0]
        echo "2. Öğrencinin Notunu Giriniz: " >$(tty)
        read notlar[1]
        echo "3. Öğrencinin Notunu Giriniz: " >$(tty)
        read notlar[2]
        echo "4. Öğrencinin Notunu Giriniz: " >$(tty)
        read notlar[3]
        echo "5. Öğrencinin Notunu Giriniz: " >$(tty)
        read notlar[4]
        delay  800
        devam=1
        index=0
        index2=0
        while [[ $sync == 1 ]]; do
            if [[ $index -eq 5 ]]; then
                sync=0
            else
                index=$[ $index + 1 ]
                if [[ ${notlar[$index2]} -gt 100 ]]; then
                    sync=0
                    devam=0
                else
                    if [[ ${notlar[$index2]} -lt 0 ]]; then
                        sync=0
                        devam=0
                    else
                        index2=$[ $index2 + 1 ]
                    fi
                fi
            fi
        done
        if [[ !$devam == 1 ]]; then
            echo "Notlar 100 ve 0 Arasında Olmalıdır." >$(tty)
        else
            echo "Size 3 Seçenek Sunuyoruz:"$(tochar 13)""$(tochar 13)"1) Herkesin Notuna +20 Puan Ekle"$(tochar 13)"2) Herkesin Notuna Eklenecek Puanı Manuel Gir"$(tochar 13)"3) Sistem'in Kendi Not Ekleme Aracını Kullan" >$(tty)
            read secim2
            if [[ $secim2 -eq 3 ]]; then
                delay  59
                index=0
                index2=0
                sync=1
                while [[ $sync == 1 ]]; do
                    if [[ $index -eq 5 ]]; then
                        sync=0
                    else
                        index=$[ $index + 1 ]
                        otoeklenennot[$index2]=$(puanekle ${notlar[$index2]})
                        
                        # Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                        delay  59
                        if [[ ${otoeklenennot[$index2]} == "pass" ]]; then
                            otoeklenennot[$index2]="0"
                        else
                            otonot[$index2]=$[ ${notlar[$index2]} + $(puanekle ${notlar[$index2]}) ]
                        fi
                        index2=$[ $index2 + 1 ]
                    fi
                done
                index=0
                index2=0
                sync=1
                while [[ $sync == 1 ]]; do
                    if [[ $index -eq 5 ]]; then
                        sync=0
                    else
                        index=$[ $index + 1 ]
                        if [[ ${otoeklenennot[$index2]} == "0" ]]; then
                            cikti="$index. Öğrencinin; "$(tochar 13)""$(tochar 13)"Eski Not: ${notlar[$index2]}"$(tochar 13)"Yeni Not: ${notlar[$index2]}"$(tochar 13)"Ek Puan Yok. Not Yeterli."
                        else
                            cikti="$index. Öğrencinin; "$(tochar 13)""$(tochar 13)"Eski Not: ${notlar[$index2]}"$(tochar 13)"Yeni Not: ${otoeklenennot[$index2]} + ${notlar[$index2]}"$(tochar 13)"Eklenen Puan: ${otoeklenennot[$index2]}"
                        fi
                        echo $cikti >$(tty)
                        delay  500
                        index2=$[ $index2 + 1 ]
                    fi
                done
            else
                if [[ $secim2 -eq 2 ]]; then
                    index=0
                    index2=0
                    sync=0
                    
                    # Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                    # Yaha henüz ben keşfedemedim :p
                    delay  230
                    soru1=$(puaneklesoru "1" ${notlar[$index2]})
                    index2=$[ $index2 + 1 ]
                    soru2=$(puaneklesoru "2" ${notlar[$index2]})
                    index2=$[ $index2 + 1 ]
                    soru3=$(puaneklesoru "3" ${notlar[$index2]})
                    index2=$[ $index2 + 1 ]
                    soru4=$(puaneklesoru "4" ${notlar[$index2]})
                    index2=$[ $index2 + 1 ]
                    soru5=$(puaneklesoru "5" ${notlar[$index2]})
                    delay  600
                    sync=1
                    declare -a soruarray
                    
                    soruarray[0]=$soru1
                    soruarray[1]=$soru2
                    soruarray[2]=$soru3
                    soruarray[3]=$soru4
                    soruarray[4]=$soru5
                    if [[ $soru1 -gt 100 && $soru1 -lt 0 ]]; then
                        echo "Notların Son Hali 100 ve 0 Arasında Olmalıdır." >$(tty)
                    else
                        index2=0
                        sayı1=$[ $soru1 + ${notlar[$index2]} ]
                        index2=$[ $index2 + 1 ]
                        sayı2=$[ $soru2 + ${notlar[$index2]} ]
                        index2=$[ $index2 + 1 ]
                        sayı3=$[ $soru3 + ${notlar[$index2]} ]
                        index2=$[ $index2 + 1 ]
                        sayı4=$[ $soru4 + ${notlar[$index2]} ]
                        index2=$[ $index2 + 1 ]
                        sayı5=$[ $soru5 + ${notlar[$index2]} ]
                        index2=0
                        index=0
                        declare -a sonsayılar
                        
                        sonsayılar[0]=$sayı1
                        sonsayılar[1]=$sayı2
                        sonsayılar[2]=$sayı3
                        sonsayılar[3]=$sayı4
                        sonsayılar[4]=$sayı5
                        while [[ $sync == 1 ]]; do
                            if [[ $index -eq 5 ]]; then
                                sync=0
                            else
                                index=$[ $index + 1 ]
                                echo "$index. Öğrencinin; "$(tochar 13)""$(tochar 13)"Eski Not: ${notlar[$index2]}"$(tochar 13)"Yeni Not: ${sonsayılar[$index2]}"$(tochar 13)"Eklenen Puan: ${soruarray[$index2]}" >$(tty)
                                delay  270
                                index2=$[ $index2 + 1 ]
                            fi
                        done
                    fi
                else
                    if [[ $secim2 -eq 1 ]]; then
                        while [[ $sync == 1 ]]; do
                            
                            # Bu döngü notları belirler.
                            if [[ $index -eq 5 ]]; then
                                sync=0
                                
                                # index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                            else
                                index=$[ $index + 1 ]
                                notlar[$index2]=$[ $RANDOM % 80 ]
                                
                                # Random sayı belirle
                                index2=$[ $index2 + 1 ]
                                
                                # 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                            fi
                        done
                        sync=1
                        index=0
                        index2=0
                        
                        # Değişkenleri sıfırlayalım
                        while [[ $sync == 1 ]]; do
                            
                            # Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                            if [[ $index -eq 5 ]]; then
                                sync=0
                            else
                                index=$[ $index + 1 ]
                                eskinotlar[$index2]=${notlar[$index2]}
                                notlar[$index2]=$[ ${notlar[$index2]} + 20 ]
                                index2=$[ $index2 + 1 ]
                            fi
                        done
                        sync=1
                        index=0
                        index2=0
                        
                        # Değişkenleri sıfırlayalım
                        echo "Yeni Notlar:" >$(tty)
                        while [[ $sync == 1 ]]; do
                            
                            # Bu döngü eski ve yeni notları bir arada yazdırır.
                            if [[ $index -eq 5 ]]; then
                                sync=0
                                
                                # Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                            else
                                index=$[ $index + 1 ]
                                if [[ ${notlar[$index2]} -gt 100 ]]; then
                                    notlar[$index2]=100
                                    echo "$index. Öğrencinin; "$(tochar 13)""$(tochar 13)"Eski Not: ${eskinotlar[$index2]}"$(tochar 13)"Yeni Not: ${notlar[$index2]}" >$(tty)
                                else
                                    echo "$index. Öğrencinin; "$(tochar 13)""$(tochar 13)"Eski Not: ${eskinotlar[$index2]}"$(tochar 13)"Yeni Not: ${notlar[$index2]}" >$(tty)
                                fi
                                
                                # 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                delay  500
                                
                                # 500 Milisaniyelik Gecikme
                                index2=$[ $index2 + 1 ]
                            fi
                        done
                    else
                        echo "Lütfen 1, 2 veya 3 yazınız." >$(tty)
                        delay  1000
                        echo "Program Kapatılıyor.." >$(tty)
                        index=3
                        while [[ $sync == 1 ]]; do
                            if [[ $index -eq 0 ]]; then
                                sync=0
                            else
                                delay  1000
                                echo "$index.." >$(tty)
                                index=$[ $index - 1 ]
                            fi
                            
                            # Programın Kapatılması İçin Sayaç Oluştur
                        done
                    fi
                fi
            fi
        fi
    else
        if [[ $secim == "a" ]]; then
            echo "1) Otomatik Mod Hakkında Yardım"$(tochar 13)"2) Manuel Mod Hakkında Yardım" >$(tty)
            read helpnum
            delay  200
            
            # Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
            loop=$(yardımloop $helpnum)
            delay  200
            if [[ $loop -eq 1 ]]; then
                echo "Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar." >$(tty)
                delay  7800
                echo "Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır." >$(tty)
                delay  9000
                echo "Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır." >$(tty)
            else
                echo "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım"$(tochar 13)"2) Manuel Puan Ekleme Hakkında Yardım"$(tochar 13)"3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım" >$(tty)
                read helpnum2
                delay  200
                loop2=$(yardımloop2 $helpnum2)
                delay  200
                if [[ $loop2 -eq 1 ]]; then
                    echo "Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler." >$(tty)
                else
                    if [[ $loop2 -eq 2 ]]; then
                        echo "Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar." >$(tty)
                        delay  7800
                        echo "Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır." >$(tty)
                    else
                        echo "Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır." >$(tty)
                        delay  4500
                        echo "Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır." >$(tty)
                        delay  4500
                        echo "Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar." >$(tty)
                        delay  8000
                        echo "Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır." >$(tty)
                    fi
                fi
            fi
        else
            echo "Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!" >$(tty)
        fi
    fi
fi

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
