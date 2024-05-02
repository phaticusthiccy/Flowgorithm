% Note: The first function listed is executed. main() is not a special function in Matlab/Octave.
function main()
    logger('str', plugins('ask name', ''));
    delay(2);
    name = input('Enter text for name', 's');
    namecorrection(name);
    delay(2);
    
    % İsim Alma Kısmı Tamamlandı
    logger('str', plugins('after name', name));
    delay(9);
    logger('str', plugins('game mode', ''));
    mode = input('Enter a value for mode');
    
    % Oyun Modu Başarıyla Seçildi
    if mode == 1 || mode == 2
        if mode == 1
            
            % Kolay Oyun Modu
            var_index = 0;
            index2 = 0;
            sync = true;
            number = rand(true);
            logger('str', plugins('get num', name));
            delay(2);
            
            % Sayı Belirlendi
            while sync
                if var_index == 10
                    find = false;
                    sync = false;
                    
                    % 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                else
                    index2 = index2 + 1;
                    var_index = var_index + 1;
                    if var_index == 1
                        
                        % İlk başlama mesajı
                        logger('str', plugins('think', name));
                    else
                        
                        % Sonraki başlama mesajları
                        if var_index == 10
                            
                            % Son tahmin hakkı için bilgilendirme mesajı
                            logger('str', plugins('sthink', name));
                            delay(3.5);
                        else
                            
                            % Yanlış tahminler için bilgilendirme mesajı
                            logger('str', plugins('wthink', name));
                        end
                    end
                    think = input('Enter a value for think');
                    if think == number
                        
                        % Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        find = true;
                        sync = false;
                    else
                        delay(1);
                        if var_index == 10
                        else
                            if think > number
                                
                                % Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                                if think - number > 25
                                    
                                    % Tahmin, sayıdan uzak ise bunu gönder
                                    logger('str', plugins('cold', ''));
                                else
                                    if think - number > 15
                                        
                                        % Tahmin, sayıya biraz yakın ise bunu gönder
                                        logger('str', plugins('warm', ''));
                                    else
                                        
                                        % Tahmin, sayıya çok yakın ise bunu gönder
                                        logger('str', plugins('hot', ''));
                                    end
                                end
                            else
                                
                                % Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                                if number - think > 25
                                    
                                    % Tahmin, sayıdan uzak ise bunu gönder
                                    logger('str', plugins('cold', ''));
                                else
                                    if number - think > 15
                                        
                                        % Tahmin, sayıya biraz yakın ise bunu gönder
                                        logger('str', plugins('warm', ''));
                                    else
                                        
                                        % Tahmin, sayıya çok yakın ise bunu gönder
                                        logger('str', plugins('hot', ''));
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if find
                
                % Oyun Kazanıldığında Buraya Dön
                if index2 < 4
                    
                    % Sayı hemen tahmin edilirse ek mesaj gönder
                    logger('str', plugins('swin', name));
                    delay(1);
                    logger('str', plugins('win', name));
                    delay(2);
                    logger('str', strcat(num2str(index2), '. Denemede Oyunu Kazandınız!'));
                else
                    
                    % Klasik tebrik mesajı
                    logger('str', plugins('win', name));
                    delay(2);
                    logger('str', strcat(num2str(index2), '. Denemede Oyunu Kazandınız!'));
                end
            else
                
                % Oyun Kaybedildiğinde Buraya Dön
                logger('str', plugins('lose', name));
                delay(2);
                logger('str', 'Bir kez daha oynamak için 1 yazman yeterli.');
                name = input('Enter text for name', 's');
                if strcmp(name, '1')
                    
                    % Program kapanmadan bir kez daha oynama hakkı verir.
                    main();
                end
            end
        else
            
            % Normal Oyun Modu
            var_index = 0;
            index2 = 0;
            sync = true;
            number = rand(false);
            logger('str', plugins('get num', name));
            delay(2);
            
            % Sayı Belirlendi
            while sync
                if var_index == 10
                    find = false;
                    sync = false;
                    
                    % 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                else
                    index2 = index2 + 1;
                    var_index = var_index + 1;
                    if var_index == 1
                        
                        % İlk başlama mesajı
                        logger('str', plugins('think', name));
                    else
                        
                        % Sonraki başlama mesajları
                        if var_index == 10
                            
                            % Son tahmin hakkı için bilgilendirme mesajı
                            logger('str', plugins('sthink', name));
                            delay(3.5);
                        else
                            
                            % Yanlış tahminler için bilgilendirme mesajı
                            logger('str', plugins('wthink', name));
                        end
                    end
                    think = input('Enter a value for think');
                    if think == number
                        
                        % Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        find = true;
                        sync = false;
                    else
                        
                        % Tahmin Yanlış İse Döngüyü Yeniden Başlat
                    end
                end
            end
            if find
                
                % Oyun Kazanıldığında Buraya Dön
                if index2 < 4
                    
                    % Sayı hemen tahmin edilirse ek mesaj gönder
                    logger('str', plugins('swin', name));
                    delay(1);
                    logger('str', plugins('win', name));
                    delay(2);
                    logger('str', strcat(num2str(index2), '. Denemede Oyunu Kazandınız!'));
                else
                    
                    % Klasik tebrik mesajı
                    logger('str', plugins('win', name));
                    delay(2);
                    logger('str', strcat(num2str(index2), '. Denemede Oyunu Kazandınız!'));
                end
            else
                
                % Oyun Kaybedildiğinde Buraya Dön
                logger('str', plugins('lose', name));
                delay(2);
                logger('str', 'Bir kez daha oynamak için 1 yazman yeterli.');
                name = input('Enter text for name', 's');
                if strcmp(name, '1')
                    
                    % Program kapanmadan bir kez daha oynama hakkı verir.
                    main();
                end
            end
        end
    else
        if mode == 3
            
            % Bilgilendirme Mesajı
            number = 0;
            while true
                logger('str', plugins('info', num2str(number)));
                delay(4);
                number = number + 1;
                
                if ~(number ~= 10) break; end  %Exit loop
            end
            
            % do Dögüsü kullanmak en iyi seçenek olacaktır
        else
            logger('str', plugins('wmode', ''));
        end
    end
