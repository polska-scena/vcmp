class DatabaseEngineSelector{
    engine = null;

    constructor(engine){
        this.selectEngine(engine);
    }

    function selectEngine(engine){
        switch(engine){
            case "mysql":
                this.engine =  MysqlEngine();
                return(this.engine);
                break;
            case "sql":
                this.engine =  SqliteEngine();
                return(this.engine);
                break;
        }
    }
}