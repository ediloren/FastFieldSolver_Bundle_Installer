:: Unix shell script converted to batch file for MSDOS
:: by Enrico Di Lorenzo
::
:: shell script for generating a connector problem
:: usage: connector4.sh <plastic_permittivity> <passed_directly>
::  all args must be given always (interface does no error checking)
::  use passed directly arg as "-d" to turn off all discretization (for plots)
::
@echo off 
setlocal
set ex=%1%2
set offset=0.0 0.0 0.0
set op=%2
set files=connector4%ex%_files
:: make the folder
mkdir %files%
:::::::: build the pins 
echo * 16 pin connector, plastic permittivity = %1, options: %op% > connector4%ex%.lst
call pin 19.5 19.5 0.0 %1 4 %2 %files%
call pin 13.0 19.5 0.0 %1 4 %2 %files%
call pin 6.5 19.5 0.0 %1 4 %2 %files%
call pin 0.0 19.5 0.0 %1 4 %2 %files%
::
call pin 19.5 13.0 0.0 %1 4 %2 %files%
call pin 13.0 13.0 0.0 %1 4 %2 %files%
call pin 6.5 13.0 0.0 %1 4 %2 %files%
call pin 0.0 13.0 0.0 %1 4 %2 %files%
::
call pin 19.5 6.5 0.0 %1 4 %2 %files%
call pin 13.0 6.5 0.0 %1 4 %2 %files%
call pin 6.5 6.5 0.0 %1 4 %2 %files%
call pin 0.0 6.5 0.0 %1 4 %2 %files%
::
call pin 19.5 0.0 0.0 %1 4 %2 %files%
call pin 13.0 0.0 0.0 %1 4 %2 %files%
call pin 6.5 0.0 0.0 %1 4 %2 %files%
call pin 0.0 0.0 0.0 %1 4 %2 %files%
:::::::: build the sides
call cubegen -e0 %3 -xo-7.8 -yo-2.6 -zo5.2 -xh5.2 -yh26.0 -zh18.8 -b %op% -n4 > %files%/side_l4%ex%.qui
call cubegen -e0 %3 -xo23.4 -yo-2.6 -zo5.2 -xh5.2 -yh26.0 -zh18.8 -b %op% -n4 > %files%/side_r4%ex%.qui
call cubegen -e0 %3 -xo-7.8 -yo-2.6 -xh5.2 -yh26.0 -zh5.2 -t -pfl %op% -n4 > %files%/corner_l4%ex%.qui
call cubegen -e0 %3 -xo23.4 -yo-2.6 -xh5.2 -yh26.0 -zh5.2 -t -pbr %op% -n4 > %files%/corner_r4%ex%.qui
call cubegen -e0 %3 -xo-2.6 -yo-2.6 -xh26.0 -yh26.0 -zh5.2 -t -b -pfl -pbr %op% -n4 > %files%/back4%ex%.qui
:::::::: add sides, side caps and back caps to .lst file
echo * body4%ex%.lst > body4%ex%.lst
echo D %files%/side_l4%ex%.qui 1.0 %1 %offset% -3.5 0.0 7.0 - >> body4%ex%.lst
echo D %files%/side_r4%ex%.qui 1.0 %1 %offset% 24.0 0.0 7.0 - >> body4%ex%.lst
echo D %files%/corner_l4%ex%.qui 1.0 %1 %offset% -3.5 0.0 2.5 - >> body4%ex%.lst
echo D %files%/corner_r4%ex%.qui 1.0 %1 %offset% 24.0 0.0 2.5 - >> body4%ex%.lst
echo D %files%/back4%ex%.qui 1.0 %1 %offset% 0.0 0.0 2.5 - >> body4%ex%.lst
type body4%ex%.lst >> connector4%ex%.lst
:: remove temp files
del body4%ex%.lst
endlocal

