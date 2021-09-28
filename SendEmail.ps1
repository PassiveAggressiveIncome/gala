# If one exists, this will look for the last event with EventID "1074" in the System log.
$EventInfo = Get-WinEvent -FilterHashtable @{logname='System'; id=1074} -MaxEvents 1
$EventInfo | ForEach-Object {
$rv = New-Object PSObject | Select-Object Date, User, Action, Process, Reason, ReasonCode, Comment
$rv.Date = $_.TimeCreated
$rv.User = $_.Properties[6].Value
$rv.Process = $_.Properties[0].Value
$rv.Action = $_.Properties[4].Value
$rv.Reason = $_.Properties[2].Value
$rv.ReasonCode = $_.Properties[3].Value
$rv.Comment = $_.Properties[5].Value
$rv
}
 
 
# Set your customized email settings below
$From = "CUSTOM-EMAIL-HERE@gmail.com"
$To = "YOUR EMAIL ADDRESS HERE"
#$Cc = ""
$Subject = $env:COMPUTERNAME + " has been Rebooted !!"
#My Email body contains custom properties that will differ from your system.
$Body = "$env:COMPUTERNAME has rebooted. Go in immediately and restart your GALA Node software. This reboot took place at $($rv.Date) by $($rv.User) `r`nReason: $($rv.Reason) ($($rv.ReasonCode)) `r`nComment:$($rv.Comment) "
$SMTPServer = "gmail-smtp-in.l.google.com"
$SMTPPort = "25"
 
 
# Using the above settings and variables, this will send the email
Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer
