süt = 10
peynir = 10
yumurta = 10
print("Ürünlerin Stok Durumu" + chr(13) + chr(13) + "Süt :: " + str(süt) + chr(13) + "Yumurta :: " + str(yumurta) + chr(13) + "Peynir :: " + str(peynir))
while True:
    print("Alacaginiz urunun miktarini giriniz" + chr(13) + "Süt ::")
    sütkontrol = int(input())
    if sütkontrol > süt:
        print("Stokta yeterli sut yok")
    else:
        süt = süt - sütkontrol
    print("Alacaginiz urunun miktarini giriniz" + chr(13) + "Yumurta ::")
    yumurtakontrol = int(input())
    if yumurtakontrol > yumurta:
        print("Stokta yeterli yumurta yok")
    else:
        yumurta = yumurta - yumurtakontrol
    print("Alacaginiz urunun miktarini giriniz" + chr(13) + "Peynir ::")
    peynirkontrol = int(input())
    if peynirkontrol > peynir:
        print("Stokta yeterli peynir yok")
    else:
        peynir = peynir - peynirkontrol
    print("Ürünlerin Güncel Stok Durumu" + chr(13) + chr(13) + "Süt :: " + str(süt) + chr(13) + "Yumurta :: " + str(yumurta) + chr(13) + "Peynir :: " + str(peynir))
