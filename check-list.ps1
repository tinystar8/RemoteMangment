$ErrorActionPreference = 'Stop'
$merged = New-Object System.Collections.Generic.List[string]
$remote = '38.64.59.18'
foreach ($item in @($remote)) { [void]$merged.Add([string]$item) }
[void]$merged.Add('203.0.113.25')
Write-Output $merged.GetType().FullName
Write-Output ($merged -join ', ')
