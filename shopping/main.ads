with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Main is
    süt : Integer;
    sütkontrol : Integer;
    yumurta : Integer;
    yumurtakontrol : Integer;
    peynir : Integer;
    peynirkontrol : Integer;

begin
    süt := 10;
    peynir := 10;
    yumurta := 10;
    Put("Ürünlerin Stok Durumu" & Integer(13) & Integer(13) & "Süt :: " & Integer'Image(süt)) & Integer(13) & "Yumurta :: " & Integer'Image(yumurta)) & Integer(13) & "Peynir :: " & Integer'Image(peynir))); New_Line;
    while TRUE loop
        Put("Alacaginiz urunun miktarini giriniz" & Integer(13) & "Süt ::"); New_Line;
        sütkontrol := Integer'Value(Get_Line);
        if sütkontrol > süt then
            Put("Stokta yeterli sut yok"); New_Line;
        else
            süt := süt - sütkontrol;
        end if;
        Put("Alacaginiz urunun miktarini giriniz" & Integer(13) & "Yumurta ::"); New_Line;
        yumurtakontrol := Integer'Value(Get_Line);
        if yumurtakontrol > yumurta then
            Put("Stokta yeterli yumurta yok"); New_Line;
        else
            yumurta := yumurta - yumurtakontrol;
        end if;
        Put("Alacaginiz urunun miktarini giriniz" & Integer(13) & "Peynir ::"); New_Line;
        peynirkontrol := Integer'Value(Get_Line);
        if peynirkontrol > peynir then
            Put("Stokta yeterli peynir yok"); New_Line;
        else
            peynir := peynir - peynirkontrol;
        end if;
        Put("Ürünlerin Güncel Stok Durumu" & Integer(13) & Integer(13) & "Süt :: " & Integer'Image(süt)) & Integer(13) & "Yumurta :: " & Integer'Image(yumurta)) & Integer(13) & "Peynir :: " & Integer'Image(peynir))); New_Line;
    end loop;
end Main;
