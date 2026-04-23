@echo off

echo Creating Python Virtual Environment...
python.exe -m venv .venv

echo Upgrading pip
.\.venv\scripts\python.exe -m pip install --upgrade pip

echo Installing Required Packages...
.\.venv\scripts\pip.exe install -r requirements.txt -q -q

echo Done Installing
pause
