/**
 * Define global virables
 */
user <- array( 100 , null );
db <- null;
response <- null;
/** Load debuging methods */
dofile("scripts/Kernel/Debug/DebugFucntions.nut");
/**
 * Load Langs
 */
dofile("scripts/Langs/pl.nut");
dofile("scripts/Langs/en.nut");

/**
 * Load Models
 */

dofile( "scripts/Models/UserModel.nut" );//do wyjebki
dofile( "scripts/Kernel/Models/ResponseModel.nut" );

/** LOAD RECIPE DATABASE **/

    //load database QueryBuilder
    dofile("scripts/Kernel/Database/QueryBuilderModel.nut");
    dofile("scripts/Kernel/Database/QueryBuilder.nut");

    //load Database Interfaces
    dofile("scripts/Kernel/Database/DatabaseInterface.nut");

    // load Database engines
    dofile("scripts/Kernel/Database/DatabaseEngineSelector.nut");
    dofile("scripts/Kernel/Database/MysqlEngine.nut");
    dofile("scripts/Kernel/Database/SqliteEngine.nut");

    //loda Database Controllers
    dofile("scripts/Kernel/Database/DatabaseEngineController.nut");

    //load helper
    dofile("scripts/Kernel/Database/QueryBuilderHelper.nut");

/** END OF LOAD DATABASE RECIPES **/


/**
 * Load Controllers
 */
dofile( "scripts/Controller/UserController.nut" ); //do wyjebki
