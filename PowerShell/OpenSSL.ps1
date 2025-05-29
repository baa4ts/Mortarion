# Variables
$url = "https://slproweb.com/download/Win64OpenSSL_Light-3_5_0.msi"
$archivo = "$env:TEMP\Win64OpenSSL_Light-3_5_0.msi"
$installDir = "$env:ProgramFiles\OpenSSL-Win64"

# Descargar MSI
Invoke-WebRequest -Uri $url -OutFile $archivo

# Instalar MSI silenciosamente (suponiendo que instala en $installDir)
Start-Process msiexec.exe -ArgumentList "/i `"$archivo`" /quiet /norestart" -Wait

# Borrar MSI descargado
Remove-Item $archivo

# Esperar un poco para asegurarse que la instalación terminó
Start-Sleep -Seconds 5

# Ruta bin que se agregará al PATH
$opensslBinPath = "$installDir\bin"

# Obtener la variable PATH del sistema
$machinePath = [Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)

# Verificar si ya está en PATH para no duplicar
if ($machinePath -notlike "*$opensslBinPath*") {
    $newPath = $machinePath + ";" + $opensslBinPath

    # Actualizar PATH del sistema
    [Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)

    Write-Output "Se agregó $opensslBinPath al PATH del sistema."
} else {
    Write-Output "$opensslBinPath ya está en el PATH del sistema."
}
