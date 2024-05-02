program main
    implicit none
    logical :: sync, find
    character(:), allocatable :: name
    integer :: mode, number
    integer :: index, index2, think
    integer :: index, index2, think
    
    call logger("str", plugins("ask name", ""))
    call delay(real(2))
    name = inputText()
    call namecorrection(name)
    call delay(real(2))
    
    ! İsim Alma Kısmı Tamamlandı
    call logger("str", plugins("after name", name))
    call delay(real(9))
    call logger("str", plugins("game mode", ""))
    mode = inputValue()
    
    ! Oyun Modu Başarıyla Seçildi
    if (mode == 1 .or. mode == 2) then
        if (mode == 1) then
            
            ! Kolay Oyun Modu
            index = 0
            index2 = 0
            sync = .true.
            number = rand(.true.)
            call logger("str", plugins("get num", name))
            call delay(real(2))
            
            ! Sayı Belirlendi
            do while (sync)
                if (index == 10) then
                    find = .false.
                    sync = .false.
                    
                    ! 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                else
                    index2 = index2 + 1
                    index = index + 1
                    if (index == 1) then
                        
                        ! İlk başlama mesajı
                        call logger("str", plugins("think", name))
                    else
                        
                        ! Sonraki başlama mesajları
                        if (index == 10) then
                            
                            ! Son tahmin hakkı için bilgilendirme mesajı
                            call logger("str", plugins("sthink", name))
                            call delay(3.5)
                        else
                            
                            ! Yanlış tahminler için bilgilendirme mesajı
                            call logger("str", plugins("wthink", name))
                        end if
                    end if
                    think = inputValue()
                    if (think == number) then
                        
                        ! Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        find = .true.
                        sync = .false.
                    else
                        call delay(real(1))
                        if (index == 10) then
                        else
                            if (think > number) then
                                
                                ! Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                                if (think - number > 25) then
                                    
                                    ! Tahmin, sayıdan uzak ise bunu gönder
                                    call logger("str", plugins("cold", ""))
                                else
                                    if (think - number > 15) then
                                        
                                        ! Tahmin, sayıya biraz yakın ise bunu gönder
                                        call logger("str", plugins("warm", ""))
                                    else
                                        
                                        ! Tahmin, sayıya çok yakın ise bunu gönder
                                        call logger("str", plugins("hot", ""))
                                    end if
                                end if
                            else
                                
                                ! Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                                if (number - think > 25) then
                                    
                                    ! Tahmin, sayıdan uzak ise bunu gönder
                                    call logger("str", plugins("cold", ""))
                                else
                                    if (number - think > 15) then
                                        
                                        ! Tahmin, sayıya biraz yakın ise bunu gönder
                                        call logger("str", plugins("warm", ""))
                                    else
                                        
                                        ! Tahmin, sayıya çok yakın ise bunu gönder
                                        call logger("str", plugins("hot", ""))
                                    end if
                                end if
                            end if
                        end if
                    end if
                end if
            end do
            if (find) then
                
                ! Oyun Kazanıldığında Buraya Dön
                if (index2 < 4) then
                    
                    ! Sayı hemen tahmin edilirse ek mesaj gönder
                    call logger("str", plugins("swin", name))
                    call delay(real(1))
                    call logger("str", plugins("win", name))
                    call delay(real(2))
                    call logger("str", intToStr(index2) // ". Denemede Oyunu Kazandınız!")
                else
                    
                    ! Klasik tebrik mesajı
                    call logger("str", plugins("win", name))
                    call delay(real(2))
                    call logger("str", intToStr(index2) // ". Denemede Oyunu Kazandınız!")
                end if
            else
                
                ! Oyun Kaybedildiğinde Buraya Dön
                call logger("str", plugins("lose", name))
                call delay(real(2))
                call logger("str", "Bir kez daha oynamak için 1 yazman yeterli.")
                name = inputText()
                if (name == "1") then
                    
                    ! Program kapanmadan bir kez daha oynama hakkı verir.
                    call main()
                end if
            end if
        else
            
            ! Normal Oyun Modu
            index = 0
            index2 = 0
            sync = .true.
            number = rand(.false.)
            call logger("str", plugins("get num", name))
            call delay(real(2))
            
            ! Sayı Belirlendi
            do while (sync)
                if (index == 10) then
                    find = .false.
                    sync = .false.
                    
                    ! 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                else
                    index2 = index2 + 1
                    index = index + 1
                    if (index == 1) then
                        
                        ! İlk başlama mesajı
                        call logger("str", plugins("think", name))
                    else
                        
                        ! Sonraki başlama mesajları
                        if (index == 10) then
                            
                            ! Son tahmin hakkı için bilgilendirme mesajı
                            call logger("str", plugins("sthink", name))
                            call delay(3.5)
                        else
                            
                            ! Yanlış tahminler için bilgilendirme mesajı
                            call logger("str", plugins("wthink", name))
                        end if
                    end if
                    think = inputValue()
                    if (think == number) then
                        
                        ! Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        find = .true.
                        sync = .false.
                    else
                        
                        ! Tahmin Yanlış İse Döngüyü Yeniden Başlat
                    end if
                end if
            end do
            if (find) then
                
                ! Oyun Kazanıldığında Buraya Dön
                if (index2 < 4) then
                    
                    ! Sayı hemen tahmin edilirse ek mesaj gönder
                    call logger("str", plugins("swin", name))
                    call delay(real(1))
                    call logger("str", plugins("win", name))
                    call delay(real(2))
                    call logger("str", intToStr(index2) // ". Denemede Oyunu Kazandınız!")
                else
                    
                    ! Klasik tebrik mesajı
                    call logger("str", plugins("win", name))
                    call delay(real(2))
                    call logger("str", intToStr(index2) // ". Denemede Oyunu Kazandınız!")
                end if
            else
                
                ! Oyun Kaybedildiğinde Buraya Dön
                call logger("str", plugins("lose", name))
                call delay(real(2))
                call logger("str", "Bir kez daha oynamak için 1 yazman yeterli.")
                name = inputText()
                if (name == "1") then
                    
                    ! Program kapanmadan bir kez daha oynama hakkı verir.
                    call main()
                end if
            end if
        end if
    else
        if (mode == 3) then
            
            ! Bilgilendirme Mesajı
            number = 0
            do
                call logger("str", plugins("info", intToStr(number)))
                call delay(real(4))
                number = number + 1
                
                if (.not. (number /= 10)) exit      !Exit loop
            end do
            
            ! do Dögüsü kullanmak en iyi seçenek olacaktır
        else
            call logger("str", plugins("wmode", ""))
        end if
    end if

contains
    
    function delay(sn) result(payload)
        real, intent(in) :: sn
        logical :: payload
        real :: ms
        integer :: n
        
        ! Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
        ! setTimeout()
        ! time.sleep()
        ! gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
        ms = sn * 30000
        
        ! 1 Saniye ≊ 30.000 Sayım
        ! 1 Sayım = 3,14e-5
        n = 0
        do while (n < ms)
            n = n + 1
        end do
        payload = .true.
    end function delay
    
    function func_exit() result(ex)
        ! Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
        ! Bu fonskiyon hiçbir şekilde pas geçilemez.
        ! Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
        do
            
            if (.not. (.true.)) exit      !Exit loop
        end do
    end function func_exit
    
    function logger(var_type, this) result(payload)
        character(:), intent(in) :: var_type
        character(:), intent(in) :: this
        logical :: payload
        
        ! Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
        ! 
        ! Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
        if (var_type == "int") then
            print *, stringToInt(this)
            payload = .true.
        else
            if (var_type == "str") then
                print *, 
                payload = .true.
            else
                if (var_type == "bool") then
                    payload = this
                else
                    
                    ! Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                    ! Program durdurulur.
                    ! process.exit()
                    call func_exit()
                end if
            end if
        end if
        
        ! logger("str", "test")  =>  String İçin
        ! logger("int", "190")  =>  Sayı İçin
        ! logger("bool", true)  => true-false için
    end function logger
    
    function namecorrection(name) result(payload)
        character(:), intent(in) :: name
        logical :: payload
        
        if (len(name) < 3) then
            call logger("str", "İsminiz 3 kelimeden kısa olmamalı." // achar(13) // "Lütfen programı baştan başlatın.")
            call func_exit()
        else
            payload = .true.
        end if
        
        ! Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
    end function namecorrection
    
    function plugins(var_type, arg) result(payload)
        character(:), intent(in) :: var_type
        character(:), intent(in) :: arg
        character(:), allocatable :: payload
        character(len=100), dimension(0:10) :: str
        
        ! Program içindeki çeşitlilik için gerekli fonksiyon.
        ! Fonksiyon karmaşası olmaması için kısaltıldı.
        if (var_type == "ask name") then
            str(0) = "Oyuna Hoşgeldin Yabancı!" // achar(13) // "Lütfen Adını Gir:"
            str(1) = "Hey, Merhaba Yabacı :)" // achar(13) // "Lütfen İsmini Yazar mısın?"
            str(2) = "Yeni bir oyuncu. Yaşasınn!" // achar(13) // "Adını söylermisin lütfen.."
            str(3) = "Oyunda Yeni Bir Katılımcı Var!" // achar(13) // "Lütfen İsmini Gir:"
            str(4) = "İşte yeni bir oyuncu daha!" // achar(13) // "Sana nasıl hitap etmemi istersin?"
            str(5) = "Seni daha önce buralarda görmedim.." // achar(13) // "Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle."
            str(6) = "Oyuna Hoşgeldin!" // achar(13) // "Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz."
            payload = str(random(7))
        else
            if (var_type == "after name") then
                str(0) = "Merhaba " // arg // achar(13) // "Oyunun kuralları şunlardır:" // achar(13) // "1) Sistem 0-100 arasında sayı seçer." // achar(13) // "2) Sayıyı tahmin etmeye çalışırsın" // achar(13) // "3) Toplam 10 adet başarısız denemeden sonra oyun biter." // achar(13) // "4) Sayı bulunursa oyun kazanılır!"
                payload = str(0)
            else
                if (var_type == "game mode") then
                    str(0) = "Lütfen Oyun Modunu Seç" // achar(13) // achar(13) // "1) Kolay (Sıcak-Soğuk Mantığı)" // achar(13) // "2) Normal (Yönergeler Yok)" // achar(13) // "3) İşleyiş Hakkında Bilgi Al"
                    payload = str(0)
                else
                    if (var_type == "wmode") then
                        str(0) = "Lütfen Sadece 1 veya 2 Yazın"
                        str(1) = "Yanlış Seçim! Sadece 1 veya 2 yazın!"
                        payload = str(random(2))
                    else
                        if (var_type == "get num") then
                            str(0) = "Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! " // arg
                            str(1) = "Tuttum! Hadi Başlayalım :)"
                            str(2) = "Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans " // arg // " :)"
                            payload = str(random(3))
                        else
                            if (var_type == "think") then
                                str(0) = "Tahminin?"
                                str(1) = "Sence ne olabilir " // arg // "?"
                                str(2) = "Bi fikrin varmı?"
                                str(3) = "Tahminin için bekliyorum " // arg
                                str(4) = "İyi düşün ve öyle karar ver.."
                                str(5) = "Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                                str(6) = "Şansını boşa harcama " // arg
                                str(7) = "Sakın yanlış tahin ediyim deme haa"
                                str(8) = "Hadi sıra sende " // arg
                                payload = str(random(9))
                            else
                                if (var_type == "wthink") then
                                    str(0) = "Yanlış! Tahminin?"
                                    str(1) = "Bu Değil. Sence ne olabilir " // arg // "?"
                                    str(2) = "Sayı bu değil. Bi fikrin varmı?"
                                    str(3) = "Yeniden.. Tahminin için bekliyorum " // arg
                                    str(4) = "Şimdi iyi düşün ve öyle karar ver.."
                                    str(5) = "Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et."
                                    str(6) = "Şansını boşa harcama " // arg
                                    str(7) = "Ah be abi. Sakın yanlış tahin ediyim deme haa"
                                    str(8) = "Tekrardan.. Hadi sıra sende " // arg
                                    payload = str(random(9))
                                else
                                    if (var_type == "sthink") then
                                        str(0) = "Hey, hey! Bu son hakkın. Dikkatli Ol!"
                                        str(1) = "Dur Biraz! Bu Son Şansın. İyi Kullan " // arg
                                        str(2) = "Kader Anı! Oyunu kazanman için son şans!"
                                        str(3) = "Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin " // arg
                                        str(4) = "Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı.."
                                        payload = str(random(5))
                                    else
                                        if (var_type == "win") then
                                            str(0) = "[+] Kazandın!!!" // achar(13) // "İşte Buuu! Nasılda tahmin ettin *o*" // achar(13) // achar(13) // "Bir sonraki oyunda görüşmek üzere.."
                                            str(1) = "[+] Tebrikler " // arg // "." // achar(13) // "Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın." // achar(13) // "Bir sonraki oyununda başarılar."
                                            str(2) = "[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)" // achar(13) // "Bir oyuna daha var mısın.."
                                            str(3) = "[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum." // achar(13) // "Sonraki oyunlarda görüşmek dileğiyle.."
                                            str(4) = "[+] İyi iş çıkardın " // arg // achar(13) // "Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \'_'/"
                                            payload = str(random(5))
                                        else
                                            if (var_type == "swin") then
                                                str(0) = "[⁂] İnanılmaz.. Tek Kelime İle Şahane!"
                                                str(1) = "[⁂] Ne.. Bu kadar hızlı yenilemem.."
                                                str(2) = "[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim.."
                                                str(3) = "[⁂] Sen..? Nasıl..? Hile mi yapıyosun??"
                                                str(4) = "[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?"
                                                payload = str(random(5))
                                            else
                                                if (var_type == "lose") then
                                                    str(0) = "[-] Üzgünüm, Oyunu Kaybettiniz."
                                                    str(1) = "[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın.."
                                                    str(2) = "[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin."
                                                    str(3) = "[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın."
                                                    str(4) = "[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez.."
                                                    payload = str(random(5))
                                                else
                                                    if (var_type == "cold") then
                                                        str(0) = "↘                ↙" // achar(13) // " Soğuk" // achar(13) // "↗                ↖"
                                                        payload = str(0)
                                                    else
                                                        if (var_type == "warm") then
                                                            str(0) = "↘                ↙" // achar(13) // "  Ilık" // achar(13) // "↗                ↖"
                                                            payload = str(0)
                                                        else
                                                            if (var_type == "hot") then
                                                                str(0) = "↘                ↙" // achar(13) // " Sıcak" // achar(13) // "↗                ↖"
                                                                payload = str(0)
                                                            else
                                                                if (var_type == "info") then
                                                                    str(0) = "Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır."
                                                                    str(1) = "Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir."
                                                                    str(2) = "İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır."
                                                                    str(3) = "Ardından oyun hakkında bilgilendirme mesajı gönderilir."
                                                                    str(4) = "Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki 'Ana' yazan yere basıp 'logger' seçmelisiniz."
                                                                    str(5) = "Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor."
                                                                    str(6) = "Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir."
                                                                    str(7) = "Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir."
                                                                    str(8) = "Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır."
                                                                    str(9) = "Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur."
                                                                    payload = str(stringToInt(arg))
                                                                end if
                                                            end if
                                                        end if
                                                    end if
                                                end if
                                            end if
                                        end if
                                    end if
                                end if
                            end if
                        end if
                    end if
                end if
            end if
        end if
        
        ! prototip => plugins(<str>, <str>)
        ! Örnek:
        ! plugins("ask name", " ")
        ! plugins("after name", "İsim")
    end function plugins
    
    function rand(var_type) result(payload)
        logical, intent(in) :: var_type
        integer :: payload, opt, num
        integer, dimension(0:101) :: index
        
        ! 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
        ! 
        ! var dizin = ["bir", "iki", "üç"]
        ! return dizin[0]     // "bir"
        if (.not. var_type) then
            payload = random(101)
            
            ! Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
            ! Değişken kontrolü için;
            ! rand(true)
            ! 
            ! Direk işlem için;
            ! rand(false)
            ! 
            ! kullanın.
            if (payload == 0) then
                call rand(.false.)
            end if
        else
            
            ! Bu kısım değişken kontrolü yapmak isteyenler içindir.
            num = 0
            do
                index(num) = num
                num = num + 1
                
                if (.not. (num < 101)) exit      !Exit loop
            end do
            
            ! do döngüsü kullanılır.
            opt = random(101)
            payload = index(opt)
            if (payload == 0) then
                call rand(.true.)
            end if
        end if
        
        ! İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
        ! Çıkış int (Tamsayı) olarak döner.
    end function rand

    ! The following are useful functions. They could also be placed in a module for easy access.
    function realToStr(value) result(text)
        real, intent(in) :: value
        character(:), allocatable :: text
        character(100) :: buffer
        
        write(buffer, *), value
        text = trim(adjustl(buffer))
    end function realToStr

    function intToStr(value) result(text)
        integer, intent(in) :: value
        character(:), allocatable :: text
        character(100) :: buffer
        
        write(buffer, *), value
        text = trim(adjustl(buffer))
    end function intToStr

    function strToInt(text) result(value)
        character(len=*),intent(in) :: text
        integer :: value
        
        read(text,*) value
    end function strToInt

    function strToReal(text) result(value)
        character(len=*),intent(in) :: text
        real :: value
        
        read(text,*) value
    end function strToReal

    function inputText() result(text)
        character(:), allocatable :: text
        character(100) :: buffer
        
        read *, buffer
        text = buffer
    end function inputText

    function inputValue() result(value)
        real :: value
        integer :: ierror = 0
        
        do
            read (*,*, iostat=ierror), value
            if (ierror == 0) exit
        end do
    end function inputValue

    function random(range) result(value)
        integer, intent(in) :: range
        real :: pseudo
        integer :: value
        
        call random_number(pseudo)
        value = int(pseudo * range)
    end function random

    subroutine seedRandom()
        integer :: timer(1:8), k
        integer, dimension(:), allocatable :: seed
        real(8) :: r
        
        call date_and_time(values=timer)
        call random_seed(size=k)
        allocate(seed(1:k))
        seed(:) = timer(8)
        call random_seed(put=seed)
    end subroutine seedRandom
end program main
