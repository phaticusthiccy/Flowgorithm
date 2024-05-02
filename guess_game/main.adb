with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Containers.Vectors; use Ada.Containers;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Main is
    package IntegerArray is new Vectors(Natural, Integer);
    
    function func_Delay (sn : Float) return Boolean is
        payload : Boolean;
        ms : Float;
        n : Integer;
    
    begin
        -- Delay (bekleme süresi) için gerekli fonskiyon. Flowgorithm;
        -- setTimeout()
        -- time.sleep()
        -- gibi fonksiyon barındırmadığı için, gecikmeyi while döngüsü ile yaparız.
        ms := sn * 30000.0;
        
        -- 1 Saniye ≊ 30.000 Sayım
        -- 1 Sayım = 3,14e-5
        n := 0;
        while Float(n) < ms loop
            n := n + 1;
        end loop;
        payload := TRUE;
        
        return payload;
    end func_Delay;
    
    function func_Exit return Boolean is
    begin
        -- Bu fonksiyon herhangi bir hatada veya istenmeyen değerlerde programın çalışmasını engeller.
        -- Bu fonskiyon hiçbir şekilde pas geçilemez.
        -- Fonksiyon bir kez çalışırsa durdurmak imkansızdır.
        loop
        
            exit when not (TRUE);
        end loop;
        
        return ex;
    end func_Exit;
    
    function Logger (var_type : Unbounded_String; this : Unbounded_String) return Boolean is
        payload : Boolean;
    
    begin
        -- Çıktı kullanmak yerine daha efektik bir şekilde logger fonksiyonunu kullanalım.
        -- 
        -- Çıktılarda oluşan karmaşa ve syntx hataları logger içerisinde otomatik düzeltilir.
        if var_type = "int" then
            Put(Integer'Value(this)); New_Line;
            payload := TRUE;
        else
            if var_type = "str" then
                Put(); New_Line;
                payload := TRUE;
            else
                if var_type = "bool" then
                    payload := (this = "true");
                else
                    
                    -- Flowgorithm Array ve Object (dizin ve obje) dönüşleri desteklemez. Logger (çıktı kontrol edicisi) sadece sayı, harf veya doğru-yanlış dönüşü yapabilir.
                    -- Program durdurulur.
                    -- process.exit()
                    func_Exit();
                end if;
            end if;
        end if;
        
        -- logger("str", "test")  =>  String İçin
        -- logger("int", "190")  =>  Sayı İçin
        -- logger("bool", true)  => true-false için
        
        return payload;
    end Logger;
    
    function Namecorrection (name : Unbounded_String) return Boolean is
        payload : Boolean;
    
    begin
        if name'Length < 3 then
            Logger("str", "İsminiz 3 kelimeden kısa olmamalı." & Integer(13) & "Lütfen programı baştan başlatın.");
            func_Exit();
        else
            payload := TRUE;
        end if;
        
        -- Sistemin istediği isim 3 kelimeden kısa olursa oyun başlayamaz.
        
        return payload;
    end Namecorrection;
    
    function Plugins (var_type : Unbounded_String; arg : Unbounded_String) return Unbounded_String is
        payload : Unbounded_String;
        str : StringArray.Vector;
    
    begin
        -- Program içindeki çeşitlilik için gerekli fonksiyon.
        -- Fonksiyon karmaşası olmaması için kısaltıldı.
        str.Set_Length(10);
        
        if var_type = "ask name" then
            str.Replace_Element(0, To_Unbounded_String("Oyuna Hoşgeldin Yabancı!" & Integer(13) & "Lütfen Adını Gir:"));
            str.Replace_Element(1, To_Unbounded_String("Hey, Merhaba Yabacı :)" & Integer(13) & "Lütfen İsmini Yazar mısın?"));
            str.Replace_Element(2, To_Unbounded_String("Yeni bir oyuncu. Yaşasınn!" & Integer(13) & "Adını söylermisin lütfen.."));
            str.Replace_Element(3, To_Unbounded_String("Oyunda Yeni Bir Katılımcı Var!" & Integer(13) & "Lütfen İsmini Gir:"));
            str.Replace_Element(4, To_Unbounded_String("İşte yeni bir oyuncu daha!" & Integer(13) & "Sana nasıl hitap etmemi istersin?"));
            str.Replace_Element(5, To_Unbounded_String("Seni daha önce buralarda görmedim.." & Integer(13) & "Oyuna başlaman için ismine ihtiyacım var. Lütfen ismini söyle."));
            str.Replace_Element(6, To_Unbounded_String("Oyuna Hoşgeldin!" & Integer(13) & "Birazdan aşağıdaki giriş bölümü açılacak. Lütfen oraya adını yaz."));
            Set_Unbounded_String(payload, str.Element(Integer(Random(Generate) * Float(7))));
        else
            if var_type = "after name" then
                str.Replace_Element(0, To_Unbounded_String("Merhaba " & arg & Integer(13) & "Oyunun kuralları şunlardır:" & Integer(13) & "1) Sistem 0-100 arasında sayı seçer." & Integer(13) & "2) Sayıyı tahmin etmeye çalışırsın" & Integer(13) & "3) Toplam 10 adet başarısız denemeden sonra oyun biter." & Integer(13) & "4) Sayı bulunursa oyun kazanılır!"));
                Set_Unbounded_String(payload, str.Element(0));
            else
                if var_type = "game mode" then
                    str.Replace_Element(0, To_Unbounded_String("Lütfen Oyun Modunu Seç" & Integer(13) & Integer(13) & "1) Kolay (Sıcak-Soğuk Mantığı)" & Integer(13) & "2) Normal (Yönergeler Yok)" & Integer(13) & "3) İşleyiş Hakkında Bilgi Al"));
                    Set_Unbounded_String(payload, str.Element(0));
                else
                    if var_type = "wmode" then
                        str.Replace_Element(0, To_Unbounded_String("Lütfen Sadece 1 veya 2 Yazın"));
                        str.Replace_Element(1, To_Unbounded_String("Yanlış Seçim! Sadece 1 veya 2 yazın!"));
                        Set_Unbounded_String(payload, str.Element(Integer(Random(Generate) * Float(2))));
                    else
                        if var_type = "get num" then
                            str.Replace_Element(0, To_Unbounded_String("Pekala, sayımı beliredim. Şimdi sıra sende! Hadi Tahmin Et! " & arg));
                            str.Replace_Element(1, To_Unbounded_String("Tuttum! Hadi Başlayalım :)"));
                            str.Replace_Element(2, To_Unbounded_String("Sayıyı Belleğime Kaydettim! Artık Tahmin Etme Vakti! Bol Şans " & arg & " :)"));
                            Set_Unbounded_String(payload, str.Element(Integer(Random(Generate) * Float(3))));
                        else
                            if var_type = "think" then
                                str.Replace_Element(0, To_Unbounded_String("Tahminin?"));
                                str.Replace_Element(1, To_Unbounded_String("Sence ne olabilir " & arg & "?"));
                                str.Replace_Element(2, To_Unbounded_String("Bi fikrin varmı?"));
                                str.Replace_Element(3, To_Unbounded_String("Tahminin için bekliyorum " & arg));
                                str.Replace_Element(4, To_Unbounded_String("İyi düşün ve öyle karar ver.."));
                                str.Replace_Element(5, To_Unbounded_String("Bencee.. Ay, yardım edemem.. En iyisi tahmin et."));
                                str.Replace_Element(6, To_Unbounded_String("Şansını boşa harcama " & arg));
                                str.Replace_Element(7, To_Unbounded_String("Sakın yanlış tahin ediyim deme haa"));
                                str.Replace_Element(8, To_Unbounded_String("Hadi sıra sende " & arg));
                                Set_Unbounded_String(payload, str.Element(Integer(Random(Generate) * Float(9))));
                            else
                                if var_type = "wthink" then
                                    str.Replace_Element(0, To_Unbounded_String("Yanlış! Tahminin?"));
                                    str.Replace_Element(1, To_Unbounded_String("Bu Değil. Sence ne olabilir " & arg & "?"));
                                    str.Replace_Element(2, To_Unbounded_String("Sayı bu değil. Bi fikrin varmı?"));
                                    str.Replace_Element(3, To_Unbounded_String("Yeniden.. Tahminin için bekliyorum " & arg));
                                    str.Replace_Element(4, To_Unbounded_String("Şimdi iyi düşün ve öyle karar ver.."));
                                    str.Replace_Element(5, To_Unbounded_String("Hmm, Bencee.. Ay, yardım edemem.. En iyisi tahmin et."));
                                    str.Replace_Element(6, To_Unbounded_String("Şansını boşa harcama " & arg));
                                    str.Replace_Element(7, To_Unbounded_String("Ah be abi. Sakın yanlış tahin ediyim deme haa"));
                                    str.Replace_Element(8, To_Unbounded_String("Tekrardan.. Hadi sıra sende " & arg));
                                    Set_Unbounded_String(payload, str.Element(Integer(Random(Generate) * Float(9))));
                                else
                                    if var_type = "sthink" then
                                        str.Replace_Element(0, To_Unbounded_String("Hey, hey! Bu son hakkın. Dikkatli Ol!"));
                                        str.Replace_Element(1, To_Unbounded_String("Dur Biraz! Bu Son Şansın. İyi Kullan " & arg));
                                        str.Replace_Element(2, To_Unbounded_String("Kader Anı! Oyunu kazanman için son şans!"));
                                        str.Replace_Element(3, To_Unbounded_String("Buraya kadar tahmin edemediysen geçmiş olsun :) Bu arada, son şansını kullanmak üzeresin " & arg));
                                        str.Replace_Element(4, To_Unbounded_String("Tarih mi yazacaksın yoksa tarih mi olacaksın! İşte Kader Anı.."));
                                        Set_Unbounded_String(payload, str.Element(Integer(Random(Generate) * Float(5))));
                                    else
                                        if var_type = "win" then
                                            str.Replace_Element(0, To_Unbounded_String("[+] Kazandın!!!" & Integer(13) & "İşte Buuu! Nasılda tahmin ettin *o*" & Integer(13) & Integer(13) & "Bir sonraki oyunda görüşmek üzere.."));
                                            str.Replace_Element(1, To_Unbounded_String("[+] Tebrikler " & arg & "." & Integer(13) & "Oyunu başarılı bir şekilde bitirdin. Tahmininde haklı çıktın." & Integer(13) & "Bir sonraki oyununda başarılar."));
                                            str.Replace_Element(2, To_Unbounded_String("[+] Seni tebrik ederim. Karşımda 6. Hissi çok kuvvetli biri var. Nasıl olurda kaybedeceğini düşündüm ki :)" & Integer(13) & "Bir oyuna daha var mısın.."));
                                            str.Replace_Element(3, To_Unbounded_String("[+] Vay bee, gerçektende tahmin etmeyi başardın.. Seninle gurur duyuyorum! Kazandığın için çok mutluyum." & Integer(13) & "Sonraki oyunlarda görüşmek dileğiyle.."));
                                            str.Replace_Element(4, To_Unbounded_String("[+] İyi iş çıkardın " & arg & Integer(13) & "Bu oyunun hakkını veriyorsun! Ama biliyorumki birdahaki sefere bu kadar kolay kazanamazsın \'_'/"));
                                            Set_Unbounded_String(payload, str.Element(Integer(Random(Generate) * Float(5))));
                                        else
                                            if var_type = "swin" then
                                                str.Replace_Element(0, To_Unbounded_String("[⁂] İnanılmaz.. Tek Kelime İle Şahane!"));
                                                str.Replace_Element(1, To_Unbounded_String("[⁂] Ne.. Bu kadar hızlı yenilemem.."));
                                                str.Replace_Element(2, To_Unbounded_String("[⁂] Vay bee. Bu kadar kolay olacağını tahmin etmemiştim.."));
                                                str.Replace_Element(3, To_Unbounded_String("[⁂] Sen..? Nasıl..? Hile mi yapıyosun??"));
                                                str.Replace_Element(4, To_Unbounded_String("[⁂] Elon Musk falan mısın? Nasıl bu kadar çabuk bildin?"));
                                                Set_Unbounded_String(payload, str.Element(Integer(Random(Generate) * Float(5))));
                                            else
                                                if var_type = "lose" then
                                                    str.Replace_Element(0, To_Unbounded_String("[-] Üzgünüm, Oyunu Kaybettiniz."));
                                                    str.Replace_Element(1, To_Unbounded_String("[-] Malesef oyunu kaybettin. Belkide sadece şanssız zamanındasın.."));
                                                    str.Replace_Element(2, To_Unbounded_String("[-] Ah be abi.. Aslında kolay bir sayı tutmuştum. Üzülme tekraradan oynayabilirsin."));
                                                    str.Replace_Element(3, To_Unbounded_String("[-] Üzülerek belirtmek isterim ki, oyunu kaybetttin. Verilen 10 hak içerisinden, sayıyı tahmin etmeyi başaramadın."));
                                                    str.Replace_Element(4, To_Unbounded_String("[-] Üzülme, her son bir başlangıçtır. Kaybetmen birdahaki sefere kazanamayacağın anlamına gelmez.."));
                                                    Set_Unbounded_String(payload, str.Element(Integer(Random(Generate) * Float(5))));
                                                else
                                                    if var_type = "cold" then
                                                        str.Replace_Element(0, To_Unbounded_String("↘                ↙" & Integer(13) & " Soğuk" & Integer(13) & "↗                ↖"));
                                                        Set_Unbounded_String(payload, str.Element(0));
                                                    else
                                                        if var_type = "warm" then
                                                            str.Replace_Element(0, To_Unbounded_String("↘                ↙" & Integer(13) & "  Ilık" & Integer(13) & "↗                ↖"));
                                                            Set_Unbounded_String(payload, str.Element(0));
                                                        else
                                                            if var_type = "hot" then
                                                                str.Replace_Element(0, To_Unbounded_String("↘                ↙" & Integer(13) & " Sıcak" & Integer(13) & "↗                ↖"));
                                                                Set_Unbounded_String(payload, str.Element(0));
                                                            else
                                                                if var_type = "info" then
                                                                    str.Replace_Element(0, To_Unbounded_String("Oyunun temellerinde çok basit fonksiyonlar ve düzenlemeler yatmaktadır."));
                                                                    str.Replace_Element(1, To_Unbounded_String("Oyun önce sizden adınızı ister. Bazı durumlarda bunu kullanabilir."));
                                                                    str.Replace_Element(2, To_Unbounded_String("İsim için gereken kriterler sadece 3 harf veya daha fazla olmasıdır."));
                                                                    str.Replace_Element(3, To_Unbounded_String("Ardından oyun hakkında bilgilendirme mesajı gönderilir."));
                                                                    str.Replace_Element(4, To_Unbounded_String("Mesajlar logger() denilen fonksiyon ile gönderilir. Bunu incelemek için üstteki 'Ana' yazan yere basıp 'logger' seçmelisiniz."));
                                                                    str.Replace_Element(5, To_Unbounded_String("Daha sonra ise oyun modu seçimi ekranı gelecektir. Burda 2 farklı oyun modunu seçebilirsiniz. Kolay veya Zor."));
                                                                    str.Replace_Element(6, To_Unbounded_String("Her iki oyun modunda önce bilgilendirme mesajı, ardından ise oyunun başladığına dair ufak bir mesaj gönderilir."));
                                                                    str.Replace_Element(7, To_Unbounded_String("Kolay oyun modunda basitçe soğuk-sıcak oyunu mantığı yatar. Sayı, tahmine yakınsa soğuk, değilse sıcak denilir."));
                                                                    str.Replace_Element(8, To_Unbounded_String("Normal oyun modunda ise yönergeler veya yardım yoktur. Kullanıcı tamamen içgüdüleri ile tahmin etmeye çalışır."));
                                                                    str.Replace_Element(9, To_Unbounded_String("Tahmin doğru olduğunda son olarak tebrik mesajı gönderilir. Yanlış ise oyunun bittiğine dair bir mesaj ile birlikte tekrar oynamak için sorulur."));
                                                                    Set_Unbounded_String(payload, str.Element(Integer'Value(arg)));
                                                                end if;
                                                            end if;
                                                        end if;
                                                    end if;
                                                end if;
                                            end if;
                                        end if;
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end if;
        
        -- prototip => plugins(<str>, <str>)
        -- Örnek:
        -- plugins("ask name", " ")
        -- plugins("after name", "İsim")
        
        return payload;
    end Plugins;
    
    function Rand (var_type : Boolean) return Integer is
        payload : Integer;
        opt : Integer;
        num : Integer;
        index : IntegerArray.Vector;
    
    begin
        index.Set_Length(101);
        
        -- 100 yerine 101 kullanmamızın nedeni array'ların (dizin) 0. konumdan başlamasıdır.
        -- 
        -- var dizin = ["bir", "iki", "üç"]
        -- return dizin[0]     // "bir"
        if Not var_type then
            payload := Integer(Random(Generate) * Float(101));
            
            -- Değişken kontrolü istemeyenler için altyapısı while ile kurulu (flowgorithm içinde varsayılan olarak bulunur) Random fonksiyonu.
            -- Değişken kontrolü için;
            -- rand(true)
            -- 
            -- Direk işlem için;
            -- rand(false)
            -- 
            -- kullanın.
            if payload = 0 then
                Rand(FALSE);
            end if;
        else
            
            -- Bu kısım değişken kontrolü yapmak isteyenler içindir.
            num := 0;
            loop
                index.Replace_Element(num, num);
                num := num + 1;
            
                exit when not (num < 101);
            end loop;
            
            -- do döngüsü kullanılır.
            opt := Integer(Random(Generate) * Float(101));
            payload := index.Element(opt);
            if payload = 0 then
                Rand(TRUE);
            end if;
        end if;
        
        -- İndexler 0'a eşit olursa, sistem otomatik olarak başa döner ve sayı tekrardan karıştırılır.
        -- Çıkış int (Tamsayı) olarak döner.
        
        return payload;
    end Rand;
    
    Generate : Generator;
    
    sync : Boolean;
    find : Boolean;
    name : Unbounded_String;
    mode : Integer;
    number : Integer;
    index : Integer;
    index2 : Integer;
    think : Integer;
    index : Integer;
    index2 : Integer;
    think : Integer;

begin
    Logger("str", Plugins("ask name", ""));
    func_Delay(2);
    name := Get_Line;
    Namecorrection(name);
    func_Delay(2);
    
    -- İsim Alma Kısmı Tamamlandı
    Logger("str", Plugins("after name", name));
    func_Delay(9);
    Logger("str", Plugins("game mode", ""));
    mode := Integer'Value(Get_Line);
    
    -- Oyun Modu Başarıyla Seçildi
    if mode = 1 Or mode = 2 then
        if mode = 1 then
            
            -- Kolay Oyun Modu
            index := 0;
            index2 := 0;
            sync := TRUE;
            number := Rand(TRUE);
            Logger("str", Plugins("get num", name));
            func_Delay(2);
            
            -- Sayı Belirlendi
            while sync loop
                if index = 10 then
                    find := FALSE;
                    sync := FALSE;
                    
                    -- 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                else
                    index2 := index2 + 1;
                    index := index + 1;
                    if index = 1 then
                        
                        -- İlk başlama mesajı
                        Logger("str", Plugins("think", name));
                    else
                        
                        -- Sonraki başlama mesajları
                        if index = 10 then
                            
                            -- Son tahmin hakkı için bilgilendirme mesajı
                            Logger("str", Plugins("sthink", name));
                            func_Delay(3.5);
                        else
                            
                            -- Yanlış tahminler için bilgilendirme mesajı
                            Logger("str", Plugins("wthink", name));
                        end if;
                    end if;
                    think := Integer'Value(Get_Line);
                    if think = number then
                        
                        -- Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        find := TRUE;
                        sync := FALSE;
                    else
                        func_Delay(1);
                        if index = 10 then
                        else
                            if think > number then
                                
                                -- Tahmin edilen sayı, ana sayıdan daha büyük ise buraya dön
                                if think - number > 25 then
                                    
                                    -- Tahmin, sayıdan uzak ise bunu gönder
                                    Logger("str", Plugins("cold", ""));
                                else
                                    if think - number > 15 then
                                        
                                        -- Tahmin, sayıya biraz yakın ise bunu gönder
                                        Logger("str", Plugins("warm", ""));
                                    else
                                        
                                        -- Tahmin, sayıya çok yakın ise bunu gönder
                                        Logger("str", Plugins("hot", ""));
                                    end if;
                                end if;
                            else
                                
                                -- Tahmin edilen sayı, ana sayıdan daha küçük ise buraya dön
                                if number - think > 25 then
                                    
                                    -- Tahmin, sayıdan uzak ise bunu gönder
                                    Logger("str", Plugins("cold", ""));
                                else
                                    if number - think > 15 then
                                        
                                        -- Tahmin, sayıya biraz yakın ise bunu gönder
                                        Logger("str", Plugins("warm", ""));
                                    else
                                        
                                        -- Tahmin, sayıya çok yakın ise bunu gönder
                                        Logger("str", Plugins("hot", ""));
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            end loop;
            if find then
                
                -- Oyun Kazanıldığında Buraya Dön
                if index2 < 4 then
                    
                    -- Sayı hemen tahmin edilirse ek mesaj gönder
                    Logger("str", Plugins("swin", name));
                    func_Delay(1);
                    Logger("str", Plugins("win", name));
                    func_Delay(2);
                    Logger("str", Integer'Image(index2)) & ". Denemede Oyunu Kazandınız!");
                else
                    
                    -- Klasik tebrik mesajı
                    Logger("str", Plugins("win", name));
                    func_Delay(2);
                    Logger("str", Integer'Image(index2)) & ". Denemede Oyunu Kazandınız!");
                end if;
            else
                
                -- Oyun Kaybedildiğinde Buraya Dön
                Logger("str", Plugins("lose", name));
                func_Delay(2);
                Logger("str", "Bir kez daha oynamak için 1 yazman yeterli.");
                name := Get_Line;
                if name = "1" then
                    
                    -- Program kapanmadan bir kez daha oynama hakkı verir.
                    Main();
                end if;
            end if;
        else
            
            -- Normal Oyun Modu
            index := 0;
            index2 := 0;
            sync := TRUE;
            number := Rand(FALSE);
            Logger("str", Plugins("get num", name));
            func_Delay(2);
            
            -- Sayı Belirlendi
            while sync loop
                if index = 10 then
                    find := FALSE;
                    sync := FALSE;
                    
                    -- 10 Hak İçinden Tahmin Edilemez ise Döngüyü Kapat
                else
                    index2 := index2 + 1;
                    index := index + 1;
                    if index = 1 then
                        
                        -- İlk başlama mesajı
                        Logger("str", Plugins("think", name));
                    else
                        
                        -- Sonraki başlama mesajları
                        if index = 10 then
                            
                            -- Son tahmin hakkı için bilgilendirme mesajı
                            Logger("str", Plugins("sthink", name));
                            func_Delay(3.5);
                        else
                            
                            -- Yanlış tahminler için bilgilendirme mesajı
                            Logger("str", Plugins("wthink", name));
                        end if;
                    end if;
                    think := Integer'Value(Get_Line);
                    if think = number then
                        
                        -- Tahmin Doğru İse `find` bool'u true olarak ayarla ve döngüyü kapat.
                        find := TRUE;
                        sync := FALSE;
                    else
                        
                        -- Tahmin Yanlış İse Döngüyü Yeniden Başlat
                    end if;
                end if;
            end loop;
            if find then
                
                -- Oyun Kazanıldığında Buraya Dön
                if index2 < 4 then
                    
                    -- Sayı hemen tahmin edilirse ek mesaj gönder
                    Logger("str", Plugins("swin", name));
                    func_Delay(1);
                    Logger("str", Plugins("win", name));
                    func_Delay(2);
                    Logger("str", Integer'Image(index2)) & ". Denemede Oyunu Kazandınız!");
                else
                    
                    -- Klasik tebrik mesajı
                    Logger("str", Plugins("win", name));
                    func_Delay(2);
                    Logger("str", Integer'Image(index2)) & ". Denemede Oyunu Kazandınız!");
                end if;
            else
                
                -- Oyun Kaybedildiğinde Buraya Dön
                Logger("str", Plugins("lose", name));
                func_Delay(2);
                Logger("str", "Bir kez daha oynamak için 1 yazman yeterli.");
                name := Get_Line;
                if name = "1" then
                    
                    -- Program kapanmadan bir kez daha oynama hakkı verir.
                    Main();
                end if;
            end if;
        end if;
    else
        if mode = 3 then
            
            -- Bilgilendirme Mesajı
            number := 0;
            loop
                Logger("str", Plugins("info", ));
                func_Delay(4);
                number := number + 1;
            
                exit when not (number /= 10);
            end loop;
            
            -- do Dögüsü kullanmak en iyi seçenek olacaktır
        else
            Logger("str", Plugins("wmode", ""));
        end if;
    end if;
end Main;
