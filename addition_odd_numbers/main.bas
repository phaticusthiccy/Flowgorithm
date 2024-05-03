Option Explicit

Sub Main
    Dim Sayı As Integer, Sonuc As Integer, Giris As Integer, Giris2 As Integer, Tempsonuc As Integer
    Dim Debug As String
    
    Sayı = 1
    Sonuc = 0
    Output "2 Sayı Arasındaki Tüm Tek Sayıları Toplamak İçin İlk Sayıyı Belirleyin: "
    Giris = InputValue("Please enter a value for Giris")
    Delay 1
    Output "2. Sayıyı Belirleyin: "
    Giris2 = InputValue("Please enter a value for Giris2")
    Delay 1
    Output "Programın İşleyişini Görmek İçin 'Y', Direk Sonucu Görmek İçin 'N' yazın."
    Debug = InputText("Please enter a value for Debug")
    If Giris > Giris2 Then
        Dim Af1 As Integer
        Dim Af2 As Integer
        
        Af1 = Giris
        Af2 = Giris2
        Giris = Af2
        Giris2 = Af1
    Else
        
        ' İlk giriş, 2. girişten küçük ise program çalışmaz.
        ' 
        ' Eğer bu koşul sağlanırsa iki girişin yerlerini değiştirmemiz gerekir.
    End If
    For Sayı = Giris To Giris2
        If Sayı Mod 2 = 1 Then
            Tempsonuc = Sonuc
            Sonuc = Sonuc + Sayı
            If Debug = "n" Or Debug = "N" Then
                
                ' es geç
            Else
                Output CStr(Tempsonuc) & "+" & CStr(Sayı) & ": " & CStr(Sonuc)
            End If
        End If
    Next
    Output "Sonuc: " & Sonuc
End Sub

Function Delay(byval Sn As Integer) As Boolean
    Dim Sonuc As Boolean
    Dim Ms As Integer
    
    Ms = Sn * 30000
    Dim n As Integer
    
    n = 0
    Do While n <> Ms
        n = n + 1
    Loop
    Sonuc = True
    
    Delay = Sonuc
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
