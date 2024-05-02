import Foundation

func fonksiyon(deger: Double, a: Double, b: Double) -> String {
    var sonuc : String
    
    if deger < 0 {
        sonuc = "Kök Bulunamadı"
    } else {
        if deger == 0 {
            sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " + String((-b / 2 * a))
        } else {
            sonuc = "pass"
        }
    }
    
    return sonuc
}

func formül(a: Int, b: Int, c: Int) -> Double {
    var sonuc : Double
    
    sonuc = b * b - 4 * a * c
    
    return sonuc
}

// Main
var fsayı = [Double](repeating: 0.0, count: 7)

// Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
// // var fsayı = new Array()
var islem : String

print("'a' Sayısının Değerini Girin: ")
fsayı[0] = Double(readLine()!)!
print("'b' Sayısının Değerini Girin: ")
fsayı[1] = Double(readLine()!)!
print("'c' Sayısının Değerini Girin: ")
fsayı[2] = Double(readLine()!)!
fsayı[3] = formül(a: Int(fsayı[0]), b: Int(fsayı[1]), c: Int(fsayı[2]))

// Delta Formülü
// // formül(a = reel, b = ree, c = ree)
print("Program İşleyişini Görmek İster misiniz? (Y yada N): ")
islem = readLine()!
if islem == "y" || islem == "Y" {
    
    // "Görünür İşlemler"
    if fonksiyon(deger: fsayı[3], a: fsayı[0], b: fsayı[1]) == "pass" {
        
        // 2 kök içeren sonuçlar buraya yazılır.
        // Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
        // Sonuç için Gerekli Formül
        // 
        // // fonksiyon(delta = reel, a = reel, b = reel)
        // // return str
        print("Kök 1: " + String((-fsayı[1] + sqrt(fsayı[3])) / (2 * fsayı[0])))
        print("Kök 2: " + String((-fsayı[1] - sqrt(fsayı[3])) / (2 * fsayı[0])))
        
        // Kök formülleri yazıldı.
        print("Formüller: " + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Delta Hesabı" + String(UnicodeScalar(13)) + "Delta = " + String(fsayı[1]) + "^2-4*" + String(fsayı[0]) + "*" + String(fsayı[2]) + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "====================" + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "X1 İçin:" + String(UnicodeScalar(13)) + "(-" + String(fsayı[1]) + "+(" + String(fsayı[3]) + "^(1/2))) / (2*" + String(fsayı[0]) + ")" + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "X2 İçin:" + String(UnicodeScalar(13)) + "(-" + String(fsayı[1]) + "-(" + String(fsayı[3]) + "^(1/2))) / (2*" + String(fsayı[0]) + ")")
    } else {
        var text : String
        
        text = fonksiyon(deger: fsayı[3], a: fsayı[0], b: fsayı[1])
        
        // İkincil bir fonksiyon ata.
        // İlk işlem sonuç verirse buraya dön.
        if text == "Kök Bulunamadı" {
            print(text + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Delta 0'a eşittir. Bu yüzden kök yoktur.")
        } else {
            print(text + String(UnicodeScalar(13)) + String(UnicodeScalar(13)) + "Formül = -" + String(fsayı[1]) + "/ 2*" + String(fsayı[0]))
        }
    }
} else {
    
    // "Kapalı İşlemler"
    if fonksiyon(deger: fsayı[3], a: fsayı[0], b: fsayı[1]) == "pass" {
        print("Kök 1: " + String((-fsayı[1] + sqrt(fsayı[3])) / (2 * fsayı[0])))
        print("Kök 2: " + String((-fsayı[1] - sqrt(fsayı[3])) / (2 * fsayı[0])))
    } else {
        print(fonksiyon(deger: fsayı[3], a: fsayı[0], b: fsayı[1]))
    }
}

// Programı Kapat. (return True)
