function delay {
    param ( [int] $sn )
    process {
        $ms = $sn * 30000
        $n = 0
        While ($n -ne $ms) {
            $n = $n + 1
        }
        $sonuc = 1
        return $sonuc
    }
}

# Main

$sayı = 1
$sonuc = 0
Write-Host '2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: '
[int] $giris = Read-Host
delay -sn 1
Write-Host '2. Sayıyı Belirleyin: '
[int] $giris2 = Read-Host
delay -sn 1
Write-Host 'Programın İşleyişini Görmek İçin \'Y\', Direk Sonucu Görmek İçin \'N\' yazın.'
$debug = Read-Host
If ($giris -gt $giris2) {
    $af1 = $giris
    $af2 = $giris2
    $giris = $af2
    $giris2 = $af1
} Else {
    
    # İlk giriş, 2. girişten küçük ise program çalışmaz.
    # 
    # Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
}
For ($sayı = $giris; $sayı -le $giris2; $sayı++) {
    If ($sayı % 2 -eq 1) {
        $tempsonuc = $sonuc
        $sonuc = $sonuc + $sayı
        If ($debug -eq 'n' -or $debug -eq 'N') {
            
            # es geç
        } Else {
            Write-Host $([string] $tempsonuc + '+' + [string] $sayı + ': ' + [string] $sonuc)
        }
    }
}
Write-Host $('Sonuc: ' + $sonuc)
