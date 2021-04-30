function Invoke-Math
{
    [CmdletBinding(PositionalBinding=$false)]
    param(
    [Parameter(ValueFromPipelineByPropertyName,ValueFromRemainingArguments)]
    [PSObject[]]
    $ArgumentList,


    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $MethodName
    )
    process {
        if ($MyInvocation.InvocationName -ne $MyInvocation.MyCommand.Name) {
            $MethodName = $MyInvocation.InvocationName -replace '\W' -replace '^Math.'
        }
        if (-not $MethodName) { Write-Error "Must call with alias or provide -MethodName"; return }

        if (-not ([Math]::$MethodName)) { Write-Error "[Math]::$MethodName not found"; return }
        if ([Math]::$MethodName -is [Management.Automation.PSMethod]) {
            [Math]::$MethodName.Invoke($ArgumentList)
        } else {
            [Math]::$MethodName
        }
    }
}

Set-Alias Pi  Invoke-Math
Set-Alias E   Invoke-Math
Set-Alias abs Invoke-Math

[Math] | Get-Member -Static | Set-Alias -Name {$_.Name } -Value Invoke-Math
