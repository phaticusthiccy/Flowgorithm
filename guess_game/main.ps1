function delay {
    param ( [double] $sn )
    process {
        # Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
        # setTimeout()
        # time.sleep()
        # gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
        $ms = $sn * 30000
        
        # 1 Saniye ≊ 30.000 Sayım
        # 1 Sayım = 3,14e-5
        $n = 0
        While ($n -lt $ms) {
            $n = $n + 1
        }
        $payload = 1
        return $payload
    }
}

function exit {
    process {
        # Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
        # Bu fonskiyon hiçbir şekilde pas geçilemez.
        # Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
        Do {
        } While (1);
        return $ex
    }
}

function logger {
    param ( [string] $type, [string] $this )
    process {
        # Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
        # 
        # Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
        If ($type -eq 'int') {
            Write-Host $([int] $this)
            $payload = 1
        } Else {
            If ($type -eq 'str') {
                Write-Host $([string] $this)
                $payload = 1
            } Else {
                If ($type -eq 'bool') {
                    $payload = $this
                } Else {
                    
                    # Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                    # Program durdurulur.
                    # process.exit()
                    exit 
                }
            }
        }
        
        # logger("str", "test")  =>  String İçin
        # logger("int", "190")  =>  Sayı İçin
        # logger("bool", true)  => true-false için
        return $payload
    }
}

function namecorrection {
    param ( [string] $name )
    process {
        If ($name.Length -lt 3) {
            logger -type 'str' -this 'İsminiz 3 kelimeden kısa olmamalı.' + [char] 13 + 'Lütfen programı baştan başlatın.'
            exit 
        } Else {
            $payload = 1
        }
        
        # Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
        return $payload
    }
}

