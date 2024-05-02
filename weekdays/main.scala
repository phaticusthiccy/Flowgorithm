object MyProgram {
    def main(args: Array[String]) {
        var sync : Boolean = false
        
        sync = true
        var index, index2 : Int = 0
        
        index = 0
        index2 = 0
        var günler = new Array[String](7)
        
        günler(0) = "Pazartesi"
        günler(1) = "Salı"
        günler(2) = "Çarşamba"
        günler(3) = "Perşembe"
        günler(4) = "Cuma"
        günler(5) = "Cumartesi"
        günler(6) = "Pazar"
        while (sync) {
            if (index == 7) {
            } else {
                index = (index + 1).toInt
                println("Haftanın " + index.toString + ". Günü: " + günler(index2))
                delay(1)
                
                // Çıktı 1 saniye süreyle atılır.
                index2 = (index2 + 1).toInt
            }
        }
    }
    
    def delay(sn : Int)  = {
        var sonuc : Boolean = false
        var ms : Int = 0
        
        ms = (sn * 33333).toInt
        var n : Int = 0
        
        n = 0
        while (n != ms) {
            n = (n + 1).toInt
        }
        sonuc = true
        
        sonuc
    }
}
