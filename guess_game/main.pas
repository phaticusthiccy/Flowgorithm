program MyProgram;
uses Math, SysUtils;

{ Headers }
function Delay (Sn : real) : boolean; forward;
function Exit () : boolean; forward;
function Logger (Type_variable : string, This : string) : boolean; forward;
function Namecorrection (Name : string) : boolean; forward;
function Plugins (Type_variable : string, Arg : string) : string; forward;
function Rand (Type_variable : boolean) : integer; forward;

function Delay (Sn : real) : boolean;
var
    Payload : boolean;
    Ms : real;
    n : integer;

begin
    { Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm; }
    { setTimeout() }
    { time.sleep() }
    { gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız. }
    Ms := Sn * 30000;
    
    { 1 Saniye ≊ 30.000 Sayım }
    { 1 Sayım = 3,14e-5 }
    n := 0;
    while n < Ms do
    begin
        n := Trunc(n + 1)
    end;
    Payload := true;
    
    Delay := Payload
end;

function Exit () : boolean;
begin
    { Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller. }
    { Bu fonskiyon hiçbir şekilde pas geçilemez. }
    { Fonksiyon bir kez çalışırsa durdurmak imkansızdır. }
    repeat
    begin
    end
    until not (true);
    
    Exit := ex
end;

function Logger (Type_variable : string, This : string) : boolean;
var
    Payload : boolean;

begin
    { Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım. }
    {  }
    { Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir. }
    if Type_variable = 'int' then
    begin
        WriteLn(StrToInt(This));
        Payload := true
    end
    else
    begin
        if Type_variable = 'str' then
        begin
            WriteLn(FloatToStr(This));
            Payload := true
        end
        else
        begin
            if Type_variable = 'bool' then
            begin
                Payload := This
            end
            else
            begin
                
                { Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir. }
                { Program durdurulur. }
                { process.exit() }
                Exit()
            end
        end
    end;
    
    { logger("str", "test")  =>  String İçin }
    { logger("int", "190")  =>  Sayı İçin }
    { logger("bool", true)  => true-false için }
    
    Logger := Payload
end;

function Namecorrection (Name : string) : boolean;
var
    Payload : boolean;

begin
    if Length(Name) < 3 then
    begin
        Logger('str', 'İsminiz 3 kelimeden kısa olmamalı.' + Chr(13) + 'Lütfen programı baştan başlatın.');
        Exit()
    end
    else
    begin
        Payload := true
    end;
    
    { Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz. }
    
    Namecorrection := Payload
end;

function Plugins (Type_variable : string, Arg : string) : string;
var
    Payload : string;
    Str : array of string;

