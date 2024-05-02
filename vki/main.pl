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

sub vki {
    my ($kilo, $boy) = @_;
    
    my $sonuc;
    my $index;
    
    $index = $kilo / ($boy * $boy);
    if ($index < 18) {
        $sonuc = 'zayıf';
    } else {
        if ($index < 25) {
            $sonuc = 'normal';
        } else {
            if ($index < 30) {
                $sonuc = 'kilolu';
            } else {
                if ($index < 35) {
                    $sonuc = '1. obez';
                } else {
                    if ($index < 40) {
                        $sonuc = '2. obez';
                    } else {
                        $sonuc = '3. obez';
                    }
                }
            }
        }
    }
    
    return $sonuc;
}

# Main
my $kilo;
my $boy;

print 'Lütfen Kilonuzu Giriniz:   (Ex: 69)  ', "\n";
$kilo = <>;
chomp($kilo);
delay(1);
print 'Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ', "\n";
$boy = <>;
chomp($boy);
my $tab;
my $cümle;

$cümle = 'VKI Tablosunda ';
if (vki($kilo, $boy) eq 'zayıf') {
    $tab = $cümle . '\'Zayıf\' Bölümündesin';
} else {
    if (vki($kilo, $boy) eq 'normal') {
        $tab = $cümle . '\'Normal\' Bölümdesin';
    } else {
        if (vki($kilo, $boy) eq 'kilolu') {
            $tab = $cümle . '\'Fazla Kilolu\' Bölümdesin';
        } else {
            if (vki($kilo, $boy) eq '1. obez') {
                $tab = $cümle . '\'1. Obez\' Bölümündesin';
            } else {
                if (vki($kilo, $boy) eq '2. obez') {
                    $tab = $cümle . '\'2. Obez\' Bölümündesin';
                } else {
                    if (vki($kilo, $boy) eq '3. obez') {
                        $tab = $cümle . '\'3. Obez\' Bölümündesin';
                    }
                }
            }
        }
    }
}
print $tab, "\n";
