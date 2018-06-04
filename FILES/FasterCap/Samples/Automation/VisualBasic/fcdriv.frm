VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form FasterCapClient 
   Caption         =   "FasterCap Test Driver"
   ClientHeight    =   6345
   ClientLeft      =   1635
   ClientTop       =   2190
   ClientWidth     =   6480
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6345
   ScaleWidth      =   6480
   Begin RichTextLib.RichTextBox TextLogWindow 
      Height          =   1335
      Left            =   240
      TabIndex        =   16
      Top             =   4320
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   2355
      _Version        =   393217
      Enabled         =   -1  'True
      ScrollBars      =   3
      TextRTF         =   $"fcdriv.frx":0000
   End
   Begin VB.CheckBox CheckLogCallback 
      Caption         =   "Log Callback"
      Height          =   375
      Left            =   4560
      TabIndex        =   14
      Top             =   3360
      Width           =   1695
   End
   Begin VB.CheckBox CheckEndCallback 
      Caption         =   "End Callback"
      Height          =   375
      Left            =   4560
      TabIndex        =   13
      Top             =   3720
      Width           =   1695
   End
   Begin VB.CommandButton CommandStop 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Stop FC"
      Height          =   375
      Left            =   4560
      TabIndex        =   11
      Top             =   2880
      Width           =   1695
   End
   Begin VB.CommandButton CommandShow 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Show Window"
      Height          =   375
      Left            =   4560
      TabIndex        =   9
      Top             =   480
      Width           =   1695
   End
   Begin VB.TextBox TextCmdLine 
      Appearance      =   0  'Flat
      Height          =   375
      Left            =   240
      ScrollBars      =   1  'Horizontal
      TabIndex        =   8
      Text            =   """C:\Documents and Settings\All Users\Documents\FastFieldSolvers\FasterCap\Automation\Office\sphere2.txt"" -a0.01"
      Top             =   3360
      Width           =   4095
   End
   Begin VB.CommandButton CommandRun 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Run FC"
      Height          =   375
      Left            =   4560
      TabIndex        =   7
      Top             =   2400
      Width           =   1695
   End
   Begin VB.TextBox TextStatusWindow 
      Appearance      =   0  'Flat
      Height          =   375
      Left            =   240
      TabIndex        =   6
      Top             =   2640
      Width           =   4095
   End
   Begin VB.CommandButton CloseFC 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Quit FC"
      Height          =   375
      Left            =   4560
      TabIndex        =   3
      Top             =   960
      Width           =   1695
   End
   Begin VB.CommandButton GetCapacitance 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Get Capacitance"
      Height          =   375
      Left            =   4560
      TabIndex        =   4
      Top             =   1440
      Width           =   1695
   End
   Begin VB.CommandButton IsRunning 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&IsRunning"
      Height          =   375
      Left            =   4560
      TabIndex        =   2
      Top             =   1920
      Width           =   1695
   End
   Begin VB.TextBox TextResult 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Top             =   480
      Width           =   4095
   End
   Begin VB.CommandButton Close 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Close"
      Height          =   375
      Left            =   4560
      TabIndex        =   5
      Top             =   5880
      Width           =   1695
   End
   Begin VB.Label Label4 
      Caption         =   "Log Window"
      Height          =   255
      Left            =   240
      TabIndex        =   15
      Top             =   3960
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "Command Line"
      Height          =   255
      Left            =   240
      TabIndex        =   12
      Top             =   3120
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Status Window"
      Height          =   255
      Left            =   240
      TabIndex        =   10
      Top             =   2400
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "Capacitance"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1335
   End
End
Attribute VB_Name = "FasterCapClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FasterCap As Object
Dim callbackObj As New Callback

Private Sub CheckEndCallback_Click()
    ' If checked
    If CheckEndCallback.Value = 1 Then
        ' Set a callback function to be called upon FasterCap end of simulation
        vResult = FasterCap.SetEndCallback(callbackObj, "FasterCapEndCallback")
    Else
        ' Set no callback
        vResult = FasterCap.SetEndCallback(Nothing, "FasterCapEndCallback")
    End If
End Sub

Private Sub CheckLogCallback_Click()
    ' If checked
    If CheckLogCallback.Value = 1 Then
        ' Set a callback function to be called upon FasterCap end of simulation
        vResult = FasterCap.SetLogCallback(callbackObj, "FasterCapLogCallback")
    Else
        ' Set no callback
        vResult = FasterCap.SetLogCallback(Nothing, "FasterCapLogCallback")
    End If
End Sub

Private Sub Close_Click()
    FasterCap.Quit
    End
End Sub

Private Sub CloseFC_Click()
    ' Try to quit FasterCap
    couldQuit = FasterCap.Quit
    If couldQuit Then
        TextStatusWindow.Text = "FasterCap QUIT"
    Else
        TextStatusWindow.Text = "FasterCap NOT quit"
    End If
End Sub

Private Sub CommandRun_Click()
    ' Try to run FasterCap
    couldRun = FasterCap.Run(TextCmdLine.Text)
    If couldRun Then
        TextStatusWindow.Text = "FasterCap STARTED"
    Else
        TextStatusWindow.Text = "FasterCap NOT started"
    End If

End Sub

Private Sub CommandShow_Click()
    ' Show FasterCap window
    FasterCap.ShowWindow
End Sub

Private Sub CommandStop_Click()
    ' Force stop of simulation
    FasterCap.Stop
End Sub

Private Sub Form_Load()
    ' Create FasterCap object
    Set FasterCap = CreateObject("FasterCap.Document")
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ' Destroy FasterCap object
    Set FasterCap = Nothing
End Sub

Private Sub GetCapacitance_Click()
    ' retrieve conductor names
    condNames = FasterCap.GetCondNames()
    ' retrieve capacitance matrix
    capacitance = FasterCap.GetCapacitance()
    ' get matrix dimension
    mtxDim = UBound(capacitance, 1)
    ' output matrix values
    TextResult.Text = ""
    For i = 0 To mtxDim
        TextResult.Text = TextResult.Text + Format(Left$(condNames(i), 12), "!@@@@@@@@@@@@") + " "
        For j = 0 To mtxDim
            TextResult.Text = TextResult.Text + Format(capacitance(i, j), "\ #.000E+00;-#.000E+00") + " "
        Next j
        TextResult.Text = TextResult.Text + Chr$(13) + Chr$(10)
    Next i
End Sub

Private Sub IsRunning_Click()
    ' Test if FasterCap is presently running a simulation
    If FasterCap.IsRunning Then
        TextStatusWindow.Text = "FasterCap RUNNING"
    Else
        TextStatusWindow.Text = "FasterCap NOT running"
    End If
End Sub

