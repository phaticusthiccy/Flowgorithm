function main() {
    var fsayı: number[] = new Array(7);
    
    // Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
    // // var fsayı = new Array()
    var islem: string;
    
    output("'a' Sayısının Değerini Girin: ");
    fsayı[0] = input();
    output("'b' Sayısının Değerini Girin: ");
    fsayı[1] = input();
    output("'c' Sayısının Değerini Girin: ");
    fsayı[2] = input();
    fsayı[3] = formül(fsayı[0], fsayı[1], fsayı[2]);
    
    // Delta Formülü
    // // formül(a = reel, b = ree, c = ree)
    output("Program İşleyişini Görmek İster misiniz? (Y yada N): ");
    islem = input();
    if (islem == "y" || islem == "Y") {
        
        // "Görünür İşlemler"
        if (fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass") {
            
            // 2 kök içeren sonuçlar buraya yazılır.
            // Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
            // Sonuç için Gerekli Formül
            // 
            // // fonksiyon(delta = reel, a = reel, b = reel)
            // // return str
            output("Kök 1: " + (-fsayı[1] + Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
            output("Kök 2: " + (-fsayı[1] - Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
            
            // Kök formülleri yazıldı.
            output("Formüller: " + String.fromCharCode(13) + String.fromCharCode(13) + "Delta Hesabı" + String.fromCharCode(13) + "Delta = " + String(fsayı[1]) + "^2-4*" + String(fsayı[0]) + "*" + String(fsayı[2]) + String.fromCharCode(13) + String.fromCharCode(13) + "====================" + String.fromCharCode(13) + String.fromCharCode(13) + "X1 İçin:" + String.fromCharCode(13) + "(-" + String(fsayı[1]) + "+(" + String(fsayı[3]) + "^(1/2))) / (2*" + String(fsayı[0]) + ")" + String.fromCharCode(13) + String.fromCharCode(13) + "X2 İçin:" + String.fromCharCode(13) + "(-" + String(fsayı[1]) + "-(" + String(fsayı[3]) + "^(1/2))) / (2*" + String(fsayı[0]) + ")");
        } else {
            var text: string;
            
            text = fonksiyon(fsayı[3], fsayı[0], fsayı[1]);
            
            // İkincil bir fonksiyon ata.
            // İlk işlem sonuç verirse buraya dön.
            if (text == "Kök Bulunamadı") {
                output(text + String.fromCharCode(13) + String.fromCharCode(13) + "Delta 0'a eşittir. Bu yüzden kök yoktur.");
            } else {
                output(text + String.fromCharCode(13) + String.fromCharCode(13) + "Formül = -" + String(fsayı[1]) + "/ 2*" + String(fsayı[0]));
            }
        }
    } else {
        
        // "Kapalı İşlemler"
        if (fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass") {
            output("Kök 1: " + (-fsayı[1] + Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
            output("Kök 2: " + (-fsayı[1] - Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
        } else {
            output(fonksiyon(fsayı[3], fsayı[0], fsayı[1]));
        }
    }
    
    // Programı Kapat. (return True)
}

function fonksiyon(deger: number, a: number, b: number): string {
    var sonuc: string;
    
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

function formül(a: number, b: number, c: number): number {
    var sonuc: number;
    
    sonuc = b * b - 4 * a * c;
    
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
