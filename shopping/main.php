<?php
# The following function is called whenever your program needs to input data.
# You can change it to use other sources rather than fgets().
function input() {
    return fgets(STDIN);
}

$süt = 10;
$peynir = 10;
$yumurta = 10;
echo "Ürünlerin Stok Durumu" . chr(13) . chr(13) . "Süt :: " . $süt . chr(13) . "Yumurta :: " . $yumurta . chr(13) . "Peynir :: " . $peynir . PHP_EOL;
while (True) {
    echo "Alacaginiz urunun miktarini giriniz" . chr(13) . "Süt ::" . PHP_EOL;
    $sütkontrol = input();
    if ($sütkontrol > $süt) {
        echo "Stokta yeterli sut yok" . PHP_EOL;
    } else {
        $süt = $süt - $sütkontrol;
    }
    echo "Alacaginiz urunun miktarini giriniz" . chr(13) . "Yumurta ::" . PHP_EOL;
    $yumurtakontrol = input();
    if ($yumurtakontrol > $yumurta) {
        echo "Stokta yeterli yumurta yok" . PHP_EOL;
    } else {
        $yumurta = $yumurta - $yumurtakontrol;
    }
    echo "Alacaginiz urunun miktarini giriniz" . chr(13) . "Peynir ::" . PHP_EOL;
    $peynirkontrol = input();
    if ($peynirkontrol > $peynir) {
        echo "Stokta yeterli peynir yok" . PHP_EOL;
    } else {
        $peynir = $peynir - $peynirkontrol;
    }
    echo "Ürünlerin Güncel Stok Durumu" . chr(13) . chr(13) . "Süt :: " . $süt . chr(13) . "Yumurta :: " . $yumurta . chr(13) . "Peynir :: " . $peynir . PHP_EOL;
}
?>
