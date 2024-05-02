program MyProgram;
uses Math, SysUtils;

{ Headers }
function Delay (Sn : integer) : boolean; forward;
function Vki (Kilo : integer, Boy : integer) : string; forward;

function Delay (Sn : integer) : boolean;
var
    Sonuc : boolean;
    Ms : integer;
    n : integer;

begin
    Ms := Trunc(Sn * 33333);
    n := 0;
    while n <> Ms do
    begin
        n := Trunc(n + 1)
    end;
    Sonuc := true;
    
    Delay := Sonuc
end;

function Vki (Kilo : integer, Boy : integer) : string;
var
    Sonuc : string;
    İndex : integer;

begin
    İndex := Trunc(Kilo / (Boy * Boy));
    if İndex < 18 then
    begin
        Sonuc := 'zayıf'
    end
    else
    begin
        if İndex < 25 then
        begin
            Sonuc := 'normal'
        end
        else
        begin
            if İndex < 30 then
            begin
                Sonuc := 'kilolu'
            end
            else
            begin
                if İndex < 35 then
                begin
                    Sonuc := '1. obez'
                end
                else
                begin
                    if İndex < 40 then
                    begin
                        Sonuc := '2. obez'
                    end
                    else
                    begin
                        Sonuc := '3. obez'
                    end
                end
            end
        end
    end;
    
    Vki := Sonuc
end;

{ Main }
var
    Kilo : integer;
    Boy : real;
    Tab : string;
    Cümle : string;

begin
    WriteLn('Lütfen Kilonuzu Giriniz:   (Ex: 69)  ');
    ReadLn(Kilo);
    Delay(1);
    WriteLn('Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ');
    ReadLn(Boy);
    Cümle := 'VKI Tablosunda ';
    if Vki(Kilo, Trunc(Boy)) = 'zayıf' then
    begin
        Tab := Cümle + '''Zayıf'' Bölümündesin'
    end
    else
    begin
        if Vki(Kilo, Trunc(Boy)) = 'normal' then
        begin
            Tab := Cümle + '''Normal'' Bölümdesin'
        end
        else
        begin
            if Vki(Kilo, Trunc(Boy)) = 'kilolu' then
            begin
                Tab := Cümle + '''Fazla Kilolu'' Bölümdesin'
            end
            else
            begin
                if Vki(Kilo, Trunc(Boy)) = '1. obez' then
                begin
                    Tab := Cümle + '''1. Obez'' Bölümündesin'
                end
                else
                begin
                    if Vki(Kilo, Trunc(Boy)) = '2. obez' then
                    begin
                        Tab := Cümle + '''2. Obez'' Bölümündesin'
                    end
                    else
                    begin
                        if Vki(Kilo, Trunc(Boy)) = '3. obez' then
                        begin
                            Tab := Cümle + '''3. Obez'' Bölümündesin'
                        end
                    end
                end
            end
        end
    end;
    WriteLn(Tab)
end.
