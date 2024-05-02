% Note: The first function listed is executed. main() is not a special function in Matlab/Octave.
function main()
    sync = true;
    var_index = 0;
    index2 = 0;
    notlar = cell(5, 1);
    eskinotlar = cell(5, 1);
    otonot = cell(20, 1);
    otoeklenennot = cell(15, 1);
    
    disp(['Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?', char(13), char(13), 'Otomatik için: ''O''', char(13), 'Manuel için: ''M''', char(13), 'Yazın', char(13), char(13), 'Arayüz Hakkında Bilgi Almak İçin İse ''A'' Yazın']);
    secim = input('Enter text for secim', 's');
    if strcmp(secim, 'O') || strcmp(secim, 'o')
        while sync
            
            % Bu döngü notları belirler.
            if var_index == 5
                sync = false;
                
                % index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
            else
                var_index = var_index + 1;
                notlar{index(index2)} = floor(rand() * 80);
                
                % Random sayı belirle
                index2 = index2 + 1;
                
                % 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
            end
        end
        sync = true;
        var_index = 0;
        index2 = 0;
        
        % Değişkenleri sıfırlayalım
        while sync
            
            % Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
            if var_index == 5
                sync = false;
            else
                var_index = var_index + 1;
                eskinotlar{index(index2)} = notlar{index(index2)};
                notlar{index(index2)} = notlar{index(index2)} + 20;
                index2 = index2 + 1;
            end
        end
        sync = true;
        var_index = 0;
        index2 = 0;
        
        % Değişkenleri sıfırlayalım
        disp('Yeni Notlar:');
        while sync
            
            % Bu döngü eski ve yeni notları bir arada yazdırır.
            if var_index == 5
                sync = false;
                
                % Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
            else
                var_index = var_index + 1;
                disp([num2str(var_index), '. Öğrencinin; ', char(13), char(13), 'Eski Not: ', num2str(eskinotlar{index(index2)}), char(13), 'Yeni Not: ', num2str(notlar{index(index2)})]);
                delay(500);
                
                % 500 Milisaniyelik Gecikme
                index2 = index2 + 1;
            end
        end
    else
        if strcmp(secim, 'M') || strcmp(secim, 'm')
            disp('1. Öğrencinin Notunu Giriniz: ');
            notlar{index(0)} = input('Enter a value for notlar{index(0)}');
            disp('2. Öğrencinin Notunu Giriniz: ');
            notlar{index(1)} = input('Enter a value for notlar{index(1)}');
            disp('3. Öğrencinin Notunu Giriniz: ');
            notlar{index(2)} = input('Enter a value for notlar{index(2)}');
            disp('4. Öğrencinin Notunu Giriniz: ');
            notlar{index(3)} = input('Enter a value for notlar{index(3)}');
            disp('5. Öğrencinin Notunu Giriniz: ');
            notlar{index(4)} = input('Enter a value for notlar{index(4)}');
            delay(800);
            devam = true;
            var_index = 0;
            index2 = 0;
            while sync
                if var_index == 5
                    sync = false;
                else
                    var_index = var_index + 1;
                    if notlar{index(index2)} > 100
                        sync = false;
                        devam = false;
                    else
                        if notlar{index(index2)} < 0
                            sync = false;
                            devam = false;
                        else
                            index2 = index2 + 1;
                        end
                    end
                end
            end
            if ~ devam
                disp('Notlar 100 ve 0 Arasında Olmalıdır.');
            else
                disp(['Size 3 Seçenek Sunuyoruz:', char(13), char(13), '1) Herkesin Notuna +20 Puan Ekle', char(13), '2) Herkesin Notuna Eklenecek Puanı Manuel Gir', char(13), '3) Sistem''in Kendi Not Ekleme Aracını Kullan']);
                secim2 = input('Enter a value for secim2');
                if secim2 == 3
                    delay(59);
                    var_index = 0;
                    index2 = 0;
                    sync = true;
                    while sync
                        if var_index == 5
                            sync = false;
                        else
                            var_index = var_index + 1;
                            otoeklenennot{index(index2)} = puanekle(notlar{index(index2)});
                            
                            % Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                            delay(59);
                            if strcmp(otoeklenennot{index(index2)}, 'pass')
                                otoeklenennot{index(index2)} = '0';
                            else
                                otonot{index(index2)} = notlar{index(index2)} + str2num(puanekle(notlar{index(index2)}));
                            end
                            index2 = index2 + 1;
                        end
                    end
                    var_index = 0;
                    index2 = 0;
                    sync = true;
                    while sync
                        if var_index == 5
                            sync = false;
                        else
                            var_index = var_index + 1;
                            if strcmp(otoeklenennot{index(index2)}, '0')
                                cikti = strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(num2str(var_index), '. Öğrencinin; '), char(13)), char(13)), 'Eski Not: '), num2str(notlar{index(index2)})), char(13)), 'Yeni Not: '), num2str(notlar{index(index2)})), char(13)), 'Ek Puan Yok. Not Yeterli.');
                            else
                                cikti = strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(num2str(var_index), '. Öğrencinin; '), char(13)), char(13)), 'Eski Not: '), num2str(notlar{index(index2)})), char(13)), 'Yeni Not: '), num2str(str2num(otoeklenennot{index(index2)}) + notlar{index(index2)})), char(13)), 'Eklenen Puan: '), otoeklenennot{index(index2)});
                            end
                            disp(cikti);
                            delay(500);
                            index2 = index2 + 1;
                        end
                    end
                else
                    if secim2 == 2
                        var_index = 0;
                        index2 = 0;
                        sync = false;
                        
                        % Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                        % Yaha henüz ben keşfedemedim :p
                        delay(230);
                        soru1 = puaneklesoru('1', notlar{index(index2)});
                        index2 = index2 + 1;
                        soru2 = puaneklesoru('2', notlar{index(index2)});
                        index2 = index2 + 1;
                        soru3 = puaneklesoru('3', notlar{index(index2)});
                        index2 = index2 + 1;
                        soru4 = puaneklesoru('4', notlar{index(index2)});
                        index2 = index2 + 1;
                        soru5 = puaneklesoru('5', notlar{index(index2)});
                        delay(600);
                        sync = true;
                        soruarray = cell(5, 1);
                        
                        soruarray{index(0)} = soru1;
                        soruarray{index(1)} = soru2;
                        soruarray{index(2)} = soru3;
                        soruarray{index(3)} = soru4;
                        soruarray{index(4)} = soru5;
                        if soru1 > 100 && soru1 < 0 || soru2 > 100 && soru2 < 0 || soru3 > 100 && soru3 < 0 || soru4 > 100 && soru4 < 0 || soru5 > 100 && soru5 < 0
                            disp('Notların Son Hali 100 ve 0 Arasında Olmalıdır.');
                        else
                            index2 = 0;
                            sayı1 = soru1 + notlar{index(index2)};
                            index2 = index2 + 1;
                            sayı2 = soru2 + notlar{index(index2)};
                            index2 = index2 + 1;
                            sayı3 = soru3 + notlar{index(index2)};
                            index2 = index2 + 1;
                            sayı4 = soru4 + notlar{index(index2)};
                            index2 = index2 + 1;
                            sayı5 = soru5 + notlar{index(index2)};
                            index2 = 0;
                            var_index = 0;
                            sonsayılar = cell(5, 1);
                            
                            sonsayılar{index(0)} = sayı1;
                            sonsayılar{index(1)} = sayı2;
                            sonsayılar{index(2)} = sayı3;
                            sonsayılar{index(3)} = sayı4;
                            sonsayılar{index(4)} = sayı5;
                            while sync
                                if var_index == 5
                                    sync = false;
                                else
                                    var_index = var_index + 1;
                                    disp([num2str(var_index), '. Öğrencinin; ', char(13), char(13), 'Eski Not: ', num2str(notlar{index(index2)}), char(13), 'Yeni Not: ', num2str(sonsayılar{index(index2)}), char(13), 'Eklenen Puan: ', num2str(soruarray{index(index2)})]);
                                    delay(270);
                                    index2 = index2 + 1;
                                end
                            end
                        end
                    else
                        if secim2 == 1
                            while sync
                                
                                % Bu döngü notları belirler.
                                if var_index == 5
                                    sync = false;
                                    
                                    % index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                                else
                                    var_index = var_index + 1;
                                    notlar{index(index2)} = floor(rand() * 80);
                                    
                                    % Random sayı belirle
                                    index2 = index2 + 1;
                                    
                                    % 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                                end
                            end
                            sync = true;
                            var_index = 0;
                            index2 = 0;
                            
                            % Değişkenleri sıfırlayalım
                            while sync
                                
                                % Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                                if var_index == 5
                                    sync = false;
                                else
                                    var_index = var_index + 1;
                                    eskinotlar{index(index2)} = notlar{index(index2)};
                                    notlar{index(index2)} = notlar{index(index2)} + 20;
                                    index2 = index2 + 1;
                                end
                            end
                            sync = true;
                            var_index = 0;
                            index2 = 0;
                            
                            % Değişkenleri sıfırlayalım
                            disp('Yeni Notlar:');
                            while sync
                                
                                % Bu döngü eski ve yeni notları bir arada yazdırır.
                                if var_index == 5
                                    sync = false;
                                    
                                    % Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                else
                                    var_index = var_index + 1;
                                    if notlar{index(index2)} > 100
                                        notlar{index(index2)} = 100;
                                        disp([num2str(var_index), '. Öğrencinin; ', char(13), char(13), 'Eski Not: ', num2str(eskinotlar{index(index2)}), char(13), 'Yeni Not: ', num2str(notlar{index(index2)})]);
                                    else
                                        disp([num2str(var_index), '. Öğrencinin; ', char(13), char(13), 'Eski Not: ', num2str(eskinotlar{index(index2)}), char(13), 'Yeni Not: ', num2str(notlar{index(index2)})]);
                                    end
                                    
                                    % 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                    delay(500);
                                    
                                    % 500 Milisaniyelik Gecikme
                                    index2 = index2 + 1;
                                end
                            end
                        else
                            disp('Lütfen 1, 2 veya 3 yazınız.');
                            delay(1000);
                            disp('Program Kapatılıyor..');
                            var_index = 3;
                            while sync
                                if var_index == 0
                                    sync = false;
                                else
                                    delay(1000);
                                    disp([num2str(var_index), '..']);
                                    var_index = var_index - 1;
                                end
                                
                                % Programın Kapatılması İçin Sayaç Oluştur
                            end
                        end
                    end
                end
            end
        else
            if strcmp(secim, 'a') || strcmp(secim, 'A')
                disp(['1) Otomatik Mod Hakkında Yardım', char(13), '2) Manuel Mod Hakkında Yardım']);
                helpnum = input('Enter a value for helpnum');
                delay(200);
                
                % Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                loop = yardımloop(helpnum);
                delay(200);
                if loop == 1
                    disp('Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.');
                    delay(7800);
                    disp('Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.');
                    delay(9000);
                    disp('Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.');
                else
                    disp(['1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım', char(13), '2) Manuel Puan Ekleme Hakkında Yardım', char(13), '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım']);
                    helpnum2 = input('Enter a value for helpnum2');
                    delay(200);
                    loop2 = yardımloop2(helpnum2);
                    delay(200);
                    if loop2 == 1
                        disp('Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.');
                    else
                        if loop2 == 2
                            disp('Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.');
                            delay(7800);
                            disp('Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.');
                        else
                            disp('Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.');
                            delay(4500);
                            disp('Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.');
                            delay(4500);
                            disp('Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.');
                            delay(8000);
                            disp('Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt''a (ekrana) yazdırılır.');
                        end
                    end
                end
            else
                disp('Lütfen Sadece ''M'' veya ''O'' Harflerini Giriniz!');
            end
        end
    end
    
    % 2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır.
    % 
    % Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir.
    % Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer.
    % 
    % 1. İşlem: Seçilen Notların Hepine 20 Puan Ekle
    % 2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler
    % 3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar.
    % 
    % 3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir.
