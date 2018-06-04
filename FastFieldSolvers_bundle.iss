; -- FastFieldSolvers_bundle.iss --
; Installer for FastFieldSolvers Software Bundle, Enrico Di Lorenzo, 2015/08/04
; Added support for x86 and x64 version and redistributables for VS2013 Community Edition
;
; The script installs FastModel, FastCap2, FasterCap, FastHenry2

; The installer works in 64 bit mode or 32 bit mode according to the following define.
; In 64 bit mode, we still need to define certain Registry settings as 32 bits, to allow
; legacy FastCap2 and FastHenry2 to work

#define x64_install

[Setup]      
AppName=FastFieldSolvers Bundle
AppVerName=FastFieldSolvers Software Bundle version 5.0.0
AppPublisher=FastFieldSolvers
AppPublisherURL=http://www.fastfieldsolvers.com
AppCopyright= Copyright (C) 2017 FastFieldSolvers  S.R.L.
; by default, since so far only FasterCap is 64bits, default installation is in the {pf32} directory
; even for 64bits installation
DefaultDirName={reg:HKLM\Software\FastFieldSolvers\Settings,Path|{pf32}\FastFieldSolvers}
DefaultGroupName=FastFieldSolvers
UninstallDisplayIcon={app}\FastModel\FastModel.exe
AllowNoIcons=yes
LicenseFile=files\LICENCE.txt
; no need to specify, this is the default
;PrivilegesRequired=admin
AlwaysRestart=yes
#ifdef x64_install
  ; 64 bits
  ArchitecturesAllowed=x64
  ArchitecturesInstallIn64BitMode=x64
#endif
 
[Messages]
WelcomeLabel2=This will install [name/ver] on your computer.%n%nPlease uninstall any previous version of the software before continuing.%n%nIt is also recommended that you close all other applications before continuing.

[Files]

; ****************************************
; bundle history and license(s)
; ****************************************

Source: "files\History.txt"; DestDir: "{app}"; Flags: ignoreversion; Components: main
Source: "files\LICENCE.txt"; DestDir: "{app}"; Flags: ignoreversion; Components: main
; third party licenses
Source: "files\license_third_party\gpl.txt"; DestDir: "{app}\license_third_party"; Flags: ignoreversion; Components: main
Source: "files\license_third_party\lgpl.txt"; DestDir: "{app}\license_third_party"; Flags: ignoreversion; Components: main
Source: "files\license_third_party\licence_wxWindows.txt"; DestDir: "{app}\license_third_party"; Flags: ignoreversion; Components: main
Source: "files\license_third_party\preamble_wxWidgets.txt"; DestDir: "{app}\license_third_party"; Flags: ignoreversion; Components: main
Source: "files\license_third_party\readme_wxWidgets.txt"; DestDir: "{app}\license_third_party"; Flags: ignoreversion; Components: main
Source: "files\license_third_party\COPYING.winpthreads.txt"; DestDir: "{app}\license_third_party"; Flags: ignoreversion; Components: main
Source: "files\license_third_party\COPYING.RUNTIME-gcc-tdm.txt"; DestDir: "{app}\license_third_party"; Flags: ignoreversion; Components: main
Source: "files\license_third_party\COPYING3.LIB-gcc-tdm.txt"; DestDir: "{app}\license_third_party"; Flags: ignoreversion; Components: main
#ifdef x64_install
Source: "files\license_third_party\COPYING.MinGW-w64-runtime.txt"; DestDir: "{app}\license_third_party"; Flags: ignoreversion; Components: main
#endif
             
; ****************************************
; FastModel files
; ****************************************

Source: "files\FastModel\FastModel.exe"; DestDir: "{app}\FastModel"; Flags: ignoreversion; Components: main
Source: "files\FastModel\fastmodel.chm"; DestDir: "{app}\FastModel"; Flags: ignoreversion; Components: main
; uncomment next line if CINT is included
;Source: "files\FastModel\libcint.dll"; DestDir: "{app}\FastModel"; Flags: ignoreversion; Components: main
Source: "files\FastModel\History.txt"; DestDir: "{app}\FastModel"; Flags: ignoreversion; Components: main

