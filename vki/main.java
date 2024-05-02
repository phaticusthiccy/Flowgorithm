import java.util.*;
import java.lang.Math;

public class JavaApplication {
    private static Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
        int kilo;
        double boy;
        
        System.out.println("Lütfen Kilonuzu Giriniz:   (Ex: 69)  ");
        kilo = input.nextInt();
        delay(1);
        System.out.println("Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ");
        boy = input.nextDouble();
        String tab;
        String cümle;
        
        cümle = "VKI Tablosunda ";
        if (vki(kilo, (int) boy).equals("zayıf")) {
            tab = cümle + "'Zayıf' Bölümündesin";
        } else {
            if (vki(kilo, (int) boy).equals("normal")) {
                tab = cümle + "'Normal' Bölümdesin";
            } else {
                if (vki(kilo, (int) boy).equals("kilolu")) {
                    tab = cümle + "'Fazla Kilolu' Bölümdesin";
                } else {
                    if (vki(kilo, (int) boy).equals("1. obez")) {
                        tab = cümle + "'1. Obez' Bölümündesin";
                    } else {
                        if (vki(kilo, (int) boy).equals("2. obez")) {
                            tab = cümle + "'2. Obez' Bölümündesin";
                        } else {
                            if (vki(kilo, (int) boy).equals("3. obez")) {
                                tab = cümle + "'3. Obez' Bölümündesin";
                            }
                        }
                    }
                }
            }
        }
        System.out.println(tab);
    }
    
    public static boolean delay(int sn) {
        boolean sonuc;
        int ms;
        
        ms = sn * 33333;
        int n;
        
        n = 0;
        while (n != ms) {
            n = n + 1;
        }
        sonuc = true;
        
        return sonuc;
    }
    
    public static String vki(int kilo, int boy) {
        String sonuc;
        int index;
        
        index = (int) ((double) kilo / (boy * boy));
        if (index < 18) {
            sonuc = "zayıf";
        } else {
            if (index < 25) {
                sonuc = "normal";
            } else {
                if (index < 30) {
                    sonuc = "kilolu";
                } else {
                    if (index < 35) {
                        sonuc = "1. obez";
                    } else {
                        if (index < 40) {
                            sonuc = "2. obez";
                        } else {
                            sonuc = "3. obez";
                        }
                    }
                }
            }
        }
        
        return sonuc;
    }
}
