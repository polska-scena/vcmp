class QueryBuilder extends QueryBuilderModel{
    command = "";
    value   = "";
    params  = array(0);
    columns = array(0);


    constructor(cmd){
        this.command = cmd;
        this.clearData();
    }


    /**
     * @param string name Name of the column to be added
     */
    function addColumn(name){
        return this.columns.append(name);
    }

    /**
     * @param string param Name of the column parameter such as INT, VARCHAR
     */
    function addParam(param){
        return this.params.append(param);
    }

    /**
     * @pram mixed value;
     */
    function setValue(value){
        this.value = value;
        return this.value;
    }

    /**
     * Selection of the appropriate method for execution
     */
    function getQuery(){
        switch(this.command){
            case "createTable":
                return this.getQueryForCreateTable();
                break;
            case "addColumnTo":
                return this.getQueryForAddColumn();
                break;
            case "select":
                return this.getQueryForSelect();
                break;
            case "insert":
                return this.getQueryForInsert();
        }
    }

    /**
     * Executed after the save() method; it is used to clear the model.
     */
    function clearData(){
        this.columns = array(0);
        this.params  = array(0);
        return true;
    }

    /**
     * @return This method returns column names with parameters like "name TEXT".
     */
    function buildQueryCreationQuery(){
        local columns = "";
        foreach(nameId,name in this.columns) {
            foreach (paramId, param in this.params) {
                local syntax =  name + " " + param;
                if(paramId==nameId){
                    if(nameId < this.columns.len()-1 && this.columns.len()>1) {
                        columns += this.command=="addColumnTo" ? "ADD COLUMN " + syntax + ", " : syntax + ", ";
                    }
                    else  columns += this.command=="addColumnTo" ? "ADD COLUMN " + syntax : syntax;
                }
            }
        }
        return columns;
    }

    /**
     * @return create table query
     */
    function getQueryForCreateTable(){
        local columns = buildQueryCreationQuery();
        local query = "CREATE TABLE IF NOT EXISTS "+base.getTable()+" ( "+base.getAutoIncrament()+", "+columns+" "+base.getPrimaryKey()+" "+base.getOneToMany()+")";
        return query;
    }

    /**
     * @return alter table query
     */
    function getQueryForAddColumn(){
        local columns = buildQueryCreationQuery();
        local query = "ALTER TABLE "+base.getTable()+ " " + columns + " ";
        return query;
    }

    function getQueryForInsert(){
          
    }

    /**
     * return select query
     */
    function getQueryForSelect(){
        local columns = QueryBuilderHelper.parseColumns(this.columns);
        local query = "SELECT ( " + columns + " ) FROM " + base.getTable() + this.getQueryCommand();
        return query;
    }

    /**
     * @param array params
     */
    function setSelectParameters(params){
        local symbol;
        if(params.len()==3){
            symbol = QueryBuilderHelper.decodeSymbol(params[1]);
        }
        if(!empty(symbol)){
            return this.queryCommand =  " WHERE " + params[0] + " " + symbol + " " + params[2];
        }
        return this.queryCommand = " WHERE " + params[0] + " = " + params[1];
    }

    function setUpdateParameters(params){
        this.queryCommand = "SET";
        foreach(id, param in params){
            if(params.len()>id+1){
                this.queryCommand +=  " " + params[id] + " = " + params[id+1]+", ";
            }
            this.queryCommand += " " +params[id] + " = " + params[id+1];
        }
        return this.queryCommand;
    }
}