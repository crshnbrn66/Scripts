#new to powershell - start here 
#run script from
#set-executionPolicy default -Scope CurrentUser
cls
cd "~\OneDrive\new-2shellScripts"
.\write-hello.ps1
pause
set-executionpolicy remotesigned -scope Currentuser
pause
.\write-hello.ps1
pause
get-Help set-executionpolicy 
pause
Get-command 
#shows all the commands that are aviable to the session that you are in
pause
get-command *drive*
pause
help get-psdrive
pause
get-psdrive
#this will show you all the drives that are presently on the machine
#all of these drives have some type of provider whereby we can use that provider to list out the members of that provider
pause
new-psdrive -Name PS -PSProvider FileSystem -Root C:\Users\thom\OneDrive\new-2shellScripts
pause
cd ps:
pause
$pwd
pause 
cd Hklm:
pause
dir HKLM:\software\Microsoft\Windows\CurrentVersion\uninstall
pause
get-process
#as you can see this shows you all the running processes on my machine
help about_objects -ShowWindow
pause 
get-process | select-object -first 1
pause
$a = get-process | select-object -first 1
pause
$a | get-member
pause
# i like to use a module from lee hicks which makes it much easier to understand objects in powershell
# the powershell module is powershell cookbook and the command is show-object
show-object -InputObject $a
pause
$a | show-object
pause
$a[0].StartInfo.Environment
pause
#who needs calculator when you have powershell below are some samples of using powershell as your calculator
#http://www.madwithpowershell.com/2013/10/math-in-powershell.html
2+2 #it's still 4
4*8 # it's stil 32 
[math]::pi #its still 3.14159265358979
[math]::pow( 2, 3 ) #8
