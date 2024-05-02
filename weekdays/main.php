<?php
function delay($sn) {
    $ms = $sn * 33333;
    $n = 0;
    while ($n != $ms) {
        $n = $n + 1;
    }
    $sonuc = True;
    
    return sonuc;
}

# Main
$sync = True;
$index = 0;
$index2 = 0;
günler = array();

$günler[0] = "Pazartesi";
$günler[1] = "Salı";
$günler[2] = "Çarşamba";
$günler[3] = "Perşembe";
$günler[4] = "Cuma";
$günler[5] = "Cumartesi";
$günler[6] = "Pazar";
while ($sync) {
    if ($index == 7) {
    } else {
        $index = $index + 1;
        echo "Haftanın " . (string) $index . ". Günü: " . $günler[$index2] . PHP_EOL;
        delay(1);
        
        # Çıktı 1 saniye süreyle atılır.
        $index2 = $index2 + 1;
    }
}
?>
