//
function onServerStart(){
    dofile( "scripts/Kernel/Configuration/Global.nut" );
    response = ResponseModel();
    db<-DatabaseEngineController("sql");
//    mysql<-DatabaseEngineController("mysql");
//    sql<-DatabaseEngineController("sql");

//    sql.connect();

    db.connect("dupa");
    db.table("user");
    db.addColumn("name");
    db.addColumn("uid","INT(32)");
    db.addColumn("uid2");
    db.save();
    db.addColumnTo("user");
    db.addColumn("zapomnilem");
    db.save();
    db.table("stats");
    db.addColumn("player");
    db.addColumn("money","FLOAT");
    db.addColumn("bank","FLOAT");
    db.oneToMany("player", "user", "id");
    db.save();
    db.addColumnTo("user");
    db.addColumn("stats");
    db.save();
    db.table("user");
    db.where("user","<>","malina");
    db.get("id","name","lang");

    db.table("user");
    db.set("player", "dupa");
    db.set("password","pass");
    db.where("player","mailna");


//
//    db.table();
//    db.update();
//    db.where();
//    db.sva();
//    db.update();
    //insert:
//    db.table("dupa");
//                //string                        vagrgv
//    db.insert("id, name, uid, pass, email", player.ID, player.Name, player.UniquieID, text[0], text[0]);
//    ///update
//    db.table("user");

//    db.where("user","malina");
//    db.save(); db.update();


//    db.table("");
//    db.connect("dupa");
//    db.createTable("user");
//    db.setColumn("uid");
//    db.setType("varchar(255)");
//    db.setColumn("uid2");
//    db.setType("varchar(255)");
//    db.setColumn("name");
//    db.setType("varchar(255)");



}

function onServerStop(){
}

function onScriptLoad(){

}

function onScriptUnload(){
}

// =========================================== P L A Y E R   E V E N T S ==============================================

function onPlayerJoin( player ){

    user[player.ID] = User(player.ID);
    MessagePlayer(user[player.ID].Authorize(),player);
    Announce("~p~" + user[player.ID].getMessage("signUp") , player, 6);
    user[player.ID].setScore(10);
}

function onPlayerPart( player, reason ){
}

function onPlayerRequestClass( player, classID, team, skin ){
    return 1;
}

function onPlayerRequestSpawn( player ){
    if(!user[player.ID].Register){
        MessagePlayer(user[player.ID].getResponse("notRegistred"),player);
        Announce("~p~"  + user[player.ID].getMessage("signUp") , player, 6);
        return 0;
    }
    return 1;
}

function onPlayerSpawn( player ){
    player.Pos = Vector(405.954, -459.039,10.1126);
    user[player.ID].setKills(20);
}

function onPlayerDeath( player, reason ){
}

function onPlayerKill( player, killer, reason, bodypart ){
}

function onPlayerTeamKill( player, killer, reason, bodypart ){
}

function onPlayerChat( player, text ){
    print( player.Name + ": " + text );
    return 1;
}

function onPlayerCommand( player, cmd, text ){
    if(cmd == "test")
    {
        CreateCheckpoint(player, 0, false, Vector(405.954, -459.039,10.1126), ARGB(255, 255, 0, 0), 1);
        return 1;
    }
    if(!user[player.ID].Register){
        switch(cmd){
            case "register":
                if(text){
                    return user[player.ID].Register = true;
                }
                return MessagePlayer(user[player.ID].getResponse("emptyPassword"),player);
        }
    }
    return 1;
}

function onPlayerPM( player, playerTo, message ){
    return 1;
}

function onPlayerBeginTyping( player ){
}

function onPlayerEndTyping( player ){
}

/*
function onLoginAttempt( player ){
	return 1;
}
*/

function onNameChangeable( player ){
}

function onPlayerSpectate( player, target ){
}

function onPlayerCrashDump( player, crash ){
}

function onPlayerMove( player, lastX, lastY, lastZ, newX, newY, newZ ){
}

function onPlayerHealthChange( player, lastHP, newHP ){
}

function onPlayerArmourChange( player, lastArmour, newArmour ){
}

function onPlayerWeaponChange( player, oldWep, newWep ){
}

function onPlayerAwayChange( player, status ){
}

function onPlayerNameChange( player, oldName, newName ){
}

function onPlayerActionChange( player, oldAction, newAction ){
}

function onPlayerStateChange( player, oldState, newState ){
}

function onPlayerOnFireChange( player, IsOnFireNow ){
}

function onPlayerCrouchChange( player, IsCrouchingNow ){
}

function onPlayerGameKeysChange( player, oldKeys, newKeys ){
}

function onPlayerUpdate( player, update ){
}

function onClientScriptData( player ){
}

// ========================================== V E H I C L E   E V E N T S =============================================

function onPlayerEnteringVehicle( player, vehicle, door ){
    return 1;
}

function onPlayerEnterVehicle( player, vehicle, door ){
}

function onPlayerExitVehicle( player, vehicle ){
}

function onVehicleExplode( vehicle ){
}

function onVehicleRespawn( vehicle ){
}

function onVehicleHealthChange( vehicle, oldHP, newHP ){
}

function onVehicleMove( vehicle, lastX, lastY, lastZ, newX, newY, newZ ){
}

// =========================================== P I C K U P   E V E N T S ==============================================

function onPickupClaimPicked( player, pickup ){
    return 1;
}

function onPickupPickedUp( player, pickup ){
}

function onPickupRespawn( pickup ){
}

// ========================================== O B J E C T   E V E N T S ==============================================

function onObjectShot( object, player, weapon ){
}

function onObjectBump( object, player ){
}

// ====================================== C H E C K P O I N T   E V E N T S ==========================================

function onCheckpointEntered( player, checkpoint ){
}

function onCheckpointExited( player, checkpoint ){
}

// =========================================== B I N D   E V E N T S =================================================

function onKeyDown( player, key ){
}

function onKeyUp( player, key ){
}

// ================================== E N D   OF   O F F I C I A L   E V E N T S ======================================