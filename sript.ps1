function Create-DirectoryIfNotExists($path) {
    if (!(Test-Path $path)) {
        New-Item -Path $path -ItemType Directory
    }
}

Create-DirectoryIfNotExists "W:\dockervol\noderedvol"