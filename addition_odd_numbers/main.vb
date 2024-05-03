Imports System

Public Module MyProgram
    Sub Main
        Dim sayı As Integer, sonuc As Integer, giris As Integer, giris2 As Integer, tempsonuc As Integer
        Dim debug As String
        
        sayı = 1
        sonuc = 0
        Console.WriteLine("2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: ")
        giris = readValue()
        Delay(1)
        Console.WriteLine("2. Sayıyı Belirleyin: ")
        giris2 = readValue()
        Delay(1)
        Console.WriteLine("Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın.")
        debug = Console.ReadLine()
        If giris > giris2 Then
            Dim af1 As Integer
            Dim af2 As Integer
            
            af1 = giris
            af2 = giris2
            giris = af2
            giris2 = af1
        Else
            
            ' İlk giriş, 2. girişten küçük ise program çalışmaz.
            ' 
            ' Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
        End If
        For sayı = giris To giris2
            If sayı Mod 2 = 1 Then
                tempsonuc = sonuc
                sonuc = sonuc + sayı
                If debug = "n" Or debug = "N" Then
                    
                    ' es geç
                Else
                    Console.WriteLine(tempsonuc.ToString() & "+" & sayı.ToString() & ": " & sonuc.ToString())
                End If
            End If
        Next
        Console.WriteLine("Sonuc: " & sonuc)
    End Sub
    
    Private Function Delay(sn As Integer) As Boolean
        Dim sonuc As Boolean
        Dim ms As Integer
        
        ms = sn * 30000
        Dim n As Integer
        
        n = 0
        Do While n <> ms
            n = n + 1
        Loop
        sonuc = True
        
        Return sonuc
    End Function
    
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
