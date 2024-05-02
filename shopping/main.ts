function main() {
    var süt: number;
    var sütkontrol: number;
    var yumurta: number;
    var yumurtakontrol: number;
    var peynir: number;
    var peynirkontrol: number;
    
    süt = 10;
    peynir = 10;
    yumurta = 10;
    output("Ürünlerin Stok Durumu" + String.fromCharCode(13) + String.fromCharCode(13) + "Süt :: " + süt + String.fromCharCode(13) + "Yumurta :: " + yumurta + String.fromCharCode(13) + "Peynir :: " + peynir);
    while (true) {
        output("Alacaginiz urunun miktarini giriniz" + String.fromCharCode(13) + "Süt ::");
        sütkontrol = input();
        if (sütkontrol > süt) {
            output("Stokta yeterli sut yok");
        } else {
            süt = süt - sütkontrol;
        }
        output("Alacaginiz urunun miktarini giriniz" + String.fromCharCode(13) + "Yumurta ::");
        yumurtakontrol = input();
        if (yumurtakontrol > yumurta) {
            output("Stokta yeterli yumurta yok");
        } else {
            yumurta = yumurta - yumurtakontrol;
        }
        output("Alacaginiz urunun miktarini giriniz" + String.fromCharCode(13) + "Peynir ::");
        peynirkontrol = input();
        if (peynirkontrol > peynir) {
            output("Stokta yeterli peynir yok");
        } else {
            peynir = peynir - peynirkontrol;
        }
        output("Ürünlerin Güncel Stok Durumu" + String.fromCharCode(13) + String.fromCharCode(13) + "Süt :: " + süt + String.fromCharCode(13) + "Yumurta :: " + yumurta + String.fromCharCode(13) + "Peynir :: " + peynir);
    }
}

// The following function is used to input. You can change it to use another webpage element.
function input (name) {
    return window.prompt("Please enter a value for " + name, "");
}

// The following function is called to output. You can change it to use another webpage element.
function output (text) {
    return window.alert(text);
}
