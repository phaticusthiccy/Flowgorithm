using System;

public class MyProgram
{
    public static void Main(string[] args)
    {
        int süt;
        int sütkontrol;
        int yumurta;
        int yumurtakontrol;
        int peynir;
        int peynirkontrol;
        
        süt = 10;
        peynir = 10;
        yumurta = 10;
        Console.WriteLine("Ürünlerin Stok Durumu" + (char) 13 + (char) 13 + "Süt :: " + süt + (char) 13 + "Yumurta :: " + yumurta + (char) 13 + "Peynir :: " + peynir);
        while (true)
        {
            Console.WriteLine("Alacaginiz urunun miktarini giriniz" + (char) 13 + "Süt ::");
            sütkontrol = (int) readValue();
            if (sütkontrol > süt)
            {
                Console.WriteLine("Stokta yeterli sut yok");
            }
            else
            {
                süt = süt - sütkontrol;
            }
            Console.WriteLine("Alacaginiz urunun miktarini giriniz" + (char) 13 + "Yumurta ::");
            yumurtakontrol = (int) readValue();
            if (yumurtakontrol > yumurta)
            {
                Console.WriteLine("Stokta yeterli yumurta yok");
            }
            else
            {
                yumurta = yumurta - yumurtakontrol;
            }
            Console.WriteLine("Alacaginiz urunun miktarini giriniz" + (char) 13 + "Peynir ::");
            peynirkontrol = (int) readValue();
            if (peynirkontrol > peynir)
            {
                Console.WriteLine("Stokta yeterli peynir yok");
            }
            else
            {
                peynir = peynir - peynirkontrol;
            }
            Console.WriteLine("Ürünlerin Güncel Stok Durumu" + (char) 13 + (char) 13 + "Süt :: " + süt + (char) 13 + "Yumurta :: " + yumurta + (char) 13 + "Peynir :: " + peynir);
        }
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
