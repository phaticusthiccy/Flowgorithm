function main() {
    var sync: boolean;
    
    sync = true;
    var index: number, index2: number;
    
    index = 0;
    index2 = 0;
    var günler: string[] = new Array(7);
    
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
            output("Haftanın " + String(index) + ". Günü: " + günler[index2]);
            delay(1);
            
            // Çıktı 1 saniye süreyle atılır.
            index2 = index2 + 1;
        }
    }
}

function delay(sn: number): boolean {
    var sonuc: boolean;
    var ms: number;
    
    ms = sn * 33333;
    var n: number;
    
    n = 0;
    while (n != ms) {
        n = n + 1;
    }
    sonuc = true;
    
    return sonuc;
}

// The following function is called to output. You can change it to use another webpage element.
function output (text) {
    return window.alert(text);
}
