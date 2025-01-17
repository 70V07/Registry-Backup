#Source: http://stackoverflow.com/questions/7342597/how-do-you-comment-out-code-in-powershell
#Source: https://social.technet.microsoft.com/Forums/SECURITY/en-US/bf986cda-e3f0-4744-9a1a-b20ba71764a1/how-do-i-create-a-directory-in-powershell?forum=ITCG
$Title = ".:Backup My Registry - Developed by ComputerCrash0:."

Write-Host ""
Write-Host ".:Backup My Registry - Developed by ComputerCrash0:. but tweaked by TOVOT"
Write-Host ""
Write-Host "██████╗ ███████╗ ██████╗ ██╗███████╗████████╗██████╗ ██╗   ██╗"
Write-Host "██╔══██╗██╔════╝██╔════╝ ██║██╔════╝╚══██╔══╝██╔══██╗╚██╗ ██╔╝"
Write-Host "██████╔╝█████╗  ██║  ███╗██║███████╗   ██║   ██████╔╝ ╚████╔╝"
Write-Host "██╔══██╗██╔══╝  ██║   ██║██║╚════██║   ██║   ██╔══██╗  ╚██╔╝"
Write-Host "██║  ██║███████╗╚██████╔╝██║███████║   ██║   ██║  ██║   ██║"
Write-Host "╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝"
Write-Host "██████╗  █████╗  ██████╗██╗  ██╗██╗   ██╗██████╗"
Write-Host "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║   ██║██╔══██╗"
Write-Host "██████╔╝███████║██║     █████╔╝ ██║   ██║██████╔╝"
Write-Host "██╔══██╗██╔══██║██║     ██╔═██╗ ██║   ██║██╔═══╝"
Write-Host "██████╔╝██║  ██║╚██████╗██║  ██╗╚██████╔╝██║"
Write-Host "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝"
Write-Host ""

function Show-Menu
{
	param(
	[String]$Title = 'My Menu'
	)
	
	#Write-Host " === $Title === "
	
	Write-Host "1 - Backup apply"
	
	Write-Host "2 - Backup restore"
	
	Write-Host "3 - Exit the script"
	Write-Host ""
}
do
{
	Show-Menu
	$input = Read-Host "Make a selection"
	switch ($input)
	{
	'1' {
		Write-Host "Backing up Local Machine"
		REG EXPORT HKLM HKLM_Backup.reg 
		Write-Host "Local Machine registy backup complete"
		
		Write-Host "Backing up Classes Root"
		REG EXPORT HKCR HKCR_Backup.reg
		Write-Host "Classes Root registy backup complete"
		
		Write-Host "Backing up Current User"
		REG EXPORT HKCU HKCU_Backup.reg
		Write-Host "Current User registry backup complete"
		
		Write-Host "Backing up Users"
		REG EXPORT HKU HKU_Backup.reg
		Write-Host "Users registry backup complete"
		
		Write-Host "Backing up Current Config"
		REG EXPORT HKCC HKCC_Backup.reg
		Write-Host "Current Config registry backup complete"
		
		$sourceDir = "$env:USERPROFILE\Desktop"
		$destDir = "$env:USERPROFILE\Desktop"
		$files = Get-ChildItem -Path $sourceDir -Filter "*.reg"
#		Move-Item -Path $sourceDir\*.reg -Destination $destDir
		
	} '2' {
		
		Write-Host "Restoring Local Machine"
		REG IMPORT $destDir\HKLM_Backup.reg
		Write-Host "Local Machine restored"
		
                Write-Host "Restoring Classes Root"
                REG IMPORT $destDir\HKCR_Backup.reg
                Write-Host "Classes Root restored"
		
                Write-Host "Restoring Current User"
                REG IMPORT $destDir\HKCU_Backup.reg
                Write-Host "Current User restored"
		
                Write-Host "Restoring Users"
                REG IMPORT $destDir\HKU_Backup.reg
                Write-Host "Users restored"
		
                Write-Host "Restoring Current Config"
                REG IMPORT $destDir\HKCC_Backup.reg
                Write-Host "current Config restored"
		
	} '3' {
	
		Exit
		}
	}
}
until ($input -eq 'q')
