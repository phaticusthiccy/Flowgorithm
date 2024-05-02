#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig;

sub fonksiyon {
    my ($deger, $a, $b) = @_;
    
    my $sonuc;
    
    if ($deger < 0) {
        $sonuc = 'Kök Bulunamadı';
    } else {
        if ($deger == 0) {
            $sonuc = '1. ve 2. Kökler Eşittir. Sonuç: ' . -$b / 2 * $a;
        } else {
            $sonuc = 'pass';
        }
    }
    
    return $sonuc;
}

sub formül {
    my ($a, $b, $c) = @_;
    
    my $sonuc;
    
    $sonuc = $b * $b - 4 * $a * $c;
    
    return $sonuc;
}

# Main
my @fsayı = (0..7 - 1);

# Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
# // var fsayı = new Array()
my $islem;

print '\'a\' Sayısının Değerini Girin: ', "\n";
$fsayı[0] = <>;
chomp($fsayı[0]);
print '\'b\' Sayısının Değerini Girin: ', "\n";
$fsayı[1] = <>;
chomp($fsayı[1]);
print '\'c\' Sayısının Değerini Girin: ', "\n";
$fsayı[2] = <>;
chomp($fsayı[2]);
$fsayı[3] = formül($fsayı[0], $fsayı[1], $fsayı[2]);

# Delta Formülü
# // formül(a = reel, b = ree, c = ree)
print 'Program İşleyişini Görmek İster misiniz? (Y yada N): ', "\n";
$islem = <>;
chomp($islem);
if ($islem eq 'y' || $islem eq 'Y') {
    
    # "Görünür İşlemler"
    if (fonksiyon($fsayı[3], $fsayı[0], $fsayı[1]) eq 'pass') {
        
        # 2 kök içeren sonuçlar buraya yazılır.
        # Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
        # Sonuç için Gerekli Formül
        # 
        # // fonksiyon(delta = reel, a = reel, b = reel)
        # // return str
        print 'Kök 1: ' . (-$fsayı[1] + sqrt($fsayı[3])) / (2 * $fsayı[0]), "\n";
        print 'Kök 2: ' . (-$fsayı[1] - sqrt($fsayı[3])) / (2 * $fsayı[0]), "\n";
        
        # Kök formülleri yazıldı.
        print 'Formüller: ' . chr(13) . chr(13) . 'Delta Hesabı' . chr(13) . 'Delta = ' . $fsayı[1] . '^2-4*' . $fsayı[0] . '*' . $fsayı[2] . chr(13) . chr(13) . '====================' . chr(13) . chr(13) . 'X1 İçin:' . chr(13) . '(-' . $fsayı[1] . '+(' . $fsayı[3] . '^(1/2))) / (2*' . $fsayı[0] . ')' . chr(13) . chr(13) . 'X2 İçin:' . chr(13) . '(-' . $fsayı[1] . '-(' . $fsayı[3] . '^(1/2))) / (2*' . $fsayı[0] . ')', "\n";
    } else {
        my $text;
        
        $text = fonksiyon($fsayı[3], $fsayı[0], $fsayı[1]);
        
        # İkincil bir fonksiyon ata.
        # İlk işlem sonuç verirse buraya dön.
        if ($text eq 'Kök Bulunamadı') {
            print $text . chr(13) . chr(13) . 'Delta 0\'a eşittir. Bu yüzden kök yoktur.', "\n";
        } else {
            print $text . chr(13) . chr(13) . 'Formül = -' . $fsayı[1] . '/ 2*' . $fsayı[0], "\n";
        }
    }
} else {
    
    # "Kapalı İşlemler"
    if (fonksiyon($fsayı[3], $fsayı[0], $fsayı[1]) eq 'pass') {
        print 'Kök 1: ' . (-$fsayı[1] + sqrt($fsayı[3])) / (2 * $fsayı[0]), "\n";
        print 'Kök 2: ' . (-$fsayı[1] - sqrt($fsayı[3])) / (2 * $fsayı[0]), "\n";
    } else {
        print fonksiyon($fsayı[3], $fsayı[0], $fsayı[1]), "\n";
    }
}

# Programı Kapat. (return True)