; ****************************************
; FastCap2 files
; ****************************************
;
; FastCap2
;
#ifdef x64_install
Source: "files\FastCap2\FastCap2_x64.exe"; DestDir: "{app}\FastCap2"; DestName: "FastCap2.exe"; Flags: ignoreversion; Components: main
Source: "files\FastCap2\FastCap2_x64.tlb"; DestDir: "{app}\FastCap2"; DestName: "FastCap2.tlb"; Flags: ignoreversion; Components: main
#else
Source: "files\FastCap2\FastCap2_x86.exe"; DestDir: "{app}\FastCap2"; DestName: "FastCap2.exe"; Flags: ignoreversion; Components: main
Source: "files\FastCap2\FastCap2_x86.tlb"; DestDir: "{app}\FastCap2"; DestName: "FastCap2.tlb"; Flags: ignoreversion; Components: main
#endif
Source: "files\FastCap2\FastCap_User_Guide.pdf"; DestDir: "{app}\FastCap2"; Flags: ignoreversion; Components: main
Source: "files\FastCap2\FastCap2.chm"; DestDir: "{app}\FastCap2"; Flags: ignoreversion; Components: main
Source: "files\FastCap2\History.txt"; DestDir: "{app}\FastCap2"; Flags: ignoreversion; Components: main
;
; Utilities
;
Source: "files\FastCap2\Utilities\busgen.exe"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\capgen.exe"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\cubegen.exe"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\cubegen_.exe"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\cubegen_.txt"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\pipedgen.exe"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\pyragen.exe"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\spheregen.exe"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\wovengen.exe"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\converthenry.exe"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastCap2\Utilities\converthenry.txt"; DestDir: "{app}\FastCap2\Utilities"; Flags: ignoreversion; Components: utilities

; ****************************************
; FasterCap files
; ****************************************
;
; FasterCap
;
#ifdef x64_install
  Source: "files\FasterCap\FasterCap_x64.exe"; DestDir: "{app}\FasterCap"; DestName: "FasterCap.exe"; Flags: ignoreversion; Components: main
  ; manifest is not needed now with x64 version compiled with MinGW-w64
  ;Source: "files\FasterCap\FasterCap.exe.manifest"; DestDir: "{app}\FasterCap"; Flags: ignoreversion; Components: main
  ; next statement also registers the Type Library, and will unregister it when uninstalling (Flag 'regtypelib')
  ; note that if the flag AlwaysRestart is 1, the type library will be registered at next restart.
  ; Moreover, the registration will be done in the 64 bits part of the registry if ArchitecturesInstallIn64BitMode=x64,
  ; with the option to install in the 32 bits if the 32bit flag is present (but the viceversa is not supported)
  Source: "files\FasterCap\IFasterCap_x64.tlb"; DestDir: "{app}\FasterCap"; DestName: "IFasterCap.tlb"; Flags: ignoreversion regtypelib; Components: main
  ; this is needed for OpenMP with TDM GCC compiler
  Source: "files\FasterCap\libgomp_64-1.dll"; DestDir: "{app}\FasterCap"; Flags: ignoreversion; Components: main
#else
  Source: "files\FasterCap\FasterCap_x86.exe"; DestDir: "{app}\FasterCap"; DestName: "FasterCap.exe"; Flags: ignoreversion; Components: main
  ; 32 bits compiled with MinGW
  ; commented out since this dll is not needed any more with new MinGW based on GCC 4.7.1
  ;Source: "files\FasterCap\mingwm10.dll"; DestDir: "{app}\FasterCap"; Flags: ignoreversion; Components: main
  Source: "files\FasterCap\IFasterCap_x86.tlb"; DestDir: "{app}\FasterCap"; DestName: "IFasterCap.tlb"; Flags: ignoreversion regtypelib; Components: main
  ; this is needed for OpenMP with TDM GCC compiler
  Source: "files\FasterCap\libgomp-1.dll"; DestDir: "{app}\FasterCap"; Flags: ignoreversion; Components: main
#endif
Source: "files\FasterCap\FasterCapHelp.chm"; DestDir: "{app}\FasterCap"; Flags: ignoreversion; Components: main
Source: "files\FasterCap\History.txt"; DestDir: "{app}\FasterCap"; Flags: ignoreversion; Components: main

