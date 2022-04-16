Invoke-Expression (&starship init powershell)
$env:COMPOSE_DOCKER_CLI_BUILD = 1

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

New-Alias open ii
New-Alias v nvim.exe
