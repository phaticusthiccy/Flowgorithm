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
    local sn="$1"   #real
    local payload
    local ms
    local n
    
    # Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
    # setTimeout()
    # time.sleep()
    # gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
    ms=$(calc "$sn * 30000")
    
    # 1 Saniye ≊ 30.000 Sayım
    # 1 Sayım = 3,14e-5
    n=0
    while [[ $n -lt $ms ]]; do
        n=$[ $n + 1 ]
    done
    payload=1

    echo $payload
}

function func_exit() {
    # Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
    # Bu fonskiyon hiçbir şekilde pas geçilemez.
    # Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
    while [[ 1==1 ]]; do
        if [[ ! (1) ]]; then break; fi
    done

    echo $ex
}

function logger() {
    local var_type="$1"   #text
    local this="$2"   #text
    local payload
    
    # Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
    # 
    # Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
    if [[ $var_type == "int" ]]; then
        echo $this >$(tty)
        payload=1
    else
        if [[ $var_type == "str" ]]; then
            echo $this >$(tty)
            payload=1
        else
            if [[ $var_type == "bool" ]]; then
                payload=$this
            else
                
                # Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                # Program durdurulur.
                # process.exit()
                func_exit 
            fi
        fi
    fi
    
    # logger("str", "test")  =>  String İçin
    # logger("int", "190")  =>  Sayı İçin
    # logger("bool", true)  => true-false için

    echo $payload
}