; ****************************************
; FastHenry2 files
; ****************************************

#ifdef x64_install
  Source: "files\FastHenry2\FastHenry2_x64.exe"; DestDir: "{app}\FastHenry2"; DestName: "FastHenry2.exe"; Flags: ignoreversion; Components: main
  Source: "files\FastHenry2\FastHenry2_x64.tlb"; DestDir: "{app}\FastHenry2"; DestName: "FastHenry2.tlb"; Flags: ignoreversion; Components: main
#else
  Source: "files\FastHenry2\FastHenry2_x86.exe"; DestDir: "{app}\FastHenry2"; DestName: "FastHenry2.exe"; Flags: ignoreversion; Components: main
  Source: "files\FastHenry2\FastHenry2_x86.tlb"; DestDir: "{app}\FastHenry2"; DestName: "FastHenry2.tlb"; Flags: ignoreversion; Components: main
#endif
Source: "files\FastHenry2\FastHenry_User_Guide.pdf"; DestDir: "{app}\FastHenry2"; Flags: ignoreversion; Components: main
Source: "files\FastHenry2\FastHenry_nonuniform_gndplane_manual.pdf"; DestDir: "{app}\FastHenry2"; Flags: ignoreversion; Components: main
Source: "files\FastHenry2\FastHenry2.chm"; DestDir: "{app}\FastHenry2"; Flags: ignoreversion; Components: main
Source: "files\FastHenry2\History.txt"; DestDir: "{app}\FastHenry2"; Flags: ignoreversion; Components: main
;
; Utilities
;
Source: "files\FastHenry2\Utilities\MakeLcircuit.exe"; DestDir: "{app}\FastHenry2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastHenry2\Utilities\MakeLnegative.exe"; DestDir: "{app}\FastHenry2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastHenry2\Utilities\ReadOutput.exe"; DestDir: "{app}\FastHenry2\Utilities"; Flags: ignoreversion; Components: utilities
Source: "files\FastHenry2\Utilities\Zbuf.exe"; DestDir: "{app}\FastHenry2\Utilities"; Flags: ignoreversion; Components: utilities


; ****************************************
; Sample files
;
; Sample files need to be accessible to all users. In XP, the natural choice would be
; CSIDL_COMMON_APPDATA (in Inno Setup called {commonappdata}) which would then be
; something like: "C:\Documents and Settings\All Users\Application Data".
; However, on Vista the call of  SHGetFolderPath/SHGetKnownFolderPath with CSIDL_COMMON_APPDATA gives
; the: "C:\ProgramData" directory which is read-only and _hidden_
; So we decided to use CSIDL_COMMON_DOCUMENTS (available starting with ShellApi 5.0, i.e. Win2000),
; that in Inno Setup is {commondocs}
; ****************************************

;
; FastCap
;

; Automation, Visual Basic
Source: "files\FastCap2\Samples\Automation\VisualBasic\FastCapClient.vbp"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\VisualBasic\FastCapClient.vbw"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\VisualBasic\FCDRIV.FRM"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\VisualBasic\FCDRIV.FRX"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\VisualBasic\MainModule.bas"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\VisualBasic\Callback.cls"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
; Automation, Office
Source: "files\FastCap2\Samples\Automation\Office\fc_drive.xls"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\Office\sphere0.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\Office\sphere1.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\Office\sphere2.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\Office\sphere3.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\Office"; Flags: ignoreversion; Components: samples
; Automation, VBScript
Source: "files\FastCap2\Samples\Automation\VBScript\fcdriv.vbs"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\VBScript\sphere0.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\VBScript\sphere1.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\VBScript\sphere2.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Automation\VBScript\sphere3.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\Automation\VBScript"; Flags: ignoreversion; Components: samples
; Input files
Source: "files\FastCap2\Samples\Input_files\capac.lst"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\capac2.lst"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\diel.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\plate.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\coated_sph.lst"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\connector2.bat"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\connector3.bat"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\connector4.bat"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\pin.bat"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\readme.txt"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\sphere0.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\sphere1.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\sphere2.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\sphere3.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\sphere_big2.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\testgen.bat"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\testrun.vbs"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\via.neu"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\_1x1bus.lst"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\_1x1bus_files\cond_air_1x1.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\_1x1bus_files"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\_1x1bus_files\cond_dielec_1x1.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\_1x1bus_files"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\_1x1bus_files\dielec_face.neu"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\_1x1bus_files"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\_1x1bus_files\dielec_sides.neu"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\_1x1bus_files"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\_1x1bus_files\dielec_topbot.neu"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2\_1x1bus_files"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\_1x1coarse.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\_1x1fine.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples
Source: "files\FastCap2\Samples\Input_files\_1x1nonuni.qui"; DestDir: "{commondocs}\FastFieldSolvers\FastCap2"; Flags: ignoreversion; Components: samples

