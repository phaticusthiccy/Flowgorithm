#!/bin/bash

# This is a useful function for evaluating expressions. expr & let can only can compute integers.
function calc() {
    echo $( bc -l -q <<< "$1" )
}

function delay() {
    local sn="$1"   #integer
    local sonuc
    local ms
    local n
    
    ms=$[ $sn * 30000 ]
    n=0
    while [[ $n -ne $ms ]]; do
        n=$[ $n + 1 ]
    done
    sonuc=1

    echo $sonuc
}

# Main
sayı=1
sonuc=0
echo "2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: " >$(tty)
read giris
delay  1
echo "2. Sayıyı Belirleyin: " >$(tty)
read giris2
delay  1
echo "Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın." >$(tty)
read debug
if [[ $giris -gt $giris2 ]]; then
    af1=$giris
    af2=$giris2
    giris=$af2
    giris2=$af1
else
    
    # İlk giriş, 2. girişten küçük ise program çalışmaz.
    # 
    # Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
fi
for sayı in $(seq $giris $giris2); do
    if [[ $sayı % 2 -eq 1 ]]; then
        tempsonuc=$sonuc
        sonuc=$[ $sonuc + $sayı ]
        if [[ $debug == "n" ]]; then
            
            # es geç
        else
            echo "$tempsonuc+$sayı: $sonuc" >$(tty)
        fi
    fi
done
echo "Sonuc: $sonuc" >$(tty)
