Option Explicit

Sub Main
    Dim Kilo As Integer
    Dim Boy As Double
    
    Output "Lütfen Kilonuzu Giriniz:   (Ex: 69)  "
    Kilo = InputValue("Please enter a value for Kilo")
    Delay 1
    Output "Lütfen Boyunuzu Giriniz:   (Ex: 1.85)  "
    Boy = InputValue("Please enter a value for Boy")
    Dim Var_Tab As String
    Dim Cümle As String
    
    Cümle = "VKI Tablosunda "
    If Vki(Kilo, Boy) = "zayıf" Then
        Var_Tab = Cümle & "'Zayıf' Bölümündesin"
    Else
        If Vki(Kilo, Boy) = "normal" Then
            Var_Tab = Cümle & "'Normal' Bölümdesin"
        Else
            If Vki(Kilo, Boy) = "kilolu" Then
                Var_Tab = Cümle & "'Fazla Kilolu' Bölümdesin"
            Else
                If Vki(Kilo, Boy) = "1. obez" Then
                    Var_Tab = Cümle & "'1. Obez' Bölümündesin"
                Else
                    If Vki(Kilo, Boy) = "2. obez" Then
                        Var_Tab = Cümle & "'2. Obez' Bölümündesin"
                    Else
                        If Vki(Kilo, Boy) = "3. obez" Then
                            Var_Tab = Cümle & "'3. Obez' Bölümündesin"
                        End If
                    End If
                End If
            End If
        End If
    End If
    Output Var_Tab
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

Function Vki(byval Kilo As Integer, byval Boy As Integer) As String
    Dim Sonuc As String
    Dim İndex As Integer
    
    İndex = Kilo / (Boy * Boy)
    If İndex < 18 Then
        Sonuc = "zayıf"
    Else
        If İndex < 25 Then
            Sonuc = "normal"
        Else
            If İndex < 30 Then
                Sonuc = "kilolu"
            Else
                If İndex < 35 Then
                    Sonuc = "1. obez"
                Else
                    If İndex < 40 Then
                        Sonuc = "2. obez"
                    Else
                        Sonuc = "3. obez"
                    End If
                End If
            End If
        End If
    End If
    
    Vki = Sonuc
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
