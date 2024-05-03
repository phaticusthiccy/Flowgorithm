% Note: The first function listed is executed. main() is not a special function in Matlab/Octave.
function main()
    sayı = 1;
    sonuc = 0;
    disp('2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ');
    giris = input('Enter a value for giris');
    delay(1);
    disp('2. Sayıyı Belirleyin: ');
    giris2 = input('Enter a value for giris2');
    delay(1);
    disp('Programın İşleyişini Görmek İçin ''Y'', Direk Sonucu Görmek İçin ''N'' yazın.');
    debug = input('Enter text for debug', 's');
    if giris > giris2
        af1 = giris;
        af2 = giris2;
        giris = af2;
        giris2 = af1;
    else
        
        % İlk giriş, 2. girişten küçük ise program çalışmaz.
        % 
        % Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
    end
    for sayı = giris : giris2
        if rem(sayı, 2) == 1
            tempsonuc = sonuc;
            sonuc = sonuc + sayı;
            if strcmp(debug, 'n') || strcmp(debug, 'N')
                
                % es geç
            else
                disp([num2str(tempsonuc), '+', num2str(sayı), ': ', num2str(sonuc)]);
            end
        end
    end
    disp(['Sonuc: ', num2str(sonuc)]);
end

sonuc = function delay(sn)
    ms = sn * 30000;
    n = 0;
    while n ~= ms
        n = n + 1;
    end
    sonuc = true;
end
