import math
import strutils

var
    süt: int
    sütkontrol: int
    yumurta: int
    yumurtakontrol: int
    peynir: int
    peynirkontrol: int

süt = 10
peynir = 10
yumurta = 10
echo "Ürünlerin Stok Durumu", char(13), char(13), "Süt :: ", süt, char(13), "Yumurta :: ", yumurta, char(13), "Peynir :: ", peynir
while true:
    echo "Alacaginiz urunun miktarini giriniz", char(13), "Süt ::"
    sütkontrol = parseInt(readLine(stdin))
    if sütkontrol > süt:
        echo "Stokta yeterli sut yok"
    else:
        süt = süt - sütkontrol
    echo "Alacaginiz urunun miktarini giriniz", char(13), "Yumurta ::"
    yumurtakontrol = parseInt(readLine(stdin))
    if yumurtakontrol > yumurta:
        echo "Stokta yeterli yumurta yok"
    else:
        yumurta = yumurta - yumurtakontrol
    echo "Alacaginiz urunun miktarini giriniz", char(13), "Peynir ::"
    peynirkontrol = parseInt(readLine(stdin))
    if peynirkontrol > peynir:
        echo "Stokta yeterli peynir yok"
    else:
        peynir = peynir - peynirkontrol
    echo "Ürünlerin Güncel Stok Durumu", char(13), char(13), "Süt :: ", süt, char(13), "Yumurta :: ", yumurta, char(13), "Peynir :: ", peynir
