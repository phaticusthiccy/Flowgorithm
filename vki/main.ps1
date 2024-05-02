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

function vki {
    param ( [int] $kilo, [int] $boy )
    process {
        $index = $kilo / ($boy * $boy)
        If ($index -lt 18) {
            $sonuc = 'zayıf'
        } Else {
            If ($index -lt 25) {
                $sonuc = 'normal'
            } Else {
                If ($index -lt 30) {
                    $sonuc = 'kilolu'
                } Else {
                    If ($index -lt 35) {
                        $sonuc = '1. obez'
                    } Else {
                        If ($index -lt 40) {
                            $sonuc = '2. obez'
                        } Else {
                            $sonuc = '3. obez'
                        }
                    }
                }
            }
        }
        return $sonuc
    }
}

# Main

Write-Host 'Lütfen Kilonuzu Giriniz:   (Ex: 69)  '
[int] $kilo = Read-Host
delay -sn 1
Write-Host 'Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  '
[double] $boy = Read-Host
$cümle = 'VKI Tablosunda '
If ((vki -kilo $kilo -boy $boy) -eq 'zayıf') {
    $tab = $cümle + '\'Zayıf\' Bölümündesin'
} Else {
    If ((vki -kilo $kilo -boy $boy) -eq 'normal') {
        $tab = $cümle + '\'Normal\' Bölümdesin'
    } Else {
        If ((vki -kilo $kilo -boy $boy) -eq 'kilolu') {
            $tab = $cümle + '\'Fazla Kilolu\' Bölümdesin'
        } Else {
            If ((vki -kilo $kilo -boy $boy) -eq '1. obez') {
                $tab = $cümle + '\'1. Obez\' Bölümündesin'
            } Else {
                If ((vki -kilo $kilo -boy $boy) -eq '2. obez') {
                    $tab = $cümle + '\'2. Obez\' Bölümündesin'
                } Else {
                    If ((vki -kilo $kilo -boy $boy) -eq '3. obez') {
                        $tab = $cümle + '\'3. Obez\' Bölümündesin'
                    }
                }
            }
        }
    }
}
Write-Host $tab
