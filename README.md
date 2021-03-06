## Set Execution Policy Instructions ##
1. Click Start
2. Type "Powershell" (without the quotes)
3. Click "Powershell" (do NOT select "Powershell ISE")

## Enter Command ##
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser

## When prompted with the following question, enter "A" (without the quotes)

Execution Policy Change
The execution policy helps protect you from scripts that you do not trust. Changing the ex
you to the security risks described in the about_Execution_Policies help topic at
http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"):

## Enter Command ##
Get-ExecutionPolicy -List

## If the above commands work properly, you should see the following ##
   
MachinePolicy       Undefined
   UserPolicy       Undefined
      Process       Undefined
  CurrentUser       Undefined
 LocalMachine    RemoteSigned
 
 
 ## Once this is finished, create SendEmail.ps1 script as shown in tutorial, drop it inside Group Policy ##
 
1. Right-Click Start
2. Select Run
3. Enter "gpedit.msc" (without the quotes)
4. Computer Configuration
5. Windows Settings
6. Scripts (Startup/Shutdown)
7. Startup
8. PowerShell Scripts
9. Add
10. Browse
11. Browse to your Desktop where you saved the file and find "SendEmail" and open it
12. OK
13. Click the dropdown box under "For this GPO, run scripts in the following order:"
14. Select "Run Windows PowerShell scripts first"
15. OK

## Let's Force this Policy to get applied, just in case ##
1. Right-Click Start
2. Click "Command Prompt (Admin)
3. Enter "gpupdate /force" (without the quotes)

## Let's change the Computer Name so the email shows you the proper name ##
1. Right-click Start
2. System
## Windows Server 2019 ##
3. Rename this PC
4. Enter Computer Name
5. Next
6. Choose to either "Restart Now" or "Restart Later"
## Windows Server 2016 ##
3. Change Settings
4. Change
5. Enter Computer name
6. Click OK

Reboot your server manually. If all goes well, you should receive an email with your new Computer Name, stating that your server was rebooted!

