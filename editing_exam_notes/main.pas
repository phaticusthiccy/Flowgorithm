program MyProgram;
uses Math, SysUtils;

{ Headers }
function Delay (Sn : integer) : boolean; forward;
function Puanekle (Puan : integer) : string; forward;
function Puaneklesoru (No : string, Eskinot : integer) : integer; forward;
function Yardımloop (Sayı : integer) : integer; forward;
function Yardımloop2 (Sayı : integer) : integer; forward;

function Delay (Sn : integer) : boolean;
var
    Sonuc : boolean;
    Ms : integer;
    n : integer;

begin
    { Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız. }
    Ms := Trunc(Sn * 33);
    n := 0;
    while n <> Ms do
    begin
        n := Trunc(n + 1)
    end;
    Sonuc := true;
    
    { Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır. }
    { boolen test }
    { test = delay(200) }
    { çıktı test  // true }
    
    Delay := Sonuc
end;

function Puanekle (Puan : integer) : string;
var
    Sonuc : string;
    Ekpuan : array of integer;
    İndex, İndex2 : integer;
    Sync : boolean;

begin
    SetLength(Ekpuan, 20);
    
    { while döngüsü için }
    Sync := true;
    İndex := 0;
    if Puan > 89 then
    begin
        Sonuc := 'pass';
        
        { 90 ve üstü notlar için puan ekleme olmaz. }
    end
    else
    begin
        if Puan > 69 then
        begin
            İndex2 := 5;
            while Sync do
            begin
                if İndex = 6 then
                begin
                    Sync := false
                end
                else
                begin
                    Ekpuan[İndex] := İndex2;
                    İndex := Trunc(İndex + 1);
                    İndex2 := Trunc(İndex2 + 1)
                end
            end;
            Sonuc := FloatToStr(Ekpuan[Random(6)]);
            
            { Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle. }
        end
        else
        begin
            if Puan > 49 then
            begin
                İndex2 := 10;
                while Sync do
                begin
                    if İndex = 9 then
                    begin
                        Sync := false
                    end
                    else
                    begin
                        Ekpuan[İndex] := İndex2;
                        İndex := Trunc(İndex + 1);
                        İndex2 := Trunc(İndex2 + 1)
                    end
                end;
                Sonuc := FloatToStr(Ekpuan[Random(9)]);
                
                { Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle. }
            end
            else
            begin
                if Puan > 29 then
                begin
                    İndex2 := 20;
                    while Sync do
                    begin
                        if İndex = 10 then
                        begin
                            Sync := false
                        end
                        else
                        begin
                            Ekpuan[İndex] := İndex2;
                            İndex := Trunc(İndex + 1);
                            İndex2 := Trunc(İndex2 + 1)
                        end
                    end;
                    Sonuc := FloatToStr(Ekpuan[Random(10)]);
                    
                    { Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle. }
                end
                else
                begin
                    İndex2 := 30;
                    while Sync do
                    begin
                        if İndex = 11 then
                        begin
                            Sync := false
                        end
                        else
                        begin
                            Ekpuan[İndex] := İndex2;
                            İndex := Trunc(İndex + 1);
                            İndex2 := Trunc(İndex2 + 1)
                        end
                    end;
                    Sonuc := FloatToStr(Ekpuan[Random(11)]);
                    
                    { Not 30'dan küçük ise, 30 ila 40 arasında puan ekle. }
                end
            end
        end
    end;
    
    { String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek: }
    { var sayı = 0.65   // Javascript }
    { sayı = 0.65          // Python }
    { local sayı = 0.65          // Lua }
    { int sayı = 0.65     // C }
    
    Puanekle := Sonuc
end;

function Puaneklesoru (No : string, Eskinot : integer) : integer;
var
    Sonuc : integer;

begin
    WriteLn(No + '. Öğrenci İçin Kaç Puan Eklemek İstersiniz: ' + Chr(13) + Chr(13) + 'Öğrencinin Puanı: ' + FloatToStr(Eskinot));
    ReadLn(Sonuc);
    
    Puaneklesoru := Sonuc
end;

function Yardımloop (Sayı : integer) : integer;
var
    Sonuc : integer;

begin
    if (Sayı = 1) or (Sayı = 2) then
    begin
    end
    else
    begin
        WriteLn('Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın.' + Chr(13) + 'Yeniden Başlatılıyor..');
        Delay(1000);
        WriteLn('1) Otomatik Mod Hakkında Yardım' + Chr(13) + '2) Manuel Mod Hakkında Yardım');
        ReadLn(Sayı);
        Yardımloop(Sayı)
    end;
    
    { Yardım Modülü İçin }
    { Yanlış değer girildiğinde baştan başlatır }
    Sonuc := Sayı;
    
    Yardımloop := Sonuc
end;

function Yardımloop2 (Sayı : integer) : integer;
var
    Sonuc : integer;

begin
    if (Sayı = 1) or (Sayı = 2) or (Sayı = 3) then
    begin
    end
    else
    begin
        WriteLn('Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın.' + Chr(13) + 'Yeniden Başlatılıyor..');
        Delay(1000);
        WriteLn('1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım' + Chr(13) + '2) Manuel Puan Ekleme Hakkında Yardım' + Chr(13) + '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım');
        ReadLn(Sayı);
        Yardımloop2(Sayı)
    end;
    Sonuc := Sayı;
    
    Yardımloop2 := Sonuc
end;

{ Main }
var
    Sync : boolean;
    Secim : string;
    İndex, İndex2 : integer;
    Notlar : array of integer;
    Eskinotlar : array of integer;
    Otonot : array of integer;
    Otoeklenennot : array of string;
    Secim2 : integer;
    Devam : boolean;
    Cikti : string;
    Sayı1, Sayı2, Sayı3, Sayı4, Sayı5 : integer;
    Soru1, Soru2, Soru3, Soru4, Soru5 : integer;
    Soruarray : array of integer;
    Sonsayılar : array of integer;
    Helpnum, Helpnum2 : integer;
    Loop, Loop2 : integer;

begin
    randomize; {Prepare the random number generator}

    Sync := true;
    İndex := 0;
    İndex2 := 0;
    SetLength(Notlar, 5);
    SetLength(Eskinotlar, 5);
    SetLength(Otonot, 20);
    SetLength(Otoeklenennot, 15);
    
    WriteLn('Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?' + Chr(13) + Chr(13) + 'Otomatik için: ''O''' + Chr(13) + 'Manuel için: ''M''' + Chr(13) + 'Yazın' + Chr(13) + Chr(13) + 'Arayüz Hakkında Bilgi Almak İçin İse ''A'' Yazın');
    ReadLn(Secim);
    if (Secim = 'O') or (Secim = 'o') then
    begin
        while Sync do
        begin
            
            { Bu döngü notları belirler. }
            if İndex = 5 then
            begin
                Sync := false;
                
                { index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır. }
            end
            else
            begin
                İndex := Trunc(İndex + 1);
                Notlar[İndex2] := Random(80);
                
                { Random sayı belirle }
                İndex2 := Trunc(İndex2 + 1);
                
                { 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet }
            end
        end;
        Sync := true;
        İndex := 0;
        İndex2 := 0;
        
        { Değişkenleri sıfırlayalım }
        while Sync do
        begin
            
            { Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler. }
            if İndex = 5 then
            begin
                Sync := false
            end
            else
            begin
                İndex := Trunc(İndex + 1);
                Eskinotlar[İndex2] := Notlar[İndex2];
                Notlar[İndex2] := Trunc(Notlar[İndex2] + 20);
                İndex2 := Trunc(İndex2 + 1)
            end
        end;
        Sync := true;
        İndex := 0;
        İndex2 := 0;
        
        { Değişkenleri sıfırlayalım }
        WriteLn('Yeni Notlar:');
        while Sync do
        begin
            
            { Bu döngü eski ve yeni notları bir arada yazdırır. }
            if İndex = 5 then
            begin
                Sync := false;
                
                { Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım }
            end
            else
            begin
                İndex := Trunc(İndex + 1);
                WriteLn(FloatToStr(İndex) + '. Öğrencinin; ' + Chr(13) + Chr(13) + 'Eski Not: ' + FloatToStr(Eskinotlar[İndex2]) + Chr(13) + 'Yeni Not: ' + FloatToStr(Notlar[İndex2]));
                Delay(500);
                
                { 500 Milisaniyelik Gecikme }
                İndex2 := Trunc(İndex2 + 1)
            end
        end
    end
    else
    begin
        if (Secim = 'M') or (Secim = 'm') then
        begin
            WriteLn('1. Öğrencinin Notunu Giriniz: ');
            ReadLn(Notlar[0]);
            WriteLn('2. Öğrencinin Notunu Giriniz: ');
            ReadLn(Notlar[1]);
            WriteLn('3. Öğrencinin Notunu Giriniz: ');
            ReadLn(Notlar[2]);
            WriteLn('4. Öğrencinin Notunu Giriniz: ');
            ReadLn(Notlar[3]);
            WriteLn('5. Öğrencinin Notunu Giriniz: ');
            ReadLn(Notlar[4]);
            Delay(800);
            Devam := true;
            İndex := 0;
            İndex2 := 0;
            while Sync do
            begin
                if İndex = 5 then
                begin
                    Sync := false
                end
                else
                begin
                    İndex := Trunc(İndex + 1);
                    if Notlar[İndex2] > 100 then
                    begin
                        Sync := false;
                        Devam := false
                    end
                    else
                    begin
                        if Notlar[İndex2] < 0 then
                        begin
                            Sync := false;
                            Devam := false
                        end
                        else
                        begin
                            İndex2 := Trunc(İndex2 + 1)
                        end
                    end
                end
            end;
            if Not Devam then
            begin
                WriteLn('Notlar 100 ve 0 Arasında Olmalıdır.')
            end
            else
            begin
                WriteLn('Size 3 Seçenek Sunuyoruz:' + Chr(13) + Chr(13) + '1) Herkesin Notuna +20 Puan Ekle' + Chr(13) + '2) Herkesin Notuna Eklenecek Puanı Manuel Gir' + Chr(13) + '3) Sistem''in Kendi Not Ekleme Aracını Kullan');
                ReadLn(Secim2);
                if Secim2 = 3 then
                begin
                    Delay(59);
                    İndex := 0;
                    İndex2 := 0;
                    Sync := true;
                    while Sync do
                    begin
                        if İndex = 5 then
                        begin
                            Sync := false
                        end
                        else
                        begin
                            İndex := Trunc(İndex + 1);
                            Otoeklenennot[İndex2] := Puanekle(Notlar[İndex2]);
                            
                            { Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir. }
                            Delay(59);
                            if Otoeklenennot[İndex2] = 'pass' then
                            begin
                                Otoeklenennot[İndex2] := '0'
                            end
                            else
                            begin
                                Otonot[İndex2] := Trunc(Notlar[İndex2] + StrToInt(Puanekle(Notlar[İndex2])))
                            end;
                            İndex2 := Trunc(İndex2 + 1)
                        end
                    end;
                    İndex := 0;
                    İndex2 := 0;
                    Sync := true;
                    while Sync do
                    begin
                        if İndex = 5 then
                        begin
                            Sync := false
                        end
                        else
                        begin
                            İndex := Trunc(İndex + 1);
                            if Otoeklenennot[İndex2] = '0' then
                            begin
                                Cikti := FloatToStr(İndex) + '. Öğrencinin; ' + Chr(13) + Chr(13) + 'Eski Not: ' + FloatToStr(Notlar[İndex2]) + Chr(13) + 'Yeni Not: ' + FloatToStr(Notlar[İndex2]) + Chr(13) + 'Ek Puan Yok. Not Yeterli.'
                            end
                            else
                            begin
                                Cikti := FloatToStr(İndex) + '. Öğrencinin; ' + Chr(13) + Chr(13) + 'Eski Not: ' + FloatToStr(Notlar[İndex2]) + Chr(13) + 'Yeni Not: ' + FloatToStr((StrToInt(Otoeklenennot[İndex2]) + Notlar[İndex2])) + Chr(13) + 'Eklenen Puan: ' + Otoeklenennot[İndex2]
                            end;
                            WriteLn(Cikti);
                            Delay(500);
                            İndex2 := Trunc(İndex2 + 1)
                        end
                    end
                end
                else
                begin
                    if Secim2 = 2 then
                    begin
                        İndex := 0;
                        İndex2 := 0;
                        Sync := false;
                        
                        { Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez. }
                        { Yaha henüz ben keşfedemedim :p }
                        Delay(230);
                        Soru1 := Puaneklesoru('1', Notlar[İndex2]);
                        İndex2 := Trunc(İndex2 + 1);
                        Soru2 := Puaneklesoru('2', Notlar[İndex2]);
                        İndex2 := Trunc(İndex2 + 1);
                        Soru3 := Puaneklesoru('3', Notlar[İndex2]);
                        İndex2 := Trunc(İndex2 + 1);
                        Soru4 := Puaneklesoru('4', Notlar[İndex2]);
                        İndex2 := Trunc(İndex2 + 1);
                        Soru5 := Puaneklesoru('5', Notlar[İndex2]);
                        Delay(600);
                        Sync := true;
                        SetLength(Soruarray, 5);
                        
                        Soruarray[0] := Soru1;
                        Soruarray[1] := Soru2;
                        Soruarray[2] := Soru3;
                        Soruarray[3] := Soru4;
                        Soruarray[4] := Soru5;
                        if (Soru1 > 100) and (Soru1 < 0) or ((Soru2 > 100) and (Soru2 < 0)) or ((Soru3 > 100) and (Soru3 < 0)) or ((Soru4 > 100) and (Soru4 < 0)) or ((Soru5 > 100) and (Soru5 < 0)) then
                        begin
                            WriteLn('Notların Son Hali 100 ve 0 Arasında Olmalıdır.')
                        end
                        else
                        begin
                            İndex2 := 0;
                            Sayı1 := Trunc(Soru1 + Notlar[İndex2]);
                            İndex2 := Trunc(İndex2 + 1);
                            Sayı2 := Trunc(Soru2 + Notlar[İndex2]);
                            İndex2 := Trunc(İndex2 + 1);
                            Sayı3 := Trunc(Soru3 + Notlar[İndex2]);
                            İndex2 := Trunc(İndex2 + 1);
                            Sayı4 := Trunc(Soru4 + Notlar[İndex2]);
                            İndex2 := Trunc(İndex2 + 1);
                            Sayı5 := Trunc(Soru5 + Notlar[İndex2]);
                            İndex2 := 0;
                            İndex := 0;
                            SetLength(Sonsayılar, 5);
                            
                            Sonsayılar[0] := Sayı1;
                            Sonsayılar[1] := Sayı2;
                            Sonsayılar[2] := Sayı3;
                            Sonsayılar[3] := Sayı4;
                            Sonsayılar[4] := Sayı5;
                            while Sync do
                            begin
                                if İndex = 5 then
                                begin
                                    Sync := false
                                end
                                else
                                begin
                                    İndex := Trunc(İndex + 1);
                                    WriteLn(FloatToStr(İndex) + '. Öğrencinin; ' + Chr(13) + Chr(13) + 'Eski Not: ' + FloatToStr(Notlar[İndex2]) + Chr(13) + 'Yeni Not: ' + FloatToStr(Sonsayılar[İndex2]) + Chr(13) + 'Eklenen Puan: ' + FloatToStr(Soruarray[İndex2]));
                                    Delay(270);
                                    İndex2 := Trunc(İndex2 + 1)
                                end
                            end
                        end
                    end
                    else
                    begin
                        if Secim2 = 1 then
                        begin
                            while Sync do
                            begin
                                
                                { Bu döngü notları belirler. }
                                if İndex = 5 then
                                begin
                                    Sync := false;
                                    
                                    { index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır. }
                                end
                                else
                                begin
                                    İndex := Trunc(İndex + 1);
                                    Notlar[İndex2] := Random(80);
                                    
                                    { Random sayı belirle }
                                    İndex2 := Trunc(İndex2 + 1);
                                    
                                    { 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet }
                                end
                            end;
                            Sync := true;
                            İndex := 0;
                            İndex2 := 0;
                            
                            { Değişkenleri sıfırlayalım }
                            while Sync do
                            begin
                                
                                { Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler. }
                                if İndex = 5 then
                                begin
                                    Sync := false
                                end
                                else
                                begin
                                    İndex := Trunc(İndex + 1);
                                    Eskinotlar[İndex2] := Notlar[İndex2];
                                    Notlar[İndex2] := Trunc(Notlar[İndex2] + 20);
                                    İndex2 := Trunc(İndex2 + 1)
                                end
                            end;
                            Sync := true;
                            İndex := 0;
                            İndex2 := 0;
                            
                            { Değişkenleri sıfırlayalım }
                            WriteLn('Yeni Notlar:');
                            while Sync do
                            begin
                                
                                { Bu döngü eski ve yeni notları bir arada yazdırır. }
                                if İndex = 5 then
                                begin
                                    Sync := false;
                                    
                                    { Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım }
                                end
                                else
                                begin
                                    İndex := Trunc(İndex + 1);
                                    if Notlar[İndex2] > 100 then
                                    begin
                                        Notlar[İndex2] := 100;
                                        WriteLn(FloatToStr(İndex) + '. Öğrencinin; ' + Chr(13) + Chr(13) + 'Eski Not: ' + FloatToStr(Eskinotlar[İndex2]) + Chr(13) + 'Yeni Not: ' + FloatToStr(Notlar[İndex2]))
                                    end
                                    else
                                    begin
                                        WriteLn(FloatToStr(İndex) + '. Öğrencinin; ' + Chr(13) + Chr(13) + 'Eski Not: ' + FloatToStr(Eskinotlar[İndex2]) + Chr(13) + 'Yeni Not: ' + FloatToStr(Notlar[İndex2]))
                                    end;
                                    
                                    { 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır. }
                                    Delay(500);
                                    
                                    { 500 Milisaniyelik Gecikme }
                                    İndex2 := Trunc(İndex2 + 1)
                                end
                            end
                        end
                        else
                        begin
                            WriteLn('Lütfen 1, 2 veya 3 yazınız.');
                            Delay(1000);
                            WriteLn('Program Kapatılıyor..');
                            İndex := 3;
                            while Sync do
                            begin
                                if İndex = 0 then
                                begin
                                    Sync := false
                                end
                                else
                                begin
                                    Delay(1000);
                                    WriteLn(FloatToStr(İndex) + '..');
                                    İndex := Trunc(İndex - 1)
                                end;
                                
                                { Programın Kapatılması İçin Sayaç Oluştur }
                            end
                        end
                    end
                end
            end
        end
        else
        begin
            if (Secim = 'a') or (Secim = 'A') then
            begin
                WriteLn('1) Otomatik Mod Hakkında Yardım' + Chr(13) + '2) Manuel Mod Hakkında Yardım');
                ReadLn(Helpnum);
                Delay(200);
                
                { Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar. }
                Loop := Yardımloop(Helpnum);
                Delay(200);
                if Loop = 1 then
                begin
                    WriteLn('Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.');
                    Delay(7800);
                    WriteLn('Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.');
                    Delay(9000);
                    WriteLn('Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.')
                end
                else
                begin
                    WriteLn('1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım' + Chr(13) + '2) Manuel Puan Ekleme Hakkında Yardım' + Chr(13) + '3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım');
                    ReadLn(Helpnum2);
                    Delay(200);
                    Loop2 := Yardımloop2(Helpnum2);
                    Delay(200);
                    if Loop2 = 1 then
                    begin
                        WriteLn('Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.')
                    end
                    else
                    begin
                        if Loop2 = 2 then
                        begin
                            WriteLn('Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.');
                            Delay(7800);
                            WriteLn('Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.')
                        end
                        else
                        begin
                            WriteLn('Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.');
                            Delay(4500);
                            WriteLn('Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.');
                            Delay(4500);
                            WriteLn('Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.');
                            Delay(8000);
                            WriteLn('Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt''a (ekrana) yazdırılır.')
                        end
                    end
                end
            end
            else
            begin
                WriteLn('Lütfen Sadece ''M'' veya ''O'' Harflerini Giriniz!')
            end
        end
    end;
    
    { 2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır. }
    {  }
    { Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir. }
    { Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer. }
    {  }
    { 1. İşlem: Seçilen Notların Hepine 20 Puan Ekle }
    { 2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler }
    { 3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar. }
    {  }
    { 3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir. }
end.
