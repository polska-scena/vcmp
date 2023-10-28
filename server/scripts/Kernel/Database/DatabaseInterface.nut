class DatabaseInterface{
/** columns*/
    function addColumn(column,parameters){}
    function getColumn(){}
/** params*/
    function addParam(param){}
    function getParam(){}
/** table */
    function setTable(table){}
    function getTable(){}
/** methods */
    function table(table){}
    function update(table){}
    function addColumnTo(table){}
    function save(){}
    function get(...){}
    function getQuery(){}
/** Relation */
    function oneToMany(foreginKey, referencetable, referenceColumn){}
}