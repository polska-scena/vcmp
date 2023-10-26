# POLSKA SCENA SK FRAMEWORK

## INSTALATION FRAMEWORK
Extract the files in the scripts directory and then add the following line to the onServerStart method

```bash
dofile( "scripts/Kernel/Configuration/Global.nut" );
```

## DATABASE
### 1. Connect to database
* 1.1. Define driver <br>
  To connect to the database, declare the variable 'db' as follows.
  ```bash
  db<-DatabaseEngineController("YOUR DB DRIVER");
  ```
  You have a choice of two database drivers, you can enter "sql" or "mysql", enter one of these values.
  Jeżeli chcesz utworzyć własny driver to:
  //tutaj jakies info o tym kiedys.
* 1.2. Connect to Database<br>
  Hook "db" jest teraz reprezentowany jako obiekt. Każde kolejne działanie będzie się odbywało na zasadzie OOP.
  W celu uzyskania połączenia wykonaj następujące polecenie
  ```bash
  db.connect("db_name"); //SQL.
  //or
  db.connect("db_name", "db_ip_address", "db_user_name", "db_user_password");//MYSQL
  ```
  Edit the following variables according to your database data.
  * db_name >> Name of the database.
  * db_ip_address >> IP address of the database server, not required in SQL type. 
  * db_user_name >> database user name, not required in SQL type. 
  * db_user_password >> password of the database user, not required in SQL type.
### 2. Create Table
* 2.1 Create Table If Not Exists.<br>
Creating a new database starts with defining its name. The syntax is as follows
    ```bash
        db.table("your_table_name");
    ```
    The columns and their data types must then be defined. If the data type is not defined, the script will automatically give it a VARCHAR(255) value. 
<br>NOTE: You do not need to create an 'ID' table, it will be created automatically with the autoincrament parameter.
<br>The final step in creating a table is to use the save() method.   
  ```bash
      db.save();
  ```
Done, you have created a table!

* 2.2 Create a table with a one-to-many relationship<br>
  If you want to create a database with a relation, you must have at least one table already created in your database!
  The structure itself is not too different compared to the create method itself, just add the following method before save.
  The final step in creating a table is to use the save() method.
  ```bash
      db.oneToMany("current_column", "target_table", "target_column");
  ```
  Example of command structure:<br>FOREIGN KEY(current_column) REFERENCES target_table(target_column)
  In summary, a relational table is created using the standard table creation (Section 2.1), but before the save() method, the oneToMany method must be used with appropriately defined parameters.
### 3. Alter Table
* Currently AlterTable only supports the ability to add a new column to an existing table. 
<br>To add a new table, use the following syntax:
    ```bash
        db.addColumnTo("table");
    ```
  This method is responsible for defining the table to which a column is to be added. 
Further steps are similar to the createTable method, i.e. we add the column using addColumn(); and finally the save method should be called.
<br>Full syntax example for the addColumnTo method.
  ```bash
        db.addColumnTo("user");
        db.addColumn("email","VARCHAR(255) NOT NULL");
        db.addColumn("uniqueId", "TEXT");
        db.save();
    ```
