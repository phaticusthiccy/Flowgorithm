function main() {
    var sayı: number, sonuc: number, giris: number, giris2: number, tempsonuc: number;
    var debug: string;
    
    sayı = 1;
    sonuc = 0;
    output("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ");
    giris = input();
    delay(1);
    output("2. Sayıyı Belirleyin: ");
    giris2 = input();
    delay(1);
    output("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın.");
    debug = input();
    if (giris > giris2) {
        var af1: number;
        var af2: number;
        
        af1 = giris;
        af2 = giris2;
        giris = af2;
        giris2 = af1;
    } else {
        
        // İlk giriş, 2. girişten küçük ise program çalışmaz.
        // 
        // Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
    }
    for (sayı = giris; sayı <= giris2; sayı++) {
        if (sayı % 2 == 1) {
            tempsonuc = sonuc;
            sonuc = sonuc + sayı;
            if (debug == "n" || debug == "N") {
                
                // es geç
            } else {
                output(String(tempsonuc) + "+" + String(sayı) + ": " + String(sonuc));
            }
        }
    }
    output("Sonuc: " + sonuc);
}

function delay(sn: number): boolean {
    var sonuc: boolean;
    var ms: number;
    
    ms = sn * 30000;
    var n: number;
    
    n = 0;
    while (n != ms) {
        n = n + 1;
    }
    sonuc = true;
    
    return sonuc;
}

// The following function is used to input. You can change it to use another webpage element.
function input (name) {
    return window.prompt("Please enter a value for " + name, "");
}

// The following function is called to output. You can change it to use another webpage element.
function output (text) {
    return window.alert(text);
}