end

payload = function delay(sn)
    % Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
    % setTimeout()
    % time.sleep()
    % gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
    ms = sn * 30000;
    
    % 1 Saniye ≊ 30.000 Sayım
    % 1 Sayım = 3,14e-5
    n = 0;
    while n < ms
        n = n + 1;
    end
    payload = true;
end

ex = function exit()
    % Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
    % Bu fonskiyon hiçbir şekilde pas geçilemez.
    % Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
    while true
        
        if ~(true) break; end  %Exit loop
    end
end

payload = function logger(type, this)
    % Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
    % 
    % Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
    if strcmp(type, 'int')
        disp(str2num(this));
        payload = true;
    else
        if strcmp(type, 'str')
            disp(num2str(this));
            payload = true;
        else
            if strcmp(type, 'bool')
                payload = this;
            else
                
                % Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                % Program durdurulur.
                % process.exit()
                exit();
            end
        end
    end
    
    % logger("str", "test")  =>  String İçin
    % logger("int", "190")  =>  Sayı İçin
    % logger("bool", true)  => true-false için
end

payload = function namecorrection(name)
    if strlength(name) < 3
        logger('str', strcat(strcat('İsminiz 3 kelimeden kısa olmamalı.', char(13)), 'Lütfen programı baştan başlatın.'));
        exit();
    else
        payload = true;
    end
    
    % Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
end

