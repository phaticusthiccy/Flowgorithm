import java.util.*;
import java.lang.Math;

public class JavaApplication {
    private static Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        double[] fsayı = new double[7];
        
        // Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
        // // var fsayı = new Array()
        String islem;
        
        System.out.println("'a' Sayısının Değerini Girin: ");
        fsayı[0] = input.nextDouble();
        System.out.println("'b' Sayısının Değerini Girin: ");
        fsayı[1] = input.nextDouble();
        System.out.println("'c' Sayısının Değerini Girin: ");
        fsayı[2] = input.nextDouble();
        fsayı[3] = formül((int) fsayı[0], (int) fsayı[1], (int) fsayı[2]);
        
        // Delta Formülü
        // // formül(a = reel, b = ree, c = ree)
        System.out.println("Program İşleyişini Görmek İster misiniz? (Y yada N): ");
        islem = input.nextLine();
        if (islem.equals("y") || islem.equals("Y")) {
            
            // "Görünür İşlemler"
            if (fonksiyon(fsayı[3], fsayı[0], fsayı[1]).equals("pass")) {
                
                // 2 kök içeren sonuçlar buraya yazılır.
                // Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
                // Sonuç için Gerekli Formül
                // 
                // // fonksiyon(delta = reel, a = reel, b = reel)
                // // return str
                System.out.println("Kök 1: " + (-fsayı[1] + Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
                System.out.println("Kök 2: " + (-fsayı[1] - Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
                
                // Kök formülleri yazıldı.
                System.out.println("Formüller: " + (char) 13 + (char) 13 + "Delta Hesabı" + (char) 13 + "Delta = " + fsayı[1].toString() + "^2-4*" + fsayı[0].toString() + "*" + fsayı[2].toString() + (char) 13 + (char) 13 + "====================" + (char) 13 + (char) 13 + "X1 İçin:" + (char) 13 + "(-" + fsayı[1].toString() + "+(" + fsayı[3].toString() + "^(1/2))) / (2*" + fsayı[0].toString() + ")" + (char) 13 + (char) 13 + "X2 İçin:" + (char) 13 + "(-" + fsayı[1].toString() + "-(" + fsayı[3].toString() + "^(1/2))) / (2*" + fsayı[0].toString() + ")");
            } else {
                String text;
                
                text = fonksiyon(fsayı[3], fsayı[0], fsayı[1]);
                
                // İkincil bir fonksiyon ata.
                // İlk işlem sonuç verirse buraya dön.
                if (text.equals("Kök Bulunamadı")) {
                    System.out.println(text + (char) 13 + (char) 13 + "Delta 0'a eşittir. Bu yüzden kök yoktur.");
                } else {
                    System.out.println(text + (char) 13 + (char) 13 + "Formül = -" + fsayı[1].toString() + "/ 2*" + fsayı[0].toString());
                }
            }
        } else {
            
            // "Kapalı İşlemler"
            if (fonksiyon(fsayı[3], fsayı[0], fsayı[1]).equals("pass")) {
                System.out.println("Kök 1: " + (-fsayı[1] + Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
                System.out.println("Kök 2: " + (-fsayı[1] - Math.sqrt(fsayı[3])) / (2 * fsayı[0]));
            } else {
                System.out.println(fonksiyon(fsayı[3], fsayı[0], fsayı[1]));
            }
        }
        
        // Programı Kapat. (return True)
    }
    
    public static String fonksiyon(double deger, double a, double b) {
        String sonuc;
        
        if (deger < 0) {
            sonuc = "Kök Bulunamadı";
        } else {
            if (deger == 0) {
                sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " + (-b / 2 * a).toString();
            } else {
                sonuc = "pass";
            }
        }
        
        return sonuc;
    }
    
    public static double formül(int a, int b, int c) {
        double sonuc;
        
        sonuc = b * b - 4 * a * c;
        
        return sonuc;
    }
}
