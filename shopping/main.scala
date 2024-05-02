object MyProgram {
    def main(args: Array[String]) {
        var süt : Int = 0
        var sütkontrol : Int = 0
        var yumurta : Int = 0
        var yumurtakontrol : Int = 0
        var peynir : Int = 0
        var peynirkontrol : Int = 0
        
        süt = 10
        peynir = 10
        yumurta = 10
        println("Ürünlerin Stok Durumu" + 13.toChar + 13.toChar + "Süt :: " + süt + 13.toChar + "Yumurta :: " + yumurta + 13.toChar + "Peynir :: " + peynir)
        while (true) {
            println("Alacaginiz urunun miktarini giriniz" + 13.toChar + "Süt ::")
            sütkontrol = readInt
            if (sütkontrol > süt) {
                println("Stokta yeterli sut yok")
            } else {
                süt = (süt - sütkontrol).toInt
            }
            println("Alacaginiz urunun miktarini giriniz" + 13.toChar + "Yumurta ::")
            yumurtakontrol = readInt
            if (yumurtakontrol > yumurta) {
                println("Stokta yeterli yumurta yok")
            } else {
                yumurta = (yumurta - yumurtakontrol).toInt
            }
            println("Alacaginiz urunun miktarini giriniz" + 13.toChar + "Peynir ::")
            peynirkontrol = readInt
            if (peynirkontrol > peynir) {
                println("Stokta yeterli peynir yok")
            } else {
                peynir = (peynir - peynirkontrol).toInt
            }
            println("Ürünlerin Güncel Stok Durumu" + 13.toChar + 13.toChar + "Süt :: " + süt + 13.toChar + "Yumurta :: " + yumurta + 13.toChar + "Peynir :: " + peynir)
        }
    }
}
