class ResponseModel {
    status  = false;
    message = "";

    function fail(message){
        this.status  = false;
        return this.message =  "[#38FF46][[#FF7575]INFO[#39FF46]][#E6FF00] " + message;
    }

    function info(message){
        this.status  = true;
        return this.message =  "[#38FF46][[#FF7575]INFO[#39FF46]][#E6FF00] " + message;
    }

    function log(message){
        this.status = false;
        this.message = "ERROR >> " + message;
        print(this.message);
        return this.message;
    }

    function setLanguage(lang){
        switch(lang){
            case "pl":
                return pl;
                break;
            default :
                return en;
                break;
        }
    }

}
