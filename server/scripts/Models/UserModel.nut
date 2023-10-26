class UserModel{
    Kills   = 0;
    Deaths  = 0;
    Score   = 0;
    Money   = 0;
    Bank    = 0;
    Level   = 0;
    player    = null;
    Translate = null;
    Lang = "pl";

    constructor(){
        this.ResponseModel  = ResponseModel();
        this.Translate      = this.ResponseModel.setLanguage(this.Lang);
    }

    Register    = false;
    Login       = false;
    AutoLogin   = false;

    function setPlayer(id){
        this.player = FindPlayer(id);
    }

    function setKills(value){
        this.Kills = value;
        return this.Kills;
    }

    function setDeaths(value){
        this.Deaths = value;
        return this.Deaths;
    }

    function setScore(value){
        this.Score = value
        this.player.Score = this.Score;
        return this.player.Score;
    }

    function setMoney(value){
        this.Money = value;
        this.player.Money = this.Money;
        return this.Money;
    }

    function setBank(value){
        this.Bank = value;
        return this.Bank;
    }

    function setLevel(value){
        this.Level = vaule
        return this.Level;
    }

    function Registred(){
        this.Register = true;
        return this.Register;
    }

    function Login(){
        this.Login = true;
        return this.Login;
    }

    function autoLogin(){
        this.AutoLogin = true;
        return this.AutoLogin;
    }

    /***
     * Translations
     */
    function getResponse(message,type="info"){
        switch(type){
            case "info" :
                return this.ResponseModel.info(this.getMessage(message));
                break;
            case "fail" :
                return this.ResponseModel.fail(this.TgetMessage(message));
                break;
        }
    }

    function getMessage(message){
        foreach(id,text in this.Translate){
    //            print("id: "+id+" text: "+ text + " search key: " + message);
            if(id == message){
                return text;
            }
        }
        return this.Translate.TRANSLATION_NOT_FOUND;
    }


}
function onScriptLoad(){
    ::print("User class was loaded successfully");
}