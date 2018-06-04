' FasterCap Automation example
' FastFieldSolvers S.R.L., 2013/03/20
'
' Launch from a DOS shell, typing 'cscript <filename>',
' where <filename> is the name of this file
' (can also double click on the file, but you only get
' message boxes in this case)

Dim FasterCap
' Create FasterCap object
Set FasterCap = CreateObject("FasterCap.Document")

' Extract script path from ScriptFullName Property
pathPos = InstrRev(Wscript.ScriptFullName, Wscript.ScriptName)
path = left(Wscript.ScriptFullName, pathPos-1)

For  i = 0 to 3
  ' Input files are already existing in this simple example;
  ' could also generate them on the fly and stop the loop when
  ' desired refinement accuracy is reached (e.g. <1% difference
  ' between FasterCap results)
  
  ' Try to run FasterCap
  ' Remark: the run path must be surrounded by quotas '"' to support
  ' also paths containing spaces (quotas in VisualBasic are escaped by
  ' doubling the symbol, i.e., "" )
  couldRun = FasterCap.Run("""" + path + "sphere"+CStr(i)+".txt"" -a0.01")
  ' Wait for end of operation, using polling; could also use callback function,
  ' see Windows Script Components help
  Do While FasterCap.IsRunning = True
    Wscript.Sleep 500
  Loop
  ' retrieve capacitance matrix
  capacitance = FasterCap.GetCapacitance()
  WScript.Echo "sphere"+CStr(i)+".txt capacitance is " + CStr(capacitance(0, 0))
Next

' Quit FasterCap
FasterCap.Quit
' Destroy FasterCap object
Set FasterCap = Nothing
