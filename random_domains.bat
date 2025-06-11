@echo off
setlocal enabledelayedexpansion

for /L %%i in (1,1,20) do (
    REM Generate random 20-character domain name
    set "domain="
    for /L %%j in (1,1,10) do (
        set /a "rand=!random! %% 26"
        for %%k in (!rand!) do (
            set "char=abcdefghijklmnopqrstuvwxyz"
            set "char=!char:~%%k,1!"
            set "domain=!domain!!char!"
        )
    )
    
    set "fulldomain=!domain!.com"
    echo Attempt %%i: !fulldomain!
    nslookup -timeout=1 !fulldomain! >nul 2>&1
)
