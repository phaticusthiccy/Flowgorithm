$süt = 10
$peynir = 10
$yumurta = 10
Write-Host $('Ürünlerin Stok Durumu' + [char] 13 + [char] 13 + 'Süt :: ' + $süt + [char] 13 + 'Yumurta :: ' + $yumurta + [char] 13 + 'Peynir :: ' + $peynir)
While (1) {
    Write-Host $('Alacaginiz urunun miktarini giriniz' + [char] 13 + 'Süt ::')
    [int] $sütkontrol = Read-Host
    If ($sütkontrol -gt $süt) {
        Write-Host 'Stokta yeterli sut yok'
    } Else {
        $süt = $süt - $sütkontrol
    }
    Write-Host $('Alacaginiz urunun miktarini giriniz' + [char] 13 + 'Yumurta ::')
    [int] $yumurtakontrol = Read-Host
    If ($yumurtakontrol -gt $yumurta) {
        Write-Host 'Stokta yeterli yumurta yok'
    } Else {
        $yumurta = $yumurta - $yumurtakontrol
    }
    Write-Host $('Alacaginiz urunun miktarini giriniz' + [char] 13 + 'Peynir ::')
    [int] $peynirkontrol = Read-Host
    If ($peynirkontrol -gt $peynir) {
        Write-Host 'Stokta yeterli peynir yok'
    } Else {
        $peynir = $peynir - $peynirkontrol
    }
    Write-Host $('Ürünlerin Güncel Stok Durumu' + [char] 13 + [char] 13 + 'Süt :: ' + $süt + [char] 13 + 'Yumurta :: ' + $yumurta + [char] 13 + 'Peynir :: ' + $peynir)
}
