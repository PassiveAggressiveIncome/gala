## Set Execution Policy Instructions ##
Click Start
Type "Powershell" (without the quotes)
Click "Powershell" (do NOT select "Powershell ISE")

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

        Scope ExecutionPolicy
        
        ----- ---------------
        
MachinePolicy       Undefined
   UserPolicy       Undefined
      Process       Undefined
  CurrentUser       Undefined
 LocalMachine    RemoteSigned
 
 
 ## Once this is finished, create SendEmail.ps1 script as shown in tutorial, drop it inside Group Policy ##
 
 Right-Click Start
 Select Run
 Enter "gpedit.msc" (without the quotes)
> Computer Configuration
> Windows Settings
> Scripts (Startup/Shutdown)
> Startup
> PowerShell Scripts
> Add
> Browse
> Browse to your Desktop where you saved the file and find "SendEmail" and open it
> OK
> Click the dropdown box under "For this GPO, run scripts in the following order:"
> Select "Run Windows PowerShell scripts first"
> OK

## Let's Force this Policy to get applied, just in case ##
Right-Click Start
Click "Command Prompt (Admin)
Enter "gpupdate /force" (without the quotes)

## Let's change the Computer Name so the email shows you the proper name ##
Right-click Start
> System
## Windows Server 2019 ##
> Rename this PC
> Enter Computer Name
> Next
> Choose to either "Restart Now" or "Restart Later"
## Windows Server 2016 ##
> Change Settings
> Change
> Enter Computer name
> Click OK

Reboot your server manually. If all goes well, you should receive an email with your new Computer Name, stating that your server was rebooted!