;
; FasterCap
;

; Automation, Visual Basic
Source: "files\FasterCap\Samples\Automation\VisualBasic\FasterCapClient.exe"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VisualBasic\FasterCapClient.vbp"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VisualBasic\FasterCapClient.vbw"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VisualBasic\fcdriv.frm"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VisualBasic\fcdriv.frx"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VisualBasic\MainModule.bas"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VisualBasic\Callback.cls"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
; Automation, Office
Source: "files\FasterCap\Samples\Automation\Office\fastercap_drive.xls"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\Office\sphere0.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\Office\sphere1.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\Office\sphere2.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\Office\sphere3.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\Office"; Flags: ignoreversion; Components: samples
; Automation, VBScript
Source: "files\FasterCap\Samples\Automation\VBScript\fastercap_drive.vbs"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VBScript\sphere0.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VBScript\sphere1.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VBScript\sphere2.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Automation\VBScript\sphere3.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\Automation\VBScript"; Flags: ignoreversion; Components: samples
; Input files, 3D
Source: "files\FasterCap\Samples\Input_files\3D\sphere2.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\coated_sph.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\sphere_big2.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\array_of_5_spheres.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\array_of_5_spheres__single_file.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\cube.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\plate.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\cube_over_gnd_plane.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\gndplane_10x10.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\cube_over_diel_plane.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\cubes.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\cubes_diel.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\cube_inside_sphere.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\cube_0.4.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\sphere_inside_cube.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\cube_2.5.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\bus4.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\bus_5x_lines_2500m.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\line_2500m.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\woven15x15.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\capacitor_simple.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\capacitor_simple_diel.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\capacitor_simple_diel_lossy.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\capacitor.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\capacitor_contact_sides.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\capacitor_diel_sides.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\sphere_in_lossy_diel.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\coated_sph_lossy.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\capacitor_lossy.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\capacitor_lossy__single_file.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\comblbot.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\CombLeft.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\combltop.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\combrbot.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\CombRight.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\combrtop.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\dielshell.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\gndplane.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\gndplanebot.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\interdigitated_capacitor.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\3D\interdigitated_capacitor_with_diel.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\3D"; Flags: ignoreversion; Components: samples
; Input files, 2D
Source: "files\FasterCap\Samples\Input_files\2D\circle_0.1.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circle_0.1_fine.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circle_0.2.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circle_0.2_fine.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circle_0.005.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circle_0.15.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circle_0.15_fine.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circle_1.0.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circle_2.0.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circular_wire_over_gnd_plane_2d.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circular_wire_over_gnd_plane_2d_lossy.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circular_wire_over_gnd_plane_2d_lossy.xls"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circular_wire_over_gnd_plane_bis_2d.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\circular_wire_over_gnd_plane_bis_2d_lossy.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\coax_cable_2d.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\coax_cable_2d_scaled.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\coax_cable_coated_2d.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\coax_cable_coated_2d_fine.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\coupled_microstrips_2d.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\coupled_microstrips_5x_2d.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\coupled_striplines_2d.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\coupled_striplines_with_gaps_2d.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\diel1_microstrips_0.035.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\diel2_microstrips_0.035.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\diel_microstrips_0.01.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\diel_microstrips_0.03.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\diel_microstrips_5x_0.03.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\gnd_plane.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\interface2d_0.2.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\microstrip_0.032.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\microstrip_bottom_0.01.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\microstrip_bottom_0.03.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\microstrip_bottom_0.035.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\microstrip_top_0.01.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\microstrip_top_0.03.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\microstrip_top_0.035.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\plate2d_0.2.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\plate2d_0.22.txt"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\three_line_bus_2d.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples
Source: "files\FasterCap\Samples\Input_files\2D\three_line_bus_2d__single_file.lst"; DestDir: "{commondocs}\FastFieldSolvers\FasterCap\2D"; Flags: ignoreversion; Components: samples

