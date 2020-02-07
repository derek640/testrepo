@echo off

mkdir D:\cs_tools\scripts\render

curl https://raw.githubusercontent.com/derek640/cs_tools/master/scripts/render/beauty_ao_shadow_layerManager.py -o D:\cs_tools\scripts\render\beauty_ao_shadow_layerManager.py
curl https://raw.githubusercontent.com/derek640/cs_tools/master/userSetup.py -o D:\cs_tools\userSetup.py

copy /y NUL D:\cs_tools\scripts\__init__.py >NUL
copy /y NUL D:\cs_tools\scripts\render\__init__.py >NUL

if defined PYTHONPATH (
    for /f "usebackq tokens=2,*" %%A in (`reg query HKCU\Environment /v PYTHONPATH`) do set my_user_pythonpath=%%B
    goto a
) else (
    goto b
    setx PYTHONPATH "D:\cs_tools"
)

:a
setx PYTHONPATH "D:\cs_tools;%my_user_pythonpath%"
goto c

:b
setx PYTHONPATH "D:\cs_tools"
goto c

:c
pause