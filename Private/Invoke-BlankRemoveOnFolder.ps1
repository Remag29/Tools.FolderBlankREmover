function Invoke-BlankRemoveOnFolder {
    param (
        [Parameter(Mandatory = $true, Position = 1)] [string] $FolderPath
    )

    $folderContent = Get-ChildItem -Path $FolderPath

    foreach ($item in $folderContent) {
        if ($item.Mode -eq "d-----") {
            # Its a folder
            Invoke-BlankRemoveOnFolder -FolderPath $item.FullName
            Write-Verbose "[Invoke-BlankRemoveOnFolder] - Search file on folder ""$($item.BaseName)"""
        }
        elseif ($item.Mode -eq "-a----") {
            # Its a file
            Invoke-BlankRemove -filePath $item.FullName
        }
        else {
            # Format not suported yet
            Write-Warning "[Invoke-BlankRemoveOnFolder] - Unknow file type detected for $item"
        }
    }
    
    $oldFolderName = $(Get-Item -Path $FolderPath).BaseName
    Rename-Item -Path $FolderPath -NewName $oldFolderName.replace(' ', '_') -ErrorAction SilentlyContinue
}