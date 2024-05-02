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
    
    ms=$[ $sn * 33333 ]
    n=0
    while [[ $n -ne $ms ]]; do
        n=$[ $n + 1 ]
    done
    sonuc=1

    echo $sonuc
}

# Main
sync=1
index=0
index2=0
declare -a günler

günler[0]="Pazartesi"
günler[1]="Salı"
günler[2]="Çarşamba"
günler[3]="Perşembe"
günler[4]="Cuma"
günler[5]="Cumartesi"
günler[6]="Pazar"
while [[ $sync == 1 ]]; do
    if [[ $index -eq 7 ]]; then
    else
        index=$[ $index + 1 ]
        echo "Haftanın $index. Günü: ${günler[$index2]}" >$(tty)
        delay  1
        
        # Çıktı 1 saniye süreyle atılır.
        index2=$[ $index2 + 1 ]
    fi
done
