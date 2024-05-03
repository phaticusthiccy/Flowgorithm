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
bool delay(int sn);

int main() {
    int sayı, sonuc, giris, giris2, tempsonuc;
    string debug;
    
    sayı = 1;
    sonuc = 0;
    cout << "2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: " << endl;
    cin >> giris;
    delay(1);
    cout << "2. Sayıyı Belirleyin: " << endl;
    cin >> giris2;
    delay(1);
    cout << "Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın." << endl;
    cin >> debug;
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
            if (debug == "n" || debug == "N") {
                
                // es geç
            } else {
                cout << toString(tempsonuc) << "+" << toString(sayı) << ": " << toString(sonuc) << endl;
            }
        }
    }
    cout << "Sonuc: " << sonuc << endl;
    return 0;
}

bool delay(int sn) {
    bool sonuc;
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
