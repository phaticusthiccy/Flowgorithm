function main() {
    var sync;
    
    sync = true;
    var index, index2;
    
    index = 0;
    index2 = 0;
    var günler = createArray(7);
    
    günler[0] = "Pazartesi";
    günler[1] = "Salı";
    günler[2] = "Çarşamba";
    günler[3] = "Perşembe";
    günler[4] = "Cuma";
    günler[5] = "Cumartesi";
    günler[6] = "Pazar";
    while (sync) {
        if (index == 7) {
        } else {
            index = index + 1;
            window.alert("Haftanın " + String(index) + ". Günü: " + günler[index2]);
            delay(1);
            
            // Çıktı 1 saniye süreyle atılır.
            index2 = index2 + 1;
        }
    }
}

function delay(sn) {
    var sonuc;
    var ms;
    
    ms = sn * 33333;
    var n;
    
    n = 0;
    while (n != ms) {
        n = n + 1;
    }
    sonuc = true;
    
    return sonuc;
}
