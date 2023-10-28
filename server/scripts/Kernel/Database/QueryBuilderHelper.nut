class QueryBuilderHelper{
    /**
     * @param array columns
     */
    function parseColumns(columns){
        print(columns.len()<=1);
        local cols = "";
        if(columns.len()<=1) {
            return cols = "*"
        }
        foreach (id, name in columns) {
            print(name);
            if (id < columns.len() - 1) {
                cols += name + ", ";
            } else cols += name;
        }
        return cols;
    }

    function decodeSymbol(symbol){
        switch(symbol){
            case "=": case "<": case ">": case "<>": case "LIKE": case "<=": case ">=":
                return symbol;
                break;
            default:
                return false;
                break;
        }
    }
}