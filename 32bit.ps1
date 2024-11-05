# Check if Administrator account exists
if (net user Administrator) {
    Rename-LocalUser -Name 'Administrator' -NewName 'Xguest'}
# Check if Guest account exists
if (net user Guest) {
    Rename-LocalUser -Name 'Guest' -NewName 'Xadmin'}
# Check if the audit file exists before restoring audit policies
if (Test-Path .\audit.csv) {
    auditpol /restore /file:.\audit.csv
} else {
    Write-Host "Audit file 'audit.csv' not found"}
# Check if the security template file exists before importing security policies
if (Test-Path .\GptTmpl.inf) {
    secedit /import /cfg:.\GptTmpl.inf
} else {
    Write-Host "Security template file 'GptTmpl.inf' not found"}
