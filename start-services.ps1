# Make sure to use the elevated permissions
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
}

# List of services to be started
$serviceNames = ('DapodikWebSrv','DapodikDB')

Write-Host '>> MEMULAI SERVICES <<' -BackgroundColor White -ForegroundColor DarkGreen
Write-Host ''

foreach ($serviceName in $serviceNames) {
    $service = Get-Service -Name $serviceName
    Write-Host $service.DisplayName -BackgroundColor DarkGray -ForegroundColor White

    while ($service -ne 'Running') {
        Write-Host 'Status: ' -NoNewline
        if ($service.Status -eq 'Running') {
            Write-Host $service.Status -BackgroundColor Black -ForegroundColor Green
            Write-Host ''
            break;
        }
        else {
            Start-Service $ServiceName
            Write-Host 'Memulai...' -ForegroundColor Gray
            $service.Refresh()
        }
    }
}

#Holds the window for a while before it closes
Start-Sleep -seconds 10
