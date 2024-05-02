Imports System

Public Module MyProgram
    Sub Main
        Dim kilo As Integer
        Dim boy As Double
        
        Console.WriteLine("Lütfen Kilonuzu Giriniz:   (Ex: 69)  ")
        kilo = readValue()
        Delay(1)
        Console.WriteLine("Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  ")
        boy = readValue()
        Dim tab As String
        Dim cümle As String
        
        cümle = "VKI Tablosunda "
        If Vki(kilo, boy) = "zayıf" Then
            tab = cümle & "'Zayıf' Bölümündesin"
        Else
            If Vki(kilo, boy) = "normal" Then
                tab = cümle & "'Normal' Bölümdesin"
            Else
                If Vki(kilo, boy) = "kilolu" Then
                    tab = cümle & "'Fazla Kilolu' Bölümdesin"
                Else
                    If Vki(kilo, boy) = "1. obez" Then
                        tab = cümle & "'1. Obez' Bölümündesin"
                    Else
                        If Vki(kilo, boy) = "2. obez" Then
                            tab = cümle & "'2. Obez' Bölümündesin"
                        Else
                            If Vki(kilo, boy) = "3. obez" Then
                                tab = cümle & "'3. Obez' Bölümündesin"
                            End If
                        End If
                    End If
                End If
            End If
        End If
        Console.WriteLine(tab)
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
    
    Private Function Vki(kilo As Integer, boy As Integer) As String
        Dim sonuc As String
        Dim index As Integer
        
        index = kilo / (boy * boy)
        If index < 18 Then
            sonuc = "zayıf"
        Else
            If index < 25 Then
                sonuc = "normal"
            Else
                If index < 30 Then
                    sonuc = "kilolu"
                Else
                    If index < 35 Then
                        sonuc = "1. obez"
                    Else
                        If index < 40 Then
                            sonuc = "2. obez"
                        Else
                            sonuc = "3. obez"
                        End If
                    End If
                End If
            End If
        End If
        
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
