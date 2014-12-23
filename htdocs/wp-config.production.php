<?php

// Production Environment
define('DB_NAME', 'production');
define('DB_USER', 'production');
define('DB_PASSWORD', 'production');
define('DB_HOST', 'localhost');

define('WP_SITEURL', 'http://elegantdev.com');

// Production will always want debug off and caching on
define( 'WP_DEBUG', false);
define( 'WP_CACHE', true);

?>
