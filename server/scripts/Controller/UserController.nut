class User extends UserModel{
    Response=null;

    constructor(id){
        base.constructor();
        base.setPlayer(id);
    }

    function Authorize(){
        if(!this.Register){
           return this.getResponse("notRegistred");
        }
        else if(!this.Login() && this.Register){
            return this.getResponse("notLoggedIn");
        }

    }


}

