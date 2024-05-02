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
        ms := sn * 33333;
        n := 0;
        while n /= ms loop
            n := n + 1;
        end loop;
        sonuc := TRUE;
        
        return sonuc;
    end func_Delay;
    
    function Vki (kilo : Integer; boy : Integer) return Unbounded_String is
        sonuc : Unbounded_String;
        index : Integer;
    
    begin
        index := Integer(Float(kilo) / Float(boy * boy));
        if index < 18 then
            Set_Unbounded_String(sonuc, "zayıf");
        else
            if index < 25 then
                Set_Unbounded_String(sonuc, "normal");
            else
                if index < 30 then
                    Set_Unbounded_String(sonuc, "kilolu");
                else
                    if index < 35 then
                        Set_Unbounded_String(sonuc, "1. obez");
                    else
                        if index < 40 then
                            Set_Unbounded_String(sonuc, "2. obez");
                        else
                            Set_Unbounded_String(sonuc, "3. obez");
                        end if;
                    end if;
                end if;
            end if;
        end if;
        
        return sonuc;
    end Vki;
    
    kilo : Integer;
    boy : Float;
    tab : Unbounded_String;
    cümle : Unbounded_String;

begin
    Put("Lütfen Kilonuzu Giriniz:   (Ex: 69)  "); New_Line;
    kilo := Integer'Value(Get_Line);
    func_Delay(1);
    Put("Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  "); New_Line;
    boy := Float'Value(Get_Line);
    Set_Unbounded_String(cümle, "VKI Tablosunda ");
    if Vki(kilo, boy) = "zayıf" then
        Set_Unbounded_String(tab, cümle & "'Zayıf' Bölümündesin");
    else
        if Vki(kilo, boy) = "normal" then
            Set_Unbounded_String(tab, cümle & "'Normal' Bölümdesin");
        else
            if Vki(kilo, boy) = "kilolu" then
                Set_Unbounded_String(tab, cümle & "'Fazla Kilolu' Bölümdesin");
            else
                if Vki(kilo, boy) = "1. obez" then
                    Set_Unbounded_String(tab, cümle & "'1. Obez' Bölümündesin");
                else
                    if Vki(kilo, boy) = "2. obez" then
                        Set_Unbounded_String(tab, cümle & "'2. Obez' Bölümündesin");
                    else
                        if Vki(kilo, boy) = "3. obez" then
                            Set_Unbounded_String(tab, cümle & "'3. Obez' Bölümündesin");
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end if;
    Put(tab); New_Line;
end Main;