end

sonuc = function delay(sn)
    % Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
    ms = sn * 33;
    n = 0;
    while n ~= ms
        n = n + 1;
    end
    sonuc = true;
    
    % Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
    % boolen test
    % test = delay(200)
    % çıktı test  // true
end

sonuc = function puanekle(puan)
    ekpuan = cell(20, 1);
    
    % while döngüsü için
    sync = true;
    var_index = 0;
    if puan > 89
        sonuc = 'pass';
        
        % 90 ve üstü notlar için puan ekleme olmaz.
    else
        if puan > 69
            index2 = 5;
            while sync
                if var_index == 6
                    sync = false;
                else
                    ekpuan{index(var_index)} = index2;
                    var_index = var_index + 1;
                    index2 = index2 + 1;
                end
            end
            sonuc = num2str(ekpuan{index(floor(rand() * 6))});
            
            % Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
        else
            if puan > 49
                index2 = 10;
                while sync
                    if var_index == 9
                        sync = false;
                    else
                        ekpuan{index(var_index)} = index2;
                        var_index = var_index + 1;
                        index2 = index2 + 1;
                    end
                end
                sonuc = num2str(ekpuan{index(floor(rand() * 9))});
                
                % Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
            else
                if puan > 29
                    index2 = 20;
                    while sync
                        if var_index == 10
                            sync = false;
                        else
                            ekpuan{index(var_index)} = index2;
                            var_index = var_index + 1;
                            index2 = index2 + 1;
                        end
                    end
                    sonuc = num2str(ekpuan{index(floor(rand() * 10))});
                    
                    % Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                else
                    index2 = 30;
                    while sync
                        if var_index == 11
                            sync = false;
                        else
                            ekpuan{index(var_index)} = index2;
                            var_index = var_index + 1;
                            index2 = index2 + 1;
                        end
                    end
                    sonuc = num2str(ekpuan{index(floor(rand() * 11))});
                    
                    % Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                end
            end
        end
    end
    
    % String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
    % var sayı = 0.65   // Javascript
    % sayı = 0.65          // Python
    % local sayı = 0.65          // Lua
    % int sayı = 0.65     // C
