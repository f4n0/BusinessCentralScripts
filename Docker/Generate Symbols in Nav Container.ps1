$containerName = 'BC14-CU11-IT'
$credential = New-Object pscredential 'admin', (ConvertTo-SecureString -String 'Password123!' -AsPlainText -Force)

Generate-SymbolsInNavContainer -containerName $containerName -sqlCredential $credential