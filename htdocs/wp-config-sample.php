<?php

/** Define Environments */
$environments = array(
    'staging' => 'staging.',
    'local' => '.local',
);

/** Get Server name */
$server_name = $_SERVER['SERVER_NAME'];
 
foreach($environments AS $key => $env) {
    if(strstr($server_name, $env)) {
        define('ENVIRONMENT', $key);
        break;
    }
}
 
/** If no environment is set default to production */
if(!defined('ENVIRONMENT')) define('ENVIRONMENT', 'production');

/** Include environment specific configuration. */
require_once(dirname( __FILE__ ) . '/wp-config.' . ENVIRONMENT . '.php');
