Imports System

Public Module MyProgram
    Sub Main
        Dim sync As Boolean
        
        sync = True
        Dim index As Integer, index2 As Integer
        
        index = 0
        index2 = 0
        Dim günler(7) As String
        
        günler(0) = "Pazartesi"
        günler(1) = "Salı"
        günler(2) = "Çarşamba"
        günler(3) = "Perşembe"
        günler(4) = "Cuma"
        günler(5) = "Cumartesi"
        günler(6) = "Pazar"
        Do While sync
            If index = 7 Then
            Else
                index = index + 1
                Console.WriteLine("Haftanın " & index.ToString() & ". Günü: " & günler(index2))
                Delay(1)
                
                ' Çıktı 1 saniye süreyle atılır.
                index2 = index2 + 1
            End If
        Loop
    End Sub
    
    Private Function Delay(sn As Integer) As Boolean
        Dim sonuc As Boolean
        Dim ms As Integer
        
        ms = sn * 33333
        Dim n As Integer
        
        n = 0
        Do While n <> ms
            n = n + 1
        Loop
        sonuc = True
        
        Return sonuc
    End Function
End Module
