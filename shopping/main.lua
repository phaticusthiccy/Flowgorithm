local süt
local sütkontrol
local yumurta
local yumurtakontrol
local peynir
local peynirkontrol

süt = 10
peynir = 10
yumurta = 10
io.write("Ürünlerin Stok Durumu", string.char(13), string.char(13), "Süt :: ", süt, string.char(13), "Yumurta :: ", yumurta, string.char(13), "Peynir :: ", peynir, "\n")
while true do
    io.write("Alacaginiz urunun miktarini giriniz", string.char(13), "Süt ::", "\n")
    sütkontrol = tonumber(io.read())
    if sütkontrol > süt then
        io.write("Stokta yeterli sut yok", "\n")
    else
        süt = süt - sütkontrol
    end
    io.write("Alacaginiz urunun miktarini giriniz", string.char(13), "Yumurta ::", "\n")
    yumurtakontrol = tonumber(io.read())
    if yumurtakontrol > yumurta then
        io.write("Stokta yeterli yumurta yok", "\n")
    else
        yumurta = yumurta - yumurtakontrol
    end
    io.write("Alacaginiz urunun miktarini giriniz", string.char(13), "Peynir ::", "\n")
    peynirkontrol = tonumber(io.read())
    if peynirkontrol > peynir then
        io.write("Stokta yeterli peynir yok", "\n")
    else
        peynir = peynir - peynirkontrol
    end
    io.write("Ürünlerin Güncel Stok Durumu", string.char(13), string.char(13), "Süt :: ", süt, string.char(13), "Yumurta :: ", yumurta, string.char(13), "Peynir :: ", peynir, "\n")
end
