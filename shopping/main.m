% Note: The first function listed is executed. main() is not a special function in Matlab/Octave.
function main()
    süt = 10;
    peynir = 10;
    yumurta = 10;
    disp(['Ürünlerin Stok Durumu', char(13), char(13), 'Süt :: ', num2str(süt), char(13), 'Yumurta :: ', num2str(yumurta), char(13), 'Peynir :: ', num2str(peynir)]);
    while true
        disp(['Alacaginiz urunun miktarini giriniz', char(13), 'Süt ::']);
        sütkontrol = input('Enter a value for sütkontrol');
        if sütkontrol > süt
            disp('Stokta yeterli sut yok');
        else
            süt = süt - sütkontrol;
        end
        disp(['Alacaginiz urunun miktarini giriniz', char(13), 'Yumurta ::']);
        yumurtakontrol = input('Enter a value for yumurtakontrol');
        if yumurtakontrol > yumurta
            disp('Stokta yeterli yumurta yok');
        else
            yumurta = yumurta - yumurtakontrol;
        end
        disp(['Alacaginiz urunun miktarini giriniz', char(13), 'Peynir ::']);
        peynirkontrol = input('Enter a value for peynirkontrol');
        if peynirkontrol > peynir
            disp('Stokta yeterli peynir yok');
        else
            peynir = peynir - peynirkontrol;
        end
        disp(['Ürünlerin Güncel Stok Durumu', char(13), char(13), 'Süt :: ', num2str(süt), char(13), 'Yumurta :: ', num2str(yumurta), char(13), 'Peynir :: ', num2str(peynir)]);
    end
end
