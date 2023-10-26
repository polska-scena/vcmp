/**
 * Define globals
 */
user <- array( 100 , null );
response <- null;

/**
 * Load Langs
 */
dofile("scripts/Langs/pl.nut");
dofile("scripts/Langs/en.nut");

/**
 * Load Models
 */
dofile( "scripts/Models/UserModel.nut" );
dofile( "scripts/Models/ResponseModel.nut" );

/**
 * Load Controllers
 */
dofile( "scripts/Controller/UserController.nut" );
