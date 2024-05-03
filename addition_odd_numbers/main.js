function main() {
    var sayı, sonuc, giris, giris2, tempsonuc;
    var debug;
    
    sayı = 1;
    sonuc = 0;
    window.alert("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ");
    giris = window.prompt('Enter a value for giris');
    delay(1);
    window.alert("2. Sayıyı Belirleyin: ");
    giris2 = window.prompt('Enter a value for giris2');
    delay(1);
    window.alert("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın.");
    debug = window.prompt('Enter a value for debug');
    if (giris > giris2) {
        var af1;
        var af2;
        
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
                window.alert(String(tempsonuc) + "+" + String(sayı) + ": " + String(sonuc));
            }
        }
    }
    window.alert("Sonuc: " + sonuc);
}

function delay(sn) {
    var sonuc;
    var ms;
    
    ms = sn * 30000;
    var n;
    
    n = 0;
    while (n != ms) {
        n = n + 1;
    }
    sonuc = true;
    
    return sonuc;
}
