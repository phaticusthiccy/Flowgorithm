object MyProgram {
    def main(args: Array[String]) {
        var kilo : Int = 0
        var boy : Double = 0
        
        println("Lütfen Kilonuzu Giriniz:   (Ex: 69)  ")
        kilo = readInt
        delay(1)
        println("Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ")
        boy = readDouble
        var tab : String = ""
        var cümle : String = ""
        
        cümle = "VKI Tablosunda "
        if (vki(kilo, boy.toInt) == "zayıf") {
            tab = cümle + "'Zayıf' Bölümündesin"
        } else {
            if (vki(kilo, boy.toInt) == "normal") {
                tab = cümle + "'Normal' Bölümdesin"
            } else {
                if (vki(kilo, boy.toInt) == "kilolu") {
                    tab = cümle + "'Fazla Kilolu' Bölümdesin"
                } else {
                    if (vki(kilo, boy.toInt) == "1. obez") {
                        tab = cümle + "'1. Obez' Bölümündesin"
                    } else {
                        if (vki(kilo, boy.toInt) == "2. obez") {
                            tab = cümle + "'2. Obez' Bölümündesin"
                        } else {
                            if (vki(kilo, boy.toInt) == "3. obez") {
                                tab = cümle + "'3. Obez' Bölümündesin"
                            }
                        }
                    }
                }
            }
        }
        println(tab)
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
    
    def vki(kilo : Int, boy : Int)  = {
        var sonuc : String = ""
        var index : Int = 0
        
        index = (kilo / (boy * boy)).toInt
        if (index < 18) {
            sonuc = "zayıf"
        } else {
            if (index < 25) {
                sonuc = "normal"
            } else {
                if (index < 30) {
                    sonuc = "kilolu"
                } else {
                    if (index < 35) {
                        sonuc = "1. obez"
                    } else {
                        if (index < 40) {
                            sonuc = "2. obez"
                        } else {
                            sonuc = "3. obez"
                        }
                    }
                }
            }
        }
        
        sonuc
    }
}
