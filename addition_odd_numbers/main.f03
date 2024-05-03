program main
    implicit none
    integer :: sayı, sonuc, giris, giris2, tempsonuc
    character(:), allocatable :: debug
    integer :: af1
    integer :: af2
    
    sayı = 1
    sonuc = 0
    print *, "2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: "
    giris = inputValue()
    call delay(1)
    print *, "2. Sayıyı Belirleyin: "
    giris2 = inputValue()
    call delay(1)
    print *, "Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın."
    debug = inputText()
    if (giris > giris2) then
        af1 = giris
        af2 = giris2
        giris = af2
        giris2 = af1
    else
        
        ! İlk giriş, 2. girişten küçük ise program çalışmaz.
        ! 
        ! Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
    end if
    do sayı = giris, giris2
        if (mod(sayı, 2) == 1) then
            tempsonuc = sonuc
            sonuc = sonuc + sayı
            if (debug == "n" .or. debug == "N") then
                
                ! es geç
            else
                print *, intToStr(tempsonuc) // "+" // intToStr(sayı) // ": " // intToStr(sonuc)
            end if
        end if
    end do
    print *, "Sonuc: " // intToStr(sonuc)

contains
    
    function delay(sn) result(sonuc)
        integer, intent(in) :: sn
        logical :: sonuc
        integer :: ms
        integer :: n
        
        ms = sn * 30000
        n = 0
        do while (n /= ms)
            n = n + 1
        end do
        sonuc = .true.
    end function delay

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