end

sonuc = function puaneklesoru(no, eskinot)
    disp([no, '. Öğrenci İçin Kaç Puan Eklemek İstersiniz: ', char(13), char(13), 'Öğrencinin Puanı: ', num2str(eskinot)]);
    sonuc = input('Enter a value for sonuc');
end

sonuc = function yardımloop(sayı)
    if sayı == 1 || sayı == 2
    else
        disp(['Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın.', char(13), 'Yeniden Başlatılıyor..']);
        delay(1000);
        disp(['1) Otomatik Mod Hakkında Yardım', char(13), '2) Manuel Mod Hakkında Yardım']);
        sayı = input('Enter a value for sayı');
        yardımloop(sayı);
    end
    
    % Yardım Modülü İçin
    % Yanlış değer girildiğinde baştan başlatır
    sonuc = sayı;
end

sonuc = function yardımloop2(sayı)
    if sayı == 1 || sayı == 2 || sayı == 3
    else
        disp(['Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın.', char(13), 'Yeniden Başlatılıyor..']);
        delay(1000);
        disp(['1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım', char(13), '2) Manuel Puan Ekleme Hakkında Yardım', char(13), '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım']);
        sayı = input('Enter a value for sayı');
        yardımloop2(sayı);
    end
    sonuc = sayı;
end

% Note: MATLAB uses 1-indexing for arrays. This function converts from zero-based to 1-based.
function i = index(n)
    i = n + 1;
end
