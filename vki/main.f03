program main
    implicit none
    integer :: kilo
    real :: boy
    character(:), allocatable :: tab
    character(:), allocatable :: cümle
    
    print *, "Lütfen Kilonuzu Giriniz:   (Ex: 69)  "
    kilo = inputValue()
    call delay(1)
    print *, "Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  "
    boy = inputValue()
    cümle = "VKI Tablosunda "
    if (vki(kilo, int(boy)) == "zayıf") then
        tab = cümle // "'Zayıf' Bölümündesin"
    else
        if (vki(kilo, int(boy)) == "normal") then
            tab = cümle // "'Normal' Bölümdesin"
        else
            if (vki(kilo, int(boy)) == "kilolu") then
                tab = cümle // "'Fazla Kilolu' Bölümdesin"
            else
                if (vki(kilo, int(boy)) == "1. obez") then
                    tab = cümle // "'1. Obez' Bölümündesin"
                else
                    if (vki(kilo, int(boy)) == "2. obez") then
                        tab = cümle // "'2. Obez' Bölümündesin"
                    else
                        if (vki(kilo, int(boy)) == "3. obez") then
                            tab = cümle // "'3. Obez' Bölümündesin"
                        end if
                    end if
                end if
            end if
        end if
    end if
    print *, tab

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
    
    function vki(kilo, boy) result(sonuc)
        integer, intent(in) :: kilo
        integer, intent(in) :: boy
        character(:), allocatable :: sonuc
        integer :: index
        
        index = kilo / (boy * boy)
        if (index < 18) then
            sonuc = "zayıf"
        else
            if (index < 25) then
                sonuc = "normal"
            else
                if (index < 30) then
                    sonuc = "kilolu"
                else
                    if (index < 35) then
                        sonuc = "1. obez"
                    else
                        if (index < 40) then
                            sonuc = "2. obez"
                        else
                            sonuc = "3. obez"
                        end if
                    end if
                end if
            end if
        end if
    end function vki

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
