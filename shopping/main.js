function main() {
    var süt;
    var sütkontrol;
    var yumurta;
    var yumurtakontrol;
    var peynir;
    var peynirkontrol;
    
    süt = 10;
    peynir = 10;
    yumurta = 10;
    window.alert("Ürünlerin Stok Durumu" + String.fromCharCode(13) + String.fromCharCode(13) + "Süt :: " + süt + String.fromCharCode(13) + "Yumurta :: " + yumurta + String.fromCharCode(13) + "Peynir :: " + peynir);
    while (true) {
        window.alert("Alacaginiz urunun miktarini giriniz" + String.fromCharCode(13) + "Süt ::");
        sütkontrol = window.prompt('Enter a value for sütkontrol');
        if (sütkontrol > süt) {
            window.alert("Stokta yeterli sut yok");
        } else {
            süt = süt - sütkontrol;
        }
        window.alert("Alacaginiz urunun miktarini giriniz" + String.fromCharCode(13) + "Yumurta ::");
        yumurtakontrol = window.prompt('Enter a value for yumurtakontrol');
        if (yumurtakontrol > yumurta) {
            window.alert("Stokta yeterli yumurta yok");
        } else {
            yumurta = yumurta - yumurtakontrol;
        }
        window.alert("Alacaginiz urunun miktarini giriniz" + String.fromCharCode(13) + "Peynir ::");
        peynirkontrol = window.prompt('Enter a value for peynirkontrol');
        if (peynirkontrol > peynir) {
            window.alert("Stokta yeterli peynir yok");
        } else {
            peynir = peynir - peynirkontrol;
        }
        window.alert("Ürünlerin Güncel Stok Durumu" + String.fromCharCode(13) + String.fromCharCode(13) + "Süt :: " + süt + String.fromCharCode(13) + "Yumurta :: " + yumurta + String.fromCharCode(13) + "Peynir :: " + peynir);
    }
}
