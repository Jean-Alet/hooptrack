<?php
$host = 'sql206.infinityfree.com';
$dbname   = 'if0_40935009_basketball';
$user = 'if0_40935009';
$pass = 'Xlt2oYkV9shoJ'; 

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}
?>