;
; FastHenry
;

; Visual Basic
Source: "files\FastHenry2\Samples\Automation\VisualBasic\FastHenryClient.vbp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\VisualBasic\FastHenryClient.vbw"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\VisualBasic\fhdriv.frm"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\VisualBasic\fhdriv.frx"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\VisualBasic\MainModule.bas"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\VisualBasic\Callback.cls"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VisualBasic"; Flags: ignoreversion; Components: samples
; Office
Source: "files\FastHenry2\Samples\Automation\Office\fh_drive.xls"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\Office\coils1.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\Office\coils2.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\Office"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\Office\coils3.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\Office"; Flags: ignoreversion; Components: samples
; VBScript
Source: "files\FastHenry2\Samples\Automation\VBScript\fhdriv.vbs"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\VBScript\coils1.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\VBScript\coils2.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VBScript"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Automation\VBScript\coils3.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2\Automation\VBScript"; Flags: ignoreversion; Components: samples
; Input files
Source: "files\FastHenry2\Samples\Input_files\30pin.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\3d_example2.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\3d_example2_coarse.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\broken.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\gpexamp_copper.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\hole.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\holey_gp.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\msm.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\nonuni01.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\onebargp.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\pin-con2seg.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\pin-con7.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\pin-connect.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\plane.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\rom_check_con7_r20.ckt"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\simple_gp.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\template.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\together.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\together_nonuni.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\trace.test.release.txt"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\trace_over_mesh_new.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\tree_sample.hier"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\tree_sample.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples
Source: "files\FastHenry2\Samples\Input_files\vias.inp"; DestDir: "{commondocs}\FastFieldSolvers\FastHenry2"; Flags: ignoreversion; Components: samples

; ****************************************
; System library files
; ****************************************

; no need of these redistributables, assumed available on 64 bits systems (new Win7)
#ifndef x64_install
; begin cmnctl32.dll installation files
Source: "..\vcfiles\50comupd.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
; end cmnctl32.dll installation files

; begin Html Help installation files
Source: "..\vcfiles\hhupd.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
; end Html Help installation files

; begin VC system files
; Note: only files shown by 'Dependency Walker' are installed
;Source: "..\vcfiles\asycfilt.dll"; DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall
;Source: "..\vcfiles\atla.dll";     DestName: "atl.dll"; DestDir: "{sys}"; MinVersion: 4, 0; Flags: restartreplace uninsneveruninstall regserver
;Source: "..\vcfiles\atlu.dll";     DestName: "atl.dll"; DestDir: "{sys}"; MinVersion: 0, 4; Flags: restartreplace uninsneveruninstall regserver
;Source: "..\vcfiles\comcat.dll";   DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall regserver
Source: "..\vcfiles\mfc42.dll";    DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall regserver
;Source: "..\vcfiles\mfc42u.dll";   DestDir: "{sys}"; MinVersion: 0, 4; Flags: restartreplace uninsneveruninstall regserver
; choose between Visual C++ 5.0 or 6.0
;Source: "..\vcfiles\msvcp50.dll";  DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall
Source: "..\vcfiles\msvcp60.dll";  DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall
;Source: "..\vcfiles\msvcirt.dll";  DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall
Source: "..\vcfiles\msvcrt.dll";   DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall
Source: "..\vcfiles\oleaut32.dll"; DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall regserver
;Source: "..\vcfiles\olepro32.dll"; DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall regserver
;Source: "..\vcfiles\stdole2.tlb";  DestDir: "{sys}"; Flags: restartreplace uninsneveruninstall regtypelib
; end VC system files

; begin VC2008 redistributables (for OpenMP)
; usually not needed, should already be present in recent version of Win (see [Run] section)
; moreover, not needed for MinGW-w64
;Source: "..\vcfiles\vcredist_2008_x86.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
; end VC2008 redistributables (for OpenMP)

