# Modified from https://gist.github.com/dkorobtsov/963f3b90418e51d12aecb1eaf6106958
# PowerShell script to add Windows Defender exclusions for WSL2 performance issues
# 
# For context please read this thread:
# https://github.com/microsoft/WSL/issues/8995
# 
# How to use?
# - Save the Script: Open a text editor like Notepad and paste the PowerShell script into it. 
# - Save the file with a .ps1 extension, for example, Add_WindowsDefender_Exclusions.ps1.
# - Run PowerShell as Administrator: Search for "PowerShell" in the Start menu, right-click on it, and choose "Run as administrator".
# - Navigate to the Script's Location: Use the cd command to navigate to the directory where you saved the .ps1 file. 
# - Run the Script: Type .\Add_WindowsDefender_Exclusions.ps1 and press Enter. This will execute the script.
# - You will be prompted to enter your WSL distro (tested only on Ubuntu), username and IDE of choice

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Host "This script must be run as Administrator. Exiting."
    return
}

# Define folders to exclude, adjust if needed
$foldersToExclude = @(
    "C:\Program Files\Docker",
    "\\wsl$\NixOS",
    "\\wsl.localhost\NixOS",
    "\\wsl$\docker-desktop",
    "\\wsl.localhost\docker-desktop"
)

# Define file types to exclude, adjust if needed
$fileTypesToExclude = @(
    "vhd",
    "vhdx"
)

# Define processes to exclude, adjust if needed
$processesToExclude = @(
    "docker.exe",
    "com.docker.*.*",
    "Desktop Docker.exe",
    "wsl.exe",
    "wslhost.exe",
    "vmmemWSL"
)

# Add Firewall Rule for WSL
# For details please read official documentation:
# https://www.jetbrains.com/help/idea/how-to-use-wsl-development-environment-in-product.html#debugging_system_settings
Write-Host "Adding firewall rules for WSL. This step may take a few minutes..."
try {
    New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
    Get-NetFirewallProfile -Name Public | Get-NetFirewallRule | Where-Object DisplayName -ILike "$($selectedIDE)*" | Disable-NetFirewallRule
} catch {
    Write-Host "Error adding firewall rule: $_"
}

# Add folder exclusions
Write-Host "Adding folder exclusions..."
foreach ($folder in $foldersToExclude) {
    Add-MpPreference -ExclusionPath $folder
}

# Add file type exclusions
Write-Host "Adding file type exclusions..."
foreach ($fileType in $fileTypesToExclude) {
    Add-MpPreference -ExclusionExtension $fileType
}

# Add process exclusions
Write-Host "Adding process exclusions..."
foreach ($process in $processesToExclude) {
    Add-MpPreference -ExclusionProcess $process
}

Write-Host "Script execution completed."
