Option Explicit

Sub Main
    Dim Fsayı(7) As Double
    
    ' Dizi Kullanımı String Methoda Göre Daha Hızlıdır.
    ' // var fsayı = new Array()
    Dim İslem As String
    
    Output "'a' Sayısının Değerini Girin: "
    Fsayı(0) = InputValue("Please enter a value for Fsayı(0)")
    Output "'b' Sayısının Değerini Girin: "
    Fsayı(1) = InputValue("Please enter a value for Fsayı(1)")
    Output "'c' Sayısının Değerini Girin: "
    Fsayı(2) = InputValue("Please enter a value for Fsayı(2)")
    Fsayı(3) = Formül(Fsayı(0), Fsayı(1), Fsayı(2))
    
    ' Delta Formülü
    ' // formül(a = reel, b = ree, c = ree)
    Output "Program İşleyişini Görmek İster misiniz? (Y yada N): "
    İslem = InputText("Please enter a value for İslem")
    If İslem = "y" Or İslem = "Y" Then
        
        ' "Görünür İşlemler"
        If Fonksiyon(Fsayı(3), Fsayı(0), Fsayı(1)) = "pass" Then
            
            ' 2 kök içeren sonuçlar buraya yazılır.
            ' Flowgorithm fonksiyon dönüşlerinde array(dizi) desteklemediği için formülü elle uygulamamız gerekir.
            ' Sonuç için Gerekli Formül
            ' 
            ' // fonksiyon(delta = reel, a = reel, b = reel)
            ' // return str
            Output "Kök 1: " & (-Fsayı(1) + Sqr(Fsayı(3))) / (2 * Fsayı(0))
            Output "Kök 2: " & (-Fsayı(1) - Sqr(Fsayı(3))) / (2 * Fsayı(0))
            
            ' Kök formülleri yazıldı.
            Output "Formüller: " & ChrW(13) & ChrW(13) & "Delta Hesabı" & ChrW(13) & "Delta = " & CStr(Fsayı(1)) & "^2-4*" & CStr(Fsayı(0)) & "*" & CStr(Fsayı(2)) & ChrW(13) & ChrW(13) & "====================" & ChrW(13) & ChrW(13) & "X1 İçin:" & ChrW(13) & "(-" & CStr(Fsayı(1)) & "+(" & CStr(Fsayı(3)) & "^(1/2))) / (2*" & CStr(Fsayı(0)) & ")" & ChrW(13) & ChrW(13) & "X2 İçin:" & ChrW(13) & "(-" & CStr(Fsayı(1)) & "-(" & CStr(Fsayı(3)) & "^(1/2))) / (2*" & CStr(Fsayı(0)) & ")"
        Else
            Dim Text As String
            
            Text = Fonksiyon(Fsayı(3), Fsayı(0), Fsayı(1))
            
            ' İkincil bir fonksiyon ata.
            ' İlk işlem sonuç verirse buraya dön.
            If Text = "Kök Bulunamadı" Then
                Output Text & ChrW(13) & ChrW(13) & "Delta 0'a eşittir. Bu yüzden kök yoktur."
            Else
                Output Text & ChrW(13) & ChrW(13) & "Formül = -" & CStr(Fsayı(1)) & "/ 2*" & CStr(Fsayı(0))
            End If
        End If
    Else
        
        ' "Kapalı İşlemler"
        If Fonksiyon(Fsayı(3), Fsayı(0), Fsayı(1)) = "pass" Then
            Output "Kök 1: " & (-Fsayı(1) + Sqr(Fsayı(3))) / (2 * Fsayı(0))
            Output "Kök 2: " & (-Fsayı(1) - Sqr(Fsayı(3))) / (2 * Fsayı(0))
        Else
            Output Fonksiyon(Fsayı(3), Fsayı(0), Fsayı(1))
        End If
    End If
    
    ' Programı Kapat. (return True)
End Sub

Function Fonksiyon(byval Deger As Double, byval a As Double, byval b As Double) As String
    Dim Sonuc As String
    
    If Deger < 0 Then
        Sonuc = "Kök Bulunamadı"
    Else
        If Deger = 0 Then
            Sonuc = "1. ve 2. Kökler Eşittir. Sonuç: " & CStr(-b / 2 * a)
        Else
            Sonuc = "pass"
        End If
    End If
    
    Fonksiyon = Sonuc
End Function

Function Formül(byval a As Integer, byval b As Integer, byval c As Integer) As Double
    Dim Sonuc As Double
    
    Sonuc = b * b - 4 * a * c
    
    Formül = Sonuc
End Function

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
