function Format-BlankOnFolderName {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)] [string] $Path
    )

   $Path = Resolve-Path -Path $Path -ErrorAction Stop

   Invoke-BlankRemoveOnFolder -FolderPath $Path
}