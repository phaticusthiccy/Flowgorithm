<?php
# The following function is called whenever your program needs to input data.
# You can change it to use other sources rather than fgets().
function input() {
    return fgets(STDIN);
}

function fonksiyon($deger, $a, $b) {
    if ($deger < 0) {
        $sonuc = "Kök Bulunamadı";
    } else {
        if ($deger == 0) {
            $sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " . (string) (-$b / 2 * $a);
        } else {
            $sonuc = "pass";
        }
    }
    
    return sonuc;
}

function formül($a, $b, $c) {
    $sonuc = $b * $b - 4 * $a * $c;
    
    return sonuc;
}

# Main
fsayı = array();

# Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
# // var fsayı = new Array()
echo "'a' Sayısının Değerini Girin: " . PHP_EOL;
$fsayı[0] = input();
echo "'b' Sayısının Değerini Girin: " . PHP_EOL;
$fsayı[1] = input();
echo "'c' Sayısının Değerini Girin: " . PHP_EOL;
$fsayı[2] = input();
$fsayı[3] = formül($fsayı[0], $fsayı[1], $fsayı[2]);

# Delta Formülü
# // formül(a = reel, b = ree, c = ree)
echo "Program İşleyişini Görmek İster misiniz? (Y yada N): " . PHP_EOL;
$islem = input();
if ($islem == "y" || $islem == "Y") {
    
    # "Görünür İşlemler"
    if (fonksiyon($fsayı[3], $fsayı[0], $fsayı[1]) == "pass") {
        
        # 2 kök içeren sonuçlar buraya yazılır.
        # Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
        # Sonuç için Gerekli Formül
        # 
        # // fonksiyon(delta = reel, a = reel, b = reel)
        # // return str
        echo "Kök 1: " . (-$fsayı[1] + sqrt($fsayı[3])) / (2 * $fsayı[0]) . PHP_EOL;
        echo "Kök 2: " . (-$fsayı[1] - sqrt($fsayı[3])) / (2 * $fsayı[0]) . PHP_EOL;
        
        # Kök formülleri yazıldı.
        echo "Formüller: " . chr(13) . chr(13) . "Delta Hesabı" . chr(13) . "Delta = " . (string) $fsayı[1] . "^2-4*" . (string) $fsayı[0] . "*" . (string) $fsayı[2] . chr(13) . chr(13) . "====================" . chr(13) . chr(13) . "X1 İçin:" . chr(13) . "(-" . (string) $fsayı[1] . "+(" . (string) $fsayı[3] . "^(1/2))) / (2*" . (string) $fsayı[0] . ")" . chr(13) . chr(13) . "X2 İçin:" . chr(13) . "(-" . (string) $fsayı[1] . "-(" . (string) $fsayı[3] . "^(1/2))) / (2*" . (string) $fsayı[0] . ")" . PHP_EOL;
    } else {
        $text = fonksiyon($fsayı[3], $fsayı[0], $fsayı[1]);
        
        # İkincil bir fonksiyon ata.
        # İlk işlem sonuç verirse buraya dön.
        if ($text == "Kök Bulunamadı") {
            echo $text . chr(13) . chr(13) . "Delta 0'a eşittir. Bu yüzden kök yoktur." . PHP_EOL;
        } else {
            echo $text . chr(13) . chr(13) . "Formül = -" . (string) $fsayı[1] . "/ 2*" . (string) $fsayı[0] . PHP_EOL;
        }
    }
} else {
    
    # "Kapalı İşlemler"
    if (fonksiyon($fsayı[3], $fsayı[0], $fsayı[1]) == "pass") {
        echo "Kök 1: " . (-$fsayı[1] + sqrt($fsayı[3])) / (2 * $fsayı[0]) . PHP_EOL;
        echo "Kök 2: " . (-$fsayı[1] - sqrt($fsayı[3])) / (2 * $fsayı[0]) . PHP_EOL;
    } else {
        echo fonksiyon($fsayı[3], $fsayı[0], $fsayı[1]) . PHP_EOL;
    }
}

# Programı Kapat. (return True)
?>
