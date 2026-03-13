@echo off
cd /d g:\aiagent\Offline_App_20260116
"C:\Program Files\Git\cmd\git.exe" init
"C:\Program Files\Git\cmd\git.exe" remote add origin https://github.com/kamiyu1031/trafficline.git
"C:\Program Files\Git\cmd\git.exe" branch -M main
"C:\Program Files\Git\cmd\git.exe" add .
"C:\Program Files\Git\cmd\git.exe" commit -m "Update: crosswalk feature and volume adjustment"
"C:\Program Files\Git\cmd\git.exe" push -u origin main
