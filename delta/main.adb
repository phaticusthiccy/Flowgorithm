with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Containers.Vectors; use Ada.Containers;

procedure Main is
    package FloatArray is new Vectors(Natural, Float);
    
    function Fonksiyon (deger : Float; a : Float; b : Float) return Unbounded_String is
        sonuc : Unbounded_String;
    
    begin
        if deger < 0.0 then
            Set_Unbounded_String(sonuc, "Kök Bulunamadı");
        else
            if deger = 0.0 then
                Set_Unbounded_String(sonuc, "1. ve 2. Kökler Eşittir. Sonuç: " & );
            else
                Set_Unbounded_String(sonuc, "pass");
            end if;
        end if;
        
        return sonuc;
    end Fonksiyon;
    
    function Formül (a : Integer; b : Integer; c : Integer) return Float is
        sonuc : Float;
    
    begin
        sonuc := Float(b * b - 4 * a * c);
        
        return sonuc;
    end Formül;
    
    fsayı : FloatArray.Vector;
    islem : Unbounded_String;
    text : Unbounded_String;

begin
    fsayı.Set_Length(7);
    
    -- Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
    -- // var fsayı = new Array()
    Put("'a' Sayısının Değerini Girin: "); New_Line;
    fsayı.Element(0) := Float'Value(Get_Line);
    Put("'b' Sayısının Değerini Girin: "); New_Line;
    fsayı.Element(1) := Float'Value(Get_Line);
    Put("'c' Sayısının Değerini Girin: "); New_Line;
    fsayı.Element(2) := Float'Value(Get_Line);
    fsayı.Replace_Element(3, Formül(fsayı.Element(0), fsayı.Element(1), fsayı.Element(2)));
    
    -- Delta Formülü
    -- // formül(a = reel, b = ree, c = ree)
    Put("Program İşleyişini Görmek İster misiniz? (Y yada N): "); New_Line;
    islem := Get_Line;
    if islem = "y" Or islem = "Y" then
        
        -- "Görünür İşlemler"
        if Fonksiyon(fsayı.Element(3), fsayı.Element(0), fsayı.Element(1)) = "pass" then
            
            -- 2 kök içeren sonuçlar buraya yazılır.
            -- Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
            -- Sonuç için Gerekli Formül
            -- 
            -- // fonksiyon(delta = reel, a = reel, b = reel)
            -- // return str
            Put("Kök 1: " & Float'Image((-fsayı.Element(1) + Sqrt(fsayı.Element(3))) / (2.0 * fsayı.Element(0)))); New_Line;
            Put("Kök 2: " & Float'Image((-fsayı.Element(1) - Sqrt(fsayı.Element(3))) / (2.0 * fsayı.Element(0)))); New_Line;
            
            -- Kök formülleri yazıldı.
            Put("Formüller: " & Integer(13) & Integer(13) & "Delta Hesabı" & Integer(13) & "Delta = " &  & "^2-4*" &  & "*" &  & Integer(13) & Integer(13) & "====================" & Integer(13) & Integer(13) & "X1 İçin:" & Integer(13) & "(-" &  & "+(" &  & "^(1/2))) / (2*" &  & ")" & Integer(13) & Integer(13) & "X2 İçin:" & Integer(13) & "(-" &  & "-(" &  & "^(1/2))) / (2*" &  & ")"); New_Line;
        else
            Set_Unbounded_String(text, Fonksiyon(fsayı.Element(3), fsayı.Element(0), fsayı.Element(1)));
            
            -- İkincil bir fonksiyon ata.
            -- İlk işlem sonuç verirse buraya dön.
            if text = "Kök Bulunamadı" then
                Put(text & Integer(13) & Integer(13) & "Delta 0'a eşittir. Bu yüzden kök yoktur."); New_Line;
            else
                Put(text & Integer(13) & Integer(13) & "Formül = -" &  & "/ 2*" & ); New_Line;
            end if;
        end if;
    else
        
        -- "Kapalı İşlemler"
        if Fonksiyon(fsayı.Element(3), fsayı.Element(0), fsayı.Element(1)) = "pass" then
            Put("Kök 1: " & Float'Image((-fsayı.Element(1) + Sqrt(fsayı.Element(3))) / (2.0 * fsayı.Element(0)))); New_Line;
            Put("Kök 2: " & Float'Image((-fsayı.Element(1) - Sqrt(fsayı.Element(3))) / (2.0 * fsayı.Element(0)))); New_Line;
        else
            Put(Fonksiyon(fsayı.Element(3), fsayı.Element(0), fsayı.Element(1))); New_Line;
        end if;
    end if;
    
    -- Programı Kapat. (return True)
end Main;
