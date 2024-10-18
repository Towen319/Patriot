#renaming user accounts
if (Get-LocalUser -name Administrator)
  {Rename-LocalUser -name Administrator -newname Xguest}
if (Get-LocalUser -name Guest)
  {Rename-LocalUser -name Guest -newname Xadmin}
#Set Audit Policies
auditpol /restore /file:.\audit.csv
#security policies
secedit /import /cfg:.\GptTmpl.inf
