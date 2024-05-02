Option Explicit

Sub Main
    Dim Süt As Integer
    Dim Sütkontrol As Integer
    Dim Yumurta As Integer
    Dim Yumurtakontrol As Integer
    Dim Peynir As Integer
    Dim Peynirkontrol As Integer
    
    Süt = 10
    Peynir = 10
    Yumurta = 10
    Output "Ürünlerin Stok Durumu" & ChrW(13) & ChrW(13) & "Süt :: " & Süt & ChrW(13) & "Yumurta :: " & Yumurta & ChrW(13) & "Peynir :: " & Peynir
    Do While True
        Output "Alacaginiz urunun miktarini giriniz" & ChrW(13) & "Süt ::"
        Sütkontrol = InputValue("Please enter a value for Sütkontrol")
        If Sütkontrol > Süt Then
            Output "Stokta yeterli sut yok"
        Else
            Süt = Süt - Sütkontrol
        End If
        Output "Alacaginiz urunun miktarini giriniz" & ChrW(13) & "Yumurta ::"
        Yumurtakontrol = InputValue("Please enter a value for Yumurtakontrol")
        If Yumurtakontrol > Yumurta Then
            Output "Stokta yeterli yumurta yok"
        Else
            Yumurta = Yumurta - Yumurtakontrol
        End If
        Output "Alacaginiz urunun miktarini giriniz" & ChrW(13) & "Peynir ::"
        Peynirkontrol = InputValue("Please enter a value for Peynirkontrol")
        If Peynirkontrol > Peynir Then
            Output "Stokta yeterli peynir yok"
        Else
            Peynir = Peynir - Peynirkontrol
        End If
        Output "Ürünlerin Güncel Stok Durumu" & ChrW(13) & ChrW(13) & "Süt :: " & Süt & ChrW(13) & "Yumurta :: " & Yumurta & ChrW(13) & "Peynir :: " & Peynir
    Loop
End Sub

' These functions are used to input data. You can change these to another source.
Function InputValue(Prompt As String) As Double
    InputValue = Val(InputBox(Prompt))
End Function

Function InputText(Prompt As String) As String
    InputText = InputBox(Prompt)
End Function

' This function is used to output data. You can change this to another source.
Sub Output(Text As Variant)
    Msgbox Text
End Sub
