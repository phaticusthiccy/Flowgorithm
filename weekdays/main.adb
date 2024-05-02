with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Containers.Vectors; use Ada.Containers;

procedure Main is
    package StringArray is new Vectors(Natural, Unbounded_String);
    
    function func_Delay (sn : Integer) return Boolean is
        sonuc : Boolean;
        ms : Integer;
        n : Integer;
    
    begin
        ms := sn * 33333;
        n := 0;
        while n /= ms loop
            n := n + 1;
        end loop;
        sonuc := TRUE;
        
        return sonuc;
    end func_Delay;
    
    sync : Boolean;
    index : Integer;
    index2 : Integer;
    günler : StringArray.Vector;

begin
    sync := TRUE;
    index := 0;
    index2 := 0;
    günler.Set_Length(7);
    
    günler.Replace_Element(0, To_Unbounded_String("Pazartesi"));
    günler.Replace_Element(1, To_Unbounded_String("Salı"));
    günler.Replace_Element(2, To_Unbounded_String("Çarşamba"));
    günler.Replace_Element(3, To_Unbounded_String("Perşembe"));
    günler.Replace_Element(4, To_Unbounded_String("Cuma"));
    günler.Replace_Element(5, To_Unbounded_String("Cumartesi"));
    günler.Replace_Element(6, To_Unbounded_String("Pazar"));
    while sync loop
        if index = 7 then
        else
            index := index + 1;
            Put("Haftanın " &  & ". Günü: " & günler.Element(index2)); New_Line;
            func_Delay(1);
            
            -- Çıktı 1 saniye süreyle atılır.
            index2 := index2 + 1;
        end if;
    end loop;
end Main;
