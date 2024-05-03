<?php
# The following function is called whenever your program needs to input data.
# You can change it to use other sources rather than fgets().
function input() {
    return fgets(STDIN);
}

function delay($sn) {
    $ms = $sn * 30000;
    $n = 0;
    while ($n != $ms) {
        $n = $n + 1;
    }
    $sonuc = True;
    
    return sonuc;
}

# Main
$sayı = 1;
$sonuc = 0;
echo "2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: " . PHP_EOL;
$giris = input();
delay(1);
echo "2. Sayıyı Belirleyin: " . PHP_EOL;
$giris2 = input();
delay(1);
echo "Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın." . PHP_EOL;
$debug = input();
if ($giris > $giris2) {
    $af1 = $giris;
    $af2 = $giris2;
    $giris = $af2;
    $giris2 = $af1;
} else {
    
    # İlk giriş, 2. girişten küçük ise program çalışmaz.
    # 
    # Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
}
for ($sayı = $giris; $sayı <= $giris2; $sayı++) {
    if ($sayı % 2 == 1) {
        $tempsonuc = $sonuc;
        $sonuc = $sonuc + $sayı;
        if ($debug == "n" || $debug == "N") {
            
            # es geç
        } else {
            echo (string) $tempsonuc . "+" . (string) $sayı . ": " . (string) $sonuc . PHP_EOL;
        }
    }
}
echo "Sonuc: " . $sonuc . PHP_EOL;
?>
