#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig;

# Main
my $süt;
my $sütkontrol;
my $yumurta;
my $yumurtakontrol;
my $peynir;
my $peynirkontrol;

$süt = 10;
$peynir = 10;
$yumurta = 10;
print 'Ürünlerin Stok Durumu' . chr(13) . chr(13) . 'Süt :: ' . $süt . chr(13) . 'Yumurta :: ' . $yumurta . chr(13) . 'Peynir :: ' . $peynir, "\n";
while (1) {
    print 'Alacaginiz urunun miktarini giriniz' . chr(13) . 'Süt ::', "\n";
    $sütkontrol = <>;
    chomp($sütkontrol);
    if ($sütkontrol > $süt) {
        print 'Stokta yeterli sut yok', "\n";
    } else {
        $süt = $süt - $sütkontrol;
    }
    print 'Alacaginiz urunun miktarini giriniz' . chr(13) . 'Yumurta ::', "\n";
    $yumurtakontrol = <>;
    chomp($yumurtakontrol);
    if ($yumurtakontrol > $yumurta) {
        print 'Stokta yeterli yumurta yok', "\n";
    } else {
        $yumurta = $yumurta - $yumurtakontrol;
    }
    print 'Alacaginiz urunun miktarini giriniz' . chr(13) . 'Peynir ::', "\n";
    $peynirkontrol = <>;
    chomp($peynirkontrol);
    if ($peynirkontrol > $peynir) {
        print 'Stokta yeterli peynir yok', "\n";
    } else {
        $peynir = $peynir - $peynirkontrol;
    }
    print 'Ürünlerin Güncel Stok Durumu' . chr(13) . chr(13) . 'Süt :: ' . $süt . chr(13) . 'Yumurta :: ' . $yumurta . chr(13) . 'Peynir :: ' . $peynir, "\n";
}
