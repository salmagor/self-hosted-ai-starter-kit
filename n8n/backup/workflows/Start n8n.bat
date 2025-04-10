@echo off
echo Starting Docker Desktop...
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Docker Desktop.lnk"

echo Waiting for Docker to start...
:WAIT_LOOP
timeout /t 5 /nobreak > nul
docker info > nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Docker is not ready yet, waiting...
    goto WAIT_LOOP
)

echo Docker is running! Starting containers...
cd /d D:\Documents\GitHub\self-hosted-ai-starter-kit
docker compose --profile gpu-nvidia up
pause