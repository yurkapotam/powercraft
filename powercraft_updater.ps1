if ((Invoke-WebRequest -Uri "https://raw.githubusercontent.com/yurkapotam/powercraft/main/ver").Content -gt (Get-Content -Path .\ver)){Write-Host "Updates found, installing zip"
Invoke-WebRequest -Uri "https://github.com/yurkapotam/powercraft/archive/refs/heads/main.zip" -OutFile .\update.zip
Expand-Archive -Force -Confirm -Path .\update.zip -DestinationPath .\
Copy-Item -Path .\powercraft-main\* -Confirm -Force -Destination .\
Remove-Item -Path .\powercraft-main -Recurse -Force -Confirm}