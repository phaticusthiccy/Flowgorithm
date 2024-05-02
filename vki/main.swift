import Foundation

func delay(sn: Int) -> Boolean {
    var sonuc : Boolean
    var ms : Int
    
    ms = sn * 33333
    var n : Int
    
    n = 0
    while n != ms {
        n = n + 1
    }
    sonuc = true
    
    return sonuc
}

func vki(kilo: Int, boy: Int) -> String {
    var sonuc : String
    var index : Int
    
    index = Double(kilo) / (boy * boy)
    if index < 18 {
        sonuc = "zayıf"
    } else {
        if index < 25 {
            sonuc = "normal"
        } else {
            if index < 30 {
                sonuc = "kilolu"
            } else {
                if index < 35 {
                    sonuc = "1. obez"
                } else {
                    if index < 40 {
                        sonuc = "2. obez"
                    } else {
                        sonuc = "3. obez"
                    }
                }
            }
        }
    }
    
    return sonuc
}

// Main
var kilo : Int
var boy : Double

print("Lütfen Kilonuzu Giriniz:   (Ex: 69)  ")
kilo = Int(readLine()!)!
delay(sn: 1)
print("Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ")
boy = Double(readLine()!)!
var tab : String
var cümle : String

cümle = "VKI Tablosunda "
if vki(kilo: kilo, boy: Int(boy)) == "zayıf" {
    tab = cümle + "'Zayıf' Bölümündesin"
} else {
    if vki(kilo: kilo, boy: Int(boy)) == "normal" {
        tab = cümle + "'Normal' Bölümdesin"
    } else {
        if vki(kilo: kilo, boy: Int(boy)) == "kilolu" {
            tab = cümle + "'Fazla Kilolu' Bölümdesin"
        } else {
            if vki(kilo: kilo, boy: Int(boy)) == "1. obez" {
                tab = cümle + "'1. Obez' Bölümündesin"
            } else {
                if vki(kilo: kilo, boy: Int(boy)) == "2. obez" {
                    tab = cümle + "'2. Obez' Bölümündesin"
                } else {
                    if vki(kilo: kilo, boy: Int(boy)) == "3. obez" {
                        tab = cümle + "'3. Obez' Bölümündesin"
                    }
                }
            }
        }
    }
}
print(tab)
