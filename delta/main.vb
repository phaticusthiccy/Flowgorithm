Imports System

Public Module MyProgram
    Sub Main
        Dim fsayı(7) As Double
        
        ' Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
        ' // var fsayı = new Array()
        Dim islem As String
        
        Console.WriteLine("'a' Sayısının Değerini Girin: ")
        fsayı(0) = readValue()
        Console.WriteLine("'b' Sayısının Değerini Girin: ")
        fsayı(1) = readValue()
        Console.WriteLine("'c' Sayısının Değerini Girin: ")
        fsayı(2) = readValue()
        fsayı(3) = Formül(fsayı(0), fsayı(1), fsayı(2))
        
        ' Delta Formülü
        ' // formül(a = reel, b = ree, c = ree)
        Console.WriteLine("Program İşleyişini Görmek İster misiniz? (Y yada N): ")
        islem = Console.ReadLine()
        If islem = "y" Or islem = "Y" Then
            
            ' "Görünür İşlemler"
            If Fonksiyon(fsayı(3), fsayı(0), fsayı(1)) = "pass" Then
                
                ' 2 kök içeren sonuçlar buraya yazılır.
                ' Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
                ' Sonuç için Gerekli Formül
                ' 
                ' // fonksiyon(delta = reel, a = reel, b = reel)
                ' // return str
                Console.WriteLine("Kök 1: " & (-fsayı(1) + Math.Sqrt(fsayı(3))) / (2 * fsayı(0)))
                Console.WriteLine("Kök 2: " & (-fsayı(1) - Math.Sqrt(fsayı(3))) / (2 * fsayı(0)))
                
                ' Kök formülleri yazıldı.
                Console.WriteLine("Formüller: " & Strings.ChrW(13) & Strings.ChrW(13) & "Delta Hesabı" & Strings.ChrW(13) & "Delta = " & fsayı(1).ToString() & "^2-4*" & fsayı(0).ToString() & "*" & fsayı(2).ToString() & Strings.ChrW(13) & Strings.ChrW(13) & "====================" & Strings.ChrW(13) & Strings.ChrW(13) & "X1 İçin:" & Strings.ChrW(13) & "(-" & fsayı(1).ToString() & "+(" & fsayı(3).ToString() & "^(1/2))) / (2*" & fsayı(0).ToString() & ")" & Strings.ChrW(13) & Strings.ChrW(13) & "X2 İçin:" & Strings.ChrW(13) & "(-" & fsayı(1).ToString() & "-(" & fsayı(3).ToString() & "^(1/2))) / (2*" & fsayı(0).ToString() & ")")
            Else
                Dim text As String
                
                text = Fonksiyon(fsayı(3), fsayı(0), fsayı(1))
                
                ' İkincil bir fonksiyon ata.
                ' İlk işlem sonuç verirse buraya dön.
                If text = "Kök Bulunamadı" Then
                    Console.WriteLine(text & Strings.ChrW(13) & Strings.ChrW(13) & "Delta 0'a eşittir. Bu yüzden kök yoktur.")
                Else
                    Console.WriteLine(text & Strings.ChrW(13) & Strings.ChrW(13) & "Formül = -" & fsayı(1).ToString() & "/ 2*" & fsayı(0).ToString())
                End If
            End If
        Else
            
            ' "Kapalı İşlemler"
            If Fonksiyon(fsayı(3), fsayı(0), fsayı(1)) = "pass" Then
                Console.WriteLine("Kök 1: " & (-fsayı(1) + Math.Sqrt(fsayı(3))) / (2 * fsayı(0)))
                Console.WriteLine("Kök 2: " & (-fsayı(1) - Math.Sqrt(fsayı(3))) / (2 * fsayı(0)))
            Else
                Console.WriteLine(Fonksiyon(fsayı(3), fsayı(0), fsayı(1)))
            End If
        End If
        
        ' Programı Kapat. (return True)
    End Sub
    
    Private Function Fonksiyon(deger As Double, a As Double, b As Double) As String
        Dim sonuc As String
        
        If deger < 0 Then
            sonuc = "Kök Bulunamadı"
        Else
            If deger = 0 Then
                sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " & (-b / 2 * a).ToString()
            Else
                sonuc = "pass"
            End If
        End If
        
        Return sonuc
    End Function
    
    Private Function Formül(a As Integer, b As Integer, c As Integer) As Double
        Dim sonuc As Double
        
        sonuc = b * b - 4 * a * c
        
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
