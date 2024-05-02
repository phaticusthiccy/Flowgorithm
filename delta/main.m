% Note: The first function listed is executed. main() is not a special function in Matlab/Octave.
function main()
    fsayı = cell(7, 1);
    
    % Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
    % // var fsayı = new Array()
    disp('''a'' Sayısının Değerini Girin: ');
    fsayı{index(0)} = input('Enter a value for fsayı{index(0)}');
    disp('''b'' Sayısının Değerini Girin: ');
    fsayı{index(1)} = input('Enter a value for fsayı{index(1)}');
    disp('''c'' Sayısının Değerini Girin: ');
    fsayı{index(2)} = input('Enter a value for fsayı{index(2)}');
    fsayı{index(3)} = formül(fsayı{index(0)}, fsayı{index(1)}, fsayı{index(2)});
    
    % Delta Formülü
    % // formül(a = reel, b = ree, c = ree)
    disp('Program İşleyişini Görmek İster misiniz? (Y yada N): ');
    islem = input('Enter text for islem', 's');
    if strcmp(islem, 'y') || strcmp(islem, 'Y')
        
        % "Görünür İşlemler"
        if strcmp(fonksiyon(fsayı{index(3)}, fsayı{index(0)}, fsayı{index(1)}), 'pass')
            
            % 2 kök içeren sonuçlar buraya yazılır.
            % Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
            % Sonuç için Gerekli Formül
            % 
            % // fonksiyon(delta = reel, a = reel, b = reel)
            % // return str
            disp(['Kök 1: ', num2str((-fsayı{index(1)} + sqrt(fsayı{index(3)})) / (2 * fsayı{index(0)}))]);
            disp(['Kök 2: ', num2str((-fsayı{index(1)} - sqrt(fsayı{index(3)})) / (2 * fsayı{index(0)}))]);
            
            % Kök formülleri yazıldı.
            disp(['Formüller: ', char(13), char(13), 'Delta Hesabı', char(13), 'Delta = ', num2str(fsayı{index(1)}), '^2-4*', num2str(fsayı{index(0)}), '*', num2str(fsayı{index(2)}), char(13), char(13), '====================', char(13), char(13), 'X1 İçin:', char(13), '(-', num2str(fsayı{index(1)}), '+(', num2str(fsayı{index(3)}), '^(1/2))) / (2*', num2str(fsayı{index(0)}), ')', char(13), char(13), 'X2 İçin:', char(13), '(-', num2str(fsayı{index(1)}), '-(', num2str(fsayı{index(3)}), '^(1/2))) / (2*', num2str(fsayı{index(0)}), ')']);
        else
            text = fonksiyon(fsayı{index(3)}, fsayı{index(0)}, fsayı{index(1)});
            
            % İkincil bir fonksiyon ata.
            % İlk işlem sonuç verirse buraya dön.
            if strcmp(text, 'Kök Bulunamadı')
                disp([text, char(13), char(13), 'Delta 0''a eşittir. Bu yüzden kök yoktur.']);
            else
                disp([text, char(13), char(13), 'Formül = -', num2str(fsayı{index(1)}), '/ 2*', num2str(fsayı{index(0)})]);
            end
        end
    else
        
        % "Kapalı İşlemler"
        if strcmp(fonksiyon(fsayı{index(3)}, fsayı{index(0)}, fsayı{index(1)}), 'pass')
            disp(['Kök 1: ', num2str((-fsayı{index(1)} + sqrt(fsayı{index(3)})) / (2 * fsayı{index(0)}))]);
            disp(['Kök 2: ', num2str((-fsayı{index(1)} - sqrt(fsayı{index(3)})) / (2 * fsayı{index(0)}))]);
        else
            disp(fonksiyon(fsayı{index(3)}, fsayı{index(0)}, fsayı{index(1)}));
        end
    end
    
    % Programı Kapat. (return True)
end

sonuc = function fonksiyon(deger, a, b)
    if deger < 0
        sonuc = 'Kök Bulunamadı';
    else
        if deger == 0
            sonuc = strcat('1. ve 2. Kökler Eşittir. Sonuç: ', num2str(-b / 2 * a));
        else
            sonuc = 'pass';
        end
    end
end

sonuc = function formül(a, b, c)
    sonuc = b * b - 4 * a * c;
end

% Note: MATLAB uses 1-indexing for arrays. This function converts from zero-based to 1-based.
function i = index(n)
    i = n + 1;
end
