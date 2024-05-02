import java.util.*;
import java.lang.Math;

public class JavaApplication {
    private static Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        int süt;
        int sütkontrol;
        int yumurta;
        int yumurtakontrol;
        int peynir;
        int peynirkontrol;
        
        süt = 10;
        peynir = 10;
        yumurta = 10;
        System.out.println("Ürünlerin Stok Durumu" + (char) 13 + (char) 13 + "Süt :: " + süt + (char) 13 + "Yumurta :: " + yumurta + (char) 13 + "Peynir :: " + peynir);
        while (true) {
            System.out.println("Alacaginiz urunun miktarini giriniz" + (char) 13 + "Süt ::");
            sütkontrol = input.nextInt();
            if (sütkontrol > süt) {
                System.out.println("Stokta yeterli sut yok");
            } else {
                süt = süt - sütkontrol;
            }
            System.out.println("Alacaginiz urunun miktarini giriniz" + (char) 13 + "Yumurta ::");
            yumurtakontrol = input.nextInt();
            if (yumurtakontrol > yumurta) {
                System.out.println("Stokta yeterli yumurta yok");
            } else {
                yumurta = yumurta - yumurtakontrol;
            }
            System.out.println("Alacaginiz urunun miktarini giriniz" + (char) 13 + "Peynir ::");
            peynirkontrol = input.nextInt();
            if (peynirkontrol > peynir) {
                System.out.println("Stokta yeterli peynir yok");
            } else {
                peynir = peynir - peynirkontrol;
            }
            System.out.println("Ürünlerin Güncel Stok Durumu" + (char) 13 + (char) 13 + "Süt :: " + süt + (char) 13 + "Yumurta :: " + yumurta + (char) 13 + "Peynir :: " + peynir);
        }
    }
}
