include Math

süt = 10
peynir = 10
yumurta = 10
puts "Ürünlerin Stok Durumu" + 13.chr + 13.chr + "Süt :: " + süt.to_s + 13.chr + "Yumurta :: " + yumurta.to_s + 13.chr + "Peynir :: " + peynir.to_s
while true
    puts "Alacaginiz urunun miktarini giriniz" + 13.chr + "Süt ::"
    sütkontrol = gets.chomp.to_i
    if sütkontrol > süt
        puts "Stokta yeterli sut yok"
    else
        süt = süt - sütkontrol
    end
    puts "Alacaginiz urunun miktarini giriniz" + 13.chr + "Yumurta ::"
    yumurtakontrol = gets.chomp.to_i
    if yumurtakontrol > yumurta
        puts "Stokta yeterli yumurta yok"
    else
        yumurta = yumurta - yumurtakontrol
    end
    puts "Alacaginiz urunun miktarini giriniz" + 13.chr + "Peynir ::"
    peynirkontrol = gets.chomp.to_i
    if peynirkontrol > peynir
        puts "Stokta yeterli peynir yok"
    else
        peynir = peynir - peynirkontrol
    end
    puts "Ürünlerin Güncel Stok Durumu" + 13.chr + 13.chr + "Süt :: " + süt.to_s + 13.chr + "Yumurta :: " + yumurta.to_s + 13.chr + "Peynir :: " + peynir.to_s
end
