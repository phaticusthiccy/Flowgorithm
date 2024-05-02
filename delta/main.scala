object MyProgram {
    def main(args: Array[String]) {
        var fsayı = new Array[Double](7)
        
        // Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
        // // var fsayı = new Array()
        var islem : String = ""
        
        println("'a' Sayısının Değerini Girin: ")
        fsayı(0) = readDouble
        println("'b' Sayısının Değerini Girin: ")
        fsayı(1) = readDouble
        println("'c' Sayısının Değerini Girin: ")
        fsayı(2) = readDouble
        fsayı(3) = formül(fsayı(0).toInt, fsayı(1).toInt, fsayı(2).toInt)
        
        // Delta Formülü
        // // formül(a = reel, b = ree, c = ree)
        println("Program İşleyişini Görmek İster misiniz? (Y yada N): ")
        islem = readLine
        if (islem == "y" || islem == "Y") {
            
            // "Görünür İşlemler"
            if (fonksiyon(fsayı(3), fsayı(0), fsayı(1)) == "pass") {
                
                // 2 kök içeren sonuçlar buraya yazılır.
                // Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
                // Sonuç için Gerekli Formül
                // 
                // // fonksiyon(delta = reel, a = reel, b = reel)
                // // return str
                println("Kök 1: " + (-fsayı(1) + Math.sqrt(fsayı(3))) / (2 * fsayı(0)))
                println("Kök 2: " + (-fsayı(1) - Math.sqrt(fsayı(3))) / (2 * fsayı(0)))
                
                // Kök formülleri yazıldı.
                println("Formüller: " + 13.toChar + 13.toChar + "Delta Hesabı" + 13.toChar + "Delta = " + fsayı(1).toString + "^2-4*" + fsayı(0).toString + "*" + fsayı(2).toString + 13.toChar + 13.toChar + "====================" + 13.toChar + 13.toChar + "X1 İçin:" + 13.toChar + "(-" + fsayı(1).toString + "+(" + fsayı(3).toString + "^(1/2))) / (2*" + fsayı(0).toString + ")" + 13.toChar + 13.toChar + "X2 İçin:" + 13.toChar + "(-" + fsayı(1).toString + "-(" + fsayı(3).toString + "^(1/2))) / (2*" + fsayı(0).toString + ")")
            } else {
                var text : String = ""
                
                text = fonksiyon(fsayı(3), fsayı(0), fsayı(1))
                
                // İkincil bir fonksiyon ata.
                // İlk işlem sonuç verirse buraya dön.
                if (text == "Kök Bulunamadı") {
                    println(text + 13.toChar + 13.toChar + "Delta 0'a eşittir. Bu yüzden kök yoktur.")
                } else {
                    println(text + 13.toChar + 13.toChar + "Formül = -" + fsayı(1).toString + "/ 2*" + fsayı(0).toString)
                }
            }
        } else {
            
            // "Kapalı İşlemler"
            if (fonksiyon(fsayı(3), fsayı(0), fsayı(1)) == "pass") {
                println("Kök 1: " + (-fsayı(1) + Math.sqrt(fsayı(3))) / (2 * fsayı(0)))
                println("Kök 2: " + (-fsayı(1) - Math.sqrt(fsayı(3))) / (2 * fsayı(0)))
            } else {
                println(fonksiyon(fsayı(3), fsayı(0), fsayı(1)))
            }
        }
        
        // Programı Kapat. (return True)
    }
    
    def fonksiyon(deger : Double, a : Double, b : Double)  = {
        var sonuc : String = ""
        
        if (deger < 0) {
            sonuc = "Kök Bulunamadı"
        } else {
            if (deger == 0) {
                sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " + (-b / 2 * a).toString
            } else {
                sonuc = "pass"
            }
        }
        
        sonuc
    }
    
    def formül(a : Int, b : Int, c : Int)  = {
        var sonuc : Double = 0
        
        sonuc = b * b - 4 * a * c
        
        sonuc
    }
}
