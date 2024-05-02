using System;

public class MyProgram
{
    public static void Main(string[] args)
    {
        int kilo;
        double boy;
        
        Console.WriteLine("Lütfen Kilonuzu Giriniz:   (Ex: 69)  ");
        kilo = (int) readValue();
        Delay(1);
        Console.WriteLine("Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ");
        boy = readValue();
        string tab;
        string cümle;
        
        cümle = "VKI Tablosunda ";
        if (Vki(kilo, (int) boy) == "zayıf")
        {
            tab = cümle + "'Zayıf' Bölümündesin";
        }
        else
        {
            if (Vki(kilo, (int) boy) == "normal")
            {
                tab = cümle + "'Normal' Bölümdesin";
            }
            else
            {
                if (Vki(kilo, (int) boy) == "kilolu")
                {
                    tab = cümle + "'Fazla Kilolu' Bölümdesin";
                }
                else
                {
                    if (Vki(kilo, (int) boy) == "1. obez")
                    {
                        tab = cümle + "'1. Obez' Bölümündesin";
                    }
                    else
                    {
                        if (Vki(kilo, (int) boy) == "2. obez")
                        {
                            tab = cümle + "'2. Obez' Bölümündesin";
                        }
                        else
                        {
                            if (Vki(kilo, (int) boy) == "3. obez")
                            {
                                tab = cümle + "'3. Obez' Bölümündesin";
                            }
                        }
                    }
                }
            }
        }
        Console.WriteLine(tab);
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
    
    public static string Vki(int kilo, int boy)
    {
        string sonuc;
        int index;
        
        index = (int) ((double) kilo / (boy * boy));
        if (index < 18)
        {
            sonuc = "zayıf";
        }
        else
        {
            if (index < 25)
            {
                sonuc = "normal";
            }
            else
            {
                if (index < 30)
                {
                    sonuc = "kilolu";
                }
                else
                {
                    if (index < 35)
                    {
                        sonuc = "1. obez";
                    }
                    else
                    {
                        if (index < 40)
                        {
                            sonuc = "2. obez";
                        }
                        else
                        {
                            sonuc = "3. obez";
                        }
                    }
                }
            }
        }
        
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
