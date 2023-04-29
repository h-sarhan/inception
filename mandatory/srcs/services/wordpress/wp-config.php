<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', '' );

/** Database password */
define( 'DB_PASSWORD', '' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '9r7E1LQ*Z D?Zxh}mI-sT1xc58)UAbUYOHOq JT^K^15iz`9@(jxHfJ<]F,;#)vg' );
define( 'SECURE_AUTH_KEY',   '5,)<Q0qNX<Jd@BXYQ%j7&`/R.)Nmii!AmTC&u@.y*Ck=^f%>|x^O2~o)6;KKzp4v' );
define( 'LOGGED_IN_KEY',     '8m(9F[ec_9_8)r{WFa1EaoGi%]{Nlu%!T@-Z8y>xbhL%3ux<B#NxEk+5_>6Q{BG;' );
define( 'NONCE_KEY',         'aI@|awwxX(oC6% rMV+C+>#v68AN6bjYxd.tx_a&;2,u=9G3|_pT!<wf]9|;3N#4' );
define( 'AUTH_SALT',         '9D.xEF.D~+OELin~Qp)>[Ah%?v4J#fOH>Id!zeYiD.^O 8(}#t$HDF, -AL822`E' );
define( 'SECURE_AUTH_SALT',  'aF{N9;8[!<{w`(9K.^ G_EJD^Lc` AC0)r`QN-:3H}>h/pwR`.iD%9reSH(lMtqU' );
define( 'LOGGED_IN_SALT',    '9>oBJP|VtLRKdE:=LOZ&#U=%#Nj(8!&yz3mv;u:B.d8oW}_c>`MIpDX1Zc/#`Z.u' );
define( 'NONCE_SALT',        '2Whz/Ze/5u2RuB&df:L<^,Rmsgy8b#@xq~U<X3j:WxXW}o!v^lV5E.z{Gg`Nk3Hz' );
define( 'WP_CACHE_KEY_SALT', 'hsarhan' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', 'true' );
}

define( 'WP_DEBUG_LOG', 'true' );
define( 'SCRIPT_DEBUG', true );
define( 'SAVEQUERIES', true );
define( 'WP_CACHE', 'true' );
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', '6379' );
define( 'WP_DEBUG_DISPLAY', 'true' );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
