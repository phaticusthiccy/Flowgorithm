#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig;

sub delay {
    my ($sn) = @_;
    
    my $sonuc;
    my $ms;
    
    $ms = $sn * 30000;
    my $n;
    
    $n = 0;
    while ($n != $ms) {
        $n = $n + 1;
    }
    $sonuc = 1;
    
    return $sonuc;
}

# Main
my $sayı, $sonuc, $giris, $giris2, $tempsonuc;
my $debug;

$sayı = 1;
$sonuc = 0;
print '2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ', "\n";
$giris = <>;
chomp($giris);
delay(1);
print '2. Sayıyı Belirleyin: ', "\n";
$giris2 = <>;
chomp($giris2);
delay(1);
print 'Programın İşleyişini Görmek İçin \'Y\', Direk Sonucu Görmek İçin \'N\' yazın.', "\n";
$debug = <>;
chomp($debug);
if ($giris > $giris2) {
    my $af1;
    my $af2;
    
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
        if ($debug eq 'n' || $debug eq 'N') {
            
            # es geç
        } else {
            print $tempsonuc . '+' . $sayı . ': ' . $sonuc, "\n";
        }
    }
}
print 'Sonuc: ' . $sonuc, "\n";
