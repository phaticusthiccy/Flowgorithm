using System;

public class MyProgram
{
    public static void Main(string[] args)
    {
        boolean sync;
        
        sync = true;
        int index, index2;
        
        index = 0;
        index2 = 0;
        string[] günler = new string[7];
        
        günler[0] = "Pazartesi";
        günler[1] = "Salı";
        günler[2] = "Çarşamba";
        günler[3] = "Perşembe";
        günler[4] = "Cuma";
        günler[5] = "Cumartesi";
        günler[6] = "Pazar";
        while (sync)
        {
            if (index == 7)
            {
            }
            else
            {
                index = index + 1;
                Console.WriteLine("Haftanın " + index.ToString() + ". Günü: " + günler[index2]);
                Delay(1);
                
                // Çıktı 1 saniye süreyle atılır.
                index2 = index2 + 1;
            }
        }
    }
    
    public static boolean Delay(int sn)
    {
        boolean sonuc;
        int ms;
        
        ms = sn * 33333;
        int n;
        
        n = 0;
        while (n != ms)
        {
            n = n + 1;
        }
        sonuc = true;
        
        return sonuc;
    }
}
