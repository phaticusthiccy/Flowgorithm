program MyProgram;
uses Math, SysUtils;

{ Headers }
function Fonksiyon (Deger : real, a : real, b : real) : string; forward;
function Formül (a : integer, b : integer, c : integer) : real; forward;

function Fonksiyon (Deger : real, a : real, b : real) : string;
var
    Sonuc : string;

begin
    if Deger < 0 then
    begin
        Sonuc := 'Kök Bulunamadı'
    end
    else
    begin
        if Deger = 0 then
        begin
            Sonuc := '1. ve 2. Kökler Eşittir. Sonuç: ' + FloatToStr(-b / 2 * a)
        end
        else
        begin
            Sonuc := 'pass'
        end
    end;
    
    Fonksiyon := Sonuc
end;

function Formül (a : integer, b : integer, c : integer) : real;
var
    Sonuc : real;

begin
    Sonuc := b * b - 4 * a * c;
    
    Formül := Sonuc
end;

{ Main }
var
    Fsayı : array of real;
    İslem : string;
    Text : string;

begin
    SetLength(Fsayı, 7);
    
    { Dizi Kullanımı String Methoda Göre Daha Hızlıdır. }
    { // var fsayı = new Array() }
    WriteLn('''a'' Sayısının Değerini Girin: ');
    ReadLn(Fsayı[0]);
    WriteLn('''b'' Sayısının Değerini Girin: ');
    ReadLn(Fsayı[1]);
    WriteLn('''c'' Sayısının Değerini Girin: ');
    ReadLn(Fsayı[2]);
    Fsayı[3] := Formül(Trunc(Fsayı[0]), Trunc(Fsayı[1]), Trunc(Fsayı[2]));
    
    { Delta Formülü }
    { // formül(a = reel, b = ree, c = ree) }
    WriteLn('Program İşleyişini Görmek İster misiniz? (Y yada N): ');
    ReadLn(İslem);
    if (İslem = 'y') or (İslem = 'Y') then
    begin
        
        { "Görünür İşlemler" }
        if Fonksiyon(Fsayı[3], Fsayı[0], Fsayı[1]) = 'pass' then
        begin
            
            { 2 kök içeren sonuçlar buraya yazılır. }
            { Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir. }
            { Sonuç için Gerekli Formül }
            {  }
            { // fonksiyon(delta = reel, a = reel, b = reel) }
            { // return str }
            WriteLn('Kök 1: ' + FloatToStr((-Fsayı[1] + Sqrt(Fsayı[3])) / (2 * Fsayı[0])));
            WriteLn('Kök 2: ' + FloatToStr((-Fsayı[1] - Sqrt(Fsayı[3])) / (2 * Fsayı[0])));
            
            { Kök formülleri yazıldı. }
            WriteLn('Formüller: ' + Chr(13) + Chr(13) + 'Delta Hesabı' + Chr(13) + 'Delta = ' + FloatToStr(Fsayı[1]) + '^2-4*' + FloatToStr(Fsayı[0]) + '*' + FloatToStr(Fsayı[2]) + Chr(13) + Chr(13) + '====================' + Chr(13) + Chr(13) + 'X1 İçin:' + Chr(13) + '(-' + FloatToStr(Fsayı[1]) + '+(' + FloatToStr(Fsayı[3]) + '^(1/2))) / (2*' + FloatToStr(Fsayı[0]) + ')' + Chr(13) + Chr(13) + 'X2 İçin:' + Chr(13) + '(-' + FloatToStr(Fsayı[1]) + '-(' + FloatToStr(Fsayı[3]) + '^(1/2))) / (2*' + FloatToStr(Fsayı[0]) + ')')
        end
        else
        begin
            Text := Fonksiyon(Fsayı[3], Fsayı[0], Fsayı[1]);
            
            { İkincil bir fonksiyon ata. }
            { İlk işlem sonuç verirse buraya dön. }
            if Text = 'Kök Bulunamadı' then
            begin
                WriteLn(Text + Chr(13) + Chr(13) + 'Delta 0''a eşittir. Bu yüzden kök yoktur.')
            end
            else
            begin
                WriteLn(Text + Chr(13) + Chr(13) + 'Formül = -' + FloatToStr(Fsayı[1]) + '/ 2*' + FloatToStr(Fsayı[0]))
            end
        end
    end
    else
    begin
        
        { "Kapalı İşlemler" }
        if Fonksiyon(Fsayı[3], Fsayı[0], Fsayı[1]) = 'pass' then
        begin
            WriteLn('Kök 1: ' + FloatToStr((-Fsayı[1] + Sqrt(Fsayı[3])) / (2 * Fsayı[0])));
            WriteLn('Kök 2: ' + FloatToStr((-Fsayı[1] - Sqrt(Fsayı[3])) / (2 * Fsayı[0])))
        end
        else
        begin
            WriteLn(Fonksiyon(Fsayı[3], Fsayı[0], Fsayı[1]))
        end
    end;
    
    { Programı Kapat. (return True) }
end.
