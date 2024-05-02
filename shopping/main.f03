program main
    implicit none
    integer :: süt
    integer :: sütkontrol
    integer :: yumurta
    integer :: yumurtakontrol
    integer :: peynir
    integer :: peynirkontrol
    
    süt = 10
    peynir = 10
    yumurta = 10
    print *, "Ürünlerin Stok Durumu" // achar(13) // achar(13) // "Süt :: " // intToStr(süt) // achar(13) // "Yumurta :: " // intToStr(yumurta) // achar(13) // "Peynir :: " // intToStr(peynir)
    do while (.true.)
        print *, "Alacaginiz urunun miktarini giriniz" // achar(13) // "Süt ::"
        sütkontrol = inputValue()
        if (sütkontrol > süt) then
            print *, "Stokta yeterli sut yok"
        else
            süt = süt - sütkontrol
        end if
        print *, "Alacaginiz urunun miktarini giriniz" // achar(13) // "Yumurta ::"
        yumurtakontrol = inputValue()
        if (yumurtakontrol > yumurta) then
            print *, "Stokta yeterli yumurta yok"
        else
            yumurta = yumurta - yumurtakontrol
        end if
        print *, "Alacaginiz urunun miktarini giriniz" // achar(13) // "Peynir ::"
        peynirkontrol = inputValue()
        if (peynirkontrol > peynir) then
            print *, "Stokta yeterli peynir yok"
        else
            peynir = peynir - peynirkontrol
        end if
        print *, "Ürünlerin Güncel Stok Durumu" // achar(13) // achar(13) // "Süt :: " // intToStr(süt) // achar(13) // "Yumurta :: " // intToStr(yumurta) // achar(13) // "Peynir :: " // intToStr(peynir)
    end do

contains

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
