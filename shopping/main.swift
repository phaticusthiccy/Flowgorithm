import Foundation

var süt : Int
var sütkontrol : Int
var yumurta : Int
var yumurtakontrol : Int
var peynir : Int
var peynirkontrol : Int

süt = 10
peynir = 10
yumurta = 10
print("Ürünlerin Stok Durumu" + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Süt :: " + String(süt) + String(UnicodeScalar(13)) + "Yumurta :: " + String(yumurta) + String(UnicodeScalar(13)) + "Peynir :: " + String(peynir))
while true {
    print("Alacaginiz urunun miktarini giriniz" + String(UnicodeScalar(13)) + "Süt ::")
    sütkontrol = Int(readLine()!)!
    if sütkontrol > süt {
        print("Stokta yeterli sut yok")
    } else {
        süt = süt - sütkontrol
    }
    print("Alacaginiz urunun miktarini giriniz" + String(UnicodeScalar(13)) + "Yumurta ::")
    yumurtakontrol = Int(readLine()!)!
    if yumurtakontrol > yumurta {
        print("Stokta yeterli yumurta yok")
    } else {
        yumurta = yumurta - yumurtakontrol
    }
    print("Alacaginiz urunun miktarini giriniz" + String(UnicodeScalar(13)) + "Peynir ::")
    peynirkontrol = Int(readLine()!)!
    if peynirkontrol > peynir {
        print("Stokta yeterli peynir yok")
    } else {
        peynir = peynir - peynirkontrol
    }
    print("Ürünlerin Güncel Stok Durumu" + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Süt :: " + String(süt) + String(UnicodeScalar(13)) + "Yumurta :: " + String(yumurta) + String(UnicodeScalar(13)) + "Peynir :: " + String(peynir))
}
