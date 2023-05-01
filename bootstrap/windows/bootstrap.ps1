# Check list
# - Drivers
# - Sophia script https://github.com/farag2/Sophia-Script-for-Windows
# - Sophia app https://github.com/Sophia-Community/SophiApp
# - WSL
# - excludeWSL.ps1
# - speedUp.ps1
# - Winget
# - Scoop
# - dotfiles
# - thisiswin11

# WSL
# https://docs.microsoft.com/en-gb/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package
wsl --install -d Ubuntu

# Winget
winget install --source winget --id AltSnap.AltSnap
winget install --source winget --id Discord.Discord
winget install --source winget --id Docker.DockerDesktop
winget install --source winget --id Microsoft.WindowsTerminal.Preview
winget install --source winget --id Valve.Steam
winget install --source winget --id SumatraPDF.SumatraPDF
winget install --source winget --id VideoLAN.VLC
winget install --source winget --id WinSCP.WinSCP
winget install --source winget --id RandyRants.SharpKeys
winget install --source winget --id Giorgiotani.Peazip
winget install --source winget --id Microsoft.PowerToys
winget install --source winget --id Nextcloud.NextcloudDesktop
winget install --source winget --id wez.wezterm
winget install --source winget --id Google.Chrome
winget install --source winget --id Mozilla.Firefox
# winget install --source winget --id valinet.ExplorerPatcher
winget install --source winget --id WireGuard.WireGuard

# winget install --source msstore --id 9NBLGGH516XP # EarTrumpet
winget install --source msstore 9NFNG39387K0 # Yubico Authenticator

# winget install --source winget --id Postbox.Postbox

# Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop install 7zip aria2 curl dark git neovim starship sudo
scoop bucket add nerd-fonts
scoop bucket add extras
sudo scoop install --global JetBrainsMono-NF
scoop install hwinfo hwmonitor thisiswin11 wumgr
