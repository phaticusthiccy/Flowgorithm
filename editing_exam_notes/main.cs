using System;

public class MyProgram
{
    private static Random random = new Random();
    
    public static void Main(string[] args)
    {
        boolean sync;
        
        sync = true;
        string secim;
        int index, index2;
        
        index = 0;
        index2 = 0;
        int[] notlar = new int[5];
        int[] eskinotlar = new int[5];
        int[] otonot = new int[20];
        string[] otoeklenennot = new string[15];
        
        Console.WriteLine("Notlar Otomatik mi Belirlensin Yoksa Manuel Mi?" + (char) 13 + (char) 13 + "Otomatik için: 'O'" + (char) 13 + "Manuel için: 'M'" + (char) 13 + "Yazın" + (char) 13 + (char) 13 + "Arayüz Hakkında Bilgi Almak İçin İse 'A' Yazın");
        secim = Console.ReadLine()
        if (secim == "O" || secim == "o")
        {
            while (sync)
            {
                
                // Bu döngü notları belirler.
                if (index == 5)
                {
                    sync = false;
                    
                    // index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                }
                else
                {
                    index = index + 1;
                    notlar[index2] = random.Next(80);
                    
                    // Random sayı belirle
                    index2 = index2 + 1;
                    
                    // 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                }
            }
            sync = true;
            index = 0;
            index2 = 0;
            
            // Değişkenleri sıfırlayalım
            while (sync)
            {
                
                // Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                if (index == 5)
                {
                    sync = false;
                }
                else
                {
                    index = index + 1;
                    eskinotlar[index2] = notlar[index2];
                    notlar[index2] = notlar[index2] + 20;
                    index2 = index2 + 1;
                }
            }
            sync = true;
            index = 0;
            index2 = 0;
            
            // Değişkenleri sıfırlayalım
            Console.WriteLine("Yeni Notlar:");
            while (sync)
            {
                
                // Bu döngü eski ve yeni notları bir arada yazdırır.
                if (index == 5)
                {
                    sync = false;
                    
                    // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                }
                else
                {
                    index = index + 1;
                    Console.WriteLine(index.ToString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + eskinotlar[index2] + (char) 13 + "Yeni Not: " + notlar[index2]);
                    Delay(500);
                    
                    // 500 Milisaniyelik Gecikme
                    index2 = index2 + 1;
                }
            }
        }
        else
        {
            if (secim == "M" || secim == "m")
            {
                Console.WriteLine("1. Öğrencinin Notunu Giriniz: ");
                notlar[0] = (int) readValue();
                Console.WriteLine("2. Öğrencinin Notunu Giriniz: ");
                notlar[1] = (int) readValue();
                Console.WriteLine("3. Öğrencinin Notunu Giriniz: ");
                notlar[2] = (int) readValue();
                Console.WriteLine("4. Öğrencinin Notunu Giriniz: ");
                notlar[3] = (int) readValue();
                Console.WriteLine("5. Öğrencinin Notunu Giriniz: ");
                notlar[4] = (int) readValue();
                Delay(800);
                int secim2;
                boolean devam;
                
                devam = true;
                index = 0;
                index2 = 0;
                while (sync)
                {
                    if (index == 5)
                    {
                        sync = false;
                    }
                    else
                    {
                        index = index + 1;
                        if (notlar[index2] > 100)
                        {
                            sync = false;
                            devam = false;
                        }
                        else
                        {
                            if (notlar[index2] < 0)
                            {
                                sync = false;
                                devam = false;
                            }
                            else
                            {
                                index2 = index2 + 1;
                            }
                        }
                    }
                }
                if (!devam)
                {
                    Console.WriteLine("Notlar 100 ve 0 Arasında Olmalıdır.");
                }
                else
                {
                    Console.WriteLine("Size 3 Seçenek Sunuyoruz:" + (char) 13 + (char) 13 + "1) Herkesin Notuna +20 Puan Ekle" + (char) 13 + "2) Herkesin Notuna Eklenecek Puanı Manuel Gir" + (char) 13 + "3) Sistem'in Kendi Not Ekleme Aracını Kullan");
                    secim2 = (int) readValue();
                    if (secim2 == 3)
                    {
                        Delay(59);
                        index = 0;
                        index2 = 0;
                        sync = true;
                        while (sync)
                        {
                            if (index == 5)
                            {
                                sync = false;
                            }
                            else
                            {
                                index = index + 1;
                                otoeklenennot[index2] = Puanekle(notlar[index2]);
                                
                                // Eklenen puanı dizine yazar. Bunu tamsayıya çevirmeye gerek yoktur. Çıkış da kullanacağımız için string olarak kalabilir.
                                Delay(59);
                                if (otoeklenennot[index2] == "pass")
                                {
                                    otoeklenennot[index2] = "0";
                                }
                                else
                                {
                                    otonot[index2] = notlar[index2] + Convert.ToInt32(Puanekle(notlar[index2]));
                                }
                                index2 = index2 + 1;
                            }
                        }
                        index = 0;
                        index2 = 0;
                        sync = true;
                        while (sync)
                        {
                            if (index == 5)
                            {
                                sync = false;
                            }
                            else
                            {
                                index = index + 1;
                                string cikti;
                                
                                if (otoeklenennot[index2] == "0")
                                {
                                    cikti = index.ToString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + notlar[index2] + (char) 13 + "Yeni Not: " + notlar[index2] + (char) 13 + "Ek Puan Yok. Not Yeterli.";
                                }
                                else
                                {
                                    cikti = index.ToString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + notlar[index2] + (char) 13 + "Yeni Not: " + (Convert.ToInt32(otoeklenennot[index2]) + notlar[index2]) + (char) 13 + "Eklenen Puan: " + otoeklenennot[index2];
                                }
                                Console.WriteLine(cikti);
                                Delay(500);
                                index2 = index2 + 1;
                            }
                        }
                    }
                    else
                    {
                        if (secim2 == 2)
                        {
                            index = 0;
                            index2 = 0;
                            sync = false;
                            int sayı1, sayı2, sayı3, sayı4, sayı5;
                            int soru1, soru2, soru3, soru4, soru5;
                            
                            // Dizin Kullanılamaz. Flowgorithm Komplex Sistemlerde Dögü İçinden Dizine Veri Aktarmaya İzin Vermez.
                            // Yaha henüz ben keşfedemedim :p
                            Delay(230);
                            soru1 = Puaneklesoru("1", notlar[index2]);
                            index2 = index2 + 1;
                            soru2 = Puaneklesoru("2", notlar[index2]);
                            index2 = index2 + 1;
                            soru3 = Puaneklesoru("3", notlar[index2]);
                            index2 = index2 + 1;
                            soru4 = Puaneklesoru("4", notlar[index2]);
                            index2 = index2 + 1;
                            soru5 = Puaneklesoru("5", notlar[index2]);
                            Delay(600);
                            sync = true;
                            int[] soruarray = new int[5];
                            
                            soruarray[0] = soru1;
                            soruarray[1] = soru2;
                            soruarray[2] = soru3;
                            soruarray[3] = soru4;
                            soruarray[4] = soru5;
                            if (soru1 > 100 && soru1 < 0 || soru2 > 100 && soru2 < 0 || soru3 > 100 && soru3 < 0 || soru4 > 100 && soru4 < 0 || soru5 > 100 && soru5 < 0)
                            {
                                Console.WriteLine("Notların Son Hali 100 ve 0 Arasında Olmalıdır.");
                            }
                            else
                            {
                                index2 = 0;
                                sayı1 = soru1 + notlar[index2];
                                index2 = index2 + 1;
                                sayı2 = soru2 + notlar[index2];
                                index2 = index2 + 1;
                                sayı3 = soru3 + notlar[index2];
                                index2 = index2 + 1;
                                sayı4 = soru4 + notlar[index2];
                                index2 = index2 + 1;
                                sayı5 = soru5 + notlar[index2];
                                index2 = 0;
                                index = 0;
                                int[] sonsayılar = new int[5];
                                
                                sonsayılar[0] = sayı1;
                                sonsayılar[1] = sayı2;
                                sonsayılar[2] = sayı3;
                                sonsayılar[3] = sayı4;
                                sonsayılar[4] = sayı5;
                                while (sync)
                                {
                                    if (index == 5)
                                    {
                                        sync = false;
                                    }
                                    else
                                    {
                                        index = index + 1;
                                        Console.WriteLine(index.ToString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + notlar[index2] + (char) 13 + "Yeni Not: " + sonsayılar[index2] + (char) 13 + "Eklenen Puan: " + soruarray[index2]);
                                        Delay(270);
                                        index2 = index2 + 1;
                                    }
                                }
                            }
                        }
                        else
                        {
                            if (secim2 == 1)
                            {
                                while (sync)
                                {
                                    
                                    // Bu döngü notları belirler.
                                    if (index == 5)
                                    {
                                        sync = false;
                                        
                                        // index 5'e ulaştığında sync (boolen) false olarak ayarla. Bu while dögüsünü durdurscaktır.
                                    }
                                    else
                                    {
                                        index = index + 1;
                                        notlar[index2] = random.Next(80);
                                        
                                        // Random sayı belirle
                                        index2 = index2 + 1;
                                        
                                        // 0 ve 80 arasında 5 adet sayı belirle ve dizine (array) kaydet
                                    }
                                }
                                sync = true;
                                index = 0;
                                index2 = 0;
                                
                                // Değişkenleri sıfırlayalım
                                while (sync)
                                {
                                    
                                    // Bu döngü eski notları kaydeder ve yeni notlara 20 puan ekler.
                                    if (index == 5)
                                    {
                                        sync = false;
                                    }
                                    else
                                    {
                                        index = index + 1;
                                        eskinotlar[index2] = notlar[index2];
                                        notlar[index2] = notlar[index2] + 20;
                                        index2 = index2 + 1;
                                    }
                                }
                                sync = true;
                                index = 0;
                                index2 = 0;
                                
                                // Değişkenleri sıfırlayalım
                                Console.WriteLine("Yeni Notlar:");
                                while (sync)
                                {
                                    
                                    // Bu döngü eski ve yeni notları bir arada yazdırır.
                                    if (index == 5)
                                    {
                                        sync = false;
                                        
                                        // Kırılma Noktası Kullanmak Yerine Döngüyü Kapatalım
                                    }
                                    else
                                    {
                                        index = index + 1;
                                        if (notlar[index2] > 100)
                                        {
                                            notlar[index2] = 100;
                                            Console.WriteLine(index.ToString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + eskinotlar[index2] + (char) 13 + "Yeni Not: " + notlar[index2]);
                                        }
                                        else
                                        {
                                            Console.WriteLine(index.ToString() + ". Öğrencinin; " + (char) 13 + (char) 13 + "Eski Not: " + eskinotlar[index2] + (char) 13 + "Yeni Not: " + notlar[index2]);
                                        }
                                        
                                        // 20 Puan Ekleme Sonrası Notu 100 ve Yukarısında Olanların Notu Otomatik 100 olarak sayılacaktır.
                                        Delay(500);
                                        
                                        // 500 Milisaniyelik Gecikme
                                        index2 = index2 + 1;
                                    }
                                }
                            }
                            else
                            {
                                Console.WriteLine("Lütfen 1, 2 veya 3 yazınız.");
                                Delay(1000);
                                Console.WriteLine("Program Kapatılıyor..");
                                index = 3;
                                while (sync)
                                {
                                    if (index == 0)
                                    {
                                        sync = false;
                                    }
                                    else
                                    {
                                        Delay(1000);
                                        Console.WriteLine(index.ToString() + "..");
                                        index = index - 1;
                                    }
                                    
                                    // Programın Kapatılması İçin Sayaç Oluştur
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                int helpnum, helpnum2;
                int loop, loop2;
                
                if (secim == "a" || secim == "A")
                {
                    Console.WriteLine("1) Otomatik Mod Hakkında Yardım" + (char) 13 + "2) Manuel Mod Hakkında Yardım");
                    helpnum = (int) readValue();
                    Delay(200);
                    
                    // Bekleme Süreleri İşlemi Yavaşlatabilir Fakat Değişken Atamayı Sorunsuz Bir Şekilde Halletmenize Yarar.
                    loop = Yardımloop(helpnum);
                    Delay(200);
                    if (loop == 1)
                    {
                        Console.WriteLine("Bu Mod İçersinde Bulunan Random(n) komutu, girilen değer ile 0 arasında rastgele sayı seçmemize yarar.");
                        Delay(7800);
                        Console.WriteLine("Seçilen rastgele sayılar not olarak dizin şeklinde kaydedilir. Ardından while döngüsü ile tüm dizin objelerine +20 olarak ekleme yapılır.");
                        Delay(9000);
                        Console.WriteLine("Ardından ilk notlar ve ekleme sonrasındaki notlar yine bir while döngüsü ile teker teker yazdırılır.");
                    }
                    else
                    {
                        Console.WriteLine("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + (char) 13 + "2) Manuel Puan Ekleme Hakkında Yardım" + (char) 13 + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım");
                        helpnum2 = (int) readValue();
                        Delay(200);
                        loop2 = Yardımloop2(helpnum2);
                        Delay(200);
                        if (loop2 == 1)
                        {
                            Console.WriteLine("Bu Sistem Otomatik Mod İle Aynı Çalışır. Tek farkı, öğrenci notlarını kullanıcı girer. Ardından girilen tüm nolara +20 puan ekler.");
                        }
                        else
                        {
                            if (loop2 == 2)
                            {
                                Console.WriteLine("Bu sistemde notlar, kullanıcı tarafından belirlendikten sonra program her öğrencinin notuna eklenecek puan için kullanıcıya tekrar soru sorar.");
                                Delay(7800);
                                Console.WriteLine("Girilen değerler test edilir, yanlışlar ve uyuşmazlıklar düzeltilir. En sonda ise yine bir while döngüsü ile tüm notlar yazdırılır.");
                            }
                            else
                            {
                                Console.WriteLine("Kullanıcı notları girdikten sonra dizine kaydedilir. Ardından puanekle() fonksiyonuna veri aktarımı yapılır.");
                                Delay(4500);
                                Console.WriteLine("Fonksiyona gelen veriler önce gruplara ayrılır. Burda belirli bir not aralığı kullanılır.");
                                Delay(4500);
                                Console.WriteLine("Gruplandırılan notlar, sistemin içinde bulunan ek puan ekleme, yani çok düşük notları bile adaletli olarak yükselten, yüksek notları ise yerinde düzeltme yapar.");
                                Delay(8000);
                                Console.WriteLine("Yeni notlar belirlendiğinde kapsamlı bir çıktı olarak, tekrardan while döngüsü ile prompt'a (ekrana) yazdırılır.");
                            }
                        }
                    }
                }
                else
                {
                    Console.WriteLine("Lütfen Sadece 'M' veya 'O' Harflerini Giriniz!");
                }
            }
        }
        
        // 2 Ana Seçenek Altında Toplam 4 Farklı İşlem Yapılır.
        // 
        // Otomatik: Öğrencilerin notları 0-80 arası rastgele seçilir. Ardından Tüm Öğrencilere 20 puan eklenir.
        // Manuel Modunda İse 3 Ayrı İşlem Yapılır. Ek Olarak Öğrencilerin Notunu Kullanıcı Seçer.
        // 
        // 1. İşlem: Seçilen Notların Hepine 20 Puan Ekle
        // 2. İşlem: Eklenecek Puanları Kullanıcı Kendisi Belirler
        // 3. İşlem: Sistem Not Ağırlığına Göre Otomatik Bir Şekilde Ekleme Yapar.
        // 
        // 3. İşlemdeki öncelik, düşük notlara olabildiğince fazla ek puan verip, daha yüksek notları ise en ideal şekide ayarlamaktır. Bu işlem hem zaman tasarrufu hem de, eklenen puanların tutarlılığı için mükemmel bir yöntemdir.
    }
    
    public static boolean Delay(int sn)
    {
        // Flowgorithm üzerinde setTimeout veya time.sleep() gibi komutlar olmadığı için gecikmeyi (delay) bu şekilde sağlarız.
        boolean sonuc;
        int ms;
        
        ms = sn * 33;
        int n;
        
        n = 0;
        while (n != ms)
        {
            n = n + 1;
        }
        sonuc = true;
        
        // Response (çıktı) herhangi bir değer olabilir. Bunun önemi yoktur. True dönmesi, konrol eden kişi değşken ile atadığında timer kapandıktan sonra değişken true halini alır.
        // boolen test
        // test = delay(200)
        // çıktı test  // true
        
        return sonuc;
    }
    
    public static string Puanekle(int puan)
    {
        string sonuc;
        int[] ekpuan = new int[20];
        int index, index2;
        boolean sync;
        
        // while döngüsü için
        sync = true;
        index = 0;
        if (puan > 89)
        {
            sonuc = "pass";
            
            // 90 ve üstü notlar için puan ekleme olmaz.
        }
        else
        {
            if (puan > 69)
            {
                index2 = 5;
                while (sync)
                {
                    if (index == 6)
                    {
                        sync = false;
                    }
                    else
                    {
                        ekpuan[index] = index2;
                        index = index + 1;
                        index2 = index2 + 1;
                    }
                }
                sonuc = ekpuan[random.Next(6)].ToString();
                
                // Not 70 ve 90 arasında ise, 5 ila 10 arasında puan ekle.
            }
            else
            {
                if (puan > 49)
                {
                    index2 = 10;
                    while (sync)
                    {
                        if (index == 9)
                        {
                            sync = false;
                        }
                        else
                        {
                            ekpuan[index] = index2;
                            index = index + 1;
                            index2 = index2 + 1;
                        }
                    }
                    sonuc = ekpuan[random.Next(9)].ToString();
                    
                    // Not 50 ve 70 arasında ise, 10 ila 18 arasında puan ekle.
                }
                else
                {
                    if (puan > 29)
                    {
                        index2 = 20;
                        while (sync)
                        {
                            if (index == 10)
                            {
                                sync = false;
                            }
                            else
                            {
                                ekpuan[index] = index2;
                                index = index + 1;
                                index2 = index2 + 1;
                            }
                        }
                        sonuc = ekpuan[random.Next(10)].ToString();
                        
                        // Not 30 ve 50 arasında ise, 20 ila 29 arasında puan ekle.
                    }
                    else
                    {
                        index2 = 30;
                        while (sync)
                        {
                            if (index == 11)
                            {
                                sync = false;
                            }
                            else
                            {
                                ekpuan[index] = index2;
                                index = index + 1;
                                index2 = index2 + 1;
                            }
                        }
                        sonuc = ekpuan[random.Next(11)].ToString();
                        
                        // Not 30'dan küçük ise, 30 ila 40 arasında puan ekle.
                    }
                }
            }
        }
        
        // String olarak yanıt almak herzaman daha mantıklıdır. String veri tipi hem real hem de int'e (tamsayı) çevrilebilir.Real sayılar int olarak ta atanabilir.  Fakat Flowgoritm buna izin vermez. İşte birkaç örnek:
        // var sayı = 0.65   // Javascript
        // sayı = 0.65          // Python
        // local sayı = 0.65          // Lua
        // int sayı = 0.65     // C
        
        return sonuc;
    }
    
    public static int Puaneklesoru(string no, int eskinot)
    {
        int sonuc;
        
        Console.WriteLine(no + ". Öğrenci İçin Kaç Puan Eklemek İstersiniz: " + (char) 13 + (char) 13 + "Öğrencinin Puanı: " + eskinot);
        sonuc = (int) readValue();
        
        return sonuc;
    }
    
    public static int Yardımloop(int sayı)
    {
        int sonuc;
        
        if (sayı == 1 || sayı == 2)
        {
        }
        else
        {
            Console.WriteLine("Yanlış Değer Girdiniz! Sadece 1 veya 2 yazın." + (char) 13 + "Yeniden Başlatılıyor..");
            Delay(1000);
            Console.WriteLine("1) Otomatik Mod Hakkında Yardım" + (char) 13 + "2) Manuel Mod Hakkında Yardım");
            sayı = (int) readValue();
            Yardımloop(sayı);
        }
        
        // Yardım Modülü İçin
        // Yanlış değer girildiğinde baştan başlatır
        sonuc = sayı;
        
        return sonuc;
    }
    
    public static int Yardımloop2(int sayı)
    {
        int sonuc;
        
        if (sayı == 1 || sayı == 2 || sayı == 3)
        {
        }
        else
        {
            Console.WriteLine("Yanlış Değer Girdiniz! Sadece 1, 2 veya 3 yazın." + (char) 13 + "Yeniden Başlatılıyor..");
            Delay(1000);
            Console.WriteLine("1) Tüm Notlara 20 Puan Ekleme Hakkında Yardım" + (char) 13 + "2) Manuel Puan Ekleme Hakkında Yardım" + (char) 13 + "3) Sistemin Belirlediği Ek Puan Modülü Hakkında Yardım");
            sayı = (int) readValue();
            Yardımloop2(sayı);
        }
        sonuc = sayı;
        
        return sonuc;
    }
    
    // .NET can only read single characters or entire lines from the console.
    // The following function safely reads a double value.
    private static double readValue()
    {
        double result;
        while (!double.TryParse(Console.ReadLine(), out result));
        return result;
    }
}
