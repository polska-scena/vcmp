class SqliteEngine{
    db          = null;
    qb          = null;

    function connect(name,address, user, password){
        this.db = ::ConnectSQL(name + ".sqlite" );
        return this.db;
    }

    function disconnect(){
        ::DisconnectSQL(this.db);
        this.db = null;
        return this.db;
    }

    /**
     * @param string table
     */
    function table(table){
        this.qb = QueryBuilder("createTable");
        this.qb.setAutoIncrament("id INT IDENTITY(1,1) PRIMARY KEY");
        this.qb.setPrimaryKey("");
        this.qb.setTable(table);
        return this.qb;
    }

    /**
     * @param string table
     */
    function addColumnTo(columns){
        this.qb = QueryBuilder("addColumnTo");
        this.qb.setTable(table);
        return this.qb;
    }

    /**
     * @param array columns
     */
    function update(data){
        this.qb = QueryBuilder("update");
        this.qb.setTable(table);
        return this.qb;
    }

    /**
     * @param array columns
     */
    function get(columns){
        local from = this.qb.getTable();
        local where= this.qb.getQueryCommand();
        this.qb = QueryBuilder("select");
        this.qb.columns = columns;
        this.qb.setQueryCommand(where);
        this.qb.setTable(from);
        return this.save();
    }

    /**
     * @param string name
     * @param string parameters
     */
    function addColumn(name, parameters){
        if(empty(parameters)){
            parameters = "VARCHAR(255)";
        }
        this.qb.addParam(parameters);
        return this.qb.addColumn(name);
    }

    /**
     * @param string foreginKey
     * @param string referenceTable
     * @param string referenceColumn
     */
    function oneToMany(foreginKey, referenceTable, referenceColumn){
        this.qb.addForeginKey(foreginKey);
        this.qb.addReferences(referenceTable,referenceColumn);
        return true;
    }

    /**
     * @param mixed target
     */
    function find(target){
        return this.qb.setValue(target);
    }

    /**
     * @param array params
     */
    function where(params){
        print(this.qb.setSelectParameters(params));
        return true;
    }

    /**
     * @param array params
     */
    function set(params){
        print(this.qb.setUpdateParameters(params));
        return true;
    }


    function save(){
//        try {
            local query = this.qb.getQuery();
            ::QuerySQL(this.db, query);
            this.qb = null;
            print(query);
//        }catch(e) response.log(" SQLite save method "+ e);
    }

}
//this.qb = QueryBuilder("select");
//        if(typeof(column) == "array"){
//            this.qb.columns = column;
//        }
//        else{
//            this.addColumn(column);
//        }
//        return this.save();