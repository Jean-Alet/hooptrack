<?php
$host = 'sql206.infinityfree.com';
$dbname   = 'if0_40935009_basketball';
$user = 'if0_40935009';
$pass = 'Xlt2oYkV9shoJ'; 

try {
    $linkpdo = new PDO("mysql:host=localhost;dbname=basketball;charset=utf8", 'root', '');
    $linkpdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}
?>