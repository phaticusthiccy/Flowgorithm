program MyProgram;
uses Math, SysUtils;

{ Headers }
function Delay (Sn : integer) : boolean; forward;

function Delay (Sn : integer) : boolean;
var
    Sonuc : boolean;
    Ms : integer;
    n : integer;

begin
    Ms := Trunc(Sn * 30000);
    n := 0;
    while n <> Ms do
    begin
        n := Trunc(n + 1)
    end;
    Sonuc := true;
    
    Delay := Sonuc
end;

{ Main }
var
    Sayı, Sonuc, Giris, Giris2, Tempsonuc : integer;
    Debug : string;
    Af1 : integer;
    Af2 : integer;

begin
    Sayı := 1;
    Sonuc := 0;
    WriteLn('2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ');
    ReadLn(Giris);
    Delay(1);
    WriteLn('2. Sayıyı Belirleyin: ');
    ReadLn(Giris2);
    Delay(1);
    WriteLn('Programın İşleyişini Görmek İçin ''Y'', Direk Sonucu Görmek İçin ''N'' yazın.');
    ReadLn(Debug);
    if Giris > Giris2 then
    begin
        Af1 := Giris;
        Af2 := Giris2;
        Giris := Af2;
        Giris2 := Af1
    end
    else
    begin
        
        { İlk giriş, 2. girişten küçük ise program çalışmaz. }
        {  }
        { Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir. }
    end;
    For Sayı := Giris to Giris2 do
    begin
        if Sayı mod 2 = 1 then
        begin
            Tempsonuc := Sonuc;
            Sonuc := Trunc(Sonuc + Sayı);
            if (Debug = 'n') or (Debug = 'N') then
            begin
                
                { es geç }
            end
            else
            begin
                WriteLn(FloatToStr(Tempsonuc) + '+' + FloatToStr(Sayı) + ': ' + FloatToStr(Sonuc))
            end
        end
    end;
    WriteLn('Sonuc: ' + FloatToStr(Sonuc))
end.
