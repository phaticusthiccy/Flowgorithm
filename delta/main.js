function main() {
    var fsayı = createArray(7);
    
    // Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
    // // var fsayı = new Array()
    var islem;
    
    window.alert("'a' Sayısının Değerini Girin: ");
    fsayı[0] = window.prompt('Enter a value for fsayı[0]');
    window.alert("'b' Sayısının Değerini Girin: ");
    fsayı[1] = window.prompt('Enter a value for fsayı[1]');
    window.alert("'c' Sayısının Değerini Girin: ");
    fsayı[2] = window.prompt('Enter a value for fsayı[2]');
    fsayı[3] = formül(fsayı[0], fsayı[1], fsayı[2]);
    
    // Delta Formülü
    // // formül(a = reel, b = ree, c = ree)
    window.alert("Program İşleyişini Görmek İster misiniz? (Y yada N): ");
    islem = window.prompt('Enter a value for islem');
    if (islem == "y" || islem == "Y") {
        
        // "Görünür İşlemler"
        if (fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass") {
            
            // 2 kök içeren sonuçlar buraya yazılır.
            // Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
            // Sonuç için Gerekli Formül
            // 
            // // fonksiyon(delta = reel, a = reel, b = reel)
            // // return str
            window.alert("Kök 1: " + (-fsayı[1] + Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
            window.alert("Kök 2: " + (-fsayı[1] - Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
            
            // Kök formülleri yazıldı.
            window.alert("Formüller: " + String.fromCharCode(13) + String.fromCharCode(13) + "Delta Hesabı" + String.fromCharCode(13) + "Delta = " + String(fsayı[1]) + "^2-4*" + String(fsayı[0]) + "*" + String(fsayı[2]) + String.fromCharCode(13) + String.fromCharCode(13) + "====================" + String.fromCharCode(13) + String.fromCharCode(13) + "X1 İçin:" + String.fromCharCode(13) + "(-" + String(fsayı[1]) + "+(" + String(fsayı[3]) + "^(1/2))) / (2*" + String(fsayı[0]) + ")" + String.fromCharCode(13) + String.fromCharCode(13) + "X2 İçin:" + String.fromCharCode(13) + "(-" + String(fsayı[1]) + "-(" + String(fsayı[3]) + "^(1/2))) / (2*" + String(fsayı[0]) + ")");
        } else {
            var text;
            
            text = fonksiyon(fsayı[3], fsayı[0], fsayı[1]);
            
            // İkincil bir fonksiyon ata.
            // İlk işlem sonuç verirse buraya dön.
            if (text == "Kök Bulunamadı") {
                window.alert(text + String.fromCharCode(13) + String.fromCharCode(13) + "Delta 0'a eşittir. Bu yüzden kök yoktur.");
            } else {
                window.alert(text + String.fromCharCode(13) + String.fromCharCode(13) + "Formül = -" + String(fsayı[1]) + "/ 2*" + String(fsayı[0]));
            }
        }
    } else {
        
        // "Kapalı İşlemler"
        if (fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass") {
            window.alert("Kök 1: " + (-fsayı[1] + Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
            window.alert("Kök 2: " + (-fsayı[1] - Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
        } else {
            window.alert(fonksiyon(fsayı[3], fsayı[0], fsayı[1]));
        }
    }
    
    // Programı Kapat. (return True)
}

function fonksiyon(deger, a, b) {
    var sonuc;
    
    if (deger < 0) {
        sonuc = "Kök Bulunamadı";
    } else {
        if (deger == 0) {
            sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " + String((-b / 2 * a));
        } else {
            sonuc = "pass";
        }
    }
    
    return sonuc;
}

function formül(a, b, c) {
    var sonuc;
    
    sonuc = b * b - 4 * a * c;
    
    return sonuc;
}
