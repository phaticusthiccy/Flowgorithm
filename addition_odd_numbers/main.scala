object MyProgram {
    def main(args: Array[String]) {
        var sayı, sonuc, giris, giris2, tempsonuc : Int = 0
        var debug : String = ""
        
        sayı = 1
        sonuc = 0
        println("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ")
        giris = readInt
        delay(1)
        println("2. Sayıyı Belirleyin: ")
        giris2 = readInt
        delay(1)
        println("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın.")
        debug = readLine
        if (giris > giris2) {
            var af1 : Int = 0
            var af2 : Int = 0
            
            af1 = giris
            af2 = giris2
            giris = af2
            giris2 = af1
        } else {
            
            // İlk giriş, 2. girişten küçük ise program çalışmaz.
            // 
            // Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
        }
        for (sayı <- giris to giris2) {
            if (sayı % 2 == 1) {
                tempsonuc = sonuc
                sonuc = (sonuc + sayı).toInt
                if (debug == "n" || debug == "N") {
                    
                    // es geç
                } else {
                    println(tempsonuc.toString + "+" + sayı.toString + ": " + sonuc.toString)
                }
            }
        }
        println("Sonuc: " + sonuc)
    }
    
    def delay(sn : Int)  = {
        var sonuc : Boolean = false
        var ms : Int = 0
        
        ms = (sn * 30000).toInt
        var n : Int = 0
        
        n = 0
        while (n != ms) {
            n = (n + 1).toInt
        }
        sonuc = true
        
        sonuc
    }
}
