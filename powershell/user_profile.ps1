[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

import-module posh-git
import-module terminal-icons
Import-Module PSFzf

oh-my-posh --init --shell pwsh --config "$env:UserProfile\.config\powershell\takuya.omp.json" | Invoke-Expression

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

set-alias grep findstr

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
