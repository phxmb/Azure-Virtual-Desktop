get-childitem $env:OneDrive -Force -File -Recurse |
where Attributes -eq 'Archive, ReparsePoint' |
foreach {
    attrib.exe $_.fullname +U -P /s
}
