# Manually install pwsh. set default terminal app and default profile
# chris titus winutil
# glazeWm, windhawk
# docker, visualstudio
# nvidia driver manually instead of sdio
# Util function
function Write-Start {
    param($msg)
    Write-Host (">> " + $msg) -ForegroundColor Green
}

function Write-Done {
    Write-Host "Done" -ForegroundColor Blue;
    Write-Host
}

# Disable UAC - manually disabled for confirmation
# do this after remove "settings managed by org" or it will reset
$noPolicy = "Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0"
Start-Process -Wait powershell -Verb runas -ArgumentList $noPolicy

# Install Scoop
Write-Start -msg "Installing Scoop"
if (Get-Command scoop -ErrorAction SilentlyContinue) {
    Write-Warning "Scoop already installed"
}
else {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}
Write-Done

# Initialize Scoop
Write-Start -msg "Initializing Scoop"
scoop install 7zip git
scoop bucket add extras
scoop bucket add nerd-fonts
scoop update
Write-Done

# Initialize Scoop's packages
Write-Start -msg "Installing Scoop packages"
scoop install CascadiaMono-NF oh-my-posh
# scoop install firefox googlechrome # manually install browser for taskbar shortcut
scoop install fastfetch fd fzf gcc lazygit lua luarocks nvm ripgrep vcredist2022 z
scoop install vscode neovim
Write-Done

# Enable Virtualization
Write-Start -msg "Enable Virtualization"
Start-Process -Wait powershell -Verb runas -ArgumentList @"
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart;
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart;
    Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All;
    Enable-WindowsOptionalFeature -Online -FeatureName Containers -All;
"@
Write-Done

# Install WSL
Write-Start -msg "Installing Wsl"
if (-not (Get-Command wsl -ErrorAction SilentlyContinue)) {
    wsl --install
    wsl --update
    wsl --install --no-launch --web-download -d Ubuntu
}
else {
    Write-Warning "Wsl installed"
}
Write-Done

# Set nvim config environment variable
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "$env:UserProfile\.config", [System.EnvironmentVariableTarget]::User)