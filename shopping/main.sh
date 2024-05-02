#!/bin/bash

# This is a useful function for evaluating expressions. expr & let can only can compute integers.
function calc() {
    echo $( bc -l -q <<< "$1" )
}

function tochar() {
    [ "$1" -lt 256 ] || return 0
    printf "\\$(printf '%03o' "$1")"
}

# Main
süt=10
peynir=10
yumurta=10
echo "Ürünlerin Stok Durumu"$(tochar 13)""$(tochar 13)"Süt :: $süt"$(tochar 13)"Yumurta :: $yumurta"$(tochar 13)"Peynir :: $peynir" >$(tty)
while [[ 1 ]]; do
    echo "Alacaginiz urunun miktarini giriniz"$(tochar 13)"Süt ::" >$(tty)
    read sütkontrol
    if [[ $sütkontrol -gt $süt ]]; then
        echo "Stokta yeterli sut yok" >$(tty)
    else
        süt=$[ $süt - $sütkontrol ]
    fi
    echo "Alacaginiz urunun miktarini giriniz"$(tochar 13)"Yumurta ::" >$(tty)
    read yumurtakontrol
    if [[ $yumurtakontrol -gt $yumurta ]]; then
        echo "Stokta yeterli yumurta yok" >$(tty)
    else
        yumurta=$[ $yumurta - $yumurtakontrol ]
    fi
    echo "Alacaginiz urunun miktarini giriniz"$(tochar 13)"Peynir ::" >$(tty)
    read peynirkontrol
    if [[ $peynirkontrol -gt $peynir ]]; then
        echo "Stokta yeterli peynir yok" >$(tty)
    else
        peynir=$[ $peynir - $peynirkontrol ]
    fi
    echo "Ürünlerin Güncel Stok Durumu"$(tochar 13)""$(tochar 13)"Süt :: $süt"$(tochar 13)"Yumurta :: $yumurta"$(tochar 13)"Peynir :: $peynir" >$(tty)
done