begin
    { Program içindeki çeşitlilik için gerekli fonksiyon. }
    { Fonksiyon karmaşası olmaması için kısaltıldı. }
    SetLength(Str, 10);
    
    if Type_variable = 'ask name' then
    begin
        Str[0] := 'Oyuna Hoşgeldin Yabancı!' + Chr(13) + 'Lütfen Adını Gir:';
        Str[1] := 'Hey, Merhaba Yabacı :)' + Chr(13) + 'Lütfen İsmini Yazar mısın?';
        Str[2] := 'Yeni bir oyuncu. Yaşasınn!' + Chr(13) + 'Adını söylermisin lütfen..';
        Str[3] := 'Oyunda Yeni Bir Katılımcı Var!' + Chr(13) + 'Lütfen İsmini Gir:';
        Str[4] := 'İşte yeni bir oyuncu daha!' + Chr(13) + 'Sana nasıl hitap etmemi istersin?';
        Str[5] := 'Seni daha önce buralarda görmedim..' + Chr(13) + 'Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle.';
        Str[6] := 'Oyuna Hoşgeldin!' + Chr(13) + 'Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz.';
        Payload := Str[Random(7)]
    end
    else
    begin
        if Type_variable = 'after name' then
        begin
            Str[0] := 'Merhaba ' + Arg + Chr(13) + 'Oyunun kuralları şunlardır:' + Chr(13) + '1) Sistem 0-100 arasında sayı seçer.' + Chr(13) + '2) Sayıyı tahmin etmeye çalışırsın' + Chr(13) + '3) Toplam 10 adet başarısız denemeden sonra oyun biter.' + Chr(13) + '4) Sayı bulunursa oyun kazanılır!';
            Payload := Str[0]
        end
        else
        begin
            if Type_variable = 'game mode' then
            begin
                Str[0] := 'Lütfen Oyun Modunu Seç' + Chr(13) + Chr(13) + '1) Kolay (Sıcak-Soğuk Mantığı)' + Chr(13) + '2) Normal (Yönergeler Yok)' + Chr(13) + '3) İşleyiş Hakkında Bilgi Al';
                Payload := Str[0]
            end
            else
            begin
                if Type_variable = 'wmode' then
                begin
                    Str[0] := 'Lütfen Sadece 1 veya 2 Yazın';
                    Str[1] := 'Yanlış Seçim! Sadece 1 veya 2 yazın!';
                    Payload := Str[Random(2)]
                end
                else
                begin
                    if Type_variable = 'get num' then
                    begin
                        Str[0] := 'Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! ' + Arg;
                        Str[1] := 'Tuttum! Hadi Başlayalım :)';
                        Str[2] := 'Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans ' + Arg + ' :)';
                        Payload := Str[Random(3)]
                    end
                    else
                    begin
                        if Type_variable = 'think' then
                        begin
                            Str[0] := 'Tahminin?';
                            Str[1] := 'Sence ne olabilir ' + Arg + '?';
                            Str[2] := 'Bi fikrin varmı?';
                            Str[3] := 'Tahminin için bekliyorum ' + Arg;
                            Str[4] := 'İyi düşün ve öyle karar ver..';
                            Str[5] := 'Bencee.. Ay, yardım edemem.. En iyisi tahmin et.';
                            Str[6] := 'Şansını boşa harcama ' + Arg;
                            Str[7] := 'Sakın yanlış tahin ediyim deme haa';
                            Str[8] := 'Hadi sıra sende ' + Arg;
                            Payload := Str[Random(9)]
                        end
                        else
                        begin
                            if Type_variable = 'wthink' then
                            begin
                                Str[0] := 'Yanlış! Tahminin?';
                                Str[1] := 'Bu Değil. Sence ne olabilir ' + Arg + '?';
                                Str[2] := 'Sayı bu değil. Bi fikrin varmı?';
                                Str[3] := 'Yeniden.. Tahminin için bekliyorum ' + Arg;
                                Str[4] := 'Şimdi iyi düşün ve öyle karar ver..';
                                Str[5] := 'Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et.';
                                Str[6] := 'Şansını boşa harcama ' + Arg;
                                Str[7] := 'Ah be abi. Sakın yanlış tahin ediyim deme haa';
                                Str[8] := 'Tekrardan.. Hadi sıra sende ' + Arg;
                                Payload := Str[Random(9)]
                            end
                            else
                            begin
                                if Type_variable = 'sthink' then
                                begin
                                    Str[0] := 'Hey, hey! Bu son hakkın. Dikkatli Ol!';
                                    Str[1] := 'Dur Biraz! Bu Son Şansın. İyi Kullan ' + Arg;
                                    Str[2] := 'Kader Anı! Oyunu kazanman için son şans!';
                                    Str[3] := 'Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin ' + Arg;
                                    Str[4] := 'Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı..';
                                    Payload := Str[Random(5)]
                                end
                                else
                                begin
                                    if Type_variable = 'win' then
                                    begin
                                        Str[0] := '[+] Kazandın!!!' + Chr(13) + 'İşte Buuu! Nasılda tahmin ettin *o*' + Chr(13) + Chr(13) + 'Bir sonraki oyunda görüşmek üzere..';
                                        Str[1] := '[+] Tebrikler ' + Arg + '.' + Chr(13) + 'Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın.' + Chr(13) + 'Bir sonraki oyununda başarılar.';
                                        Str[2] := '[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)' + Chr(13) + 'Bir oyuna daha var mısın..';
                                        Str[3] := '[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum.' + Chr(13) + 'Sonraki oyunlarda görüşmek dileğiyle..';
                                        Str[4] := '[+] İyi iş çıkardın ' + Arg + Chr(13) + 'Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \''_''/';
                                        Payload := Str[Random(5)]
                                    end
                                    else
                                    begin
                                        if Type_variable = 'swin' then
                                        begin
                                            Str[0] := '[⁂] İnanılmaz.. Tek Kelime İle Şahane!';
                                            Str[1] := '[⁂] Ne.. Bu kadar hızlı yenilemem..';
                                            Str[2] := '[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim..';
                                            Str[3] := '[⁂] Sen..? Nasıl..? Hile mi yapıyosun??';
                                            Str[4] := '[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?';
                                            Payload := Str[Random(5)]
                                        end
                                        else
                                        begin
                                            if Type_variable = 'lose' then
                                            begin
                                                Str[0] := '[-] Üzgünüm, Oyunu Kaybettiniz.';
                                                Str[1] := '[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın..';
                                                Str[2] := '[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin.';
                                                Str[3] := '[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın.';
                                                Str[4] := '[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez..';
                                                Payload := Str[Random(5)]
                                            end
                                            else
                                            begin
                                                if Type_variable = 'cold' then
                                                begin
                                                    Str[0] := '↘                ↙' + Chr(13) + ' Soğuk' + Chr(13) + '↗                ↖';
                                                    Payload := Str[0]
                                                end
                                                else
                                                begin
                                                    if Type_variable = 'warm' then
                                                    begin
                                                        Str[0] := '↘                ↙' + Chr(13) + '  Ilık' + Chr(13) + '↗                ↖';
                                                        Payload := Str[0]
                                                    end
                                                    else
                                                    begin
                                                        if Type_variable = 'hot' then
                                                        begin
                                                            Str[0] := '↘                ↙' + Chr(13) + ' Sıcak' + Chr(13) + '↗                ↖';
                                                            Payload := Str[0]
                                                        end
                                                        else
                                                        begin
                                                            if Type_variable = 'info' then
                                                            begin
                                                                Str[0] := 'Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır.';
                                                                Str[1] := 'Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir.';
                                                                Str[2] := 'İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır.';
                                                                Str[3] := 'Ardından oyun hakkında bilgilendirme mesajı gönderilir.';
                                                                Str[4] := 'Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki ''Ana'' yazan yere basıp ''logger'' seçmelisiniz.';
                                                                Str[5] := 'Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor.';
                                                                Str[6] := 'Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir.';
                                                                Str[7] := 'Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir.';
                                                                Str[8] := 'Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır.';
                                                                Str[9] := 'Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur.';
                                                                Payload := Str[StrToInt(Arg)]
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
    end;
    
    { prototip => plugins(<str>, <str>) }
    { Örnek: }
    { plugins("ask name", " ") }
    { plugins("after name", "İsim") }
    
    Plugins := Payload
