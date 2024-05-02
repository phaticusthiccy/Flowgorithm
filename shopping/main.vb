Imports System

Public Module MyProgram
    Sub Main
        Dim süt As Integer
        Dim sütkontrol As Integer
        Dim yumurta As Integer
        Dim yumurtakontrol As Integer
        Dim peynir As Integer
        Dim peynirkontrol As Integer
        
        süt = 10
        peynir = 10
        yumurta = 10
        Console.WriteLine("Ürünlerin Stok Durumu" & Strings.ChrW(13) & Strings.ChrW(13) & "Süt :: " & süt & Strings.ChrW(13) & "Yumurta :: " & yumurta & Strings.ChrW(13) & "Peynir :: " & peynir)
        Do While True
            Console.WriteLine("Alacaginiz urunun miktarini giriniz" & Strings.ChrW(13) & "Süt ::")
            sütkontrol = readValue()
            If sütkontrol > süt Then
                Console.WriteLine("Stokta yeterli sut yok")
            Else
                süt = süt - sütkontrol
            End If
            Console.WriteLine("Alacaginiz urunun miktarini giriniz" & Strings.ChrW(13) & "Yumurta ::")
            yumurtakontrol = readValue()
            If yumurtakontrol > yumurta Then
                Console.WriteLine("Stokta yeterli yumurta yok")
            Else
                yumurta = yumurta - yumurtakontrol
            End If
            Console.WriteLine("Alacaginiz urunun miktarini giriniz" & Strings.ChrW(13) & "Peynir ::")
            peynirkontrol = readValue()
            If peynirkontrol > peynir Then
                Console.WriteLine("Stokta yeterli peynir yok")
            Else
                peynir = peynir - peynirkontrol
            End If
            Console.WriteLine("Ürünlerin Güncel Stok Durumu" & Strings.ChrW(13) & Strings.ChrW(13) & "Süt :: " & süt & Strings.ChrW(13) & "Yumurta :: " & yumurta & Strings.ChrW(13) & "Peynir :: " & peynir)
        Loop
    End Sub
    
    ' .NET can only read single characters or entire lines from the console.
    ' The following function safely reads a double value.
    Private Function readValue() As Double
        Dim result As Double
        While Not Double.TryParse(Console.ReadLine(), result)
            ' No code in the loop
        End While
        Return result
    End Function
End Module
