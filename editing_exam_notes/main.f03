program main
    implicit none
    logical :: sync
    character(:), allocatable :: secim
    integer :: index, index2
    integer, dimension(0:5) :: notlar
    integer, dimension(0:5) :: eskinotlar
    integer, dimension(0:20) :: otonot
    character(len=100), dimension(0:15) :: otoeklenennot
    integer :: secim2
    logical :: devam
    character(:), allocatable :: cikti
    integer :: sayı1, sayı2, sayı3, sayı4, sayı5
    integer :: soru1, soru2, soru3, soru4, soru5
    integer, dimension(0:5) :: soruarray
    integer, dimension(0:5) :: sonsayılar
    integer :: helpnum, helpnum2
    integer :: loop, loop2
    
    call seedRandom()
    sync = .true.
    index = 0
    index2 = 0
    print *, "Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" // achar(13) // achar(13) // "Otomatik için: 'O'" // achar(13) // "Manuel için: 'M'" // achar(13) // "Yazın" // achar(13) // achar(13) // "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın"
    secim = inputText()
    if (secim == "O" .or. secim == "o") then
        do while (sync)
            
            ! Bu döngü notları belirler.
            if (index == 5) then
                sync = .false.
                
                ! index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
            else
                index = index + 1
                notlar(index2) = random(80)
                
                ! Random sayı belirle
                index2 = index2 + 1
                
                ! 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
            end if
        end do
        sync = .true.
        index = 0
        index2 = 0
        
        ! Değişkenleri sıfırlayalım
        do while (sync)
            
            ! Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
            if (index == 5) then
                sync = .false.
            else
                index = index + 1
                eskinotlar(index2) = notlar(index2)
                notlar(index2) = notlar(index2) + 20
                index2 = index2 + 1
            end if
        end do
        sync = .true.
        index = 0
        index2 = 0
        
        ! Değişkenleri sıfırlayalım
        print *, "Yeni Notlar:"
        do while (sync)
            
            ! Bu döngü eski ve yeni notları bir arada yazdırır.
            if (index == 5) then
                sync = .false.
                
                ! Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
            else
                index = index + 1
                print *, intToStr(index) // ". Öğrencinin; " // achar(13) // achar(13) // "Eski Not: " // intToStr(eskinotlar(index2)) // achar(13) // "Yeni Not: " // intToStr(notlar(index2))
                call delay(500)
                
                ! 500 Milisaniyelik Gecikme
                index2 = index2 + 1
            end if
        end do
    else
        if (secim == "M" .or. secim == "m") then
            print *, "1. Öğrencinin Notunu Giriniz: "
            notlar(0) = inputValue()
            print *, "2. Öğrencinin Notunu Giriniz: "
            notlar(1) = inputValue()
            print *, "3. Öğrencinin Notunu Giriniz: "
            notlar(2) = inputValue()
            print *, "4. Öğrencinin Notunu Giriniz: "
            notlar(3) = inputValue()
            print *, "5. Öğrencinin Notunu Giriniz: "
            notlar(4) = inputValue()
            call delay(800)
            devam = .true.
            index = 0
            index2 = 0
            do while (sync)
                if (index == 5) then
                    sync = .false.
                else
                    index = index + 1
                    if (notlar(index2) > 100) then
                        sync = .false.
                        devam = .false.
                    else
                        if (notlar(index2) < 0) then
                            sync = .false.
                            devam = .false.
                        else
                            index2 = index2 + 1
                        end if
                    end if
                end if
            end do
            if (.not. devam) then
                print *, "Notlar 100 ve 0 Arasında Olmalıdır."
            else
                print *, "Size 3 Seçenek Sunuyoruz:" // achar(13) // achar(13) // "1) Herkesin Notuna +20 Puan Ekle" // achar(13) // "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" // achar(13) // "3) Sistem'in Kendi Not Ekleme Aracını Kullan"
                secim2 = inputValue()
                if (secim2 == 3) then
                    call delay(59)
                    index = 0
                    index2 = 0
                    sync = .true.
                    do while (sync)
                        if (index == 5) then
                            sync = .false.
                        else
                            index = index + 1
                            otoeklenennot(index2) = puanekle(notlar(index2))
                            
                            ! Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                            call delay(59)
                            if (otoeklenennot(index2) == "pass") then
                                otoeklenennot(index2) = "0"
                            else
                                otonot(index2) = notlar(index2) + stringToInt(puanekle(notlar(index2)))
                            end if
                            index2 = index2 + 1
                        end if
                    end do
                    index = 0
                    index2 = 0
                    sync = .true.
                    do while (sync)
                        if (index == 5) then
                            sync = .false.
                        else
                            index = index + 1
                            if (otoeklenennot(index2) == "0") then
                                cikti = intToStr(index) // ". Öğrencinin; " // achar(13) // achar(13) // "Eski Not: " // intToStr(notlar(index2)) // achar(13) // "Yeni Not: " // intToStr(notlar(index2)) // achar(13) // "Ek Puan Yok. Not Yeterli."
                            else
                                cikti = intToStr(index) // ". Öğrencinin; " // achar(13) // achar(13) // "Eski Not: " // intToStr(notlar(index2)) // achar(13) // "Yeni Not: " // realToStr((stringToInt(otoeklenennot(index2)) + notlar(index2))) // achar(13) // "Eklenen Puan: " // otoeklenennot(index2)
                            end if
                            print *, cikti
                            call delay(500)
                            index2 = index2 + 1
                        end if
                    end do
                else
                    if (secim2 == 2) then
                        index = 0
                        index2 = 0
                        sync = .false.
                        
                        ! Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                        ! Yaha henüz ben keşfedemedim :p
                        call delay(230)
                        soru1 = puaneklesoru("1", notlar(index2))
                        index2 = index2 + 1
                        soru2 = puaneklesoru("2", notlar(index2))
                        index2 = index2 + 1
                        soru3 = puaneklesoru("3", notlar(index2))
                        index2 = index2 + 1
                        soru4 = puaneklesoru("4", notlar(index2))
                        index2 = index2 + 1
                        soru5 = puaneklesoru("5", notlar(index2))
                        call delay(600)
                        sync = .true.
                        soruarray(0) = soru1
                        soruarray(1) = soru2
                        soruarray(2) = soru3
                        soruarray(3) = soru4
                        soruarray(4) = soru5
                        if (soru1 > 100 .and. soru1 < 0 .or. soru2 > 100 .and. soru2 < 0 .or. soru3 > 100 .and. soru3 < 0 .or. soru4 > 100 .and. soru4 < 0 .or. soru5 > 100 .and. soru5 < 0) then
                            print *, "Notların Son Hali 100 ve 0 Arasında Olmalıdır."
                        else
                            index2 = 0
                            sayı1 = soru1 + notlar(index2)
                            index2 = index2 + 1
                            sayı2 = soru2 + notlar(index2)
                            index2 = index2 + 1
                            sayı3 = soru3 + notlar(index2)
                            index2 = index2 + 1
                            sayı4 = soru4 + notlar(index2)
                            index2 = index2 + 1
                            sayı5 = soru5 + notlar(index2)
                            index2 = 0
                            index = 0
                            sonsayılar(0) = sayı1
                            sonsayılar(1) = sayı2
                            sonsayılar(2) = sayı3
                            sonsayılar(3) = sayı4
                            sonsayılar(4) = sayı5
                            do while (sync)
                                if (index == 5) then
                                    sync = .false.
                                else
                                    index = index + 1
                                    print *, intToStr(index) // ". Öğrencinin; " // achar(13) // achar(13) // "Eski Not: " // intToStr(notlar(index2)) // achar(13) // "Yeni Not: " // intToStr(sonsayılar(index2)) // achar(13) // "Eklenen Puan: " // intToStr(soruarray(index2))
                                    call delay(270)
                                    index2 = index2 + 1
                                end if
                            end do
                        end if
                    else
                        if (secim2 == 1) then
                            do while (sync)
                                
                                ! Bu döngü notları belirler.
                                if (index == 5) then
                                    sync = .false.
                                    
                                    ! index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                                else
                                    index = index + 1
                                    notlar(index2) = random(80)
                                    
                                    ! Random sayı belirle
                                    index2 = index2 + 1
                                    
                                    ! 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                                end if
                            end do
                            sync = .true.
                            index = 0
                            index2 = 0
                            
                            ! Değişkenleri sıfırlayalım
                            do while (sync)
                                
                                ! Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                                if (index == 5) then
                                    sync = .false.
                                else
                                    index = index + 1
                                    eskinotlar(index2) = notlar(index2)
                                    notlar(index2) = notlar(index2) + 20
                                    index2 = index2 + 1
                                end if
                            end do
                            sync = .true.
                            index = 0
                            index2 = 0
                            
                            ! Değişkenleri sıfırlayalım
                            print *, "Yeni Notlar:"
                            do while (sync)
                                
                                ! Bu döngü eski ve yeni notları bir arada yazdırır.
                                if (index == 5) then
                                    sync = .false.
                                    
                                    ! Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                else
                                    index = index + 1
                                    if (notlar(index2) > 100) then
                                        notlar(index2) = 100
                                        print *, intToStr(index) // ". Öğrencinin; " // achar(13) // achar(13) // "Eski Not: " // intToStr(eskinotlar(index2)) // achar(13) // "Yeni Not: " // intToStr(notlar(index2))
                                    else
                                        print *, intToStr(index) // ". Öğrencinin; " // achar(13) // achar(13) // "Eski Not: " // intToStr(eskinotlar(index2)) // achar(13) // "Yeni Not: " // intToStr(notlar(index2))
                                    end if
                                    
                                    ! 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                    call delay(500)
                                    
                                    ! 500 Milisaniyelik Gecikme
                                    index2 = index2 + 1
                                end if
                            end do
                        else
                            print *, "Lütfen 1, 2 veya 3 yazınız."
                            call delay(1000)
                            print *, "Program Kapatılıyor.."
                            index = 3
                            do while (sync)
                                if (index == 0) then
                                    sync = .false.
                                else
                                    call delay(1000)
                                    print *, intToStr(index) // ".."
                                    index = index - 1
                                end if
                                
                                ! Programın Kapatılması İçin Sayaç Oluştur
                            end do
                        end if
                    end if
                end if
            end if
        else
            if (secim == "a" .or. secim == "A") then
                print *, "1) Otomatik Mod Hakkında Yardım" // achar(13) // "2) Manuel Mod Hakkında Yardım"
                helpnum = inputValue()
                call delay(200)
                
                ! Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                loop = yardımloop(helpnum)
                call delay(200)
                if (loop == 1) then
                    print *, "Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar."
                    call delay(7800)
                    print *, "Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır."
                    call delay(9000)
                    print *, "Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır."
                else
                    print *, "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" // achar(13) // "2) Manuel Puan Ekleme Hakkında Yardım" // achar(13) // "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"
                    helpnum2 = inputValue()
                    call delay(200)
                    loop2 = yardımloop2(helpnum2)
                    call delay(200)
                    if (loop2 == 1) then
                        print *, "Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler."
                    else
                        if (loop2 == 2) then
                            print *, "Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar."
                            call delay(7800)
                            print *, "Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır."
                        else
                            print *, "Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır."
                            call delay(4500)
                            print *, "Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır."
                            call delay(4500)
                            print *, "Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar."
                            call delay(8000)
                            print *, "Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır."
                        end if
                    end if
                end if
            else
                print *, "Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!"
            end if
        end if
    end if
    
    ! 2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır.
    ! 
    ! Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir.
    ! Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer.
    ! 
    ! 1. İşlem: Seçilen Notların Hepine 20 Puan Ekle
    ! 2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler
    ! 3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar.
    ! 
    ! 3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir.

