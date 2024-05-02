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
    Ms := Trunc(Sn * 33333);
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
    Sync : boolean;
    İndex, İndex2 : integer;
    Günler : array of string;

begin
    Sync := true;
    İndex := 0;
    İndex2 := 0;
    SetLength(Günler, 7);
    
    Günler[0] := 'Pazartesi';
    Günler[1] := 'Salı';
    Günler[2] := 'Çarşamba';
    Günler[3] := 'Perşembe';
    Günler[4] := 'Cuma';
    Günler[5] := 'Cumartesi';
    Günler[6] := 'Pazar';
    while Sync do
    begin
        if İndex = 7 then
        begin
        end
        else
        begin
            İndex := Trunc(İndex + 1);
            WriteLn('Haftanın ' + FloatToStr(İndex) + '. Günü: ' + Günler[İndex2]);
            Delay(1);
            
            { Çıktı 1 saniye süreyle atılır. }
            İndex2 := Trunc(İndex2 + 1)
        end
    end
end.
