# Check list
# - Drivers
# - Sophia app https://github.com/Sophia-Community/SophiApp
# - WSL
# - excludeWSL.ps1
# - Winget
# - Scoop
# - dotfiles

# WSL
wsl --update
wsl --install -d Ubuntu

# Winget
winget install --source winget --id Alex313031.Thorium.AVX2
winget install --source winget --id Ablaze.Floorp
winget install --source winget --id AltSnap.AltSnap
winget install --source winget --id Betterbird.Betterbird
winget install --source winget --id Discord.Discord
winget install --source winget --id Docker.DockerDesktop
winget install --source winget --id Giorgiotani.Peazip
winget install --source winget --id Google.Chrome
winget install --source winget --id Microsoft.PowerToys
winget install --source winget --id Mozilla.Firefox
winget install --source winget --id Nextcloud.NextcloudDesktop
winget install --source winget --id RandyRants.SharpKeys
winget install --source winget --id RedHat.Podman-Desktop
winget install --source winget --id SomePythonThings.WingetUIStore
winget install --source winget --id SumatraPDF.SumatraPDF
winget install --source winget --id Valve.Steam
winget install --source winget --id VideoLAN.VLC
winget install --source winget --id voidtools.Everything
winget install --source winget --id WinSCP.WinSCP
winget install --source winget --id WireGuard.WireGuard
winget install --source winget --id wez.wezterm
winget install --source winget --id Wireguard.Wireguard

# Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop install 7zip aria2 curl dark git neovim sudo win32yank
scoop bucket add nerd-fonts
scoop bucket add extras
sudo scoop install --global JetBrainsMono-NF
scoop install hwinfo wumgr
