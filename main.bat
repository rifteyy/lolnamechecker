@echo off
setlocal enabledelayedexpansion
title  
set "summoner_names_input=summoner_names.txt"
set "api_key=RGAPI-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
set "region=europe"
set "region_code=eun1"
set "region_shorter=eune"
set "version=1.0.0"
if not exist "!summoner_names_input!" (
	echo(error: text file with summoner names not found
	>nul pause
	exit
)
for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
echo([!ESC![1;32m+!ESC![0m] !ESC![4m!ESC![93mhttps://github.com/rifteyy/lolnamechecker!ESC![0m
echo([!ESC![1;32m+!ESC![0m] !ESC![94mv!version!!ESC![0m
echo(---
for /f "delims=" %%A In (!summoner_names_input!) do (
	set "summoner_name=%%A"
	set "summoner_name[api]=!summoner_name: =%%20!"
	for /f "delims=" %%B in ('curl.exe -s -o NUL -w "%%{http_code}" -X GET "https://!region_code!.api.riotgames.com/lol/summoner/v4/summoners/by-name/!summoner_name[api]!?api_key=!api_key!"') do (
		if "%%B"=="200" (
			set "name_available=!esc![1;31mName is taken^!!esc![0m"
			for /f "delims=" %%C in ('curl.exe -s https://lols.gg/en/name/checker/!region_shorter!/!summoner_name[api]!/ ^| "find.exe" "is available in"') do (
				set "resp_lols=%%C"
			)
		)
		if "%%B"=="404" (
			set "name_available=!esc![1;32mName is available^!!esc![0m"
		)
		if "%%B"=="429" (
			set "name_available=!esc![1;31mRate limited...!esc![0m"
			>nul timeout /T 10 /NOBREAK
		)
		if "%%B"=="403" (
			echo(!ESC![1;31m[%%B] Forbidden; Invalid API key
			echo(Regenerate new at !ESC![4mhttps://developer.riotgames.com!ESC![0m
			>nul pause
			exit
		)
		if not "!name_available!"=="!esc![1;31mRate limited...!esc![0m" if "!name_available!"=="!esc![1;31mName is taken^!!esc![0m" (
			for /f "delims=" %%A In ("!resp_lols!") do (
				for %%B in (%%A) do (
					if "!next!"=="days" (
						set "days=%%B"
						set next=
				)
		if "%%B"=="in" set "next=days"
			)
		)
			for /f "delims=" %%x in ('powershell.exe -command "((Get-date).AddDays(!days!)).ToString('yyyy-MM-dd')"') do (
					for /f "tokens=1,2,3 delims=-" %%A in ("%%x") do (
						set "year=%%A"
						set "month=%%B"
						set "day=%%C"
					)
			)

			echo !summoner_name!!esc![20G!name_available!!esc![45GAvailable in: !days! days!esc![75G!Date: !day!/!month!/!year!
		) else (
			echo !summoner_name!!esc![20G!name_available!   
		)
		>nul timeout /T 1 /NOBREAK
	)
)
echo(
echo(Done. All names have been checked.
pause >nul
exit /b 0