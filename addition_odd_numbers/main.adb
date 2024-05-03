with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Main is
    function func_Delay (sn : Integer) return Boolean is
        sonuc : Boolean;
        ms : Integer;
        n : Integer;
    
    begin
        ms := sn * 30000;
        n := 0;
        while n /= ms loop
            n := n + 1;
        end loop;
        sonuc := TRUE;
        
        return sonuc;
    end func_Delay;
    
    sayı : Integer;
    sonuc : Integer;
    giris : Integer;
    giris2 : Integer;
    tempsonuc : Integer;
    debug : Unbounded_String;
    af1 : Integer;
    af2 : Integer;

begin
    sayı := 1;
    sonuc := 0;
    Put("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: "); New_Line;
    giris := Integer'Value(Get_Line);
    func_Delay(1);
    Put("2. Sayıyı Belirleyin: "); New_Line;
    giris2 := Integer'Value(Get_Line);
    func_Delay(1);
    Put("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın."); New_Line;
    debug := Get_Line;
    if giris > giris2 then
        af1 := giris;
        af2 := giris2;
        giris := af2;
        giris2 := af1;
    else
        
        -- İlk giriş, 2. girişten küçük ise program çalışmaz.
        -- 
        -- Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
    end if;
    for sayı in giris .. giris2 loop
        if sayı Mod 2 = 1 then
            tempsonuc := sonuc;
            sonuc := sonuc + sayı;
            if debug = "n" Or debug = "N" then
                
                -- es geç
            else
                Put( & "+" &  & ": " & ); New_Line;
            end if;
        end if;
    end loop;
    Put("Sonuc: " & Integer'Image(sonuc))); New_Line;
end Main;
