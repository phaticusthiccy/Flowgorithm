using System;

public class MyProgram
{
    public static void Main(string[] args)
    {
        double[] fsayı = new double[7];
        
        // Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
        // // var fsayı = new Array()
        string islem;
        
        Console.WriteLine("'a' Sayısının Değerini Girin: ");
        fsayı[0] = readValue();
        Console.WriteLine("'b' Sayısının Değerini Girin: ");
        fsayı[1] = readValue();
        Console.WriteLine("'c' Sayısının Değerini Girin: ");
        fsayı[2] = readValue();
        fsayı[3] = Formül((int) fsayı[0], (int) fsayı[1], (int) fsayı[2]);
        
        // Delta Formülü
        // // formül(a = reel, b = ree, c = ree)
        Console.WriteLine("Program İşleyişini Görmek İster misiniz? (Y yada N): ");
        islem = Console.ReadLine()
        if (islem == "y" || islem == "Y")
        {
            
            // "Görünür İşlemler"
            if (Fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass")
            {
                
                // 2 kök içeren sonuçlar buraya yazılır.
                // Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
                // Sonuç için Gerekli Formül
                // 
                // // fonksiyon(delta = reel, a = reel, b = reel)
                // // return str
                Console.WriteLine("Kök 1: " + (-fsayı[1] + Math.Sqrt(fsayı[3])) / (2 * fsayı[0]));
                Console.WriteLine("Kök 2: " + (-fsayı[1] - Math.Sqrt(fsayı[3])) / (2 * fsayı[0]));
                
                // Kök formülleri yazıldı.
                Console.WriteLine("Formüller: " + (char) 13 + (char) 13 + "Delta Hesabı" + (char) 13 + "Delta = " + fsayı[1].ToString() + "^2-4*" + fsayı[0].ToString() + "*" + fsayı[2].ToString() + (char) 13 + (char) 13 + "====================" + (char) 13 + (char) 13 + "X1 İçin:" + (char) 13 + "(-" + fsayı[1].ToString() + "+(" + fsayı[3].ToString() + "^(1/2))) / (2*" + fsayı[0].ToString() + ")" + (char) 13 + (char) 13 + "X2 İçin:" + (char) 13 + "(-" + fsayı[1].ToString() + "-(" + fsayı[3].ToString() + "^(1/2))) / (2*" + fsayı[0].ToString() + ")");
            }
            else
            {
                string text;
                
                text = Fonksiyon(fsayı[3], fsayı[0], fsayı[1]);
                
                // İkincil bir fonksiyon ata.
                // İlk işlem sonuç verirse buraya dön.
                if (text == "Kök Bulunamadı")
                {
                    Console.WriteLine(text + (char) 13 + (char) 13 + "Delta 0'a eşittir. Bu yüzden kök yoktur.");
                }
                else
                {
                    Console.WriteLine(text + (char) 13 + (char) 13 + "Formül = -" + fsayı[1].ToString() + "/ 2*" + fsayı[0].ToString());
                }
            }
        }
        else
        {
            
            // "Kapalı İşlemler"
            if (Fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass")
            {
                Console.WriteLine("Kök 1: " + (-fsayı[1] + Math.Sqrt(fsayı[3])) / (2 * fsayı[0]));
                Console.WriteLine("Kök 2: " + (-fsayı[1] - Math.Sqrt(fsayı[3])) / (2 * fsayı[0]));
            }
            else
            {
                Console.WriteLine(Fonksiyon(fsayı[3], fsayı[0], fsayı[1]));
            }
        }
        
        // Programı Kapat. (return True)
    }
    
    public static string Fonksiyon(double deger, double a, double b)
    {
        string sonuc;
        
        if (deger < 0)
        {
            sonuc = "Kök Bulunamadı";
        }
        else
        {
            if (deger == 0)
            {
                sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " + (-b / 2 * a).ToString();
            }
            else
            {
                sonuc = "pass";
            }
        }
        
        return sonuc;
    }
    
    public static double Formül(int a, int b, int c)
    {
        double sonuc;
        
        sonuc = b * b - 4 * a * c;
        
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
