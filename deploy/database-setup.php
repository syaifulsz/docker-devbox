<?php
$servername = "db";
$username = "root";
$password = "root";

// Create connection
$conn = new mysqli($servername, $username, $password);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Create database
$conn->query( 'DROP DATABASE mjiimms' );
$conn->query( 'CREATE DATABASE mjiimms' );

echo PHP_EOL . "FRESH DATABASE CREATED!" . PHP_EOL;

$conn->close();
?>
