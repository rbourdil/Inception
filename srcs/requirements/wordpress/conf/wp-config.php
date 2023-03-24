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
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'qwerty' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

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

define('AUTH_KEY',         'h:3]7]EeWY46NPng][3-V2vOOA|</77$=.49{`{rZqm8!G}pPUE4Y*GIgh+:_r&h');
define('SECURE_AUTH_KEY',  '$aZ!4JTIF||PfL:<TJ)Ib/)KZ?P7f</1p,I+-GL(nsp&b7=1%Dv]o++tAKE+b)f7');
define('LOGGED_IN_KEY',    'b e6rCpP%is5-sEg(F2QXc,iUh7vIEr*|-A}Ism74O&V|^*}cnRK{bL^3Q90aD;m');
define('NONCE_KEY',        '6*8]^LMDp5f_1e#!Tlx9ZTAeqq?!7b8:0/$>-D+?`[k 036Mxh+J?,43n(;ZqbgO');
define('AUTH_SALT',        'GO>9fD|42MX-QcEaX-Q#DpE)5&ZfQ|FXji9@1p=b>-qafu:KE8%yaCCRYWXr&hdY');
define('SECURE_AUTH_SALT', ']jKFrO$x:#Z5&=Ub|SD?^==2-2=>x~>a&?!Mdrk=O*##qx@+Jv.Wb@oPK+*F;FSR');
define('LOGGED_IN_SALT',   '@?I*BBV-?0]PoG[*Oi+HIip&:ka-Xc;1_|u+B[>;0oxd0;cEIQ-4uT^i1lx[(>:Z');
define('NONCE_SALT',       '#H16c5a(aIav{}is.roO%*;PFVZ~ Nf0;_|%fNbFg2k?qvS)Cq+mpb*Xqf(SC+,&');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
