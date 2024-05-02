#!/bin/bash

# This is a useful function for evaluating expressions. expr & let can only can compute integers.
function calc() {
    echo $( bc -l -q <<< "$1" )
}

function sqrt() {
    echo $( bc -l <<< "$1 ^ 0.5" )
}

function tochar() {
    [ "$1" -lt 256 ] || return 0
    printf "\\$(printf '%03o' "$1")"
}

function fonksiyon() {
    local deger="$1"   #real
    local var_a="$2"   #real
    local b="$3"   #real
    local sonuc
    
    if [[ $deger -lt 0 ]]; then
        sonuc="Kök Bulunamadı"
    else
        if [[ $deger -eq 0 ]]; then
            sonuc="1. ve 2. Kökler Eşittir. Sonuç: -$b / 2 * $var_a"
        else
            sonuc="pass"
        fi
    fi

    echo $sonuc
}

function formül() {
    local var_a="$1"   #integer
    local b="$2"   #integer
    local var_c="$3"   #integer
    local sonuc
    
    sonuc=$[ $b * $b - 4 * $var_a * $var_c ]

    echo $sonuc
}

# Main
declare -a fsayı

# Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
# // var fsayı = new Array()
echo "'a' Sayısının Değerini Girin: " >$(tty)
read fsayı[0]
echo "'b' Sayısının Değerini Girin: " >$(tty)
read fsayı[1]
echo "'c' Sayısının Değerini Girin: " >$(tty)
read fsayı[2]
fsayı[3]=$(formül ${fsayı[0]} ${fsayı[1]} ${fsayı[2]})

# Delta Formülü
# // formül(a = reel, b = ree, c = ree)
echo "Program İşleyişini Görmek İster misiniz? (Y yada N): " >$(tty)
read islem
if [[ $islem == "y" ]]; then
    
    # "Görünür İşlemler"
    if [[ $(fonksiyon ${fsayı[3]} ${fsayı[0]} ${fsayı[1]}) == "pass" ]]; then
        
        # 2 kök içeren sonuçlar buraya yazılır.
        # Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
        # Sonuç için Gerekli Formül
        # 
        # // fonksiyon(delta = reel, a = reel, b = reel)
        # // return str
        echo "Kök 1: $(calc "-${fsayı[1]} + $(sqrt ${fsayı[3]})") / $(calc "2 * ${fsayı[0]}")" >$(tty)
        echo "Kök 2: $(calc "-${fsayı[1]} - $(sqrt ${fsayı[3]})") / $(calc "2 * ${fsayı[0]}")" >$(tty)
        
        # Kök formülleri yazıldı.
        echo "Formüller: "$(tochar 13)""$(tochar 13)"Delta Hesabı"$(tochar 13)"Delta = ${fsayı[1]}^2-4*${fsayı[0]}*${fsayı[2]}"$(tochar 13)""$(tochar 13)"===================="$(tochar 13)""$(tochar 13)"X1 İçin:"$(tochar 13)"(-${fsayı[1]}+(${fsayı[3]}^(1/2))) / (2*${fsayı[0]})"$(tochar 13)""$(tochar 13)"X2 İçin:"$(tochar 13)"(-${fsayı[1]}-(${fsayı[3]}^(1/2))) / (2*${fsayı[0]})" >$(tty)
    else
        text=$(fonksiyon ${fsayı[3]} ${fsayı[0]} ${fsayı[1]})
        
        # İkincil bir fonksiyon ata.
        # İlk işlem sonuç verirse buraya dön.
        if [[ $text == "Kök Bulunamadı" ]]; then
            echo "$text"$(tochar 13)""$(tochar 13)"Delta 0'a eşittir. Bu yüzden kök yoktur." >$(tty)
        else
            echo "$text"$(tochar 13)""$(tochar 13)"Formül = -${fsayı[1]}/ 2*${fsayı[0]}" >$(tty)
        fi
    fi
else
    
    # "Kapalı İşlemler"
    if [[ $(fonksiyon ${fsayı[3]} ${fsayı[0]} ${fsayı[1]}) == "pass" ]]; then
        echo "Kök 1: $(calc "-${fsayı[1]} + $(sqrt ${fsayı[3]})") / $(calc "2 * ${fsayı[0]}")" >$(tty)
        echo "Kök 2: $(calc "-${fsayı[1]} - $(sqrt ${fsayı[3]})") / $(calc "2 * ${fsayı[0]}")" >$(tty)
    else
        echo $(fonksiyon ${fsayı[3]} ${fsayı[0]} ${fsayı[1]}) >$(tty)
    fi
fi

# Programı Kapat. (return True)