end;

function Rand (Type_variable : boolean) : integer;
var
    Payload, Opt, Num : integer;
    İndex : array of integer;

begin
    SetLength(İndex, 101);
    
    { 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır. }
    {  }
    { var dizin = ["bir", "iki", "üç"] }
    { return dizin[0]     // "bir" }
    if Not Type_variable then
    begin
        Payload := Random(101);
        
        { Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu. }
        { Değişken kontrolü için; }
        { rand(true) }
        {  }
        { Direk işlem için; }
        { rand(false) }
        {  }
        { kullanın. }
        if Payload = 0 then
        begin
            Rand(false)
        end
    end
    else
    begin
        
        { Bu kısım değişken kontrolü yapmak isteyenler içindir. }
        Num := 0;
        repeat
        begin
            İndex[Num] := Num;
            Num := Trunc(Num + 1)
        end
        until not (Num < 101);
        
        { do döngüsü kullanılır. }
        Opt := Random(101);
        Payload := İndex[Opt];
        if Payload = 0 then
        begin
            Rand(true)
        end
    end;
    
    { İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır. }
    { Çıkış int (Tamsayı) olarak döner. }
    
    Rand := Payload
end;

{ Main }
var
    Sync, Find : boolean;
    Name : string;
    Mode, Number : integer;
    İndex, İndex2, Think : integer;
    İndex, İndex2, Think : integer;

begin
    Logger('str', Plugins('ask name', ''));
    Delay(2);
    ReadLn(Name);
    Namecorrection(Name);
    Delay(2);
    
    { İsim Alma Kısmı Tamamlandı }
    Logger('str', Plugins('after name', Name));
    Delay(9);
    Logger('str', Plugins('game mode', ''));
    ReadLn(Mode);
    
    { Oyun Modu Başarıyla Seçildi }
    if (Mode = 1) or (Mode = 2) then
    begin
        if Mode = 1 then
        begin
            
            { Kolay Oyun Modu }
            İndex := 0;
            İndex2 := 0;
            Sync := true;
            Number := Rand(true);
            Logger('str', Plugins('get num', Name));
            Delay(2);
            
            { Sayı Belirlendi }
            while Sync do
            begin
                if İndex = 10 then
                begin
                    Find := false;
                    Sync := false;
                    
                    { 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat }
                end
                else
                begin
                    İndex2 := Trunc(İndex2 + 1);
                    İndex := Trunc(İndex + 1);
                    if İndex = 1 then
                    begin
                        
                        { İlk başlama mesajı }
                        Logger('str', Plugins('think', Name))
                    end
                    else
                    begin
                        
                        { Sonraki başlama mesajları }
                        if İndex = 10 then
                        begin
                            
                            { Son tahmin hakkı için bilgilendirme mesajı }
                            Logger('str', Plugins('sthink', Name));
                            Delay(3.5)
                        end
                        else
                        begin
                            
                            { Yanlış tahminler için bilgilendirme mesajı }
                            Logger('str', Plugins('wthink', Name))
                        end
                    end;
                    ReadLn(Think);
                    if Think = Number then
                    begin
                        
                        { Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat. }
                        Find := true;
                        Sync := false
                    end
                    else
                    begin
                        Delay(1);
                        if İndex = 10 then
                        begin
                        end
                        else
                        begin
                            if Think > Number then
                            begin
                                
                                { Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön }
                                if Think - Number > 25 then
                                begin
                                    
                                    { Tahmin, sayıdan uzak ise bunu gönder }
                                    Logger('str', Plugins('cold', ''))
                                end
                                else
                                begin
                                    if Think - Number > 15 then
                                    begin
                                        
                                        { Tahmin, sayıya biraz yakın ise bunu gönder }
                                        Logger('str', Plugins('warm', ''))
                                    end
                                    else
                                    begin
                                        
                                        { Tahmin, sayıya çok yakın ise bunu gönder }
                                        Logger('str', Plugins('hot', ''))
                                    end
                                end
                            end
                            else
                            begin
                                
                                { Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön }
                                if Number - Think > 25 then
                                begin
                                    
                                    { Tahmin, sayıdan uzak ise bunu gönder }
                                    Logger('str', Plugins('cold', ''))
                                end
                                else
                                begin
                                    if Number - Think > 15 then
                                    begin
                                        
                                        { Tahmin, sayıya biraz yakın ise bunu gönder }
                                        Logger('str', Plugins('warm', ''))
                                    end
                                    else
                                    begin
                                        
                                        { Tahmin, sayıya çok yakın ise bunu gönder }
                                        Logger('str', Plugins('hot', ''))
                                    end
                                end
                            end
                        end
                    end
                end
            end;
            if Find then
            begin
                
                { Oyun Kazanıldığında Buraya Dön }
                if İndex2 < 4 then
                begin
                    
                    { Sayı hemen tahmin edilirse ek mesaj gönder }
                    Logger('str', Plugins('swin', Name));
                    Delay(1);
                    Logger('str', Plugins('win', Name));
                    Delay(2);
                    Logger('str', FloatToStr(İndex2) + '. Denemede Oyunu Kazandınız!')
                end
                else
                begin
                    
                    { Klasik tebrik mesajı }
                    Logger('str', Plugins('win', Name));
                    Delay(2);
                    Logger('str', FloatToStr(İndex2) + '. Denemede Oyunu Kazandınız!')
                end
            end
            else
            begin
                
                { Oyun Kaybedildiğinde Buraya Dön }
                Logger('str', Plugins('lose', Name));
                Delay(2);
                Logger('str', 'Bir kez daha oynamak için 1 yazman yeterli.');
                ReadLn(Name);
                if Name = '1' then
                begin
                    
                    { Program kapanmadan bir kez daha oynama hakkı verir. }
                    Main()
                end
            end
        end
        else
        begin
            
            { Normal Oyun Modu }
            İndex := 0;
            İndex2 := 0;
            Sync := true;
            Number := Rand(false);
            Logger('str', Plugins('get num', Name));
            Delay(2);
            
            { Sayı Belirlendi }
            while Sync do
            begin
                if İndex = 10 then
                begin
                    Find := false;
                    Sync := false;
                    
                    { 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat }
                end
                else
                begin
                    İndex2 := Trunc(İndex2 + 1);
                    İndex := Trunc(İndex + 1);
                    if İndex = 1 then
                    begin
                        
                        { İlk başlama mesajı }
                        Logger('str', Plugins('think', Name))
                    end
                    else
                    begin
                        
                        { Sonraki başlama mesajları }
                        if İndex = 10 then
                        begin
                            
                            { Son tahmin hakkı için bilgilendirme mesajı }
                            Logger('str', Plugins('sthink', Name));
                            Delay(3.5)
                        end
                        else
                        begin
                            
                            { Yanlış tahminler için bilgilendirme mesajı }
                            Logger('str', Plugins('wthink', Name))
                        end
                    end;
                    ReadLn(Think);
                    if Think = Number then
                    begin
                        
                        { Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat. }
                        Find := true;
                        Sync := false
                    end
                    else
                    begin
                        
                        { Tahmin Yanlış İse Döngüyü Yeniden Başlat }
                    end
                end
            end;
            if Find then
            begin
                
                { Oyun Kazanıldığında Buraya Dön }
                if İndex2 < 4 then
                begin
                    
                    { Sayı hemen tahmin edilirse ek mesaj gönder }
                    Logger('str', Plugins('swin', Name));
                    Delay(1);
                    Logger('str', Plugins('win', Name));
                    Delay(2);
                    Logger('str', FloatToStr(İndex2) + '. Denemede Oyunu Kazandınız!')
                end
                else
                begin
                    
                    { Klasik tebrik mesajı }
                    Logger('str', Plugins('win', Name));
                    Delay(2);
                    Logger('str', FloatToStr(İndex2) + '. Denemede Oyunu Kazandınız!')
                end
            end
            else
            begin
                
                { Oyun Kaybedildiğinde Buraya Dön }
                Logger('str', Plugins('lose', Name));
                Delay(2);
                Logger('str', 'Bir kez daha oynamak için 1 yazman yeterli.');
                ReadLn(Name);
                if Name = '1' then
                begin
                    
                    { Program kapanmadan bir kez daha oynama hakkı verir. }
                    Main()
                end
            end
        end
    end
    else
    begin
        if Mode = 3 then
        begin
            
            { Bilgilendirme Mesajı }
            Number := 0;
            repeat
            begin
                Logger('str', Plugins('info', FloatToStr(Number)));
                Delay(4);
                Number := Trunc(Number + 1)
            end
            until not (Number <> 10);
            
            { do Dögüsü kullanmak en iyi seçenek olacaktır }
        end
        else
        begin
            Logger('str', Plugins('wmode', ''))
        end
    end
end.