payload = function plugins(type, arg)
    % Program içindeki çeşitlilik için gerekli fonksiyon.
    % Fonksiyon karmaşası olmaması için kısaltıldı.
    str = cell(10, 1);
    
    if strcmp(type, 'ask name')
        str{index(0)} = strcat(strcat('Oyuna Hoşgeldin Yabancı!', char(13)), 'Lütfen Adını Gir:');
        str{index(1)} = strcat(strcat('Hey, Merhaba Yabacı :)', char(13)), 'Lütfen İsmini Yazar mısın?');
        str{index(2)} = strcat(strcat('Yeni bir oyuncu. Yaşasınn!', char(13)), 'Adını söylermisin lütfen..');
        str{index(3)} = strcat(strcat('Oyunda Yeni Bir Katılımcı Var!', char(13)), 'Lütfen İsmini Gir:');
        str{index(4)} = strcat(strcat('İşte yeni bir oyuncu daha!', char(13)), 'Sana nasıl hitap etmemi istersin?');
        str{index(5)} = strcat(strcat('Seni daha önce buralarda görmedim..', char(13)), 'Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle.');
        str{index(6)} = strcat(strcat('Oyuna Hoşgeldin!', char(13)), 'Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz.');
        payload = str{index(floor(rand() * 7))};
    else
        if strcmp(type, 'after name')
            str{index(0)} = strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat('Merhaba ', arg), char(13)), 'Oyunun kuralları şunlardır:'), char(13)), '1) Sistem 0-100 arasında sayı seçer.'), char(13)), '2) Sayıyı tahmin etmeye çalışırsın'), char(13)), '3) Toplam 10 adet başarısız denemeden sonra oyun biter.'), char(13)), '4) Sayı bulunursa oyun kazanılır!');
            payload = str{index(0)};
        else
            if strcmp(type, 'game mode')
                str{index(0)} = strcat(strcat(strcat(strcat(strcat(strcat(strcat('Lütfen Oyun Modunu Seç', char(13)), char(13)), '1) Kolay (Sıcak-Soğuk Mantığı)'), char(13)), '2) Normal (Yönergeler Yok)'), char(13)), '3) İşleyiş Hakkında Bilgi Al');
                payload = str{index(0)};
            else
                if strcmp(type, 'wmode')
                    str{index(0)} = 'Lütfen Sadece 1 veya 2 Yazın';
                    str{index(1)} = 'Yanlış Seçim! Sadece 1 veya 2 yazın!';
                    payload = str{index(floor(rand() * 2))};
                else
                    if strcmp(type, 'get num')
                        str{index(0)} = strcat('Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! ', arg);
                        str{index(1)} = 'Tuttum! Hadi Başlayalım :)';
                        str{index(2)} = strcat(strcat('Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans ', arg), ' :)');
                        payload = str{index(floor(rand() * 3))};
                    else
                        if strcmp(type, 'think')
                            str{index(0)} = 'Tahminin?';
                            str{index(1)} = strcat(strcat('Sence ne olabilir ', arg), '?');
                            str{index(2)} = 'Bi fikrin varmı?';
                            str{index(3)} = strcat('Tahminin için bekliyorum ', arg);
                            str{index(4)} = 'İyi düşün ve öyle karar ver..';
                            str{index(5)} = 'Bencee.. Ay, yardım edemem.. En iyisi tahmin et.';
                            str{index(6)} = strcat('Şansını boşa harcama ', arg);
                            str{index(7)} = 'Sakın yanlış tahin ediyim deme haa';
                            str{index(8)} = strcat('Hadi sıra sende ', arg);
                            payload = str{index(floor(rand() * 9))};
                        else
                            if strcmp(type, 'wthink')
                                str{index(0)} = 'Yanlış! Tahminin?';
                                str{index(1)} = strcat(strcat('Bu Değil. Sence ne olabilir ', arg), '?');
                                str{index(2)} = 'Sayı bu değil. Bi fikrin varmı?';
                                str{index(3)} = strcat('Yeniden.. Tahminin için bekliyorum ', arg);
                                str{index(4)} = 'Şimdi iyi düşün ve öyle karar ver..';
                                str{index(5)} = 'Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et.';
                                str{index(6)} = strcat('Şansını boşa harcama ', arg);
                                str{index(7)} = 'Ah be abi. Sakın yanlış tahin ediyim deme haa';
                                str{index(8)} = strcat('Tekrardan.. Hadi sıra sende ', arg);
                                payload = str{index(floor(rand() * 9))};
                            else
                                if strcmp(type, 'sthink')
                                    str{index(0)} = 'Hey, hey! Bu son hakkın. Dikkatli Ol!';
                                    str{index(1)} = strcat('Dur Biraz! Bu Son Şansın. İyi Kullan ', arg);
                                    str{index(2)} = 'Kader Anı! Oyunu kazanman için son şans!';
                                    str{index(3)} = strcat('Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin ', arg);
                                    str{index(4)} = 'Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı..';
                                    payload = str{index(floor(rand() * 5))};
                                else
                                    if strcmp(type, 'win')
                                        str{index(0)} = strcat(strcat(strcat(strcat(strcat('[+] Kazandın!!!', char(13)), 'İşte Buuu! Nasılda tahmin ettin *o*'), char(13)), char(13)), 'Bir sonraki oyunda görüşmek üzere..');
                                        str{index(1)} = strcat(strcat(strcat(strcat(strcat(strcat('[+] Tebrikler ', arg), '.'), char(13)), 'Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın.'), char(13)), 'Bir sonraki oyununda başarılar.');
                                        str{index(2)} = strcat(strcat('[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)', char(13)), 'Bir oyuna daha var mısın..');
                                        str{index(3)} = strcat(strcat('[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum.', char(13)), 'Sonraki oyunlarda görüşmek dileğiyle..');
                                        str{index(4)} = strcat(strcat(strcat('[+] İyi iş çıkardın ', arg), char(13)), 'Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \''_''/');
                                        payload = str{index(floor(rand() * 5))};
                                    else
                                        if strcmp(type, 'swin')
                                            str{index(0)} = '[⁂] İnanılmaz.. Tek Kelime İle Şahane!';
                                            str{index(1)} = '[⁂] Ne.. Bu kadar hızlı yenilemem..';
                                            str{index(2)} = '[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim..';
                                            str{index(3)} = '[⁂] Sen..? Nasıl..? Hile mi yapıyosun??';
                                            str{index(4)} = '[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?';
                                            payload = str{index(floor(rand() * 5))};
                                        else
                                            if strcmp(type, 'lose')
                                                str{index(0)} = '[-] Üzgünüm, Oyunu Kaybettiniz.';
                                                str{index(1)} = '[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın..';
                                                str{index(2)} = '[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin.';
                                                str{index(3)} = '[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın.';
                                                str{index(4)} = '[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez..';
                                                payload = str{index(floor(rand() * 5))};
                                            else
                                                if strcmp(type, 'cold')
                                                    str{index(0)} = strcat(strcat(strcat(strcat('↘                ↙', char(13)), ' Soğuk'), char(13)), '↗                ↖');
                                                    payload = str{index(0)};
                                                else
                                                    if strcmp(type, 'warm')
                                                        str{index(0)} = strcat(strcat(strcat(strcat('↘                ↙', char(13)), '  Ilık'), char(13)), '↗                ↖');
                                                        payload = str{index(0)};
                                                    else
                                                        if strcmp(type, 'hot')
                                                            str{index(0)} = strcat(strcat(strcat(strcat('↘                ↙', char(13)), ' Sıcak'), char(13)), '↗                ↖');
                                                            payload = str{index(0)};
                                                        else
                                                            if strcmp(type, 'info')
                                                                str{index(0)} = 'Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır.';
                                                                str{index(1)} = 'Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir.';
                                                                str{index(2)} = 'İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır.';
                                                                str{index(3)} = 'Ardından oyun hakkında bilgilendirme mesajı gönderilir.';
                                                                str{index(4)} = 'Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki ''Ana'' yazan yere basıp ''logger'' seçmelisiniz.';
                                                                str{index(5)} = 'Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor.';
                                                                str{index(6)} = 'Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir.';
                                                                str{index(7)} = 'Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir.';
                                                                str{index(8)} = 'Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır.';
                                                                str{index(9)} = 'Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur.';
                                                                payload = str{index(str2num(arg))};
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    % prototip => plugins(<str>, <str>)
    % Örnek:
    % plugins("ask name", " ")
    % plugins("after name", "İsim")
end

payload = function rand(type)
    var_index = cell(101, 1);
    
    % 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
    % 
    % var dizin = ["bir", "iki", "üç"]
    % return dizin[0]     // "bir"
    if ~ type
        payload = floor(rand() * 101);
        
        % Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
        % Değişken kontrolü için;
        % rand(true)
        % 
        % Direk işlem için;
        % rand(false)
        % 
        % kullanın.
        if payload == 0
            rand(false);
        end
    else
        
        % Bu kısım değişken kontrolü yapmak isteyenler içindir.
        num = 0;
        while true
            var_index{index(num)} = num;
            num = num + 1;
            
            if ~(num < 101) break; end  %Exit loop
        end
        
        % do döngüsü kullanılır.
        opt = floor(rand() * 101);
        payload = var_index{index(opt)};
        if payload == 0
            rand(true);
        end
    end
    
    % İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
    % Çıkış int (Tamsayı) olarak döner.
end

% Note: MATLAB uses 1-indexing for arrays. This function converts from zero-based to 1-based.
function i = index(n)
    i = n + 1;
end