; begin VC2013 redistributables
Source: "..\vcfiles\visual_studio_2013_community_vcredist_x86_redistributable.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
; end VC2013 redistributables
#else
; begin VC2008 redistributables (for OpenMP)
; usually not needed, should already be present in recent version of Win (see [Run] section)
; moreover, not needed for MinGW-w64
;Source: "..\vcfiles\vcredist_2008_x64.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
; end VC2008 redistributables (for OpenMP)

; begin VC2013 redistributables
Source: "..\vcfiles\visual_studio_2013_community_vcredist_x64_redistributable.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
; end VC2013 redistributables
#endif

;
; Utilities to manage system 'path' environment variable
;
Source: "files\SetPath.exe"; DestDir: "{app}"; Flags: ignoreversion deleteafterinstall
Source: "files\RemovePath.exe"; DestDir: "{app}"; Flags: ignoreversion;

[Components]
Name: "main"; Description: "Main Files"; Types: full compact custom; Flags: fixed
Name: "samples"; Description: "Samples"; Types: full
; embedded in the help file
;Name: "docs"; Description: "Documentation"; Types: full compact
Name: "utilities"; Description: "Utilities"; Types: full compact

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; MinVersion: 4,4

[Icons]
Name: "{group}\FastModel"; Filename: "{app}\FastModel\FastModel.exe"
Name: "{group}\FastCap2"; Filename: "{app}\FastCap2\FastCap2.exe"
Name: "{group}\FasterCap"; Filename: "{app}\FasterCap\FasterCap.exe"
Name: "{group}\FastHenry2"; Filename: "{app}\FastHenry2\FastHenry2.exe"
Name: "{group}\Uninstall FastFieldSolver bundle"; Filename: "{uninstallexe}"
Name: "{userdesktop}\FastModel"; Filename: "{app}\FastModel\FastModel.exe"; MinVersion: 4,4; Tasks: desktopicon

[Run]

; vcredist_2008 was included because of an initial error about vcomp90.dll missing in x64
; (needed for OpenMP); however, this was due to the old manifest file for x64.
; after manifest update, the vcredist should not be needed any more
#ifndef x64_install
Filename: "{app}\50comupd.exe"; Parameters: "/q:a"
Filename: "{app}\hhupd.exe"; Parameters: "/q:a"
;Filename: "{app}\vcredist_2008_x86.exe"; Parameters: "/q:a"
Filename: "{app}\visual_studio_2013_community_vcredist_x86_redistributable.exe"; Parameters: "/quiet"
#else
;Filename: "{app}\vcredist_2008_x64.exe"; Parameters: "/q:a"
Filename: "{app}\visual_studio_2013_community_vcredist_x64_redistributable.exe"; Parameters: "/quiet"
#endif

Filename: "{app}\FastModel\FastModel.exe"; Description: "Launch FastModel"; Flags: nowait postinstall skipifsilent

;
; Clean path in case of upgrade
;
; remove path in Win95,98,Me
Filename: "{app}\removepath.exe"; Parameters: """{app}\FastCap2\Utilities"" ""{sd}"" 0"; MinVersion: 1, 0
Filename: "{app}\removepath.exe"; Parameters: """{app}\FastHenry2\Utilities"" ""{sd}"" 0"; MinVersion: 1, 0
; remove path in WinNT,2K,XP
Filename: "{app}\removepath.exe"; Parameters: """{app}\FastCap2\Utilities"" ""{sd}"" 1"; MinVersion: 0, 1
Filename: "{app}\removepath.exe"; Parameters: """{app}\FastHenry2\Utilities"" ""{sd}"" 1"; MinVersion: 0, 1
;
; Manage path
;
; modify 'path' environment variable in Win95,98,Me
Filename: "{app}\setpath.exe"; Parameters: """{app}\FastCap2\Utilities"" ""{sd}"" 0"; MinVersion: 1, 0
Filename: "{app}\setpath.exe"; Parameters: """{app}\FastHenry2\Utilities"" ""{sd}"" 0"; MinVersion: 1, 0
; modify 'path' environment variable in WinNT,2K,XP
Filename: "{app}\setpath.exe"; Parameters: """{app}\FastCap2\Utilities"" ""{sd}"" 1"; MinVersion: 0, 1
Filename: "{app}\setpath.exe"; Parameters: """{app}\FastHenry2\Utilities"" ""{sd}"" 1"; MinVersion: 0, 1

