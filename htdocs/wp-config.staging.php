<?php

// Staging Environment
define('DB_NAME', 'staging');
define('DB_USER', 'staging');
define('DB_PASSWORD', 'staging');
define('DB_HOST', 'localhost');

define('WP_SITEURL', 'http://staging.lorenzogm.com');

// Staging will always want debug off and caching on
define( 'WP_DEBUG', false);
define( 'WP_CACHE', true);

?>