function plugins {
    param ( [string] $type, [string] $arg )
    process {
        # Program içindeki çeşitlilik için gerekli fonksiyon.
        # Fonksiyon karmaşası olmaması için kısaltıldı.
        $str = @(0 .. (10 - 1))
        
        If ($type -eq 'ask name') {
            $str[0] = 'Oyuna Hoşgeldin Yabancı!' + [char] 13 + 'Lütfen Adını Gir:'
            $str[1] = 'Hey, Merhaba Yabacı :)' + [char] 13 + 'Lütfen İsmini Yazar mısın?'
            $str[2] = 'Yeni bir oyuncu. Yaşasınn!' + [char] 13 + 'Adını söylermisin lütfen..'
            $str[3] = 'Oyunda Yeni Bir Katılımcı Var!' + [char] 13 + 'Lütfen İsmini Gir:'
            $str[4] = 'İşte yeni bir oyuncu daha!' + [char] 13 + 'Sana nasıl hitap etmemi istersin?'
            $str[5] = 'Seni daha önce buralarda görmedim..' + [char] 13 + 'Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle.'
            $str[6] = 'Oyuna Hoşgeldin!' + [char] 13 + 'Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz.'
            $payload = $str[Get-Random -Maximum 7]
        } Else {
            If ($type -eq 'after name') {
                $str[0] = 'Merhaba ' + $arg + [char] 13 + 'Oyunun kuralları şunlardır:' + [char] 13 + '1) Sistem 0-100 arasında sayı seçer.' + [char] 13 + '2) Sayıyı tahmin etmeye çalışırsın' + [char] 13 + '3) Toplam 10 adet başarısız denemeden sonra oyun biter.' + [char] 13 + '4) Sayı bulunursa oyun kazanılır!'
                $payload = $str[0]
            } Else {
                If ($type -eq 'game mode') {
                    $str[0] = 'Lütfen Oyun Modunu Seç' + [char] 13 + [char] 13 + '1) Kolay (Sıcak-Soğuk Mantığı)' + [char] 13 + '2) Normal (Yönergeler Yok)' + [char] 13 + '3) İşleyiş Hakkında Bilgi Al'
                    $payload = $str[0]
                } Else {
                    If ($type -eq 'wmode') {
                        $str[0] = 'Lütfen Sadece 1 veya 2 Yazın'
                        $str[1] = 'Yanlış Seçim! Sadece 1 veya 2 yazın!'
                        $payload = $str[Get-Random -Maximum 2]
                    } Else {
                        If ($type -eq 'get num') {
                            $str[0] = 'Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! ' + $arg
                            $str[1] = 'Tuttum! Hadi Başlayalım :)'
                            $str[2] = 'Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans ' + $arg + ' :)'
                            $payload = $str[Get-Random -Maximum 3]
                        } Else {
                            If ($type -eq 'think') {
                                $str[0] = 'Tahminin?'
                                $str[1] = 'Sence ne olabilir ' + $arg + '?'
                                $str[2] = 'Bi fikrin varmı?'
                                $str[3] = 'Tahminin için bekliyorum ' + $arg
                                $str[4] = 'İyi düşün ve öyle karar ver..'
                                $str[5] = 'Bencee.. Ay, yardım edemem.. En iyisi tahmin et.'
                                $str[6] = 'Şansını boşa harcama ' + $arg
                                $str[7] = 'Sakın yanlış tahin ediyim deme haa'
                                $str[8] = 'Hadi sıra sende ' + $arg
                                $payload = $str[Get-Random -Maximum 9]
                            } Else {
                                If ($type -eq 'wthink') {
                                    $str[0] = 'Yanlış! Tahminin?'
                                    $str[1] = 'Bu Değil. Sence ne olabilir ' + $arg + '?'
                                    $str[2] = 'Sayı bu değil. Bi fikrin varmı?'
                                    $str[3] = 'Yeniden.. Tahminin için bekliyorum ' + $arg
                                    $str[4] = 'Şimdi iyi düşün ve öyle karar ver..'
                                    $str[5] = 'Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et.'
                                    $str[6] = 'Şansını boşa harcama ' + $arg
                                    $str[7] = 'Ah be abi. Sakın yanlış tahin ediyim deme haa'
                                    $str[8] = 'Tekrardan.. Hadi sıra sende ' + $arg
                                    $payload = $str[Get-Random -Maximum 9]
                                } Else {
                                    If ($type -eq 'sthink') {
                                        $str[0] = 'Hey, hey! Bu son hakkın. Dikkatli Ol!'
                                        $str[1] = 'Dur Biraz! Bu Son Şansın. İyi Kullan ' + $arg
                                        $str[2] = 'Kader Anı! Oyunu kazanman için son şans!'
                                        $str[3] = 'Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin ' + $arg
                                        $str[4] = 'Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı..'
                                        $payload = $str[Get-Random -Maximum 5]
                                    } Else {
                                        If ($type -eq 'win') {
                                            $str[0] = '[+] Kazandın!!!' + [char] 13 + 'İşte Buuu! Nasılda tahmin ettin *o*' + [char] 13 + [char] 13 + 'Bir sonraki oyunda görüşmek üzere..'
                                            $str[1] = '[+] Tebrikler ' + $arg + '.' + [char] 13 + 'Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın.' + [char] 13 + 'Bir sonraki oyununda başarılar.'
                                            $str[2] = '[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)' + [char] 13 + 'Bir oyuna daha var mısın..'
                                            $str[3] = '[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum.' + [char] 13 + 'Sonraki oyunlarda görüşmek dileğiyle..'
                                            $str[4] = '[+] İyi iş çıkardın ' + $arg + [char] 13 + 'Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \\\'_\'/'
                                            $payload = $str[Get-Random -Maximum 5]
                                        } Else {
                                            If ($type -eq 'swin') {
                                                $str[0] = '[⁂] İnanılmaz.. Tek Kelime İle Şahane!'
                                                $str[1] = '[⁂] Ne.. Bu kadar hızlı yenilemem..'
                                                $str[2] = '[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim..'
                                                $str[3] = '[⁂] Sen..? Nasıl..? Hile mi yapıyosun??'
                                                $str[4] = '[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?'
                                                $payload = $str[Get-Random -Maximum 5]
                                            } Else {
                                                If ($type -eq 'lose') {
                                                    $str[0] = '[-] Üzgünüm, Oyunu Kaybettiniz.'
                                                    $str[1] = '[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın..'
                                                    $str[2] = '[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin.'
                                                    $str[3] = '[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın.'
                                                    $str[4] = '[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez..'
                                                    $payload = $str[Get-Random -Maximum 5]
                                                } Else {
                                                    If ($type -eq 'cold') {
                                                        $str[0] = '↘                ↙' + [char] 13 + ' Soğuk' + [char] 13 + '↗                ↖'
                                                        $payload = $str[0]
                                                    } Else {
                                                        If ($type -eq 'warm') {
                                                            $str[0] = '↘                ↙' + [char] 13 + '  Ilık' + [char] 13 + '↗                ↖'
                                                            $payload = $str[0]
                                                        } Else {
                                                            If ($type -eq 'hot') {
                                                                $str[0] = '↘                ↙' + [char] 13 + ' Sıcak' + [char] 13 + '↗                ↖'
                                                                $payload = $str[0]
                                                            } Else {
                                                                If ($type -eq 'info') {
                                                                    $str[0] = 'Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır.'
                                                                    $str[1] = 'Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir.'
                                                                    $str[2] = 'İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır.'
                                                                    $str[3] = 'Ardından oyun hakkında bilgilendirme mesajı gönderilir.'
                                                                    $str[4] = 'Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki \'Ana\' yazan yere basıp \'logger\' seçmelisiniz.'
                                                                    $str[5] = 'Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor.'
                                                                    $str[6] = 'Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir.'
                                                                    $str[7] = 'Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir.'
                                                                    $str[8] = 'Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır.'
                                                                    $str[9] = 'Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur.'
                                                                    $payload = $str[[int] $arg]
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        # prototip => plugins(<str>, <str>)
        # Örnek:
        # plugins("ask name", " ")
        # plugins("after name", "İsim")
        return $payload
    }
}

function rand {
    param ( [boolean] $type )
    process {
        $index = @(0 .. (101 - 1))
        
        # 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
        # 
        # var dizin = ["bir", "iki", "üç"]
        # return dizin[0]     // "bir"
        If (-not $type) {
            $payload = Get-Random -Maximum 101
            
            # Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
            # Değişken kontrolü için;
            # rand(true)
            # 
            # Direk işlem için;
            # rand(false)
            # 
            # kullanın.
            If ($payload -eq 0) {
                rand -type 0
            }
        } Else {
            
            # Bu kısım değişken kontrolü yapmak isteyenler içindir.
            $num = 0
            Do {
                $index[$num] = $num
                $num = $num + 1
            } While ($num -lt 101);
            
            # do döngüsü kullanılır.
            $opt = Get-Random -Maximum 101
            $payload = $index[$opt]
            If ($payload -eq 0) {
                rand -type 1
            }
        }
        
        # İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
        # Çıkış int (Tamsayı) olarak döner.
        return $payload
    }
}

# Main

logger -type 'str' -this plugins -type 'ask name' -arg ''
delay -sn 2
$name = Read-Host
namecorrection -name $name
delay -sn 2

# İsim Alma Kısmı Tamamlandı
logger -type 'str' -this plugins -type 'after name' -arg $name
delay -sn 9
logger -type 'str' -this plugins -type 'game mode' -arg ''
[int] $mode = Read-Host

# Oyun Modu Başarıyla Seçildi
If ($mode -eq 1 -or $mode -eq 2) {
    If ($mode -eq 1) {
        
        # Kolay Oyun Modu
        $index = 0
        $index2 = 0
        $sync = 1
        $number = rand -type 1
        logger -type 'str' -this plugins -type 'get num' -arg $name
        delay -sn 2
        
        # Sayı Belirlendi
        While ($sync) {
            If ($index -eq 10) {
                $find = 0
                $sync = 0
                
                # 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
            } Else {
                $index2 = $index2 + 1
                $index = $index + 1
                If ($index -eq 1) {
                    
                    # İlk başlama mesajı
                    logger -type 'str' -this plugins -type 'think' -arg $name
                } Else {
                    
                    # Sonraki başlama mesajları
                    If ($index -eq 10) {
                        
                        # Son tahmin hakkı için bilgilendirme mesajı
                        logger -type 'str' -this plugins -type 'sthink' -arg $name
                        delay -sn 3.5
                    } Else {
                        
                        # Yanlış tahminler için bilgilendirme mesajı
                        logger -type 'str' -this plugins -type 'wthink' -arg $name
                    }
                }
                [int] $think = Read-Host
                If ($think -eq $number) {
                    
                    # Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                    $find = 1
                    $sync = 0
                } Else {
                    delay -sn 1
                    If ($index -eq 10) {
                    } Else {
                        If ($think -gt $number) {
                            
                            # Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                            If ($think - $number -gt 25) {
                                
                                # Tahmin, sayıdan uzak ise bunu gönder
                                logger -type 'str' -this plugins -type 'cold' -arg ''
                            } Else {
                                If ($think - $number -gt 15) {
                                    
                                    # Tahmin, sayıya biraz yakın ise bunu gönder
                                    logger -type 'str' -this plugins -type 'warm' -arg ''
                                } Else {
                                    
                                    # Tahmin, sayıya çok yakın ise bunu gönder
                                    logger -type 'str' -this plugins -type 'hot' -arg ''
                                }
                            }
                        } Else {
                            
                            # Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                            If ($number - $think -gt 25) {
                                
                                # Tahmin, sayıdan uzak ise bunu gönder
                                logger -type 'str' -this plugins -type 'cold' -arg ''
                            } Else {
                                If ($number - $think -gt 15) {
                                    
                                    # Tahmin, sayıya biraz yakın ise bunu gönder
                                    logger -type 'str' -this plugins -type 'warm' -arg ''
                                } Else {
                                    
                                    # Tahmin, sayıya çok yakın ise bunu gönder
                                    logger -type 'str' -this plugins -type 'hot' -arg ''
                                }
                            }
                        }
                    }
                }
            }
        }
        If ($find) {
            
            # Oyun Kazanıldığında Buraya Dön
            If ($index2 -lt 4) {
                
                # Sayı hemen tahmin edilirse ek mesaj gönder
                logger -type 'str' -this plugins -type 'swin' -arg $name
                delay -sn 1
                logger -type 'str' -this plugins -type 'win' -arg $name
                delay -sn 2
                logger -type 'str' -this [string] $index2 + '. Denemede Oyunu Kazandınız!'
            } Else {
                
                # Klasik tebrik mesajı
                logger -type 'str' -this plugins -type 'win' -arg $name
                delay -sn 2
                logger -type 'str' -this [string] $index2 + '. Denemede Oyunu Kazandınız!'
            }
        } Else {
            
            # Oyun Kaybedildiğinde Buraya Dön
            logger -type 'str' -this plugins -type 'lose' -arg $name
            delay -sn 2
            logger -type 'str' -this 'Bir kez daha oynamak için 1 yazman yeterli.'
            $name = Read-Host
            If ($name -eq '1') {
                
                # Program kapanmadan bir kez daha oynama hakkı verir.
                main 
            }
        }
    } Else {
        
        # Normal Oyun Modu
        $index = 0
        $index2 = 0
        $sync = 1
        $number = rand -type 0
        logger -type 'str' -this plugins -type 'get num' -arg $name
        delay -sn 2
        
        # Sayı Belirlendi
        While ($sync) {
            If ($index -eq 10) {
                $find = 0
                $sync = 0
                
                # 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
            } Else {
                $index2 = $index2 + 1
                $index = $index + 1
                If ($index -eq 1) {
                    
                    # İlk başlama mesajı
                    logger -type 'str' -this plugins -type 'think' -arg $name
                } Else {
                    
                    # Sonraki başlama mesajları
                    If ($index -eq 10) {
                        
                        # Son tahmin hakkı için bilgilendirme mesajı
                        logger -type 'str' -this plugins -type 'sthink' -arg $name
                        delay -sn 3.5
                    } Else {
                        
                        # Yanlış tahminler için bilgilendirme mesajı
                        logger -type 'str' -this plugins -type 'wthink' -arg $name
                    }
                }
                [int] $think = Read-Host
                If ($think -eq $number) {
                    
                    # Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                    $find = 1
                    $sync = 0
                } Else {
                    
                    # Tahmin Yanlış İse Döngüyü Yeniden Başlat
                }
            }
        }
        If ($find) {
            
            # Oyun Kazanıldığında Buraya Dön
            If ($index2 -lt 4) {
                
                # Sayı hemen tahmin edilirse ek mesaj gönder
                logger -type 'str' -this plugins -type 'swin' -arg $name
                delay -sn 1
                logger -type 'str' -this plugins -type 'win' -arg $name
                delay -sn 2
                logger -type 'str' -this [string] $index2 + '. Denemede Oyunu Kazandınız!'
            } Else {
                
                # Klasik tebrik mesajı
                logger -type 'str' -this plugins -type 'win' -arg $name
                delay -sn 2
                logger -type 'str' -this [string] $index2 + '. Denemede Oyunu Kazandınız!'
            }
        } Else {
            
            # Oyun Kaybedildiğinde Buraya Dön
            logger -type 'str' -this plugins -type 'lose' -arg $name
            delay -sn 2
            logger -type 'str' -this 'Bir kez daha oynamak için 1 yazman yeterli.'
            $name = Read-Host
            If ($name -eq '1') {
                
                # Program kapanmadan bir kez daha oynama hakkı verir.
                main 
            }
        }
    }
} Else {
    If ($mode -eq 3) {
        
        # Bilgilendirme Mesajı
        $number = 0
        Do {
            logger -type 'str' -this plugins -type 'info' -arg [string] $number
            delay -sn 4
            $number = $number + 1
        } While ($number -ne 10);
        
        # do Dögüsü kullanmak en iyi seçenek olacaktır
    } Else {
        logger -type 'str' -this plugins -type 'wmode' -arg ''
    }
}
