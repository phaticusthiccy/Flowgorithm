Option Explicit

Sub Main
    Dim Sync As Boolean
    
    Sync = True
    Dim İndex As Integer, İndex2 As Integer
    
    İndex = 0
    İndex2 = 0
    Dim Günler(7) As String
    
    Günler(0) = "Pazartesi"
    Günler(1) = "Salı"
    Günler(2) = "Çarşamba"
    Günler(3) = "Perşembe"
    Günler(4) = "Cuma"
    Günler(5) = "Cumartesi"
    Günler(6) = "Pazar"
    Do While Sync
        If İndex = 7 Then
        Else
            İndex = İndex + 1
            Output "Haftanın " & CStr(İndex) & ". Günü: " & Günler(İndex2)
            Delay 1
            
            ' Çıktı 1 saniye süreyle atılır.
            İndex2 = İndex2 + 1
        End If
    Loop
End Sub

Function Delay(byval Sn As Integer) As Boolean
    Dim Sonuc As Boolean
    Dim Ms As Integer
    
    Ms = Sn * 33333
    Dim n As Integer
    
    n = 0
    Do While n <> Ms
        n = n + 1
    Loop
    Sonuc = True
    
    Delay = Sonuc
End Function

' This function is used to output data. You can change this to another source.
Sub Output(Text As Variant)
    Msgbox Text
End Sub
