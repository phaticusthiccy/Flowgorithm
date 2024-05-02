function fonksiyon {
    param ( [double] $deger, [double] $a, [double] $b )
    process {
        If ($deger -lt 0) {
            $sonuc = 'Kök Bulunamadı'
        } Else {
            If ($deger -eq 0) {
                $sonuc = '1. ve 2. Kökler Eşittir. Sonuç: ' + [string] (-$b / 2 * $a)
            } Else {
                $sonuc = 'pass'
            }
        }
        return $sonuc
    }
}

function formül {
    param ( [int] $a, [int] $b, [int] $c )
    process {
        $sonuc = $b * $b - 4 * $a * $c
        return $sonuc
    }
}

# Main

$fsayı = @(0 .. (7 - 1))

# Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
# // var fsayı = new Array()
Write-Host '\'a\' Sayısının Değerini Girin: '
[double] $fsayı[0] = Read-Host
Write-Host '\'b\' Sayısının Değerini Girin: '
[double] $fsayı[1] = Read-Host
Write-Host '\'c\' Sayısının Değerini Girin: '
[double] $fsayı[2] = Read-Host
$fsayı[3] = formül -a $fsayı[0] -b $fsayı[1] -c $fsayı[2]

# Delta Formülü
# // formül(a = reel, b = ree, c = ree)
Write-Host 'Program İşleyişini Görmek İster misiniz? (Y yada N): '
$islem = Read-Host
If ($islem -eq 'y' -or $islem -eq 'Y') {
    
    # "Görünür İşlemler"
    If ((fonksiyon -deger $fsayı[3] -a $fsayı[0] -b $fsayı[1]) -eq 'pass') {
        
        # 2 kök içeren sonuçlar buraya yazılır.
        # Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
        # Sonuç için Gerekli Formül
        # 
        # // fonksiyon(delta = reel, a = reel, b = reel)
        # // return str
        Write-Host $('Kök 1: ' + (-$fsayı[1] + Math::Sqrt($fsayı[3])) / (2 * $fsayı[0]))
        Write-Host $('Kök 2: ' + (-$fsayı[1] - Math::Sqrt($fsayı[3])) / (2 * $fsayı[0]))
        
        # Kök formülleri yazıldı.
        Write-Host $('Formüller: ' + [char] 13 + [char] 13 + 'Delta Hesabı' + [char] 13 + 'Delta = ' + [string] $fsayı[1] + '^2-4*' + [string] $fsayı[0] + '*' + [string] $fsayı[2] + [char] 13 + [char] 13 + '====================' + [char] 13 + [char] 13 + 'X1 İçin:' + [char] 13 + '(-' + [string] $fsayı[1] + '+(' + [string] $fsayı[3] + '^(1/2))) / (2*' + [string] $fsayı[0] + ')' + [char] 13 + [char] 13 + 'X2 İçin:' + [char] 13 + '(-' + [string] $fsayı[1] + '-(' + [string] $fsayı[3] + '^(1/2))) / (2*' + [string] $fsayı[0] + ')')
    } Else {
        $text = fonksiyon -deger $fsayı[3] -a $fsayı[0] -b $fsayı[1]
        
        # İkincil bir fonksiyon ata.
        # İlk işlem sonuç verirse buraya dön.
        If ($text -eq 'Kök Bulunamadı') {
            Write-Host $($text + [char] 13 + [char] 13 + 'Delta 0\'a eşittir. Bu yüzden kök yoktur.')
        } Else {
            Write-Host $($text + [char] 13 + [char] 13 + 'Formül = -' + [string] $fsayı[1] + '/ 2*' + [string] $fsayı[0])
        }
    }
} Else {
    
    # "Kapalı İşlemler"
    If ((fonksiyon -deger $fsayı[3] -a $fsayı[0] -b $fsayı[1]) -eq 'pass') {
        Write-Host $('Kök 1: ' + (-$fsayı[1] + Math::Sqrt($fsayı[3])) / (2 * $fsayı[0]))
        Write-Host $('Kök 2: ' + (-$fsayı[1] - Math::Sqrt($fsayı[3])) / (2 * $fsayı[0]))
    } Else {
        Write-Host $(fonksiyon -deger $fsayı[3] -a $fsayı[0] -b $fsayı[1])
    }
}

# Programı Kapat. (return True)
