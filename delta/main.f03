program main
    implicit none
    real, dimension(0:7) :: fsayı
    character(:), allocatable :: islem
    character(:), allocatable :: text
    
    ! Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
    ! // var fsayı = new Array()
    print *, "'a' Sayısının Değerini Girin: "
    fsayı(0) = inputValue()
    print *, "'b' Sayısının Değerini Girin: "
    fsayı(1) = inputValue()
    print *, "'c' Sayısının Değerini Girin: "
    fsayı(2) = inputValue()
    fsayı(3) = formül(int(fsayı(0)), int(fsayı(1)), int(fsayı(2)))
    
    ! Delta Formülü
    ! // formül(a = reel, b = ree, c = ree)
    print *, "Program İşleyişini Görmek İster misiniz? (Y yada N): "
    islem = inputText()
    if (islem == "y" .or. islem == "Y") then
        
        ! "Görünür İşlemler"
        if (fonksiyon(fsayı(3), fsayı(0), fsayı(1)) == "pass") then
            
            ! 2 kök içeren sonuçlar buraya yazılır.
            ! Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
            ! Sonuç için Gerekli Formül
            ! 
            ! // fonksiyon(delta = reel, a = reel, b = reel)
            ! // return str
            print *, "Kök 1: " // realToStr(((-fsayı(1) + sqrt(fsayı(3))) / (2 * fsayı(0))))
            print *, "Kök 2: " // realToStr(((-fsayı(1) - sqrt(fsayı(3))) / (2 * fsayı(0))))
            
            ! Kök formülleri yazıldı.
            print *, "Formüller: " // achar(13) // achar(13) // "Delta Hesabı" // achar(13) // "Delta = " // realToStr(fsayı(1)) // "^2-4*" // realToStr(fsayı(0)) // "*" // realToStr(fsayı(2)) // achar(13) // achar(13) // "====================" // achar(13) // achar(13) // "X1 İçin:" // achar(13) // "(-" // realToStr(fsayı(1)) // "+(" // realToStr(fsayı(3)) // "^(1/2))) / (2*" // realToStr(fsayı(0)) // ")" // achar(13) // achar(13) // "X2 İçin:" // achar(13) // "(-" // realToStr(fsayı(1)) // "-(" // realToStr(fsayı(3)) // "^(1/2))) / (2*" // realToStr(fsayı(0)) // ")"
        else
            text = fonksiyon(fsayı(3), fsayı(0), fsayı(1))
            
            ! İkincil bir fonksiyon ata.
            ! İlk işlem sonuç verirse buraya dön.
            if (text == "Kök Bulunamadı") then
                print *, text // achar(13) // achar(13) // "Delta 0'a eşittir. Bu yüzden kök yoktur."
            else
                print *, text // achar(13) // achar(13) // "Formül = -" // realToStr(fsayı(1)) // "/ 2*" // realToStr(fsayı(0))
            end if
        end if
    else
        
        ! "Kapalı İşlemler"
        if (fonksiyon(fsayı(3), fsayı(0), fsayı(1)) == "pass") then
            print *, "Kök 1: " // realToStr(((-fsayı(1) + sqrt(fsayı(3))) / (2 * fsayı(0))))
            print *, "Kök 2: " // realToStr(((-fsayı(1) - sqrt(fsayı(3))) / (2 * fsayı(0))))
        else
            print *, fonksiyon(fsayı(3), fsayı(0), fsayı(1))
        end if
    end if
    
    ! Programı Kapat. (return True)

contains
    
    function fonksiyon(deger, a, b) result(sonuc)
        real, intent(in) :: deger
        real, intent(in) :: a
        real, intent(in) :: b
        character(:), allocatable :: sonuc
        
        if (deger < 0) then
            sonuc = "Kök Bulunamadı"
        else
            if (deger == 0) then
                sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " // realToStr(-b / 2 * a)
            else
                sonuc = "pass"
            end if
        end if
    end function fonksiyon
    
    function formül(a, b, c) result(sonuc)
        integer, intent(in) :: a
        integer, intent(in) :: b
        integer, intent(in) :: c
        real :: sonuc
        
        sonuc = b * b - 4 * a * c
    end function formül

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
end program main
