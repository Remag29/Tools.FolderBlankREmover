
function Invoke-BlankRemove {
    param (
        [Parameter(Mandatory = $true, Position = 0)] [string] $filePath
    )
    
    # get file name
    $file = Get-Item -Path $filePath
    $oldName = $file.BaseName

    # rename file with replacing ' ' by '_'
    Rename-Item -Path $filePath -NewName $($oldName.replace(' ','_'))
}