contains
    
    function delay(sn) result(sonuc)
        integer, intent(in) :: sn
        logical :: sonuc
        integer :: ms
        integer :: n
        
        ! Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
        ms = sn * 33
        n = 0
        do while (n /= ms)
            n = n + 1
        end do
        sonuc = .true.
        
        ! Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
        ! boolen test
        ! test = delay(200)
        ! çıktı test  // true
    end function delay
    
    function puanekle(puan) result(sonuc)
        integer, intent(in) :: puan
        character(:), allocatable :: sonuc
        integer, dimension(0:20) :: ekpuan
        integer :: index, index2
        logical :: sync
        
        ! while döngüsü için
        sync = .true.
        index = 0
        if (puan > 89) then
            sonuc = "pass"
            
            ! 90 ve üstü notlar için puan ekleme olmaz.
        else
            if (puan > 69) then
                index2 = 5
                do while (sync)
                    if (index == 6) then
                        sync = .false.
                    else
                        ekpuan(index) = index2
                        index = index + 1
                        index2 = index2 + 1
                    end if
                end do
                sonuc = intToStr(ekpuan(random(6)))
                
                ! Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
            else
                if (puan > 49) then
                    index2 = 10
                    do while (sync)
                        if (index == 9) then
                            sync = .false.
                        else
                            ekpuan(index) = index2
                            index = index + 1
                            index2 = index2 + 1
                        end if
                    end do
                    sonuc = intToStr(ekpuan(random(9)))
                    
                    ! Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
                else
                    if (puan > 29) then
                        index2 = 20
                        do while (sync)
                            if (index == 10) then
                                sync = .false.
                            else
                                ekpuan(index) = index2
                                index = index + 1
                                index2 = index2 + 1
                            end if
                        end do
                        sonuc = intToStr(ekpuan(random(10)))
                        
                        ! Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                    else
                        index2 = 30
                        do while (sync)
                            if (index == 11) then
                                sync = .false.
                            else
                                ekpuan(index) = index2
                                index = index + 1
                                index2 = index2 + 1
                            end if
                        end do
                        sonuc = intToStr(ekpuan(random(11)))
                        
                        ! Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                    end if
                end if
            end if
        end if
        
        ! String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
        ! var sayı = 0.65   // Javascript
        ! sayı = 0.65          // Python
        ! local sayı = 0.65          // Lua
        ! int sayı = 0.65     // C
    end function puanekle
    
    function puaneklesoru(no, eskinot) result(sonuc)
        character(:), intent(in) :: no
        integer, intent(in) :: eskinot
        integer :: sonuc
        
        print *, no // ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " // achar(13) // achar(13) // "Öğrencinin Puanı: " // intToStr(eskinot)
        sonuc = inputValue()
    end function puaneklesoru
    
    function yardımloop(sayı) result(sonuc)
        integer, intent(in) :: sayı
        integer :: sonuc
        
        if (sayı == 1 .or. sayı == 2) then
        else
            print *, "Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." // achar(13) // "Yeniden Başlatılıyor.."
            call delay(1000)
            print *, "1) Otomatik Mod Hakkında Yardım" // achar(13) // "2) Manuel Mod Hakkında Yardım"
            sayı = inputValue()
            call yardımloop(sayı)
        end if
        
        ! Yardım Modülü İçin
        ! Yanlış değer girildiğinde baştan başlatır
        sonuc = sayı
    end function yardımloop
    
    function yardımloop2(sayı) result(sonuc)
        integer, intent(in) :: sayı
        integer :: sonuc
        
        if (sayı == 1 .or. sayı == 2 .or. sayı == 3) then
        else
            print *, "Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." // achar(13) // "Yeniden Başlatılıyor.."
            call delay(1000)
            print *, "1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" // achar(13) // "2) Manuel Puan Ekleme Hakkında Yardım" // achar(13) // "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"
            sayı = inputValue()
            call yardımloop2(sayı)
        end if
        sonuc = sayı
    end function yardımloop2

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
