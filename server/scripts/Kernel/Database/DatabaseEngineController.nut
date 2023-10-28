class DatabaseEngineController {

    db = null;
    qb  = null;

    constructor(type){
        this.db =  DatabaseEngineSelector(type).engine;
    }

    function connect(name, address=" ", user=" ", password=" "){
        return this.db.connect(name,address,user,password);
    }

    function addColumn(column, parameters=""){
        return this.db.addColumn(column,parameters);
    }
    function getColumn(){
        return this.db.getColumn();
    }

    function addParam(param){
        return this.db.addParam(param);
    }
    function getParam(){
        return this.db.getParam();
    }

    function setTable(table){
        return this.db.setTable();
    }
    function getTable(){
        return this.db.getTable();
    }

    function table(table) {
        return this.db.table(table);
    }

    function where(...){
        if(vargv.len()>=2) {
            return this.db.where(vargv);
        }
    }

    function get(...){
        local cols=array(0);
        if(vargv.len()<1){
            cols.insert(0,vargv[0]);
            cols[0] = "*";
        }
        foreach(id, column in vargv){
            cols.append(column);
        }
        return this.db.get(cols);
    }


    function insert(columns,...){
        local values=array(0);
        foreach(id, value in vargv){
            values.insert(id,value);
        }
        return this.db.insert(columns,values);
    }

    function update() {
        return this.db.update(column,value);
    }
    function addColumnTo(table) {
        return this.db.addColumnTo(table);
    }
    function save(){
        return this.db.save();
    }

    function getQuery(){
        return this.db.getQuery();
    }

    function oneToMany(foreginKey, referencetable, referenceColumn) {
        return this.db.oneToMany(foreginKey, referencetable, referenceColumn);
    }

    function set(...){
        print("set data");
        local vals = array(0);
        local data = this.db.set(vargv);
        print(data);
    }
}

//DB <- {}
//function DB::connect(name, address=" ", user=" ", password=" ") {
//    return DatabaseEngineController.connect(name, address=" ", user=" ", password=" ");
//}
//function DB::driver(driver){
//
//}
