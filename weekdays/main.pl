#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig;

sub delay {
    my ($sn) = @_;
    
    my $sonuc;
    my $ms;
    
    $ms = $sn * 33333;
    my $n;
    
    $n = 0;
    while ($n != $ms) {
        $n = $n + 1;
    }
    $sonuc = 1;
    
    return $sonuc;
}

# Main
my $sync;

$sync = 1;
my $index, $index2;

$index = 0;
$index2 = 0;
my @günler = (0..7 - 1);

$günler[0] = 'Pazartesi';
$günler[1] = 'Salı';
$günler[2] = 'Çarşamba';
$günler[3] = 'Perşembe';
$günler[4] = 'Cuma';
$günler[5] = 'Cumartesi';
$günler[6] = 'Pazar';
while ($sync) {
    if ($index == 7) {
    } else {
        $index = $index + 1;
        print 'Haftanın ' . $index . '. Günü: ' . $günler[$index2], "\n";
        delay(1);
        
        # Çıktı 1 saniye süreyle atılır.
        $index2 = $index2 + 1;
    }
}
