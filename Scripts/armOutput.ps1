$outputs = ConvertFrom-Json $env:resourceOutput

$names = ($outputs | GM -MemberType NoteProperty).Name

foreach ($key in $names){
    $value = $outputs.$key.value

    Write-Host "##vso[task.setvariable variable=$key;]$value"
}