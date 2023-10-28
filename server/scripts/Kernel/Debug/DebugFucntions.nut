function empty(param){
    if(typeof(param) == "string" && param == ""){
        return true;
    }
    else if(typeof(param) == "array" && param.len()<=0){
        return true;
    }
    else if(!param){
        return true;
    }
    return false;
}

