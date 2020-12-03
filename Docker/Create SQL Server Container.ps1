docker run --name "sqlexpress" -d -p 1433:1433 -v C:/_SQLContainer/:C:/_SQLContainer/ -e sa_password="Password123!" -e ACCEPT_EULA=Y microsoft/mssql-server-windows-express

