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

function vki() {
    local kilo="$1"   #integer
    local boy="$2"   #integer
    local sonuc
    local index
    
    index=$(calc "$kilo / $[ $boy * $boy ]")
    if [[ $index -lt 18 ]]; then
        sonuc="zayıf"
    else
        if [[ $index -lt 25 ]]; then
            sonuc="normal"
        else
            if [[ $index -lt 30 ]]; then
                sonuc="kilolu"
            else
                if [[ $index -lt 35 ]]; then
                    sonuc="1. obez"
                else
                    if [[ $index -lt 40 ]]; then
                        sonuc="2. obez"
                    else
                        sonuc="3. obez"
                    fi
                fi
            fi
        fi
    fi

    echo $sonuc
}

# Main
echo "Lütfen Kilonuzu Giriniz:   (Ex: 69)  " >$(tty)
read kilo
delay  1
echo "Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  " >$(tty)
read boy
cümle="VKI Tablosunda "
if [[ $(vki $kilo $boy) == "zayıf" ]]; then
    tab="$cümle'Zayıf' Bölümündesin"
else
    if [[ $(vki $kilo $boy) == "normal" ]]; then
        tab="$cümle'Normal' Bölümdesin"
    else
        if [[ $(vki $kilo $boy) == "kilolu" ]]; then
            tab="$cümle'Fazla Kilolu' Bölümdesin"
        else
            if [[ $(vki $kilo $boy) == "1. obez" ]]; then
                tab="$cümle'1. Obez' Bölümündesin"
            else
                if [[ $(vki $kilo $boy) == "2. obez" ]]; then
                    tab="$cümle'2. Obez' Bölümündesin"
                else
                    if [[ $(vki $kilo $boy) == "3. obez" ]]; then
                        tab="$cümle'3. Obez' Bölümündesin"
                    fi
                fi
            fi
        fi
    fi
fi
echo $tab >$(tty)
