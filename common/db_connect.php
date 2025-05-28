<?php
// common/db_connect.php — connects via mysqli_init() over TCP

ini_set('display_errors', 1);
error_reporting(E_ALL);

$host     = '127.0.0.1';
$port     = 3306;
$user     = 'root';
$password = '';       // or your root password, if any
$dbname   = 'movie_database';

$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);

if (!@$mysqli->real_connect($host, $user, $password, $dbname, $port)) {
    die("DB connection failed (#"
        . mysqli_connect_errno() . "): "
        . mysqli_connect_error()
    );
}
