#------------------------
#
# httpseverywhere.ps1
#
#------------------------

#------------------------
# Enable TLS 1.2 in IIS7
#------------------------
$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "DisabledByDefault" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "DisabledByDefault" -Type Dword -Value 0

#------------------------
# Disable Old Versions Of SSL and TLS
#------------------------
$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Client"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

#------------------------
# Disable known-weak ciphers 
#------------------------
$BaseKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $env:COMPUTERNAME)
$key='SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128'
$valname="Enabled"
$valdata="0"
$BaseKey.CreateSubKey($key)
$SubKey = $BaseKey.OpenSubKey($key,$true)
$SubKey.SetValue($valname, $valdata, [Microsoft.Win32.RegistryValueKind]::DWORD)

$BaseKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $env:COMPUTERNAME)
$key='SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128'
$valname="Enabled"
$valdata="0"
$BaseKey.CreateSubKey($key)
$SubKey = $BaseKey.OpenSubKey($key,$true)
$SubKey.SetValue($valname, $valdata, [Microsoft.Win32.RegistryValueKind]::DWORD)

$BaseKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $env:COMPUTERNAME)
$key='SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128'
$valname="Enabled"
$valdata="0"
$BaseKey.CreateSubKey($key)
$SubKey = $BaseKey.OpenSubKey($key,$true)
$SubKey.SetValue($valname, $valdata, [Microsoft.Win32.RegistryValueKind]::DWORD)

$BaseKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $env:COMPUTERNAME)
$key='SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128'
$valname="Enabled"
$valdata="0"
$BaseKey.CreateSubKey($key)
$SubKey = $BaseKey.OpenSubKey($key,$true)
$SubKey.SetValue($valname, $valdata, [Microsoft.Win32.RegistryValueKind]::DWORD)

$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168"
if (-Not(Test-Path "$key")) {
	New-Item -Path $key -Force
}
Set-ItemProperty -Path $key -Name "Enabled" -Type Dword -Value 0

$BaseKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $env:COMPUTERNAME)
$key='SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168'
$valname="Enabled"
$valdata="0"
$BaseKey.CreateSubKey($key)
$SubKey = $BaseKey.OpenSubKey($key,$true)
$SubKey.SetValue($valname, $valdata, [Microsoft.Win32.RegistryValueKind]::DWORD)
