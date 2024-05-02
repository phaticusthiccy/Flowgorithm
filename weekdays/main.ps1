function delay {
    param ( [int] $sn )
    process {
        $ms = $sn * 33333
        $n = 0
        While ($n -ne $ms) {
            $n = $n + 1
        }
        $sonuc = 1
        return $sonuc
    }
}

# Main

$sync = 1
$index = 0
$index2 = 0
$günler = @(0 .. (7 - 1))

$günler[0] = 'Pazartesi'
$günler[1] = 'Salı'
$günler[2] = 'Çarşamba'
$günler[3] = 'Perşembe'
$günler[4] = 'Cuma'
$günler[5] = 'Cumartesi'
$günler[6] = 'Pazar'
While ($sync) {
    If ($index -eq 7) {
    } Else {
        $index = $index + 1
        Write-Host $('Haftanın ' + [string] $index + '. Günü: ' + $günler[$index2])
        delay -sn 1
        
        # Çıktı 1 saniye süreyle atılır.
        $index2 = $index2 + 1
    }
}