[UninstallRun]
; remove path in Win95,98,Me
Filename: "{app}\removepath.exe"; Parameters: """{app}\FastCap2\Utilities"" ""{sd}"" 0"; MinVersion: 1, 0
Filename: "{app}\removepath.exe"; Parameters: """{app}\FastHenry2\Utilities"" ""{sd}"" 0"; MinVersion: 1, 0
; remove path in WinNT,2K,XP
Filename: "{app}\removepath.exe"; Parameters: """{app}\FastCap2\Utilities"" ""{sd}"" 1"; MinVersion: 0, 1
Filename: "{app}\removepath.exe"; Parameters: """{app}\FastHenry2\Utilities"" ""{sd}"" 1"; MinVersion: 0, 1

[Registry]

;
; general settings
;

; create new keys under Local Machine, containing data common to all users, that have no need
; to be modified (keys under HKLM are read-only for non-privileged users)
; User-specific keys and data will be created by the applications at first start-up
; The flags tell it to always delete the keys upon uninstall, and delete the "FastFieldSolvers" key
; if there is nothing left in it.
;
; Note that, thanks to registry re-direction in Win64, there is no need to specify if the registry entries
; must be stored in 32 bit or 64 bit sections of the registry; however if we use a 32 bit application under Win64,
; it will access the 32 bit section, so if we need both 64 bits and 32 bits application to have the same info,
; we must copy it twice in the registry.

Root: HKLM; Subkey: "Software\FastFieldSolvers"; Flags: uninsdeletekeyifempty
Root: HKLM; Subkey: "Software\FastFieldSolvers\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}"; Flags: uninsdeletekey
#ifdef x64_install
  ; replicate install in 32 bits section of the registry, for 32 bits exe access
  Root: HKLM32; Subkey: "Software\FastFieldSolvers"; Flags: uninsdeletekeyifempty
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}"; Flags: uninsdeletekey
#endif
 
;
; FastModel settings
;

Root: HKLM32; Subkey: "Software\FastFieldSolvers\FastModel"; Flags: uninsdeletekey
Root: HKLM32; Subkey: "Software\FastFieldSolvers\FastModel\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}\FastModel"

;
; FastCap2 settings
;

Root: HKLM; Subkey: "Software\FastFieldSolvers\FastCap2"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\FastFieldSolvers\FastCap2\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}\FastCap2"
Root: HKLM; Subkey: "Software\FastFieldSolvers\FastCap2\Settings"; ValueType: string; ValueName: "SamplePath"; ValueData: "{commondocs}\FastFieldSolvers\FastCap2"
#ifdef x64_install
  ; replicate install in 32 bits section of the registry, for 32 bits exe access (e.g. FastModel launching FastCap2)
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\FastCap2"; Flags: uninsdeletekey
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\FastCap2\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}\FastCap2"
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\FastCap2\Settings"; ValueType: string; ValueName: "SamplePath"; ValueData: "{commondocs}\FastFieldSolvers\FastCap2"
#endif
; Store Automation keys (copied from FastCap2.reg)
Root: HKCR; Subkey: "FastCap2.Document"; Flags: uninsdeletekey
Root: HKCR; Subkey: "FastCap2.Document"; ValueType: string; ValueData: "FastCap2 Document"
Root: HKCR; Subkey: "FastCap2.Document\CLSID"; ValueType: string; ValueData: "{{1ECCFB33-710A-4B5C-9295-A503CA2D10E2}"
Root: HKCR; Subkey: "CLSID\{{1ECCFB33-710A-4B5C-9295-A503CA2D10E2}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CLSID\{{1ECCFB33-710A-4B5C-9295-A503CA2D10E2}"; ValueType: string; ValueData: "FastCap2 Document"
Root: HKCR; Subkey: "CLSID\{{1ECCFB33-710A-4B5C-9295-A503CA2D10E2}\LocalServer32"; ValueType: string; ValueData: "{app}\FastCap2\FastCap2.exe"
Root: HKCR; Subkey: "CLSID\{{1ECCFB33-710A-4B5C-9295-A503CA2D10E2}\ProgId"; ValueType: string; ValueData: "FastCap2.Document"

