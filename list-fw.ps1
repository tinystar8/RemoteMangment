$rules = Get-NetFirewallRule -ErrorAction SilentlyContinue | Where-Object {
    $_.DisplayName -like '*RDP*' -or $_.DisplayName -like '*49651*' -or $_.DisplayName -like '*Only Me*'
}
foreach ($rule in $rules) {
    $port = $rule | Get-NetFirewallPortFilter
    $addr = $rule | Get-NetFirewallAddressFilter
    Write-Output ('NAME=' + $rule.DisplayName)
    Write-Output ('ID=' + $rule.Name)
    Write-Output ('DIR=' + $rule.Direction + ' ACTION=' + $rule.Action + ' ENABLED=' + $rule.Enabled)
    Write-Output ('PROTO=' + $port.Protocol + ' LOCALPORT=' + (@($port.LocalPort) -join ','))
    Write-Output ('REMOTE=' + (@($addr.RemoteAddress) -join ','))
    Write-Output '---'
}
