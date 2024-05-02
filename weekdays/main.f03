program main
    implicit none
    logical :: sync
    integer :: index, index2
    character(len=100), dimension(0:7) :: günler
    
    sync = .true.
    index = 0
    index2 = 0
    günler(0) = "Pazartesi"
    günler(1) = "Salı"
    günler(2) = "Çarşamba"
    günler(3) = "Perşembe"
    günler(4) = "Cuma"
    günler(5) = "Cumartesi"
    günler(6) = "Pazar"
    do while (sync)
        if (index == 7) then
        else
            index = index + 1
            print *, "Haftanın " // intToStr(index) // ". Günü: " // günler(index2)
            call delay(1)
            
            ! Çıktı 1 saniye süreyle atılır.
            index2 = index2 + 1
        end if
    end do

contains
    
    function delay(sn) result(sonuc)
        integer, intent(in) :: sn
        logical :: sonuc
        integer :: ms
        integer :: n
        
        ms = sn * 33333
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
end program main
