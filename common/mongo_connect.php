<?php
// common/mongo_connect.php

require __DIR__ . '/../vendor/autoload.php';   // Composer autoloader
use MongoDB\Client;

// 1) Connect to local MongoDB server
$client  = new Client("mongodb://127.0.0.1:27017");

// 2) Select (or create) the cs306_hw3 database
$db      = $client->selectDatabase('cs306_hw3');

// 3) Select (or create) the tickets collection
$tickets = $db->selectCollection('tickets');
