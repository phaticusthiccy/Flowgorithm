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

int main() {
    int süt;
    int sütkontrol;
    int yumurta;
    int yumurtakontrol;
    int peynir;
    int peynirkontrol;
    
    süt = 10;
    peynir = 10;
    yumurta = 10;
    cout << "Ürünlerin Stok Durumu" << (char) 13 << (char) 13 << "Süt :: " << süt << (char) 13 << "Yumurta :: " << yumurta << (char) 13 << "Peynir :: " << peynir << endl;
    while (true) {
        cout << "Alacaginiz urunun miktarini giriniz" << (char) 13 << "Süt ::" << endl;
        cin >> sütkontrol;
        if (sütkontrol > süt) {
            cout << "Stokta yeterli sut yok" << endl;
        } else {
            süt = süt - sütkontrol;
        }
        cout << "Alacaginiz urunun miktarini giriniz" << (char) 13 << "Yumurta ::" << endl;
        cin >> yumurtakontrol;
        if (yumurtakontrol > yumurta) {
            cout << "Stokta yeterli yumurta yok" << endl;
        } else {
            yumurta = yumurta - yumurtakontrol;
        }
        cout << "Alacaginiz urunun miktarini giriniz" << (char) 13 << "Peynir ::" << endl;
        cin >> peynirkontrol;
        if (peynirkontrol > peynir) {
            cout << "Stokta yeterli peynir yok" << endl;
        } else {
            peynir = peynir - peynirkontrol;
        }
        cout << "Ürünlerin Güncel Stok Durumu" << (char) 13 << (char) 13 << "Süt :: " << süt << (char) 13 << "Yumurta :: " << yumurta << (char) 13 << "Peynir :: " << peynir << endl;
    }
    return 0;
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
