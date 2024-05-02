with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Containers.Vectors; use Ada.Containers;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Main is
    package IntegerArray is new Vectors(Natural, Integer);
    
    function func_Delay (sn : Integer) return Boolean is
        sonuc : Boolean;
        ms : Integer;
        n : Integer;
    
    begin
        -- Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
        ms := sn * 33;
        n := 0;
        while n /= ms loop
            n := n + 1;
        end loop;
        sonuc := TRUE;
        
        -- Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
        -- boolen test
        -- test = delay(200)
        -- çıktı test  // true
        
        return sonuc;
    end func_Delay;
    
    function Puanekle (puan : Integer) return Unbounded_String is
        sonuc : Unbounded_String;
        ekpuan : IntegerArray.Vector;
        index : Integer;
        index2 : Integer;
        sync : Boolean;
    
    begin
        ekpuan.Set_Length(20);
        
        -- while döngüsü için
        sync := TRUE;
        index := 0;
        if puan > 89 then
            Set_Unbounded_String(sonuc, "pass");
            
            -- 90 ve üstü notlar için puan ekleme olmaz.
        else
            if puan > 69 then
                index2 := 5;
                while sync loop
                    if index = 6 then
                        sync := FALSE;
                    else
                        ekpuan.Replace_Element(index, index2);
                        index := index + 1;
                        index2 := index2 + 1;
                    end if;
                end loop;
                Set_Unbounded_String(sonuc, );
                
                -- Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
            else
                if puan > 49 then
                    index2 := 10;
                    while sync loop
                        if index = 9 then
                            sync := FALSE;
                        else
                            ekpuan.Replace_Element(index, index2);
                            index := index + 1;
                            index2 := index2 + 1;
                        end if;
                    end loop;
                    Set_Unbounded_String(sonuc, );
                    
                    -- Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
                else
                    if puan > 29 then
                        index2 := 20;
                        while sync loop
                            if index = 10 then
                                sync := FALSE;
                            else
                                ekpuan.Replace_Element(index, index2);
                                index := index + 1;
                                index2 := index2 + 1;
                            end if;
                        end loop;
                        Set_Unbounded_String(sonuc, );
                        
                        -- Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                    else
                        index2 := 30;
                        while sync loop
                            if index = 11 then
                                sync := FALSE;
                            else
                                ekpuan.Replace_Element(index, index2);
                                index := index + 1;
                                index2 := index2 + 1;
                            end if;
                        end loop;
                        Set_Unbounded_String(sonuc, );
                        
                        -- Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                    end if;
                end if;
            end if;
        end if;
        
        -- String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
        -- var sayı = 0.65   // Javascript
        -- sayı = 0.65          // Python
        -- local sayı = 0.65          // Lua
        -- int sayı = 0.65     // C
        
        return sonuc;
    end Puanekle;
    
    function Puaneklesoru (no : Unbounded_String; eskinot : Integer) return Integer is
        sonuc : Integer;
    
    begin
        Put(no & ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " & Integer(13) & Integer(13) & "Öğrencinin Puanı: " & Integer'Image(eskinot))); New_Line;
        sonuc := Integer'Value(Get_Line);
        
        return sonuc;
    end Puaneklesoru;
    
    function Yardımloop (sayı : Integer) return Integer is
        sonuc : Integer;
    
    begin
        if sayı = 1 Or sayı = 2 then
        else
            Put("Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." & Integer(13) & "Yeniden Başlatılıyor.."); New_Line;
            func_Delay(1000);
            Put("1) Otomatik Mod Hakkında Yardım" & Integer(13) & "2) Manuel Mod Hakkında Yardım"); New_Line;
            sayı := Integer'Value(Get_Line);
            Yardımloop(sayı);
        end if;
        
        -- Yardım Modülü İçin
        -- Yanlış değer girildiğinde baştan başlatır
        sonuc := sayı;
        
        return sonuc;
    end Yardımloop;
    
    function Yardımloop2 (sayı : Integer) return Integer is
        sonuc : Integer;
    
    begin
        if sayı = 1 Or sayı = 2 Or sayı = 3 then
        else
            Put("Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." & Integer(13) & "Yeniden Başlatılıyor.."); New_Line;
            func_Delay(1000);
            Put("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" & Integer(13) & "2) Manuel Puan Ekleme Hakkında Yardım" & Integer(13) & "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"); New_Line;
            sayı := Integer'Value(Get_Line);
            Yardımloop2(sayı);
        end if;
        sonuc := sayı;
        
        return sonuc;
    end Yardımloop2;
    
    Generate : Generator;
    
    sync : Boolean;
    secim : Unbounded_String;
    index : Integer;
    index2 : Integer;
    notlar : IntegerArray.Vector;
    eskinotlar : IntegerArray.Vector;
    otonot : IntegerArray.Vector;
    otoeklenennot : StringArray.Vector;
    secim2 : Integer;
    devam : Boolean;
    cikti : Unbounded_String;
    sayı1 : Integer;
    sayı2 : Integer;
    sayı3 : Integer;
    sayı4 : Integer;
    sayı5 : Integer;
    soru1 : Integer;
    soru2 : Integer;
    soru3 : Integer;
    soru4 : Integer;
    soru5 : Integer;
    soruarray : IntegerArray.Vector;
    sonsayılar : IntegerArray.Vector;
    helpnum : Integer;
    helpnum2 : Integer;
    var_loop : Integer;
    loop2 : Integer;

begin
    Reset(Generate);    -- Prepare random number generator
    
    sync := TRUE;
    index := 0;
    index2 := 0;
    notlar.Set_Length(5);
    eskinotlar.Set_Length(5);
    otonot.Set_Length(20);
    otoeklenennot.Set_Length(15);
    
    Put("Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" & Integer(13) & Integer(13) & "Otomatik için: 'O'" & Integer(13) & "Manuel için: 'M'" & Integer(13) & "Yazın" & Integer(13) & Integer(13) & "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın"); New_Line;
    secim := Get_Line;
    if secim = "O" Or secim = "o" then
        while sync loop
            
            -- Bu döngü notları belirler.
            if index = 5 then
                sync := FALSE;
                
                -- index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
            else
                index := index + 1;
                notlar.Replace_Element(index2, Integer(Random(Generate) * Float(80)));
                
                -- Random sayı belirle
                index2 := index2 + 1;
                
                -- 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
            end if;
        end loop;
        sync := TRUE;
        index := 0;
        index2 := 0;
        
        -- Değişkenleri sıfırlayalım
        while sync loop
            
            -- Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
            if index = 5 then
                sync := FALSE;
            else
                index := index + 1;
                eskinotlar.Replace_Element(index2, notlar.Element(index2));
                notlar.Replace_Element(index2, notlar.Element(index2) + 20);
                index2 := index2 + 1;
            end if;
        end loop;
        sync := TRUE;
        index := 0;
        index2 := 0;
        
        -- Değişkenleri sıfırlayalım
        Put("Yeni Notlar:"); New_Line;
        while sync loop
            
            -- Bu döngü eski ve yeni notları bir arada yazdırır.
            if index = 5 then
                sync := FALSE;
                
                -- Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
            else
                index := index + 1;
                Put( & ". Öğrencinin; " & Integer(13) & Integer(13) & "Eski Not: " & Integer'Image(eskinotlar.Element(index2))) & Integer(13) & "Yeni Not: " & Integer'Image(notlar.Element(index2)))); New_Line;
                func_Delay(500);
                
                -- 500 Milisaniyelik Gecikme
                index2 := index2 + 1;
            end if;
        end loop;
    else
        if secim = "M" Or secim = "m" then
            Put("1. Öğrencinin Notunu Giriniz: "); New_Line;
            notlar.Element(0) := Integer'Value(Get_Line);
            Put("2. Öğrencinin Notunu Giriniz: "); New_Line;
            notlar.Element(1) := Integer'Value(Get_Line);
            Put("3. Öğrencinin Notunu Giriniz: "); New_Line;
            notlar.Element(2) := Integer'Value(Get_Line);
            Put("4. Öğrencinin Notunu Giriniz: "); New_Line;
            notlar.Element(3) := Integer'Value(Get_Line);
            Put("5. Öğrencinin Notunu Giriniz: "); New_Line;
            notlar.Element(4) := Integer'Value(Get_Line);
            func_Delay(800);
            devam := TRUE;
            index := 0;
            index2 := 0;
            while sync loop
                if index = 5 then
                    sync := FALSE;
                else
                    index := index + 1;
                    if notlar.Element(index2) > 100 then
                        sync := FALSE;
                        devam := FALSE;
                    else
                        if notlar.Element(index2) < 0 then
                            sync := FALSE;
                            devam := FALSE;
                        else
                            index2 := index2 + 1;
                        end if;
                    end if;
                end if;
            end loop;
            if Not devam then
                Put("Notlar 100 ve 0 Arasında Olmalıdır."); New_Line;
            else
                Put("Size 3 Seçenek Sunuyoruz:" & Integer(13) & Integer(13) & "1) Herkesin Notuna +20 Puan Ekle" & Integer(13) & "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" & Integer(13) & "3) Sistem'in Kendi Not Ekleme Aracını Kullan"); New_Line;
                secim2 := Integer'Value(Get_Line);
                if secim2 = 3 then
                    func_Delay(59);
                    index := 0;
                    index2 := 0;
                    sync := TRUE;
                    while sync loop
                        if index = 5 then
                            sync := FALSE;
                        else
                            index := index + 1;
                            otoeklenennot.Replace_Element(index2, To_Unbounded_String(Puanekle(notlar.Element(index2))));
                            
                            -- Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                            func_Delay(59);
                            if otoeklenennot.Element(index2) = "pass" then
                                otoeklenennot.Replace_Element(index2, To_Unbounded_String("0"));
                            else
                                otonot.Replace_Element(index2, notlar.Element(index2) + Integer'Value(Puanekle(notlar.Element(index2))));
                            end if;
                            index2 := index2 + 1;
                        end if;
                    end loop;
                    index := 0;
                    index2 := 0;
                    sync := TRUE;
                    while sync loop
                        if index = 5 then
                            sync := FALSE;
                        else
                            index := index + 1;
                            if otoeklenennot.Element(index2) = "0" then
                                Set_Unbounded_String(cikti,  & ". Öğrencinin; " & Integer(13) & Integer(13) & "Eski Not: " & Integer'Image(notlar.Element(index2))) & Integer(13) & "Yeni Not: " & Integer'Image(notlar.Element(index2))) & Integer(13) & "Ek Puan Yok. Not Yeterli.");
                            else
                                Set_Unbounded_String(cikti,  & ". Öğrencinin; " & Integer(13) & Integer(13) & "Eski Not: " & Integer'Image(notlar.Element(index2))) & Integer(13) & "Yeni Not: " & Integer'Image(Integer'Value(otoeklenennot.Element(index2)) + notlar.Element(index2))) & Integer(13) & "Eklenen Puan: " & otoeklenennot.Element(index2));
                            end if;
                            Put(cikti); New_Line;
                            func_Delay(500);
                            index2 := index2 + 1;
                        end if;
                    end loop;
                else
                    if secim2 = 2 then
                        index := 0;
                        index2 := 0;
                        sync := FALSE;
                        
                        -- Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                        -- Yaha henüz ben keşfedemedim :p
                        func_Delay(230);
                        soru1 := Puaneklesoru("1", notlar.Element(index2));
                        index2 := index2 + 1;
                        soru2 := Puaneklesoru("2", notlar.Element(index2));
                        index2 := index2 + 1;
                        soru3 := Puaneklesoru("3", notlar.Element(index2));
                        index2 := index2 + 1;
                        soru4 := Puaneklesoru("4", notlar.Element(index2));
                        index2 := index2 + 1;
                        soru5 := Puaneklesoru("5", notlar.Element(index2));
                        func_Delay(600);
                        sync := TRUE;
                        soruarray.Set_Length(5);
                        
                        soruarray.Replace_Element(0, soru1);
                        soruarray.Replace_Element(1, soru2);
                        soruarray.Replace_Element(2, soru3);
                        soruarray.Replace_Element(3, soru4);
                        soruarray.Replace_Element(4, soru5);
                        if soru1 > 100 And soru1 < 0 Or soru2 > 100 And soru2 < 0 Or soru3 > 100 And soru3 < 0 Or soru4 > 100 And soru4 < 0 Or soru5 > 100 And soru5 < 0 then
                            Put("Notların Son Hali 100 ve 0 Arasında Olmalıdır."); New_Line;
                        else
                            index2 := 0;
                            sayı1 := soru1 + notlar.Element(index2);
                            index2 := index2 + 1;
                            sayı2 := soru2 + notlar.Element(index2);
                            index2 := index2 + 1;
                            sayı3 := soru3 + notlar.Element(index2);
                            index2 := index2 + 1;
                            sayı4 := soru4 + notlar.Element(index2);
                            index2 := index2 + 1;
                            sayı5 := soru5 + notlar.Element(index2);
                            index2 := 0;
                            index := 0;
                            sonsayılar.Set_Length(5);
                            
                            sonsayılar.Replace_Element(0, sayı1);
                            sonsayılar.Replace_Element(1, sayı2);
                            sonsayılar.Replace_Element(2, sayı3);
                            sonsayılar.Replace_Element(3, sayı4);
                            sonsayılar.Replace_Element(4, sayı5);
                            while sync loop
                                if index = 5 then
                                    sync := FALSE;
                                else
                                    index := index + 1;
                                    Put( & ". Öğrencinin; " & Integer(13) & Integer(13) & "Eski Not: " & Integer'Image(notlar.Element(index2))) & Integer(13) & "Yeni Not: " & Integer'Image(sonsayılar.Element(index2))) & Integer(13) & "Eklenen Puan: " & Integer'Image(soruarray.Element(index2)))); New_Line;
                                    func_Delay(270);
                                    index2 := index2 + 1;
                                end if;
                            end loop;
                        end if;
                    else
                        if secim2 = 1 then
                            while sync loop
                                
                                -- Bu döngü notları belirler.
                                if index = 5 then
                                    sync := FALSE;
                                    
                                    -- index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                                else
                                    index := index + 1;
                                    notlar.Replace_Element(index2, Integer(Random(Generate) * Float(80)));
                                    
                                    -- Random sayı belirle
                                    index2 := index2 + 1;
                                    
                                    -- 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                                end if;
                            end loop;
                            sync := TRUE;
                            index := 0;
                            index2 := 0;
                            
                            -- Değişkenleri sıfırlayalım
                            while sync loop
                                
                                -- Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                                if index = 5 then
                                    sync := FALSE;
                                else
                                    index := index + 1;
                                    eskinotlar.Replace_Element(index2, notlar.Element(index2));
                                    notlar.Replace_Element(index2, notlar.Element(index2) + 20);
                                    index2 := index2 + 1;
                                end if;
                            end loop;
                            sync := TRUE;
                            index := 0;
                            index2 := 0;
                            
                            -- Değişkenleri sıfırlayalım
                            Put("Yeni Notlar:"); New_Line;
                            while sync loop
                                
                                -- Bu döngü eski ve yeni notları bir arada yazdırır.
                                if index = 5 then
                                    sync := FALSE;
                                    
                                    -- Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                else
                                    index := index + 1;
                                    if notlar.Element(index2) > 100 then
                                        notlar.Replace_Element(index2, 100);
                                        Put( & ". Öğrencinin; " & Integer(13) & Integer(13) & "Eski Not: " & Integer'Image(eskinotlar.Element(index2))) & Integer(13) & "Yeni Not: " & Integer'Image(notlar.Element(index2)))); New_Line;
                                    else
                                        Put( & ". Öğrencinin; " & Integer(13) & Integer(13) & "Eski Not: " & Integer'Image(eskinotlar.Element(index2))) & Integer(13) & "Yeni Not: " & Integer'Image(notlar.Element(index2)))); New_Line;
                                    end if;
                                    
                                    -- 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                    func_Delay(500);
                                    
                                    -- 500 Milisaniyelik Gecikme
                                    index2 := index2 + 1;
                                end if;
                            end loop;
                        else
                            Put("Lütfen 1, 2 veya 3 yazınız."); New_Line;
                            func_Delay(1000);
                            Put("Program Kapatılıyor.."); New_Line;
                            index := 3;
                            while sync loop
                                if index = 0 then
                                    sync := FALSE;
                                else
                                    func_Delay(1000);
                                    Put( & ".."); New_Line;
                                    index := index - 1;
                                end if;
                                
                                -- Programın Kapatılması İçin Sayaç Oluştur
                            end loop;
                        end if;
                    end if;
                end if;
            end if;
        else
            if secim = "a" Or secim = "A" then
                Put("1) Otomatik Mod Hakkında Yardım" & Integer(13) & "2) Manuel Mod Hakkında Yardım"); New_Line;
                helpnum := Integer'Value(Get_Line);
                func_Delay(200);
                
                -- Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                var_loop := Yardımloop(helpnum);
                func_Delay(200);
                if var_loop = 1 then
                    Put("Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar."); New_Line;
                    func_Delay(7800);
                    Put("Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır."); New_Line;
                    func_Delay(9000);
                    Put("Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır."); New_Line;
                else
                    Put("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" & Integer(13) & "2) Manuel Puan Ekleme Hakkında Yardım" & Integer(13) & "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım"); New_Line;
                    helpnum2 := Integer'Value(Get_Line);
                    func_Delay(200);
                    loop2 := Yardımloop2(helpnum2);
                    func_Delay(200);
                    if loop2 = 1 then
                        Put("Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler."); New_Line;
                    else
                        if loop2 = 2 then
                            Put("Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar."); New_Line;
                            func_Delay(7800);
                            Put("Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır."); New_Line;
                        else
                            Put("Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır."); New_Line;
                            func_Delay(4500);
                            Put("Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır."); New_Line;
                            func_Delay(4500);
                            Put("Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar."); New_Line;
                            func_Delay(8000);
                            Put("Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır."); New_Line;
                        end if;
                    end if;
                end if;
            else
                Put("Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!"); New_Line;
            end if;
        end if;
    end if;
    
    -- 2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır.
    -- 
    -- Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir.
    -- Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer.
    -- 
    -- 1. İşlem: Seçilen Notların Hepine 20 Puan Ekle
    -- 2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler
    -- 3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar.
    -- 
    -- 3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir.
end Main;