;
; FasterCap settings
;

Root: HKLM; Subkey: "Software\FastFieldSolvers\FasterCap"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\FastFieldSolvers\FasterCap\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}\FasterCap"
Root: HKLM; Subkey: "Software\FastFieldSolvers\FasterCap\Settings"; ValueType: string; ValueName: "SamplePath"; ValueData: "{commondocs}\FastFieldSolvers\FasterCap"
#ifdef x64_install
  ; replicate install in 32 bits section of the registry, for 32 bits exe access (e.g. FastModel launching FasterCap)
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\FasterCap"; Flags: uninsdeletekey
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\FasterCap\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}\FasterCap"
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\FasterCap\Settings"; ValueType: string; ValueName: "SamplePath"; ValueData: "{commondocs}\FastFieldSolvers\FasterCap"
#endif
; Store Automation keys (copied from FasterCap.reg)
Root: HKCR; Subkey: "FasterCap.Document"; Flags: uninsdeletekey
Root: HKCR; Subkey: "FasterCap.Document"; ValueType: string; ValueData: "FasterCap Document"
Root: HKCR; Subkey: "FasterCap.Document\CLSID"; ValueType: string; ValueData: "{{4ACA654C-C56C-47d5-86F4-7B721F06E056}"
Root: HKCR; Subkey: "CLSID\{{4ACA654C-C56C-47d5-86F4-7B721F06E056}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CLSID\{{4ACA654C-C56C-47d5-86F4-7B721F06E056}"; ValueType: string; ValueData: "FasterCap Document"
Root: HKCR; Subkey: "CLSID\{{4ACA654C-C56C-47d5-86F4-7B721F06E056}\LocalServer32"; ValueType: string; ValueData: "{app}\FasterCap\FasterCap.exe"
Root: HKCR; Subkey: "CLSID\{{4ACA654C-C56C-47d5-86F4-7B721F06E056}\ProgId"; ValueType: string; ValueData: "FasterCap.Document"

;
; FastHenry2 settings
;

Root: HKLM; Subkey: "Software\FastFieldSolvers\FastHenry2"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\FastFieldSolvers\FastHenry2\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}\FastHenry2"
Root: HKLM; Subkey: "Software\FastFieldSolvers\FastHenry2\Settings"; ValueType: string; ValueName: "SamplePath"; ValueData: "{commondocs}\FastFieldSolvers\FastHenry2"
#ifdef x64_install
  ; replicate install in 32 bits section of the registry, for 32 bits exe access (e.g. FastModel launching FastHenry2)
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\FastHenry2"; Flags: uninsdeletekey
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\FastHenry2\Settings"; ValueType: string; ValueName: "Path"; ValueData: "{app}\FastHenry2"
  Root: HKLM32; Subkey: "Software\FastFieldSolvers\FastHenry2\Settings"; ValueType: string; ValueName: "SamplePath"; ValueData: "{commondocs}\FastFieldSolvers\FastHenry2"
#endif
; Store Automation keys (copied from FastHenry2.reg)
Root: HKCR; Subkey: "FastHenry2.Document"; Flags: uninsdeletekey
Root: HKCR; Subkey: "FastHenry2.Document"; ValueType: string; ValueData: "FastHenry2 Document"
Root: HKCR; Subkey: "FastHenry2.Document\CLSID"; ValueType: string; ValueData: "{{511D52AD-9892-4DF2-B190-BD7DFD8E7322}"
Root: HKCR; Subkey: "CLSID\{{511D52AD-9892-4DF2-B190-BD7DFD8E7322}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CLSID\{{511D52AD-9892-4DF2-B190-BD7DFD8E7322}"; ValueType: string; ValueData: "FastHenry2 Document"
Root: HKCR; Subkey: "CLSID\{{511D52AD-9892-4DF2-B190-BD7DFD8E7322}\LocalServer32"; ValueType: string; ValueData: "{app}\FastHenry2\FastHenry2.exe"
Root: HKCR; Subkey: "CLSID\{{511D52AD-9892-4DF2-B190-BD7DFD8E7322}\ProgId"; ValueType: string; ValueData: "FastHenry2.Document"

