class AuthenticationModel{
//Auth functioncs
    Player      = null;
    Register    = false;
    Login       = false;
    Autologind  = false;


    constructor(model){
        this.Player = model;
    }

    function isRegistred(){
        return this.Register == true ? this.Register : false;
    }
}