function namecorrection() {
    local name="$1"   #text
    local payload
    
    if [[ ${#$name} -lt 3 ]]; then
        logger  "str" "İsminiz 3 kelimeden kısa olmamalı."$(tochar 13)"Lütfen programı baştan başlatın."
        func_exit 
    else
        payload=1
    fi
    
    # Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.

    echo $payload
}

function plugins() {
    local var_type="$1"   #text
    local arg="$2"   #text
    local payload
    local str
    
    # Program içindeki çeşitlilik için gerekli fonksiyon.
    # Fonksiyon karmaşası olmaması için kısaltıldı.
    declare -a str
    
    if [[ $var_type == "ask name" ]]; then
        str[0]="Oyuna Hoşgeldin Yabancı!"$(tochar 13)"Lütfen Adını Gir:"
        str[1]="Hey, Merhaba Yabacı :)"$(tochar 13)"Lütfen İsmini Yazar mısın?"
        str[2]="Yeni bir oyuncu. Yaşasınn!"$(tochar 13)"Adını söylermisin lütfen.."
        str[3]="Oyunda Yeni Bir Katılımcı Var!"$(tochar 13)"Lütfen İsmini Gir:"
        str[4]="İşte yeni bir oyuncu daha!"$(tochar 13)"Sana nasıl hitap etmemi istersin?"
        str[5]="Seni daha önce buralarda görmedim.."$(tochar 13)"Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle."
        str[6]="Oyuna Hoşgeldin!"$(tochar 13)"Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz."
        payload=${str[$RANDOM % 7]}
    else
        if [[ $var_type == "after name" ]]; then
            str[0]="Merhaba $arg"$(tochar 13)"Oyunun kuralları şunlardır:"$(tochar 13)"1) Sistem 0-100 arasında sayı seçer."$(tochar 13)"2) Sayıyı tahmin etmeye çalışırsın"$(tochar 13)"3) Toplam 10 adet başarısız denemeden sonra oyun biter."$(tochar 13)"4) Sayı bulunursa oyun kazanılır!"
            payload=${str[0]}
        else
            if [[ $var_type == "game mode" ]]; then
                str[0]="Lütfen Oyun Modunu Seç"$(tochar 13)""$(tochar 13)"1) Kolay (Sıcak-Soğuk Mantığı)"$(tochar 13)"2) Normal (Yönergeler Yok)"$(tochar 13)"3) İşleyiş Hakkında Bilgi Al"
                payload=${str[0]}
            else
                if [[ $var_type == "wmode" ]]; then
                    str[0]="Lütfen Sadece 1 veya 2 Yazın"
                    str[1]="Yanlış Seçim! Sadece 1 veya 2 yazın!"
                    payload=${str[$RANDOM % 2]}
                else
                    if [[ $var_type == "get num" ]]; then
                        str[0]="Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! $arg"
                        str[1]="Tuttum! Hadi Başlayalım :)"
                        str[2]="Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans $arg :)"
                        payload=${str[$RANDOM % 3]}
                    else
                        if [[ $var_type == "think" ]]; then
                            str[0]="Tahminin?"
                            str[1]="Sence ne olabilir $arg?"
                            str[2]="Bi fikrin varmı?"
                            str[3]="Tahminin için bekliyorum $arg"
                            str[4]="İyi düşün ve öyle karar ver.."
                            str[5]="Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                            str[6]="Şansını boşa harcama $arg"
                            str[7]="Sakın yanlış tahin ediyim deme haa"
                            str[8]="Hadi sıra sende $arg"
                            payload=${str[$RANDOM % 9]}
                        else
                            if [[ $var_type == "wthink" ]]; then
                                str[0]="Yanlış! Tahminin?"
                                str[1]="Bu Değil. Sence ne olabilir $arg?"
                                str[2]="Sayı bu değil. Bi fikrin varmı?"
                                str[3]="Yeniden.. Tahminin için bekliyorum $arg"
                                str[4]="Şimdi iyi düşün ve öyle karar ver.."
                                str[5]="Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                                str[6]="Şansını boşa harcama $arg"
                                str[7]="Ah be abi. Sakın yanlış tahin ediyim deme haa"
                                str[8]="Tekrardan.. Hadi sıra sende $arg"
                                payload=${str[$RANDOM % 9]}
                            else
                                if [[ $var_type == "sthink" ]]; then
                                    str[0]="Hey, hey! Bu son hakkın. Dikkatli Ol!"
                                    str[1]="Dur Biraz! Bu Son Şansın. İyi Kullan $arg"
                                    str[2]="Kader Anı! Oyunu kazanman için son şans!"
                                    str[3]="Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin $arg"
                                    str[4]="Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı.."
                                    payload=${str[$RANDOM % 5]}
                                else
                                    if [[ $var_type == "win" ]]; then
                                        str[0]="[+] Kazandın!!!"$(tochar 13)"İşte Buuu! Nasılda tahmin ettin *o*"$(tochar 13)""$(tochar 13)"Bir sonraki oyunda görüşmek üzere.."
                                        str[1]="[+] Tebrikler $arg."$(tochar 13)"Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın."$(tochar 13)"Bir sonraki oyununda başarılar."
                                        str[2]="[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)"$(tochar 13)"Bir oyuna daha var mısın.."
                                        str[3]="[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum."$(tochar 13)"Sonraki oyunlarda görüşmek dileğiyle.."
                                        str[4]="[+] İyi iş çıkardın $arg"$(tochar 13)"Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \'_'/"
                                        payload=${str[$RANDOM % 5]}
                                    else
                                        if [[ $var_type == "swin" ]]; then
                                            str[0]="[⁂] İnanılmaz.. Tek Kelime İle Şahane!"
                                            str[1]="[⁂] Ne.. Bu kadar hızlı yenilemem.."
                                            str[2]="[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim.."
                                            str[3]="[⁂] Sen..? Nasıl..? Hile mi yapıyosun??"
                                            str[4]="[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?"
                                            payload=${str[$RANDOM % 5]}
                                        else
                                            if [[ $var_type == "lose" ]]; then
                                                str[0]="[-] Üzgünüm, Oyunu Kaybettiniz."
                                                str[1]="[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın.."
                                                str[2]="[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin."
                                                str[3]="[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın."
                                                str[4]="[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez.."
                                                payload=${str[$RANDOM % 5]}
                                            else
                                                if [[ $var_type == "cold" ]]; then
                                                    str[0]="↘                ↙"$(tochar 13)" Soğuk"$(tochar 13)"↗                ↖"
                                                    payload=${str[0]}
                                                else
                                                    if [[ $var_type == "warm" ]]; then
                                                        str[0]="↘                ↙"$(tochar 13)"  Ilık"$(tochar 13)"↗                ↖"
                                                        payload=${str[0]}
                                                    else
                                                        if [[ $var_type == "hot" ]]; then
                                                            str[0]="↘                ↙"$(tochar 13)" Sıcak"$(tochar 13)"↗                ↖"
                                                            payload=${str[0]}
                                                        else
                                                            if [[ $var_type == "info" ]]; then
                                                                str[0]="Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır."
                                                                str[1]="Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir."
                                                                str[2]="İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır."
                                                                str[3]="Ardından oyun hakkında bilgilendirme mesajı gönderilir."
                                                                str[4]="Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki 'Ana' yazan yere basıp 'logger' seçmelisiniz."
                                                                str[5]="Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor."
                                                                str[6]="Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir."
                                                                str[7]="Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir."
                                                                str[8]="Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır."
                                                                str[9]="Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur."
                                                                payload=${str[$arg]}
                                                            fi
                                                        fi
                                                    fi
                                                fi
                                            fi
                                        fi
                                    fi
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
    
    # prototip => plugins(<str>, <str>)
    # Örnek:
    # plugins("ask name", " ")
    # plugins("after name", "İsim")

    echo $payload
}

function rand() {
    local var_type="$1"   #boolean
    local payload opt num
    local index
    declare -a index
    
    # 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
    # 
    # var dizin = ["bir", "iki", "üç"]
    # return dizin[0]     // "bir"
    if [[ !$var_type == 1 ]]; then
        payload=$[ $RANDOM % 101 ]
        
        # Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
        # Değişken kontrolü için;
        # rand(true)
        # 
        # Direk işlem için;
        # rand(false)
        # 
        # kullanın.
        if [[ $payload -eq 0 ]]; then
            rand  0
        fi
    else
        
        # Bu kısım değişken kontrolü yapmak isteyenler içindir.
        num=0
        while [[ 1==1 ]]; do
            index[$num]=$num
            num=$[ $num + 1 ]
            if [[ ! ($num -lt 101) ]]; then break; fi
        done
        
        # do döngüsü kullanılır.
        opt=$[ $RANDOM % 101 ]
        payload=${index[$opt]}
        if [[ $payload -eq 0 ]]; then
            rand  1
        fi
    fi
    
    # İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
    # Çıkış int (Tamsayı) olarak döner.

    echo $payload
}

# Main
logger  "str" $(plugins "ask name" "")
delay  2
read name
namecorrection  $name
delay  2

# İsim Alma Kısmı Tamamlandı
logger  "str" $(plugins "after name" $name)
delay  9
logger  "str" $(plugins "game mode" "")
read mode

# Oyun Modu Başarıyla Seçildi
if [[ $mode -eq 1 ]]; then
    if [[ $mode -eq 1 ]]; then
        
        # Kolay Oyun Modu
        index=0
        index2=0
        sync=1
        number=$(rand 1)
        logger  "str" $(plugins "get num" $name)
        delay  2
        
        # Sayı Belirlendi
        while [[ $sync == 1 ]]; do
            if [[ $index -eq 10 ]]; then
                var_find=0
                sync=0
                
                # 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
            else
                index2=$[ $index2 + 1 ]
                index=$[ $index + 1 ]
                if [[ $index -eq 1 ]]; then
                    
                    # İlk başlama mesajı
                    logger  "str" $(plugins "think" $name)
                else
                    
                    # Sonraki başlama mesajları
                    if [[ $index -eq 10 ]]; then
                        
                        # Son tahmin hakkı için bilgilendirme mesajı
                        logger  "str" $(plugins "sthink" $name)
                        delay  3.5
                    else
                        
                        # Yanlış tahminler için bilgilendirme mesajı
                        logger  "str" $(plugins "wthink" $name)
                    fi
                fi
                read think
                if [[ $think -eq $number ]]; then
                    
                    # Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                    var_find=1
                    sync=0
                else
                    delay  1
                    if [[ $index -eq 10 ]]; then
                    else
                        if [[ $think -gt $number ]]; then
                            
                            # Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                            if [[ $think - $number -gt 25 ]]; then
                                
                                # Tahmin, sayıdan uzak ise bunu gönder
                                logger  "str" $(plugins "cold" "")
                            else
                                if [[ $think - $number -gt 15 ]]; then
                                    
                                    # Tahmin, sayıya biraz yakın ise bunu gönder
                                    logger  "str" $(plugins "warm" "")
                                else
                                    
                                    # Tahmin, sayıya çok yakın ise bunu gönder
                                    logger  "str" $(plugins "hot" "")
                                fi
                            fi
                        else
                            
                            # Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                            if [[ $number - $think -gt 25 ]]; then
                                
                                # Tahmin, sayıdan uzak ise bunu gönder
                                logger  "str" $(plugins "cold" "")
                            else
                                if [[ $number - $think -gt 15 ]]; then
                                    
                                    # Tahmin, sayıya biraz yakın ise bunu gönder
                                    logger  "str" $(plugins "warm" "")
                                else
                                    
                                    # Tahmin, sayıya çok yakın ise bunu gönder
                                    logger  "str" $(plugins "hot" "")
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        done
        if [[ $var_find == 1 ]]; then
            
            # Oyun Kazanıldığında Buraya Dön
            if [[ $index2 -lt 4 ]]; then
                
                # Sayı hemen tahmin edilirse ek mesaj gönder
                logger  "str" $(plugins "swin" $name)
                delay  1
                logger  "str" $(plugins "win" $name)
                delay  2
                logger  "str" "$index2. Denemede Oyunu Kazandınız!"
            else
                
                # Klasik tebrik mesajı
                logger  "str" $(plugins "win" $name)
                delay  2
                logger  "str" "$index2. Denemede Oyunu Kazandınız!"
            fi
        else
            
            # Oyun Kaybedildiğinde Buraya Dön
            logger  "str" $(plugins "lose" $name)
            delay  2
            logger  "str" "Bir kez daha oynamak için 1 yazman yeterli."
            read name
            if [[ $name == "1" ]]; then
                
                # Program kapanmadan bir kez daha oynama hakkı verir.
                main 
            fi
        fi
    else
        
        # Normal Oyun Modu
        index=0
        index2=0
        sync=1
        number=$(rand 0)
        logger  "str" $(plugins "get num" $name)
        delay  2
        
        # Sayı Belirlendi
        while [[ $sync == 1 ]]; do
            if [[ $index -eq 10 ]]; then
                var_find=0
                sync=0
                
                # 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
            else
                index2=$[ $index2 + 1 ]
                index=$[ $index + 1 ]
                if [[ $index -eq 1 ]]; then
                    
                    # İlk başlama mesajı
                    logger  "str" $(plugins "think" $name)
                else
                    
                    # Sonraki başlama mesajları
                    if [[ $index -eq 10 ]]; then
                        
                        # Son tahmin hakkı için bilgilendirme mesajı
                        logger  "str" $(plugins "sthink" $name)
                        delay  3.5
                    else
                        
                        # Yanlış tahminler için bilgilendirme mesajı
                        logger  "str" $(plugins "wthink" $name)
                    fi
                fi
                read think
                if [[ $think -eq $number ]]; then
                    
                    # Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                    var_find=1
                    sync=0
                else
                    
                    # Tahmin Yanlış İse Döngüyü Yeniden Başlat
                fi
            fi
        done
        if [[ $var_find == 1 ]]; then
            
            # Oyun Kazanıldığında Buraya Dön
            if [[ $index2 -lt 4 ]]; then
                
                # Sayı hemen tahmin edilirse ek mesaj gönder
                logger  "str" $(plugins "swin" $name)
                delay  1
                logger  "str" $(plugins "win" $name)
                delay  2
                logger  "str" "$index2. Denemede Oyunu Kazandınız!"
            else
                
                # Klasik tebrik mesajı
                logger  "str" $(plugins "win" $name)
                delay  2
                logger  "str" "$index2. Denemede Oyunu Kazandınız!"
            fi
        else
            
            # Oyun Kaybedildiğinde Buraya Dön
            logger  "str" $(plugins "lose" $name)
            delay  2
            logger  "str" "Bir kez daha oynamak için 1 yazman yeterli."
            read name
            if [[ $name == "1" ]]; then
                
                # Program kapanmadan bir kez daha oynama hakkı verir.
                main 
            fi
        fi
    fi
else
    if [[ $mode -eq 3 ]]; then
        
        # Bilgilendirme Mesajı
        number=0
        while [[ 1==1 ]]; do
            logger  "str" $(plugins "info" $number)
            delay  4
            number=$[ $number + 1 ]
            if [[ ! ($number -ne 10) ]]; then break; fi
        done
        
        # do Dögüsü kullanmak en iyi seçenek olacaktır
    else
        logger  "str" $(plugins "wmode" "")
    fi
fi
