program MyProgram;
uses Math, SysUtils;

var
    Süt : integer;
    Sütkontrol : integer;
    Yumurta : integer;
    Yumurtakontrol : integer;
    Peynir : integer;
    Peynirkontrol : integer;

begin
    Süt := 10;
    Peynir := 10;
    Yumurta := 10;
    WriteLn('Ürünlerin Stok Durumu' + Chr(13) + Chr(13) + 'Süt :: ' + FloatToStr(Süt) + Chr(13) + 'Yumurta :: ' + FloatToStr(Yumurta) + Chr(13) + 'Peynir :: ' + FloatToStr(Peynir));
    while true do
    begin
        WriteLn('Alacaginiz urunun miktarini giriniz' + Chr(13) + 'Süt ::');
        ReadLn(Sütkontrol);
        if Sütkontrol > Süt then
        begin
            WriteLn('Stokta yeterli sut yok')
        end
        else
        begin
            Süt := Trunc(Süt - Sütkontrol)
        end;
        WriteLn('Alacaginiz urunun miktarini giriniz' + Chr(13) + 'Yumurta ::');
        ReadLn(Yumurtakontrol);
        if Yumurtakontrol > Yumurta then
        begin
            WriteLn('Stokta yeterli yumurta yok')
        end
        else
        begin
            Yumurta := Trunc(Yumurta - Yumurtakontrol)
        end;
        WriteLn('Alacaginiz urunun miktarini giriniz' + Chr(13) + 'Peynir ::');
        ReadLn(Peynirkontrol);
        if Peynirkontrol > Peynir then
        begin
            WriteLn('Stokta yeterli peynir yok')
        end
        else
        begin
            Peynir := Trunc(Peynir - Peynirkontrol)
        end;
        WriteLn('Ürünlerin Güncel Stok Durumu' + Chr(13) + Chr(13) + 'Süt :: ' + FloatToStr(Süt) + Chr(13) + 'Yumurta :: ' + FloatToStr(Yumurta) + Chr(13) + 'Peynir :: ' + FloatToStr(Peynir))
    end
end.
