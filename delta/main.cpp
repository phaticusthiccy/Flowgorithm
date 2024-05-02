#include <iostream>
#include <sstream>
#include <string>
#include <cstdlib>
#include <cmath>

using namespace std;

// Headers
string toString (double);
int toInt (string);
double toDouble (string);
string fonksiyon(double deger, double a, double b);
double formül(int a, int b, int c);

int main() {
    double fsayı[7];
    
    // Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
    // // var fsayı = new Array()
    string islem;
    
    cout << "'a' Sayısının Değerini Girin: " << endl;
    cin >> fsayı[0];
    cout << "'b' Sayısının Değerini Girin: " << endl;
    cin >> fsayı[1];
    cout << "'c' Sayısının Değerini Girin: " << endl;
    cin >> fsayı[2];
    fsayı[3] = formül((int) fsayı[0], (int) fsayı[1], (int) fsayı[2]);
    
    // Delta Formülü
    // // formül(a = reel, b = ree, c = ree)
    cout << "Program İşleyişini Görmek İster misiniz? (Y yada N): " << endl;
    cin >> islem;
    if (islem == "y" || islem == "Y") {
        
        // "Görünür İşlemler"
        if (fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass") {
            
            // 2 kök içeren sonuçlar buraya yazılır.
            // Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
            // Sonuç için Gerekli Formül
            // 
            // // fonksiyon(delta = reel, a = reel, b = reel)
            // // return str
            cout << "Kök 1: " << (-fsayı[1] + sqrt(fsayı[3])) / (2 * fsayı[0]) << endl;
            cout << "Kök 2: " << (-fsayı[1] - sqrt(fsayı[3])) / (2 * fsayı[0]) << endl;
            
            // Kök formülleri yazıldı.
            cout << "Formüller: " << (char) 13 << (char) 13 << "Delta Hesabı" << (char) 13 << "Delta = " << toString(fsayı[1]) << "^2-4*" << toString(fsayı[0]) << "*" << toString(fsayı[2]) << (char) 13 << (char) 13 << "====================" << (char) 13 << (char) 13 << "X1 İçin:" << (char) 13 << "(-" << toString(fsayı[1]) << "+(" << toString(fsayı[3]) << "^(1/2))) / (2*" << toString(fsayı[0]) << ")" << (char) 13 << (char) 13 << "X2 İçin:" << (char) 13 << "(-" << toString(fsayı[1]) << "-(" << toString(fsayı[3]) << "^(1/2))) / (2*" << toString(fsayı[0]) << ")" << endl;
        } else {
            string text;
            
            text = fonksiyon(fsayı[3], fsayı[0], fsayı[1]);
            
            // İkincil bir fonksiyon ata.
            // İlk işlem sonuç verirse buraya dön.
            if (text == "Kök Bulunamadı") {
                cout << text << (char) 13 << (char) 13 << "Delta 0'a eşittir. Bu yüzden kök yoktur." << endl;
            } else {
                cout << text << (char) 13 << (char) 13 << "Formül = -" << toString(fsayı[1]) << "/ 2*" << toString(fsayı[0]) << endl;
            }
        }
    } else {
        
        // "Kapalı İşlemler"
        if (fonksiyon(fsayı[3], fsayı[0], fsayı[1]) == "pass") {
            cout << "Kök 1: " << (-fsayı[1] + sqrt(fsayı[3])) / (2 * fsayı[0]) << endl;
            cout << "Kök 2: " << (-fsayı[1] - sqrt(fsayı[3])) / (2 * fsayı[0]) << endl;
        } else {
            cout << fonksiyon(fsayı[3], fsayı[0], fsayı[1]) << endl;
        }
    }
    
    // Programı Kapat. (return True)
    return 0;
}

string fonksiyon(double deger, double a, double b) {
    string sonuc;
    
    if (deger < 0) {
        sonuc = "Kök Bulunamadı";
    } else {
        if (deger == 0) {
            sonuc = string("1. ve 2. Kökler Eşittir. Sonuç: ") + toString(-b / 2 * a);
        } else {
            sonuc = "pass";
        }
    }
    
    return sonuc;
}

double formül(int a, int b, int c) {
    double sonuc;
    
    sonuc = b * b - 4 * a * c;
    
    return sonuc;
}

// The following implements type conversion functions.
string toString (double value) { //int also
    stringstream temp;
    temp << value;
    return temp.str();
}

int toInt (string text) {
    return atoi(text.c_str());
}

double toDouble (string text) {
    return atof(text.c_str());
}
