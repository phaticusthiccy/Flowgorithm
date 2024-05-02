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
string vki(int kilo, int boy);

int main() {
    int kilo;
    double boy;
    
    cout << "Lütfen Kilonuzu Giriniz:   (Ex: 69)  " << endl;
    cin >> kilo;
    delay(1);
    cout << "Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  " << endl;
    cin >> boy;
    string tab;
    string cümle;
    
    cümle = "VKI Tablosunda ";
    if (vki(kilo, (int) boy) == "zayıf") {
        tab = cümle + "'Zayıf' Bölümündesin";
    } else {
        if (vki(kilo, (int) boy) == "normal") {
            tab = cümle + "'Normal' Bölümdesin";
        } else {
            if (vki(kilo, (int) boy) == "kilolu") {
                tab = cümle + "'Fazla Kilolu' Bölümdesin";
            } else {
                if (vki(kilo, (int) boy) == "1. obez") {
                    tab = cümle + "'1. Obez' Bölümündesin";
                } else {
                    if (vki(kilo, (int) boy) == "2. obez") {
                        tab = cümle + "'2. Obez' Bölümündesin";
                    } else {
                        if (vki(kilo, (int) boy) == "3. obez") {
                            tab = cümle + "'3. Obez' Bölümündesin";
                        }
                    }
                }
            }
        }
    }
    cout << tab << endl;
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

string vki(int kilo, int boy) {
    string sonuc;
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
