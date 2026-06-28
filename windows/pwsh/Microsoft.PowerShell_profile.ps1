Get-ChildItem -Path "$PSScriptRoot\Scripts" -Filter *.ps1 | ForEach-Object { . $_.FullName }

Invoke-Expression (&starship init powershell)
