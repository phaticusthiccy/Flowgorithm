import java.util.*;
import java.lang.Math;

public class JavaApplication {
    private static Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        int sayı, sonuc, giris, giris2, tempsonuc;
        String debug;
        
        sayı = 1;
        sonuc = 0;
        System.out.println("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ");
        giris = input.nextInt();
        delay(1);
        System.out.println("2. Sayıyı Belirleyin: ");
        giris2 = input.nextInt();
        delay(1);
        System.out.println("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın.");
        debug = input.nextLine();
        if (giris > giris2) {
            int af1;
            int af2;
            
            af1 = giris;
            af2 = giris2;
            giris = af2;
            giris2 = af1;
        } else {
            
            // İlk giriş, 2. girişten küçük ise program çalışmaz.
            // 
            // Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
        }
        for (sayı = giris; sayı <= giris2; sayı++) {
            if (sayı % 2 == 1) {
                tempsonuc = sonuc;
                sonuc = sonuc + sayı;
                if (debug.equals("n") || debug.equals("N")) {
                    
                    // es geç
                } else {
                    System.out.println(tempsonuc.toString() + "+" + sayı.toString() + ": " + sonuc.toString());
                }
            }
        }
        System.out.println("Sonuc: " + sonuc);
    }
    
    public static boolean delay(int sn) {
        boolean sonuc;
        int ms;
        
        ms = sn * 30000;
        int n;
        
        n = 0;
        while (n != ms) {
            n = n + 1;
        }
        sonuc = true;
        
        return sonuc;
    }
}
