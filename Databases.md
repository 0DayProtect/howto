Databases
---------

#Connect to database GUI in Linux
hexorbase

#Connect to Microsoft SQL database
/usr/bin/mssqlclient.py -p 1433 admin:m\@x.x.x.x

#Connect to Microsoft SQL database
tsql -S x.x.x.x -p 1337 -U admin
password

#List Database structure and tables
1> select * from sys.tables;
24> go

1> SELECT name FROM master.dbo.sysdatabases
2> go

1> Select * from databasename.INFORMATION_SCHEMA.TABLES
2> go

1> Select * from databasename.INFORMATION_SCHEMA.COLUMNS
2> go

1> USE databasename
2> go

1> SELECT * FROM tablename_whats_inside
2> go

