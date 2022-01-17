Rem "Template Repository for Research Papers with Python Code"
Rem
Rem Copyright (C) 2021 Peter Steiner
Rem License: GPLv3

python.exe -m venv .virtualenv

.\.virtualenv\Scripts\activate.ps1

python.exe -m pip install -r requirements.txt
python.exe main.py --plot --export --serialize -vvv

deactivate
