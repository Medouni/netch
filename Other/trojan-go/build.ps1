Set-Location (Split-Path $MyInvocation.MyCommand.Path -Parent)

git clone https://github.com/p4gefau1t/trojan-go -b 'v0.10.6' src
if ( -Not $? ) {
    exit $lastExitCode
}
Set-Location src

$Env:CGO_ENABLED='0'
$Env:GOROOT_FINAL='/usr'

$Env:GOOS='windows'
$Env:GOARCH='amd64'
go build -a -trimpath -asmflags '-s -w' -ldflags '-s -w' -tags 'full' -o '..\..\release\trojan-go.exe'
exit $lastExitCode