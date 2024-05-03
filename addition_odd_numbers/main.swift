import Foundation

func delay(sn: Int) -> Boolean {
    var sonuc : Boolean
    var ms : Int
    
    ms = sn * 30000
    var n : Int
    
    n = 0
    while n != ms {
        n = n + 1
    }
    sonuc = true
    
    return sonuc
}

// Main
var sayı : Int, sonuc : Int, giris : Int, giris2 : Int, tempsonuc : Int
var debug : String

sayı = 1
sonuc = 0
print("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ")
giris = Int(readLine()!)!
delay(sn: 1)
print("2. Sayıyı Belirleyin: ")
giris2 = Int(readLine()!)!
delay(sn: 1)
print("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın.")
debug = readLine()!
if giris > giris2 {
    var af1 : Int
    var af2 : Int
    
    af1 = giris
    af2 = giris2
    giris = af2
    giris2 = af1
} else {
    
    // İlk giriş, 2. girişten küçük ise program çalışmaz.
    // 
    // Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
}
for sayı in giris ... giris2 {
    if sayı % 2 == 1 {
        tempsonuc = sonuc
        sonuc = sonuc + sayı
        if debug == "n" || debug == "N" {
            
            // es geç
        } else {
            print(String(tempsonuc) + "+" + String(sayı) + ": " + String(sonuc))
        }
    }
}
print("Sonuc: " + String(sonuc))
