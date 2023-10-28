class MysqlEngine{
    db = null;

    function connect(name, address, user, password){
        this.db = mysql_connect( address, user, password, name);
        return this.db;
    }

    function disconnect(){
        if(mysql_ping(this.db) == 1){
            mysql_close(this.db);
            this.db = null;
            return this.db;
        }
    }

    function createTable(table, colType, colName, colParams){

    }
}