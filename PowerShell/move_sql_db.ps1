#User DB

<#Move from C:\ to E:\#>
Move-Item -Path "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\AdventureWorks2017.mdf" -Destination "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\Data\AdventureWorks2017.mdf"
Move-Item -Path "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\AdventureWorks2017_log.ldf" -Destination "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\Data\AdventureWorks2017_log.ldf"

<#Move from E:\ to C:\#>
Move-Item -Path "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\Data\AdventureWorks2017.mdf" -Destination "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\AdventureWorks2017.mdf"
Move-Item -Path "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\Data\AdventureWorks2017_log.ldf" -Destination "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\AdventureWorks2017_log.ldf"

#System DBs

Move-Item -Path "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\DATA\model.mdf" -Destination "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\modeldb.mdf"
Move-Item -Path "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\DATA\modellog.ldf" -Destination "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\modellog.ldf"

Move-Item -Path "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\DATA\MSDBData.mdf" -Destination "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\MSDBData.mdf"
Move-Item -Path "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\DATA\MSDBLog.ldf" -Destination "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\MSDBLog.ldf"

Move-Item -Path "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\DATA\master.mdf" -Destination "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\master.mdf"
Move-Item -Path "C:\Program Files\Microsoft SQL Server\MSSQL15.NAMEDMSSQLSERVER\MSSQL\DATA\mastlog.ldf" -Destination "E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\mastlog.ldf"
