Function Reset-ADuserPassword {
[CmdletBinding()]
Param(
    [string[]]$UserName
)
$Password = Read-Host "Enter the password that you want to set for the users" -AsSecureString
foreach($User in $UserName) {
    try {
        Set-ADAccountPassword -Identity $User -Reset -NewPassword  $Password -EA Stop
        Write-Host "Password successfully changed for $user"
    } catch {
        Write-Warning "Failed to reset password for $user. $_"
    }
}
}
