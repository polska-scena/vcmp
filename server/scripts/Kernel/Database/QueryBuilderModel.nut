class QueryBuilderModel{
    driver = "";
    table = "";
    autoicrament = "";
    primaryKey  = "";
    foregin     = "";
    references  = "";
    queryCommand= "";

    /**
     * @pram string command from your database language to give the autoincrement option.
     * for example in SQL
     * { "id INT IDENTITY(1,1) PRIMARY KEY" }
     * For Example in MYSQL:
     * { "AUTO_INCREMENT" }
     * @return string
     */
    function setAutoIncrament(ai){
        this.autoicrament = ai;
        return this.autoicrament;
    }

    /**
     * @return string
     */
    function getAutoIncrament(){
        return this.autoicrament;
    }

    /**
     * @param string pk The contents of the command for which the primary key option is to be added.
     * This is the syntax added at the very end of the Create Table command (part of the MYSQL language structure).
     * For example in SQL:
     * { "" }
     * For example in MYSQL:
     * { "PRIMARY KEY (id)" }
     */
    function setPrimaryKey(pk){
        this.primaryKey = pk;
        return this.primaryKey;
    }

    /**
     * @return string
     */
    function getPrimaryKey(){
        return this.primaryKey;
    }

    /**
     * @param string name The name of the table
     */
    function setTable(name){
        this.table = name;
        return this.table;
    }

    /**
     * @return string
     */
    function getTable(){
        return this.table;
    }

    /**
     * @param string name command to select or update table
     */
    function setQueryCommand(cmd){
        this.queryCommand = cmd;
        return this.queryCommand;
    }

    /**
     * @return string
     */
    function getQueryCommand(){
        return this.queryCommand;
    }

    /**
     * @param string foregin Name of the column to be added
     */
    function addForeginKey(foregin){
        return this.foregin = ", FOREIGN  KEY ("+foregin+")";
    }

    /**
     * @param table string Name of the refreneces table
     * @param key Name of Colum in reference table
     */
    function addReferences(table,key){
        this.references = "REFERENCES " + table +"("+key+")";
    }

    /**
     * Method used to create a table using the OneToMany relationship
     */
    function getOneToMany(){
        return this.foregin + " " + this.references;
    }
    
}