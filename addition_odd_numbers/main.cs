using System;

public class MyProgram
{
    public static void Main(string[] args)
    {
        int sayı, sonuc, giris, giris2, tempsonuc;
        string debug;
        
        sayı = 1;
        sonuc = 0;
        Console.WriteLine("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ");
        giris = (int) readValue();
        Delay(1);
        Console.WriteLine("2. Sayıyı Belirleyin: ");
        giris2 = (int) readValue();
        Delay(1);
        Console.WriteLine("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın.");
        debug = Console.ReadLine()
        if (giris > giris2)
        {
            int af1;
            int af2;
            
            af1 = giris;
            af2 = giris2;
            giris = af2;
            giris2 = af1;
        }
        else
        {
            
            // İlk giriş, 2. girişten küçük ise program çalışmaz.
            // 
            // Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
        }
        for (sayı = giris; sayı <= giris2; sayı++)
        {
            if (sayı % 2 == 1)
            {
                tempsonuc = sonuc;
                sonuc = sonuc + sayı;
                if (debug == "n" || debug == "N")
                {
                    
                    // es geç
                }
                else
                {
                    Console.WriteLine(tempsonuc.ToString() + "+" + sayı.ToString() + ": " + sonuc.ToString());
                }
            }
        }
        Console.WriteLine("Sonuc: " + sonuc);
    }
    
    public static boolean Delay(int sn)
    {
        boolean sonuc;
        int ms;
        
        ms = sn * 30000;
        int n;
        
        n = 0;
        while (n != ms)
        {
            n = n + 1;
        }
        sonuc = true;
        
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
