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
    bool sync;
    
    sync = true;
    int index, index2;
    
    index = 0;
    index2 = 0;
    string günler[7];
    
    günler[0] = "Pazartesi";
    günler[1] = "Salı";
    günler[2] = "Çarşamba";
    günler[3] = "Perşembe";
    günler[4] = "Cuma";
    günler[5] = "Cumartesi";
    günler[6] = "Pazar";
    while (sync) {
        if (index == 7) {
        } else {
            index = index + 1;
            cout << "Haftanın " << toString(index) << ". Günü: " << günler[index2] << endl;
            delay(1);
            
            // Çıktı 1 saniye süreyle atılır.
            index2 = index2 + 1;
        }
    }
    return 0;
}

bool delay(int sn) {
    bool sonuc;
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
