% Note: The first function listed is executed. main() is not a special function in Matlab/Octave.
function main()
    disp('Lütfen Kilonuzu Giriniz:   (Ex: 69)  ');
    kilo = input('Enter a value for kilo');
    delay(1);
    disp('Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ');
    boy = input('Enter a value for boy');
    cümle = 'VKI Tablosunda ';
    if strcmp(vki(kilo, boy), 'zayıf')
        tab = strcat(cümle, '''Zayıf'' Bölümündesin');
    else
        if strcmp(vki(kilo, boy), 'normal')
            tab = strcat(cümle, '''Normal'' Bölümdesin');
        else
            if strcmp(vki(kilo, boy), 'kilolu')
                tab = strcat(cümle, '''Fazla Kilolu'' Bölümdesin');
            else
                if strcmp(vki(kilo, boy), '1. obez')
                    tab = strcat(cümle, '''1. Obez'' Bölümündesin');
                else
                    if strcmp(vki(kilo, boy), '2. obez')
                        tab = strcat(cümle, '''2. Obez'' Bölümündesin');
                    else
                        if strcmp(vki(kilo, boy), '3. obez')
                            tab = strcat(cümle, '''3. Obez'' Bölümündesin');
                        end
                    end
                end
            end
        end
    end
    disp(tab);
end

sonuc = function delay(sn)
    ms = sn * 33333;
    n = 0;
    while n ~= ms
        n = n + 1;
    end
    sonuc = true;
end

sonuc = function vki(kilo, boy)
    var_index = kilo / (boy * boy);
    if var_index < 18
        sonuc = 'zayıf';
    else
        if var_index < 25
            sonuc = 'normal';
        else
            if var_index < 30
                sonuc = 'kilolu';
            else
                if var_index < 35
                    sonuc = '1. obez';
                else
                    if var_index < 40
                        sonuc = '2. obez';
                    else
                        sonuc = '3. obez';
                    end
                end
            end
        end
    end
end
