% Note: The first function listed is executed. main() is not a special function in Matlab/Octave.
function main()
    sync = true;
    var_index = 0;
    index2 = 0;
    günler = cell(7, 1);
    
    günler{index(0)} = 'Pazartesi';
    günler{index(1)} = 'Salı';
    günler{index(2)} = 'Çarşamba';
    günler{index(3)} = 'Perşembe';
    günler{index(4)} = 'Cuma';
    günler{index(5)} = 'Cumartesi';
    günler{index(6)} = 'Pazar';
    while sync
        if var_index == 7
        else
            var_index = var_index + 1;
            disp(['Haftanın ', num2str(var_index), '. Günü: ', günler{index(index2)}]);
            delay(1);
            
            % Çıktı 1 saniye süreyle atılır.
            index2 = index2 + 1;
        end
    end
end

sonuc = function delay(sn)
    ms = sn * 33333;
    n = 0;
    while n ~= ms
        n = n + 1;
    end
    sonuc = true;
end

% Note: MATLAB uses 1-indexing for arrays. This function converts from zero-based to 1-based.
function i = index(n)
    i = n + 1;
end
